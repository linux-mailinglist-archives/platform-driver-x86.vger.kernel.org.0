Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD09641C5D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jun 2019 08:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404869AbfFLGk1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Jun 2019 02:40:27 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:36769 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404464AbfFLGk1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jun 2019 02:40:27 -0400
Received: by mail-pg1-f194.google.com with SMTP id f21so2345960pgi.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jun 2019 23:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0cs8JYzb46kO4qmmQexEH4UoSfyIGK+VN7LZTdI41CU=;
        b=Q+DTZ1laGy/gMb6NhprBGkkb4djvW2uwXWFgf2e4AUWEcFd+o9mE/46y+CTqn9xk+E
         u6jhLDwNIyFO1HuXwYHENHdBgNgkCFheMASVRMZOegiV6LMLjhd3otlWNLM7j9jO/oUW
         pWCXyR2v4QdEAq5+aIdBfKaLX0lJgT2mdlrQYc32EEpy/b0XX1DDeDTsr1uRItL6UQk7
         FFV9Lr9bk2k5QZecIECKxLxg6FIv411fMlV5nJk5/sqsrMd51kiYrQyuttGoBpY1Vk9P
         c7z5dctFHqYdvUOxzUPfHxBYbwL0wDAVwSM7v2B/PaE4WMSYn0yZJaNElH7hzCtP4+GE
         yrIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0cs8JYzb46kO4qmmQexEH4UoSfyIGK+VN7LZTdI41CU=;
        b=rwzHr0qqkGu8uPV4mZ0YdSYhKgw05uvf5nPE2yaLtfoB2+loFjWwV7kWhBXaBUJEfT
         EB4YamjjfkY09DakrgTsZmlpyXpnYGR3hXCSjPPud/mLYxt476vWWW8iTNrQgy/XyDpA
         EdNPtcN6yYjhzmQgQo3JUgY/4UqegLr+1TTPL/rj7xW7sMJjHL69xtbXsIl2h4Y6aGxY
         fydfYmMmpYDeTe6/RS1xOH9RxQB3UdukhsNwbaJFZlwBfFpb5D5jS8cimromsT8tM4NZ
         aCBOR/l3b4dJ59GjkbgLD4hYIbKZwsaouyFFbIffulpOocUb5hamD1Bj6K/BSxIfB2Me
         I9lg==
X-Gm-Message-State: APjAAAU5c++4nRuM9rdNIIjrVrkVVpjlpyeoa4q8d2/7xCT2zVbQEwiM
        vRDUwndy+JUs+SuLBFTVTfPb9Vop8Xn47ixaKTsMf+eS
X-Google-Smtp-Source: APXvYqy35F2IrLt44YzYYbab0IaxtrC6FZwRIYHFExSejHssJwtS2k5MnqUnn/Tps3QUSouOf4jspW7qKemVV1pkZRE=
X-Received: by 2002:a17:90b:8d2:: with SMTP id ds18mr7155152pjb.132.1560321626681;
 Tue, 11 Jun 2019 23:40:26 -0700 (PDT)
MIME-Version: 1.0
References: <13513063.74pX3ZfeIS@sanji> <CAHp75VdtuqS1+hqXuLT-0qZiy4WANXhnSmHr6=hUSxheqpiTJQ@mail.gmail.com>
 <CAJ=jquaSc9qjYde7A75KxzGV+XRqJokunV5CbAM28Qge-_Zvrw@mail.gmail.com>
 <1525059933.1098515.1355095072.21C4A0BE@webmail.messagingengine.com>
 <1525062909.1113096.1355123680.2B2A0D81@webmail.messagingengine.com>
 <CAJ=jquZmqQitoHz_asNfqvQhEWepGmNRhY-1kRC+2oyFjoA59Q@mail.gmail.com>
 <CAHp75VcDMjaMWrj_h6Q-xm5AG=Cz1n1pzg1hwaOZGobdzRhfag@mail.gmail.com> <20190612004923.GH143729@dtor-ws>
In-Reply-To: <20190612004923.GH143729@dtor-ws>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 12 Jun 2019 09:40:15 +0300
Message-ID: <CAHp75Ve+jEfBxrZ3OJrN+CbQY1kbDfu2rpS5iNn5qgrbymeZBg@mail.gmail.com>
Subject: Re: [PATCH] Make power-button key report the button-up event when the
 5-button array does not exist
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Alex Hung <alex.hung@canonical.com>,
        Tristian Celestin <tristiancelestin@fastmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 12, 2019 at 3:49 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Tue, Jun 11, 2019 at 10:00:35PM +0300, Andy Shevchenko wrote:
> > On Mon, Apr 30, 2018 at 8:20 AM Alex Hung <alex.hung@canonical.com> wro=
te:

> > This is still in the patchwork queue by some reason.
> > Can you elaborate if this needed or not? If so, would it be
> > anticipated a new version?
>
> Looks another copy of the patch was merged:
>
> commit e97a34563d18606ee5db93e495382a967f999cd4
> Author: J=C3=A9r=C3=B4me de Bretagne <jerome.debretagne@gmail.com>
> Date:   Sun Jan 6 18:56:44 2019 +0100
>
>     platform/x86: intel-hid: Missing power button release on some Dell mo=
dels

Thanks! I will mark old one correspondently.

--=20
With Best Regards,
Andy Shevchenko
