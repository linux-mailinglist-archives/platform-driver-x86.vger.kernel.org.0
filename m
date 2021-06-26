Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FD2F3B4F1D
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Jun 2021 17:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFZPOT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 26 Jun 2021 11:14:19 -0400
Received: from mga14.intel.com ([192.55.52.115]:22924 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230098AbhFZPOR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Jun 2021 11:14:17 -0400
IronPort-SDR: RVd6HZG5qs76LUAHBhvEDh9TGJNhw30GpEscNZYK+Fm+PCNqJxe/VT7heAatnjIvZBzLgADwK+
 Tu7lRFNCM4vw==
X-IronPort-AV: E=McAfee;i="6200,9189,10027"; a="207613934"
X-IronPort-AV: E=Sophos;i="5.83,301,1616482800"; 
   d="scan'208";a="207613934"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2021 08:11:55 -0700
X-IronPort-AV: E=Sophos;i="5.83,301,1616482800"; 
   d="scan'208";a="642895562"
Received: from mlubyani-mobl2.amr.corp.intel.com (HELO skuppusw-desk1.amr.corp.intel.com) ([10.254.8.25])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2021 08:11:54 -0700
From:   Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>
Cc:     Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 5/6] platform/x86: intel_tdx_attest: Add TDX Guest attestation interface driver
Date:   Sat, 26 Jun 2021 08:11:45 -0700
Message-Id: <f23e348d7fe48c5e926fb8cfa02a33726835a950.1624719668.git.sathyanarayanan.kuppuswamy@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1624719668.git.sathyanarayanan.kuppuswamy@linux.intel.com>
References: <cover.1624719668.git.sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <mgross@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Reviewed-by: Andi Kleen <ak@linux.intel.com>
Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
---
 drivers/platform/x86/Kconfig            |   9 ++
 drivers/platform/x86/Makefile           |   1 +
 drivers/platform/x86/intel_tdx_attest.c | 171 ++++++++++++++++++++++++
 include/uapi/misc/tdx.h                 |  20 +++
 4 files changed, 201 insertions(+)
 create mode 100644 drivers/platform/x86/intel_tdx_attest.c
 create mode 100644 include/uapi/misc/tdx.h

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 60592fb88e7a..7d01c473aef6 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1301,6 +1301,15 @@ config INTEL_SCU_IPC_UTIL
 	  low level access for debug work and updating the firmware. Say
 	  N unless you will be doing this on an Intel MID platform.
 
+config INTEL_TDX_ATTESTATION
+	tristate "Intel TDX attestation driver"
+	depends on INTEL_TDX_GUEST
+	help
+	  The TDX attestation driver provides IOCTL or MMAP interfaces to
+	  the user to request TDREPORT from the TDX module or request quote
+	  from VMM. It is mainly used to get secure disk decryption keys from
+	  the key server.
+
 config INTEL_TELEMETRY
 	tristate "Intel SoC Telemetry Driver"
 	depends on X86_64
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index dcc8cdb95b4d..83439990ae47 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -138,6 +138,7 @@ obj-$(CONFIG_INTEL_SCU_PCI)		+= intel_scu_pcidrv.o
 obj-$(CONFIG_INTEL_SCU_PLATFORM)	+= intel_scu_pltdrv.o
 obj-$(CONFIG_INTEL_SCU_WDT)		+= intel_scu_wdt.o
 obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
+obj-$(CONFIG_INTEL_TDX_ATTESTATION)	+= intel_tdx_attest.o
 obj-$(CONFIG_INTEL_TELEMETRY)		+= intel_telemetry_core.o \
 					   intel_telemetry_pltdrv.o \
 					   intel_telemetry_debugfs.o
diff --git a/drivers/platform/x86/intel_tdx_attest.c b/drivers/platform/x86/intel_tdx_attest.c
new file mode 100644
index 000000000000..a0225d053851
--- /dev/null
+++ b/drivers/platform/x86/intel_tdx_attest.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * intel_tdx_attest.c - TDX guest attestation interface driver.
+ *
+ * Implements user interface to trigger attestation process and
+ * read the TD Quote result.
+ *
+ * Copyright (C) 2020 Intel Corporation
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
+#include <linux/io.h>
+#include <asm/apic.h>
+#include <asm/tdx.h>
+#include <asm/irq_vectors.h>
+#include <uapi/misc/tdx.h>
+
+#define VERSION				"1.0"
+
+/* Used in Quote memory allocation */
+#define QUOTE_SIZE			(2 * PAGE_SIZE)
+
+/* Mutex to synchronize attestation requests */
+static DEFINE_MUTEX(attestation_lock);
+/* Completion object to track attestation status */
+static DECLARE_COMPLETION(attestation_done);
+
+static void attestation_callback_handler(void)
+{
+	complete(&attestation_done);
+}
+
+static long tdg_attest_ioctl(struct file *file, unsigned int cmd,
+			     unsigned long arg)
+{
+	u64 data = virt_to_phys(file->private_data);
+	void __user *argp = (void __user *)arg;
+	u8 *reportdata;
+	long ret = 0;
+
+	mutex_lock(&attestation_lock);
+
+	reportdata = kzalloc(TDX_TDREPORT_LEN, GFP_KERNEL);
+	if (!reportdata) {
+		mutex_unlock(&attestation_lock);
+		return -ENOMEM;
+	}
+
+	switch (cmd) {
+	case TDX_CMD_GET_TDREPORT:
+		if (copy_from_user(reportdata, argp, TDX_REPORT_DATA_LEN)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		/* Generate TDREPORT_STRUCT */
+		if (tdx_mcall_tdreport(data, virt_to_phys(reportdata))) {
+			ret = -EIO;
+			break;
+		}
+
+		if (copy_to_user(argp, file->private_data, TDX_TDREPORT_LEN))
+			ret = -EFAULT;
+		break;
+	case TDX_CMD_GEN_QUOTE:
+		if (copy_from_user(reportdata, argp, TDX_REPORT_DATA_LEN)) {
+			ret = -EFAULT;
+			break;
+		}
+
+		/* Generate TDREPORT_STRUCT */
+		if (tdx_mcall_tdreport(data, virt_to_phys(reportdata))) {
+			ret = -EIO;
+			break;
+		}
+
+		ret = set_memory_decrypted((unsigned long)file->private_data,
+					   1UL << get_order(QUOTE_SIZE));
+		if (ret)
+			break;
+
+		/* Submit GetQuote Request */
+		if (tdx_hcall_get_quote(data)) {
+			ret = -EIO;
+			goto done;
+		}
+
+		/* Wait for attestation completion */
+		wait_for_completion_interruptible(&attestation_done);
+
+		if (copy_to_user(argp, file->private_data, QUOTE_SIZE))
+			ret = -EFAULT;
+done:
+		ret = set_memory_encrypted((unsigned long)file->private_data,
+					   1UL << get_order(QUOTE_SIZE));
+
+		break;
+	case TDX_CMD_GET_QUOTE_SIZE:
+		if (put_user(QUOTE_SIZE, (u64 __user *)argp))
+			ret = -EFAULT;
+
+		break;
+	default:
+		pr_err("cmd %d not supported\n", cmd);
+		break;
+	}
+
+	mutex_unlock(&attestation_lock);
+
+	kfree(reportdata);
+
+	return ret;
+}
+
+static int tdg_attest_open(struct inode *inode, struct file *file)
+{
+	/*
+	 * Currently tdg_event_notify_handler is only used in attestation
+	 * driver. But, WRITE_ONCE is used as benign data race notice.
+	 */
+	WRITE_ONCE(tdg_event_notify_handler, attestation_callback_handler);
+
+	file->private_data = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
+						      get_order(QUOTE_SIZE));
+
+	return !file->private_data ? -ENOMEM : 0;
+}
+
+static int tdg_attest_release(struct inode *inode, struct file *file)
+{
+	/*
+	 * Currently tdg_event_notify_handler is only used in attestation
+	 * driver. But, WRITE_ONCE is used as benign data race notice.
+	 */
+	WRITE_ONCE(tdg_event_notify_handler, NULL);
+	free_pages((unsigned long)file->private_data, get_order(QUOTE_SIZE));
+	file->private_data = NULL;
+
+	return 0;
+}
+
+static const struct file_operations tdg_attest_fops = {
+	.owner		= THIS_MODULE,
+	.open		= tdg_attest_open,
+	.release	= tdg_attest_release,
+	.unlocked_ioctl	= tdg_attest_ioctl,
+	.llseek		= no_llseek,
+};
+
+static struct miscdevice tdg_attest_device = {
+	.minor          = MISC_DYNAMIC_MINOR,
+	.name           = "tdx-attest",
+	.fops           = &tdg_attest_fops,
+};
+module_misc_device(tdg_attest_device);
+
+MODULE_AUTHOR("Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>");
+MODULE_DESCRIPTION("TDX attestation driver ver " VERSION);
+MODULE_VERSION(VERSION);
+MODULE_LICENSE("GPL");
diff --git a/include/uapi/misc/tdx.h b/include/uapi/misc/tdx.h
new file mode 100644
index 000000000000..9afbef9079c1
--- /dev/null
+++ b/include/uapi/misc/tdx.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_MISC_TDX_H
+#define _UAPI_MISC_TDX_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/* Input report data length for TDX_CMD_GET_TDREPORT IOCTL request */
+#define TDX_REPORT_DATA_LEN		64
+/* Output report data length after TDX_CMD_GET_TDREPORT IOCTL execution */
+#define TDX_TDREPORT_LEN		1024
+
+/* IOCTL to request TDREPORT data from TDX Module */
+#define TDX_CMD_GET_TDREPORT		_IOWR('T', 0x01, __u64)
+/* IOCTL to request Quote from VMM using report data */
+#define TDX_CMD_GEN_QUOTE		_IOR('T', 0x02, __u64)
+/* Get current size of quote */
+#define TDX_CMD_GET_QUOTE_SIZE		_IOR('T', 0x03, __u64)
+
+#endif /* _UAPI_MISC_TDX_H */
-- 
2.25.1

