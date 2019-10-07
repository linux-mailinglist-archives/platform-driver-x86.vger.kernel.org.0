Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 026B5CEAA4
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Oct 2019 19:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbfJGRaE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Oct 2019 13:30:04 -0400
Received: from mga01.intel.com ([192.55.52.88]:16822 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729146AbfJGRaE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Oct 2019 13:30:04 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 10:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,268,1566889200"; 
   d="scan'208";a="344795159"
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by orsmga004.jf.intel.com with ESMTP; 07 Oct 2019 10:30:01 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     andriy.shevchenko@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        prarit@redhat.com,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 1/3] tools/power/x86/intel-speed-select: Base-freq feature auto mode
Date:   Mon,  7 Oct 2019 10:29:57 -0700
Message-Id: <20191007172959.25912-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191007172959.25912-1-srinivas.pandruvada@linux.intel.com>
References: <20191007172959.25912-1-srinivas.pandruvada@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Introduce --auto|-a option to base-freq enable feature, so that it
does in one step for users who are OK by setting all cores with higher
base frequency to be set in CLOS 0 and remaining in CLOS 3. This option
also sets corresponding clos.min to CLOS 0 and CLOS3. In this way, users
don't have to take multiple steps to enable base-freq feature. For users
who want more fine grain control, they can always use core-power feature
to set custom CLOS configuration and assignment.

Also adjust cpufreq/scaling_min_freq for higher and lower priority cores.

For example user can use:
intel-speed-select base-freq enable --auto

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      | 232 +++++++++++++++++-
 1 file changed, 223 insertions(+), 9 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 21fcfe621d3a..82502a38446e 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -39,6 +39,7 @@ static unsigned long long fact_trl;
 static int out_format_json;
 static int cmd_help;
 static int force_online_offline;
+static int auto_mode;
 
 /* clos related */
 static int current_clos = -1;
@@ -855,23 +856,227 @@ static void dump_pbf_config(void)
 	isst_ctdp_display_information_end(outf);
 }
 
+static int set_clos_param(int cpu, int clos, int epp, int wt, int min, int max)
+{
+	struct isst_clos_config clos_config;
+	int ret;
+
+	ret = isst_pm_get_clos(cpu, clos, &clos_config);
+	if (ret) {
+		perror("isst_pm_get_clos");
+		return ret;
+	}
+	clos_config.clos_min = min;
+	clos_config.clos_max = max;
+	clos_config.epp = epp;
+	clos_config.clos_prop_prio = wt;
+	ret = isst_set_clos(cpu, clos, &clos_config);
+	if (ret) {
+		perror("isst_pm_set_clos");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int set_cpufreq_cpuinfo_scaling_min(int cpu, int max)
+{
+	char buffer[128], min_freq[16];
+	int fd, ret, len;
+
+	if (!CPU_ISSET_S(cpu, present_cpumask_size, present_cpumask))
+		return -1;
+
+	if (max)
+		snprintf(buffer, sizeof(buffer),
+			 "/sys/devices/system/cpu/cpu%d/cpufreq/cpuinfo_max_freq", cpu);
+	else
+		snprintf(buffer, sizeof(buffer),
+			 "/sys/devices/system/cpu/cpu%d/cpufreq/cpuinfo_min_freq", cpu);
+
+	fd = open(buffer, O_RDONLY);
+	if (fd < 0)
+		return fd;
+
+	len = read(fd, min_freq, sizeof(min_freq));
+	close(fd);
+
+	if (len < 0)
+		return len;
+
+	snprintf(buffer, sizeof(buffer),
+		 "/sys/devices/system/cpu/cpu%d/cpufreq/scaling_min_freq", cpu);
+
+	fd = open(buffer, O_WRONLY);
+	if (fd < 0)
+		return fd;
+
+	len = strlen(min_freq);
+	ret = write(fd, min_freq, len);
+	if (ret == -1) {
+		close(fd);
+		return ret;
+	}
+	close(fd);
+
+	return 0;
+}
+
+static void set_scaling_min_to_cpuinfo_max(int cpu)
+{
+	int i, pkg_id, die_id;
+
+	pkg_id = get_physical_package_id(cpu);
+	die_id = get_physical_die_id(cpu);
+	for (i = 0; i < get_topo_max_cpus(); ++i) {
+		if (pkg_id != get_physical_package_id(i) ||
+		    die_id != get_physical_die_id(i))
+			continue;
+
+		set_cpufreq_cpuinfo_scaling_min(i, 1);
+	}
+}
+
+static void set_scaling_min_to_cpuinfo_min(int cpu)
+{
+	int i, pkg_id, die_id;
+
+	pkg_id = get_physical_package_id(cpu);
+	die_id = get_physical_die_id(cpu);
+	for (i = 0; i < get_topo_max_cpus(); ++i) {
+		if (pkg_id != get_physical_package_id(i) ||
+		    die_id != get_physical_die_id(i))
+			continue;
+
+		set_cpufreq_cpuinfo_scaling_min(i, 0);
+	}
+}
+
+static int set_core_priority_and_min(int cpu, int mask_size,
+				     cpu_set_t *cpu_mask, int min_high,
+				     int min_low)
+{
+	int pkg_id, die_id, ret, i;
+
+	if (!CPU_COUNT_S(mask_size, cpu_mask))
+		return -1;
+
+	ret = set_clos_param(cpu, 0, 0, 0, min_high, 0xff);
+	if (ret)
+		return ret;
+
+	ret = set_clos_param(cpu, 1, 15, 0, min_low, 0xff);
+	if (ret)
+		return ret;
+
+	ret = set_clos_param(cpu, 2, 15, 0, min_low, 0xff);
+	if (ret)
+		return ret;
+
+	ret = set_clos_param(cpu, 3, 15, 0, min_low, 0xff);
+	if (ret)
+		return ret;
+
+	pkg_id = get_physical_package_id(cpu);
+	die_id = get_physical_die_id(cpu);
+	for (i = 0; i < get_topo_max_cpus(); ++i) {
+		int clos;
+
+		if (pkg_id != get_physical_package_id(i) ||
+		    die_id != get_physical_die_id(i))
+			continue;
+
+		if (CPU_ISSET_S(i, mask_size, cpu_mask))
+			clos = 0;
+		else
+			clos = 3;
+
+		debug_printf("Associate cpu: %d clos: %d\n", i, clos);
+		ret = isst_clos_associate(i, clos);
+		if (ret) {
+			perror("isst_clos_associate");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int set_pbf_core_power(int cpu)
+{
+	struct isst_pbf_info pbf_info;
+	struct isst_pkg_ctdp pkg_dev;
+	int ret;
+
+	ret = isst_get_ctdp_levels(cpu, &pkg_dev);
+	if (ret) {
+		perror("isst_get_ctdp_levels");
+		return ret;
+	}
+	debug_printf("Current_level: %d\n", pkg_dev.current_level);
+
+	ret = isst_get_pbf_info(cpu, pkg_dev.current_level, &pbf_info);
+	if (ret) {
+		perror("isst_get_pbf_info");
+		return ret;
+	}
+	debug_printf("p1_high: %d p1_low: %d\n", pbf_info.p1_high,
+		     pbf_info.p1_low);
+
+	ret = set_core_priority_and_min(cpu, pbf_info.core_cpumask_size,
+					pbf_info.core_cpumask,
+					pbf_info.p1_high, pbf_info.p1_low);
+	if (ret) {
+		perror("set_core_priority_and_min");
+		return ret;
+	}
+
+	ret = isst_pm_qos_config(cpu, 1, 1);
+	if (ret) {
+		perror("isst_pm_qos_config");
+		return ret;
+	}
+
+	return 0;
+}
+
 static void set_pbf_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 			    void *arg4)
 {
 	int ret;
 	int status = *(int *)arg4;
 
+	if (auto_mode) {
+		if (status) {
+			ret = set_pbf_core_power(cpu);
+			if (ret)
+				goto disp_result;
+		} else {
+			isst_pm_qos_config(cpu, 0, 0);
+		}
+	}
+
 	ret = isst_set_pbf_fact_status(cpu, 1, status);
 	if (ret) {
 		perror("isst_set_pbf");
+		if (auto_mode)
+			isst_pm_qos_config(cpu, 0, 0);
 	} else {
-		if (status)
-			isst_display_result(cpu, outf, "base-freq", "enable",
-					    ret);
-		else
-			isst_display_result(cpu, outf, "base-freq", "disable",
-					    ret);
+		if (auto_mode) {
+			if (status)
+				set_scaling_min_to_cpuinfo_max(cpu);
+			else
+				set_scaling_min_to_cpuinfo_min(cpu);
+		}
 	}
+
+disp_result:
+	if (status)
+		isst_display_result(cpu, outf, "base-freq", "enable",
+				    ret);
+	else
+		isst_display_result(cpu, outf, "base-freq", "disable",
+				    ret);
 }
 
 static void set_pbf_enable(void)
@@ -880,7 +1085,10 @@ static void set_pbf_enable(void)
 
 	if (cmd_help) {
 		fprintf(stderr,
-			"Enable Intel Speed Select Technology base frequency feature [No command arguments are required]\n");
+			"Enable Intel Speed Select Technology base frequency feature\n");
+		fprintf(stderr,
+			"\tOptional Arguments: -a|--auto : Use priority of cores to set core-power associations\n");
+
 		exit(0);
 	}
 
@@ -900,7 +1108,9 @@ static void set_pbf_disable(void)
 
 	if (cmd_help) {
 		fprintf(stderr,
-			"Disable Intel Speed Select Technology base frequency feature [No command arguments are required]\n");
+			"Disable Intel Speed Select Technology base frequency feature\n");
+		fprintf(stderr,
+			"\tOptional Arguments: -a|--auto : Also disable core-power associations\n");
 		exit(0);
 	}
 
@@ -1420,15 +1630,19 @@ static void parse_cmd_args(int argc, int start, char **argv)
 		{ "max", required_argument, 0, 'm' },
 		{ "priority", required_argument, 0, 'p' },
 		{ "weight", required_argument, 0, 'w' },
+		{ "auto", no_argument, 0, 'a' },
 		{ 0, 0, 0, 0 }
 	};
 
 	option_index = start;
 
 	optind = start + 1;
-	while ((opt = getopt_long(argc, argv, "b:l:t:c:d:e:n:m:p:w:ho",
+	while ((opt = getopt_long(argc, argv, "b:l:t:c:d:e:n:m:p:w:hoa",
 				  long_options, &option_index)) != -1) {
 		switch (opt) {
+		case 'a':
+			auto_mode = 1;
+			break;
 		case 'b':
 			fact_bucket = atoi(optarg);
 			break;
-- 
2.17.2

