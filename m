Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E40788A01B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2019 15:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfHLNxl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Aug 2019 09:53:41 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42976 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfHLNxl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Aug 2019 09:53:41 -0400
Received: by mail-lj1-f193.google.com with SMTP id 15so6597951ljr.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2019 06:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q862oV79jEMEp7L6/Cy6aVorsokdF3/U1yL+fSXH3/w=;
        b=whAXd/LA4r3YMP9/k3kKb/xuJHNw/HSvAucpECqjRV1hiT1Lg0P0IPKs4FdbP7YXD0
         BFEHzc+wHbXBSVUXklVfOivD5aOI6iSwrLYRanoYCLRNqUzOmTsqZxvdtOtiHZg1T1QK
         09BqIM3CP1zq7alZqRamIQMUcEDnYzzbxmOHqMAJDScJ6LPvNqSLzH4TpI40fBx4fQxF
         79qRCFWH1UnZJIkLqLTvDVMFOS9sdnGTzgZbR23SMYK9oZMpPql2Z6F9GlzVMZOx/vgs
         Jxt+2FTb0D0N9A1wJjBTtx6vXFYtKFVuE8jPgOg4EUFlFL8wBXduEw6r+AR4E7QfrrzD
         RfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q862oV79jEMEp7L6/Cy6aVorsokdF3/U1yL+fSXH3/w=;
        b=EpNvEiZzIhJeaid5q+qheWmMqDAmu4lUWbF9MfpASvKGZqJla9INcrZ3UXO83pgTgD
         U9zSKElBZ+4ZXIF8SN6gmE2VsipDz+eh1U/ght6JudoUpBukA9xySaXlo/dLCoPhpzeQ
         Pntj2ATmL7L44GO5gnZcMPqM/9zT8ERUKo7AvZ/Ms6+5MfV5Bgp7zblr2U8lC8wHRlys
         j4HlwLM2I4fp/Zzt/vyaDsSXT57GEjtmTUxZfJd0lAWwp8NG7H+xtAxBZNB101179Hwz
         I6A3cJqY6kmASXmE7UqAVQbOWiK8VagDEVn07tnwTxtyrGowLssdTP4iHSJv6CJBeAMU
         WTNA==
X-Gm-Message-State: APjAAAV4sVapgXTkqPE+26yFc2HCM7FRspCjE2CqAYHIusiA0R2OB8ZQ
        bKXyZI8QBNSnBRfd5vYzPtc5wA==
X-Google-Smtp-Source: APXvYqzuPZOlAuZA3mHKeSbH53WxlJLIlg/Uso7VCciC0CAtwCthtjxIO5RVddwnFd9SpyzNpJVZ3Q==
X-Received: by 2002:a2e:9a13:: with SMTP id o19mr19700806lji.102.1565618019440;
        Mon, 12 Aug 2019 06:53:39 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id s10sm2207291ljm.35.2019.08.12.06.53.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 12 Aug 2019 06:53:38 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
Date:   Mon, 12 Aug 2019 15:53:35 +0200
Message-Id: <20190812135335.10104-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

We need to convert all old gpio irqchips to pass the irqchip
setup along when adding the gpio_chip. For more info see
drivers/gpio/TODO.

For chained irqchips this is a pretty straight-forward
conversion.

Cc: Maxim Mikityanskiy <maxtram95@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Andy please merge this into your platform tree when you
feel happy with the patch, would be great of someone
can test it on hardware as well.
---
 drivers/platform/x86/intel_int0002_vgpio.c | 29 +++++++++-------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index d9542c661ddc..493a97ce0b08 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -156,8 +156,8 @@ static int int0002_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct x86_cpu_id *cpu_id;
-	struct irq_chip *irq_chip;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	int irq, ret;
 
 	/* Menlow has a different INT0002 device? <sigh> */
@@ -186,17 +186,9 @@ static int int0002_probe(struct platform_device *pdev)
 	chip->ngpio = GPE0A_PME_B0_VIRT_GPIO_PIN + 1;
 	chip->irq.need_valid_mask = true;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
-	if (ret) {
-		dev_err(dev, "Error adding gpio chip: %d\n", ret);
-		return ret;
-	}
-
-	bitmap_clear(chip->irq.valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
-
 	/*
-	 * We manually request the irq here instead of passing a flow-handler
-	 * to gpiochip_set_chained_irqchip, because the irq is shared.
+	 * We directly request the irq here instead of passing a flow-handler
+	 * to the gpio irqchip, because the irq is shared.
 	 */
 	ret = devm_request_irq(dev, irq, int0002_irq,
 			       IRQF_SHARED, "INT0002", chip);
@@ -204,17 +196,20 @@ static int int0002_probe(struct platform_device *pdev)
 		dev_err(dev, "Error requesting IRQ %d: %d\n", irq, ret);
 		return ret;
 	}
+	girq = &chip->irq;
+	girq->chip = (struct irq_chip *)cpu_id->driver_data;
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
 
-	irq_chip = (struct irq_chip *)cpu_id->driver_data;
-
-	ret = gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
-				   IRQ_TYPE_NONE);
+	ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
 	if (ret) {
-		dev_err(dev, "Error adding irqchip: %d\n", ret);
+		dev_err(dev, "Error adding gpio chip: %d\n", ret);
 		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(chip, irq_chip, irq, NULL);
+	bitmap_clear(chip->irq.valid_mask, 0, GPE0A_PME_B0_VIRT_GPIO_PIN);
 
 	return 0;
 }
-- 
2.21.0

