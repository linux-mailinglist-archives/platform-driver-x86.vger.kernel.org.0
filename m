Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8FCB14680A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Jan 2020 13:32:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgAWMcU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Jan 2020 07:32:20 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38654 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726170AbgAWMcU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jan 2020 07:32:20 -0500
Received: by mail-pj1-f65.google.com with SMTP id l35so1231194pje.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2020 04:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zc8o67yU7TeI8P+0quC9ED0K/zMCW8wUMcpc20XgyF8=;
        b=m1icPr45TmAnHFvF3TmNtgmozX147KHau+GNgDPsY8e+kzAQnf72p5VzuVItqurWH8
         fcmzvJS/coBU3lBcsUvPBn/hmDdczgH+awGLX1x83Le96sfYOjIvFxbUl/bJ4jm8FjKB
         tgeX2aOcGn+2rsjgWD1t69dfmOrLy9N1by6/YjH0k78gwKnrfpOmomQsQhGl7PFPtv4z
         xVP9steU1ACoPIo+nu7I2bGjoEIpDmd83+hwoJExn8DW5+gp+x+mP81qTryJmkDhZuRW
         0mPVzjB1++JU2RA1LIwuaPsP3AxNzRoagGkbqrvwuRlPBTuam8bESWxof2Et1f3v9DQg
         vQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zc8o67yU7TeI8P+0quC9ED0K/zMCW8wUMcpc20XgyF8=;
        b=JC/BhLp5JIKBJeSHV9GDoT4YL+ufuCsJZxjpe6Sz5gu304TtuDhEOnA6NVYyKYVZZ6
         oTPOMXwL7F+MYj1ZR5JyovXp56ELJmeY0UYm+4NGNvh2ICfPtyfvDlGtfMmsKfhgkSu1
         4Z8/tnj7F6YQb934TlU5zjsR7ikAeZYyscnixk+lwz+Q8zYCfMtlBIECX312xzxj2oQb
         ooWjDLrM6+VOEUe1ApKPvYGXVvwwSCaS+F0y02bvqq4RB1aDCpc4t4fLaKUMxBYOJarE
         dtgnuj/vLGms1pPTgs686o9dbk0z+X4xiJBEiEz/WrFQiYMjB4xgQPgqat3Tngp4ii+6
         p6FQ==
X-Gm-Message-State: APjAAAWrlWuUATAVrECkCMxEGPdksUy4EU+BdiPXFSto50y9Qyh8tvqo
        m0ZCyG12raLiRhf9Ch1tKMogtHNOc6GOKi1wbxY=
X-Google-Smtp-Source: APXvYqyFQrWwiC2cgqYo1NCoZiqWum2ZeVE3XeQfwJlTF3VW0QdtO2QyxVecBf1YrgnpbRV30D6hsKOWww3SlBGvYeQ=
X-Received: by 2002:a17:902:a9c7:: with SMTP id b7mr15775308plr.255.1579782739602;
 Thu, 23 Jan 2020 04:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20200122160520.55362-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200122160520.55362-1-mika.westerberg@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 23 Jan 2020 14:32:11 +0200
Message-ID: <CAHp75VdCHuyGjLA=KUJVd2ELx9B_5QBX7KbZjAnOxXLxkxMFZQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel_mid_powerbtn: Take a copy of ddata
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 22, 2020 at 6:06 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> The driver gets driver_data from memory that is marked as const (which
> is probably put to read-only memory) and it then modifies it. This
> likely causes some sort of fault to happen.
>
> Fix this by taking a copy of the structure.
>

Pushed to my review and testing queue, thanks!

> Fixes: c94a8ff14de3 ("platform/x86: intel_mid_powerbtn: make mid_pb_ddata const")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> This was part of the bigger series [1] but I'll send this one separately
> because this is just a simple fix.
>
> [1] https://lkml.org/lkml/2020/1/21/678
>
>  drivers/platform/x86/intel_mid_powerbtn.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
> index 292bace83f1e..6f436836fe50 100644
> --- a/drivers/platform/x86/intel_mid_powerbtn.c
> +++ b/drivers/platform/x86/intel_mid_powerbtn.c
> @@ -146,9 +146,10 @@ static int mid_pb_probe(struct platform_device *pdev)
>
>         input_set_capability(input, EV_KEY, KEY_POWER);
>
> -       ddata = (struct mid_pb_ddata *)id->driver_data;
> +       ddata = devm_kmemdup(&pdev->dev, (void *)id->driver_data,
> +                            sizeof(*ddata), GFP_KERNEL);
>         if (!ddata)
> -               return -ENODATA;
> +               return -ENOMEM;
>
>         ddata->dev = &pdev->dev;
>         ddata->irq = irq;
> --
> 2.24.1
>


-- 
With Best Regards,
Andy Shevchenko
