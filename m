Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1566144147
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jan 2020 17:02:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729742AbgAUQB6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Jan 2020 11:01:58 -0500
Received: from mga14.intel.com ([192.55.52.115]:35492 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729662AbgAUQBs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jan 2020 11:01:48 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 Jan 2020 08:01:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; 
   d="scan'208";a="219998888"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 21 Jan 2020 08:01:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 30431591; Tue, 21 Jan 2020 18:01:15 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Brown <broonie@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/38] platform/x86: intel_scu_ipc: Drop intel_scu_ipc_raw_command()
Date:   Tue, 21 Jan 2020 19:00:47 +0300
Message-Id: <20200121160114.60007-12-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There is no user for this function so we can drop it from the driver.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h |  2 -
 drivers/platform/x86/intel_scu_ipc.c | 63 ----------------------------
 2 files changed, 65 deletions(-)

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index b59afa59a4cb..2a1442ba6e78 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -38,8 +38,6 @@ int intel_scu_ipc_update_register(u16 addr, u8 data, u8 mask);
 int intel_scu_ipc_simple_command(int cmd, int sub);
 int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 			  u32 *out, int outlen);
-int intel_scu_ipc_raw_command(int cmd, int sub, u8 *in, int inlen,
-			      u32 *out, int outlen, u32 dptr, u32 sptr);
 
 extern struct blocking_notifier_head intel_scu_notifier;
 
diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index ba857e54800b..93a810fa6c8a 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -383,69 +383,6 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 }
 EXPORT_SYMBOL(intel_scu_ipc_command);
 
-#define IPC_SPTR		0x08
-#define IPC_DPTR		0x0C
-
-/**
- * intel_scu_ipc_raw_command() - IPC command with data and pointers
- * @cmd:	IPC command code.
- * @sub:	IPC command sub type.
- * @in:		input data of this IPC command.
- * @inlen:	input data length in dwords.
- * @out:	output data of this IPC command.
- * @outlen:	output data length in dwords.
- * @sptr:	data writing to SPTR register.
- * @dptr:	data writing to DPTR register.
- *
- * Send an IPC command to SCU with input/output data and source/dest pointers.
- *
- * Return:	an IPC error code or 0 on success.
- */
-int intel_scu_ipc_raw_command(int cmd, int sub, u8 *in, int inlen,
-			      u32 *out, int outlen, u32 dptr, u32 sptr)
-{
-	struct intel_scu_ipc_dev *scu = &ipcdev;
-	int inbuflen = DIV_ROUND_UP(inlen, 4);
-	u32 inbuf[4];
-	int i, err;
-
-	/* Up to 16 bytes */
-	if (inbuflen > 4)
-		return -EINVAL;
-
-	mutex_lock(&ipclock);
-	if (scu->dev == NULL) {
-		mutex_unlock(&ipclock);
-		return -ENODEV;
-	}
-
-	writel(dptr, scu->ipc_base + IPC_DPTR);
-	writel(sptr, scu->ipc_base + IPC_SPTR);
-
-	/*
-	 * SRAM controller doesn't support 8-bit writes, it only
-	 * supports 32-bit writes, so we have to copy input data into
-	 * the temporary buffer, and SCU FW will use the inlen to
-	 * determine the actual input data length in the temporary
-	 * buffer.
-	 */
-	memcpy(inbuf, in, inlen);
-
-	for (i = 0; i < inbuflen; i++)
-		ipc_data_writel(scu, inbuf[i], 4 * i);
-
-	ipc_command(scu, (inlen << 16) | (sub << 12) | cmd);
-	err = intel_scu_ipc_check_status(scu);
-	if (!err) {
-		for (i = 0; i < outlen; i++)
-			*out++ = ipc_data_readl(scu, 4 * i);
-	}
-
-	mutex_unlock(&ipclock);
-	return err;
-}
-EXPORT_SYMBOL_GPL(intel_scu_ipc_raw_command);
-
 /*
  * Interrupt handler gets called when ioc bit of IPC_COMMAND_REG set to 1
  * When ioc bit is set to 1, caller api must wait for interrupt handler called
-- 
2.24.1

