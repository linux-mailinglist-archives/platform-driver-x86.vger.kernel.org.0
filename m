Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC7C558DF
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Jun 2019 22:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726772AbfFYUbQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 25 Jun 2019 16:31:16 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:41357 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726274AbfFYUbQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Jun 2019 16:31:16 -0400
Received: by mail-ed1-f67.google.com with SMTP id p15so29032349eds.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jun 2019 13:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ouCYZW6j2F9X9UEJz8UhFdPaz7qXxTi0skUGUYVPJg8=;
        b=Yaku0OaPzRhuoN41a6+D/MJRL7PMWwnizZMYkUC6gaT9A+mkmUS0FF+SUcn/dvpI5G
         2TKFyHsCif8RZG8/m+0QQNvxErfBL7npnj9bBcr52CxjaN8Lqh3Mnyb2/3/CFWGIMHZi
         Voj71l5np6XRwTnWtZVNHoEm8d6U4canqmD72DJ8yoTPcSyNiB/wy4xinDPNasTCIEgL
         BLHC0T7LALzT3g3DM36bZlBa4VBsA+qnX5qWelGtLogx+hmIQKcdYp2Yum9+DTW81jEM
         ZcGiiyPTFnZsEUIqab0z2ISnsrTcLQJNDUX0mJ4cbfVNgBCnNvyy7pD+o7jLfz3W6K2o
         pOng==
X-Gm-Message-State: APjAAAWNAs7vX4QE7wjmLUZAIbvODQ+oY3jFAOeqrGE4CoJBsMXV8DlB
        o2CqUGUXaQgIvZHpn+v6HlR2bw==
X-Google-Smtp-Source: APXvYqyL122t/uCNJpHnytCFoUf/GBY/eGn/znXIiwaj9GqmlBtdCqFtAzPv5mdjJZBYRas4njeaWg==
X-Received: by 2002:aa7:c692:: with SMTP id n18mr486235edq.220.1561494674353;
        Tue, 25 Jun 2019 13:31:14 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id g16sm5070792edc.76.2019.06.25.13.31.13
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 13:31:13 -0700 (PDT)
Subject: Re: [PATCH v1] platform/x86: intel_int0002_vgpio: Get rid of custom
 ICPU() macro
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190619145050.13876-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bebb9c22-186d-8bd1-a12d-c97f22f2487a@redhat.com>
Date:   Tue, 25 Jun 2019 22:31:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190619145050.13876-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 19-06-19 16:50, Andy Shevchenko wrote:
> Replace custom grown macro with generic INTEL_CPU_FAM6() one.
> 
> No functional change intended.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>   drivers/platform/x86/intel_int0002_vgpio.c | 22 +++++++---------------
>   1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
> index 1694a9aec77c..d9542c661ddc 100644
> --- a/drivers/platform/x86/intel_int0002_vgpio.c
> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
> @@ -51,17 +51,6 @@
>   #define GPE0A_STS_PORT			0x420
>   #define GPE0A_EN_PORT			0x428
>   
> -#define BAYTRAIL			0x01
> -#define CHERRYTRAIL			0x02
> -
> -#define ICPU(model, data) { X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, data }
> -
> -static const struct x86_cpu_id int0002_cpu_ids[] = {
> -	ICPU(INTEL_FAM6_ATOM_SILVERMONT, BAYTRAIL), /* Valleyview, Bay Trail  */
> -	ICPU(INTEL_FAM6_ATOM_AIRMONT, CHERRYTRAIL), /* Braswell, Cherry Trail */
> -	{}
> -};
> -
>   /*
>    * As this is not a real GPIO at all, but just a hack to model an event in
>    * ACPI the get / set functions are dummy functions.
> @@ -157,6 +146,12 @@ static struct irq_chip int0002_cht_irqchip = {
>   	 */
>   };
>   
> +static const struct x86_cpu_id int0002_cpu_ids[] = {
> +	INTEL_CPU_FAM6(ATOM_SILVERMONT, int0002_byt_irqchip),	/* Valleyview, Bay Trail  */
> +	INTEL_CPU_FAM6(ATOM_AIRMONT, int0002_cht_irqchip),	/* Braswell, Cherry Trail */
> +	{}
> +};
> +
>   static int int0002_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -210,10 +205,7 @@ static int int0002_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> -	if (cpu_id->driver_data == BAYTRAIL)
> -		irq_chip = &int0002_byt_irqchip;
> -	else
> -		irq_chip = &int0002_cht_irqchip;
> +	irq_chip = (struct irq_chip *)cpu_id->driver_data;
>   
>   	ret = gpiochip_irqchip_add(chip, irq_chip, 0, handle_edge_irq,
>   				   IRQ_TYPE_NONE);
> 
