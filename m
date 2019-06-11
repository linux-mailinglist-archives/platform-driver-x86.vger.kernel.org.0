Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 559313C90C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jun 2019 12:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729079AbfFKKdk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 06:33:40 -0400
Received: from mga01.intel.com ([192.55.52.88]:37334 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729073AbfFKKdk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 06:33:40 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jun 2019 03:33:40 -0700
X-ExtLoop1: 1
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.158])
  by orsmga005.jf.intel.com with ESMTP; 11 Jun 2019 03:33:38 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 2/2] x86/platform/intel-mid: Do not create conflicting platform device
Date:   Tue, 11 Jun 2019 13:33:30 +0300
Message-Id: <20190611103330.21306-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611103330.21306-1-jarkko.nikula@linux.intel.com>
References: <20190611103330.21306-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Do not create "pinctrl-merrifield" platform device on platforms having
ACPI device "INTC1002". That device represents the same device leading
to failures in drivers/pinctrl/intel/pinctrl-merrifield.c and
drivers/gpio/gpio-merrifield.c if "pinctrl-merrifield" is probed first.

Fix this by not creating the "pinctrl-merrifield" in case ACPI device
"INTC1002" is present.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 .../platform/intel-mid/device_libs/platform_mrfld_pinctrl.c   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c b/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c
index 43f801b66c1a..5e87f7f90f29 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c
@@ -11,6 +11,7 @@
  * of the License.
  */
 
+#include <linux/acpi.h>
 #include <linux/init.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
@@ -35,7 +36,8 @@ static struct platform_device mrfld_pinctrl_device = {
 
 static int __init mrfld_pinctrl_init(void)
 {
-	if (intel_mid_identify_cpu() == INTEL_MID_CPU_CHIP_TANGIER)
+	if (intel_mid_identify_cpu() == INTEL_MID_CPU_CHIP_TANGIER &&
+	    !acpi_dev_found("INTC1002"))
 		return platform_device_register(&mrfld_pinctrl_device);
 
 	return -ENODEV;
-- 
2.20.1

