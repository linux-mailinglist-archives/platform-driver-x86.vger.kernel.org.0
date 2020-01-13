Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 623FC13929A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Jan 2020 14:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728950AbgAMN4j (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Jan 2020 08:56:39 -0500
Received: from mga18.intel.com ([134.134.136.126]:28793 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728920AbgAMN4h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Jan 2020 08:56:37 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 05:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
   d="scan'208";a="255892043"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 13 Jan 2020 05:56:33 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 27B697C4; Mon, 13 Jan 2020 15:56:25 +0200 (EET)
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
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 26/36] mfd: intel_soc_pmic: Add SCU IPC member to struct intel_soc_pmic
Date:   Mon, 13 Jan 2020 16:56:13 +0300
Message-Id: <20200113135623.56286-27-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Both PMIC drivers (intel_soc_pmic_mrfld and intel_soc_pmic_bxtwc) will
be using this field going forward to access the SCU IPC instance.

While there add kernel-doc for the intel_soc_pmic structure.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/mfd/intel_soc_pmic.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/mfd/intel_soc_pmic.h b/include/linux/mfd/intel_soc_pmic.h
index bfecd6bd4990..bda22d750be6 100644
--- a/include/linux/mfd/intel_soc_pmic.h
+++ b/include/linux/mfd/intel_soc_pmic.h
@@ -13,6 +13,20 @@
 
 #include <linux/regmap.h>
 
+/**
+ * struct intel_soc_pmic - Intel SoC PMIC data
+ * @irq: Interrupt number
+ * @regmap: Pointer to the regmap structure
+ * @irq_chip_data: IRQ chip data for the PMIC itself
+ * @irq_chip_data_pwrbtn: Chained IRQ chip data for the power button
+ * @irq_chip_data_tmu: Chained IRQ chip data for the TMU
+ * @irq_chip_data_bcu: Chained IRQ chip data for the BCU
+ * @irq_chip_data_adc: Chained IRQ chip data for the ADC
+ * @irq_chip_data_chgr: Chained IRQ chip data for the CHGR
+ * @irq_chip_data_crit: Chained IRQ chip data for the CRIT
+ * @dev: Pointer to the PMIC device
+ * @scu: SCU IPC pointer used for IPC operations
+ */
 struct intel_soc_pmic {
 	int irq;
 	struct regmap *regmap;
@@ -24,6 +38,7 @@ struct intel_soc_pmic {
 	struct regmap_irq_chip_data *irq_chip_data_chgr;
 	struct regmap_irq_chip_data *irq_chip_data_crit;
 	struct device *dev;
+	struct intel_scu_ipc_dev *scu;
 };
 
 int intel_soc_pmic_exec_mipi_pmic_seq_element(u16 i2c_address, u32 reg_address,
-- 
2.24.1

