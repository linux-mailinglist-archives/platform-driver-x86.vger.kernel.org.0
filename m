Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6EDE3050
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Oct 2019 13:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438953AbfJXL0I (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 24 Oct 2019 07:26:08 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:49996 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2436501AbfJXL0I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Oct 2019 07:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571916366;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yT7EddAmO8n+9IBTgwdok/8vmrAYvnNYweaYl/TTKwE=;
        b=YTWO4UYYoOQW1InyCUydxLwaUWk6phwVfQSvsiN0v5HGs4HTjh1UaJZc11pUkh5LbPAkzw
        GO9ZVb5X4vuNXnof2JCgb1WDwI/0t5PIJmuwsJK+ToUcuxcygRiZzdcoVdJKw+W6rbX4Si
        Fq/aX3saxOqUh4y0v5DkCKbkMH4c2aY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-qaRzN1jCPUWuxvyZNgeCaA-1; Thu, 24 Oct 2019 07:26:04 -0400
Received: by mail-wm1-f72.google.com with SMTP id q22so1094297wmc.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Oct 2019 04:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wlkxJlyu5V6A7VoVhTuJkCixAtFLwKDdMkEcx5IHQ6s=;
        b=sBLdSNSjVkQUPf+vFEz43W1Ep9Mnw0rtf4r/sPW1u7SKHilaaNWAXC4iIwCoWFwr9a
         LUoYxf3agMFxe53qzEdXkgiaQ+cSbjjpIesSbiLDAiUy1oG+t1Lf/wIOInm36hoMcDKU
         iYsGmBsKJMF41pqJU29fwdWhe/RLF25cifk4VbiDo15+BEj7+KhX+4luMPBXjWLSpVlN
         f3U4kfZF5GNOSKT8s60fg5n2zIqWJGkEyZTOO8MW+GAxPht1r44aJmuX0FNvXOdYlzwY
         sC9plZxLfXJyEvyyi/NPT2ZYaZJm6RV+7fhQLZsC//7MSp3ZeKSXrqexJerij75ZsvLz
         zNig==
X-Gm-Message-State: APjAAAXHKdBefYK4/Ml4UrEQa4RjsRv29v4dnnvYwmsgf9u0MWeLdr/J
        5UGHe6R5ePyeKEQIpbYuoB2gkBxHVHUj7KDGtZeVGgIeQVpEsZ1dPDN67y2mwWealIOayqhEeP5
        T699wxOpqv7pj35K9yR/MIefi5A9NuO9j7A==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr4171998wmk.122.1571916362461;
        Thu, 24 Oct 2019 04:26:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwgDf0iG5mBrwxkD7RF+ADC9le9OmZI7vEg0s5WJFLWhnSAOVn1BrSrOWNu4xJdTrPZgapaVA==
X-Received: by 2002:a7b:c4cf:: with SMTP id g15mr4171981wmk.122.1571916362172;
        Thu, 24 Oct 2019 04:26:02 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id a17sm22686085wrx.84.2019.10.24.04.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 04:26:01 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Pass irqchip when
 adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20191022210128.12042-1-linus.walleij@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f214ade5-7b22-0b41-b365-210d0f0da1b6@redhat.com>
Date:   Thu, 24 Oct 2019 13:25:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191022210128.12042-1-linus.walleij@linaro.org>
Content-Language: en-US
X-MC-Unique: qaRzN1jCPUWuxvyZNgeCaA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 22-10-2019 23:01, Linus Walleij wrote:
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>=20
> For chained irqchips this is a pretty straight-forward
> conversion. This driver requests the IRQ directly in the driver
> so it needs to pass a NULL parent handler. We may revisit this
> code later and pull reqular shared IRQ handler into
> gpiolib, so leave a FIXME.
>=20
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

I've tested this on a CHT device which supports wake by USB keyboard
through the INT0002 vGPIO device. Everything still works fine:

Tested-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>   drivers/platform/x86/intel_int0002_vgpio.c | 28 +++++++++++-----------
>   1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platfor=
m/x86/intel_int0002_vgpio.c
> index af233b7b77f2..f14e2c5f9da5 100644
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -164,8 +164,8 @@ static int int0002_probe(struct platform_device *pdev=
)
>   {
>   =09struct device *dev =3D &pdev->dev;
>   =09const struct x86_cpu_id *cpu_id;
> -=09struct irq_chip *irq_chip;
>   =09struct gpio_chip *chip;
> +=09struct gpio_irq_chip *girq;
>   =09int irq, ret;
>  =20
>   =09/* Menlow has a different INT0002 device? <sigh> */
> @@ -192,15 +192,11 @@ static int int0002_probe(struct platform_device *pd=
ev)
>   =09chip->ngpio =3D GPE0A_PME_B0_VIRT_GPIO_PIN + 1;
>   =09chip->irq.init_valid_mask =3D int0002_init_irq_valid_mask;
>  =20
> -=09ret =3D devm_gpiochip_add_data(&pdev->dev, chip, NULL);
> -=09if (ret) {
> -=09=09dev_err(dev, "Error adding gpio chip: %d\n", ret);
> -=09=09return ret;
> -=09}
> -
>   =09/*
> -=09 * We manually request the irq here instead of passing a flow-handler
> +=09 * We directly request the irq here instead of passing a flow-handler
>   =09 * to gpiochip_set_chained_irqchip, because the irq is shared.
> +=09 * FIXME: augment this if we managed to pull handling of shared
> +=09 * IRQs into gpiolib.
>   =09 */
>   =09ret =3D devm_request_irq(dev, irq, int0002_irq,
>   =09=09=09       IRQF_SHARED, "INT0002", chip);
> @@ -209,17 +205,21 @@ static int int0002_probe(struct platform_device *pd=
ev)
>   =09=09return ret;
>   =09}
>  =20
> -=09irq_chip =3D (struct irq_chip *)cpu_id->driver_data;
> +=09girq =3D &chip->irq;
> +=09girq->chip =3D (struct irq_chip *)cpu_id->driver_data;
> +=09/* This let us handle the parent IRQ in the driver */
> +=09girq->parent_handler =3D NULL;
> +=09girq->num_parents =3D 0;
> +=09girq->parents =3D NULL;
> +=09girq->default_type =3D IRQ_TYPE_NONE;
> +=09girq->handler =3D handle_edge_irq;
>  =20
> -=09ret =3D gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
> -=09=09=09=09   IRQ_TYPE_NONE);
> +=09ret =3D devm_gpiochip_add_data(dev, chip, NULL);
>   =09if (ret) {
> -=09=09dev_err(dev, "Error adding irqchip: %d\n", ret);
> +=09=09dev_err(dev, "Error adding gpio chip: %d\n", ret);
>   =09=09return ret;
>   =09}
>  =20
> -=09gpiochip_set_chained_irqchip(chip, irq_chip, irq, NULL);
> -
>   =09device_init_wakeup(dev, true);
>   =09return 0;
>   }
>=20

