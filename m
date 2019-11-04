Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34D9CEDD44
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Nov 2019 12:03:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbfKDLDP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 4 Nov 2019 06:03:15 -0500
Received: from mga04.intel.com ([192.55.52.120]:13209 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728535AbfKDLDK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Nov 2019 06:03:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Nov 2019 03:03:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,267,1569308400"; 
   d="scan'208";a="232021243"
Received: from spandruv-desk.jf.intel.com ([10.54.75.31])
  by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2019 03:03:10 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     andriy.shevchenko@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        prarit@redhat.com,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH 08/10] tools/power/x86/intel-speed-select: Support platform with limited Intel(R) Speed Select
Date:   Mon,  4 Nov 2019 03:02:44 -0800
Message-Id: <20191104110246.70465-9-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
References: <20191104110246.70465-1-srinivas.pandruvada@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There are some platforms, where there limited support of Intel(R) SST
features. Here perf-profile has only one base configuration and limited
support of commands. But still has support for discovery of base-freq and
turbo-freq features. So it is important to show minimum features to use
base-freq and turbo-freq features.

Here the change are:
- When there is no support of CONFIG_TDP_GET_LEVELS_INFO, then instead
of treating this as fatal error, treat this with number of config levels
= 0, that means only base level 0 is present.
- There is no support of mail box commands to get base frequencies or
turbo frequencies. Here present base frequency by reading cpufreq
base freq and turbo frequency by reading MSR 0x1AD.
- Don't display any field, which has value == 0.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../x86/intel-speed-select/isst-config.c      |  6 ++
 .../power/x86/intel-speed-select/isst-core.c  | 74 +++++++++++----
 .../x86/intel-speed-select/isst-display.c     | 92 ++++++++++---------
 tools/power/x86/intel-speed-select/isst.h     |  1 +
 4 files changed, 113 insertions(+), 60 deletions(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index 2d7ed27af7e0..2dffb67d3194 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -200,6 +200,11 @@ int get_physical_die_id(int cpu)
 	return ret;
 }
 
+int get_cpufreq_base_freq(int cpu)
+{
+	return parse_int_file(0, "/sys/devices/system/cpu/cpu%d/cpufreq/base_frequency", cpu);
+}
+
 int get_topo_max_cpus(void)
 {
 	return topo_max_cpus;
@@ -598,6 +603,7 @@ int isst_send_mbox_command(unsigned int cpu, unsigned char command,
 		fprintf(outf,
 			"Error: mbox_cmd cpu:%d command:%x sub_command:%x parameter:%x req_data:%x\n",
 			cpu, command, sub_command, parameter, req_data);
+		return -1;
 	} else {
 		*resp = mbox_cmds.mbox_cmd[0].resp_data;
 		debug_printf(
diff --git a/tools/power/x86/intel-speed-select/isst-core.c b/tools/power/x86/intel-speed-select/isst-core.c
index ca3bd5b2cf45..8b3e1c7abb42 100644
--- a/tools/power/x86/intel-speed-select/isst-core.c
+++ b/tools/power/x86/intel-speed-select/isst-core.c
@@ -13,8 +13,14 @@ int isst_get_ctdp_levels(int cpu, struct isst_pkg_ctdp *pkg_dev)
 
 	ret = isst_send_mbox_command(cpu, CONFIG_TDP,
 				     CONFIG_TDP_GET_LEVELS_INFO, 0, 0, &resp);
-	if (ret)
-		return ret;
+	if (ret) {
+		pkg_dev->levels = 0;
+		pkg_dev->locked = 1;
+		pkg_dev->current_level = 0;
+		pkg_dev->version = 0;
+		pkg_dev->enabled = 0;
+		return 0;
+	}
 
 	debug_printf("cpu:%d CONFIG_TDP_GET_LEVELS_INFO resp:%x\n", cpu, resp);
 
@@ -212,6 +218,27 @@ int isst_get_coremask_info(int cpu, int config_index,
 	return 0;
 }
 
+int isst_get_get_trl_from_msr(int cpu, int *trl)
+{
+	unsigned long long msr_trl;
+	int ret;
+
+	ret = isst_send_msr_command(cpu, 0x1AD, 0, &msr_trl);
+	if (ret)
+		return ret;
+
+	trl[0] = msr_trl & GENMASK(7, 0);
+	trl[1] = (msr_trl & GENMASK(15, 8)) >> 8;
+	trl[2] = (msr_trl & GENMASK(23, 16)) >> 16;
+	trl[3] = (msr_trl & GENMASK(31, 24)) >> 24;
+	trl[4] = (msr_trl & GENMASK(39, 32)) >> 32;
+	trl[5] = (msr_trl & GENMASK(47, 40)) >> 40;
+	trl[6] = (msr_trl & GENMASK(55, 48)) >> 48;
+	trl[7] = (msr_trl & GENMASK(63, 56)) >> 56;
+
+	return 0;
+}
+
 int isst_get_get_trl(int cpu, int level, int avx_level, int *trl)
 {
 	unsigned int req, resp;
@@ -321,7 +348,7 @@ int isst_get_pbf_info(int cpu, int level, struct isst_pbf_info *pbf_info)
 					     CONFIG_TDP_PBF_GET_CORE_MASK_INFO,
 					     0, (i << 8) | level, &resp);
 		if (ret)
-			return ret;
+			break;
 
 		debug_printf(
 			"cpu:%d CONFIG_TDP_PBF_GET_CORE_MASK_INFO resp:%x\n",
@@ -386,7 +413,7 @@ int isst_set_pbf_fact_status(int cpu, int pbf, int enable)
 
 	ret = isst_get_ctdp_levels(cpu, &pkg_dev);
 	if (ret)
-		return ret;
+		debug_printf("cpu:%d No support for dynamic ISST\n", cpu);
 
 	current_level = pkg_dev.current_level;
 
@@ -626,6 +653,32 @@ int isst_get_process_ctdp(int cpu, int tdp_level, struct isst_pkg_ctdp *pkg_dev)
 		if (ret)
 			return ret;
 
+		if (ctdp_level->pbf_support) {
+			ret = isst_get_pbf_info(cpu, i, &ctdp_level->pbf_info);
+			if (!ret)
+				ctdp_level->pbf_found = 1;
+		}
+
+		if (ctdp_level->fact_support) {
+			ret = isst_get_fact_info(cpu, i,
+						 &ctdp_level->fact_info);
+			if (ret)
+				return ret;
+		}
+
+		if (!pkg_dev->enabled) {
+			int freq;
+
+			freq = get_cpufreq_base_freq(cpu);
+			if (freq > 0) {
+				ctdp_level->sse_p1 = freq / 100000;
+				ctdp_level->tdp_ratio = ctdp_level->sse_p1;
+			}
+
+			isst_get_get_trl_from_msr(cpu, ctdp_level->trl_sse_active_cores);
+			continue;
+		}
+
 		ret = isst_get_tdp_info(cpu, i, ctdp_level);
 		if (ret)
 			return ret;
@@ -666,19 +719,6 @@ int isst_get_process_ctdp(int cpu, int tdp_level, struct isst_pkg_ctdp *pkg_dev)
 		isst_get_uncore_p0_p1_info(cpu, i, ctdp_level);
 		isst_get_p1_info(cpu, i, ctdp_level);
 		isst_get_uncore_mem_freq(cpu, i, ctdp_level);
-
-		if (ctdp_level->pbf_support) {
-			ret = isst_get_pbf_info(cpu, i, &ctdp_level->pbf_info);
-			if (!ret)
-				ctdp_level->pbf_found = 1;
-		}
-
-		if (ctdp_level->fact_support) {
-			ret = isst_get_fact_info(cpu, i,
-						 &ctdp_level->fact_info);
-			if (ret)
-				return ret;
-		}
 	}
 
 	pkg_dev->processed = 1;
diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
index b8f04347ad3f..c976bfe9b503 100644
--- a/tools/power/x86/intel-speed-select/isst-display.c
+++ b/tools/power/x86/intel-speed-select/isst-display.c
@@ -335,17 +335,19 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 		snprintf(value, sizeof(value), "%d", j);
 		format_and_print(outf, base_level + 4, header, value);
 
-		snprintf(header, sizeof(header), "enable-cpu-mask");
-		printcpumask(sizeof(value), value,
-			     ctdp_level->core_cpumask_size,
-			     ctdp_level->core_cpumask);
-		format_and_print(outf, base_level + 4, header, value);
+		if (ctdp_level->core_cpumask_size) {
+			snprintf(header, sizeof(header), "enable-cpu-mask");
+			printcpumask(sizeof(value), value,
+				     ctdp_level->core_cpumask_size,
+				     ctdp_level->core_cpumask);
+			format_and_print(outf, base_level + 4, header, value);
 
-		snprintf(header, sizeof(header), "enable-cpu-list");
-		printcpulist(sizeof(value), value,
-			     ctdp_level->core_cpumask_size,
-			     ctdp_level->core_cpumask);
-		format_and_print(outf, base_level + 4, header, value);
+			snprintf(header, sizeof(header), "enable-cpu-list");
+			printcpulist(sizeof(value), value,
+				     ctdp_level->core_cpumask_size,
+				     ctdp_level->core_cpumask);
+			format_and_print(outf, base_level + 4, header, value);
+		}
 
 		snprintf(header, sizeof(header), "thermal-design-power-ratio");
 		snprintf(value, sizeof(value), "%d", ctdp_level->tdp_ratio);
@@ -424,13 +426,17 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 			continue;
 		}
 
-		snprintf(header, sizeof(header), "thermal-design-power(W)");
-		snprintf(value, sizeof(value), "%d", ctdp_level->pkg_tdp);
-		format_and_print(outf, base_level + 4, header, value);
+		if (ctdp_level->pkg_tdp) {
+			snprintf(header, sizeof(header), "thermal-design-power(W)");
+			snprintf(value, sizeof(value), "%d", ctdp_level->pkg_tdp);
+			format_and_print(outf, base_level + 4, header, value);
+		}
 
-		snprintf(header, sizeof(header), "tjunction-max(C)");
-		snprintf(value, sizeof(value), "%d", ctdp_level->t_proc_hot);
-		format_and_print(outf, base_level + 4, header, value);
+		if (ctdp_level->t_proc_hot) {
+			snprintf(header, sizeof(header), "tjunction-max(C)");
+			snprintf(value, sizeof(value), "%d", ctdp_level->t_proc_hot);
+			format_and_print(outf, base_level + 4, header, value);
+		}
 
 		snprintf(header, sizeof(header), "turbo-ratio-limits-sse");
 		format_and_print(outf, base_level + 4, header, NULL);
@@ -449,41 +455,41 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
 				  DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 6, header, value);
 		}
-		snprintf(header, sizeof(header), "turbo-ratio-limits-avx2");
-		format_and_print(outf, base_level + 4, header, NULL);
-		for (j = 0; j < 8; ++j) {
-			snprintf(header, sizeof(header), "bucket-%d", j);
-			format_and_print(outf, base_level + 5, header, NULL);
 
-			snprintf(header, sizeof(header), "core-count");
-			snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
-			format_and_print(outf, base_level + 6, header, value);
+		if (ctdp_level->trl_avx_active_cores[0]) {
+			snprintf(header, sizeof(header), "turbo-ratio-limits-avx2");
+			format_and_print(outf, base_level + 4, header, NULL);
+			for (j = 0; j < 8; ++j) {
+				snprintf(header, sizeof(header), "bucket-%d", j);
+				format_and_print(outf, base_level + 5, header, NULL);
 
-			snprintf(header, sizeof(header),
-				"max-turbo-frequency(MHz)");
-			snprintf(value, sizeof(value), "%d",
-				 ctdp_level->trl_avx_active_cores[j] *
-				  DISP_FREQ_MULTIPLIER);
-			format_and_print(outf, base_level + 6, header, value);
+				snprintf(header, sizeof(header), "core-count");
+				snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
+				format_and_print(outf, base_level + 6, header, value);
+
+				snprintf(header, sizeof(header), "max-turbo-frequency(MHz)");
+				snprintf(value, sizeof(value), "%d", ctdp_level->trl_avx_active_cores[j] * DISP_FREQ_MULTIPLIER);
+				format_and_print(outf, base_level + 6, header, value);
+			}
 		}
 
-		snprintf(header, sizeof(header), "turbo-ratio-limits-avx512");
-		format_and_print(outf, base_level + 4, header, NULL);
-		for (j = 0; j < 8; ++j) {
-			snprintf(header, sizeof(header), "bucket-%d", j);
-			format_and_print(outf, base_level + 5, header, NULL);
+		if (ctdp_level->trl_avx_512_active_cores[0]) {
+			snprintf(header, sizeof(header), "turbo-ratio-limits-avx512");
+			format_and_print(outf, base_level + 4, header, NULL);
+			for (j = 0; j < 8; ++j) {
+				snprintf(header, sizeof(header), "bucket-%d", j);
+				format_and_print(outf, base_level + 5, header, NULL);
 
-			snprintf(header, sizeof(header), "core-count");
-			snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
-			format_and_print(outf, base_level + 6, header, value);
+				snprintf(header, sizeof(header), "core-count");
+				snprintf(value, sizeof(value), "%llu", (ctdp_level->buckets_info >> (j * 8)) & 0xff);
+				format_and_print(outf, base_level + 6, header, value);
 
-			snprintf(header, sizeof(header),
-				"max-turbo-frequency(MHz)");
-			snprintf(value, sizeof(value), "%d",
-				 ctdp_level->trl_avx_512_active_cores[j] *
-				  DISP_FREQ_MULTIPLIER);
+				snprintf(header, sizeof(header), "max-turbo-frequency(MHz)");
+				snprintf(value, sizeof(value), "%d", ctdp_level->trl_avx_512_active_cores[j] * DISP_FREQ_MULTIPLIER);
 			format_and_print(outf, base_level + 6, header, value);
+			}
 		}
+
 		if (ctdp_level->pbf_support)
 			_isst_pbf_display_information(cpu, outf, i,
 						      &ctdp_level->pbf_info,
diff --git a/tools/power/x86/intel-speed-select/isst.h b/tools/power/x86/intel-speed-select/isst.h
index bef27bd6138e..84f56a468f82 100644
--- a/tools/power/x86/intel-speed-select/isst.h
+++ b/tools/power/x86/intel-speed-select/isst.h
@@ -240,4 +240,5 @@ extern int isst_clos_get_clos_information(int cpu, int *enable, int *type);
 extern void isst_clos_display_clos_information(int cpu, FILE *outf,
 					       int clos_enable, int type);
 extern int is_clx_n_platform(void);
+extern int get_cpufreq_base_freq(int cpu);
 #endif
-- 
2.17.2

