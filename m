Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 983BD66FA1
	for <lists+platform-driver-x86@lfdr.de>; Fri, 12 Jul 2019 15:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727291AbfGLNIH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 12 Jul 2019 09:08:07 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46567 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727335AbfGLNIH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Jul 2019 09:08:07 -0400
Received: by mail-pl1-f193.google.com with SMTP id c2so4742627plz.13;
        Fri, 12 Jul 2019 06:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/+LlX3B3GK6gzdUV29pQh7HN2WOr3wu9bemUTyrzY8=;
        b=E39w18PFiWeQhTjrabdORWHwdDJNL62AEaCIwYmr4jBJuWjbG/BXHIcCXAGCaraA/x
         NaTPcxKeYs9qGJwkxlw4X4l6Tr7aVtrV7G7lFKNRfc+2fLROwyT9GOu1kDanxB54VfyV
         +tH/enWGbzxP/znQ35j5/FWkec/QqeccAP3x5YipIuidSYcwzEqpJI56zEispYp7JNml
         AVv5wVEHaxd2MROzG2314YMqJnR7j35HkSWjFuC0mrMu/hjhNi6IYMbKY2tzgvrWhnk7
         hYjOgfnmHRWwR7iv6se6IwQ8qvA83qVSGQ+PxZr/CQyFI/Peduas6HYRrdkH4WYLWvWz
         mQ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/+LlX3B3GK6gzdUV29pQh7HN2WOr3wu9bemUTyrzY8=;
        b=T78TMh390lxX2iQcAUSAezetj7839pffm12BHya1b0Z0r7X2JZel3Mm43kQY1ZBKcc
         HbSaRmDg5BW5WnVQvD1WVV7q/tbEIG+hViX9hNSFjnSO4oOH5pkyLGlr9zG6tEYwGlCN
         hxht+zsbTdEA3yaFeBV0MeEe4x5GBGPFfGU1A4bTw6NVwsAcSTd/9EWvf5DBglGFiHSA
         Hay3txo32wXN92oBUJaIfcFdc/M+hk9dyBB3n4sQrC8fnha0jIs2fuMN4kweDjppuFub
         wDkDQGcSGWWvmHrQ0VI1SUx0hG/LMA2AMuWmeKYBDVwQGZ+gQlOsI5qG0WXwzXBzXzX7
         NrJw==
X-Gm-Message-State: APjAAAW1Bk+aMub6133vCZLACwuJMSDHe5zRNUfwA9FOMMGQDekKHbmF
        jQtURxFmMvCTqet8H59gV3NKN7JLvEFB4/B1SPI=
X-Google-Smtp-Source: APXvYqxSh6cQ1p47C7VHrhPhOFVjMS3zMNLTF75N1+ZULg2+Xs0sNUU8YkwS0FTHfB+jrdYvPzv5Pgj/5ks9F+e0MS4=
X-Received: by 2002:a17:902:9349:: with SMTP id g9mr11230348plp.262.1562936886935;
 Fri, 12 Jul 2019 06:08:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190709013842.17344-1-weiyongjun1@huawei.com>
In-Reply-To: <20190709013842.17344-1-weiyongjun1@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 12 Jul 2019 16:07:55 +0300
Message-ID: <CAHp75Vf5_UjW6mXhn-rLPNjSaeRTJt7GGaseTXObk3t5HO-CLw@mail.gmail.com>
Subject: Re: [PATCH -next] platform/x86: mlx-platform: Fix error handling in mlxplat_init()
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     Vadim Pasternak <vadimp@mellanox.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jul 9, 2019 at 4:32 AM Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Add the missing platform_device_unregister() before return
> from mlxplat_init() in the error handling case.
>

Applied, thanks!

> Fixes: 6b266e91a071 ("platform/x86: mlx-platform: Move regmap initialization before all drivers activation")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/platform/x86/mlx-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 2b98f299faa4..8fe51e43f1bc 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -2111,7 +2111,7 @@ static int __init mlxplat_init(void)
>                                         mlxplat_regmap_config);
>         if (IS_ERR(priv->regmap)) {
>                 err = PTR_ERR(priv->regmap);
> -               return err;
> +               goto fail_alloc;
>         }
>
>         err = mlxplat_mlxcpld_verify_bus_topology(&nr);
>
>
>


-- 
With Best Regards,
Andy Shevchenko
