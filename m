Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 760E71C599D
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 16:32:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgEEOcI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 10:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729123AbgEEOcH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 10:32:07 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F18AC061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 07:32:06 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id f7so951267pfa.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 07:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ekEGx4Z6yK/zfgYcQ7xHUOnyCO56vCWYNGq6NVPJunk=;
        b=JfhXJcW+W0ZxmQ2AO2Jh1M2CsC3SNMhIS6noswZDiduQVhdIJF3683osNWzf61docO
         1MqwLz3rqgRVuT0hNnnyIFGAT0ADzbqqWU8Jt1w+i1RwGXA85dnBfIhqSkIQ49gJtCOe
         CVoCPyTMI8TZQZntVsQ8dbQ7orWOhsR6XK3RC8VvtbytpZMh93xuKLn/lH9FN0bmLZLk
         noAxZs9vew8dkCltSp1H6DJiadWcEllwlhmghB/vs9wl8oeI3CpihA6Z3rF9xKhli1jH
         tgwGr275N1tGAg0wojA1UuBz6qQ0MdcBNmqyDtCFUvpPMGP/KZc3S8sqGsIaEiMOeLYl
         3rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ekEGx4Z6yK/zfgYcQ7xHUOnyCO56vCWYNGq6NVPJunk=;
        b=RfG2yGW2NyoAbE7sQo2E5S1+XdHzhy9S+zMXLDl1METWhYgLWxBptAeJGueNVkqvFp
         EgSr67QO3BRHAWZCvTYbDwx1dOMaSKYgyX6GwZcx//tsYG9RHiy5RyVrRYm01LYWPzvg
         UnC++NiGaKmwj9YGwE68ZQFyO/t3l816pUHy4eLR1BxmfUMrbXQQnKW9cV2n2+fk/rg4
         Ugn4Hi6rqvHNNNICZrqRGdDeE1votxX9Y3ruXvnl3j/xjcJGBHfCSFkvcSDr/vv9Yngm
         J/ozKuCMthJqeGytS+nrQQ1ilV3YmBSRj+E0NiCmv5DEX7SMKW+4/e7zabd0uNM2C9M9
         5fyA==
X-Gm-Message-State: AGi0PubQmpNQes/TkrKUSHtcj7QbGZdEG6UMsV2CtagVKkSSUncReHG9
        JuLGu0/n4M/rnb0Mo1q06agO2BZoM2/jES5+wto=
X-Google-Smtp-Source: APiQypLcnpppOQwWoypSFJnE6xQo2j0A69NH6B18ThHrIe2lqtqgvbUzmL4EOiKuyU4mODMRmV82E15Yfm/BL+xLPyA=
X-Received: by 2002:aa7:8f26:: with SMTP id y6mr3493193pfr.36.1588689125720;
 Tue, 05 May 2020 07:32:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200505111810.65586-1-malattia@linux.it> <20200505111810.65586-3-malattia@linux.it>
 <CAHp75VdCsscavP5sGrMjk5dWFZDYjevW94_RNRw50nAaM3jQpA@mail.gmail.com>
 <20200505141948.GA119615@taihen.jp> <CAHp75VdGemLeyujDZZ+fPZn-0hhTVcQjNkjU0MNEGJ+WS+ouSw@mail.gmail.com>
 <20200505151731.GB119615@taihen.jp>
In-Reply-To: <20200505151731.GB119615@taihen.jp>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 17:31:59 +0300
Message-ID: <CAHp75VdSVKu8Kbrggmj-jUVETGp3GNkw0cZXRLQOqyQTF9Gsng@mail.gmail.com>
Subject: Re: [PATCH 2/2] [sony-laptop] Don't use thermal handle if NULL
To:     Mattia Dongili <malattia@linux.it>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 5, 2020 at 5:15 PM Mattia Dongili <malattia@linux.it> wrote:
> On Tue, May 05, 2020 at 04:26:18PM +0300, Andy Shevchenko wrote:
> > On Tue, May 5, 2020 at 4:17 PM Mattia Dongili <malattia@linux.it> wrote:
> > > On Tue, May 05, 2020 at 03:38:15PM +0300, Andy Shevchenko wrote:
> > > > On Tue, May 5, 2020 at 1:16 PM <malattia@linux.it> wrote:
> > > > >
> > > > > From: Mattia Dongili <malattia@linux.it>
> > > > >
> > > > > The thermal handle object may fail initialization when the module is
> > > > > loaded the first time.
> > > > >
> > > >
> > > > But isn't it a papering over the real issue that it fails first time?
> > > > AFAIU user needs to try first time and if it fails to try again. Can
> > > > we rather understand the root cause first?
> > >
> > > I think this is a bug regardless of what ACPICA does.
> >
> > I didn't speak about ACPICA.
>
> Oh wait. Are you talking about my wording "when the module is loaded the
> first time"?
> Maybe I should have written "when the module is loaded in the first
> place", I suppose that's clearer in English.
> Initializing the thermal handle should fail consistently (unless
> the system is low on memory and magically recovers just after failing
> acquiring some memory in sony_nc_thermal_setup).

Yes, I talk about "first time" phrase.

> > > If the driver fails completing whatever initialization, should it not
> > > avoid dereferencing a NULL pointer on resume?
> >
> > Yes, but *why* it fails?
>
> In the case that was reported in the linked bugzilla, ACPICA behaviour
> changed and the driver wasn't quite ready to deal with it (which is I
> assumed you were talking about ACPICA).
> Instead of quietly performing the functions it could, sony-laptop caused
> a NULL pointer deref on resume. sony_nc_thermal_setup failed at some
> point and th_handle was then set to NULL on the way out of that
> function.
>
> The sony-laptop driver is entirely reverse engineered from DSDT and
> corresponding behaviours in Windows. There's probably a few reasons why
> loading thermal profiles could fail, but the most common is probably
> because of newer Vaio models using the same SNC function codes but
> having a different interface (look at sony_nc_backlight_setup for an
> example).
>
> Arguably, a better fix could be to fail loading the module if any of the
> SNC functions fails initialization. The downside then is that those new
> Vaio models that are only partially (in)compatible would remain without
> *any* SNC function until some kind soul comes along and reverses
> engineer the new behaviour.
>
> Another (possibly better) fix is to keep a list of which functions
> successfully initialized and only attempt to resume those instead of
> blindly going through all the known ones.
> I'm not against this last one but it's quite more invasive.

OK, can we go with the series out of two (besides another fix for
ACPICA changed behaviour):
- (temporary) fix for the failing initialization (so, can be backported)
- real invasive fix as described by you
?

-- 
With Best Regards,
Andy Shevchenko
