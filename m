Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3B9C115C58
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Dec 2019 14:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726371AbfLGNTI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 7 Dec 2019 08:19:08 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38194 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfLGNTH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Dec 2019 08:19:07 -0500
Received: by mail-pj1-f65.google.com with SMTP id l4so3931294pjt.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Dec 2019 05:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ywv+goEIE3Zt13RmfoULU4hP3W109yLhqcPeZtuM4TE=;
        b=jVw5BAMNJA15wAlqQy6r/F18Vd3r0NuqZ8UdjuQaSnZK9gN7cSMSRrxV5GUxgpU8qA
         l5NEDlMDylfOtqemrQadko8f4MHFAXFa60xxP3UiD+cY9P4Kea0FrY/KF07qYXZajx12
         qUsbJsm3tkJQY+66gXyiuMmv5ZH3arXHNkuJxep+ON7+cPGON4y8/xW8S0aimycMyFMS
         UZmmupwfDWeY9yLE9nHkByIi7e81UHjZ6qLgfbvtny/EjA12QofPol4Raer0aRFSQZI8
         8jAhMKO6TWDgflu4i/0un2IgBrpwgpjSS/tQwkf9XTnHVTxrhreicAoqDZ1dOenRwgag
         SB0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ywv+goEIE3Zt13RmfoULU4hP3W109yLhqcPeZtuM4TE=;
        b=boWuO0elE4X3vIFN66LYXDR/tYR8XsprpByimDYqRuw1CDE/QDKLM4dEeXsgPyzVWH
         C5qnT1JERuD6P1mOJhGZu70dvEDOe2UXXJCwUxoWRFnAha3njktWMJ9mg8iZ7d8z4VZ2
         keSvvdyfWmbKeLSDFCfdxhRdAogjql0RGkSzbnlBeSwpEXVX4gOHKtN7FEJJoqVFGPXk
         V/stmV4Zk66yQ6DX87s84GUaoBQUOYtlAp/Ji/oJKlI9sliPsCcT9+i0H6u/QhUN4J92
         LWjAdaXj3pQAd9yIZBYosZ6uNjU94nd19gisExaQ/kEEE2F/OZmw9kHfXlVLZIzCuLQe
         QyeQ==
X-Gm-Message-State: APjAAAUMsqngLtDe2/JopXboTs980KeXlSldoNxUz4SrcYt6AP/ttRWN
        Q1G3n1/AgWewsyQZk3QlFtulvF+i4ilkhGsodyQ=
X-Google-Smtp-Source: APXvYqzf7FENNd7z6Y+VkvGyRl9Se6icyJCkGknBdZ2XkUXNgrz8kvLbRQtKTl36mFTTJMxwySxJv2YptntPMU2kGXQ=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr21566421pjb.30.1575724746960;
 Sat, 07 Dec 2019 05:19:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575103866.git.matan@svgalib.org> <61c52c2146085859728f496388d886581b877c41.1575103866.git.matan@svgalib.org>
 <b65e75e2-1036-8a4e-f72b-a70c3a390e83@metux.net> <CAHp75VdoiFyg+n0e42i3zJigX_=EwmH-qZxXf8pQTS49P0k2MA@mail.gmail.com>
 <6a260e8c-2de6-657c-c1ec-13b653f3d036@metux.net>
In-Reply-To: <6a260e8c-2de6-657c-c1ec-13b653f3d036@metux.net>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 7 Dec 2019 15:18:55 +0200
Message-ID: <CAHp75Vens=gtLeZePoW66eq2YjZV15Fr0gFbgstgghXGqCvW6g@mail.gmail.com>
Subject: Re: [PATCH V2 1/7] platform/x86: lg-laptop.c: Add module version and
 fix whitespace
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Dec 6, 2019 at 6:05 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
>
> On 05.12.19 13:32, Andy Shevchenko wrote:
>
> Hi,
>
> >> Does MODULE_VERSION() really make sense ?
> >> What's the exact semantics behind those version numbers (in relation to
> >> kernel version) - when do they get increased ?
> >
> > It makes no sense. The module version is equal to the kernel version
> > (SHA ID in custom cases).
>
> Maybe I've completely misunderstood the whole idea, but here we IMHO
> declare a module version that's completely orthogonal to / independent
> of the kernel version (whats seen in /proc/version). Some modules
> have it, others don't. Pretty confusing to me :(
>

JFYI (read commit mesasges there as well):
https://lkml.org/lkml/2017/11/22/479

-- 
With Best Regards,
Andy Shevchenko
