Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 638D322E212
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Jul 2020 20:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgGZSrI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 14:47:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726072AbgGZSrH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 14:47:07 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9781FC0619D2
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2020 11:47:06 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id l2so1552200pff.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2020 11:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=o1L0NPrfNMhaJaBKbPMkLUFF8JvidGQpZ74k+q9GTPg=;
        b=enYhXXbdMpQYsKiiovsjaLIglKWY3ajkbr3mjfeA67cDxaNp1kYAlW7MVB5+rPUe8r
         tkIkIi3S4K/O/6oHmbcrWLPoam73cRG95/l5knyKbnKR7R6qjNSEReZNLW6xwBxSRoHW
         +nnvueaWPHJ1tsFeFnaXvKOX/ymW2/l4u2up5kDZjMx/96PH6GEG9wxhqswQrrmaAPiz
         T+6k/plDIOsv3CmBNM5DmobBz47+FdnCqc07A9tD8pEeeGFzzZdMAlpMvnW/N6YMAq01
         e9sn/IaffVz65+T4oTmzvVwpBejA0QZQkjDp4sF+r+9UEJl6l5dVReLJGHCNq+VeGQYI
         /lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=o1L0NPrfNMhaJaBKbPMkLUFF8JvidGQpZ74k+q9GTPg=;
        b=E8I+JhkSaOZ55W9qs0lCNmxHRFUMLVV62LH0+RumR9Hxuu1wMFRt5FFZMM8FAxcepH
         xpJ7MNN/5BGYEzn2sSGP+pgz4mhgiHMkQTB6KJSyvyY0WnkWoTXrCKMfAao5dZ+ucsXm
         h+z7uQr5Ht31KqS/k1L6QKEJQcYVntHYoyd+QXDrXVT8EgIYlkxTSc6vgOXMzqK64izx
         wD+0jA0pCczvrN/RJS1alPoJcn/wHYKRnJtmCnwrov1GJkFeTnR3rAdMR2vBemN5Cbyr
         h2WLOFZNw7+432wDXGXW4brD/LPzE8RGBdYH7Ss3JHvZlLZ4Fd9ET/LHcSYcW5xwrunD
         s0Zw==
X-Gm-Message-State: AOAM533XrYX+4AYuDnrmpCtNBG1+sQQB0cbmFZkGVp1O+aZJBcSsLnez
        XosTCEwmBS/wYz19PqiEJn1pC2rv5C5PJ86oR/U=
X-Google-Smtp-Source: ABdhPJzvu19T42T/Od/bddUC+qpJRTrj52TKOFrzkVwIFvji3dalug7NfUMrH8tHyMpqQ+cHg8rFN5b0vto9IXzxCB4=
X-Received: by 2002:aa7:8bcb:: with SMTP id s11mr16752049pfd.170.1595789226077;
 Sun, 26 Jul 2020 11:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com>
 <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com> <CY28tpMZZdjz8B1hhBfutTgVSOQ_3WTvF2sXScGvbYxBsQI3ozKDDIzW6WFYoXoYljn0rXMqmjibx_8r_Zc4gzuZYqUVpfeHDHnmTQ6GeMA=@protonmail.com>
In-Reply-To: <CY28tpMZZdjz8B1hhBfutTgVSOQ_3WTvF2sXScGvbYxBsQI3ozKDDIzW6WFYoXoYljn0rXMqmjibx_8r_Zc4gzuZYqUVpfeHDHnmTQ6GeMA=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 26 Jul 2020 21:46:49 +0300
Message-ID: <CAHp75VeZ4hEeHUe3E_UnYPLBCqF-PJwBVK3+2CG2J9qSJ4S0Ug@mail.gmail.com>
Subject: Re: platform/x86: status of thinkpad_acpi patch from January
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jul 26, 2020 at 7:39 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
> 2020. j=C3=BAlius 26., vas=C3=A1rnap 18:20 keltez=C3=A9ssel, Andy Shevche=
nko =C3=ADrta:
> > On Sun, Jul 26, 2020 at 6:45 PM Barnab=C3=A1s P=C5=91cze wrote:

...

> > > A patch series1 has been submitted to the platform-driver-x86 list be=
fore I subscribed to that list, so I cannot react to it in the form of a re=
ply,
> >
> > JFYI: patchwork allows you to download messages in mbox format which
> > most of MUA allows to use and reply to.
>
> I have never heard of that, but I will try to keep it in mind. Thank you.

You are welcome! It's usual practice how you can get a proper reply.
Also another possibility is to get somewhere the Message-Id header.
Most (good) MUAs allow inserting In-Reply-To (IIRC its name) header
with the provided message ID (derived from the corresponding header).

> > > so I resorted to writing to you personally, since you were the last (=
and only) person to react to that series.
> > > Patchwork shows its state as "Changes requested", but I don't see any=
 comments on v3 of the series. Can you please take a look and explain what =
needs to be done for it to be merged?
> >
> > As pointed out during v2 review [2] the work is needed to be done, i.e.
> >
> > "Don't forget to update any documentation if needed."
> >
>
> I don't know if it relevant, but in the first mail, the author writes:
>
> "The old names were not documented explicitly and new generic software sh=
ould automatically use the new attributes, which may allow to drop the old =
names."
>
>
> As far as I see, that is correct, those attribute names are not documente=
d anywhere in the kernel (except in the commit message of the patch that in=
troduced them) (at least grep didn't show any results). And the new ones ar=
e documented in ABI/sysfs-class-power.

Either way documentation should be present in the ThinkPad one.

> Possibly a warning could be emitted when software uses the old attributes=
? Or what do you recommend?
No warning, just provide documentation.

I'm fine if you (it seems the author is not you for that series?)
append a follow up patch with this.

Thanks for pointing out to this series anyway.

--=20
With Best Regards,
Andy Shevchenko
