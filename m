Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 999AACECD5
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Oct 2019 21:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbfJGTb3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Oct 2019 15:31:29 -0400
Received: from mga09.intel.com ([134.134.136.24]:26154 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728786AbfJGTbJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Oct 2019 15:31:09 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Oct 2019 12:31:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,269,1566889200"; 
   d="scan'208";a="192372874"
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by fmsmga008.fm.intel.com with ESMTP; 07 Oct 2019 12:31:07 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     andriy.shevchenko@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        prarit@redhat.com,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v3 1/6] tools/power/x86/intel-speed-select: Add int argument to command functions
Date:   Mon,  7 Oct 2019 12:30:55 -0700
Message-Id: <20191007193100.36934-2-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191007193100.36934-1-srinivas.pandruvada@linux.intel.com>
References: <20191007193100.36934-1-srinivas.pandruvada@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Prarit Bhargava <prarit@redhat.com>

The current code structure has similar but separate command functions for
the enable and disable operations.  This can be improved by adding an int
argument to the command function structure, and interpreting 1 as enable
and 0 as disable.  This change results in the removal of the disable
command functions.

Add int argument to the command function structure.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      | 213 +++++++-----------
 1 file changed, 86 insertions(+), 127 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index e1ca7c5b8037..4927aebee306 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -11,7 +11,8 @@
 struct process_cmd_struct {
 	char *feature;
 	char *command;
-	void (*process_fn)(void);
+	void (*process_fn)(int arg);
+	int arg;
 };
 
 static const char *version_str = "v1.0";
@@ -682,7 +683,7 @@ static void exec_on_get_ctdp_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 }
 
 #define _get_tdp_level(desc, suffix, object, help)                                \
-	static void get_tdp_##object(void)                                        \
+	static void get_tdp_##object(int arg)                                    \
 	{                                                                         \
 		struct isst_pkg_ctdp ctdp;                                        \
 \
@@ -728,7 +729,7 @@ static void dump_isst_config_for_cpu(int cpu, void *arg1, void *arg2,
 	}
 }
 
-static void dump_isst_config(void)
+static void dump_isst_config(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr,
@@ -791,7 +792,7 @@ static void set_tdp_level_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 	}
 }
 
-static void set_tdp_level(void)
+static void set_tdp_level(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr, "Set Config TDP level\n");
@@ -831,7 +832,7 @@ static void dump_pbf_config_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 	}
 }
 
-static void dump_pbf_config(void)
+static void dump_pbf_config(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr,
@@ -1079,48 +1080,33 @@ static void set_pbf_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 				    ret);
 }
 
-static void set_pbf_enable(void)
+static void set_pbf_enable(int arg)
 {
-	int status = 1;
+	int enable = arg;
 
 	if (cmd_help) {
-		fprintf(stderr,
-			"Enable Intel Speed Select Technology base frequency feature\n");
-		fprintf(stderr,
-			"\tOptional Arguments: -a|--auto : Use priority of cores to set core-power associations\n");
-
-		exit(0);
-	}
-
-	isst_ctdp_display_information_start(outf);
-	if (max_target_cpus)
-		for_each_online_target_cpu_in_set(set_pbf_for_cpu, NULL, NULL,
-						  NULL, &status);
-	else
-		for_each_online_package_in_set(set_pbf_for_cpu, NULL, NULL,
-					       NULL, &status);
-	isst_ctdp_display_information_end(outf);
-}
-
-static void set_pbf_disable(void)
-{
-	int status = 0;
+		if (enable) {
+			fprintf(stderr,
+				"Enable Intel Speed Select Technology base frequency feature\n");
+			fprintf(stderr,
+				"\tOptional Arguments: -a|--auto : Use priority of cores to set core-power associations\n");
+		} else {
 
-	if (cmd_help) {
-		fprintf(stderr,
-			"Disable Intel Speed Select Technology base frequency feature\n");
-		fprintf(stderr,
-			"\tOptional Arguments: -a|--auto : Also disable core-power associations\n");
+			fprintf(stderr,
+				"Disable Intel Speed Select Technology base frequency feature\n");
+			fprintf(stderr,
+				"\tOptional Arguments: -a|--auto : Also disable core-power associations\n");
+		}
 		exit(0);
 	}
 
 	isst_ctdp_display_information_start(outf);
 	if (max_target_cpus)
 		for_each_online_target_cpu_in_set(set_pbf_for_cpu, NULL, NULL,
-						  NULL, &status);
+						  NULL, &enable);
 	else
 		for_each_online_package_in_set(set_pbf_for_cpu, NULL, NULL,
-					       NULL, &status);
+					       NULL, &enable);
 	isst_ctdp_display_information_end(outf);
 }
 
@@ -1138,7 +1124,7 @@ static void dump_fact_config_for_cpu(int cpu, void *arg1, void *arg2,
 					      fact_avx, &fact_info);
 }
 
-static void dump_fact_config(void)
+static void dump_fact_config(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr,
@@ -1213,31 +1199,41 @@ static void set_fact_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 	}
 }
 
-static void set_fact_enable(void)
+static void set_fact_enable(int arg)
 {
-	int status = 1, i, ret;
+	int i, ret, enable = arg;
 
 	if (cmd_help) {
-		fprintf(stderr,
-			"Enable Intel Speed Select Technology Turbo frequency feature\n");
-		fprintf(stderr,
-			"Optional: -t|--trl : Specify turbo ratio limit\n");
-		fprintf(stderr,
-			"\tOptional Arguments: -a|--auto : Designate specified target CPUs with");
-		fprintf(stderr, "-C|--cpu option as as high priority using core-power feature\n");
+		if (enable) {
+			fprintf(stderr,
+				"Enable Intel Speed Select Technology Turbo frequency feature\n");
+			fprintf(stderr,
+				"Optional: -t|--trl : Specify turbo ratio limit\n");
+			fprintf(stderr,
+				"\tOptional Arguments: -a|--auto : Designate specified target CPUs with");
+			fprintf(stderr,
+				"-C|--cpu option as as high priority using core-power feature\n");
+		} else {
+			fprintf(stderr,
+				"Disable Intel Speed Select Technology turbo frequency feature\n");
+			fprintf(stderr,
+				"Optional: -t|--trl : Specify turbo ratio limit\n");
+			fprintf(stderr,
+				"\tOptional Arguments: -a|--auto : Also disable core-power associations\n");
+		}
 		exit(0);
 	}
 
 	isst_ctdp_display_information_start(outf);
 	if (max_target_cpus)
 		for_each_online_target_cpu_in_set(set_fact_for_cpu, NULL, NULL,
-						  NULL, &status);
+						  NULL, &enable);
 	else
 		for_each_online_package_in_set(set_fact_for_cpu, NULL, NULL,
-					       NULL, &status);
+					       NULL, &enable);
 	isst_ctdp_display_information_end(outf);
 
-	if (auto_mode) {
+	if (enable && auto_mode) {
 		/*
 		 * When we adjust CLOS param, we have to set for siblings also.
 		 * So for the each user specified CPU, also add the sibling
@@ -1315,30 +1311,6 @@ static void set_fact_enable(void)
 
 }
 
-static void set_fact_disable(void)
-{
-	int status = 0;
-
-	if (cmd_help) {
-		fprintf(stderr,
-			"Disable Intel Speed Select Technology turbo frequency feature\n");
-		fprintf(stderr,
-			"Optional: -t|--trl : Specify turbo ratio limit\n");
-		fprintf(stderr,
-			"\tOptional Arguments: -a|--auto : Also disable core-power associations\n");
-		exit(0);
-	}
-
-	isst_ctdp_display_information_start(outf);
-	if (max_target_cpus)
-		for_each_online_target_cpu_in_set(set_fact_for_cpu, NULL, NULL,
-						  NULL, &status);
-	else
-		for_each_online_package_in_set(set_fact_for_cpu, NULL, NULL,
-					       NULL, &status);
-	isst_ctdp_display_information_end(outf);
-}
-
 static void enable_clos_qos_config(int cpu, void *arg1, void *arg2, void *arg3,
 				   void *arg4)
 {
@@ -1357,19 +1329,25 @@ static void enable_clos_qos_config(int cpu, void *arg1, void *arg2, void *arg3,
 				    ret);
 }
 
-static void set_clos_enable(void)
+static void set_clos_enable(int arg)
 {
-	int status = 1;
+	int enable = arg;
 
 	if (cmd_help) {
-		fprintf(stderr, "Enable core-power for a package/die\n");
-		fprintf(stderr,
-			"\tClos Enable: Specify priority type with [--priority|-p]\n");
-		fprintf(stderr, "\t\t 0: Proportional, 1: Ordered\n");
+		if (enable) {
+			fprintf(stderr,
+				"Enable core-power for a package/die\n");
+			fprintf(stderr,
+				"\tClos Enable: Specify priority type with [--priority|-p]\n");
+			fprintf(stderr, "\t\t 0: Proportional, 1: Ordered\n");
+		} else {
+			fprintf(stderr,
+				"Disable core-power: [No command arguments are required]\n");
+		}
 		exit(0);
 	}
 
-	if (cpufreq_sysfs_present()) {
+	if (enable && cpufreq_sysfs_present()) {
 		fprintf(stderr,
 			"cpufreq subsystem and core-power enable will interfere with each other!\n");
 	}
@@ -1377,30 +1355,10 @@ static void set_clos_enable(void)
 	isst_ctdp_display_information_start(outf);
 	if (max_target_cpus)
 		for_each_online_target_cpu_in_set(enable_clos_qos_config, NULL,
-						  NULL, NULL, &status);
-	else
-		for_each_online_package_in_set(enable_clos_qos_config, NULL,
-					       NULL, NULL, &status);
-	isst_ctdp_display_information_end(outf);
-}
-
-static void set_clos_disable(void)
-{
-	int status = 0;
-
-	if (cmd_help) {
-		fprintf(stderr,
-			"Disable core-power: [No command arguments are required]\n");
-		exit(0);
-	}
-
-	isst_ctdp_display_information_start(outf);
-	if (max_target_cpus)
-		for_each_online_target_cpu_in_set(enable_clos_qos_config, NULL,
-						  NULL, NULL, &status);
+						  NULL, NULL, &enable);
 	else
 		for_each_online_package_in_set(enable_clos_qos_config, NULL,
-					       NULL, NULL, &status);
+					       NULL, NULL, &enable);
 	isst_ctdp_display_information_end(outf);
 }
 
@@ -1418,7 +1376,7 @@ static void dump_clos_config_for_cpu(int cpu, void *arg1, void *arg2,
 					      &clos_config);
 }
 
-static void dump_clos_config(void)
+static void dump_clos_config(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr,
@@ -1454,7 +1412,7 @@ static void get_clos_info_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 		isst_clos_display_clos_information(cpu, outf, enable, prio_type);
 }
 
-static void dump_clos_info(void)
+static void dump_clos_info(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr,
@@ -1497,7 +1455,7 @@ static void set_clos_config_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 		isst_display_result(cpu, outf, "core-power", "config", ret);
 }
 
-static void set_clos_config(void)
+static void set_clos_config(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr,
@@ -1561,7 +1519,7 @@ static void set_clos_assoc_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 		isst_display_result(cpu, outf, "core-power", "assoc", ret);
 }
 
-static void set_clos_assoc(void)
+static void set_clos_assoc(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr, "Associate a clos id to a CPU\n");
@@ -1595,7 +1553,7 @@ static void get_clos_assoc_for_cpu(int cpu, void *arg1, void *arg2, void *arg3,
 		isst_clos_display_assoc_information(cpu, outf, clos);
 }
 
-static void get_clos_assoc(void)
+static void get_clos_assoc(int arg)
 {
 	if (cmd_help) {
 		fprintf(stderr, "Get associate clos id to a CPU\n");
@@ -1616,26 +1574,27 @@ static void get_clos_assoc(void)
 }
 
 static struct process_cmd_struct isst_cmds[] = {
-	{ "perf-profile", "get-lock-status", get_tdp_locked },
-	{ "perf-profile", "get-config-levels", get_tdp_levels },
-	{ "perf-profile", "get-config-version", get_tdp_version },
-	{ "perf-profile", "get-config-enabled", get_tdp_enabled },
-	{ "perf-profile", "get-config-current-level", get_tdp_current_level },
-	{ "perf-profile", "set-config-level", set_tdp_level },
-	{ "perf-profile", "info", dump_isst_config },
-	{ "base-freq", "info", dump_pbf_config },
-	{ "base-freq", "enable", set_pbf_enable },
-	{ "base-freq", "disable", set_pbf_disable },
-	{ "turbo-freq", "info", dump_fact_config },
-	{ "turbo-freq", "enable", set_fact_enable },
-	{ "turbo-freq", "disable", set_fact_disable },
-	{ "core-power", "info", dump_clos_info },
-	{ "core-power", "enable", set_clos_enable },
-	{ "core-power", "disable", set_clos_disable },
-	{ "core-power", "config", set_clos_config },
-	{ "core-power", "get-config", dump_clos_config },
-	{ "core-power", "assoc", set_clos_assoc },
-	{ "core-power", "get-assoc", get_clos_assoc },
+	{ "perf-profile", "get-lock-status", get_tdp_locked, 0 },
+	{ "perf-profile", "get-config-levels", get_tdp_levels, 0 },
+	{ "perf-profile", "get-config-version", get_tdp_version, 0 },
+	{ "perf-profile", "get-config-enabled", get_tdp_enabled, 0 },
+	{ "perf-profile", "get-config-current-level", get_tdp_current_level,
+	 0 },
+	{ "perf-profile", "set-config-level", set_tdp_level, 0 },
+	{ "perf-profile", "info", dump_isst_config, 0 },
+	{ "base-freq", "info", dump_pbf_config, 0 },
+	{ "base-freq", "enable", set_pbf_enable, 1 },
+	{ "base-freq", "disable", set_pbf_enable, 0 },
+	{ "turbo-freq", "info", dump_fact_config, 0 },
+	{ "turbo-freq", "enable", set_fact_enable, 1 },
+	{ "turbo-freq", "disable", set_fact_enable, 0 },
+	{ "core-power", "info", dump_clos_info, 0 },
+	{ "core-power", "enable", set_clos_enable, 1 },
+	{ "core-power", "disable", set_clos_enable, 0 },
+	{ "core-power", "config", set_clos_config, 0 },
+	{ "core-power", "get-config", dump_clos_config, 0 },
+	{ "core-power", "assoc", set_clos_assoc, 0 },
+	{ "core-power", "get-assoc", get_clos_assoc, 0 },
 	{ NULL, NULL, NULL }
 };
 
@@ -1884,7 +1843,7 @@ void process_command(int argc, char **argv)
 		if (!strcmp(isst_cmds[i].feature, feature) &&
 		    !strcmp(isst_cmds[i].command, cmd)) {
 			parse_cmd_args(argc, optind + 1, argv);
-			isst_cmds[i].process_fn();
+			isst_cmds[i].process_fn(isst_cmds[i].arg);
 			matched = 1;
 			break;
 		}
-- 
2.17.2

