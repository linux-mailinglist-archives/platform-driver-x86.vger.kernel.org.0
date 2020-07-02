Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5754211FE6
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Jul 2020 11:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbgGBJ3u (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Jul 2020 05:29:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgGBJ3u (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Jul 2020 05:29:50 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22186C08C5C1
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Jul 2020 02:29:50 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id o13so10224584pgf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2020 02:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pGAFkWeUUH4iz7VKXUyVK77gvhyRjgh2Wem4x5J/nds=;
        b=gPOUqHKKaKiBGOqgYjaoTiUdbO+CRwl4p2JJVZxvVX7KMuhXBbDN35B/TOKS4X9FgF
         vCu9tW1zCsP/hYe4V0GacyJkibiy1lGvVzhRjEDCJIG74mCbqRk9kAjy4CmI6Jw0uoKE
         UZjCiY5gCvOFQI68eT9w/gYz8Bw6jdFpz6dndBxCChARUzobCjqNtGnmucyzTXPncK45
         8HHxbzyLJQ1u9ldLGCzWVmS2Nm4QTrlao8aN1e9KVxpQlnVqdvfDXOi/H/OBN2GSb4Zv
         EzBjCo2Sp+8zikaCiOgTYOaS7mv7vKdqs9cOhVgiwHcdPO1VtF8fJeQfxWZMUQ35eZm4
         xC6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pGAFkWeUUH4iz7VKXUyVK77gvhyRjgh2Wem4x5J/nds=;
        b=kLwZSUOFXOtUPGkOMKZ0eSr6lOWTFx9zUbnt3eOL2lvHLj0txSI4V3+bvRZbBTGxAw
         CXf8TvLTnkeSotUwxm0AK6aWIQ9asFoV6hfz87c0pTfAuJ5tyZACyr1djCNKyqoLFqw1
         hXXVCuQig5DgkvJu0im6/Ws2xBS7g0NloYUJwcTYUUz7SfK8sPDnbxaTnA4Wo8XJ+ZvA
         c7JGGOTjRbEmbiiFY/J8lekTrW10AEZ90zMRecClzPg5rVmDjAiVItjOqr7PER3ACX/a
         xMtV0+yBmiC62S3LpkITTQvev11+lDfwTY7N+SipO/2kkrOk9Y1fpz/pqRWcqLvUaboZ
         oUKQ==
X-Gm-Message-State: AOAM5331OqvSaqr46KP54iWsiiFLI6gTTW5BB4aa3FAeumBOcweMe2t/
        bpkIP51u7fMk7cevdyXT6o9QSvOwiioBuTyEKIU=
X-Google-Smtp-Source: ABdhPJw7j3D9vrHceSteDR9mOWW6nhYYSqnPRuGn48DOijfjE49eIvTNL+G+i1Zl+4IfThUce/gzg0riEqMyCGyN9Xw=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr34421pgi.203.1593682189527;
 Thu, 02 Jul 2020 02:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20200629191748.3859-1-markpearson@lenovo.com>
In-Reply-To: <20200629191748.3859-1-markpearson@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Jul 2020 12:29:32 +0300
Message-ID: <CAHp75VeO5SzYs=kRh+BV_vydO7PTPLkmu8aiYXvSJFTewSTYwA@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: thinkpad_acpi: lap or desk mode interface
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        bnocera@redhat.com, Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 29, 2020 at 10:23 PM Mark Pearson <markpearson@lenovo.com> wrote:

Thanks for the patch, my comments below.

>   Newer Lenovo Thinkpad platforms have support to identify whether the
>   system is on-lap or not using an ACPI DYTC event from the firmware.
>
>   This patch provides the ability to retrieve the current mode via sysfs
>   entrypoints and will be used by userspace for thermal mode and WWAN
>   functionality

Please use proper indentation (no need to have spaces) and punctuation
(like period at the end of sentences).

...

>  drivers/platform/x86/thinkpad_acpi.c | 111 ++++++++++++++++++++++++++-
>  1 file changed, 109 insertions(+), 2 deletions(-)

You specifically added a new ABI, where is documentation? It's a show stopper.

...

> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> +                       "dytc_lapmode");

One line?

...

> +       int output;
> +
> +       output = dytc_command(DYTC_CMD_GET);

> +       if ((output == -ENODEV) || (output == -EIO))
> +               return output;

Why not simple

 if (output < 0)
   return output;

Btw, how will this survive the 31st bit (if some method would like to use it)?

I think your prototype should be

int foo(cmd, *output);

...

> +       new_state = dytc_lapmode_get();
> +       if ((new_state == -ENODEV) || (new_state == -EIO) || (new_state == dytc_lapmode))
> +               return;

What about other errors?
What about MSB being set?

...

> +       dytc_lapmode = dytc_lapmode_get();
> +
> +       if (dytc_lapmode < 0 && dytc_lapmode != -ENODEV)
> +               return dytc_lapmode;

> +       res = sysfs_create_group(&tpacpi_pdev->dev.kobj,
> +                               &dytc_attr_group);
> +
> +       return res;

return ...(...);

So, we create a group for all possible error cases but ENODEV. Why?

> +}

...

> +       sysfs_remove_group(&tpacpi_pdev->dev.kobj,
> +                       &dytc_attr_group);

One line?

...

> +static struct ibm_struct dytc_driver_data = {
> +       .name = "dytc",
> +       .exit = dytc_exit

Comma is missed.

> +};

-- 
With Best Regards,
Andy Shevchenko
