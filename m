Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC7FE3C90B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jun 2019 12:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729054AbfFKKdj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 06:33:39 -0400
Received: from mga01.intel.com ([192.55.52.88]:37334 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfFKKdj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 06:33:39 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Jun 2019 03:33:38 -0700
X-ExtLoop1: 1
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.158])
  by orsmga005.jf.intel.com with ESMTP; 11 Jun 2019 03:33:34 -0700
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/2] x86/platform/intel-mid: Create pinctrl platform device at later initcall
Date:   Tue, 11 Jun 2019 13:33:29 +0300
Message-Id: <20190611103330.21306-1-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Postpone "pinctrl-merrifield" platform device creation later than
subsys_initcall. This is preparation for an another patch that does ACPI
namespace walk which is not possible yet at subsys_initcall phase.

Currently if kernel is built with ACPI support and platform has the ACPI
device "INTC1002" with the same MMIO resources than "pinctrl-merrifield"
platform device then these devices conflict and typically probing of
"INTC1002" will fail in drivers/pinctrl/intel/pinctrl-merrifield.c due
conflicting resources:

[    0.873523] pinctrl-merrifield INTC1002:00: can't request region for resource [mem 0xff0c0000-0xff0c7fff]
[    0.879464] pinctrl-merrifield: probe of INTC1002:00 failed with error -16

Moreover also dependent drivers/gpio/gpio-merrifield.c will fail to
probe due it tries to bind with pinctrl device named after "INTC1002"
rather than "pinctrl-merrifield" when "INTC1002" is present in ACPI tables:

[    5.825231] gpio gpiochip0: (0000:00:0c.0): could not create pin range
[    5.825710] gpio-merrifield 0000:00:0c.0: failed to add GPIO pin range

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
Andy: I'm not sure is this with the next patch the right fix or would it be
possible to just delete this "pinctrl-merrifield" initialization filei? I
went to this path since I don't know are there platforms without
"INTC1002" in their ACPI tables or do some users want to run non-ACPI
kernels.
---
 .../x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c b/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c
index 4de8a664e6a1..43f801b66c1a 100644
--- a/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c
+++ b/arch/x86/platform/intel-mid/device_libs/platform_mrfld_pinctrl.c
@@ -40,4 +40,4 @@ static int __init mrfld_pinctrl_init(void)
 
 	return -ENODEV;
 }
-arch_initcall(mrfld_pinctrl_init);
+device_initcall(mrfld_pinctrl_init);
-- 
2.20.1

