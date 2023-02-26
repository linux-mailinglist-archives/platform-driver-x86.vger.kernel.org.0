Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0F1A6A3510
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Feb 2023 23:56:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjBZW4C (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Feb 2023 17:56:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229867AbjBZWzw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Feb 2023 17:55:52 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0E5D19F32
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 14:55:22 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso2782109wmp.4
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 14:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP9BUpkAAnItZXgZisVn1kO1oz9qmtA+bV8jqWpOtJM=;
        b=xNF00HDit8Cyi0Oy7Ym4GIPyk2UGsV3BL68mxgXoc22L7UD8alc5G6Ga556KC7e1XR
         R2B16kLw4VKmDDtmePz91xiBdYvL11ag+ZZuL5MtrYAKENpv9Dg/oFKh+Rke2nO6aUAE
         OVL2qNQa5GCxSHHxR6HoQiHCPJsrkIBW7QX98P51B+UpYkC3nOqI5pe9lkbpNtq1FA8/
         St07IP5TR7zECP7DRXto6y2rhvcwMuScPZjhXPJl4XDCRc9g/XjR060oVex8dxnu9Gi3
         03rrGV9ZCbF1iImOCrl81nKrjm8xCMcqPzKEZ6/KHLob9r3o/1gk8SwJGQTcZ777zACv
         z2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP9BUpkAAnItZXgZisVn1kO1oz9qmtA+bV8jqWpOtJM=;
        b=HRXxYz+2JuU9lv+8VMMnsJaZh1xilTW1XJerWIs8vXcVqDScDGRWTYQNwuv4kEFsUp
         c1LPc+j4aphb+McU0tgAZLh8UfIL22KawxXZiT9Xijs51PBHPX+CySRnYXFbMRamgV++
         96q9MCyW5n/Z3lGkm8oGAWwd1udaCXkx6yM2JHeZwibll5TvTJUXPKH+KGedkoCa8tAy
         OjR9CCZcmiuDZN1ULyKYGejM3IZwA+GiG9naTSo37AKnEciN10gYjo+V9igHE9vxDpQh
         fRQTuHu2WFiMeZjgzVdd2jAhK7+9BUAK/RkzAMooXtD/bWNjBm0+SVGtghoiVLUtelXD
         /uHw==
X-Gm-Message-State: AO0yUKVVACrGd0EjT2FKD1HohEdg+ReVf8C/VfKEn3oWNx8NoVvTuAp7
        MyVEBPLiWCZPDE9TmdrgCZee8Q==
X-Google-Smtp-Source: AK7set/wU0hkiS2EFGpo+/bN0ssaDFfJf9jZphCp98HNiEk1yxLRMYbuP2NDwROuT0mdGZsWp39Mww==
X-Received: by 2002:a05:600c:3416:b0:3eb:3cc9:9f85 with SMTP id y22-20020a05600c341600b003eb3cc99f85mr2580319wmp.26.1677452122423;
        Sun, 26 Feb 2023 14:55:22 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8baa:6b32:391b:62de])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b003eb369abd92sm6138074wms.2.2023.02.26.14.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 14:55:21 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v3 18/20] thermal/drivers/acerhdf: Make interval setting only at module load time
Date:   Sun, 26 Feb 2023 23:54:04 +0100
Message-Id: <20230226225406.979703-19-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230226225406.979703-1-daniel.lezcano@linaro.org>
References: <20230226225406.979703-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The thermal zone device structure is in the process of being private
to the thermal framework core code. This driver is directly accessing
and changing the monitoring polling rate.

After discussing with the maintainers of this driver, having the
polling interval at module loading time is enough for their purpose.

Change the code to take into account the interval when the module is
loaded but restrict the permissions so the value can not be changed
afterwards.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Peter Kaestle <peter@piie.net>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acerhdf.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 1956469c3457..61f1c3090867 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -79,7 +79,6 @@ static unsigned int list_supported;
 static unsigned int fanstate = ACERHDF_FAN_AUTO;
 static char force_bios[16];
 static char force_product[16];
-static unsigned int prev_interval;
 static struct thermal_zone_device *thz_dev;
 static struct thermal_cooling_device *cl_dev;
 static struct platform_device *acerhdf_dev;
@@ -346,20 +345,15 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
 	trips[0].temperature = fanon;
 	trips[0].hysteresis  = fanon - fanoff;
 
-	if (kernelmode && prev_interval != interval) {
+	if (kernelmode) {
 		if (interval > ACERHDF_MAX_INTERVAL) {
 			pr_err("interval too high, set to %d\n",
 			       ACERHDF_MAX_INTERVAL);
 			interval = ACERHDF_MAX_INTERVAL;
 		}
+
 		if (verbose)
 			pr_notice("interval changed to: %d\n", interval);
-
-		if (thermal)
-			thermal->polling_delay_jiffies =
-				round_jiffies(msecs_to_jiffies(interval * 1000));
-
-		prev_interval = interval;
 	}
 }
 
@@ -807,5 +801,5 @@ static const struct kernel_param_ops interval_ops = {
 	.get = param_get_uint,
 };
 
-module_param_cb(interval, &interval_ops, &interval, 0600);
+module_param_cb(interval, &interval_ops, &interval, 0000);
 MODULE_PARM_DESC(interval, "Polling interval of temperature check");
-- 
2.34.1

