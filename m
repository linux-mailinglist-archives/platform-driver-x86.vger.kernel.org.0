Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 114DE4ECF83
	for <lists+platform-driver-x86@lfdr.de>; Thu, 31 Mar 2022 00:18:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351538AbiC3WUa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 30 Mar 2022 18:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351519AbiC3WU1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Mar 2022 18:20:27 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C70B24085;
        Wed, 30 Mar 2022 15:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648678719; x=1680214719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=41Lg8aoTTqvxhP5CfaPMDA9IQBgepoN9Qo3/Kho3ltg=;
  b=bzqU8joEWaamwXEWXAayRcLFV1Q1nz9KQbwp1ZfNV9G1tzTsurGtJgIq
   RoXFSCADckhHIedV3vSGPKXJJ6T7jp5kTxGRwDn2q+gim/zb75gKixhSy
   woOKXhDLALc/kiHR43dI1xjJll9l1uDyqcn1kMRNxzrkeRDE8JjdQ8Ico
   YXYMxEORXoAuj+XUQ6yD2lutmLZ77Ipeq4Dx4L93JE+JJjwRSfzQ5b30s
   V4TZSgkxVvxC1EI+i+YJ01V+1+QPuNTAjbmFW4gFgbUF8OH+ia9tXySmx
   bl6jXPW/13uBRHnMJYCGNJUqlTCoLFLf/Wt8riYB0J6YguqC0+QnB0QTE
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="346095984"
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="346095984"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 15:18:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,223,1643702400"; 
   d="scan'208";a="788171902"
Received: from ksanitha-mobl3.amr.corp.intel.com (HELO skuppusw-desk1.amr.corp.intel.com) ([10.209.123.221])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2022 15:18:24 -0700
From:   Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     "H . Peter Anvin" <hpa@zytor.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Andi Kleen <ak@linux.intel.com>, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 5/6] platform/x86: intel_tdx_attest: Add TDX Guest attestation interface driver
Date:   Wed, 30 Mar 2022 15:18:04 -0700
Message-Id: <054b22e81e88379a5a8459c19e89a335531c1bdd.1648664666.git.sathyanarayanan.kuppuswamy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648664666.git.sathyanarayanan.kuppuswamy@intel.com>
References: <cover.1648664666.git.sathyanarayanan.kuppuswamy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

TDX guest supports encrypted disk as root or secondary drives.
Decryption keys required to access such drives are usually maintained
by 3rd party key servers. Attestation is required by 3rd party key
servers to get the key for an encrypted disk volume, or possibly other
encrypted services. Attestation is used to prove to the key server that
the TD guest is running in a valid TD and the kernel and virtual BIOS
and other environment are secure.

During the boot process various components before the kernel accumulate
hashes in the TDX module, which can then combined into a report. This
would typically include a hash of the bios, bios configuration, boot
loader, command line, kernel, initrd.  After checking the hashes the
key server will securely release the keys.

The actual details of the attestation protocol depend on the particular
key server configuration, but some parts are common and need to
communicate with the TDX module.

This communication is implemented in the attestation driver.

The supported steps are:

  1. TD guest generates the TDREPORT that contains version information
     about the Intel TDX module, measurement of the TD, along with a
     TD-specified nonce.
  2. TD guest shares the TDREPORT with TD host via GetQuote hypercall
     which is used by the host to generate a quote via quoting
     enclave (QE).
  3. Quote generation completion notification is sent to TD OS via
     callback interrupt vector configured by TD using
     SetupEventNotifyInterrupt hypercall.
  4. After receiving the generated TDQUOTE, a remote verifier can be
     used to verify the quote and confirm the trustworthiness of the
     TD.

Attestation agent uses IOCTLs implemented by the attestation driver to
complete the various steps of the attestation process.

Also note that, explicit access permissions are not enforced in this
driver because the quote and measurements are not a secret. However
the access permissions of the device node can be used to set any
desired access policy. The udev default is usually root access
only.

TDX_CMD_GEN_QUOTE IOCTL can be used to create an computation on the
host, but TDX assumes that the host is able to deal with malicious
guest flooding it anyways.

The interaction with the TDX module is like a RPM protocol here. There
are several operations (get tdreport, get quote) that need to input a
blob, and then output another blob. It was considered to use a sysfs
interface for this, but it doesn't fit well into the standard sysfs
model for configuring values. It would be possible to do read/write on
files, but it would need multiple file descriptors, which would be
somewhat messy. ioctls seems to be the best fitting and simplest model
here. There is one ioctl per operation, that takes the input blob and
returns the output blob, and as well as auxiliary ioctls to return the
blob lengths. The ioctls are documented in the header file. 

[Chenyi Qiang: Proposed struct tdx_gen_quote for passing user buffer]
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/intel/Kconfig            |   1 +
 drivers/platform/x86/intel/Makefile           |   1 +
 drivers/platform/x86/intel/tdx/Kconfig        |  13 +
 drivers/platform/x86/intel/tdx/Makefile       |   3 +
 .../platform/x86/intel/tdx/intel_tdx_attest.c | 230 ++++++++++++++++++
 include/uapi/misc/tdx.h                       |  42 ++++
 6 files changed, 290 insertions(+)
 create mode 100644 drivers/platform/x86/intel/tdx/Kconfig
 create mode 100644 drivers/platform/x86/intel/tdx/Makefile
 create mode 100644 drivers/platform/x86/intel/tdx/intel_tdx_attest.c
 create mode 100644 include/uapi/misc/tdx.h

diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 8e65086bb6c8..a2ed17d67052 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -12,6 +12,7 @@ source "drivers/platform/x86/intel/pmt/Kconfig"
 source "drivers/platform/x86/intel/speed_select_if/Kconfig"
 source "drivers/platform/x86/intel/telemetry/Kconfig"
 source "drivers/platform/x86/intel/wmi/Kconfig"
+source "drivers/platform/x86/intel/tdx/Kconfig"
 
 config INTEL_HID_EVENT
 	tristate "Intel HID Event"
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 35f2066578b2..27a6c6c5a83f 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_INTEL_SKL_INT3472)		+= int3472/
 obj-$(CONFIG_INTEL_PMC_CORE)		+= pmc/
 obj-$(CONFIG_INTEL_PMT_CLASS)		+= pmt/
 obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE) += speed_select_if/
+obj-$(CONFIG_INTEL_TDX_GUEST)		+= tdx/
 obj-$(CONFIG_INTEL_TELEMETRY)		+= telemetry/
 obj-$(CONFIG_INTEL_WMI)			+= wmi/
 
diff --git a/drivers/platform/x86/intel/tdx/Kconfig b/drivers/platform/x86/intel/tdx/Kconfig
new file mode 100644
index 000000000000..853e3a34c889
--- /dev/null
+++ b/drivers/platform/x86/intel/tdx/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# X86 TDX Platform Specific Drivers
+#
+
+config INTEL_TDX_ATTESTATION
+	tristate "Intel TDX attestation driver"
+	depends on INTEL_TDX_GUEST
+	help
+	  The TDX attestation driver provides IOCTL interfaces to the user to
+	  request TDREPORT from the TDX module or request quote from the VMM
+	  or to get quote buffer size. It is mainly used to get secure disk
+	  decryption keys from the key server.
diff --git a/drivers/platform/x86/intel/tdx/Makefile b/drivers/platform/x86/intel/tdx/Makefile
new file mode 100644
index 000000000000..124d6b7b20a0
--- /dev/null
+++ b/drivers/platform/x86/intel/tdx/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_INTEL_TDX_ATTESTATION)	+= intel_tdx_attest.o
diff --git a/drivers/platform/x86/intel/tdx/intel_tdx_attest.c b/drivers/platform/x86/intel/tdx/intel_tdx_attest.c
new file mode 100644
index 000000000000..0bf78d30e057
--- /dev/null
+++ b/drivers/platform/x86/intel/tdx/intel_tdx_attest.c
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * intel_tdx_attest.c - TDX guest attestation interface driver.
+ *
+ * Implements user interface to trigger attestation process and
+ * read the TD Quote result.
+ *
+ * Copyright (C) 2021-2022 Intel Corporation
+ *
+ * Author:
+ *     Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
+ */
+
+#define pr_fmt(fmt) "x86/tdx: attest: " fmt
+
+#include <linux/module.h>
+#include <linux/miscdevice.h>
+#include <linux/uaccess.h>
+#include <linux/fs.h>
+#include <linux/mm.h>
+#include <linux/slab.h>
+#include <linux/set_memory.h>
+#include <linux/dma-mapping.h>
+#include <linux/jiffies.h>
+#include <linux/io.h>
+#include <asm/apic.h>
+#include <asm/tdx.h>
+#include <asm/irq_vectors.h>
+#include <uapi/misc/tdx.h>
+
+/* Used in Quote memory allocation */
+#define QUOTE_SIZE			(2 * PAGE_SIZE)
+/* Used in Get Quote request memory allocation */
+#define GET_QUOTE_MAX_SIZE		(4 * PAGE_SIZE)
+/* Get Quote timeout in msec */
+#define GET_QUOTE_TIMEOUT		(5000)
+
+/* Mutex to synchronize attestation requests */
+static DEFINE_MUTEX(attestation_lock);
+/* Completion object to track attestation status */
+static DECLARE_COMPLETION(attestation_done);
+/* Buffer used to copy report data in attestation handler */
+static u8 report_data[TDX_REPORT_DATA_LEN] __aligned(64);
+/* Data pointer used to get TD Quote data in attestation handler */
+static void *tdquote_data;
+/* Data pointer used to get TDREPORT data in attestation handler */
+static void *tdreport_data;
+/* DMA handle used to allocate and free tdquote DMA buffer */
+dma_addr_t tdquote_dma_handle;
+
+static void attestation_callback_handler(void)
+{
+	complete(&attestation_done);
+}
+
+static long tdx_attest_ioctl(struct file *file, unsigned int cmd,
+			     unsigned long arg)
+{
+	void __user *argp = (void __user *)arg;
+	struct tdx_gen_quote tdquote_req;
+	long ret = 0;
+
+	mutex_lock(&attestation_lock);
+
+	switch (cmd) {
+	case TDX_CMD_GET_TDREPORT:
+		if (copy_from_user(report_data, argp, TDX_REPORT_DATA_LEN)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		/* Generate TDREPORT_STRUCT */
+		if (tdx_mcall_tdreport(tdreport_data, report_data)) {
+			ret = -EIO;
+			break;
+		}
+
+		if (copy_to_user(argp, tdreport_data, TDX_TDREPORT_LEN))
+			ret = -EFAULT;
+		break;
+	case TDX_CMD_GEN_QUOTE:
+		reinit_completion(&attestation_done);
+
+		/* Copy TDREPORT data from user buffer */
+		if (copy_from_user(&tdquote_req, argp, sizeof(struct tdx_gen_quote))) {
+			ret = -EFAULT;
+			break;
+		}
+
+		if (tdquote_req.len <= 0 || tdquote_req.len > GET_QUOTE_MAX_SIZE) {
+			ret = -EINVAL;
+			break;
+		}
+
+		if (copy_from_user(tdquote_data, tdquote_req.buf, tdquote_req.len)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		/* Submit GetQuote Request */
+		if (tdx_hcall_get_quote(tdquote_data, GET_QUOTE_MAX_SIZE)) {
+			ret = -EIO;
+			break;
+		}
+
+		/* Wait for attestation completion */
+		ret = wait_for_completion_interruptible_timeout(
+				&attestation_done,
+				msecs_to_jiffies(GET_QUOTE_TIMEOUT));
+		if (ret <= 0) {
+			ret = -EIO;
+			break;
+		}
+
+		/* ret will be positive if completed. */
+		ret = 0;
+
+		if (copy_to_user(tdquote_req.buf, tdquote_data, tdquote_req.len))
+			ret = -EFAULT;
+
+		break;
+	case TDX_CMD_GET_QUOTE_SIZE:
+		ret = put_user(QUOTE_SIZE, (u64 __user *)argp);
+		break;
+	default:
+		pr_err("cmd %d not supported\n", cmd);
+		break;
+	}
+
+	mutex_unlock(&attestation_lock);
+
+	return ret;
+}
+
+static const struct file_operations tdx_attest_fops = {
+	.owner		= THIS_MODULE,
+	.unlocked_ioctl	= tdx_attest_ioctl,
+	.llseek		= no_llseek,
+};
+
+static struct miscdevice tdx_attest_device = {
+	.minor          = MISC_DYNAMIC_MINOR,
+	.name           = "tdx-attest",
+	.fops           = &tdx_attest_fops,
+};
+
+static int __init tdx_attest_init(void)
+{
+	dma_addr_t handle;
+	long ret = 0;
+
+	mutex_lock(&attestation_lock);
+
+	ret = misc_register(&tdx_attest_device);
+	if (ret) {
+		pr_err("misc device registration failed\n");
+		mutex_unlock(&attestation_lock);
+		return ret;
+	}
+
+	/*
+	 * tdreport_data needs to be 64-byte aligned.
+	 * Full page alignment is more than enough.
+	 */
+	tdreport_data = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO, 0);
+	if (!tdreport_data) {
+		ret = -ENOMEM;
+		goto failed;
+	}
+
+	ret = dma_set_coherent_mask(tdx_attest_device.this_device,
+				    DMA_BIT_MASK(64));
+	if (ret) {
+		pr_err("dma set coherent mask failed\n");
+		goto failed;
+	}
+
+	/* Allocate DMA buffer to get TDQUOTE data from the VMM */
+	tdquote_data = dma_alloc_coherent(tdx_attest_device.this_device,
+					  GET_QUOTE_MAX_SIZE, &handle,
+					  GFP_KERNEL | __GFP_ZERO);
+	if (!tdquote_data) {
+		ret = -ENOMEM;
+		goto failed;
+	}
+
+	tdquote_dma_handle =  handle;
+
+	/* Register attestation event notify handler */
+	tdx_setup_ev_notify_handler(attestation_callback_handler);
+
+	mutex_unlock(&attestation_lock);
+
+	pr_debug("module initialization success\n");
+
+	return 0;
+
+failed:
+	if (tdreport_data)
+		free_pages((unsigned long)tdreport_data, 0);
+
+	misc_deregister(&tdx_attest_device);
+
+	mutex_unlock(&attestation_lock);
+
+	pr_debug("module initialization failed\n");
+
+	return ret;
+}
+
+static void __exit tdx_attest_exit(void)
+{
+	mutex_lock(&attestation_lock);
+
+	dma_free_coherent(tdx_attest_device.this_device, GET_QUOTE_MAX_SIZE,
+			  tdquote_data, tdquote_dma_handle);
+	free_pages((unsigned long)tdreport_data, 0);
+	misc_deregister(&tdx_attest_device);
+	/* Unregister attestation event notify handler */
+	tdx_remove_ev_notify_handler();
+	mutex_unlock(&attestation_lock);
+	pr_debug("module is successfully removed\n");
+}
+
+module_init(tdx_attest_init);
+module_exit(tdx_attest_exit);
+
+MODULE_AUTHOR("Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>");
+MODULE_DESCRIPTION("TDX attestation driver");
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/misc/tdx.h b/include/uapi/misc/tdx.h
new file mode 100644
index 000000000000..839b9a220022
--- /dev/null
+++ b/include/uapi/misc/tdx.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_MISC_TDX_H
+#define _UAPI_MISC_TDX_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/* Input report data length for TDX_CMD_GET_TDREPORT IOCTL request */
+#define TDX_REPORT_DATA_LEN		64
+
+/* Output TD report data length after TDX_CMD_GET_TDREPORT IOCTL execution */
+#define TDX_TDREPORT_LEN		1024
+
+/*
+ * TDX_CMD_GET_TDREPORT IOCTL is used to get TDREPORT data from the TDX
+ * Module. Users should pass report data of size TDX_REPORT_DATA_LEN bytes
+ * via user input buffer of size TDX_TDREPORT_LEN. Once IOCTL is successful
+ * TDREPORT data is copied to the user buffer.
+ */
+#define TDX_CMD_GET_TDREPORT		_IOWR('T', 0x01, __u64)
+
+/*
+ * TDX_CMD_GEN_QUOTE IOCTL is used to request TD QUOTE from the VMM. User
+ * should pass TD report data of size TDX_TDREPORT_LEN bytes via user input
+ * buffer of quote size. Once IOCTL is successful quote data is copied back to
+ * the user buffer.
+ */
+#define TDX_CMD_GEN_QUOTE		_IOR('T', 0x02, __u64)
+
+/*
+ * TDX_CMD_GET_QUOTE_SIZE IOCTL is used to get the TD Quote size info in bytes.
+ * This will be used for determining the input buffer allocation size when
+ * using TDX_CMD_GEN_QUOTE IOCTL.
+ */
+#define TDX_CMD_GET_QUOTE_SIZE		_IOR('T', 0x03, __u64)
+
+struct tdx_gen_quote {
+	void *buf __user;
+	size_t len;
+};
+
+#endif /* _UAPI_MISC_TDX_H */
-- 
2.25.1

