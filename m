Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5239D235660
	for <lists+platform-driver-x86@lfdr.de>; Sun,  2 Aug 2020 13:00:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726765AbgHBLAO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 2 Aug 2020 07:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHBLAO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Aug 2020 07:00:14 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB56C06174A
        for <platform-driver-x86@vger.kernel.org>; Sun,  2 Aug 2020 04:00:14 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id d188so10647713pfd.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 02 Aug 2020 04:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1mNVrgBjcHT8AimZuCAO0krXN+qLOOXJ2GBcLNAe/KQ=;
        b=qAYFpCjdlknqe8c+b1yZKNUhSeBWS+BOvcMwEKo41u4IY6FUWc/1GT9Ts/L8jhyTqK
         s4Mjoz88mvFBKmn9QJhg29O89YEwPxqNcxNGmNEJBBYMH0ieJHjbkubVCQaSLZ/t5+2a
         D02uH8yfznxF5MWdnJaBhaGAwS5/0fveAz04tT8eQGnqxfasWkiqxPI7Z2w8ScyjP3PH
         HYt4jOXc7sqa5hsNf2AkNylJw4GKUFJvlh5ND3puAfp2Gq0CTdOCXZbohwPL7jdG4/K+
         ELfq8oQN4qR/KbKTS/OTq2R5oUrVQVd6TalvnTmDKmO5erJO6XfxJ+/OHB/Mq3Kw0uDS
         Dgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1mNVrgBjcHT8AimZuCAO0krXN+qLOOXJ2GBcLNAe/KQ=;
        b=nKg+4pifMFkZL4YBjDk1lSuiqVyuceGiYl1lFJVCqxPoKw9SjXMJt/VrwQ3/i9EYmC
         0jtxqx+KkPBrIbge6rDEb9dT4BTgse9jeeuumc/ucP9/JbaqXgMBOB6OwnSZcSLz9s5k
         NIYCmL1hjmbH2J2ydmIXI/Iudz+PHpbouZKF93NreAfu55hJxwVuJrsevdihsd45B+kJ
         RbUyp2BlTjmrsqwZTRzggXF1cPOM/F+C8p6k0QbhbXadCOxveDSDEkBzq9ODgAPerqwn
         9JLUJO3FLvuxZhd97IsI6ov/vsUgZaWfREpwfq+G44ELmryiawVrhLcictya4FElNCqO
         70sg==
X-Gm-Message-State: AOAM530Wfj9z+UJthiePIyCGnQ/Ie1R6iGGpKzwwX+xJgW1MW3TQGYkx
        PhC/OAsJ5c67DYG6j1NPsLwe65j2Lezwzp0Wfr4K2+R6M+U=
X-Google-Smtp-Source: ABdhPJw0WbCXGcXiBK8620dZp2f5XToraQyJqtjyVCbAIfjWD1k2E2EwDAtq12upcVNk9PDFjz2skhLi1pGUqaNh2Bc=
X-Received: by 2002:a62:158e:: with SMTP id 136mr11409709pfv.36.1596366013361;
 Sun, 02 Aug 2020 04:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200802041705.79870-1-zappel@retarded.farm>
In-Reply-To: <20200802041705.79870-1-zappel@retarded.farm>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 2 Aug 2020 13:59:56 +0300
Message-ID: <CAHp75Vf9BwaU2y3smc0pMpohLcAbbQt_RDS1kzzgOsbqN2ZaEA@mail.gmail.com>
Subject: Re: [PATCH v5] asus-nb-wmi: add support for ASUS ROG Zephyrus G14
 (GA401) and G15 (GA502)
To:     Armas Spann <zappel@retarded.farm>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 2, 2020 at 7:17 AM Armas Spann <zappel@retarded.farm> wrote:
>
>

Drop extra blank line(s) here.

> This patch adds the ASUS ROG Zephyrus G14/15 notebook series detection to

Read the Submitting Patches section about "This patch" and fix text accordingly.

> asus-nb-wmi. The detection itself is accomplished by adding two new quirk_entry
> structs (one for each series), as well as all current available G401/G502
> DMI_PRODUCT_NAMES to match the corresponding devices.

> patch-changelog:
> v1: initial G401 patches
> v2: --
> v3: re-initial GA401 and GA502 and setting description
> v4: corrected typo(s) added GA502DU series
> v5: corrected signed-off position in patch - sorry

This must go after the cutter '---' line below.

> Signed-off-by: Armas Spann <zappel@retarded.farm>
> ---

...

> +static struct quirk_entry quirk_asus_ga401 = {
> +       .wmi_backlight_power = true,
> +       .wmi_backlight_set_devstate = true,
> +};
> +
> +static struct quirk_entry quirk_asus_ga502 = {
> +       .wmi_backlight_power = true,
> +       .wmi_backlight_set_devstate = true,
> +};

These are identical. What is the point?


P.S. Have you based your stuff on our for-next branch [1]?

[1]: http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/for-next

-- 
With Best Regards,
Andy Shevchenko
