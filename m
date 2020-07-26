Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D0D822DF1B
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Jul 2020 14:40:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgGZMkv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 08:40:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGZMkv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 08:40:51 -0400
Received: from mail.klausen.dk (mail.klausen.dk [IPv6:2001:470:1f0b:1730::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EC3C0619D2
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2020 05:40:51 -0700 (PDT)
Subject: Re: platform/x86: asus-wmi, huawei-wmi, thinkpad_acpi: inconsistent
 battery charge threshold attribute names
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1595767248;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=lhBcaz63TaNcUH+Wv3Yl3JONITUDMx8zvLqsFCjz1hk=;
        b=DYPcjVX6uPXNcqVZi3Kmp0RK4p7HsEc7ppGK9g6IBHREVOT3zyFW+keZz9rjFYstigfB42
        LepT313B2l2k7wQ/D3UWsVfiIKS54nmKxB0XeLeDSsfBDMp1wW8PBfeX5MnLksIMCdvo3k
        WbXh4+3OkOftU4RHZwS6gq+HpHoOniw=
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Ognjen Galic <smclt30p@gmail.com>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
References: <vtiHxEss03uciUomJSQ3Cf-m8xxvUUxqsaPRimyVrrMG7e9QItw2SngGu6b6tJ3N8PXOnMBwIys3BliV6rXJqEwaQguEp0pVpl5BmoCAzz4=@protonmail.com>
From:   Kristian Klausen <kristian@klausen.dk>
X-Pep-Version: 2.0
Message-ID: <416665e3-8b53-5189-8944-2e143736c5db@klausen.dk>
Date:   Sun, 26 Jul 2020 14:40:47 +0200
MIME-Version: 1.0
In-Reply-To: <vtiHxEss03uciUomJSQ3Cf-m8xxvUUxqsaPRimyVrrMG7e9QItw2SngGu6b6tJ3N8PXOnMBwIys3BliV6rXJqEwaQguEp0pVpl5BmoCAzz4=@protonmail.com>
Content-Type: multipart/mixed;
 boundary="------------EE13AB1B0118446C444A9926"
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------EE13AB1B0118446C444A9926
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 26.07.2020 13.38, Barnab=C3=A1s P=C5=91cze wrote:
> Hello all,
>
> The asus-wmi, huawei-wmi, and thinkpad_acpi drivers all utilize the bat=
tery hooking system provided by the acpi/battery driver to provide functi=
onality to specify the battery charge limits.
>
> The first two drivers create the following attributes for the battery t=
o achieve the functionality:
> - charge_control_start_threshold (only huawei-wmi)
> - charge_control_end_threshold,
>
> while thinkpad_acpi uses the following names:
> - charge_start_threshold
> - charge_stop_threshold.
>
> The userspace utility TLP looks for the attributes defined by the think=
pad_acpi driver. In my opinion this inconsistency should be promptly reso=
lved and the preferred names documented.

The preferred names is already documented:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D813cab8f3994250e136819ae48fbd1c95d980466

> A further detail that's worth documenting is the accepted range of valu=
es. thinkpad_acpi accepts [0, 99] for the start value, and [1, 100] for t=
he stop value. On the other hand asus-wmi, and huawei-wmi accept [0, 100]=
 for the stop value, and huawei-wmi accepts [0, 100] for the start value.=
 (asus-wmi does not support specifying a start value).
>
> I am in the process of writing a platform driver which provides this ex=
act functionality, that is why I would like both of the aforementioned de=
tails to be set down. I'd prefer the names used by TLP and thinkpad_acpi,=
 but it's really not important, I just want them to be the same for all d=
rivers, and that these names be documented. =20
>
>
> Secondly, one thing I can imagine is having two another attributes: cha=
rge_start_threshold_range and charge_stop_threshold_range, that contain t=
wo integers "a b", which means the valid range of values is [a, b]. Then =
I guess there needs to be another value that is handled, something like "=
off", which restores the platform defaults. This is, of course, requires =
more complex implementation, but is quite flexible. Although I am not sur=
e this flexibility is worth the complexity.

I'm not aware of any platforms with defaults implemented in
firmware/hardware, besides start at 0% and stop at ~100%?

>
> Or a simpler option is accepting [0, 100] for both attributes and retur=
ning -EINVAL if the provided value is out of range or the driver cannot s=
et it on that particular machine due to hardware limitations or something=
=2E Alternatively thinkpad_acpi behavior could be adopted as well ([0, 99=
] for start, and [1, 100] for stop).

I don't think charge_{start,stop}_threshold_range is worth the effort,
lets KISS.

>
> In both of the previous cases the behavior of the edge cases should be =
agreed upon: for example, what does 0 for charge_stop_threshold mean? Doe=
s it restore the default, or does it really stop charging at 0%, keeping =
the battery empty? And so on.

+1 for keeping the battery empty.

> What do you think?
>
>
> Thank you for your attention
>
> Barnab=C3=A1s P=C5=91cze


--------------EE13AB1B0118446C444A9926
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D
=3D+Ufy
-----END PGP PUBLIC KEY BLOCK-----

--------------EE13AB1B0118446C444A9926--
