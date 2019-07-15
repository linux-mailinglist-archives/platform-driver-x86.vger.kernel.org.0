Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8C76869E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2019 11:49:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729595AbfGOJtA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Jul 2019 05:49:00 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38155 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfGOJtA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jul 2019 05:49:00 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so7174642pfn.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2019 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZS0tVaV/HM9W0PalZZ5RKN8FIr9nkjMOZQusjWwD2/k=;
        b=SavgXsLnZZ4zOzITg9fOE33iDkhL2oatUpJ2m1Mq0zLYYAC3sWZbyNqTnEwGKdkKfc
         kuz4czd49NYU48Ly3veYJ1BojbdGvfDiq68M07QEmRmFQdH9SFwTv7M48fTXMhTA0BTm
         oe2eKIMZjwhEOwIbmvwxS8pCjmUl5JUqkgncoFpYey/eXP+yToS04xd00s61UaDCqVqP
         aeP2T2auWWUzKN/U+S/fgVRTefPf6A+5zxMD9dtpOF4C43N8mx9aW38JrElL+k9Yuu0A
         9qlM1zK/0gETpkYcelb1spyItLfzW9piAx3a0eTpHK9NhYfXUtz7ZtJ7qVHuXAY4mmXy
         NYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZS0tVaV/HM9W0PalZZ5RKN8FIr9nkjMOZQusjWwD2/k=;
        b=t1V8O6E3RM6L8k67OmWrEwN03Dmn+eWwf3u2HdENrKZoKvhk28P6zxFVwrzW35Eujl
         MUurqrzm+a5OJYKO5ZmeG4jnoedt48XjQzBsv3xVZh8ufGwgKzy8uQ7g3qcvYqe/shHW
         7KPtT9yD5xfoiUtUKrn3EQI6uEXSHV6lTR92xVsbXNxrDxempBVDKqnJ+h9Z0QFaMd5L
         1jshNoVDB4bRM2B0TY0PIL37GsmUHTXE3N+Y+KA9FlunAr91uGuLdjzj5+bQQThYDOs6
         Pfroz2XVAmQev9ciC5QPXaM2dQp/L25tcFb40J8uVLd+IrXgrPdifAnmOnpBiRccYy8s
         eqGQ==
X-Gm-Message-State: APjAAAWbV8nrA7MiQkl2AVeYoF7LLqBfy5v1cUIMjqDz9w9CapsBrGj5
        rbwb0/wYP79D1Zx4xq5n6CwCUL6CwidrxF/fDZOqbXU824Q=
X-Google-Smtp-Source: APXvYqw6YfQXl/JQMeywHr1hMQ1DeVZ2SzOCKROLF1jwIoXIGv9RIgatrGEdQU3Pceuix7ACE6Vl97RORObSv6oPAu0=
X-Received: by 2002:a63:f346:: with SMTP id t6mr26845274pgj.203.1563184139395;
 Mon, 15 Jul 2019 02:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190715064104.4514-1-drake@endlessm.com>
In-Reply-To: <20190715064104.4514-1-drake@endlessm.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Jul 2019 12:48:48 +0300
Message-ID: <CAHp75Ve1oV5urnZOth-99qiWZO54ehBQhP6u54oumqHs8F8pzQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus: Rename "fan mode" to "fan boost mode"
To:     Daniel Drake <drake@endlessm.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 15, 2019 at 9:41 AM Daniel Drake <drake@endlessm.com> wrote:
>
> The Asus WMI spec indicates that the function being controlled here
> is called "Fan Boost Mode". The spec uses the term "fan mode" is used to
> refer to other things, including functionality expected to appear on
> future products.
>
> Rename "fan mode" to "fan boost mode" to improve consistency with the
> spec and to avoid a future naming conflict.
>
> There is no interface breakage here since this has yet to be included
> in an official kernel release. I also updated the kernel version listed
> under ABI accordingly.

I would like to see if you have a consensus on this with Yurii. And by
some reason I didn't hear Corentin for some time.

> Please consider for Linux-5.3, otherwise we'd have an official released
> kernel using the "fan_mode" name which would be more controversial to
> change later.

I am wondering why no one commented on this before...

> -What:          /sys/devices/platform/<platform>/fan_mode
> +What:          /sys/devices/platform/<platform>/fan_boost_mode

>  Date:          Apr 2019
> -KernelVersion: 5.2
> +KernelVersion: 5.3

Probably date should be changed as well.

-- 
With Best Regards,
Andy Shevchenko
