Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EABE18BEC9
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Mar 2020 18:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727034AbgCSRxw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 19 Mar 2020 13:53:52 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40079 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCSRxw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Mar 2020 13:53:52 -0400
Received: by mail-pf1-f196.google.com with SMTP id l184so1812235pfl.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2020 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=StZCyau/cQYBIFbRasFkH9quKWwStvp+R6nFl4ptv1g=;
        b=NULQOHtnuCD34nm5JFl33ZDxXNiRA0JBStdak9EG42xpN0lf8QDwbnNex90RjVAOHj
         izCQzc9RvZHVKUw3M8nzsXCREN0ko6cOzPFPsViRibvVy4UgnQzKR/RS6fCyDt/f9P5P
         fdCrsp6PGNzly5duFhWRHVfaCuRglmq397isPFd6+B8lOLEvgcS+WciusCgIPi2GmxxO
         F0PA6EyIBCHvOZbEmW76w2uIinFmhJ73V7LVkCmb5OW93dk4WrKAZxM0XpI3keqLojMZ
         cIE0VJeloDh0/cIXgvKDxi8KuN0F4DNa1RcC+yipOHQ2pr1K07R4ww5Naz114jzBcFhb
         AVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=StZCyau/cQYBIFbRasFkH9quKWwStvp+R6nFl4ptv1g=;
        b=IkQE5Gd9oY7Q/LJEVUCSfBhj9EQfWUda5sdDCtoE643vrMuemFEnCAUvX2fTaxoYdN
         hXvQxYeh4XCg3JxWgx1ldljz3JwNz/CfoxtLai/B4gwsThGU+Hv6747rNEObq3d5Za8O
         CQv2pYRB0ZUTaBTv8AE0szayg/xORicFb9imN32U/LFR4hUtT8UD6mqgqc0oCnP3qOCT
         SRofFjxpvBT1mKlLfz8v11cbqIcg18a+DPzt9YtGzfHGWrEmCLKix8/9eYUKL3h9ASkT
         U3Upr6O7sBsE35hAZ6+8zNMF82O6zV/fi3/y77T0YqRB4SflbngKN6q3Al9cWWfe4XwI
         zx1Q==
X-Gm-Message-State: ANhLgQ1hWR4E2M4sCNk2jIWEkr/ubRgR/XINULjhmOg0TjHfvpd67+6T
        4YgdWPxOF96uPftzXiMC+6tX/+MeO62j6NUE7BE=
X-Google-Smtp-Source: ADFU+vsseaXJDMhVe2EB6LTEv6Xe8DdqyTe9ZwFoM9gefliF9mm2pn8Fr2XTGstdjVsawnLXnI2figHLL8VlGQhm3iM=
X-Received: by 2002:a63:5859:: with SMTP id i25mr4375493pgm.74.1584640430793;
 Thu, 19 Mar 2020 10:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200311090739.20543-1-tiwai@suse.de> <s5hd098uysu.wl-tiwai@suse.de>
In-Reply-To: <s5hd098uysu.wl-tiwai@suse.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Mar 2020 19:53:43 +0200
Message-ID: <CAHp75VdveSJZDypfbP=HPrOa68hWx_39oWqVJXxhN-XWUAryqg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: sony-laptop: Use scnprintf() for avoiding
 potential buffer overflow
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Mattia Dongili <malattia@linux.it>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Mar 19, 2020 at 5:52 PM Takashi Iwai <tiwai@suse.de> wrote:
>
> On Wed, 11 Mar 2020 10:07:39 +0100,
> Takashi Iwai wrote:
> >
> > Since snprintf() returns the would-be-output size instead of the
> > actual output size, the succeeding calls may go beyond the given
> > buffer limit.  Fix it by replacing with scnprintf().
> >
> > Signed-off-by: Takashi Iwai <tiwai@suse.de>
>
> A gentle reminder about this forgotten patch.
> Let me know if any further change is needed.
>
>

Pushed to my review and testing queue, thanks!

> thanks,
>
> Takashi
>
> > ---
> >  drivers/platform/x86/sony-laptop.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> > index fb088dd8529e..51309f7ceede 100644
> > --- a/drivers/platform/x86/sony-laptop.c
> > +++ b/drivers/platform/x86/sony-laptop.c
> > @@ -827,10 +827,10 @@ static ssize_t sony_nc_handles_show(struct device *dev,
> >       int i;
> >
> >       for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
> > -             len += snprintf(buffer + len, PAGE_SIZE - len, "0x%.4x ",
> > +             len += scnprintf(buffer + len, PAGE_SIZE - len, "0x%.4x ",
> >                               handles->cap[i]);
> >       }
> > -     len += snprintf(buffer + len, PAGE_SIZE - len, "\n");
> > +     len += scnprintf(buffer + len, PAGE_SIZE - len, "\n");
> >
> >       return len;
> >  }
> > @@ -2187,10 +2187,10 @@ static ssize_t sony_nc_thermal_profiles_show(struct device *dev,
> >
> >       for (cnt = 0; cnt < THM_PROFILE_MAX; cnt++) {
> >               if (!cnt || (th_handle->profiles & cnt))
> > -                     idx += snprintf(buffer + idx, PAGE_SIZE - idx, "%s ",
> > +                     idx += scnprintf(buffer + idx, PAGE_SIZE - idx, "%s ",
> >                                       snc_thermal_profiles[cnt]);
> >       }
> > -     idx += snprintf(buffer + idx, PAGE_SIZE - idx, "\n");
> > +     idx += scnprintf(buffer + idx, PAGE_SIZE - idx, "\n");
> >
> >       return idx;
> >  }
> > --
> > 2.16.4
> >



-- 
With Best Regards,
Andy Shevchenko
