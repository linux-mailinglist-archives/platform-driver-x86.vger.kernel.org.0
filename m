Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D591E547
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 May 2019 00:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfENWm5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 May 2019 18:42:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:35527 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726348AbfENWm5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 May 2019 18:42:57 -0400
Received: by mail-pg1-f194.google.com with SMTP id h1so290023pgs.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2019 15:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gfMRsBSy1jiQcv1Chl7Qaa54Wl5696PJs/BYDhVbW3Y=;
        b=Dheosl84gGKstsmLmbpWqzWvDCxkYVadWhttkNXAh/ji+24TPCGYOrfUuG5DjEl1en
         ZFf041CnlfLQvm5R4EgjogqHhYOIlRo5MZouEcQaveuv1dOMKbtO18gUKPymYNnNX+dW
         6PsBWqN++3z5FY8JCnEwUKszuN+EJ858/2xRuB077tkV/YWBq2te9nSP8/vKA5A5cv6h
         b5BfxPT82tL6WOwd2uLJaoSFUoYxm4OhJkGgRajTGNkx77/6vnAWTy5iUttpS/hBnp3Z
         aTencc6SBrAUmEwhnG3yNxC4d+WlqEaGbq3YForQ0zMoVmZ/TzLVBFVx8BoSRfFBsH9M
         U//Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gfMRsBSy1jiQcv1Chl7Qaa54Wl5696PJs/BYDhVbW3Y=;
        b=U5h4TQ+jH+8vRQ1YQmCmzmAnUPD2c3p6+GBt5ZclqkXL6lnV9fh/58YIeTEUCXekhl
         +Tr2KH75CR/Tg12g6iR5eLgdzfArLCzCxLqbagSbVvzsgqYeTEpxxPKugqGFxqF2GiW5
         UJPg2F55ebT8w7KjfZUm/IAnxQUCJ6YInbn8m5R2lBgULQiAflGx+3RhZl9WvImOcA5U
         O67Q+3eA82vD6WUprUoWY/f21OlkCX/+eF/cLPPbNr3i8q+7gCooMtht/j6y8vB1F4zb
         3jlx2qsENbXopx3YCIPJsgEJWyFarNnd0LVCQl2bFtshaoBDW00L8HB4SKNwlFL66PZo
         nWeg==
X-Gm-Message-State: APjAAAUwdngr4avGcuD8SpCzsfS7vvDlNoOkRCey1EVqWNXFPkQXV4UY
        2ZaeguPNDnvTqOm5r3I0dO7xXiz1twOt+bUTUdo7roIiYdA=
X-Google-Smtp-Source: APXvYqxukrxp/yTUKE0PWkzDyeJy5qmGGDOIetZQ91K3Rf/U7qlMDep2GfkdHS2nUiuT9EJy4JsHWI/KMBabOCCTuZA=
X-Received: by 2002:a62:6341:: with SMTP id x62mr42733537pfb.63.1557873776437;
 Tue, 14 May 2019 15:42:56 -0700 (PDT)
MIME-Version: 1.0
References: <999f988f-63ce-ee29-6cb5-42d4bf94fdbe@redhat.com>
In-Reply-To: <999f988f-63ce-ee29-6cb5-42d4bf94fdbe@redhat.com>
From:   =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>
Date:   Tue, 14 May 2019 15:42:45 -0700
Message-ID: <CAOcMMif8wK-mtSLNsV9X07uR8D1TAt0aDKnCyNFpMQ1pRB3_vg@mail.gmail.com>
Subject: Re: Commit 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS
 will handle the display off hotkey") causes broken display on Asus 1025C
To:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        sashal@kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        ben@decadent.org.uk, hackurx@gmail.com,
        Linux Upstreaming Team <linux@endlessm.com>,
        =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Hans, thanks for reaching out.

On Tue, May 14, 2019 at 1:23 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Jo=C3=A3o, All,
>
> I've been helping a Fedora user debugging a problem where the backlight t=
urns off and
> never turns on again with newer kernels:
> https://bugzilla.redhat.com/show_bug.cgi?id=3D1697069
>
> At this point I'm pretty sure this commit is the culprit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D78f3ac76d9e5
>
> The breakage happens between 4.20.4 and 4.20.5 and that commit is the onl=
y one
> standing out; and blacklisting eeepc-wmi fixes things.
>
> For now I'm going to add a new DMI quirk for this (patch for this will fo=
llow later)
> but this is something to keep in mind if we get more reports about backli=
ght/display
> breakage on eeepc laptops. I'm thinking that maybe the new behavior intro=
duced
> by commit 78f3ac76d9e5 should only be applied to laptops using
> asus-nb-wmi and not to laptop using eeepc-wmi (the code modified
> by the commit is common to both drivers).
>

Actually there was another report from a user via private email with
similar symptoms on a Asus Eee PC 1015BX -- no backlight after
starting the kernel (probably after eeepc-wmi is probed) -- which I've
been meaning to reply for a couple of weeks now, so I'm also cc'ing
others involved in that thread. In that case the user was able to work
around the problem by passing acpi_backlight=3Dvendor, just to add an
extra datapoint.

> Jo=C3=A3o, can you check if the 11 models mentioned in the commit msg
> (or a bunch of similar models you have access too) are using asus-nb-wmi;
> or eeepc-wmi ?
>

All of the 11 models where we saw this problem are using asus_nb_wmi:
E203NAS, GL553VE, X441NC, X441UVK, X541UVK, X555DG, X555UB, X555UQ,
X560UD, X570ZD, X705FD.

Furthermore, from the 144 Asus models we have in our database at
Endless, only 10 probe the eeepc_wmi module: D320SF-K, D415MT, D520MT,
D640SA, D830MT, G11DF, V221ID, V272UN, ZN220IC-K, ZN241IC.

6 out of these 10 also probe asus_nb_wmi: D640SA, G11DF, V221ID,
V272UN, ZN220IC-K, ZN241IC.

And the 4 that only probe eeepc_wmi are all desktop models: D320SF-K,
D415MT, D520MT, D830MT.

I agree with limiting this behavior to asus-nb-wmi only on mainline --
it will still apply to the original affected hardware, and it is much
better than keep updating a list of DMI quirks. We will also need to
send it to a few linux-stable branches as well.

Best regards,

...........................................................................=
...........

Jo=C3=A3o Paulo Rechi Vita  |  Endless
