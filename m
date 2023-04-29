Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 123006F2591
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Apr 2023 20:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbjD2SQt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Apr 2023 14:16:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229848AbjD2SQs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 14:16:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFB61BFA
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 11:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682792166;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YHkZsN4H3G29PQz7rc5hMn6agRSIwM+6boMjkzcTKtU=;
        b=i0VT5fv4YkWhxLWYfSKJjnXjqh7vIUfBALCzv9u7edVebXahNxAgl54Sqk4fjznrk1uStS
        zQdr+zhBBk0vsP6/mvK4d7/7eMNtPc+nMThNKY0tBgDeLJwS7qeYIjsCyHHWU5YRAQYEw2
        epLogCSyBAbBUktJkdyPww0ohHRiSRI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-Ct0V2duRPHKhddz7BNVXQg-1; Sat, 29 Apr 2023 14:16:04 -0400
X-MC-Unique: Ct0V2duRPHKhddz7BNVXQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A93C9185A78B;
        Sat, 29 Apr 2023 18:16:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8FC6B2027043;
        Sat, 29 Apr 2023 18:16:02 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH 02/19] platform/x86: lenovo-yogabook: Fix work race on remove()
Date:   Sat, 29 Apr 2023 20:15:34 +0200
Message-Id: <20230429181551.98201-3-hdegoede@redhat.com>
In-Reply-To: <20230429181551.98201-1-hdegoede@redhat.com>
References: <20230429181551.98201-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When yogabook_wmi_remove() runs yogabook_wmi_work might still be running
and using the devices which yogabook_wmi_remove() puts.

To avoid this move to explicitly cancelling the work rather then using
devm_work_autocancel().

This requires also making the yogabook_backside_hall_irq handler non
devm managed, so that it cannot re-queue the work while
yogabook_wmi_remove() runs.

Fixes: c0549b72d99d ("platform/x86: lenovo-yogabook-wmi: Add driver for Lenovo Yoga Book")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/lenovo-yogabook-wmi.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
index 5f4bd1eec38a..c12486702f33 100644
--- a/drivers/platform/x86/lenovo-yogabook-wmi.c
+++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
@@ -248,10 +248,7 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 	data->brightness = YB_KBD_BL_DEFAULT;
 	set_bit(YB_KBD_IS_ON, &data->flags);
 	set_bit(YB_DIGITIZER_IS_ON, &data->flags);
-
-	r = devm_work_autocancel(&wdev->dev, &data->work, yogabook_wmi_work);
-	if (r)
-		return r;
+	INIT_WORK(&data->work, yogabook_wmi_work);
 
 	data->kbd_adev = acpi_dev_get_first_match_dev("GDIX1001", NULL, -1);
 	if (!data->kbd_adev) {
@@ -299,10 +296,9 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 	}
 	data->backside_hall_irq = r;
 
-	r = devm_request_irq(&wdev->dev, data->backside_hall_irq,
-			     yogabook_backside_hall_irq,
-			     IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
-			     "backside_hall_sw", data);
+	r = request_irq(data->backside_hall_irq, yogabook_backside_hall_irq,
+			IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+			"backside_hall_sw", data);
 	if (r) {
 		dev_err_probe(&wdev->dev, r, "Requesting backside_hall_sw IRQ\n");
 		goto error_put_devs;
@@ -318,11 +314,14 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 	r = devm_led_classdev_register(&wdev->dev, &data->kbd_bl_led);
 	if (r < 0) {
 		dev_err_probe(&wdev->dev, r, "Registering backlight LED device\n");
-		goto error_put_devs;
+		goto error_free_irq;
 	}
 
 	return 0;
 
+error_free_irq:
+	free_irq(data->backside_hall_irq, data);
+	cancel_work_sync(&data->work);
 error_put_devs:
 	put_device(data->dig_dev);
 	put_device(data->kbd_dev);
@@ -335,6 +334,8 @@ static void yogabook_wmi_remove(struct wmi_device *wdev)
 {
 	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
 
+	free_irq(data->backside_hall_irq, data);
+	cancel_work_sync(&data->work);
 	put_device(data->dig_dev);
 	put_device(data->kbd_dev);
 	acpi_dev_put(data->dig_adev);
-- 
2.39.2

