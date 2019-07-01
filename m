Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCA85B636
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 Jul 2019 09:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727080AbfGAH6S convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 1 Jul 2019 03:58:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:54690 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727031AbfGAH6S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Jul 2019 03:58:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 55342AEBD;
        Mon,  1 Jul 2019 07:58:17 +0000 (UTC)
Date:   Mon, 1 Jul 2019 09:58:15 +0200
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Subject: Re: [PATCH] x86: apuv2: Fix softdep statement
Message-ID: <20190701095815.3157a1da@endymion>
In-Reply-To: <CAHp75VcOSWVFCHX+gxRzVsjdLLt+3wOrt5mWjmYrM_GfBGN2yw@mail.gmail.com>
References: <20190629114136.45e90292@endymion>
        <CAHp75VcOSWVFCHX+gxRzVsjdLLt+3wOrt5mWjmYrM_GfBGN2yw@mail.gmail.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On Sat, 29 Jun 2019 14:13:02 +0300, Andy Shevchenko wrote:
> On Sat, Jun 29, 2019 at 12:41 PM Jean Delvare <jdelvare@suse.de> wrote:
> >
> > Only one MODULE_SOFTDEP statement is allowed per module. Multiple
> > dependencies must be expressed in a single statement.  
> 
> Some module init utils even do not support softdep.

And?

> Nevertheless, the message is somewhat misleading. It's not "only one
> allowed" — this is not true, it's "only first will be served".
> This is how I read kmod sources.

What practical difference does it make?

> And perhaps better to fix them?

It's not considered a bug, as it is already possible to have multiple
dependencies listed, you only have to put them in the same statement.
There are several other MODULE_* macros which also can be used only
once per module (MODULE_LICENSE, MODULE_DESCRIPTION) so I see nothing
fundamentally wrong with MODULE_SOFTDEP following the same model. The
example provided clearly illustrates how multiple dependencies should
be declared. One possible improvement would be to add a comment
explicitly stating that this macro can only be used once per module.

> At least I would rather support somelike
> MODULE_SOFTDEP("pre: ...");
> MODULE_SOFTDEP("post: ...");

Feel free to implement this on your copious spare time if you think
there is any actual value in this change. Personally I'm not sure and I
just want to get the (driver) bug fixed. Fixing the driver is more
simple and easier to backport if needed.

> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: Andy Shevchenko <andy@infradead.org>
> > ---
> >  drivers/platform/x86/pcengines-apuv2.c |    4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > --- linux-5.1.orig/drivers/platform/x86/pcengines-apuv2.c       2019-05-06 02:42:58.000000000 +0200
> > +++ linux-5.1/drivers/platform/x86/pcengines-apuv2.c    2019-06-29 11:37:48.062005738 +0200
> > @@ -255,6 +255,4 @@ MODULE_DESCRIPTION("PC Engines APUv2/APU
> >  MODULE_LICENSE("GPL");
> >  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
> >  MODULE_ALIAS("platform:pcengines-apuv2");
> > -MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME);
> > -MODULE_SOFTDEP("pre: platform:leds-gpio");
> > -MODULE_SOFTDEP("pre: platform:gpio_keys_polled");
> > +MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");
> >
> >
