Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B389710E62
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 May 2019 23:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfEAVJQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 1 May 2019 17:09:16 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:42548 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfEAVJQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 May 2019 17:09:16 -0400
Received: by mail-ua1-f68.google.com with SMTP id h4so47849uaj.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 May 2019 14:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wf8ksqkRVK4oyVCJMyeMzEmCY6+2TIH7ALeORxibxXk=;
        b=f6G1ZksPI/h+lB6mB0xG7hOHTUI0dMAPgrgoLITmo/kPaPXQXVvynQdyTjGvrXw1Pb
         r8ZaFmPNBB5+yLEr5KxHOAfwm5fiGoIfObLdhSlswYLLuzEY2j8ZCKUFwZpquTvrqHpK
         AyiIDvr3b17hsR8rz4RiBoDHiqw5yh76yxO+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wf8ksqkRVK4oyVCJMyeMzEmCY6+2TIH7ALeORxibxXk=;
        b=NbJEJofqilsUEnVuftbv1VkkVSre52GxWgzAAL3C0ibHnVN0UWwBPkAxQD+cezgTiu
         pCsbgRlIoQ8OiAIRFKPxlS3rybAscp2U5iGHO/rPEgEcsFnqYzxSnvmolLwE0anQv+KJ
         zGYUmsJQSEltm2OhLeUBZ2GB4vMXsBd0fyV1iXcXfDM+bXRGspUvWaWl3Utxx4YwrR19
         AkKFcyBSFrUGgj2p+vLgiAtX6xOg9AgjPwLKEbtRO01PwFoHWCRuDRnh7EqwHKBv8dh6
         9qA0tF7NWPHyZUwnhPZoW2Ag0DjYhSIQzp1Dp/cGlcgaaWSQwXNRDjimPvj269dh/isY
         /b9Q==
X-Gm-Message-State: APjAAAUzTL6hL6NTtaBlhMFCrytYQ92uC6YG2G73yNvODfUpPFunr/lZ
        xizI7/ev2Yu1uQ43mwkWrGdFTGjH2DM=
X-Google-Smtp-Source: APXvYqx3mIy4F/0s+PBGgh5PyoCYfytJOHm4i817Bo88hi3KIj1jiQc/SjqU11Pbidqz0PcgrfKorg==
X-Received: by 2002:ab0:6887:: with SMTP id t7mr9409uar.24.1556744954022;
        Wed, 01 May 2019 14:09:14 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id c192sm29671319vka.10.2019.05.01.14.09.12
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 14:09:13 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id z145so186965vsc.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 May 2019 14:09:12 -0700 (PDT)
X-Received: by 2002:a67:c909:: with SMTP id w9mr42079vsk.222.1556744952510;
 Wed, 01 May 2019 14:09:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190424180934.GA29307@embeddedor>
In-Reply-To: <20190424180934.GA29307@embeddedor>
From:   Kees Cook <keescook@chromium.org>
Date:   Wed, 1 May 2019 14:09:01 -0700
X-Gmail-Original-Message-ID: <CAGXu5jLKgsz7JXGk=4MZg_dOxSAMTygK2WS5558gJYQcurOuJA@mail.gmail.com>
Message-ID: <CAGXu5jLKgsz7JXGk=4MZg_dOxSAMTygK2WS5558gJYQcurOuJA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: sony-laptop: Fix unintentional fall-through
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc:     Mattia Dongili <malattia@linux.it>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Apr 24, 2019 at 11:09 AM Gustavo A. R. Silva
<gustavo@embeddedor.com> wrote:
>
> It seems that the default case should return AE_CTRL_TERMINATE, instead
> of falling through to case ACPI_RESOURCE_TYPE_END_TAG and returning AE_OK;
> otherwise the line of code at the end of the function is unreachable and
> makes no sense:
>
> return AE_CTRL_TERMINATE;
>
> This fix is based on the following thread of discussion:
>
> https://lore.kernel.org/patchwork/patch/959782/
>
> Fixes: 33a04454527e ("sony-laptop: Add SNY6001 device handling (sonypi reimplementation)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  drivers/platform/x86/sony-laptop.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 4bfbfa3f78e6..2058445fc456 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -4424,14 +4424,16 @@ sony_pic_read_possible_resource(struct acpi_resource *resource, void *context)
>                         }
>                         return AE_OK;
>                 }
> +
> +       case ACPI_RESOURCE_TYPE_END_TAG:
> +               return AE_OK;
> +
>         default:
>                 dprintk("Resource %d isn't an IRQ nor an IO port\n",
>                         resource->type);
> +               return AE_CTRL_TERMINATE;
>
> -       case ACPI_RESOURCE_TYPE_END_TAG:
> -               return AE_OK;
>         }
> -       return AE_CTRL_TERMINATE;
>  }
>
>  static int sony_pic_possible_resources(struct acpi_device *device)
> --
> 2.21.0
>


-- 
Kees Cook
