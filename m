Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D0026791C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Sep 2020 11:23:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725836AbgILJW4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 12 Sep 2020 05:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgILJWy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Sep 2020 05:22:54 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B0DC061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2020 02:22:51 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id a12so12681679eds.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2020 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=TIMNRN68rJ+/U3kG/u6A+6gLRbOI3kiP8ErLemv+2NI=;
        b=DZN6gdhSrzkoHXIyv9Ngfu8CCOemgoHr8i5Xdzfnc2hCxEylafiEEnC2/cFvP/hhJU
         wK4cpinBka3IXrKmW/XVLK986/5n/bLI5z2pCGPjVnu6HxCnAn49DWojW4WecK3EW/tC
         v2qIzCLRVYMQ/pMSEXzX5rP/eqfQOofJ9YhO29l+VvbibaLFhX5UV4SRq99mP2kRWxy1
         yy2Meq2P23CtUr/7tK0HZPhwyKbN3UWKvmt5sYyvj3NKa3CirHVOjDqHLfAlpBbNUiZR
         27K2JH0HXpDVyr0CJFGE/x6JAGNm3ymMoZRMw93ZITL4u0BVPOKt0WthJdqIX9efImfb
         Ec6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TIMNRN68rJ+/U3kG/u6A+6gLRbOI3kiP8ErLemv+2NI=;
        b=agbfItToYg3DgwlZtZvGy1cDj+4UYizMhzS8Usm4SVL1LprOMyAp5mO9GhzDTHx7aa
         wr2GjrEiNRBEW4NxsQKNOYiaKfWwvyRDSnVm+tPLA/aXfvudgwAM73geabVpToh1VoUw
         T0HYr+33i3YP55wl393OZodgQTKZ7fTHQxKgoMy2oYzj7TQqpEJi7ycvqm/k57DenF6P
         ZT+Yf5AT5zTOiqQHt5dUJ9lBEYpwMm1bAffV0QTAaT4niOurdFijkbfQHeu+BoONpm3Z
         9Q2qH8KGzjcGDg3GGueN+J5dunVj7IopV7K8mNHYt2Y0LawicDEwooFlytTOhNWkvu1S
         HZWA==
X-Gm-Message-State: AOAM530Hn9oRkFtr/gUNGOOIMpcAEFdDFMcpSvsg1mXkh3yM3G/wVaLj
        c79amMr6qFSjwLzZriTlPZxDTB+sL6zJyes0lA0=
X-Google-Smtp-Source: ABdhPJz8RXV+lHBe70HtmZL98KaZk7VBLQAR8r+ILTIC9lydWMVF4aTM5m2po6LjVf2E9zcxRl9KOk0YPtusPD/F7kc=
X-Received: by 2002:aa7:dcd9:: with SMTP id w25mr6925474edu.280.1599902568436;
 Sat, 12 Sep 2020 02:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <CANoib0GPQTABpuHrBBCLCwhRG7LMR215ZmKk-KazMzY7rYVP8Q@mail.gmail.com>
 <ed3a0dd2-0865-cb84-975a-2c8e9f28d6eb@redhat.com> <CANoib0HSpPR=dX7qbW-p62S1BGhYmARACcSQy-ag6B1tNT58Yg@mail.gmail.com>
 <ce966e85-7cd9-5373-f552-5e4347e00945@redhat.com> <CANoib0FdxEud0Rav8f1TxF28LS_1FBF4WucgdPM9BYqV+6MYvw@mail.gmail.com>
 <6245647a-558d-9e37-c36d-01f8c60f2509@redhat.com>
In-Reply-To: <6245647a-558d-9e37-c36d-01f8c60f2509@redhat.com>
From:   Dmitry Tunin <hanipouspilot@gmail.com>
Date:   Sat, 12 Sep 2020 12:22:37 +0300
Message-ID: <CANoib0HWStcoQF8duacp0ByCUYxz-bx3v3YOS8uvZ_Nj2iwn4Q@mail.gmail.com>
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

=D1=81=D0=B1, 12 =D1=81=D0=B5=D0=BD=D1=82. 2020 =D0=B3. =D0=B2 12:17, Hans =
de Goede <hdegoede@redhat.com>:

> Notice that as mentioned in a previous mail, with a Windows DSDT
> override you can sniff the i2c bus. This is not bery easy, but it
> also is not very hard. Various users have successfully used this
> method before to help us debug i2c-hid issues.

The problem is that I am a complete noob with Windows. I don't use it
for more than a decade. The last version I used and knew something
about its drivers was XP.
Nevertheless I will try it. But I am very sceptical about the result
because of lack of knowledge.
