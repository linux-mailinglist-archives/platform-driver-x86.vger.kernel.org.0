Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 873EE90694
	for <lists+platform-driver-x86@lfdr.de>; Fri, 16 Aug 2019 19:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfHPRQ1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 16 Aug 2019 13:16:27 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:39935 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfHPRQ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Aug 2019 13:16:26 -0400
Received: by mail-lj1-f195.google.com with SMTP id x4so5952186ljj.6
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Aug 2019 10:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WmMRzoPxWhx9psOoMw9OEqT2sP4VXEVDL9ycaUr7aFE=;
        b=Dv7/zbP/VFWxOHFXucTD6VUb+3RFRqqDoo6GnsZgicv+I4r2fnkbNIH3Gyj2WeiFDO
         WbMBl4x8Qp9Cp4S68jkWQWR4No4cF8g1kVvK1rVO09gmuW9fmAYljIm9Um8DTw17RKhQ
         A1NNPuV4OJyxvdUaj+bUIHJEbxi166R/S3P+0U1HwtsqqxbAXZKrw2a7jE0xEN6n7zKY
         7+0NlbeCSh/GNWpq5p9cgkqHZMw/5bp2NwFTqaAJ2rNh97ud6EE9Unj93N+vmcQydjpz
         vF40tmYEbZ9WUW5PIQGCIeSNYD1aKzyheK6SW5dAT5ryJ17fEDqxnsH54M3pASBLIjnd
         Hecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WmMRzoPxWhx9psOoMw9OEqT2sP4VXEVDL9ycaUr7aFE=;
        b=IA8CszCjNAjGfmro3AHvViuLFuLXmTZiDLNPXzvIg2qEvQoIKOtrSN1NqP/9a5SZVw
         N3m+B9RHVfZIdd5Ao4OzP1MGhoxw+kq+ihBeQuLZTWzAWCybi4MhTyTxDRt+We/K/yPJ
         j1tWkx8oZS8972Rsz2vPC3Z2nkU0BYIa/ihKX++owPPOem6290sYuwzKmDdwSQ2ZXAvY
         WC4KKFw0SQWQALCshxnCXjZEf9jFnO8axgQuiBdXE0AjwA8YA7lmdUqao9867vpGp7PM
         1p2b9tu0QM3kHexrUMWvfBy0aZg5dTbvy8dr3APm/ZNeOIHrRZknpQ08TGQe0fM3M5+u
         Chkw==
X-Gm-Message-State: APjAAAUX0kO7+K1lKtmZttrS2dc44SUfkEXBSNWDu7o+0M6P8/+O3CEu
        6AFpFSI8YxW+Ba6SdgB3lPCFUJGTDHHQf6/cU0hlCg==
X-Google-Smtp-Source: APXvYqxbZkRaYNZUkbtaKkWyA37ouFLbm3vEWqm+KaLBbOGWDXJhR78RNk+uIm+tQZtrSs8sNE+BrSfTM5IwdfTnhlc=
X-Received: by 2002:a2e:9903:: with SMTP id v3mr4598768lji.37.1565975784340;
 Fri, 16 Aug 2019 10:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190812135335.10104-1-linus.walleij@linaro.org> <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
In-Reply-To: <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 16 Aug 2019 19:16:12 +0200
Message-ID: <CACRpkdZhd1Bk-cBaxGaKo-mMoCT8T7yGqbPWFBiL10x3xkgDgA@mail.gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On Fri, Aug 16, 2019 at 11:18 AM Hans de Goede <hdegoede@redhat.com> wrote:

> So I've just tested this on a Cherry Trail machine and
> the interrupt storm, fixing which is the reason the
> intel_int0002_vgpio.c driver was introduced, is back:

Sorry but just so I understand this report: when you say the
interrupt storm is back, do you mean that this patch brings
it back, or do you mean the interrupt storm is there
even before this patch?

This patch does bring semantic differences, but very
small ones.

> Notice that the driver has attached itself as shared irq-handler
> to the ACPI  IRQ

What is it sharing it with?

> Do I need any patches on top of 5.3-rc4 to test this patch?

No, none that I know of.

It is weird that this driver registers a chained
interrupt handler but int0002_irq() doesn't call
chained_irq_[enter|exit].

I don't understand the ACPI code but I'm confused about
a "virtual" GPIO controller with very real interrupt lines
attached to it. If it is actually virtual then just trying to
abuse gpiolib to cascade interrupts like the shared
interrupts were some, you know, cascaded GPIO IRQ line,
I guess all the consumers should just grab the interrupt
independently and shared instead, the idea being that
each of them will drop their pull of the shared level IRQ
line until it is eventually deasserted.

I'm just confused....

Yours,
Linus Walleij
