Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69EC05C39A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 Jul 2019 21:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfGATYr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 1 Jul 2019 15:24:47 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:51954 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbfGATYq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Jul 2019 15:24:46 -0400
Received: by mail-wm1-f65.google.com with SMTP id 207so637645wma.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Jul 2019 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rQ47va1z3EjvfeSxTrEogACM2Pj7WtFTWx+mGWggtfo=;
        b=pe1HA33lxjPq99pdaTLpR2i/T5cLoN0t6tm3r+6B7O2TbKba5BHKBn/dAc/Di6YUPE
         DHOWdyWCaaGnRaK69zemrOqgyVPPulVmCf9oyfTyX80B6cvp8qVKmm2M5p5AVNMud5+B
         3yCJp2kqIkLrbNZtmHuVWU0DlZSrImMKGZg1r06dY8kl8DN1WWfPSeflhOB1GIg6jf4B
         blFkgffymU+IUiTOlC6ksfXUDtgA+YocDNfWoAevKBRsT3teROsYmbC/RdbYOp1Q6cVb
         pyY+rZl+dDoEG9sEjmS0AXLZmEj9ZR7Aum8uSjqhu+9IvNAGUPznIuiY245wbkoGe8ZI
         BtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rQ47va1z3EjvfeSxTrEogACM2Pj7WtFTWx+mGWggtfo=;
        b=SuJOZVsZIhbBnKsumKlY5Ci5NxHC9xsOkwxP2gONZQbNbaSZ0VldFK9BV4zjQ1bjSG
         F5mMkcVGib3VfAEbz6oHSRIM6+ffCJ2G9hmtP9jaUE6lzIcIpnmqhVFtch3K02+fTblO
         IggM/5Nlr0dW8v22uRooMNdANqdlVfeCCTJtjTS3VFg0TH+7EX1boPt4S41FW6k7xp+N
         Yjlryd2wx63WeyeyNzUOG1WgDVBfATzb2al9h5Iqx4ooaafRcYPnWa2HnIS0BrnhkZwS
         vqB3HAEExc3PMb1RKRU6LYUWjY2G2ddSAFIdH4WPWhMt6rHByA99KrPCJgjJ1miO+lr4
         NONQ==
X-Gm-Message-State: APjAAAX0U5o7o/KNVa7rVyU5xDcQgm9+2pSKw4OnTFweMqqce2UZJU1I
        CFnSN5v0Tlxco7GzP0xzINp65HBSV2Cpb8elyZE=
X-Google-Smtp-Source: APXvYqzghYbIPfuaLhZ7lRPK6rsoH8fUi8OqYnJDSTABr/nmO/Kes2l68NMRqBN8qJdu6arxTkQcdVLU08WWTEJKuzw=
X-Received: by 2002:a1c:9dc4:: with SMTP id g187mr439875wme.86.1562009085322;
 Mon, 01 Jul 2019 12:24:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190629114136.45e90292@endymion> <CAHp75VcOSWVFCHX+gxRzVsjdLLt+3wOrt5mWjmYrM_GfBGN2yw@mail.gmail.com>
In-Reply-To: <CAHp75VcOSWVFCHX+gxRzVsjdLLt+3wOrt5mWjmYrM_GfBGN2yw@mail.gmail.com>
From:   Lucas De Marchi <lucas.de.marchi@gmail.com>
Date:   Mon, 1 Jul 2019 12:24:33 -0700
Message-ID: <CAKi4VA+Oc_sip16eD0SnnX4r48MOCcTW6ShcVO8RX_Pqhdsiog@mail.gmail.com>
Subject: Re: [PATCH] x86: apuv2: Fix softdep statement
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.de>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jun 29, 2019 at 4:13 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jun 29, 2019 at 12:41 PM Jean Delvare <jdelvare@suse.de> wrote:
> >
> > Only one MODULE_SOFTDEP statement is allowed per module. Multiple
> > dependencies must be expressed in a single statement.
>
> Some module init utils even do not support softdep.

not related to the patch in question... and module init tools has long
been replaced by kmod.

>
> Nevertheless, the message is somewhat misleading. It's not "only one
> allowed" =E2=80=94 this is not true, it's "only first will be served".
> This is how I read kmod sources.
>
> And perhaps better to fix them?
> At least I would rather support somelike
> MODULE_SOFTDEP("pre: ...");
> MODULE_SOFTDEP("post: ...");

it is a bug, because multiple softdep statements like you suggest has
never been supported.
Either by kmod or module-init-tools.

What it actually does is to replace the previous one. depmod will look
into the ELF and generate
a /lib/modules/$(uname -r)/modules.softdep file. That config file is
loaded by kmod as any other
config file with the same prio as others in /lib.

Implementing what you ask would probably be done with
MODULE_SOFTDEP_PRE() / MODULE_SOFTDEP_POST()
and let the build system do the right thing. Not supported today and
not easily backportable.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: Andy Shevchenko <andy@infradead.org>
> > ---
> >  drivers/platform/x86/pcengines-apuv2.c |    4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > --- linux-5.1.orig/drivers/platform/x86/pcengines-apuv2.c       2019-05=
-06 02:42:58.000000000 +0200
> > +++ linux-5.1/drivers/platform/x86/pcengines-apuv2.c    2019-06-29 11:3=
7:48.062005738 +0200
> > @@ -255,6 +255,4 @@ MODULE_DESCRIPTION("PC Engines APUv2/APU
> >  MODULE_LICENSE("GPL");
> >  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
> >  MODULE_ALIAS("platform:pcengines-apuv2");
> > -MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME);
> > -MODULE_SOFTDEP("pre: platform:leds-gpio");
> > -MODULE_SOFTDEP("pre: platform:gpio_keys_polled");
> > +MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:le=
ds-gpio platform:gpio_keys_polled");
> >
> >
> > --
> > Jean Delvare
> > SUSE L3 Support
>
>
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
Lucas De Marchi
