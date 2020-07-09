Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF70921A75B
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 20:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbgGISzE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 14:55:04 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43731 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726116AbgGISzD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 14:55:03 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 17C5D5C010D;
        Thu,  9 Jul 2020 14:55:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute3.internal (MEProxy); Thu, 09 Jul 2020 14:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=w/zJmz
        HMRHAHr0LpgOd2/P1x0HAtmh6vbA3mYGPhpiY=; b=KJ3gh6YLTNcmxQDJzIuyu2
        rdWSiuYh5ZeMluw2DcYmiQ6H7YGVHpTZdh3/vWrflCO8MreiUepg1p1oZUkSVR1o
        z3NSb4SJCc3+JnuX1Y9xIfsSOKXMwep8Fd8F1VGlRPmSi1iMMp8eKBKPJLO/F4mL
        rUeMOe8RcDzKiWhhHlJq6YH4FNQwjR/HMLJOjAPqbaby58BF2+tqhjBp+Y0Civ3D
        a6w6VcZu7kd0fbOukdSCGFfgaXpnx5iKWJliiTTxZ4rv66wiqqveQzppo+ir53OB
        B22wkWkahV41OSJzxb3HmzHPcje+T4wLxydnWp8eS3wd+ay03WKEFtt9i1IF2r7g
        ==
X-ME-Sender: <xms:BmgHX_5GRQvFnR-w_llAmVDxWu-zL6vN49Dv3PyZcG0xzGLPmSu6CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudelgddufeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetrghr
    ohhnucfjohhnvgihtghuthhtfdcuoegrrghrohhnsehshihsthgvmhejiedrtghomheqne
    cuggftrfgrthhtvghrnhepgfelfeefjeeugeehheduleetteeltddugeekteekfeelveej
    udetueelfeehkeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrghrohhnsehshihsthgv
    mhejiedrtghomh
X-ME-Proxy: <xmx:BmgHX06KZQgO-DyTxwrdpvlEwKB__d6yPVRMLf4YqriGraRN7k7ehA>
    <xmx:BmgHX2dPxujv1wub0xiQEZueGfsNlWjPueeIvphaAe_bMpBa91enSw>
    <xmx:BmgHXwLFnRHHnbTLymEvKy_OZyCty0dDQ54yuvu6yDVTCekbBd91Ww>
    <xmx:B2gHX1xSEch7SI27LXnfS6AlmAYhNLeYluhlGClh5UvcgDWktdOanw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id CD99CE00E5; Thu,  9 Jul 2020 14:55:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <b979419a-f944-448f-b276-e9f609d721bf@www.fastmail.com>
In-Reply-To: <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
Date:   Thu, 09 Jul 2020 12:54:38 -0600
From:   "Aaron Honeycutt" <aaron@system76.com>
To:     "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Nick Shipp" <git@segbrk.com>
Cc:     "Jeremy Soller" <jeremy@system76.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>,
        "Platform Driver" <platform-driver-x86@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[RESEND_PATCH]_system76-acpi:_Fix_brightness=5Fset_schedul?=
 =?UTF-8?Q?e_while_atomic?=
Content-Type: text/plain
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Andy,

These changes have already been applied in this commit:

https://github.com/pop-os/system76-acpi-dkms/commit/54ac52e611b60adc50e5f977e908c5547021e4a4

Aaron Honeycutt
System76, Inc.
Happiness Engineer
720-226-9269 x602
aaron@system76.com

On Thu, Jul 9, 2020, at 12:50 PM, Andy Shevchenko wrote:
> On Tue, Jun 23, 2020 at 5:44 PM Nick Shipp <git@segbrk.com> wrote:
> >
> > And here's a fix for my email client and bad copy-paste, sorry about that noise.
> >
> > `system76_set' was set as an LED `brightness_set' callback, but it calls
> > `acpi_evaluate_object' which is not atomic-safe. Switched to the
> > `brightness_set_blocking' LED callback instead.
> >
> > Signed-off-by: Nick Shipp <git@segbrk.com>
> 
> This patch is mangled and can not be applied.
> 
> > ---
> >  drivers/platform/x86/system76_acpi.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/platform/x86/system76_acpi.c
> > b/drivers/platform/x86/system76_acpi.c
> > index 4f6e4c342382..c14fd22ba196 100644
> > --- a/drivers/platform/x86/system76_acpi.c
> > +++ b/drivers/platform/x86/system76_acpi.c
> > @@ -103,12 +103,12 @@ static enum led_brightness ap_led_get(struct
> > led_classdev *led)
> >  }
> >
> >  // Set the airplane mode LED brightness
> > -static void ap_led_set(struct led_classdev *led, enum led_brightness value)
> > +static int ap_led_set(struct led_classdev *led, enum led_brightness value)
> >  {
> >         struct system76_data *data;
> >
> >         data = container_of(led, struct system76_data, ap_led);
> > - system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
> > + return system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
> >  }
> >
> >  // Get the last set keyboard LED brightness
> > @@ -121,13 +121,13 @@ static enum led_brightness kb_led_get(struct
> > led_classdev *led)
> >  }
> >
> >  // Set the keyboard LED brightness
> > -static void kb_led_set(struct led_classdev *led, enum led_brightness value)
> > +static int kb_led_set(struct led_classdev *led, enum led_brightness value)
> >  {
> >         struct system76_data *data;
> >
> >         data = container_of(led, struct system76_data, kb_led);
> >         data->kb_brightness = value;
> > - system76_set(data, "SKBL", (int)data->kb_brightness);
> > + return system76_set(data, "SKBL", (int)data->kb_brightness);
> >  }
> >
> >  // Get the last set keyboard LED color
> > @@ -313,7 +313,7 @@ static int system76_add(struct acpi_device *acpi_dev)
> >         data->ap_led.name = "system76_acpi::airplane";
> >         data->ap_led.flags = LED_CORE_SUSPENDRESUME;
> >         data->ap_led.brightness_get = ap_led_get;
> > - data->ap_led.brightness_set = ap_led_set;
> > + data->ap_led.brightness_set_blocking = ap_led_set;
> >         data->ap_led.max_brightness = 1;
> >         data->ap_led.default_trigger = "rfkill-none";
> >         err = devm_led_classdev_register(&acpi_dev->dev, &data->ap_led);
> > @@ -323,7 +323,7 @@ static int system76_add(struct acpi_device *acpi_dev)
> >         data->kb_led.name = "system76_acpi::kbd_backlight";
> >         data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
> >         data->kb_led.brightness_get = kb_led_get;
> > - data->kb_led.brightness_set = kb_led_set;
> > + data->kb_led.brightness_set_blocking = kb_led_set;
> >         if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
> >                 data->kb_led.max_brightness = 255;
> >                 data->kb_toggle_brightness = 72;
> > --
> > 2.27.0
> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
>
