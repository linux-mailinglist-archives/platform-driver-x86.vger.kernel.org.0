Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C240E0D98
	for <lists+platform-driver-x86@lfdr.de>; Tue, 22 Oct 2019 23:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731234AbfJVVDl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 22 Oct 2019 17:03:41 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46328 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbfJVVDl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Oct 2019 17:03:41 -0400
Received: by mail-lj1-f196.google.com with SMTP id d1so18656875ljl.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Oct 2019 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vvgzDd7GZr6rsmCEMXDea2p05AJewISKhmu49L56F00=;
        b=FAryTjyDIXsnO73A4pqrrPuNVr5E3kaxef0WNFA8hd4m487LVdTIYwimnY84FWUbSJ
         +gYKsT3qApX1Ei5S2VUTny0qKaFJMUULFAVUTe/cNi59l5sn7gwVUU5tohxqbpCMd2RX
         r9h/ouTbdibjMI6w5i0qZdQ77bsuklr5NA6wclJtFmc1VbVNNqvKHHFMN97huOqH6Fu2
         S9FMmdC31gNBE+uuOGiQ4yOkI3fgwauypkSd5kRPvibZMoGo2ZPsQN33CIpZumGUTPlS
         cD0NX5qlx6o+94HZ1+ZPmqKTv7y9Roy4tjGVHTvGR0AhpqJs/shFG3ldIuokvgSiN4TI
         4Owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vvgzDd7GZr6rsmCEMXDea2p05AJewISKhmu49L56F00=;
        b=D4L+ml1DYB05hvE5I7506Dy+2ODdXParWJvMti//ajePjjHZ89vekOFIhMPKvdXCuW
         i7fYolqB30+8bQSm2azbXr/QjzYSe3at2Z2R7r7OHXQ70dHBVUDc2XcsnGvFvO3nCdjb
         sFDME7KIn+mROFs5Nk/IHdDm9O4H180QnMZFOX7b/nzI0aFv+ghD0cygPZcE64vvbKhU
         vF0wmKIQ7YTRhmBlSUx9tBpb5JNQodqWLMl72plIPoNO5KYELtwQKQTwjXVLkYM7EQqz
         P0DU+1cmM5X6lDnLdoOIcAqZWFp2IP4Cx0+DixJBPYeuXzAdQ6eKkYcMMs0+rbGoM43n
         YL6A==
X-Gm-Message-State: APjAAAVW29+4AxlJDSVN8Hdu0leDCfg2bsc84b3zR0oIc5HTA1U+LWN1
        H2eQFDABZ0D3AX33la6C1dMGyA==
X-Google-Smtp-Source: APXvYqzIZN8Lvq61zzNhSko569gzsz9YEKf1nu4GABfMZbsHdj2mvv+3fBK+1LXoBQXW2n5/pbb6sQ==
X-Received: by 2002:a2e:9a9a:: with SMTP id p26mr3563433lji.164.1571778218646;
        Tue, 22 Oct 2019 14:03:38 -0700 (PDT)
Received: from localhost.localdomain (c-79c8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.200.121])
        by smtp.gmail.com with ESMTPSA id m11sm3425329lfp.69.2019.10.22.14.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2019 14:03:37 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH] platform/x86: intel_int0002_vgpio: Pass irqchip when adding gpiochip
Date:   Tue, 22 Oct 2019 23:01:28 +0200
Message-Id: <20191022210128.12042-1-linus.walleij@linaro.org>
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
conversion. This driver requests the IRQ directly in the driver
so it needs to pass a NULL parent handler. We may revisit this
code later and pull reqular shared IRQ handler into
gpiolib, so leave a FIXME.

Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/platform/x86/intel_int0002_vgpio.c | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
index af233b7b77f2..f14e2c5f9da5 100644
--- a/drivers/platform/x86/intel_int0002_vgpio.c
+++ b/drivers/platform/x86/intel_int0002_vgpio.c
@@ -164,8 +164,8 @@ static int int0002_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct x86_cpu_id *cpu_id;
-	struct irq_chip *irq_chip;
 	struct gpio_chip *chip;
+	struct gpio_irq_chip *girq;
 	int irq, ret;
 
 	/* Menlow has a different INT0002 device? <sigh> */
@@ -192,15 +192,11 @@ static int int0002_probe(struct platform_device *pdev)
 	chip->ngpio = GPE0A_PME_B0_VIRT_GPIO_PIN + 1;
 	chip->irq.init_valid_mask = int0002_init_irq_valid_mask;
 
-	ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
-	if (ret) {
-		dev_err(dev, "Error adding gpio chip: %d\n", ret);
-		return ret;
-	}
-
 	/*
-	 * We manually request the irq here instead of passing a flow-handler
+	 * We directly request the irq here instead of passing a flow-handler
 	 * to gpiochip_set_chained_irqchip, because the irq is shared.
+	 * FIXME: augment this if we managed to pull handling of shared
+	 * IRQs into gpiolib.
 	 */
 	ret = devm_request_irq(dev, irq, int0002_irq,
 			       IRQF_SHARED, "INT0002", chip);
@@ -209,17 +205,21 @@ static int int0002_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	irq_chip = (struct irq_chip *)cpu_id->driver_data;
+	girq = &chip->irq;
+	girq->chip = (struct irq_chip *)cpu_id->driver_data;
+	/* This let us handle the parent IRQ in the driver */
+	girq->parent_handler = NULL;
+	girq->num_parents = 0;
+	girq->parents = NULL;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_edge_irq;
 
-	ret = gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
-				   IRQ_TYPE_NONE);
+	ret = devm_gpiochip_add_data(dev, chip, NULL);
 	if (ret) {
-		dev_err(dev, "Error adding irqchip: %d\n", ret);
+		dev_err(dev, "Error adding gpio chip: %d\n", ret);
 		return ret;
 	}
 
-	gpiochip_set_chained_irqchip(chip, irq_chip, irq, NULL);
-
 	device_init_wakeup(dev, true);
 	return 0;
 }
-- 
2.21.0

