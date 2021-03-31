Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D844034609F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 23 Mar 2021 14:58:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhCWN6T (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 23 Mar 2021 09:58:19 -0400
Received: from mail-lj1-f175.google.com ([209.85.208.175]:38428 "EHLO
        mail-lj1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231980AbhCWN5s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 09:57:48 -0400
Received: by mail-lj1-f175.google.com with SMTP id s17so25737881ljc.5;
        Tue, 23 Mar 2021 06:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=luVl7HTqGqd54Q4Vnh/OjrJi/jL+nPdpxWT2c/YxpeA=;
        b=oMqiCOMalv4Ca1RhEaOKRDlTt+tNBD0o7NyF0JvgmONG1tuK14HjlKJgGEmVL/igbF
         +uF22q1KnISrNAP0wFo/JYzWWVUAzChUifbCxGKbLYZW3rzh6vp1c6ZKqXbYSYNWfYua
         jBbl4X/YiIFgQYEJRldYZIvB0Hq8HBnlN1yWDelFBzLpgs/4FhNCvHwNm6R9iHVzGgN/
         4hEVKcwzMK/EY5zv4z6Zs9OvilTbz5WEa4+as7x6KU+/mB6silA4yAo/hPQWSYUx3/sH
         CHgcowz8mzeLOTjPcIvAdu87Ci3M/okEmLfWe6SmLxCnlMAjZRO3bVhS0jTQW1iC04sc
         ZmwA==
X-Gm-Message-State: AOAM532bDnEffdddjb7lAZlEJJZtnoUxejXCp/+dxoLY0H26P8k4YQkz
        JNTvgDQHrZOv4ZgGXiYsvLo=
X-Google-Smtp-Source: ABdhPJzQsfZwkKOcBxJyLzAaplw07f1qQr0vZn0+33F072vuRY3u8TdYgtanskjOMFeZc629hOQyTA==
X-Received: by 2002:a2e:300d:: with SMTP id w13mr3374905ljw.199.1616507867231;
        Tue, 23 Mar 2021 06:57:47 -0700 (PDT)
Received: from localhost.localdomain (dc7vkhyyyyyyyyyyyyyby-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::2])
        by smtp.gmail.com with ESMTPSA id w12sm2343656ljm.50.2021.03.23.06.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 06:57:46 -0700 (PDT)
Date:   Tue, 23 Mar 2021 15:57:41 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 5/8] platform/x86: gpd pocket fan: Clean-up by using
 managed work init
Message-ID: <aa25a6781ba016772b045cd6e630da8c559a665d.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1616506559.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Few drivers implement remove call-back only for ensuring a delayed
work gets cancelled prior driver removal. Clean-up these by switching
to use devm_delayed_work_autocancel() instead.

This change is compile-tested only. All testing is appreciated.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
Changelog from RFCv2:
 - RFC dropped. No functional changes.

 drivers/platform/x86/gpd-pocket-fan.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index 5b516e4c2bfb..7a20f68ae206 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/devm-helpers.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -124,7 +125,7 @@ static void gpd_pocket_fan_force_update(struct gpd_pocket_fan_data *fan)
 static int gpd_pocket_fan_probe(struct platform_device *pdev)
 {
 	struct gpd_pocket_fan_data *fan;
-	int i;
+	int i, ret;
 
 	for (i = 0; i < ARRAY_SIZE(temp_limits); i++) {
 		if (temp_limits[i] < 20000 || temp_limits[i] > 90000) {
@@ -152,7 +153,10 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	fan->dev = &pdev->dev;
-	INIT_DELAYED_WORK(&fan->work, gpd_pocket_fan_worker);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &fan->work,
+					   gpd_pocket_fan_worker);
+	if (ret)
+		return ret;
 
 	/* Note this returns a "weak" reference which we don't need to free */
 	fan->dts0 = thermal_zone_get_zone_by_name("soc_dts0");
@@ -177,14 +181,6 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int gpd_pocket_fan_remove(struct platform_device *pdev)
-{
-	struct gpd_pocket_fan_data *fan = platform_get_drvdata(pdev);
-
-	cancel_delayed_work_sync(&fan->work);
-	return 0;
-}
-
 #ifdef CONFIG_PM_SLEEP
 static int gpd_pocket_fan_suspend(struct device *dev)
 {
@@ -215,7 +211,6 @@ MODULE_DEVICE_TABLE(acpi, gpd_pocket_fan_acpi_match);
 
 static struct platform_driver gpd_pocket_fan_driver = {
 	.probe	= gpd_pocket_fan_probe,
-	.remove	= gpd_pocket_fan_remove,
 	.driver	= {
 		.name			= "gpd_pocket_fan",
 		.acpi_match_table	= gpd_pocket_fan_acpi_match,
-- 
2.25.4


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
