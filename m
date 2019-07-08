Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2F8361B86
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jul 2019 10:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfGHICl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Jul 2019 04:02:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:44953 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfGHICl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Jul 2019 04:02:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id t16so7177100pfe.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jul 2019 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f8lZR3WkiN0jt3m+sBD7Me6m6+57ouLObgDFsqESFKs=;
        b=E4parbSDjf4CHoTFTSUPNKBHjrVY0uWVh+8brR5U8s9QWyaPV6ebny8R9p1J6htmga
         kskqYdACDITXUuL1oyf69r1GuSBaNcWS5FBeQWzmjFEKpn1W38wdEEN90UVGEVOboQIU
         B0lkD05Dy+DC05rpRauYVc591elH6yaPjxCVSD5iS3hNe+q6LKXMkbuzqvoDw/hr08rf
         dy13iTnoVY+2JEFEcQj0mxpDJglRi4uWo3Qn5yxwSoNfzpZNiG6IdryVkjPLSjK9tMwS
         HM0cYYKNmtrkyMrpRoJP9NvhVoAewGV4mvY2OcihN8Ubfzk7Ajo5c5BTkiIyxsE/yy9+
         Mviw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f8lZR3WkiN0jt3m+sBD7Me6m6+57ouLObgDFsqESFKs=;
        b=ucIS1oamgr/CHeNrpxs8LOnMwX5IOos0J3m2FNgatU9SxbA+mvHAxESKU8d9AqDYPz
         Hbsck6yqjPjrIla7Ad0H/HnKKbIsWbZPHvxxI241gDsE4szsY2G698KhnwERM+tRx3kE
         4dRv0qRoiivIZ0AWS+fibSCa0eY7aqzFY66stEWex38wfWAd/WznN5wZ7wFRPNPeV4t8
         IkqITjf1qNsnG+srLyLJCNIxCeUJkDZ9F63Z0cM212gSAO+H4HsEC0nGyfyf33T1H5O6
         r4pg//cIDelczsdCJnZcChn7A5IcikIPsmyxI4EzoOogIcAyViPkFcT/ttjhLTqacN8e
         Idxw==
X-Gm-Message-State: APjAAAWBRmOEwYs0ix2+cmbxnKAX0gK96A66oke0l/GKv+BWiOHA935l
        5eQjBDgVAdiwCJI7gXUx/vhoszQjxMwETpLHuQ8=
X-Google-Smtp-Source: APXvYqzRZZxt+Wmf3gPuO9qAVsSnHINZjO2WLvArGrBBIIIB+pWMG+zot6pYz4M0PlLM016romwidrTft2HfE+WK37w=
X-Received: by 2002:a63:f346:: with SMTP id t6mr22466269pgj.203.1562572960381;
 Mon, 08 Jul 2019 01:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190707113016.GA30635@arch>
In-Reply-To: <20190707113016.GA30635@arch>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 8 Jul 2019 11:02:29 +0300
Message-ID: <CAHp75VfceRDnuRtdD_mR6mMZF_LH7u1ptPRXiA=DUfgTGebCPA@mail.gmail.com>
Subject: Re: [PATCH] cs5535: use BIT() macro for defining bit-flags
To:     Amol Surati <suratiamol@gmail.com>
Cc:     dilinger@queued.net, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-geode@lists.infradead.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jul 7, 2019 at 2:30 PM Amol Surati <suratiamol@gmail.com> wrote:
>
> The BIT() macro is available for defining the required bit-flags.

Shouldn't bits.h be added?

> Since it operates on an unsigned value and expands to an unsigned result,
> using it, instead of an expression like (1 << x), also fixes the problem
> of shifting a signed 32-bit value by 31 bits. (e.g. 1 << 31. See
> CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN).

What problem?
You need to describe that (UB by the standard, though gcc works fine,
I never heard it utilizes such).

-- 
With Best Regards,
Andy Shevchenko
