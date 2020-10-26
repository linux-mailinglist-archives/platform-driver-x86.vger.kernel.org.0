Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A6E429909D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Oct 2020 16:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1783243AbgJZPJd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 26 Oct 2020 11:09:33 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35425 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1783109AbgJZPJc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Oct 2020 11:09:32 -0400
Received: by mail-pg1-f196.google.com with SMTP id f38so6238908pgm.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2020 08:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2dGRXdJVnzW6urkZcDVmJMG8iTthDxPgDTGqLINPe4Y=;
        b=IHpkHWrUS53J9oUCe2fKP+IJYNY4Pgc5kaxh3Be5eDsks8Q+Y5T4+CAp+ZYqKBDnCI
         fMjsfM6RY4faT9NQwlmtPg6oSfwH/meuPdbLTWaiOS18ETE4/uZLD4QMqmEM4VK2+I5+
         anQ/rb850FM3FeHv7E1qte5pXqqXHedU0vYAsddzkskmycIlX+Ntvoq6gAXzacW43C0T
         I2JXNzyxI0oD8ls0YkDntKXbKeiJmVDr1mV6D46IKlJLlRUZZRRWA27GOPhPzMRaWmoL
         InP353N1UwLcxmB/szojJBIOkMEcjs8g/DYovKT9VocRUTNIWjpEg9itQAAtaxMwpjaG
         mkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2dGRXdJVnzW6urkZcDVmJMG8iTthDxPgDTGqLINPe4Y=;
        b=lm/eF259e/QQh42Ssgp6g1jj4prorv7iQSvyx5ueU8FisIVe9Cxj6Yr4mkzB66AUfD
         LFDSDRjmuHMUWT2tpdLT2fK1OrNF34dkPgL5uTZStwlAdiKg5sG+YezqIDVGcxnbyAto
         nO6ZJn19/6GzPVtBCRp65fvlMSrtfFV3Tws7YSPZOUib/3Fu3SlS6GHLeM/YmqxgOEd3
         uHreMXBlUUkmTr6Wc4bi/V0fFRSyEjCZrpSPpq5XCYPcDWY4bdZ+MrYfWBF5R3GPFL0E
         rAr5b0cfxoI0f6GhklJwvbY+F6X7jHkuABC9ElnWhY47orRXSGkGFhHzpWFvi4YCfDnk
         sAkg==
X-Gm-Message-State: AOAM5308pW4jmhhA0q+FR3QCjNBCXBrgCuxzrTlqejxKzQiqSxR6hguh
        16soFkKPHHw5d5wFABqp5xLvP8DaIMBCxffmNTk=
X-Google-Smtp-Source: ABdhPJyLUZgoEevVpox7xIjCUFLPBxdUdhn//bzMN+hFFLRpo4oyxRrEdMFbrexA5Jysh6I5RXTtVh581Hq3eDh1v08=
X-Received: by 2002:a63:1e02:: with SMTP id e2mr13628952pge.74.1603724971885;
 Mon, 26 Oct 2020 08:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201019185628.264473-1-hdegoede@redhat.com> <20201019185628.264473-2-hdegoede@redhat.com>
In-Reply-To: <20201019185628.264473-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 17:10:21 +0200
Message-ID: <CAHp75VcshaqjoT4JJKxHbXFqn6Qr8LNMc1x=D=5j_wJevTzrfQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] platform/x86: acer-wmi: Cleanup ACER_CAP_FOO defines
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>, Lee Chun-Yi <jlee@suse.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Oct 19, 2020 at 9:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Cleanup the ACER_CAP_FOO defines:
> -Switch to using BIT() macro.
> -The ACER_CAP_RFBTN flag is set, but it is never checked anywhere, drop it.
> -Drop the unused ACER_CAP_ANY define.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/acer-wmi.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index db6167a10981..2f69d418ed3b 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -205,14 +205,12 @@ struct hotkey_function_type_aa {

Should't we add bits.h as well?

>  /*
>   * Interface capability flags
>   */
> -#define ACER_CAP_MAILLED               (1<<0)
> -#define ACER_CAP_WIRELESS              (1<<1)
> -#define ACER_CAP_BLUETOOTH             (1<<2)
> -#define ACER_CAP_BRIGHTNESS            (1<<3)
> -#define ACER_CAP_THREEG                        (1<<4)
> -#define ACER_CAP_ACCEL                 (1<<5)
> -#define ACER_CAP_RFBTN                 (1<<6)
> -#define ACER_CAP_ANY                   (0xFFFFFFFF)
> +#define ACER_CAP_MAILLED               BIT(0)
> +#define ACER_CAP_WIRELESS              BIT(1)
> +#define ACER_CAP_BLUETOOTH             BIT(2)
> +#define ACER_CAP_BRIGHTNESS            BIT(3)
> +#define ACER_CAP_THREEG                        BIT(4)
> +#define ACER_CAP_ACCEL                 BIT(5)
>
>  /*
>   * Interface type flags
> @@ -1247,10 +1245,8 @@ static void __init type_aa_dmi_decode(const struct dmi_header *header, void *d)
>                 interface->capability |= ACER_CAP_THREEG;
>         if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_BLUETOOTH)
>                 interface->capability |= ACER_CAP_BLUETOOTH;
> -       if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_RFBTN) {
> -               interface->capability |= ACER_CAP_RFBTN;
> +       if (type_aa->commun_func_bitmap & ACER_WMID3_GDS_RFBTN)
>                 commun_func_bitmap &= ~ACER_WMID3_GDS_RFBTN;
> -       }
>
>         commun_fn_key_number = type_aa->commun_fn_key_number;
>  }
> --
> 2.28.0
>


-- 
With Best Regards,
Andy Shevchenko
