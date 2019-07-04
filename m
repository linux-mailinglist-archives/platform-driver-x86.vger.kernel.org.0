Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3349E5F94E
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Jul 2019 15:47:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727160AbfGDNrx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Jul 2019 09:47:53 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33294 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727026AbfGDNrx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Jul 2019 09:47:53 -0400
Received: by mail-pf1-f194.google.com with SMTP id x15so2997207pfq.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jul 2019 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ou5CBjGU4jTIcBtBnDJPj2DYZyPidj7+4G76rh6s0k=;
        b=rObp21haPnOam+WlMS+qNn4+mP/apyi6i7O5VGXeNq5T5l0i95ZXJegOfOfpzDf/gS
         lwO/d52svUTkEluQJgb4LR9Aj7GSgYAEuQLGEtF7657Sq3qqXCTq8d4AjFw+GyWx6NNk
         NSsFjRuNhaUZbhqB3Ktn0lfceINouJ8m/E1g4AKp48uYHANNG1w5ezzH0/5ryUHecXhy
         ZA5LBdYipdWr0jAgB47xZYJ0W/JysFkEXDp+S8RzFrzDmrB/s6TiYDjauLd5xCKEQzFi
         hFYi/9LlhR539XiZGriC489sXUTmrmc5qkH4fH2xO+uaZyyuCy8o/T4TGjnA5JmtvgA2
         NPHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ou5CBjGU4jTIcBtBnDJPj2DYZyPidj7+4G76rh6s0k=;
        b=NZNRr8Gc1Ia+pjtAawBtS0q4qyr4Vq3OkpcNxaV2AIOzizGgA/SSVH+hfP3sJAsMOv
         HE5u69pu9zvDf3I709zzOAnTiiIf3SJBL+tMQRM+sPsq49Up62l/K2QUhUuZvIM9dmRZ
         TELBfnD75VqgC3QYgyp7dy6SMDfVCoUSZcyOj+UJGfsX/tcIk2TwlPoEeQHZCz8v9zeK
         gj9ZPzKGllQ6P9Nq9mXpaOMV3gaec+ZakFoodX5dSJppD+fxs/zVNQZboWmdpDyzD9Ob
         uaM+QuFf8clooXAT+2ZqItr0kTz8op2wRSJJswYwlMvQU54r9GQ17MXaAQ26x+d+nF5K
         7YwQ==
X-Gm-Message-State: APjAAAV5+Y5o/IG9d7M/RdeDVmzZJLiZtOfxLHnFfHJaS8PyNruSf/nk
        cTo4T2G89s3dgknmuUoYvtHMASXhaFDPs7HXCXSrJBzUTUg=
X-Google-Smtp-Source: APXvYqyjhA5B1YUQFxuvTWEKR17ENvvypLAi8N8beLWeBcAxKsm1PCCPKYZ19QCpc4zAgSc4SJYaRPwC4KwVx2AEFc8=
X-Received: by 2002:a63:c0e:: with SMTP id b14mr43541671pgl.4.1562248072715;
 Thu, 04 Jul 2019 06:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru> <20190703154102.20002-2-Nemcev_Aleksey@inbox.ru>
In-Reply-To: <20190703154102.20002-2-Nemcev_Aleksey@inbox.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Jul 2019 16:47:41 +0300
Message-ID: <CAHp75Ve5N0uxrxMydB-kcWv=ZRhsBFmmENc4PNPPJZqwusYP6A@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/x86: asus-nb-wmi: Add Asus FX705GE support
To:     Nemcev_Aleksey@inbox.ru
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jul 3, 2019 at 6:41 PM <Nemcev_Aleksey@inbox.ru> wrote:
>
> From: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
>
> This model has an AURA RGB backlight,
> so wmi_needs_3_args quirk is required

Thanks for the patch.
Though it does two logical things, i.e. new module support and new key bindings.
Please, split it to two changes and justify key bindings.

P.S. To all your patches, please use punctuation, like period at the
end of sentences and so on.

>
> Signed-off-by: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 4bed95357a32..bf937321f42e 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -406,6 +406,16 @@ static const struct dmi_system_id asus_quirks[] = {
>                 },
>                 .driver_data = &quirk_asus_forceals,
>         },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. FX705GE",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME,
> +                                 "TUF Gaming FX705GE_FX705GE"),
> +               },
> +               .driver_data = &quirk_asus_wmi_needs_3_args,
> +       },
>         {},
>  };
>
> @@ -441,6 +451,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>         { KE_KEY, 0x30, { KEY_VOLUMEUP } },
>         { KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
>         { KE_KEY, 0x32, { KEY_MUTE } },
> +       { KE_KEY, 0x33, { KEY_BRIGHTNESS_MIN } },
>         { KE_KEY, 0x35, { KEY_SCREENLOCK } },
>         { KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
>         { KE_KEY, 0x41, { KEY_NEXTSONG } },
> @@ -467,6 +478,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>         { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>         { KE_IGNORE, 0x6E, },  /* Low Battery notification */
>         { KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
> +       { KE_KEY, 0x7C, { KEY_MICMUTE } },
>         { KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
>         { KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
>         { KE_KEY, 0x82, { KEY_CAMERA } },
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
