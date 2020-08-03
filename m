Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526F423A720
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 15:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgHCNBh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 09:01:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgHCNBH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 09:01:07 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AE4BC06174A
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2020 06:01:06 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f9so11279815pju.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2020 06:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YVMZkwfIpZzaFxFVRuM2PIF3SALm8XVgM0ZGiF1mUfo=;
        b=LCLWoyRI0nVDkD8kCpxwDqHuXn6nTLs8hFUgwX2LN3k+0UqX3PXQnB9AWAMZr9XDHj
         OzfsDKaLqejAvO3/s+PXJrqOheDkOYyWyw0U2PzIuwlQizkMDxm5rKRQdZGdlwcmvsGI
         5rp3xUegC1ZWt3i8JCJI6aPGPWcg5mwqbCs30IpIw9PAnNuFw0qyy79fhosuC2IQvkK2
         fLUuK7bkmIpdKfNaPMpyG6osG+2/hJBHhBV9reP/puw+MihyRHlpg2XtuURzfA7Ab783
         9I9LNXP7rDL8GEW3ubibze0rSbNpG6wDO7GlhpYaFKX+UgstggZm6Ory2e9+h+nqDYOa
         zgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YVMZkwfIpZzaFxFVRuM2PIF3SALm8XVgM0ZGiF1mUfo=;
        b=jqrDD8xwmmEV+tJ9L0cbU+jH0VmRSaSEL6gB/JCG7gMSd337Ufn2tu4YXzWtKqdNvg
         GDex1suj7OiqKfBK2ROY8J+/RITW5VaGu52V4xGxq/1tUbmvSQv03PoqsIlSgo2zyNC5
         ZsWLM3UpIN+nFXv5f4lbf08sogQgHCh7H1/l6kg7csqhbu3h5D5Rzoa5gOo6QDu65cnb
         yNietfk6cEPofVZGqpCbjPh/OlvY+aupvmt8Irg1uWVM6GIUAxzPHK0LD6we4Ma1/qbu
         BZtdhWX3tg1piRs14601wnjwYHcSaJ/ZwxSnnzGW9TFWHomtWPOSIo8y3rDh2G2IRHJG
         E/bA==
X-Gm-Message-State: AOAM530tt9YL1lqROVlqmcD/6BICG69paHfcPMayuFbAoKyIya9Vw1Un
        xkk0pOcm2xmfqVAb0AW5qqRr5/YY1rPyVC7J3Hk=
X-Google-Smtp-Source: ABdhPJy3dbB5kjsUijeiwxJKIPXgTp35fBlESjpsq69sVsmNu1Hztagdj8zOVUjkV96mpAWMTT/9/E2T1V5BFZbFeiI=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr14493681plo.262.1596459665311;
 Mon, 03 Aug 2020 06:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200802041705.79870-1-zappel@retarded.farm> <CAHp75Vf9BwaU2y3smc0pMpohLcAbbQt_RDS1kzzgOsbqN2ZaEA@mail.gmail.com>
 <ba68ddc0216ee23c772b4e73c84de0a25f9fe53a.camel@retarded.farm>
In-Reply-To: <ba68ddc0216ee23c772b4e73c84de0a25f9fe53a.camel@retarded.farm>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 3 Aug 2020 16:00:49 +0300
Message-ID: <CAHp75Vdwa2DWKYzHFKbK5UB_htuws5sX2Hi64PN0YEOBdFKbZg@mail.gmail.com>
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

On Mon, Aug 3, 2020 at 2:55 PM Armas Spann <zappel@retarded.farm> wrote:
> Yeah sorry..

NP.

>
> just recognized that I totally messed it up. (first issue, I was on the wrong
> branch/repo, second you're totally right with the two structs, one is way better
>  - like it's implemented now.)
>
> I just recognized that it is fixed in the "for-next" branch with slightly
> adjusted fixes you applied. Many thanks.
>
> So, please just ignore the last requests from me. I'll take care the next time
> when doing a submit, to crosscheck everything more then once. (I've now a
> checklist for that purpose ^^)

Do you think we need to expand / update checklist [1] in kernel documentation?

[1]: https://www.kernel.org/doc/html/latest/process/submit-checklist.html

-- 
With Best Regards,
Andy Shevchenko
