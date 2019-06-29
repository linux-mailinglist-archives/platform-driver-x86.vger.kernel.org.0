Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABA7B5A9E1
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Jun 2019 11:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbfF2Jlj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Jun 2019 05:41:39 -0400
Received: from mx2.suse.de ([195.135.220.15]:50824 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726818AbfF2Jli (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Jun 2019 05:41:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A48B1AEC7;
        Sat, 29 Jun 2019 09:41:37 +0000 (UTC)
Date:   Sat, 29 Jun 2019 11:41:36 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     platform-driver-x86@vger.kernel.org
Cc:     "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: [PATCH] x86: apuv2: Fix softdep statement
Message-ID: <20190629114136.45e90292@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Only one MODULE_SOFTDEP statement is allowed per module. Multiple
dependencies must be expressed in a single statement.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
---
 drivers/platform/x86/pcengines-apuv2.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

--- linux-5.1.orig/drivers/platform/x86/pcengines-apuv2.c	2019-05-06 02:42:58.000000000 +0200
+++ linux-5.1/drivers/platform/x86/pcengines-apuv2.c	2019-06-29 11:37:48.062005738 +0200
@@ -255,6 +255,4 @@ MODULE_DESCRIPTION("PC Engines APUv2/APU
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
 MODULE_ALIAS("platform:pcengines-apuv2");
-MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME);
-MODULE_SOFTDEP("pre: platform:leds-gpio");
-MODULE_SOFTDEP("pre: platform:gpio_keys_polled");
+MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");


-- 
Jean Delvare
SUSE L3 Support
