Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA2B21A7A7
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:19:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGITTl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbgGITTl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:19:41 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F046AC08C5CE
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2020 12:19:40 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b9so1217725plx.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W8K7tg/8Q51/pPRIYFgSDjvD8PRDqgvG/lZ76/C4DhM=;
        b=fWPGSYB1ljB3lKEIx9lsoPryCUwgfJqaGSpUW/PbA9pM9Lm6bVFH0rfW7RybH50iJl
         jVDwzDvehc/1OdgL7SZIxu1Krsf/W/TNtqnxGptcgxUrHNTWAhRS185tHY4dzUS+JLpq
         E7NnDSsnK/1I/6YtaHSME5wb+VDZ9eXsnQ2TWZ8q5DPvg+ifjmXlKy8hf4MD7xwFGqsd
         3i8K/6+8flx1PkEZCGGF7Yr9UE+gPhM195L6cgvKuJJeAJ+HjHf6fyOkgbaVE+W/Jacb
         iUy0yX6DMy2WGJUDc2FL7o/xkyrFVbWSTmi2ry/G/moUoiqQJJ4F6r1ydAIgOEMQ6cSg
         1cvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W8K7tg/8Q51/pPRIYFgSDjvD8PRDqgvG/lZ76/C4DhM=;
        b=CaqeJUUh/u7SdVCRfqhFXe0jFmXHqCyQTmwf+Ty+/h4iw8IcPZquD04tzVBXFMyvQP
         GJXdDbEGkvI2ln6vwYtpWcBdqY/yWdtCpi3UOcF6ygDBFzc1LlepERwB6PlIJYFrAfgP
         CSNfIjPvb4UNrFBHZ1xCCfrrRkHElzCHcLSgpTTIT9IJw6drU0xJtfdzwN4KrLBbbg5P
         saQE7YUIOFRNv6+u6SJ9YCwDuxpxXotyXnVsp4SDB/E2eJpT+KwpEr/319+u8AGnRUa9
         6udzph8hq/CTKt4gzxwotkkgQR+pcpO9MWE3+IwdtUJPPl1591Q6Jj8EmupQOdqhqXRs
         GakA==
X-Gm-Message-State: AOAM532N2RXDrCOIDVmybjecNVYMmY0rcR7asZ4NzX4IgwAU1nU3PNpp
        hQjLQaPdpQf+Q7137bJabR54lSG3spm40QivEW8=
X-Google-Smtp-Source: ABdhPJyETWfwfU7ezNw7RmZydYldt7Qy4H98o7BC/mLD5T/CMDC07Hof6y8E0F1Db0rRzh9anjaUE3Kyy98b/EXuVE0=
X-Received: by 2002:a17:902:7611:: with SMTP id k17mr55938743pll.255.1594322380530;
 Thu, 09 Jul 2020 12:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <4033154a9e166a37acb5c0491fa0b85f8b0fc032.camel@retarded.farm> <CAHp75VeubEjv_2WPeHK5twWYhK58xJ2L6Pcu3ibVEO-C24AsWQ@mail.gmail.com>
In-Reply-To: <CAHp75VeubEjv_2WPeHK5twWYhK58xJ2L6Pcu3ibVEO-C24AsWQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 22:19:24 +0300
Message-ID: <CAHp75Vd6PO3zfMH60BJETJCfQzAVbHvD=zAfHgjnu2NbAeukfw@mail.gmail.com>
Subject: Re: [PATCH] support for ASUS ROG G14 (G401I) series asus-wmi.c/asus-nb-wmi.c
To:     Armas Spann <zappel@retarded.farm>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 9, 2020 at 10:18 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jun 17, 2020 at 3:02 PM Armas Spann <zappel@retarded.farm> wrote:
> >
> > Support for the currently unsupported ASUS G14 Notebooks (GA401I series) to the asus(-nb)-wmi.c sources.
> > First change is the on the input buffer, the new devices are sending 5 DWORD instead of 3 as it was definded before. (might be already submitted upstream)
> >
> > The second part of the patch adds the correct device dmi identificator.
>
> I can't take patch w/o Signed-off-by. See [1] for the details.
>
> On top of that it doesn't apply. And it clashes with already applied
> 7b91f1565fbf ("platform/x86: asus_wmi: Reserve more space for struct bias_args")

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html


-- 
With Best Regards,
Andy Shevchenko
