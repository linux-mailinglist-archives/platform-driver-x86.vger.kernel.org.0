Return-Path: <platform-driver-x86+bounces-4354-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EC79302C8
	for <lists+platform-driver-x86@lfdr.de>; Sat, 13 Jul 2024 02:42:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B04281F2390C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 13 Jul 2024 00:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0B1714A8B;
	Sat, 13 Jul 2024 00:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1oWEGac"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B87EADB;
	Sat, 13 Jul 2024 00:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720831344; cv=none; b=Nyxrh7X4adJPG+9TNflv6ZRR713i8RFEsBc2i/FIbiw0/Lk8xxnhT44X8cX0TaI5Uy0bRtaOPjluxQY4O8qf8El8Xa6RcULXlEO5LlcDQkcwlRBLlg6ppcv9YXrp59TeDN6EYWTij4DTfI33zJ8QZQmjozcr4NN1tCsGYEACjlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720831344; c=relaxed/simple;
	bh=OqMetwU+ftH28hfy9x/I9y8JLiYlxFN0ovHLgV2o0Kg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ojB0Lhs4qUvTciQkP0rQfYLCQTcKZo7mRIEDRf+9aUQtCsMQgbGbViMPzIlD9WznZeiS3a9SdHJzekx9RrzxmSsZAUgwWmIRQFxIYhBeHy26x6g1WMkkvc8OFt77FuFYq4TRKVTVm0ppAuRZzIWn483YkkbNsIQstnoVgYD7CZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1oWEGac; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720831343; x=1752367343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OqMetwU+ftH28hfy9x/I9y8JLiYlxFN0ovHLgV2o0Kg=;
  b=L1oWEGacQ5FDKiBdbVh8hAsFjtIoYy3nPwbdGlg7uV1vZpArW1VOeIQl
   Zcr3sj4WZ8YF2p4CDK4Y0zzxvByyfVnl8dmxgNiXOrTzbUzMvK5HM3u54
   pUE1kspSOw91kUxnoHFwpPNxWZgMozNwTGo8yn6UdMZgXETfZhFVVJbt7
   fSh2S3rTP6K+0mcdC8VU4TcQV4sxGOG1ZVpV0ev6I5szIhT3uxOHX5zxI
   huUQZRYNAKT01o7wYPhiftCOXAk3jOJFrcaE9T0R+3lwnG0OFF8fPPF6F
   /VizUXEJfW0Rdtk6NmIrlDQNd6moNYmDFufSFsy6ckP4GEZC+lPUrJuSe
   w==;
X-CSE-ConnectionGUID: MaU+skeZRzWJJjEbj6JtTA==
X-CSE-MsgGUID: DbPVq8nFSBORCdPnNX7/0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="35833390"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="35833390"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 17:42:20 -0700
X-CSE-ConnectionGUID: YfuOPp1tSIKEhkOiRLucHg==
X-CSE-MsgGUID: Ye3BL0OJRmyZa2w9mWDR0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="48955787"
Received: from skuppusw-desk2.jf.intel.com ([10.165.154.101])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 17:42:21 -0700
From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
To: Jithu Joseph <jithu.joseph@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ashok Raj <ashok.raj@intel.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-trace-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Shankar Ravi V <ravi.v.shankar@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] platform/x86/intel/ifs: Add SBAF test support
Date: Sat, 13 Jul 2024 00:40:00 +0000
Message-Id: <20240713004001.535159-4-sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240713004001.535159-1-sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20240713004001.535159-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jithu Joseph <jithu.joseph@intel.com>

In a core, the SBAF test engine is shared between sibling CPUs.

An SBAF test image contains multiple bundles. Each bundle is further
composed of subunits called programs. When a SBAF test (for a particular
core) is triggered by the user, each SBAF bundle from the loaded test
image is executed sequentially on all the threads on the core using
the stop_core_cpuslocked mechanism. Each bundle execution is initiated by
writing to MSR_ACTIVATE_SBAF.

SBAF test bundle execution may be aborted when an interrupt occurs or
if the CPU does not have enough power budget for the test. In these
cases the kernel restarts the test from the aborted bundle. SBAF
execution is not retried if the test fails or if the test makes no
forward progress after 5 retries.

Reviewed-by: Ashok Raj <ashok.raj@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---

Changes since v2:
 * Removed unnecessary parenthesis for 2 * HZ.
 * Changed "Non valid" to Non-valid.
 * Use simplified confition for sbaf_bundle_completed().

 drivers/platform/x86/intel/ifs/ifs.h     |  30 +++
 drivers/platform/x86/intel/ifs/runtest.c | 232 +++++++++++++++++++++++
 2 files changed, 262 insertions(+)

diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
index 600bb8a1b285..b261be46bce8 100644
--- a/drivers/platform/x86/intel/ifs/ifs.h
+++ b/drivers/platform/x86/intel/ifs/ifs.h
@@ -157,6 +157,8 @@
 #define MSR_SBAF_HASHES_STATUS			0x000002b9
 #define MSR_AUTHENTICATE_AND_COPY_SBAF_CHUNK	0x000002ba
 #define MSR_SBAF_CHUNKS_AUTHENTICATION_STATUS	0x000002bb
+#define MSR_ACTIVATE_SBAF			0x000002bc
+#define MSR_SBAF_STATUS				0x000002bd
 
 #define MSR_COPY_SCAN_HASHES			0x000002c2
 #define MSR_SCAN_HASHES_STATUS			0x000002c3
@@ -283,6 +285,34 @@ union ifs_array {
 	};
 };
 
+/* MSR_ACTIVATE_SBAF bit fields */
+union ifs_sbaf {
+	u64	data;
+	struct {
+		u32	bundle_idx	:9;
+		u32	rsvd1		:5;
+		u32	pgm_idx		:2;
+		u32	rsvd2		:16;
+		u32	delay		:31;
+		u32	sigmce		:1;
+	};
+};
+
+/* MSR_SBAF_STATUS bit fields */
+union ifs_sbaf_status {
+	u64	data;
+	struct {
+		u32	bundle_idx	:9;
+		u32	rsvd1		:5;
+		u32	pgm_idx		:2;
+		u32	rsvd2		:16;
+		u32	error_code	:8;
+		u32	rsvd3		:21;
+		u32	test_fail	:1;
+		u32	sbaf_status	:2;
+	};
+};
+
 /*
  * Driver populated error-codes
  * 0xFD: Test timed out before completing all the chunks.
diff --git a/drivers/platform/x86/intel/ifs/runtest.c b/drivers/platform/x86/intel/ifs/runtest.c
index 282e4bfe30da..2a37f009d0b3 100644
--- a/drivers/platform/x86/intel/ifs/runtest.c
+++ b/drivers/platform/x86/intel/ifs/runtest.c
@@ -29,6 +29,13 @@ struct run_params {
 	union ifs_status status;
 };
 
+struct sbaf_run_params {
+	struct ifs_data *ifsd;
+	int *retry_cnt;
+	union ifs_sbaf *activate;
+	union ifs_sbaf_status status;
+};
+
 /*
  * Number of TSC cycles that a logical CPU will wait for the other
  * logical CPU on the core in the WRMSR(ACTIVATE_SCAN).
@@ -146,6 +153,7 @@ static bool can_restart(union ifs_status status)
 #define SPINUNIT 100 /* 100 nsec */
 static atomic_t array_cpus_in;
 static atomic_t scan_cpus_in;
+static atomic_t sbaf_cpus_in;
 
 /*
  * Simplified cpu sibling rendezvous loop based on microcode loader __wait_for_cpus()
@@ -387,6 +395,224 @@ static void ifs_array_test_gen1(int cpu, struct device *dev)
 		ifsd->status = SCAN_TEST_PASS;
 }
 
+#define SBAF_STATUS_PASS			0
+#define SBAF_STATUS_SIGN_FAIL			1
+#define SBAF_STATUS_INTR			2
+#define SBAF_STATUS_TEST_FAIL			3
+
+enum sbaf_status_err_code {
+	IFS_SBAF_NO_ERROR				= 0,
+	IFS_SBAF_OTHER_THREAD_COULD_NOT_JOIN		= 1,
+	IFS_SBAF_INTERRUPTED_BEFORE_RENDEZVOUS		= 2,
+	IFS_SBAF_UNASSIGNED_ERROR_CODE3			= 3,
+	IFS_SBAF_INVALID_BUNDLE_INDEX			= 4,
+	IFS_SBAF_MISMATCH_ARGS_BETWEEN_THREADS		= 5,
+	IFS_SBAF_CORE_NOT_CAPABLE_CURRENTLY		= 6,
+	IFS_SBAF_UNASSIGNED_ERROR_CODE7			= 7,
+	IFS_SBAF_EXCEED_NUMBER_OF_THREADS_CONCURRENT	= 8,
+	IFS_SBAF_INTERRUPTED_DURING_EXECUTION		= 9,
+	IFS_SBAF_INVALID_PROGRAM_INDEX			= 0xA,
+	IFS_SBAF_CORRUPTED_CHUNK			= 0xB,
+	IFS_SBAF_DID_NOT_START				= 0xC,
+};
+
+static const char * const sbaf_test_status[] = {
+	[IFS_SBAF_NO_ERROR] = "SBAF no error",
+	[IFS_SBAF_OTHER_THREAD_COULD_NOT_JOIN] = "Other thread could not join.",
+	[IFS_SBAF_INTERRUPTED_BEFORE_RENDEZVOUS] = "Interrupt occurred prior to SBAF coordination.",
+	[IFS_SBAF_UNASSIGNED_ERROR_CODE3] = "Unassigned error code 0x3",
+	[IFS_SBAF_INVALID_BUNDLE_INDEX] = "Non-valid sbaf bundles. Reload test image",
+	[IFS_SBAF_MISMATCH_ARGS_BETWEEN_THREADS] = "Mismatch in arguments between threads T0/T1.",
+	[IFS_SBAF_CORE_NOT_CAPABLE_CURRENTLY] = "Core not capable of performing SBAF currently",
+	[IFS_SBAF_UNASSIGNED_ERROR_CODE7] = "Unassigned error code 0x7",
+	[IFS_SBAF_EXCEED_NUMBER_OF_THREADS_CONCURRENT] = "Exceeded number of Logical Processors (LP) allowed to run Scan-At-Field concurrently",
+	[IFS_SBAF_INTERRUPTED_DURING_EXECUTION] = "Interrupt occurred prior to SBAF start",
+	[IFS_SBAF_INVALID_PROGRAM_INDEX] = "SBAF program index not valid",
+	[IFS_SBAF_CORRUPTED_CHUNK] = "SBAF operation aborted due to corrupted chunk",
+	[IFS_SBAF_DID_NOT_START] = "SBAF operation did not start",
+};
+
+static void sbaf_message_not_tested(struct device *dev, int cpu, u64 status_data)
+{
+	union ifs_sbaf_status status = (union ifs_sbaf_status)status_data;
+
+	if (status.error_code < ARRAY_SIZE(sbaf_test_status)) {
+		dev_info(dev, "CPU(s) %*pbl: SBAF operation did not start. %s\n",
+			 cpumask_pr_args(cpu_smt_mask(cpu)),
+			 sbaf_test_status[status.error_code]);
+	} else if (status.error_code == IFS_SW_TIMEOUT) {
+		dev_info(dev, "CPU(s) %*pbl: software timeout during scan\n",
+			 cpumask_pr_args(cpu_smt_mask(cpu)));
+	} else if (status.error_code == IFS_SW_PARTIAL_COMPLETION) {
+		dev_info(dev, "CPU(s) %*pbl: %s\n",
+			 cpumask_pr_args(cpu_smt_mask(cpu)),
+			 "Not all SBAF bundles executed. Maximum forward progress retries exceeded");
+	} else {
+		dev_info(dev, "CPU(s) %*pbl: SBAF unknown status %llx\n",
+			 cpumask_pr_args(cpu_smt_mask(cpu)), status.data);
+	}
+}
+
+static void sbaf_message_fail(struct device *dev, int cpu, union ifs_sbaf_status status)
+{
+	/* Failed signature check is set when SBAF signature did not match the expected value */
+	if (status.sbaf_status == SBAF_STATUS_SIGN_FAIL) {
+		dev_err(dev, "CPU(s) %*pbl: Failed signature check\n",
+			cpumask_pr_args(cpu_smt_mask(cpu)));
+	}
+
+	/* Failed to reach end of test */
+	if (status.sbaf_status == SBAF_STATUS_TEST_FAIL) {
+		dev_err(dev, "CPU(s) %*pbl: Failed to complete test\n",
+			cpumask_pr_args(cpu_smt_mask(cpu)));
+	}
+}
+
+static bool sbaf_bundle_completed(union ifs_sbaf_status status)
+{
+	return !(status.sbaf_status || status.error_code);
+}
+
+static bool sbaf_can_restart(union ifs_sbaf_status status)
+{
+	enum sbaf_status_err_code err_code = status.error_code;
+
+	/* Signature for chunk is bad, or scan test failed */
+	if (status.sbaf_status == SBAF_STATUS_SIGN_FAIL ||
+	    status.sbaf_status == SBAF_STATUS_TEST_FAIL)
+		return false;
+
+	switch (err_code) {
+	case IFS_SBAF_NO_ERROR:
+	case IFS_SBAF_OTHER_THREAD_COULD_NOT_JOIN:
+	case IFS_SBAF_INTERRUPTED_BEFORE_RENDEZVOUS:
+	case IFS_SBAF_EXCEED_NUMBER_OF_THREADS_CONCURRENT:
+	case IFS_SBAF_INTERRUPTED_DURING_EXECUTION:
+		return true;
+	case IFS_SBAF_UNASSIGNED_ERROR_CODE3:
+	case IFS_SBAF_INVALID_BUNDLE_INDEX:
+	case IFS_SBAF_MISMATCH_ARGS_BETWEEN_THREADS:
+	case IFS_SBAF_CORE_NOT_CAPABLE_CURRENTLY:
+	case IFS_SBAF_UNASSIGNED_ERROR_CODE7:
+	case IFS_SBAF_INVALID_PROGRAM_INDEX:
+	case IFS_SBAF_CORRUPTED_CHUNK:
+	case IFS_SBAF_DID_NOT_START:
+		break;
+	}
+	return false;
+}
+
+/*
+ * Execute the SBAF test. Called "simultaneously" on all threads of a core
+ * at high priority using the stop_cpus mechanism.
+ */
+static int dosbaf(void *data)
+{
+	struct sbaf_run_params *run_params = data;
+	int cpu = smp_processor_id();
+	union ifs_sbaf_status status;
+	struct ifs_data *ifsd;
+	int first;
+
+	ifsd = run_params->ifsd;
+
+	/* Only the first logical CPU on a core reports result */
+	first = cpumask_first(cpu_smt_mask(cpu));
+	wait_for_sibling_cpu(&sbaf_cpus_in, NSEC_PER_SEC);
+
+	/*
+	 * This WRMSR will wait for other HT threads to also write
+	 * to this MSR (at most for activate.delay cycles). Then it
+	 * starts scan of each requested bundle. The core test happens
+	 * during the "execution" of the WRMSR.
+	 */
+	wrmsrl(MSR_ACTIVATE_SBAF, run_params->activate->data);
+	rdmsrl(MSR_SBAF_STATUS, status.data);
+
+	/* Pass back the result of the test */
+	if (cpu == first)
+		run_params->status = status;
+
+	return 0;
+}
+
+static void ifs_sbaf_test_core(int cpu, struct device *dev)
+{
+	struct sbaf_run_params run_params;
+	union ifs_sbaf_status status = {};
+	union ifs_sbaf activate;
+	unsigned long timeout;
+	struct ifs_data *ifsd;
+	int stop_bundle;
+	int retries;
+
+	ifsd = ifs_get_data(dev);
+
+	activate.data = 0;
+	activate.delay = IFS_THREAD_WAIT;
+
+	timeout = jiffies + 2 * HZ;
+	retries = MAX_IFS_RETRIES;
+	activate.bundle_idx = 0;
+	stop_bundle = ifsd->max_bundle;
+
+	while (activate.bundle_idx <= stop_bundle) {
+		if (time_after(jiffies, timeout)) {
+			status.error_code = IFS_SW_TIMEOUT;
+			break;
+		}
+
+		atomic_set(&sbaf_cpus_in, 0);
+
+		run_params.ifsd = ifsd;
+		run_params.activate = &activate;
+		run_params.retry_cnt = &retries;
+		stop_core_cpuslocked(cpu, dosbaf, &run_params);
+
+		status = run_params.status;
+
+		if (sbaf_bundle_completed(status)) {
+			activate.bundle_idx = status.bundle_idx + 1;
+			activate.pgm_idx = 0;
+			retries = MAX_IFS_RETRIES;
+			continue;
+		}
+
+		/* Some cases can be retried, give up for others */
+		if (!sbaf_can_restart(status))
+			break;
+
+		if (status.pgm_idx == activate.pgm_idx) {
+			/* If no progress retry */
+			if (--retries == 0) {
+				if (status.error_code == IFS_NO_ERROR)
+					status.error_code = IFS_SW_PARTIAL_COMPLETION;
+				break;
+			}
+		} else {
+			/* if some progress, more pgms remaining in bundle, reset retries */
+			retries = MAX_IFS_RETRIES;
+			activate.bundle_idx = status.bundle_idx;
+			activate.pgm_idx = status.pgm_idx;
+		}
+	}
+
+	/* Update status for this core */
+	ifsd->scan_details = status.data;
+
+	if (status.sbaf_status == SBAF_STATUS_SIGN_FAIL ||
+	    status.sbaf_status == SBAF_STATUS_TEST_FAIL) {
+		ifsd->status = SCAN_TEST_FAIL;
+		sbaf_message_fail(dev, cpu, status);
+	} else if (status.error_code || status.sbaf_status == SBAF_STATUS_INTR ||
+		   (activate.bundle_idx < stop_bundle)) {
+		ifsd->status = SCAN_NOT_TESTED;
+		sbaf_message_not_tested(dev, cpu, status.data);
+	} else {
+		ifsd->status = SCAN_TEST_PASS;
+	}
+}
+
 /*
  * Initiate per core test. It wakes up work queue threads on the target cpu and
  * its sibling cpu. Once all sibling threads wake up, the scan test gets executed and
@@ -420,6 +646,12 @@ int do_core_test(int cpu, struct device *dev)
 		else
 			ifs_array_test_gen1(cpu, dev);
 		break;
+	case IFS_TYPE_SBAF:
+		if (!ifsd->loaded)
+			ret = -EPERM;
+		else
+			ifs_sbaf_test_core(cpu, dev);
+		break;
 	default:
 		ret = -EINVAL;
 	}
-- 
2.25.1


