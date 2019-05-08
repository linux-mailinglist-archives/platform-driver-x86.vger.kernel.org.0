Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ABA41829A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 May 2019 01:16:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727664AbfEHXQB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 May 2019 19:16:01 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:33557 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727476AbfEHXQB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 May 2019 19:16:01 -0400
Received: by mail-lj1-f194.google.com with SMTP id f23so385433ljc.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 May 2019 16:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rx0y6PQtDWpMB7dE4WTzT3yISSxb8pJ6fS91KAAE2fs=;
        b=X5NQ6RaS8EC1nu4gRLBpTlEsIT2tkLIDGg4XxjwiydTb8snqc62j9xFF8wCOh7pkB0
         9BLcr+9EcmSb2RPI6aO3m0J4z/WywXTZFadApdwuBPXBNXC32ndqwy65kQcXzxbNWIg6
         6nyUBMNH5r/JOXk6cfeXzR/SnqvmaXFwclvSn5sM9unSletf/hXLnY/pDo5ImF3IcWg5
         CTy/QJL8Xb2681vVVWGR94h8Q836lCuFMG8o/04E0Du+4E3DpecfA269C60AW1i1Vr1R
         osMDUJkl2oh5fOAI2uHQhu5iIDzMxz9Zzk2TB8CAgLhVtJwVcZbTQq8vA8YNv+kB8ZLT
         59oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rx0y6PQtDWpMB7dE4WTzT3yISSxb8pJ6fS91KAAE2fs=;
        b=MQoCweh2CBIyFwZwUVVPSJZtwC9acm0bawEOwyeB3pbqXR/dXH/ttoZS0VTSu/qLN5
         wo2myAQ6GwD2Apy0LwD1gHZNxU3ps7N5ciFdM3Upo2TYxa0uZPTHulpE+2p42f8CRopf
         9nvlHeOSssxDATQWp0AXHClVR0KL5XumlCy8CNaQ42XiiSKx9JVzcF5T+meQo/aqgB6p
         q9dBANfDI4Gt4AiAkDD/f2WNlACGJZqojiPGs890hVVdIoihkxowIWU1xYGlzrh5jPkT
         cnI5uMDJQmOTKUniBAxbmKWSM+reQDdTKzHmMBG3ENRuOdC6InC4KTM0tGSLn1il5zht
         hlFw==
X-Gm-Message-State: APjAAAXJyZEImKe18Tnd9WK8snMY5PdDBFjx2oKEywYjRSzGxJmag6Z7
        pTjkMm6XSEmXpcmIp8KI7+BLeVO9e8t+D7UIR2C6lQ==
X-Google-Smtp-Source: APXvYqwZdNmKqMgi/4nybYZl5Ciq1NCyMxq91349TSdCaOjV7hPZdrVfPjRjB1apQm5mL4vL/Yt2N2sG5ISkiDHeyVA=
X-Received: by 2002:a2e:8583:: with SMTP id b3mr267032lji.136.1557357358357;
 Wed, 08 May 2019 16:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190508173403.6088d0db@canb.auug.org.au> <fa0e68b2-b839-b187-150c-13391c197b99@infradead.org>
 <CAHp75Veq2=XA124rG8urt3eVE3pcaUm0VdsV7Mxr9zjMpa7mjg@mail.gmail.com>
In-Reply-To: <CAHp75Veq2=XA124rG8urt3eVE3pcaUm0VdsV7Mxr9zjMpa7mjg@mail.gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Wed, 8 May 2019 16:15:21 -0700
Message-ID: <CACK8Z6F2v8nyUYcnOrkp81WfK2D2NEmK=pcWybn1annrtqRwew@mail.gmail.com>
Subject: Re: linux-next: Tree for May 8 (drivers/platform/x86/intel_pmc_core_plat_drv.c)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Vishwanath Somayaji <vishwanath.somayaji@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, May 8, 2019 at 2:22 PM
To: Randy Dunlap
Cc: Stephen Rothwell, Linux Next Mailing List, Linux Kernel Mailing
List, Rajat Jain, Platform Driver, Rajneesh Bhardwaj, Vishwanath
Somayaji

> On Wed, May 8, 2019 at 11:45 PM Randy Dunlap <rdunlap@infradead.org> wrot=
e:
> >
> > On 5/8/19 12:34 AM, Stephen Rothwell wrote:
> > > Hi all,
> > >
> > > Changes since 20190507:
> > >
> > > The ubifs tree gained a conflict against Linus' tree.
> > >
> >
> > on i386 or x86_64:
>
> Thank you for report. Can you provide what is the config option for
> this module? I suppose it's built-in.
> Rajat, I will drop this from the repo, because I don't see it would
> have a chance to be tested in time.


OK, NP. Just to be sure I understand,

1) Please let me know if I should send in a fix (it would be
#include/linux/module.h and also add MODULE_LICENSE() I believe)?
2) Would this be lined up for next version though?

Thanks,
Rajat


>
>
> >
> >
> >   CC      drivers/platform/x86/intel_pmc_core_plat_drv.o
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: data d=
efinition has no type or storage class [enabled by default]
> >  MODULE_DEVICE_TABLE(x86cpu, intel_pmc_core_platform_ids);
> >  ^
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: error: type def=
aults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98MODULE_DEVICE_TAB=
LE=E2=80=99 [-Werror=3Dimplicit-int]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:40:1: warning: parame=
ter names (without types) in function declaration [enabled by default]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: data d=
efinition has no type or storage class [enabled by default]
> >  module_init(pmc_core_platform_init);
> >  ^
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: error: type def=
aults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98module_init=E2=80=
=99 [-Werror=3Dimplicit-int]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:59:1: warning: parame=
ter names (without types) in function declaration [enabled by default]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: data d=
efinition has no type or storage class [enabled by default]
> >  module_exit(pmc_core_platform_exit);
> >  ^
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: error: type def=
aults to =E2=80=98int=E2=80=99 in declaration of =E2=80=98module_exit=E2=80=
=99 [-Werror=3Dimplicit-int]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:60:1: warning: parame=
ter names (without types) in function declaration [enabled by default]
> > ../drivers/platform/x86/intel_pmc_core_plat_drv.c:42:19: warning: =E2=
=80=98pmc_core_platform_init=E2=80=99 defined but not used [-Wunused-functi=
on]
> >  static int __init pmc_core_platform_init(void)
> >                    ^
> >
> > and
> > WARNING: modpost: missing MODULE_LICENSE() in drivers/platform/x86/inte=
l_pmc_core_plat_drv.o
> >
> > --
> > ~Randy
>
>
>
> --
> With Best Regards,
> Andy Shevchenko
