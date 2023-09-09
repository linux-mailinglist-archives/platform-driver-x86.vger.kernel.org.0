Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1EAD799994
	for <lists+platform-driver-x86@lfdr.de>; Sat,  9 Sep 2023 18:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbjIIQZV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 9 Sep 2023 12:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346354AbjIIOTf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Sep 2023 10:19:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A368ECF8
        for <platform-driver-x86@vger.kernel.org>; Sat,  9 Sep 2023 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694269111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rnxkLsCINqMPfSaGEWxFyft4/YO//SJ+C30Us/G2fno=;
        b=hJYj3FlvEkIqFOQpX8s0aP9G5aFukEaGx6epB0dnXgI7QD8KSNw8feno3o+T6/wGI9hUpp
        rk3rnA92Lrm5/Rkf/5YSm6rfX03Y+EHpWVpLS3A/S+ICO21z3S9wyF1gHcGYDrluF8B0o2
        eGHQR8UZtM7xs1a8vxt2onZeLEyFe8o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-_0qrgjEiO0OCDhaD-gb5pg-1; Sat, 09 Sep 2023 10:18:26 -0400
X-MC-Unique: _0qrgjEiO0OCDhaD-gb5pg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E43F43C02536;
        Sat,  9 Sep 2023 14:18:25 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CAF0614171B6;
        Sat,  9 Sep 2023 14:18:24 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [PATCH 2/8] gpiolib: acpi: Add a ignore interrupt quirk for Peaq C1010
Date:   Sat,  9 Sep 2023 16:18:10 +0200
Message-ID: <20230909141816.58358-3-hdegoede@redhat.com>
In-Reply-To: <20230909141816.58358-1-hdegoede@redhat.com>
References: <20230909141816.58358-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On the Peaq C1010 2-in-1 INT33FC:00 pin 3 is connected to
a "dolby" button. At the ACPI level an _AEI event-handler
is connected which sets an ACPI variable to 1 on both
edges. This variable can be polled + cleared to 0 using WMI.

Since the variable is set on both edges the WMI interface is pretty
useless even when polling. So instead of writing a custom WMI
driver for this the x86-android-tablets code instantiates
a gpio-keys platform device for the "dolby" button.

Add an ignore_interrupt quirk for INT33FC:00 pin 3 on the Peaq C1010,
so that it is not seen as busy when the gpio-keys driver requests it.

Note this replaces a hack in x86-android-tablets where it would
call acpi_gpiochip_free_interrupts() on the INT33FC:00 GPIO
controller. acpi_gpiochip_free_interrupts() is considered private
(internal) gpiolib API so x86-android-tablets should stop using it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpiolib-acpi.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 80b9650a2424..583ac5da9d41 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -1654,6 +1654,26 @@ static const struct dmi_system_id gpiolib_acpi_quirks[] __initconst = {
 			.ignore_wake = "SYNA1202:00@16",
 		},
 	},
+	{
+		/*
+		 * On the Peaq C1010 2-in-1 INT33FC:00 pin 3 is connected to
+		 * a "dolby" button. At the ACPI level an _AEI event-handler
+		 * is connected which sets an ACPI variable to 1 on both
+		 * edges. This variable can be polled + cleared to 0 using
+		 * WMI. But since the variable is set on both edges the WMI
+		 * interface is pretty useless even when polling.
+		 * So instead the x86-android-tablets code instantiates
+		 * a gpio-keys platform device for it.
+		 * Ignore the _AEI handler for the pin, so that it is not busy.
+		 */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PEAQ"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "PEAQ PMM C1010 MD99187"),
+		},
+		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+			.ignore_interrupt = "INT33FC:00@3",
+		},
+	},
 	{} /* Terminating entry */
 };
 
-- 
2.41.0

