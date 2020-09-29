Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD1FF27B912
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Sep 2020 02:53:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgI2Axc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 28 Sep 2020 20:53:32 -0400
Received: from mga12.intel.com ([192.55.52.136]:33682 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgI2Ax3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 28 Sep 2020 20:53:29 -0400
IronPort-SDR: LpGccOWwAUcN6lma2U6FgSUlmJwUKUDaVdKEovlUggZfk75G+wDDRus+g2S2q/68qMwILGffw4
 hDSDKqLmGyZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="141490955"
X-IronPort-AV: E=Sophos;i="5.77,316,1596524400"; 
   d="scan'208";a="141490955"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2020 17:53:28 -0700
IronPort-SDR: lRYzHIje/dWR5cEmcodhASPg9/5tYxt3aHLn+WWeot7JSxaShv5fWWdfWXFmg8iuRVCp+n7nCQ
 h+xb+EvFZiHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,316,1596524400"; 
   d="scan'208";a="384617536"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP; 28 Sep 2020 17:53:28 -0700
Received: from debox1-desk2.jf.intel.com (debox1-desk2.jf.intel.com [10.54.75.16])
        by linux.intel.com (Postfix) with ESMTP id 5289F580266;
        Mon, 28 Sep 2020 17:53:28 -0700 (PDT)
From:   "David E. Box" <david.e.box@linux.intel.com>
To:     lee.jones@linaro.org, david.e.box@linux.intel.com,
        dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com,
        alexander.h.duyck@linux.intel.com, hdegoede@redhat.com,
        alexey.budankov@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH V6 1/5] PCI: Add defines for Designated Vendor-Specific Extended Capability
Date:   Mon, 28 Sep 2020 17:53:16 -0700
Message-Id: <20200929005320.14739-2-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200929005320.14739-1-david.e.box@linux.intel.com>
References: <20200929005320.14739-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add PCIe Designated Vendor-Specific Extended Capability (DVSEC) and defines
for the header offsets. Defined in PCIe r5.0, sec 7.9.6.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 include/uapi/linux/pci_regs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/linux/pci_regs.h b/include/uapi/linux/pci_regs.h
index f9701410d3b5..beafeee39e44 100644
--- a/include/uapi/linux/pci_regs.h
+++ b/include/uapi/linux/pci_regs.h
@@ -720,6 +720,7 @@
 #define PCI_EXT_CAP_ID_DPC	0x1D	/* Downstream Port Containment */
 #define PCI_EXT_CAP_ID_L1SS	0x1E	/* L1 PM Substates */
 #define PCI_EXT_CAP_ID_PTM	0x1F	/* Precision Time Measurement */
+#define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
 #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
 #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 GT/s */
 #define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
@@ -1062,6 +1063,10 @@
 #define  PCI_L1SS_CTL1_LTR_L12_TH_SCALE	0xe0000000  /* LTR_L1.2_THRESHOLD_Scale */
 #define PCI_L1SS_CTL2		0x0c	/* Control 2 Register */
 
+/* Designated Vendor-Specific (DVSEC, PCI_EXT_CAP_ID_DVSEC) */
+#define PCI_DVSEC_HEADER1		0x4 /* Designated Vendor-Specific Header1 */
+#define PCI_DVSEC_HEADER2		0x8 /* Designated Vendor-Specific Header2 */
+
 /* Data Link Feature */
 #define PCI_DLF_CAP		0x04	/* Capabilities Register */
 #define  PCI_DLF_EXCHANGE_ENABLE	0x80000000  /* Data Link Feature Exchange Enable */
-- 
2.20.1

