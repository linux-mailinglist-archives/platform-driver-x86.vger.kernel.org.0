Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C87671ADE9A
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Apr 2020 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730654AbgDQNk6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Apr 2020 09:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730597AbgDQNk5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Apr 2020 09:40:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EE69C061A0C;
        Fri, 17 Apr 2020 06:40:56 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t4so970263plq.12;
        Fri, 17 Apr 2020 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MAaMtEj3RgglAUis7HGTsnnOllj2iSHv3cdxkKdJDtY=;
        b=cgOyn+qDm93DESRrCfdjaIr0cSlgIfsEQVZEKY7JsB5ZLCuP5WEUPJtY3Y8NcwmB7H
         tIZ63sWcTBGC9H/Uc0rH7kjlDQbYw6mxLMxYFQkv9d7N1iUyw9GDFOGzoKbNxsjqb5X7
         oBwuq1wsU9PbY1hAisdogOhwuRzjUs/yUdI78askgrHVEEsj+9s/CUQ8BrIwvcjiSSrh
         8LmCuxEhBqvi+ok499CvbXNI2zd0QabZXNZTCY5uMHQpNp3KzB0YAdD+ptjH3qVLQPu0
         LE91t7rONnHrqBczzDhamZ9COKnJu5kiTD6i+tRrxMvNqaHTPiYqsxouAVLiytpr97s0
         uxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MAaMtEj3RgglAUis7HGTsnnOllj2iSHv3cdxkKdJDtY=;
        b=H7tOWqF4iOlhH5SGLdn6/oNSjxF30KERd5GsWf4CE6nelkINIrITI+QpUav/xBze/6
         I/QWVWN6cWoHCjK9QFSzVRaWyf3TGoyNN4RtToQg0Pb153WFcpZrl2lcCK16/7Zob53d
         ZMgi26v6Gds+Rl1VxsEtNLxpN8P/bzawmEOIXFhJPew7Pt4pbrQoBhenTWuihnHVKdUG
         y/rqyC01nm3x3A09LjJ9lGrVClzXT9mk+Bz0h6ug4AQTNCcGkuO1c2fngM5QPpsTWtah
         wkOODSZ8lLTczt/hwh9pEUHiNRkI7e4vdGv+UjhAxSO1jTc0EQ/CdrvC+Kj7O9+VQYQw
         zAJg==
X-Gm-Message-State: AGi0PuZFQ2QFT111sNDR0M5IpAjZL4wzdXyuenUQu+KNjrG+SAHMkJ57
        lfa8SgeTnWXxOUeEFzlYFQ1BJ8cbYl5QCwu0NTs=
X-Google-Smtp-Source: APiQypJ0lhyAYJrcp1wa0z7uP3Pl8oxq/0jiVDfw+NJj6E/X3rbJgkJWmqOJFpJMAvSgdVdJDLOZkNpfevzC78PmrjU=
X-Received: by 2002:a17:902:aa09:: with SMTP id be9mr3605504plb.18.1587130855912;
 Fri, 17 Apr 2020 06:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200407093052.GL68494@mwanda>
In-Reply-To: <20200407093052.GL68494@mwanda>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 16:40:49 +0300
Message-ID: <CAHp75VdACZz2apwYT2LXxTsHwbzKo0eOLu0-Qts-4Um7jXynnw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: surface3_power: Fix a NULL vs IS_ERR()
 check in probe
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>,
        Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Stephen Just <stephenjust@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 7, 2020 at 12:33 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The i2c_acpi_new_device() function never returns NULL, it returns error
> pointers.
>

Pushed to my review and testing queue, thanks!


> Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/x86/surface3_power.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86/surface3_power.c
> index 946ac2dc08ae..cc4f9cba6856 100644
> --- a/drivers/platform/x86/surface3_power.c
> +++ b/drivers/platform/x86/surface3_power.c
> @@ -522,8 +522,8 @@ static int mshw0011_probe(struct i2c_client *client)
>         strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
>
>         bat0 = i2c_acpi_new_device(dev, 1, &board_info);
> -       if (!bat0)
> -               return -ENOMEM;
> +       if (IS_ERR(bat0))
> +               return PTR_ERR(bat0);
>
>         data->bat0 = bat0;
>         i2c_set_clientdata(bat0, data);
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
