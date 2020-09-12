Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D621D2677F9
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Sep 2020 07:09:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725808AbgILFJN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 12 Sep 2020 01:09:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbgILFJK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Sep 2020 01:09:10 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A3CC061573
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 22:09:09 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id o8so16256425ejb.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 22:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=KcSOqwtQuHsjUzY4VfzFUZE+6x9AQ+MdtBpiBULmpC0=;
        b=DxVnVDdWhm8NXumbjmRkEuWbGX2+dmMH3XdnE9gLT1GC5/B9UGTUJGY3HNIgTTxCNB
         f6gS2JSzM3soBhHHrIEq5fzZ6ty6R27XXwCrbFi3ctNCugHMtbLBOleabC1AkEjACfsD
         wiXQhmwoTUoKWFgtFrHuwYcNHDgTodwuzBcxVcNZdgVv5bnsapbZ30qo23AER3kXxurV
         rDiQitM3qcKeFyuv6qt0Zt81KQYM8rHdaKLdqxEZ7NKbDXo3s8qn/i1Gsok5vUO1p85U
         Ia5vcfoHT1aFdGyr9MR8kWGk5zTiZHMRDN3i4oO3d8ZeG2Mfv0KYmk+04m0w2R0/RUfF
         HZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=KcSOqwtQuHsjUzY4VfzFUZE+6x9AQ+MdtBpiBULmpC0=;
        b=EESXAPkCDONqvYKs2rH8FrNIbMSsKlZN47cn+xJUgaSRfNCKAc/w4emCWQxEsHT4f7
         Q51u1q2tUALayMxOAMrikrxpfQ23s36Jq8eRyCT/Sdy02WTcdKymPPFzuSaEqiEtedI2
         hVSiJEbZjCSStOyDWecgDXnlPxnT+ERZCmz7Vsub3pLPWT+aItRjVxqoOahrCXPWdZ94
         Pp5gmeMMsofFUav4TnbwM3aTA+7QKS8K++e+bCP8v3+Nkl/a8XSkmovJQQE+IhtnBdA6
         as7UuXdY0injMI4YA20CPH39zxYKghPd9Tny8apfR5x4NYK+JgTcheb8PFBCE9XVKlwQ
         ufvw==
X-Gm-Message-State: AOAM533cxNQAlYlSl+uXit5aaYdSAmWXCIb1gN3cGBj3T0fdW0Qf9h43
        7/FC/mAstK90Nd0M9Z8yza8onR2wxEmYPytXOIw=
X-Google-Smtp-Source: ABdhPJxNrIY8DX+pGsH1tZe8JJm7wyRGzzZoJlqxXzLeR6evujNgQFZd34d5m+R5uiSF9FpSS1ZL+rSeVAsLT9+nkFA=
X-Received: by 2002:a17:906:f747:: with SMTP id jp7mr4626032ejb.22.1599887348329;
 Fri, 11 Sep 2020 22:09:08 -0700 (PDT)
MIME-Version: 1.0
References: <CANoib0GPQTABpuHrBBCLCwhRG7LMR215ZmKk-KazMzY7rYVP8Q@mail.gmail.com>
 <ed3a0dd2-0865-cb84-975a-2c8e9f28d6eb@redhat.com> <CANoib0HSpPR=dX7qbW-p62S1BGhYmARACcSQy-ag6B1tNT58Yg@mail.gmail.com>
 <ce966e85-7cd9-5373-f552-5e4347e00945@redhat.com>
In-Reply-To: <ce966e85-7cd9-5373-f552-5e4347e00945@redhat.com>
From:   Dmitry Tunin <hanipouspilot@gmail.com>
Date:   Sat, 12 Sep 2020 08:08:57 +0300
Message-ID: <CANoib0FdxEud0Rav8f1TxF28LS_1FBF4WucgdPM9BYqV+6MYvw@mail.gmail.com>
Subject: Re: Asus illuminated numpads
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <btissoir@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

=D0=BF=D1=82, 11 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 23:58, Hans =
de Goede <hdegoede@redhat.com>:
>
> Hi,
>
> On 9/11/20 10:40 PM, Dmitry Tunin wrote:
> > Hi Hans,
> >
> > Thanks for the reply.
> >>
> >> Hi Dmitry,
> >>
> >> So I found some pictures and when you say "press a button on the touch=
pad"
> >> you mean touch the icon in the top right corner of the touchpad I assu=
me?
> >
> > Exactly.
> >>
> >> So not really a physical button, right ?  Given that there is a keyboa=
rd
> >> HID interface on the touchpad, I guess that that corner-button is hand=
led
> >> in software by the Windows driver and the Windows driver then sends a =
command
> >> to the touchpad to switch to numpad mode and then the rest is handled =
by
> >> firmware in the touchpad.
> >>
> >> Which leaves the challenge of switching the touchpad to numpad mode
> >> (and back again).
> >>
> >> BTW what is the top left corner icon on the touchpad supposed to do ?
> > I don't have anything at the top left corner
>
> Ah I see, I went by this picture:
>
> https://tweakers.net/i/NE-bFDSJ5PKJU3d1u4r5DSzfWs0=3D/x800/filters:strip_=
icc():strip_exif()/i/2003833862.jpeg?f=3Dimagegallery
>
> Which also has a top left icon.
>
> >> What might help is as root, with secure-boot off, do:
> >>
> >> cat /sys/kernel/debug/hid/0018:04F3:30F2.0001/rdesc > rdesc
> >>
> >> This will give us the HID descriptors of the touchpad,
> >> which will help interpret the i2c traffic.
> >
> > 05 01 09 02 a1 01 85 01 09 01 a1 00 05 09 19 01 29 02 15 00 25 01 75
> > 01 95 02 81 02 95 06 81 03 05 01 09 30 09 31 09 38 15 81 25 7f 75 08
> > 95 03 81 06 05 0c 0a 38 02 95 01 81 06 75 08 95 03 81 03 c0 c0 05 0d
> > 09 05 a1 01 85 04 09 22 a1 02 15 00 25 01 09 47 09 42 95 02 75 01 81
> > 02 75 01 95 02 81 03 95 01 75 04 25 0f 09 51 81 02 05 01 15 00 26 78
> > 0c 75 10 55 0e 65 13 09 30 35 00 46 90 01 95 01 81 02 46 d3 00 26 93
> > 06 26 93 06 09 31 81 02 05 0d 15 00 25 64 95 03 c0 55 0c 66 01 10 47
> > ff ff 00 00 27 ff ff 00 00 75 10 95 01 09 56 81 02 09 54 25 7f 95 01
> > 75 08 81 02 05 09 09 01 25 01 75 01 95 01 81 02 95 07 81 03 09 c5 75
> > 08 95 04 81 03 05 0d 85 02 09 55 09 59 75 04 95 02 25 0f b1 02 85 07
> > 09 60 75 01 95 01 15 00 25 01 b1 02 95 0f b1 03 06 00 ff 06 00 ff 85
> > 06 09 c5 15 00 26 ff 00 75 08 96 00 01 b1 02 85 0d 09 c4 15 00 26 ff
> > 00 75 08 95 04 b1 02 85 0c 09 c6 96 8a 02 75 08 b1 02 85 0b 09 c7 95
> > 80 75 08 b1 02 c0 05 0d 09 0e a1 01 85 03 09 22 a1 00 09 52 15 00 25
> > 0a 75 10 95 01 b1 02 c0 09 22 a1 00 85 05 09 57 09 58 15 00 75 01 95
> > 02 25 03 b1 02 95 0e b1 03 c0 c0 05 01 09 06 a1 01 85 0e 05 07 19 e0
> > 29 e7 15 00 25 01 75 01 95 08 81 02 81 03 95 05 05 08 19 01 29 05 91
> > 02 95 01 75 03 91 01 95 06 75 08 15 00 26 a4 00 05 07 19 00 2a a4 00
> > 81 00 c0
>
> <snip>
>
> Thanks, one question, does the touchpad already work as
> a multi-touch touchpad, or is it in mouse emulation mode ?
The touchpad is detected as 3 input devices:

ELAN1401:00 04F3:30F2 Touchpad
ELAN1401:00 04F3:30F2 Mouse
ELAN1401:00 04F3:30F2 Keyboard

The first one works as a full feature touchpad with abs coordinates
and multitouch, the other two are disabled and don't work.


> You can check this by running evemu-record and then
> selecting the touchpad interface and see if you get abs_x/abs_y
> coordinates.
>
> If not then it *might* help to add the ACPI id for the i2c-client
> for the touchpad to: include/linux/input/elan-i2c-ids.h so that the
> drivers/input/mouse/elan_i2c_*.c code will be used for it
> instead of the generic HID code
Surprisingly it works without adding the code to elan_i2c.
