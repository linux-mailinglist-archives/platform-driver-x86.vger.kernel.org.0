Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5BA6F2998
	for <lists+platform-driver-x86@lfdr.de>; Sun, 30 Apr 2023 18:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbjD3Q7t (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 Apr 2023 12:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229850AbjD3Q7r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Apr 2023 12:59:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A1926A5
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Apr 2023 09:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682873908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j47T03mSJNmFM0nSRpUoxlZmIGdmkMYlP32wgG6jzVI=;
        b=KC2zh62JmZL2KMTZLRsZCXgLCOKIYxgMXhWCz1Gqga0E37LbveVne5dsVSXog3hILWsnm5
        gLkjjAWM9YUJDfJZJVRgD4Hsi5W0egFBhljehFl7OijYxEUSp71ycus6WsNSrywQBh1TgM
        +87KEYn9XXbBmjl+Lm1NsEBxStRAIbM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-DwUclbVgMseewkJ5Meof-g-1; Sun, 30 Apr 2023 12:58:21 -0400
X-MC-Unique: DwUclbVgMseewkJ5Meof-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CD4F8828C0;
        Sun, 30 Apr 2023 16:58:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 03C222166B26;
        Sun, 30 Apr 2023 16:58:19 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH v2 03/19] platform/x86: lenovo-yogabook: Reprobe devices on remove()
Date:   Sun, 30 Apr 2023 18:57:51 +0200
Message-Id: <20230430165807.472798-4-hdegoede@redhat.com>
In-Reply-To: <20230430165807.472798-1-hdegoede@redhat.com>
References: <20230430165807.472798-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Ensure that both the keyboard touchscreen and the digitizer have their
driver bound after remove(). Without this modprobing lenovo-yogabook-wmi
after a rmmod fails because lenovo-yogabook-wmi defers probing until
both devices have their driver bound.

Fixes: c0549b72d99d ("platform/x86: lenovo-yogabook-wmi: Add driver for Lenovo Yoga Book")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/lenovo-yogabook-wmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
index 3a6de4ab74a4..5948ffa74acd 100644
--- a/drivers/platform/x86/lenovo-yogabook-wmi.c
+++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
@@ -332,9 +332,20 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 static void yogabook_wmi_remove(struct wmi_device *wdev)
 {
 	struct yogabook_wmi *data = dev_get_drvdata(&wdev->dev);
+	int r = 0;
 
 	free_irq(data->backside_hall_irq, data);
 	cancel_work_sync(&data->work);
+
+	if (!test_bit(YB_KBD_IS_ON, &data->flags))
+		r |= device_reprobe(data->kbd_dev);
+
+	if (!test_bit(YB_DIGITIZER_IS_ON, &data->flags))
+		r |= device_reprobe(data->dig_dev);
+
+	if (r)
+		dev_warn(&wdev->dev, "Reprobe of devices failed\n");
+
 	put_device(data->dig_dev);
 	put_device(data->kbd_dev);
 	acpi_dev_put(data->dig_adev);
-- 
2.39.2

