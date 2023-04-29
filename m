Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0123D6F259E
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Apr 2023 20:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjD2SRE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Apr 2023 14:17:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbjD2SRD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 14:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9770E1BEF
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 11:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682792173;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oz4KO3+uxpqK+I2MFg3l3I+tW/82/aRp7KvnPl4qUEU=;
        b=fG6aR+JVPxuuW4/7HMBCsvHfS7T6G4RequZE49BEZ4qXqgfQ6rJI01gheWDBgZV8BX00ZC
        dRXTVF9KzZEd0BhUgVsGmZ6r4530HjKXAVECb69s4oTEw4Y0KCuheP4WtqlgQckuSWV6BF
        3M12+wHNQUYWxMDowBbMRbYSoZjZUpc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-269-3ZkQdGwWOZuZpb5AkuKsGw-1; Sat, 29 Apr 2023 14:16:08 -0400
X-MC-Unique: 3ZkQdGwWOZuZpb5AkuKsGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9BBC185A588;
        Sat, 29 Apr 2023 18:16:07 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7F13E2027043;
        Sat, 29 Apr 2023 18:16:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH 05/19] platform/x86: lenovo-yogabook: Simplify gpio lookup table cleanup
Date:   Sat, 29 Apr 2023 20:15:37 +0200
Message-Id: <20230429181551.98201-6-hdegoede@redhat.com>
In-Reply-To: <20230429181551.98201-1-hdegoede@redhat.com>
References: <20230429181551.98201-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

After the devm_gpiod_get("backside_hall_sw") call the gpio lookup table
is no longer necessary.

Remove it directly after this call instead using a devm reset-action
for this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/lenovo-yogabook-wmi.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
index 727e3ae5e8f5..62db455218a5 100644
--- a/drivers/platform/x86/lenovo-yogabook-wmi.c
+++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
@@ -228,11 +228,6 @@ static struct gpiod_lookup_table yogabook_wmi_gpios = {
 	},
 };
 
-static void yogabook_wmi_rm_gpio_lookup(void *unused)
-{
-	gpiod_remove_lookup_table(&yogabook_wmi_gpios);
-}
-
 static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct yogabook_wmi *data;
@@ -276,13 +271,9 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 	}
 
 	gpiod_add_lookup_table(&yogabook_wmi_gpios);
+	data->backside_hall_gpio = devm_gpiod_get(&wdev->dev, "backside_hall_sw", GPIOD_IN);
+	gpiod_remove_lookup_table(&yogabook_wmi_gpios);
 
-	r = devm_add_action_or_reset(&wdev->dev, yogabook_wmi_rm_gpio_lookup, NULL);
-	if (r)
-		goto error_put_devs;
-
-	data->backside_hall_gpio =
-		devm_gpiod_get(&wdev->dev, "backside_hall_sw", GPIOD_IN);
 	if (IS_ERR(data->backside_hall_gpio)) {
 		r = PTR_ERR(data->backside_hall_gpio);
 		dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw GPIO\n");
-- 
2.39.2

