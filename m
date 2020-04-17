Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51AF71ADE99
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Apr 2020 15:42:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730601AbgDQNkn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Apr 2020 09:40:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730597AbgDQNkn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Apr 2020 09:40:43 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46215C061A0C
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 06:40:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 7so2196466pjo.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 06:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2D8Et4Ps+9iLxMdMxyRhDTX66iOIkLaxtaUJQ4Xq28=;
        b=TVWCIxf6Il+T3pWFUsLtl0RDWbNrNZXkXnxiyif9gP++FwlJyC50R2+FnFOx7diyvr
         /HaK+qfmNGFwiTkXhOJ218uayYvkg9WoBY8vZo/bYQqycKGvbhpi43dTWIkOXJN0WHXk
         R/vY+vHRIGBj6uTpCJVXRQv1zbKwCqpqyjJghFvtdNg+kdQBl50rwrzieNayr/rGWlXu
         UmEpjFjq5pSQKK9eOc9XASnCXx2kZV/cqLwyxdELQQbuBs1q5GSzHYYkvqZwAkQkJBFG
         lQjy1XKdAC1nBc4AM8yd2n8jYD93RVnquUz0VOg88Q6s+U2xKEW56BAzqrkuhoTlcJfm
         yquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2D8Et4Ps+9iLxMdMxyRhDTX66iOIkLaxtaUJQ4Xq28=;
        b=eu5w2ryH6glzHa3yVTR63lEcUF4ArBw8huqWNLsLBB9NX2RPuZ2rqr67CS0s8nUupU
         lVo65NtKBI03TBsJSn57u+Mz0dq9rdn08LjnguS+QwH4ZxYFGr8zMcNl9elD7dtlNL0Z
         thSeTGTu6jBspSwc8XXPcVrfehhTg5808m4iw8MW2fjwNfww44qgKikgxrbAKwt30ga9
         oDSVL5lkVRblgUcONSys0vtvxXI9Kzmvw2UOdPtk+ovNfUo2xiTKhleL5GuwvyMvmS5c
         dx8G27gAhfuh3oG1JQ1G0n13rNixV0+KjXBXcmbY4yYmaa/dVj1nxwZDvz7cexyKlrc+
         v1ng==
X-Gm-Message-State: AGi0PubMwH4Rxqzn0jkyXx9+3wTr+nZ929ffri5ClFiHiiyQzoaO4cNj
        lV6YcFkhnFB5VuD2ehTMw/IPixCX846Tv3ng8m8=
X-Google-Smtp-Source: APiQypL1LZCu4AvHF4tHaffFD1Y0zd+xHp2rQRJ0RFH8lqNGwtWwQTDSMWWLaYUtfFrQcYqL89i366scwFG765FRhcs=
X-Received: by 2002:a17:90a:364c:: with SMTP id s70mr4436368pjb.143.1587130842832;
 Fri, 17 Apr 2020 06:40:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200402161313.GA27168@zyklotron> <32b0a492-c42b-d1f3-a084-71feda39db5f@redhat.com>
In-Reply-To: <32b0a492-c42b-d1f3-a084-71feda39db5f@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 16:40:35 +0300
Message-ID: <CAHp75VfYJ8qA25N+-tBVhDNjb+Xnac_6NKqjgPDVs=WNOLoEwA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add touchscreen info
 for techBite Arc 11.6.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wiktor Ciurej <wiktor.ciurej@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Apr 2, 2020 at 7:24 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 4/2/20 6:13 PM, Wiktor Ciurej wrote:
> > Add touchscreen info for techBite Arc 11.6.
> >
> > Signed-off-by: Wiktor Ciurej <wiktor.ciurej@gmail.com>
> > ---
> > Changes in v2:
> >    - Add missing ts_dmi_data struct.
>
> Oops.
>
> New version looks good to me:
>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Pushed to my review and testing queue, thanks!

>
> Regards,
>
> Hans
>
>
>
> >
> >   drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
> >   1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> > index 93177e6e5ecd..7c9e9a3e1d84 100644
> > --- a/drivers/platform/x86/touchscreen_dmi.c
> > +++ b/drivers/platform/x86/touchscreen_dmi.c
> > @@ -537,6 +537,22 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
> >       .properties     = schneider_sct101ctm_props,
> >   };
> >
> > +static const struct property_entry techbite_arc_11_6_props[] = {
> > +     PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
> > +     PROPERTY_ENTRY_U32("touchscreen-min-y", 7),
> > +     PROPERTY_ENTRY_U32("touchscreen-size-x", 1981),
> > +     PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
> > +     PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> > +     PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-techbite-arc-11-6.fw"),
> > +     PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> > +     { }
> > +};
> > +
> > +static const struct ts_dmi_data techbite_arc_11_6_data = {
> > +     .acpi_name      = "MSSL1680:00",
> > +     .properties     = techbite_arc_11_6_props,
> > +};
> > +
> >   static const struct property_entry teclast_x3_plus_props[] = {
> >       PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
> >       PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> > @@ -969,6 +985,15 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
> >               },
> >       },
> > +     {
> > +             /* Techbite Arc 11.6 */
> > +             .driver_data = (void *)&techbite_arc_11_6_data,
> > +             .matches = {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "techBite Arc 11.6"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
> > +             },
> > +     },
> >       {
> >               /* Teclast X3 Plus */
> >               .driver_data = (void *)&teclast_x3_plus_data,
> >
>


-- 
With Best Regards,
Andy Shevchenko
