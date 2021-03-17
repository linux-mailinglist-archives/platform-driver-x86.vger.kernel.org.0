Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A28BA33FA52
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Mar 2021 22:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233391AbhCQVL2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 17 Mar 2021 17:11:28 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:56917 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhCQVL1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Mar 2021 17:11:27 -0400
Date:   Wed, 17 Mar 2021 21:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1616015485;
        bh=jqFTJp2z+6yFHLVEf8NJwtdXVT8ul8w930UfQfkxYa0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=IoOQG3IIfTrcRyzBT/w8A18+HQ7NyRuozxV8kr27xJxlMA3VvCwcqTHVrPbnvq9OG
         gHPDtHSpwkaYPXrPZ+woz+T1DzefXeEGY6Bb1Ur48toAJ+qcvkWOyuD37LegjUf2o2
         O+GY5ImK8Us4IKSFKGlxU5ttTJG2Qqxvd0Vpp3lQ=
To:     =?utf-8?Q?Ambro=C5=BE_Bizjak?= <abizjak.pro@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: ideapad-laptop incorrectly sets RF-kill block on initialization
Message-ID: <mnJ0jnYMf3YuKnmsEAlDy3eUoYDYxLkik71c8kD1aL1bpchFA59g71nAUr8GAU0dVIhv4l4pxU4DvyMbVK5YRq9uDIcREW939N4mlqi5KIQ=@protonmail.com>
In-Reply-To: <CAJ4FQ9A=Xcom1d0fWVw+dRLX+yKAg3ACeXW=LgQEo9W-D7EfrQ@mail.gmail.com>
References: <CAJ4FQ9A=Xcom1d0fWVw+dRLX+yKAg3ACeXW=LgQEo9W-D7EfrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi

> I have found an issue in the ideapad-laptop driver which causes WiFi
> to not work on the Lenovo Legion Y720 laptop. It seems the issue is
> generally present on this laptop as can be found by googling and
> finding that the workaround is to blacklist ideapad-laptop.
>
> In the code comment here:
> https://github.com/torvalds/linux/blob/1df27313f50a57497c1faeb6a6ae4ca939=
c85a7d/drivers/platform/x86/ideapad-laptop.c#L1462
> it is explained that the driver has a list of devices which are known
> to have an RF-kill switch and for other devices it assumes that it
> does not have one. Since the list is in fact empty, one would conclude
> that the driver should never cause an RF-kill block. However on this
> laptop loading the driver has this exact effect.
>
> The reason is what seems to be a bug here:
> https://github.com/torvalds/linux/blob/1df27313f50a57497c1faeb6a6ae4ca939=
c85a7d/drivers/platform/x86/ideapad-laptop.c#L1001
> At initialization, ideapad_register_rfkill() sets the initial RF-kill
> block state based on reading the state of the possibly nonexisting
> RF-kill switch without considering priv->features.hw_rfkill_switch.

Note, that there are two distinct things at play here: hard and soft blocki=
ng.
The part of the code you're referring to here is concerned about the soft b=
locking
state. Therefore it makes sense that it does not consider the value of
features.hw_rfkill_switch.


> This is inconsistent with ideapad_sync_rfk_state() which sets
> unblocked if hw_rfkill_switch is false. The result is that
> ideapad_register_rfkill() would block but ideapad_sync_rfk_state()
> would unblock as soon as it is called. But on my laptop
> ideapad_sync_rfk_state() is presumably never called and the blocked
> state persists indefinitely. I have verified this by changing
> ideapad_register_rfkill() to use the same logic as
> ideapad_sync_rfk_state() which has fixed the problem.
>
> I am attaching a patch for master and 5.4, I have only tested the latter.
>

It seems from those patches that simply reading from that address causes
wifi not to work. Could you please add some printing to the driver without =
the patches
to check the value of sw_blocked? (e.g. pr_info("sw_blocked =3D %lu\n", sw_=
blocked); )
And also attach the output of the `rfkill` utility after the module loads
and wifi does not work?


Regards,
Barnab=C3=A1s P=C5=91cze
