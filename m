Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A9D0E231B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Oct 2019 21:07:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391314AbfJWTHT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Oct 2019 15:07:19 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37775 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389752AbfJWTHS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Oct 2019 15:07:18 -0400
Received: by mail-pg1-f194.google.com with SMTP id p1so12693280pgi.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2019 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AtmI0HzUozYTs+3GGLQE5qc2gNrA1Y91W75VQO2spm0=;
        b=jk1pEjPV42b3Cvcq05036DwuF+yxt4U0UdvIFPKJs6Qx3Tbmo3VEGqsysYjCUl68dG
         20R/6xUdRWdLawKvWE1oXXbC5IMZIBDUoOJBZVWNgXXkPQolMj7qk6YRLQgVG9apegX+
         yflnH5VmxIDSpSJH9vikaxKEA0/SYEz6QGLkhhrN3mZNHZ8apm7Yj7u5eXVYiDL5EMhH
         9RfZWKIG5OqoCfcT/u0YlN9qv5Qu2h01ERtpScOVA35sLXIN0YqSjht9i9xgS1PGe8x2
         PQrgQjoWLtE5F6MJxCisnGzXZ35ETqS4z8QPGJo2q4g+Ojqy6njWShQftpczMm8KPGWn
         RvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtmI0HzUozYTs+3GGLQE5qc2gNrA1Y91W75VQO2spm0=;
        b=lcPsbpQbwvI5UWoVkonyL91BF1ZhI9csgCePYJU5iMeWjWxbWqrNtDxA04LkXqg3nL
         Uctqc5ALJhmNtoVOpIDVzWxAohKXHMZbDRgsFYJ54ONhFAi5n2gtD+JOp1gVGClxYII2
         NufE5NyfFpo1IK9djQLkhwBJQA7RReOCHIPv6gSpnlRPvfkflxApsYWmrtpsfCk3TCTE
         vQj6Vm/PjjbVDk06p3rdBgGcVBknkoBP5s8fvtyFX7pqxdtM+QalpyB8TIRgKFhbBa4Y
         4ZNCrxGWBnAQ9NQ0VzOid1yGfQf6i5st3h/ezRtJ63CvIQHuPTQWY+8lwOMAVj0rjT7q
         yvyw==
X-Gm-Message-State: APjAAAVC7KZrgD3lyDxtFQb1d5063SA+JYfePbNaJQH+jAZgGKA9p8xG
        YYjt/9lszq7TfDq9QE3jUmN/CpYryqxYHWV04NEivpjktUA=
X-Google-Smtp-Source: APXvYqxQmVdtVK53TJkGejpPQXQ7icd/78Hfh9ht9q4Vun+blwu3P6cSilPeHDGkm4jcmHp9CCH1y55z3tI+lLkGJv8=
X-Received: by 2002:a63:d0a:: with SMTP id c10mr12245722pgl.203.1571857637713;
 Wed, 23 Oct 2019 12:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191022210128.12042-1-linus.walleij@linaro.org>
In-Reply-To: <20191022210128.12042-1-linus.walleij@linaro.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 23 Oct 2019 22:07:06 +0300
Message-ID: <CAHp75VfP-XrphS86d7jEpzjDhYz-mrgHztoNLhh0TDoonK8Qvg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Pass irqchip when
 adding gpiochip
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Oct 23, 2019 at 12:03 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> We need to convert all old gpio irqchips to pass the irqchip
> setup along when adding the gpio_chip. For more info see
> drivers/gpio/TODO.
>
> For chained irqchips this is a pretty straight-forward
> conversion. This driver requests the IRQ directly in the driver
> so it needs to pass a NULL parent handler. We may revisit this
> code later and pull reqular shared IRQ handler into
> gpiolib, so leave a FIXME.
>

Thanks!
Code looks fine to me, though I will wait for Hans to confirm it
doesn't break anything.

> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/platform/x86/intel_int0002_vgpio.c | 28 +++++++++++-----------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
> index af233b7b77f2..f14e2c5f9da5 100644
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -164,8 +164,8 @@ static int int0002_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         const struct x86_cpu_id *cpu_id;
> -       struct irq_chip *irq_chip;
>         struct gpio_chip *chip;
> +       struct gpio_irq_chip *girq;
>         int irq, ret;
>
>         /* Menlow has a different INT0002 device? <sigh> */
> @@ -192,15 +192,11 @@ static int int0002_probe(struct platform_device *pdev)
>         chip->ngpio = GPE0A_PME_B0_VIRT_GPIO_PIN + 1;
>         chip->irq.init_valid_mask = int0002_init_irq_valid_mask;
>
> -       ret = devm_gpiochip_add_data(&pdev->dev, chip, NULL);
> -       if (ret) {
> -               dev_err(dev, "Error adding gpio chip: %d\n", ret);
> -               return ret;
> -       }
> -
>         /*
> -        * We manually request the irq here instead of passing a flow-handler
> +        * We directly request the irq here instead of passing a flow-handler
>          * to gpiochip_set_chained_irqchip, because the irq is shared.
> +        * FIXME: augment this if we managed to pull handling of shared
> +        * IRQs into gpiolib.
>          */
>         ret = devm_request_irq(dev, irq, int0002_irq,
>                                IRQF_SHARED, "INT0002", chip);
> @@ -209,17 +205,21 @@ static int int0002_probe(struct platform_device *pdev)
>                 return ret;
>         }
>
> -       irq_chip = (struct irq_chip *)cpu_id->driver_data;
> +       girq = &chip->irq;
> +       girq->chip = (struct irq_chip *)cpu_id->driver_data;
> +       /* This let us handle the parent IRQ in the driver */
> +       girq->parent_handler = NULL;
> +       girq->num_parents = 0;
> +       girq->parents = NULL;
> +       girq->default_type = IRQ_TYPE_NONE;
> +       girq->handler = handle_edge_irq;
>
> -       ret = gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
> -                                  IRQ_TYPE_NONE);
> +       ret = devm_gpiochip_add_data(dev, chip, NULL);
>         if (ret) {
> -               dev_err(dev, "Error adding irqchip: %d\n", ret);
> +               dev_err(dev, "Error adding gpio chip: %d\n", ret);
>                 return ret;
>         }
>
> -       gpiochip_set_chained_irqchip(chip, irq_chip, irq, NULL);
> -
>         device_init_wakeup(dev, true);
>         return 0;
>  }
> --
> 2.21.0
>


-- 
With Best Regards,
Andy Shevchenko
