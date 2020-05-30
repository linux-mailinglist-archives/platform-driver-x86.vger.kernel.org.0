Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 991A81E9269
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 May 2020 17:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729038AbgE3P6S (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 May 2020 11:58:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729029AbgE3P6S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 May 2020 11:58:18 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D922C03E969
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2020 08:58:18 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id z26so1310551pfk.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 May 2020 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qVUUda2x02nBqGShK7kUx/1UN5MKJdCY1YMLyJXvpNY=;
        b=dfI3U4qUwPBdjLzk+E/85EdHdkjX+TFJ4g+HJBIwy5Wc5LVtdc4qZQZdUnHjePQAvB
         GHEthk5yv0thl0UCRp2Fmi4AR1ZKkb4SFh5VSHBdCI8OnSeMt00s/I0+fpLzV+34CBsO
         uqYue61a1AgELkdlt6aKiuTTYjzWxbS0zIGGljVaLHYN3aT5uccbINtoVaPp8m+cDn+J
         nD+PuOyqfS6s8q3N9qxByZKeQXKIsnynRZbi8LbK7q4n14AhakvyX88NFPKUxurBhiCa
         TKqpBOr9T4CFO4uo3wUdyXRMXtlfOLvzXhSRc/dLl+JLxwTsBvLcWeOmyd9Y1Z6Ivsop
         RgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qVUUda2x02nBqGShK7kUx/1UN5MKJdCY1YMLyJXvpNY=;
        b=ZlnEyaTZIkQAFNM769IJ5W6aVBzeQCfBZdlbNp74xcleumYjVN5DhlZMjThnS2rIuX
         hTZGR2WXKO9URabaBG37knE5kBhvKr5PMRuX2vw2voG1s69qXAHiOGtvIOfc+m17Y7r5
         1rIKCo0+KUb0I/13B8BQU4F1PJpGWzZbsV8AVmuEWAr/OTD6V3n2GwqpXhEePP7+82qv
         coYQ70uTZeWferOqj3QYkCpGhNjugOJmE8pA3mDebk+yBbaaCbRysMpmWdWVISsSmuPd
         Ro6l9DTXq1vVtkMyARhgvbwCcPhwgj2rPfTXmlsnz5DM4vk2ByOAYVcNwg9cHpv1A6UH
         1QZg==
X-Gm-Message-State: AOAM533R32cUG94ZK0q5IebM7/XGRMg6Y3sWIB4H5ch23v9Sy+1WsjOG
        Jqm+TmWTbQGaA1LINpbTbyrPT4+WopKHusbCBFw=
X-Google-Smtp-Source: ABdhPJylE+LIBeFCVclIFvCRI9JDc8SKuSJBjbCCd27HopoqCZ+p+FizW9SheW9JLkFflpJ0AA58kaEG9SVyy1Gavzw=
X-Received: by 2002:a63:c109:: with SMTP id w9mr6599484pgf.203.1590854297624;
 Sat, 30 May 2020 08:58:17 -0700 (PDT)
MIME-Version: 1.0
References: <fce37b1c-40d7-6f80-1eb4-78a4446b35e9@gmail.com>
In-Reply-To: <fce37b1c-40d7-6f80-1eb4-78a4446b35e9@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 30 May 2020 18:58:06 +0300
Message-ID: <CAHp75VdV4mAfAz5OZSW3FSzDwkvQiM7djBTH9rrAZYHJUp5jRA@mail.gmail.com>
Subject: Re: [PATCH] intel-hid: expand DMI quirk to support HP Spectre X2 (2015)
To:     Nickolai Kozachenko <daemongloom@gmail.com>
Cc:     Alex Hung <alex.hung@canonical.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, May 29, 2020 at 12:28 PM Nickolai Kozachenko
<daemongloom@gmail.com> wrote:
>
> HEBC method reports capabilities of 5 button array but HP Spectre X2
> (2015) does not have this control method (the same was for Wacom
> MobileStudio Pro). Previous DMI quirk  by Alex Hung was expanded to also
> enable 5 button array for this system.

Thanks for your contribution!

Looks like your patch is mangled, please use `git format-patch ... &&
git send-email ...` to send patches.
Also, with help of get_maintainers.pl script add subsystem maintainers
and not only driver's.

P.S. When send a new version supply its number via `git format-patch
-v<n> ...` where `<n>` is 2 in this case.
Also, after cutter line ('---') add a small changelog between versions.

> Signed-off-by: Nickolai Kozachenko <daemongloom@gmail.com>
> ---
> Tested on my own device.  Thanks to Alex Hung for creating quirk for
> Wacom MobileStudio devices that can be reused for HP Spectre X2 (2015).
>
> --- drivers/platform/x86/intel-hid.c.orig    2020-05-29
> 13:13:43.768032597 +0500
> +++ drivers/platform/x86/intel-hid.c    2020-05-29 13:19:30.089899469 +0500
> @@ -79,6 +79,13 @@ static const struct dmi_system_id button
>               DMI_MATCH(DMI_PRODUCT_NAME, "Wacom MobileStudio Pro 16"),
>           },
>       },
> +    {
> +        .ident = "HP Spectre x2 (2015)",
> +        .matches = {
> +            DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> +            DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x2 Detachable"),
> +        },
> +    },
>       { }
>   };
>


-- 
With Best Regards,
Andy Shevchenko
