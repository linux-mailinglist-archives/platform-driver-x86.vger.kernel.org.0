Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 488EC72756A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Jun 2023 05:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbjFHDFH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Jun 2023 23:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbjFHDFG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Jun 2023 23:05:06 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C570A2119
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Jun 2023 20:05:04 -0700 (PDT)
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 069193F13F
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Jun 2023 03:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1686193503;
        bh=1vQ4vBsPHZFIvp0lmOIOZNeJ60q4W0FkmiQFpeJvWyk=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=Q9MnWBA1uNgLjvlbeqNm4ZN3Q8t3eF2hyaY1u4IHz7GFFJRczIyOqjJButUU/AONf
         TFZxNVeAry8VIhlUgR0wMHV3kn2SlUmub4YH7bXvFiQwj2veB3GFTxHybcxtYJ/KUd
         9qfm/rSTOjkStxEBFzmI/9PZL1r0ZRBWW4KShijXMivLxadyeXkHS7S3K27vZZdNsw
         8K/jEcXgRw1z+wwfCW9Mv1yVXv4CVYTPmIyhNMG/KHw7aTeuuN2WR5UbEIw4+hzHAh
         qmRQX8rxRFZB+1ePHrqIyud1nrICtUZONfy3BC0oa+WxAX1sPk0mwtvXeGSR/hGjJK
         cgDykZOHMkEeg==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-561eb6c66f6so2071557b3.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Jun 2023 20:05:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686193502; x=1688785502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vQ4vBsPHZFIvp0lmOIOZNeJ60q4W0FkmiQFpeJvWyk=;
        b=AXZ4MSnQiBS2HW4vv1SUIuQnB4FKSzBI2li8GNRvorrmvgt8kNLIZ0p1A5eA79i7VP
         o2nB/35B26Awf2agb0MIx90lWuWl4LzhtCmc0G+17PJ7WNX68ftH/heUzi7Y9pEgGVqg
         9khaqbcd+BUIWt31XSkiSD7MhFmAXHbyNs5VExU/hA1Yz0k2V2c6Rg29VXQrMVzSkeV7
         orJxkqLOE6r8HUdyWjtPdQ/hwouEcMM8Cs3b57O7lNgXMUkK9vMHq2Ie6q2PPm8U3cll
         +EL0VIIWMi2JpeF1wwZsHq2ZYChnmfu4QRnPLS/kX3mYxaa258cE4FTToiAMZ6IosQnc
         Iymw==
X-Gm-Message-State: AC+VfDwLaHLXnPEunFS1EZ4m8bY7QZ3GsTo1Lsnx4z+bLbcwzOEGJyQJ
        lg+nfM6ggismLHBtUgdCHaH2otFd9lTFKsW6yQ2bu+3qdpAVcYdYm0e5nbkIJnkx2END+1Jmr0E
        FCN+SBwJxkhdDvMJPqn9XACG1KXK+RXK1AlHM1E1Kn1i1pWtyeg4YXdAnqN9bpbOntvQ=
X-Received: by 2002:a81:48c1:0:b0:561:e8e0:2e82 with SMTP id v184-20020a8148c1000000b00561e8e02e82mr7276432ywa.30.1686193501867;
        Wed, 07 Jun 2023 20:05:01 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5OG/0WOpJ4JMsi0Sr5CLFFxcJF1xF0hyBNpCcLAXdrvVJ7Q9KF//xANbCtmP0s8KjsNS+dMbKU4RsM6GTEQVk=
X-Received: by 2002:a81:48c1:0:b0:561:e8e0:2e82 with SMTP id
 v184-20020a8148c1000000b00561e8e02e82mr7276417ywa.30.1686193501606; Wed, 07
 Jun 2023 20:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230607034331.576623-1-acelan.kao@canonical.com>
 <20230607042032.GA28835@srcf.ucam.org> <CAFv23QmDNUFcPwvSQt5aUxtmHasfr8wrF72ObvcO-X19gfn=LA@mail.gmail.com>
 <20230607052724.GA29834@srcf.ucam.org> <CAFv23QkEdGnEz1q7vbyFCa9S9Dqh-zec72nRGyZ3wAz-8wpbvA@mail.gmail.com>
 <20230607062341.GA30618@srcf.ucam.org> <20230607065604.yaivqbbd3dkawxo4@pali>
 <CAFv23Q==r4newMXE3OWavRSRt-bEi5-qR0Vo-5HGLw4r9J36MA@mail.gmail.com>
 <20230607074732.GA31666@srcf.ucam.org> <457e2a4a-e28a-cd24-c129-4ff6162ccc36@redhat.com>
In-Reply-To: <457e2a4a-e28a-cd24-c129-4ff6162ccc36@redhat.com>
From:   AceLan Kao <acelan.kao@canonical.com>
Date:   Thu, 8 Jun 2023 11:04:50 +0800
Message-ID: <CAFv23QmVP4ZFAhAFBSx6ty-4fcQ-u9+uZb0xaD2gCJPCdpPvQg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: Add drm module soft dependency
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hans de Goede <hdegoede@redhat.com> =E6=96=BC 2023=E5=B9=B46=E6=9C=888=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=883:16=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Hi,
>
> On 6/7/23 09:47, Matthew Garrett wrote:
> > On Wed, Jun 07, 2023 at 03:39:33PM +0800, AceLan Kao wrote:
> >
> >> What do you think if we unregister backlight devices if the backlight =
type
> >> is larger than the current registered one.
> >> Do this check in backlight_device_register() and unregister backlight
> >> devices by the order raw(1) > platform(2) > firmware(3)
> >> And maybe introduce a sticky bit into the backlight device if the back=
light
> >> driver doesn't want to be removed.
> >
> > Hans looked at doing this, but there were some awkward corner cases.
> > When we first introduced this functionality, firmware was preferred to
> > platform was preferred to raw - but on Intel, at least, this behaviour
> > changed with later versions of Windows. I don't think there's a single
> > static policy that works, I think you need to pay attention to the hint=
s
> > the platform gives you. How does Windows know which interface to use on
> > this platform? The simplest solution may actually just be for
> > dell-laptop to refuse to register a backlight if the platform claims to
> > be Windows 8 or later.
>
> I like that idea.
>
> AceLan, I guess that you hit this easy while testing on a (development)
> Meteor Lake platform ?
>
> I have had other/similar reports about Meteor Lake platforms.
>
> On hw from the last 10 years dell-laptop will not register
> its vendor-type backlight class device because
> acpi_video_get_backlight_type() will return acpi_backlight_video
> there (1) so it does not matter if the GPU driver shows up only
> later (2).
>
> But it seems that on Meteor Lake the ACPI tables will no longer
> contain acpi_video backlight control support which causes
> acpi_video_get_backlight_type() to return acpi_backlight_vendor (2).
> triggering the issue you are seeing.
>
> Can you give the attached patch a try please ?
>
> Regards,
>
> Hans
>
>
> 1) Starting with kernel >=3D 6.2 acpi_video.c will only register
> the /sys/class/backlight/acpi_video# node after a drm/kms drivers
> asks it to register it.
>
> 2) The native GPU driver will tell the drivers/acpi/video_detect.c
> code that native backlight control is available changing
> the return of acpi_video_get_backlight_type() to native, which
> is what loading the native GPU driver first also fixes this issue.

Hi Hans,

Yes, this patch works for me, thanks.

BTW, I encountered this issue on the RPL platform.
