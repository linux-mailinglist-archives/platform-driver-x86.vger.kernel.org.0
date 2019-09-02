Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3BCAA5A43
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2019 17:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730884AbfIBPMT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 2 Sep 2019 11:12:19 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:32917 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730108AbfIBPMS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Sep 2019 11:12:18 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so4077214pfl.0;
        Mon, 02 Sep 2019 08:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xc9euGGtT7Pr1uld4Ln2Q3TAbiAbjgOKZrQrgdPmz4c=;
        b=VA79ZNkQmBSRKN0dDuCM+h1WJX11zP8Urt3xHCvut3A2oVKBl0KAd5JIBqbCjUUdzL
         GG0siWyFZ9yxokmnzzOshSuIlmI9yLeufARi5xc8YHfA4Lt/FpeGnPWwEe+a9WJABOyQ
         rucF0pF8MdWLzUVtYrJChPJ9yxvVhIv8S+ebXSWNzpTSEl9F2SMFyUh8dDfE6a8Uj10K
         DfV9r79asr8MiWevVoUATn1C5CQ3CdmH8HIq/MvBVaMRPWbA4tNCP4FwDe1MzqsFE9PL
         BNtCTIl71DwgELDbhXtd7MElAdfLpYfBQunTn1V9gUDQVijzb7hKqlGpTGZU/+rZ1nLt
         BOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xc9euGGtT7Pr1uld4Ln2Q3TAbiAbjgOKZrQrgdPmz4c=;
        b=l7zsA+BphyvlwQKaJBD9+hrYgHLGIsJ/3jSb1BdVDk6NeNG41cG1ge1Y7U7h8pak/9
         //wCiER0QxWozeVX1WngMZOpXEimqUUmSfr5cB60f8p+e74wn0CQNJ58NvFui8I/QjZy
         QhAhITaA945GfUMcI6xhmk0v3ThMCQgEtfl584RL4zBiarVrsGbYAqoPPufdQT3VHKDz
         ozjkkci08RHAsxJkxMKunpacVVh8Wyv4jvCCWiU0ZLtr5KxjB2SbaUOWtDp5qEXfVhRs
         JYMPuHcAPlowk1eyPPbRkyA85mmLBejk1CHdqC01qck2AKRHNqDTnD0/tgeCupDW2fEk
         FvIg==
X-Gm-Message-State: APjAAAX6mjBTfoe8w7Bv8uyyGOHlU0Xrz0l6k8bf7AQn6YiuwY/INXYG
        4206qupjd0+eURijmjDjCyh2UaLAQgzNv52I95k=
X-Google-Smtp-Source: APXvYqzoJ7mS8gtUAr0mAUpJagYPd2XrREz1MfYPybV1BVR0VLquAZnGjeubkuYNh8/QGq8RFPLKyDTxMzPtivKOvVo=
X-Received: by 2002:a63:1020:: with SMTP id f32mr26595688pgl.203.1567437138024;
 Mon, 02 Sep 2019 08:12:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190902143850.GA607@mwanda>
In-Reply-To: <20190902143850.GA607@mwanda>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 2 Sep 2019 18:12:07 +0300
Message-ID: <CAHp75Vf=8L8fk0a=9auX5RboF8yCnfmz3JH9OGT7yAV3ZX1ybw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix condition in charge_threshold_store()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Sep 2, 2019 at 5:41 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This error handling is reversed so we return early.
>

I will squash to the original commit since it's not yet upstream.

Are you okay with this?

> Fixes: 84d8e80b0a36 ("platform/x86: asus-wmi: Refactor charge_threshold_store()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 14467748b343..848b23764fc3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2068,7 +2068,7 @@ static ssize_t charge_threshold_store(struct device *dev,
>                 return -EINVAL;
>
>         ret = asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, value, &rv);
> -       if (!ret)
> +       if (ret)
>                 return ret;
>
>         if (rv != 1)
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
