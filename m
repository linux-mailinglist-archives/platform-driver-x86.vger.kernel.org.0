Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB455792E44
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 Sep 2023 21:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235556AbjIETGr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 Sep 2023 15:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238625AbjIETGo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2023 15:06:44 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387F4E52
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Sep 2023 12:06:12 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-401ec23be82so30245145e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2023 12:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940707; x=1694545507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rGZDmwAMqeUVhOTfv7ZtpSGAuFAAm5HZQ+raVbVaSso=;
        b=XfSw6uorce7VXjWb7LFBEM3EumWuErlAqi52Ki8g+n6WkvZmmPtWunKWCfR0Uu0SDi
         6cqH+bYmhMgDBjP9sf75Ry0rqhPB+lvhQkr2vE67E2Ml+LBoIiobacYFy8Tp8Hz4SrCx
         iIa/CG7l79HskX6rbWlwgnAqOiO2/5jjacdbQaY4hVR15cpPSC0q9y/NaJNvAYLbIUWg
         k2SEJg1aDoU3gys06sx776CUIc7kp+ZV9kIiS411TzBlJbuXg/FnHmU3J8TUjVQoeCSk
         slxhbudA/p+ksXye5fkmoaa3WjAADI6wNeMf2uVDV21QVw2pn1QYOKpbRhfqhvcnBKUL
         JJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940707; x=1694545507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rGZDmwAMqeUVhOTfv7ZtpSGAuFAAm5HZQ+raVbVaSso=;
        b=WINSrcaOSjElNvoEPmDAyLVptmVBm8bjrFz0wYL0dsT9lVi1hBclT8uAX2mF7ZlZgm
         8rPed0d3CKUBG1EWQ981N27vZNRnhFv1ceUwhZAqGMoxS+M0YQP7ZLjwfLas55z0DyXN
         jsD5wsz1n8r8nn+5ObBmVBfLXNeSm+dbwLBCw/777hY0GwcLNc5wy+I2UfPk2Hk6LSog
         1h6HycOuAU/gItCflajEUGSkpt3xe1aAJR/VeRZeH7Gm1vYifBh/TJ1JvvyGV421NBze
         OKUeizDwRYFwKajd+wHEsE23RhyML+Wbx/CP7w6+h7eIcCEru/E6sfJ2/ajNSE7mF0aE
         We0w==
X-Gm-Message-State: AOJu0Yy2gZDjIYTjiqH+k4iW7x0jp7yDijWejHLhIPZlOTdIjMfMXZ+V
        64a1kolaH0gOwFr0sYY56V1GlxGPuzowuZ8QitA=
X-Google-Smtp-Source: AGHT+IE6a92Y8/0xOq//9BYLFPzr9xAdeK40uWCbwfh4Inevy5jL9Qx5QtQIzqIf7nl+RNMdD6lXWg==
X-Received: by 2002:a05:600c:2149:b0:402:8c7b:ceea with SMTP id v9-20020a05600c214900b004028c7bceeamr402336wml.30.1693940013467;
        Tue, 05 Sep 2023 11:53:33 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:33 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 06/21] gpiolib: provide gpiod_to_device()
Date:   Tue,  5 Sep 2023 20:52:54 +0200
Message-Id: <20230905185309.131295-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_desc is opaque so provide a way for users to retrieve the
underlying GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpiolib.c      | 14 ++++++++++++++
 include/linux/gpio/driver.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4a9af6bfc6d4..9637a79a9a60 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -219,6 +219,20 @@ struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(gpiod_to_chip);
 
+/**
+ * gpiod_to_device() - Return the GPIO device owning this descriptor
+ * @desc: GPIO descriptor
+ *
+ * Returns:
+ * Pointer to the opaque struct gpio_device object. This function does not
+ * increase the reference count of gpio_device.
+ */
+struct gpio_device *gpiod_to_device(struct gpio_desc *desc)
+{
+	return gpio_device_get(desc->gdev);
+}
+EXPORT_SYMBOL_GPL(gpiod_to_device);
+
 /* dynamic allocation of GPIOs, e.g. on a hotplugged device */
 static int gpiochip_find_base(int ngpio)
 {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index b2572b26c8e3..e3747e730ed1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -778,6 +778,7 @@ int gpiochip_lock_as_irq(struct gpio_chip *gc, unsigned int offset);
 void gpiochip_unlock_as_irq(struct gpio_chip *gc, unsigned int offset);
 
 struct gpio_chip *gpiod_to_chip(const struct gpio_desc *desc);
+struct gpio_device *gpiod_to_device(struct gpio_desc *desc);
 
 #else /* CONFIG_GPIOLIB */
 
-- 
2.39.2

