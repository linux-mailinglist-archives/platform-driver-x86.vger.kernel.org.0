Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19E4E175BC3
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Mar 2020 14:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728068AbgCBNdi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 2 Mar 2020 08:33:38 -0500
Received: from mga04.intel.com ([192.55.52.120]:33076 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728057AbgCBNdi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Mar 2020 08:33:38 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 02 Mar 2020 05:33:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,507,1574150400"; 
   d="scan'208";a="273721404"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 02 Mar 2020 05:33:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 03A6F81C; Mon,  2 Mar 2020 15:33:28 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/19] mfd: intel_soc_pmic_mrfld: Convert to use new SCU IPC API
Date:   Mon,  2 Mar 2020 16:33:20 +0300
Message-Id: <20200302133327.55929-13-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
References: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This converts the Intel Merrifield PMIC driver over the new SCU IPC API
where the SCU IPC instance is passed to the functions.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/intel_soc_pmic_mrfld.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/intel_soc_pmic_mrfld.c b/drivers/mfd/intel_soc_pmic_mrfld.c
index 26a1551c5faf..bd94c989d232 100644
--- a/drivers/mfd/intel_soc_pmic_mrfld.c
+++ b/drivers/mfd/intel_soc_pmic_mrfld.c
@@ -74,10 +74,11 @@ static const struct mfd_cell bcove_dev[] = {
 static int bcove_ipc_byte_reg_read(void *context, unsigned int reg,
 				    unsigned int *val)
 {
+	struct intel_soc_pmic *pmic = context;
 	u8 ipc_out;
 	int ret;
 
-	ret = intel_scu_ipc_ioread8(reg, &ipc_out);
+	ret = intel_scu_ipc_dev_ioread8(pmic->scu, reg, &ipc_out);
 	if (ret)
 		return ret;
 
@@ -88,10 +89,11 @@ static int bcove_ipc_byte_reg_read(void *context, unsigned int reg,
 static int bcove_ipc_byte_reg_write(void *context, unsigned int reg,
 				     unsigned int val)
 {
+	struct intel_soc_pmic *pmic = context;
 	u8 ipc_in = val;
 	int ret;
 
-	ret = intel_scu_ipc_iowrite8(reg, ipc_in);
+	ret = intel_scu_ipc_dev_iowrite8(pmic->scu, reg, ipc_in);
 	if (ret)
 		return ret;
 
@@ -117,6 +119,10 @@ static int bcove_probe(struct platform_device *pdev)
 	if (!pmic)
 		return -ENOMEM;
 
+	pmic->scu = devm_intel_scu_ipc_dev_get(dev);
+	if (!pmic->scu)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, pmic);
 	pmic->dev = &pdev->dev;
 
-- 
2.25.0

