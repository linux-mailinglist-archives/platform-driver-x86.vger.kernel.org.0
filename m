Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C171C5558
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 14:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728481AbgEEMXS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 08:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727090AbgEEMXP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 08:23:15 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A75EBC061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 05:23:13 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x2so806859pfx.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 05:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LcO9I2rZzy3UzxqcLiRVPCuAooSF9fXmC1mwez1vHGc=;
        b=ll+mnFfvxH0wlJR2assLfinTlhOkNvwv6H3nEaHhEQd7IqV1FU5nETm2YAd2cfjchN
         yBfZAmfbtcCfAWivcJG81i44q1yc4wkxEhEL8tqDhEdTyIdfnwJsCXT8RCCKuJk2PTr+
         sctKtkDO5dHgwT3f4ltncJVQP7FbNq2wlZINw3iUYsEtN3pxyEnk/bwfGucSPOI22HJf
         QnL4TEFDFq20Yd2Ve52yqreW70PA3l/nDr3aM1k4mKqXXfSCynxiglNASR+bh80jIRME
         xsmyiUHW8hj424vkzG6TlYmLdBqliXdQyy1gFbdhaccwrTwAyU8QX0z5J75Wc5JQV2NH
         FJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LcO9I2rZzy3UzxqcLiRVPCuAooSF9fXmC1mwez1vHGc=;
        b=Bh4OBUcfCppXu051/3Fcl2npWFiEpf1TiU/oAUVKe68SSZGSJiqz5SWnHwQqPuzHLv
         ppuSbgqnr4AJj30EUSW4GUMG/R41FE2e2p1OddfdsIy6VPdaFqfaYjWlP00OxUFGaT1/
         Femg+33VVfmTSRuoS6xoOFoUYsCIrQOAsCDinUlBriUWO/66nP8m99H8KNgoz8nep1+h
         wvrek9JGPyDZP5BMI2zZpXhW2TV325CpN8z+6WnGDFpoaEHFLdi9INBDTL/bMsgXyrPV
         WLLqb9+R2ixT4cz+akMBlxNNxT8uwtJHmQFmZ9HFaBtnLYUVQ1bCmvua9kN1ns0bp3Oi
         VP0g==
X-Gm-Message-State: AGi0PubItrxLzNjsE0RlFodedO7pIOxkwUc2uZ1KdaXs4h8HVED1Oi8J
        3r/gujurGLTwcw2zfoTARh9aSEi5+oGb5BZCA1E=
X-Google-Smtp-Source: APiQypLgUh99drDdzZfrimcGrJrY3F2qUZ8SEADWoSe7x545tC9pe0sz74ggQl5hRA9nSeFM2Tdq/TMzjHZV5nMJJFA=
X-Received: by 2002:a65:6251:: with SMTP id q17mr2683109pgv.4.1588681393046;
 Tue, 05 May 2020 05:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200505121518.271854-1-a@dun.ai>
In-Reply-To: <20200505121518.271854-1-a@dun.ai>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 15:23:06 +0300
Message-ID: <CAHp75Veb4Yz4Pt7crKpnCV=ZS496xe9uaC+EE5MNq6ARtD14KA@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: touchscreen_dmi: add Vinga J116 touchscreen
To:     Andrew Dunai <a@dun.ai>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 5, 2020 at 3:16 PM Andrew Dunai <a@dun.ai> wrote:
>
> Add support for Vinga Twizzle J116 Silead touchscreen which uses GSL1680 chip.
>

Thank you very much!
Hans, are you okay with this?

> Signed-off-by: Andrew Dunai <a@dun.ai>
> ---
>  drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 93177e6e5..a3ab19ab0 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -640,6 +640,20 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
>         .properties     = trekstor_surftab_wintron70_props,
>  };
>
> +static const struct property_entry vinga_twizzle_j116_props[] = {
> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
> +       PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
> +       { }
> +};
> +
> +static const struct ts_dmi_data vinga_twizzle_j116_data = {
> +       .acpi_name      = "MSSL1680:00",
> +       .properties     = vinga_twizzle_j116_props,
> +};
> +
>  /* NOTE: Please keep this table sorted alphabetically */
>  static const struct dmi_system_id touchscreen_dmi_table[] = {
>         {
> @@ -1054,6 +1068,13 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
>                 },
>         },
> +       {
> +               /* Vinga Twizzle J116 */
> +               .driver_data = (void *)&vinga_twizzle_j116_data,
> +               .matches = {
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
> +               },
> +       },
>         { },
>  };
>
> --
> 2.26.2
>
>


-- 
With Best Regards,
Andy Shevchenko
