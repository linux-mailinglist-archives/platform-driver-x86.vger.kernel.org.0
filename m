Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E51119C715
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Apr 2020 18:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387699AbgDBQbd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Apr 2020 12:31:33 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:38748 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732289AbgDBQba (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Apr 2020 12:31:30 -0400
Received: by mail-wm1-f67.google.com with SMTP id f6so4378115wmj.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2020 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yQkIv0rzJaRo2qF5sMTrGezctUNnqHua0cHIAyo4Wyc=;
        b=jgWviM9bgRsu/36QIhw4N4eRT94+7dl1LEvPibTeyfBRA99YMDYsNc+A8mqtQEZO1b
         NsVwLPAPGL2tuCYlkkehiiz6PbxwMlYiHt2stv1hxlX24U063DEfbnB/uD3Us0irPuA5
         M9friTisGscTxbBhtYAaGnb2B2ofniYL2MXsmEquIyeApz8vRstj8sTm+sVY0nLCKU4E
         gR0sXsml6n8ZUHbZT/ES+jmqmeXYj8M6riaDngqN4R9CGXLJ8HCn7j9//83HnOOjH6sj
         yqGlEjclKQeSmyDCjfDSz3y4p3FtoNuD1lATar387l9t7ciow5+iuVujzsixitRq8gRL
         mcUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yQkIv0rzJaRo2qF5sMTrGezctUNnqHua0cHIAyo4Wyc=;
        b=EN6xO/P6dAN2cu1K4y7P3N5aL0EcpvozgHoKg3e5bgvOGtgAFgigPUxj9KHb0wdrBz
         lbQghq/WKpBnNiwk33o2iNCBeouipowEn5kwz/CwiNu/h2I4oc1GO5bTV1GXQiumE24B
         eRv2XCJy8Wi5jaeBj3RwwfPsO/RdZktht61V9x3LpaAuVb+bVKo6ao4ZzfXikJDT6BWl
         r1Go+Of36hnUvomNPmw4/QHVpuMr8GycNzmVwy9HjMPonbKV0wck42Ze5UJ6G5jvbyQI
         YnxXj6OeiGKtR/BUQX1SAsEMQZPa+vcQQByQTHkHtiTpGX9kZSygJueRJnbNbY5EqC6j
         He7A==
X-Gm-Message-State: AGi0PubpSW+5AE1lwQ19b/DrWlkmLo7w0B8n8wwu5GreJwt+rcO1He5e
        wZIkKDnJT9mDbxLbMdgbwNUfZsKI5aPqRuU1I4E=
X-Google-Smtp-Source: APiQypJi44Ya7Woewl6Ni/1kzlny/EMy0MepxEzLZcW/BupQlRnRL0L6UqbB0ByWoq2CbPIW0iHFhWLspNXCZ0x2saQ=
X-Received: by 2002:a7b:c004:: with SMTP id c4mr4113033wmb.108.1585845087906;
 Thu, 02 Apr 2020 09:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200402161313.GA27168@zyklotron> <32b0a492-c42b-d1f3-a084-71feda39db5f@redhat.com>
In-Reply-To: <32b0a492-c42b-d1f3-a084-71feda39db5f@redhat.com>
From:   Wiktor Ciurej <wiktor.ciurej@gmail.com>
Date:   Thu, 2 Apr 2020 18:31:16 +0200
Message-ID: <CAHmOfxJ+aiPtEob+YUtj69VT1vov2tiXxNiK8dAHFYvxKQTHHA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add touchscreen info
 for techBite Arc 11.6.
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     dvhart@infradead.org, andy.shevchenko@gmail.com,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

czw., 2 kwi 2020 o 18:24 Hans de Goede <hdegoede@redhat.com> napisa=C5=82(a=
):
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
>
> Regards,
>
> Hans

Yep, sorry about that. I had several versions of this patch and sent wrong =
one.

Regards,
Wiktor.

> >
> >   drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
> >   1 file changed, 25 insertions(+)
> >
> > diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/=
x86/touchscreen_dmi.c
> > index 93177e6e5ecd..7c9e9a3e1d84 100644
> > --- a/drivers/platform/x86/touchscreen_dmi.c
> > +++ b/drivers/platform/x86/touchscreen_dmi.c
> > @@ -537,6 +537,22 @@ static const struct ts_dmi_data schneider_sct101ct=
m_data =3D {
> >       .properties     =3D schneider_sct101ctm_props,
> >   };
> >
> > +static const struct property_entry techbite_arc_11_6_props[] =3D {
> > +     PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
> > +     PROPERTY_ENTRY_U32("touchscreen-min-y", 7),
> > +     PROPERTY_ENTRY_U32("touchscreen-size-x", 1981),
> > +     PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
> > +     PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> > +     PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-techbite-arc-11-6=
.fw"),
> > +     PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> > +     { }
> > +};
> > +
> > +static const struct ts_dmi_data techbite_arc_11_6_data =3D {
> > +     .acpi_name      =3D "MSSL1680:00",
> > +     .properties     =3D techbite_arc_11_6_props,
> > +};
> > +
> >   static const struct property_entry teclast_x3_plus_props[] =3D {
> >       PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
> >       PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> > @@ -969,6 +985,15 @@ static const struct dmi_system_id touchscreen_dmi_=
table[] =3D {
> >                       DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
> >               },
> >       },
> > +     {
> > +             /* Techbite Arc 11.6 */
> > +             .driver_data =3D (void *)&techbite_arc_11_6_data,
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "techBite Arc 11.6"),
> > +                     DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
> > +             },
> > +     },
> >       {
> >               /* Teclast X3 Plus */
> >               .driver_data =3D (void *)&teclast_x3_plus_data,
> >
>
