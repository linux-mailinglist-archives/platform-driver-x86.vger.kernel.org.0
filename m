Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E22A5AA58
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Jun 2019 13:13:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbfF2LNO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Jun 2019 07:13:14 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37229 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726874AbfF2LNO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Jun 2019 07:13:14 -0400
Received: by mail-pl1-f195.google.com with SMTP id bh12so4677784plb.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Jun 2019 04:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Q+M1OurAYJPDfU+M28C7lM9Ualhvr49CB9wvgx2AZoE=;
        b=I+rHEXcm9pS7BwHp8Wd9E501e1ZkrTnSUeYFOiNEEfHq1WezMQrcktdizKDUK6JHeU
         d08W3gdTMJWMfuxAuaZz6+QiNMOlXyFzrDaxuW8hsVIG/1nKH8+PKosAX1oIU/xGDe6R
         U466CNHbh1f+lC5ZvG+aJyJnuZ6bYRWzdjLFYi9et4+bnk7jujjz1Vpo3xvDxc/YzflY
         zii/8VSCYjv9XJDhxR05rpL0bRcf+ajshSza584XAYhH6AIYXBG8KUF+IGh1JG0tJL0T
         vD/y/948DsbCcuBAy/RapaRlb1zQe7BtLy72oH3TK/NuoyItnES8HR84PtUSXn3ciyyM
         V5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Q+M1OurAYJPDfU+M28C7lM9Ualhvr49CB9wvgx2AZoE=;
        b=CVrfxEUMDUzrv8anksnfq9N1T6SAqzyrAZzA68T6EyTmlK+5Ne7qMpEtrEeNifmU9K
         4IRuv2J7An9hqKRI8l5Qngr9JYM2pdlQSUfb9NL9K1NuNXNjoNpnvPAogltull/nrQeq
         eRxk/dfWI4wQLWRvSQ+NzEHwO6dPYZeouTSmG18ie0Ba6vJ/SVtsKKnRfEzeunNrGN4Q
         3j/BfVLauvLDdjYQfr7aFplxhBVfJG7xq9zkcYNe+L15AByco3l0m/kKR5JS4ZABgnOL
         SsjY8buww6dj0/XiJl7dETkhk+sDIdsztgwJDKnH7DLVckb5h49YxvSTVrZ4MR8moSEI
         qf+w==
X-Gm-Message-State: APjAAAXzKt3XEjrg9rD4KKccrYeINpaF+ILNRtCE80Tp3Dx5bspmCBYG
        GnkOPyS6f4lDlBP2hM26yVUGzR+ZEMAz44JhbpU=
X-Google-Smtp-Source: APXvYqwSwJnk7tgyGqw90/BpSKa4VdsftryTPxVWQ3Lm1xM7yoav+bsQOO/pRt7XwF8LJ06NaES8woLrmPKaGNTA0H0=
X-Received: by 2002:a17:902:694a:: with SMTP id k10mr16955636plt.255.1561806793636;
 Sat, 29 Jun 2019 04:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190629114136.45e90292@endymion>
In-Reply-To: <20190629114136.45e90292@endymion>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 Jun 2019 14:13:02 +0300
Message-ID: <CAHp75VcOSWVFCHX+gxRzVsjdLLt+3wOrt5mWjmYrM_GfBGN2yw@mail.gmail.com>
Subject: Re: [PATCH] x86: apuv2: Fix softdep statement
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jun 29, 2019 at 12:41 PM Jean Delvare <jdelvare@suse.de> wrote:
>
> Only one MODULE_SOFTDEP statement is allowed per module. Multiple
> dependencies must be expressed in a single statement.

Some module init utils even do not support softdep.

Nevertheless, the message is somewhat misleading. It's not "only one
allowed" =E2=80=94 this is not true, it's "only first will be served".
This is how I read kmod sources.

And perhaps better to fix them?
At least I would rather support somelike
MODULE_SOFTDEP("pre: ...");
MODULE_SOFTDEP("post: ...");

> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> ---
>  drivers/platform/x86/pcengines-apuv2.c |    4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> --- linux-5.1.orig/drivers/platform/x86/pcengines-apuv2.c       2019-05-0=
6 02:42:58.000000000 +0200
> +++ linux-5.1/drivers/platform/x86/pcengines-apuv2.c    2019-06-29 11:37:=
48.062005738 +0200
> @@ -255,6 +255,4 @@ MODULE_DESCRIPTION("PC Engines APUv2/APU
>  MODULE_LICENSE("GPL");
>  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
>  MODULE_ALIAS("platform:pcengines-apuv2");
> -MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME);
> -MODULE_SOFTDEP("pre: platform:leds-gpio");
> -MODULE_SOFTDEP("pre: platform:gpio_keys_polled");
> +MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds=
-gpio platform:gpio_keys_polled");
>
>
> --
> Jean Delvare
> SUSE L3 Support



--
With Best Regards,
Andy Shevchenko
