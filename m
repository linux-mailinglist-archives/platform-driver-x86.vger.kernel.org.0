Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E8121BEB9
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jul 2020 22:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726832AbgGJUrB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jul 2020 16:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgGJUrB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jul 2020 16:47:01 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D42EC08C5DC
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 13:47:01 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id f16so3109826pjt.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 13:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Fo5sNIKeHUDPfx+e0G3SdY/33bUnIUez0MiFm6mepXc=;
        b=nMkYsfwGzfTluvbT17Ce3lNn6KbAtpaD0PndRb05PeHSltWiqLMmg66zw/E73uwByE
         kX7I6fWuHQg6l8hcXhjOQvdEBs8oZzxnKz7FpMEAXY6Hr+9KJ0H7V/NNR9+N9d9V71bR
         aE1jC5Ognv3UZ4MJw8J3BWB8TV/yNaFeY2kvsstyIjVXhnEJu857OYxNMWQptrP8TMm8
         4J6EjSJDR5vDuYnc4JPa1FJ8bTsXhwfhIVdPoaKjGy9rF8DKL4v98+7BLATdhT/2MA0v
         7cG8O3wufGVs1UGNArihEnnxgKvlItWyIzP+0LJrreLcXQqAffOhKdUbhJqp3c/LwoST
         qDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Fo5sNIKeHUDPfx+e0G3SdY/33bUnIUez0MiFm6mepXc=;
        b=Nl4i8SYJbIq3ZiWf5gDwjejKHgcq9o7AcCMs/7Hr2wAU0O56jmud0aLuMBSCWHc3Fv
         eTCGVgX84v30MTg4KVqbVA3EbX1HO0ZkiwklDdXPTHtDJVSgVRcvb/tF8Z0TNe+MH7FS
         LGZu+63eT1juLedSJxyiSlAVmMHgxMGm0h0o3M84ADXmW7agX6LnGjnxaZoQ/ioRxTLR
         ODedpNwb3X23ZJqNP+8pEG82M/usggkZ/4LEHTpKlJxEngouYcMlVw+WAK0fMxUHjSC+
         HzJjGrdAWaGpXZywuDTMbQTuVsmCr8iXGsyAhFKdrJpYaQA9ep2NXXNYskhuUixN3kx4
         lYYQ==
X-Gm-Message-State: AOAM53292G/tmsFfzRxgx82rQxjbQIqRJSfMA0WwgYOTghfto1KSLOHD
        Ydw0KiemrP+6adU/SEHFw4uAZwBcw7XlUZoYABc=
X-Google-Smtp-Source: ABdhPJwzxgUuuJkWztahRmPtkUdoWIevd9lr9e+HiRuWIDjl6k5CQT52K8WoTyMVdnfnx+LHi48CexBzSnEvKVjD1/A=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr7884227pjb.129.1594414020538;
 Fri, 10 Jul 2020 13:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <4033154a9e166a37acb5c0491fa0b85f8b0fc032.camel@retarded.farm>
 <CAHp75VeubEjv_2WPeHK5twWYhK58xJ2L6Pcu3ibVEO-C24AsWQ@mail.gmail.com>
 <CAHp75Vd6PO3zfMH60BJETJCfQzAVbHvD=zAfHgjnu2NbAeukfw@mail.gmail.com> <6b72df991cb25743906188aa054d3fe69c57248e.camel@retarded.farm>
In-Reply-To: <6b72df991cb25743906188aa054d3fe69c57248e.camel@retarded.farm>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Jul 2020 23:46:44 +0300
Message-ID: <CAHp75Vc7eY9DXez5ZYtdGjEz2-EcyV5cY_puM08izbrr=UHbEw@mail.gmail.com>
Subject: Re: [PATCH] support for ASUS ROG G14/G15 (G401I/G502I) series asus-nb-wmi.c
To:     Armas Spann <zappel@retarded.farm>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jul 10, 2020 at 9:24 PM Armas Spann <zappel@retarded.farm> wrote:
>
> Am Donnerstag, den 09.07.2020, 22:19 +0300 schrieb Andy Shevchenko:
> > On Thu, Jul 9, 2020 at 10:18 PM Andy Shevchenko
> > <
> > andy.shevchenko@gmail.com
> > > wrote:
> > > On Wed, Jun 17, 2020 at 3:02 PM Armas Spann <
> > > zappel@retarded.farm
> > > > wrote:
> > > > Support for the currently unsupported ASUS G14 Notebooks (GA401I series)
> > > > to the asus(-nb)-wmi.c sources.
> > > > First change is the on the input buffer, the new devices are sending 5
> > > > DWORD instead of 3 as it was definded before. (might be already submitted
> > > > upstream)
> > > >
> > > > The second part of the patch adds the correct device dmi identificator.
> > >
> > > I can't take patch w/o Signed-off-by. See [1] for the details.
> > >
> > > On top of that it doesn't apply. And it clashes with already applied
> > > 7b91f1565fbf ("platform/x86: asus_wmi: Reserve more space for struct
> > > bias_args")
> >
> > [1]:
> > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> >
> >
> >
> >
> Many thanks for your feedback.
> I must excuse myself for not beeing guideline conform.
>
> Now, I removed the already fixed input_buffer and added the ASUS Zephyrus ROG
> G502I Series as well.
>
> Corrected patch:

Good. Now you need to do it so:
- it has proper and clear commit message (and being committed locally)
- you commit change with `git commit -a -s` which adds correctly the
Signed-off-by tag
- with help of `git format-patch -v<N> -1 HEAD~0` you create a file
with patch, where `<N>` corresponds to the version of it, now I guess
it's something like 3 or 4
- you open that file in editor and add a changelog after cutter '---'
line, save it
- with help of `git send-email 0001-*` you can send that patch to the
mailing lists (don't forget to Cc maintainers as well)

-- 
With Best Regards,
Andy Shevchenko
