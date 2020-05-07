Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188C31C9923
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 20:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgEGSTg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 14:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGSTg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 14:19:36 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0461C05BD43
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 11:19:34 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id b8so2840038pgi.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 11:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrGDfIy8Z5Lw4WJhHB8g8PQLRzKhcekiaK9ebdM7xB0=;
        b=ASJMJg2moiR660+soXhbT6vKqFZqgyOAY2+3Cr1VrPhj/p619LJMN+EPcq4yuiwxhU
         oBG6Jz4heGiRacut7uim3w8IVdTBxBQ1fufYkZ2GcternH0GA8Am/hfpPIh3BfDyX/HF
         0HPL5UXjpBMzZWrGIu2z+kTw4DsldGakwWqe6/nqlP9huFCZbq1YK0aGJlPi7WxFqLDH
         ZAsybzPdlW1HM+G8ErmGIZaOWPNWchcwjv44VpGCmev0ylb9Ln4lu64a5uEQpZsQ1Bx9
         3u/S1NzKd0UUiEWglVjZ4cYc9fFc4pJ05DoJNvuvJ5go46S2/5+ODuZRL3fZh6evzCeh
         ZNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrGDfIy8Z5Lw4WJhHB8g8PQLRzKhcekiaK9ebdM7xB0=;
        b=isa6RrlzKcbQOIyt1afTLd67kELL48OZuaZm81+sNTEtTiBvalkzBmHo2tlRfEItVR
         bPsOm4d+2R28Lf0LxaqwjMKnCRgWih2IB4Ls64Yz8bXsr9ZOgMrVKQ8dhEbcpnF/laKU
         Ostltreh9Jw/ZIePIqtUunaXHAkfq4Ryb+24/1aHtrTG1rpH8KrajlIQkuO2akvMkBbj
         Vqqv+KY52BLsHdIPXo9YTZP8JZgafCIrjP8T3T7d6VR8xNZLYtVUVB1BcYYqAR3VVIYD
         voFGtk5zD54kDO/iJudXDRvyPUCelJjLZZIcdQNH8eYxgx7+6sbxYsgV35nwm4F2iHtU
         dYaA==
X-Gm-Message-State: AGi0PuZZgfvEXpo3VphC67BXsAjScmJ4LD+CWJ+SgZAtXF8qEzXqTwT+
        lemVQme6JbpgimA+8uErdyYx5tLWIDt8t2sAEnaHAcC1
X-Google-Smtp-Source: APiQypID4xeSv3VN0hebw55FDSd+Rw+jxtt3VAhR/W1OL7W21WE3Itn3myYfpFBazqS0VS8UYNcuqbGLsCdpGdfp47k=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr12800680pgb.203.1588875574394;
 Thu, 07 May 2020 11:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200506121630.72382-1-malattia@linux.it> <20200506121630.72382-3-malattia@linux.it>
In-Reply-To: <20200506121630.72382-3-malattia@linux.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 7 May 2020 21:19:27 +0300
Message-ID: <CAHp75Vf5wSXrvNF5qixmYK3zgnw+0MNNhtCNp8QQUk2Wz9L_Hw@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] [sony-laptop] Make resuming thermal profile safer
To:     Mattia Dongili <malattia@linux.it>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 6, 2020 at 3:16 PM <malattia@linux.it> wrote:
>
> From: Mattia Dongili <malattia@linux.it>
>
> The thermal handle object may fail initialization when the module is
> loaded in the first place. Avoid attempting to use it on resume then.
>

The patches require prefix, "platform/x86: sony-laptop: ".
I fixed for now.

> Fixes: 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer objects for ASL create_field() operator")
> Reported-by: Dominik Mierzejewski <dominik@greysector.net>
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207491
> Signed-off-by: Mattia Dongili <malattia@linux.it>
> ---
>  drivers/platform/x86/sony-laptop.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 425707e8d188..2ec115f378b2 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -2278,7 +2278,12 @@ static void sony_nc_thermal_cleanup(struct platform_device *pd)
>  #ifdef CONFIG_PM_SLEEP
>  static void sony_nc_thermal_resume(void)
>  {
> -       unsigned int status = sony_nc_thermal_mode_get();
> +       int status;
> +
> +       if (!th_handle)
> +               return;
> +
> +       status = sony_nc_thermal_mode_get();

>

This line is redundant. But I fixed when applied.
Nevertheless, see comments to patch 1, which needs more work.

>         if (status != th_handle->mode)
>                 sony_nc_thermal_mode_set(th_handle->mode);
> --
> 2.25.1
>


-- 
With Best Regards,
Andy Shevchenko
