Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22A2B3D55F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jun 2019 20:21:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407018AbfFKSVv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 14:21:51 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:39360 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405802AbfFKSVu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 14:21:50 -0400
Received: by mail-pf1-f196.google.com with SMTP id j2so7950808pfe.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jun 2019 11:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7X7l5zKPHXomoBUE/m5zRGh3FFo9aSBqPG/JWRyBMBE=;
        b=A4fBoUd+O05obaFFUQknCkQydoZy63TLrv+0b0zz0ojEaKcmiQrYGdr9+3rVUmmdgt
         6djZ/09hlwy52cK1uVzfRiWVH1GwaQQDzoN/LUeMrTKKsu3dv6utq/Q4LV/rJBp11BUv
         ZpSl5XQoPtrluqwrry1xig91kcRqz29pIr3QTyLQyd54ryNXn+zBIuLJA8HvTCiEiBCC
         LnV/6XnlMnrSWUOV3BMA7uzZ+Skk8qiYcvmXJZnzxY11ZwBjsWaxrwsMLRw87K3SNmD2
         5v6XD6zXVvjLmXS8VoyxNosCdLfzj9wXlo25CVtOqfCJMfVjfXYZcrEwN4TqdxB4IzTF
         bUYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7X7l5zKPHXomoBUE/m5zRGh3FFo9aSBqPG/JWRyBMBE=;
        b=FNVeoJIYTLD69YGD0Wr/rBrfewyqAQIRrvylG+KjengP1ODoprcvsuTYVgoh2DCdNp
         GqgTlRdCuTJDc25QOUjEtRceE38N5tHY+88drKHPxeoSMxlNFE3sY+SMWZlSTkWGUTr5
         dPfm+STgK9giwoXbJYSEd3BuByWgelFcLrscsz6RgJs9gma3VGICUUXlVbVaL73H+Bgk
         DYk+7ZdskW7Xs8P5GgMg5BopTj52TzKP9IKKQF7OX2VMDlaH8WAN21jDq/N/DGZtnbXq
         MLOYwleNHvAum1SCebTQ++ZePopZyF/CTu/Nn7tLwpI5/h+0IyfNwLTWqZlducwO9XKL
         lPOw==
X-Gm-Message-State: APjAAAU2bLt6pzLmC/LZE659Nn0PAdlmoaV6J12YyLMUfjClM+TEK439
        KPAK4mU3WRq1rBluEUEoTmLsDbiGVhbOcNyaYeE=
X-Google-Smtp-Source: APXvYqytw15hlcBXjowYQ0r4yX3J3zULHeYNxNlNxAZ7PdAbAeFJ9zuM7z7xF5ug+HKoDSee8BzEY8rUkF2Q2eJvWzE=
X-Received: by 2002:aa7:9159:: with SMTP id 25mr81192809pfi.64.1560277309746;
 Tue, 11 Jun 2019 11:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190529083405.332762-1-lkundrak@v3.sk> <c532c24c-3486-c331-a2a5-da6fbdf9dad3@infradead.org>
In-Reply-To: <c532c24c-3486-c331-a2a5-da6fbdf9dad3@infradead.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jun 2019 21:21:39 +0300
Message-ID: <CAHp75Ve7cdb_4kkhOBCtN3oqDtMmz1qQiowu1d0-FOMRE97cSw@mail.gmail.com>
Subject: Re: platform/olpc
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     couple@zimbra.v3.sk, of@zimbra.v3.sk, bug@zimbra.v3.sk,
        fixes@zimbra.v3.sk, Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 11, 2019 at 8:19 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 5/29/19 1:34 AM, Lubomir Rintel wrote:
> > Hi,
> >
> > This set contains fixes for problems discovered with randconfig and 0-day
> > robot running agaist linux-next and one rather embarassing problem
> > introduced in the last OLPC EC patch set version.
> >
> > They apply on top of for-next branch of
> > git://git.infradead.org/linux-platform-drivers-x86.git with two
> > patches from YueHaibing's set [1].
> >
> >   Platform: OLPC: Add INPUT dependencies [2]
> >   Platform: OLPC: Fix build error without CONFIG_SPI [3]
> >
> > [1] https://lore.kernel.org/lkml/20190528092806.20080-1-yuehaibing@huawei.com/
> > [2] https://lore.kernel.org/lkml/20190528092806.20080-2-yuehaibing@huawei.com/
> > [3] https://lore.kernel.org/lkml/20190528092806.20080-3-yuehaibing@huawei.com/
>
> Hello.
> Would some platform maintainer be able to merge the 2 patches from Yue and
> the 4 patches from Lubomir, please?  They would fix lots of build errors.

All pushed.
Sorry for the delay.

-- 
With Best Regards,
Andy Shevchenko
