Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8A7217B1B8
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Mar 2020 23:47:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgCEWqE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Mar 2020 17:46:04 -0500
Received: from mga18.intel.com ([134.134.136.126]:5039 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727152AbgCEWp5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Mar 2020 17:45:57 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Mar 2020 14:45:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,519,1574150400"; 
   d="scan'208";a="234674675"
Received: from minkleyx-mobl1.amr.corp.intel.com (HELO spandruv-mobl.amr.corp.intel.com) ([10.252.207.66])
  by fmsmga008.fm.intel.com with ESMTP; 05 Mar 2020 14:45:56 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, prarit@redhat.com,
        linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 26/27] tools/power/x86/intel-speed-select: Avoid duplicate Package strings for json
Date:   Thu,  5 Mar 2020 14:45:37 -0800
Message-Id: <20200305224538.490864-27-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
References: <20200305224538.490864-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For platforms where multiple packages/die, this makes "Package-" key
duplicate. To make unique, add die and cpu id to key name.

So "Package-0" key name will change to "Package-0-die-x:cpu-x".

For example:
$sudo ./intel-speed-select -f json  perf-profile info
Intel(R) Speed Select Technology
Executing on CPU model:106[0x6a]
{
  "package-0:die-0:cpu-0": {
    "perf-profile-level-0": {
      "cpu-count": "32",
      "enable-cpu-count": "32",
...
...
 "package-1:die-0:cpu-16": {

    "perf-profile-level-0": {
      "cpu-count": "32",
      "enable-cpu-count": "32",
      "enable-cpu-mask": "ffff0000,ffff0000",
...
...

For non json format, there is no change. Here when print_package_info()
is called, it will return the level to print for other information.
This level is used formatting. Also in some function duplicate code
was there to print package,die and CPU information. Replace all that
code with a call to print_package_info().

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-display.c     | 172 +++++++++---------
 1 file changed, 83 insertions(+), 89 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index 4f4c42147a90..51dbaa5f02ec 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -158,10 +158,17 @@ static void format_and_print(FILE *outf, int level, char *header, char *value)
 	last_level = level;
 }
 
-static void print_package_info(int cpu, FILE *outf)
+static int print_package_info(int cpu, FILE *outf)
 {
 	char header[256];
 
+	if (out_format_is_json()) {
+		snprintf(header, sizeof(header), "package-%d:die-%d:cpu-%d",
+			 get_physical_package_id(cpu), get_physical_die_id(cpu),
+			 cpu);
+		format_and_print(outf, 1, header, NULL);
+		return 1;
+	}
 	snprintf(header, sizeof(header), "package-%d",
 		 get_physical_package_id(cpu));
 	format_and_print(outf, 1, header, NULL);
@@ -169,6 +176,8 @@ static void print_package_info(int cpu, FILE *outf)
 	format_and_print(outf, 2, header, NULL);
 	snprintf(header, sizeof(header), "cpu-%d", cpu);
 	format_and_print(outf, 3, header, NULL);
+
+	return 3;
 }
 
 static void _isst_pbf_display_information(int cpu, FILE *outf, int level,
@@ -331,10 +340,11 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 {
 	char header[256];
 	char value[256];
-	int i, base_level = 1;
+	static int level;
+	int i;
 
 	if (pkg_dev->processed)
-		print_package_info(cpu, outf);
+		level = print_package_info(cpu, outf);
 
 	for (i = 0; i <= pkg_dev->levels; ++i) {
 		struct isst_pkg_ctdp_level_info *ctdp_level;
@@ -346,20 +356,20 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 
 		snprintf(header, sizeof(header), "perf-profile-level-%d",
 			 ctdp_level->level);
-		format_and_print(outf, base_level + 3, header, NULL);
+		format_and_print(outf, level + 1, header, NULL);
 
 		snprintf(header, sizeof(header), "cpu-count");
 		j = get_cpu_count(get_physical_die_id(cpu),
 				  get_physical_die_id(cpu));
 		snprintf(value, sizeof(value), "%d", j);
-		format_and_print(outf, base_level + 4, header, value);
+		format_and_print(outf, level + 2, header, value);
 
 		j = CPU_COUNT_S(ctdp_level->core_cpumask_size,
 				ctdp_level->core_cpumask);
 		if (j) {
 			snprintf(header, sizeof(header), "enable-cpu-count");
 			snprintf(value, sizeof(value), "%d", j);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		if (ctdp_level->core_cpumask_size) {
@@ -367,59 +377,59 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 			printcpumask(sizeof(value), value,
 				     ctdp_level->core_cpumask_size,
 				     ctdp_level->core_cpumask);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 
 			snprintf(header, sizeof(header), "enable-cpu-list");
 			printcpulist(sizeof(value), value,
 				     ctdp_level->core_cpumask_size,
 				     ctdp_level->core_cpumask);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		snprintf(header, sizeof(header), "thermal-design-power-ratio");
 		snprintf(value, sizeof(value), "%d", ctdp_level->tdp_ratio);
-		format_and_print(outf, base_level + 4, header, value);
+		format_and_print(outf, level + 2, header, value);
 
 		snprintf(header, sizeof(header), "base-frequency(MHz)");
 		if (!ctdp_level->sse_p1)
 			ctdp_level->sse_p1 = ctdp_level->tdp_ratio;
 		snprintf(value, sizeof(value), "%d",
 			  ctdp_level->sse_p1 * DISP_FREQ_MULTIPLIER);
-		format_and_print(outf, base_level + 4, header, value);
+		format_and_print(outf, level + 2, header, value);
 
 		if (ctdp_level->avx2_p1) {
 			snprintf(header, sizeof(header), "base-frequency-avx2(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 ctdp_level->avx2_p1 * DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		if (ctdp_level->avx512_p1) {
 			snprintf(header, sizeof(header), "base-frequency-avx512(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 ctdp_level->avx512_p1 * DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		if (ctdp_level->uncore_p1) {
 			snprintf(header, sizeof(header), "uncore-frequency-min(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 ctdp_level->uncore_p1 * DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		if (ctdp_level->uncore_p0) {
 			snprintf(header, sizeof(header), "uncore-frequency-max(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 ctdp_level->uncore_p0 * DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		if (ctdp_level->mem_freq) {
 			snprintf(header, sizeof(header), "mem-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 ctdp_level->mem_freq * DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		snprintf(header, sizeof(header),
@@ -431,7 +441,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 				snprintf(value, sizeof(value), "disabled");
 		} else
 			snprintf(value, sizeof(value), "unsupported");
-		format_and_print(outf, base_level + 4, header, value);
+		format_and_print(outf, level + 2, header, value);
 
 		snprintf(header, sizeof(header),
 			 "speed-select-base-freq");
@@ -442,7 +452,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 				snprintf(value, sizeof(value), "disabled");
 		} else
 			snprintf(value, sizeof(value), "unsupported");
-		format_and_print(outf, base_level + 4, header, value);
+		format_and_print(outf, level + 2, header, value);
 
 		snprintf(header, sizeof(header),
 			 "speed-select-core-power");
@@ -453,89 +463,89 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 				snprintf(value, sizeof(value), "disabled");
 		} else
 			snprintf(value, sizeof(value), "unsupported");
-		format_and_print(outf, base_level + 4, header, value);
+		format_and_print(outf, level + 2, header, value);
 
 		if (is_clx_n_platform()) {
 			if (ctdp_level->pbf_support)
 				_isst_pbf_display_information(cpu, outf,
 							      tdp_level,
 							  &ctdp_level->pbf_info,
-							      base_level + 4);
+							      level + 1);
 			continue;
 		}
 
 		if (ctdp_level->pkg_tdp) {
 			snprintf(header, sizeof(header), "thermal-design-power(W)");
 			snprintf(value, sizeof(value), "%d", ctdp_level->pkg_tdp);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		if (ctdp_level->t_proc_hot) {
 			snprintf(header, sizeof(header), "tjunction-max(C)");
 			snprintf(value, sizeof(value), "%d", ctdp_level->t_proc_hot);
-			format_and_print(outf, base_level + 4, header, value);
+			format_and_print(outf, level + 2, header, value);
 		}
 
 		snprintf(header, sizeof(header), "turbo-ratio-limits-sse");
-		format_and_print(outf, base_level + 4, header, NULL);
+		format_and_print(outf, level + 2, header, NULL);
 		for (j = 0; j < 8; ++j) {
 			snprintf(header, sizeof(header), "bucket-%d", j);
-			format_and_print(outf, base_level + 5, header, NULL);
+			format_and_print(outf, level + 3, header, NULL);
 
 			snprintf(header, sizeof(header), "core-count");
 			snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
-			format_and_print(outf, base_level + 6, header, value);
+			format_and_print(outf, level + 4, header, value);
 
 			snprintf(header, sizeof(header),
 				"max-turbo-frequency(MHz)");
 			snprintf(value, sizeof(value), "%d",
 				 ctdp_level->trl_sse_active_cores[j] *
 				  DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 6, header, value);
+			format_and_print(outf, level + 4, header, value);
 		}
 
 		if (ctdp_level->trl_avx_active_cores[0]) {
 			snprintf(header, sizeof(header), "turbo-ratio-limits-avx2");
-			format_and_print(outf, base_level + 4, header, NULL);
+			format_and_print(outf, level + 2, header, NULL);
 			for (j = 0; j < 8; ++j) {
 				snprintf(header, sizeof(header), "bucket-%d", j);
-				format_and_print(outf, base_level + 5, header, NULL);
+				format_and_print(outf, level + 3, header, NULL);
 
 				snprintf(header, sizeof(header), "core-count");
 				snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
-				format_and_print(outf, base_level + 6, header, value);
+				format_and_print(outf, level + 4, header, value);
 
 				snprintf(header, sizeof(header), "max-turbo-frequency(MHz)");
 				snprintf(value, sizeof(value), "%d", ctdp_level->trl_avx_active_cores[j] * DISP_FREQ_MULTIPLIER);
-				format_and_print(outf, base_level + 6, header, value);
+				format_and_print(outf, level + 4, header, value);
 			}
 		}
 
 		if (ctdp_level->trl_avx_512_active_cores[0]) {
 			snprintf(header, sizeof(header), "turbo-ratio-limits-avx512");
-			format_and_print(outf, base_level + 4, header, NULL);
+			format_and_print(outf, level + 2, header, NULL);
 			for (j = 0; j < 8; ++j) {
 				snprintf(header, sizeof(header), "bucket-%d", j);
-				format_and_print(outf, base_level + 5, header, NULL);
+				format_and_print(outf, level + 3, header, NULL);
 
 				snprintf(header, sizeof(header), "core-count");
 				snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
-				format_and_print(outf, base_level + 6, header, value);
+				format_and_print(outf, level + 4, header, value);
 
 				snprintf(header, sizeof(header), "max-turbo-frequency(MHz)");
 				snprintf(value, sizeof(value), "%d", ctdp_level->trl_avx_512_active_cores[j] * DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 6, header, value);
+				format_and_print(outf, level + 4, header, value);
 			}
 		}
 
 		if (ctdp_level->pbf_support)
 			_isst_pbf_display_information(cpu, outf, i,
 						      &ctdp_level->pbf_info,
-						      base_level + 4);
+						      level + 2);
 		if (ctdp_level->fact_support)
 			_isst_fact_display_information(cpu, outf, i, 0xff, 0xff,
 						       &ctdp_level->fact_info,
-						       base_level + 4);
+						       level + 2);
 	}
 
 	format_and_print(outf, 1, NULL, NULL);
@@ -558,8 +568,10 @@ void isst_ctdp_display_information_end(FILE *outf)
 void isst_pbf_display_information(int cpu, FILE *outf, int level,
 				  struct isst_pbf_info *pbf_info)
 {
-	print_package_info(cpu, outf);
-	_isst_pbf_display_information(cpu, outf, level, pbf_info, 4);
+	int _level;
+
+	_level = print_package_info(cpu, outf);
+	_isst_pbf_display_information(cpu, outf, level, pbf_info, _level + 1);
 	format_and_print(outf, 1, NULL, NULL);
 }
 
@@ -567,9 +579,11 @@ void isst_fact_display_information(int cpu, FILE *outf, int level,
 				   int fact_bucket, int fact_avx,
 				   struct isst_fact_info *fact_info)
 {
-	print_package_info(cpu, outf);
+	int _level;
+
+	_level = print_package_info(cpu, outf);
 	_isst_fact_display_information(cpu, outf, level, fact_bucket, fact_avx,
-				       fact_info, 4);
+				       fact_info, _level + 1);
 	format_and_print(outf, 1, NULL, NULL);
 }
 
@@ -578,46 +592,41 @@ void isst_clos_display_information(int cpu, FILE *outf, int clos,
 {
 	char header[256];
 	char value[256];
+	int level;
 
-	snprintf(header, sizeof(header), "package-%d",
-		 get_physical_package_id(cpu));
-	format_and_print(outf, 1, header, NULL);
-	snprintf(header, sizeof(header), "die-%d", get_physical_die_id(cpu));
-	format_and_print(outf, 2, header, NULL);
-	snprintf(header, sizeof(header), "cpu-%d", cpu);
-	format_and_print(outf, 3, header, NULL);
+	level = print_package_info(cpu, outf);
 
 	snprintf(header, sizeof(header), "core-power");
-	format_and_print(outf, 4, header, NULL);
+	format_and_print(outf, level + 1, header, NULL);
 
 	snprintf(header, sizeof(header), "clos");
 	snprintf(value, sizeof(value), "%d", clos);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "epp");
 	snprintf(value, sizeof(value), "%d", clos_config->epp);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "clos-proportional-priority");
 	snprintf(value, sizeof(value), "%d", clos_config->clos_prop_prio);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "clos-min");
 	snprintf(value, sizeof(value), "%d MHz", clos_config->clos_min * DISP_FREQ_MULTIPLIER);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "clos-max");
 	if (clos_config->clos_max == 0xff)
 		snprintf(value, sizeof(value), "Max Turbo frequency");
 	else
 		snprintf(value, sizeof(value), "%d MHz", clos_config->clos_max * DISP_FREQ_MULTIPLIER);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "clos-desired");
 	snprintf(value, sizeof(value), "%d MHz", clos_config->clos_desired * DISP_FREQ_MULTIPLIER);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
-	format_and_print(outf, 1, NULL, NULL);
+	format_and_print(outf, level, NULL, NULL);
 }
 
 void isst_clos_display_clos_information(int cpu, FILE *outf,
@@ -626,70 +635,60 @@ void isst_clos_display_clos_information(int cpu, FILE *outf,
 {
 	char header[256];
 	char value[256];
+	int level;
 
-	snprintf(header, sizeof(header), "package-%d",
-		 get_physical_package_id(cpu));
-	format_and_print(outf, 1, header, NULL);
-	snprintf(header, sizeof(header), "die-%d", get_physical_die_id(cpu));
-	format_and_print(outf, 2, header, NULL);
-	snprintf(header, sizeof(header), "cpu-%d", cpu);
-	format_and_print(outf, 3, header, NULL);
+	level = print_package_info(cpu, outf);
 
 	snprintf(header, sizeof(header), "core-power");
-	format_and_print(outf, 4, header, NULL);
+	format_and_print(outf, level + 1, header, NULL);
 
 	snprintf(header, sizeof(header), "support-status");
 	if (cap)
 		snprintf(value, sizeof(value), "supported");
 	else
 		snprintf(value, sizeof(value), "unsupported");
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "enable-status");
 	if (state)
 		snprintf(value, sizeof(value), "enabled");
 	else
 		snprintf(value, sizeof(value), "disabled");
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "clos-enable-status");
 	if (clos_enable)
 		snprintf(value, sizeof(value), "enabled");
 	else
 		snprintf(value, sizeof(value), "disabled");
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
 	snprintf(header, sizeof(header), "priority-type");
 	if (type)
 		snprintf(value, sizeof(value), "ordered");
 	else
 		snprintf(value, sizeof(value), "proportional");
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
-	format_and_print(outf, 1, NULL, NULL);
+	format_and_print(outf, level, NULL, NULL);
 }
 
 void isst_clos_display_assoc_information(int cpu, FILE *outf, int clos)
 {
 	char header[256];
 	char value[256];
+	int level;
 
-	snprintf(header, sizeof(header), "package-%d",
-		 get_physical_package_id(cpu));
-	format_and_print(outf, 1, header, NULL);
-	snprintf(header, sizeof(header), "die-%d", get_physical_die_id(cpu));
-	format_and_print(outf, 2, header, NULL);
-	snprintf(header, sizeof(header), "cpu-%d", cpu);
-	format_and_print(outf, 3, header, NULL);
+	level = print_package_info(cpu, outf);
 
 	snprintf(header, sizeof(header), "get-assoc");
-	format_and_print(outf, 4, header, NULL);
+	format_and_print(outf, level + 1, header, NULL);
 
 	snprintf(header, sizeof(header), "clos");
 	snprintf(value, sizeof(value), "%d", clos);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
-	format_and_print(outf, 1, NULL, NULL);
+	format_and_print(outf, level, NULL, NULL);
 }
 
 void isst_display_result(int cpu, FILE *outf, char *feature, char *cmd,
@@ -697,26 +696,21 @@ void isst_display_result(int cpu, FILE *outf, char *feature, char *cmd,
 {
 	char header[256];
 	char value[256];
+	int level = 3;
+
+	if (cpu >= 0)
+		level = print_package_info(cpu, outf);
 
-	if (cpu >= 0) {
-		snprintf(header, sizeof(header), "package-%d",
-			 get_physical_package_id(cpu));
-		format_and_print(outf, 1, header, NULL);
-		snprintf(header, sizeof(header), "die-%d", get_physical_die_id(cpu));
-		format_and_print(outf, 2, header, NULL);
-		snprintf(header, sizeof(header), "cpu-%d", cpu);
-		format_and_print(outf, 3, header, NULL);
-	}
 	snprintf(header, sizeof(header), "%s", feature);
-	format_and_print(outf, 4, header, NULL);
+	format_and_print(outf, level + 1, header, NULL);
 	snprintf(header, sizeof(header), "%s", cmd);
 	if (!result)
 		snprintf(value, sizeof(value), "success");
 	else
 		snprintf(value, sizeof(value), "failed(error %d)", result);
-	format_and_print(outf, 5, header, value);
+	format_and_print(outf, level + 2, header, value);
 
-	format_and_print(outf, 1, NULL, NULL);
+	format_and_print(outf, level, NULL, NULL);
 }
 
 void isst_display_error_info_message(int error, char *msg, int arg_valid, int arg)
-- 
2.24.1

