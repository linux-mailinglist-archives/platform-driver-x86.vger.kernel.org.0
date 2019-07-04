Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 813665F9F6
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Jul 2019 16:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727246AbfGDOXT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Jul 2019 10:23:19 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44521 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbfGDOXT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Jul 2019 10:23:19 -0400
Received: by mail-pg1-f196.google.com with SMTP id i18so2977921pgl.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Jul 2019 07:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QgI1JOTtsGsweW3mJ4QoKnqEPG+xJ0srMqp73EGna1Y=;
        b=g9L/+WzQRzCyHH+2hHp6/E+6zf5MCjmWPkydar0YKjgoMB9eCP3aIx63EKVgNkHM9p
         0CsJuCi9tJJ8usCDVSoR+nkvWB7ropfDfpJHTORT7ihcFsJ1uCc/PYuvwAUabQAXuNt/
         O/Fjli22+5SuVtWOouMRa0o+aQkqYiehN/8AHObF07SyP87t0eKuzMC9DdtbJyLjEBJ4
         yxxWC6iXeBLXx+/+thBCmPFGH1LsdIx/WFgsP5lo/fuLWruekM1ImvMothy2msLtU1DJ
         GjdiDZCt6pQM7px7IXyA6AZ0V4WipnD8BVeE2IQzO9F9MqY2uBEXTqzFlnL52X0HM7F/
         PC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QgI1JOTtsGsweW3mJ4QoKnqEPG+xJ0srMqp73EGna1Y=;
        b=Wr7nAedtybJXBG/7cW0jAQycGoP9h0/3OqhXbMUII8l/B1GALWmtTzyjLJEBh8iJlu
         nng2d1ggifiKPbbdcCONciQ93yqlJLt452MltCJYZWnWrVcem9Br5kp7R1b7FsWjgkKb
         y0tPEBiNqGw4cWCdDtsrcRH/ZLfDCqiim5kdMOkaHo3DG8YFhUG2N1opYgMIsZFg0xkT
         b9j8uQJbYmw3ROt4cIjV1eZXS+x8M1NDthYXy8TTbsHzviwt97rQ+D+In0gzQdGr/tCy
         LEdlciHcDovE7smXQjuirnZPU2vojiqFSFB0vclfrREOkmVqA90lhe11xYnWyXrHVjB9
         OcLA==
X-Gm-Message-State: APjAAAWgWQiHOyWyiPz8lQPtIt2XQjNjuK6d8soEapWNzDZQ20tK29fP
        OriOE2IRLd8ehhYpnTDE6AUBsWAOwAP0lh+/1zU=
X-Google-Smtp-Source: APXvYqxxNFdOIP8Ax/A9P7EuRB2zQKEp0uUOHH720rI1fZ9xFF8FYhgH+ECoOMlffoyoAjbveezLfb+l9Zy2dY9LYJU=
X-Received: by 2002:a17:90b:d8b:: with SMTP id bg11mr20099865pjb.30.1562250198865;
 Thu, 04 Jul 2019 07:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
 <20190703154102.20002-2-Nemcev_Aleksey@inbox.ru> <CAHp75Ve5N0uxrxMydB-kcWv=ZRhsBFmmENc4PNPPJZqwusYP6A@mail.gmail.com>
 <9f5ace8d-ccc3-743b-044d-eedc7de1b05e@inbox.ru>
In-Reply-To: <9f5ace8d-ccc3-743b-044d-eedc7de1b05e@inbox.ru>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Jul 2019 17:23:06 +0300
Message-ID: <CAHp75Vd6L=PFbw+JDQvHbFeWkxBRycE6H1x-6raOyzZh8a-YHg@mail.gmail.com>
Subject: Re: [PATCH 2/4] platform/x86: asus-nb-wmi: Add Asus FX705GE support
To:     Nemcev Aleksey <Nemcev_Aleksey@inbox.ru>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 4, 2019 at 5:09 PM Nemcev Aleksey <Nemcev_Aleksey@inbox.ru> wrote:
>
> Thank You for reply, I will split this patch.
> Should I then resend whole patch set, or only resulting two patches?
> I'm not very familiar with this process yet.

Please, do not top post.

You need to re-send entire series with increased version number (v2 here).
Also, you have to Cc to all subsystem maintainers, supporters and
designated reviewers (see get_maintainer.pl script).

Besides that, for patch series, especially such one like this, it's
always good to provide a cover letter:
`git format-patch -v2 --cover-letter ...`

> 04.07.2019 16:47, Andy Shevchenko wrote:
> > On Wed, Jul 3, 2019 at 6:41 PM <Nemcev_Aleksey@inbox.ru> wrote:
> >> From: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
> >>
> >> This model has an AURA RGB backlight,
> >> so wmi_needs_3_args quirk is required
> > Thanks for the patch.
> > Though it does two logical things, i.e. new module support and new key bindings.
> > Please, split it to two changes and justify key bindings.
> >
> > P.S. To all your patches, please use punctuation, like period at the
> > end of sentences and so on.
> >
> >> Signed-off-by: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
> >> ---
> >>   drivers/platform/x86/asus-nb-wmi.c | 12 ++++++++++++
> >>   1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> >> index 4bed95357a32..bf937321f42e 100644
> >> --- a/drivers/platform/x86/asus-nb-wmi.c
> >> +++ b/drivers/platform/x86/asus-nb-wmi.c
> >> @@ -406,6 +406,16 @@ static const struct dmi_system_id asus_quirks[] = {
> >>                  },
> >>                  .driver_data = &quirk_asus_forceals,
> >>          },
> >> +       {
> >> +               .callback = dmi_matched,
> >> +               .ident = "ASUSTeK COMPUTER INC. FX705GE",
> >> +               .matches = {
> >> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> >> +                       DMI_MATCH(DMI_PRODUCT_NAME,
> >> +                                 "TUF Gaming FX705GE_FX705GE"),
> >> +               },
> >> +               .driver_data = &quirk_asus_wmi_needs_3_args,
> >> +       },
> >>          {},
> >>   };
> >>
> >> @@ -441,6 +451,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
> >>          { KE_KEY, 0x30, { KEY_VOLUMEUP } },
> >>          { KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
> >>          { KE_KEY, 0x32, { KEY_MUTE } },
> >> +       { KE_KEY, 0x33, { KEY_BRIGHTNESS_MIN } },
> >>          { KE_KEY, 0x35, { KEY_SCREENLOCK } },
> >>          { KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
> >>          { KE_KEY, 0x41, { KEY_NEXTSONG } },
> >> @@ -467,6 +478,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
> >>          { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
> >>          { KE_IGNORE, 0x6E, },  /* Low Battery notification */
> >>          { KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
> >> +       { KE_KEY, 0x7C, { KEY_MICMUTE } },
> >>          { KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
> >>          { KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
> >>          { KE_KEY, 0x82, { KEY_CAMERA } },
> >> --
> >> 2.20.1
> >>
> >
>


-- 
With Best Regards,
Andy Shevchenko
