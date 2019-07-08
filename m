Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A6561C03
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jul 2019 10:57:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728552AbfGHI5l (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Jul 2019 04:57:41 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:41432 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbfGHI5l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Jul 2019 04:57:41 -0400
Received: by mail-pl1-f196.google.com with SMTP id m9so4223928pls.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jul 2019 01:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v0V2gKhEOCexXftVrvYOQjyieet4qf38FNorLA5y3ZQ=;
        b=cY/Ee1ningUO+PY+zJoYZM3cqHbsTtyRJPSzO0JQRdbrB4kRLw5BHaLgJ4VnY93ge9
         Q10lCtCb5tCQRsff3+9z5k6fyT4ADPKdDJYlXN1UXZWpPdq73OQrIROaw0X2xg/C2gSU
         TLiP8z7dav9VnkyaOfN073KKIwhHktXaXKGeZiX6uBYfXjYafjEGx3vnaLBzJuJwwLJO
         pbKkTeULhI2P1e8tOylp2GeDskxQRNpdqo67Jsw9KaNHrMrS/pMooRugJNK5Tzu1nyYB
         nKHqyaXFAOxucpm4zBRCtV8XyWLyDbQqLn08wZ7qE+yvepA9okM/sfcLCQ7HjGr3TsJL
         wzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v0V2gKhEOCexXftVrvYOQjyieet4qf38FNorLA5y3ZQ=;
        b=TV0lqR7+A+IqhHfOlgev8kyl7BQPnb/MXcjkEh6QNIqsoDsXUl7K5INBHjgYKu3TZf
         i20WUDwaMfYJWIozLVIb9QhawPaIFTxJLYSgQqQ3sao7qmC9/RDW8yf2HLee5P3VjhrM
         XnBZOeqAyzYTE+RPb1AcRQ5ds0EUv8ZJhVoO/EDp4+1eP+g5VrIywkiwIRCKk2jD0zXS
         uxI9RHPjdPokbGozVwzKwZ/LjFJnVJrvIZYFLiXYlSTKZhvfDWGv9vBvbICD7/J9+YB2
         SMZUlQWFWb0gi/bW9Wtzz0P+116fNrfT1NlSqIb1gk8S2AmKRlL542GqBEFDt94LPDV8
         XO4Q==
X-Gm-Message-State: APjAAAVdHO0wK+I/9z4RufcpjN6/vHkovOX0DPH1llbJNEhWH3508X2O
        eYpckKt9jb6R/hpoCM10y48=
X-Google-Smtp-Source: APXvYqyGk4pHHEoMaQFdZM27g588/tNxBWO+fg60JatB5jYj0nK6H0LU9J20I9BiBx2JeZ3NlY9Ihg==
X-Received: by 2002:a17:902:8c83:: with SMTP id t3mr22718715plo.93.1562576260618;
        Mon, 08 Jul 2019 01:57:40 -0700 (PDT)
Received: from arch ([103.85.10.69])
        by smtp.gmail.com with ESMTPSA id 30sm22601273pjk.17.2019.07.08.01.57.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 01:57:39 -0700 (PDT)
Date:   Mon, 8 Jul 2019 14:27:35 +0530
From:   Amol Surati <suratiamol@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     dilinger@queued.net, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-geode@lists.infradead.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] cs5535: use BIT() macro for defining bit-flags
Message-ID: <20190708085735.GA12241@arch>
References: <20190707113016.GA30635@arch>
 <CAHp75VfceRDnuRtdD_mR6mMZF_LH7u1ptPRXiA=DUfgTGebCPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfceRDnuRtdD_mR6mMZF_LH7u1ptPRXiA=DUfgTGebCPA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 08, 2019 at 11:02:29AM +0300, Andy Shevchenko wrote:
> On Sun, Jul 7, 2019 at 2:30 PM Amol Surati <suratiamol@gmail.com> wrote:
> >
> > The BIT() macro is available for defining the required bit-flags.
> 
> Shouldn't bits.h be added?
> 
> > Since it operates on an unsigned value and expands to an unsigned result,
> > using it, instead of an expression like (1 << x), also fixes the problem
> > of shifting a signed 32-bit value by 31 bits. (e.g. 1 << 31. See
> > CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN).
> 
> What problem?
> You need to describe that (UB by the standard, though gcc works fine,
> I never heard it utilizes such).

Yes. I will send a new version. I also missed including
<linux/bitops.h>, although the compilation with the default
configuration of my distro still succeeds without it, by chance.

Thank you,
-amol

> 
> -- 
> With Best Regards,
> Andy Shevchenko
