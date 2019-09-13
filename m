Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4C23B2109
	for <lists+platform-driver-x86@lfdr.de>; Fri, 13 Sep 2019 15:49:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390898AbfIMNbu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 13 Sep 2019 09:31:50 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44791 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388040AbfIMNbu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Sep 2019 09:31:50 -0400
Received: by mail-lf1-f66.google.com with SMTP id q11so7206659lfc.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Sep 2019 06:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vl4kCH5WPdW4RbKSET3b2QL8m28DYxVvIqmRt4EKS68=;
        b=DwKXsCo5ojz6LSEP95Tq1uaQ2R26Opk12cRW3PKuANnrrqvIuyK4omX4snVJjfNBV1
         VT8/opCW7KMNj103mXIbkaaVTr82+Zi4V1f7ziK/Bwkub1WQk4caqL+poHRFDGreelvu
         CbYD94seTXnFtuHOw0YOofRfQTQkx3g05YW9fm9cOnVqZiKaTNuNFHRqKwjDzdKJlqDM
         0r1kTcVH1bqrpxPiAsNDqwc9ZQgWIAJXfJhn7Xk24fMWJxw7J6wzjWrNAHZg240lR26K
         blf01R8uMw+KJal2xap3xpJjbUsknUsmuv0M1IV8jUzpm+uEk0ODBYV9tdHAsb01+DIG
         mv1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vl4kCH5WPdW4RbKSET3b2QL8m28DYxVvIqmRt4EKS68=;
        b=QkDgKWiMv60SWOxXbzlM/mmygo0vO2mIWACN/RbGSuxz5Zz7Q2eS12d1UapSTwAhuW
         aGQdeLXWbv6rFj3Is65H3m49SInCJGpHuC0Ep/BAJAtib/HIv3FsbAJyXbXnn+Otp+Mt
         AoRZDmjkiG/sdZV7gEu849myy3Q8QXKbWIwuw+AWzoTZQcR/Hm7zx+4m9zjrtBBJ0A6K
         iNIpJYpJinZ0bqCtLX22i0ufqlIVefKJjuVq2cqtbzztZZvN7IbokOVL2MjzUBnRnfwy
         V6HwQTpFzPyqR69g8kO0GQChRIZSdU09mhfvRmE4r1kILUs04MHAno68hCo7XKXAUk5s
         VWiQ==
X-Gm-Message-State: APjAAAX55xJYxLghSMd8SRP9AapESB+3DKfCNlZgPAAOa/JJrX59sVwS
        oQNgypnIs227TDsQ8YxneP83NbqBOzq75wOBlZJuww==
X-Google-Smtp-Source: APXvYqyJH8zqCIEFOmvdT7El7QFQgP1Y5mIWYE0iAfVg31VeD3nHZjM4Qt+yuXrO5AV/tlQ755YhJI0yxO/y8o57xhk=
X-Received: by 2002:a19:14f:: with SMTP id 76mr30436285lfb.92.1568381507631;
 Fri, 13 Sep 2019 06:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190812135335.10104-1-linus.walleij@linaro.org> <20190913121903.GO2680@smile.fi.intel.com>
In-Reply-To: <20190913121903.GO2680@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Sep 2019 15:31:35 +0200
Message-ID: <CACRpkdb+4PMP12NLScf9ckC05RHDL=uSN6g-Ytn0sTv6gSa9XA@mail.gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Sep 13, 2019 at 2:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Mon, Aug 12, 2019 at 03:53:35PM +0200, Linus Walleij wrote:
> > We need to convert all old gpio irqchips to pass the irqchip
> > setup along when adding the gpio_chip. For more info see
> > drivers/gpio/TODO.
> >
> > For chained irqchips this is a pretty straight-forward
> > conversion.
>
> After Hans' patches against this driver and discussion about proper order of
> initialization the patch is not applicable anymore. Please, send v2 which
> supposed to satisfy above concerns.
>
> For now, I'm dropping it from my queue.

No problem, I think I broke the mergebase with my other patch
for irq valid_mask initialization anyway. Let's wait until after the
merge window, then I'll rebase, touch it up and resend.

Yours,
Linus Walleij
