Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEC4A21A789
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:08:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgGITIA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:08:00 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38883 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726163AbgGITH7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:07:59 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 916215C0189;
        Thu,  9 Jul 2020 15:07:58 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 09 Jul 2020 15:07:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=IIHhZc
        KYmTKHUAATKmXhSiyA+/US/s6lxSmoZtXRRJA=; b=T+yqDD+uyxQThbo435N+oh
        gzfKq9My0fL5Puym6uy6Uo9gxAuNt5XFUTcePU/hFBk54D1gSxbIi1phJD+GQY6G
        9rL7FOQv8snLls3mVydYbApHVsKNpHMBxSGoo6bRYqDfitU1tLgBliRXykamZsHc
        Jc6F+zRjglyQ4UQg6rXWS+RgT/rYI3LZIOBxfcZddVhtzcpzalrprAI0ifWfKii8
        6P5YCszYvOSnI4FEukyCxrmXjY3GqnS05Jkf+lQJJpCp+g7EKej5cJVvn782RNq4
        gG25yXiPjSpDSS4XAorNrX+CKTJ52KeP6+/zgcuHJusoUqLgKS3xqLzPD66eeohg
        ==
X-ME-Sender: <xms:DmsHX0pdxk5FsAtFNr8HRdAXu2D9_ObIb0JZSnwblpfKj9GiHTZZVQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudelgddufeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdflvghr
    vghmhicuufholhhlvghrfdcuoehjvghrvghmhiesshihshhtvghmjeeirdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeiudduffejtefhtdeghefhieduueetveeufedvhfehffehtedu
    uefhteelheekvdenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhgvrhgvmhihsehshihsthgv
    mhejiedrtghomh
X-ME-Proxy: <xmx:DmsHX6pQdDarMRkkoeY6JxaaI97wNsutmiF9iE5SfPS8xNhRgFak8w>
    <xmx:DmsHX5NsF3BvR525UAgpGaBxghPLLVPbG2jWJ9ppIVuEJUSDgw_WGA>
    <xmx:DmsHX7647JvbDsYapqyHC-DIoEzHKgCzH4BvFSpC9y43JLash1ce6g>
    <xmx:DmsHXwhpACZSQsJO6BNXpWi_xo1vbEYwP1yoc5s-c0IwmWM09-iOQQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 36998E00AA; Thu,  9 Jul 2020 15:07:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-dev0-613-g8a73ad6-fm-20200709.001-g8a73ad6e
Mime-Version: 1.0
Message-Id: <1947c101-bac1-45cd-825c-35633bcf0ae4@www.fastmail.com>
In-Reply-To: <b979419a-f944-448f-b276-e9f609d721bf@www.fastmail.com>
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
 <b979419a-f944-448f-b276-e9f609d721bf@www.fastmail.com>
Date:   Thu, 09 Jul 2020 13:07:38 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     "Aaron Honeycutt" <aaron@system76.com>,
        "Andy Shevchenko" <andy.shevchenko@gmail.com>,
        "Nick Shipp" <git@segbrk.com>
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>,
        "Platform Driver" <platform-driver-x86@vger.kernel.org>
Subject: =?UTF-8?Q?Re:_[RESEND_PATCH]_system76-acpi:_Fix_brightness=5Fset_schedul?=
 =?UTF-8?Q?e_while_atomic?=
Content-Type: text/plain
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Aaron, this patch is for our DKMS driver. It also needs to be applied upstream.

-- 
  Jeremy Soller
  System76
  Principal Engineer
  jeremy@system76.com

On Thu, Jul 9, 2020, at 12:54 PM, Aaron Honeycutt wrote:
> Andy,
> 
> These changes have already been applied in this commit:
> 
> https://github.com/pop-os/system76-acpi-dkms/commit/54ac52e611b60adc50e5f977e908c5547021e4a4
> 
> Aaron Honeycutt
> System76, Inc.
> Happiness Engineer
> 720-226-9269 x602
> aaron@system76.com
> 
> On Thu, Jul 9, 2020, at 12:50 PM, Andy Shevchenko wrote:
> > On Tue, Jun 23, 2020 at 5:44 PM Nick Shipp <git@segbrk.com> wrote:
> > >
> > > And here's a fix for my email client and bad copy-paste, sorry about that noise.
> > >
> > > `system76_set' was set as an LED `brightness_set' callback, but it calls
> > > `acpi_evaluate_object' which is not atomic-safe. Switched to the
> > > `brightness_set_blocking' LED callback instead.
> > >
> > > Signed-off-by: Nick Shipp <git@segbrk.com>
> > 
> > This patch is mangled and can not be applied.
> > 
> > > ---
> > >  drivers/platform/x86/system76_acpi.c | 12 ++++++------
> > >  1 file changed, 6 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/system76_acpi.c
> > > b/drivers/platform/x86/system76_acpi.c
> > > index 4f6e4c342382..c14fd22ba196 100644
> > > --- a/drivers/platform/x86/system76_acpi.c
> > > +++ b/drivers/platform/x86/system76_acpi.c
> > > @@ -103,12 +103,12 @@ static enum led_brightness ap_led_get(struct
> > > led_classdev *led)
> > >  }
> > >
> > >  // Set the airplane mode LED brightness
> > > -static void ap_led_set(struct led_classdev *led, enum led_brightness value)
> > > +static int ap_led_set(struct led_classdev *led, enum led_brightness value)
> > >  {
> > >         struct system76_data *data;
> > >
> > >         data = container_of(led, struct system76_data, ap_led);
> > > - system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
> > > + return system76_set(data, "SAPL", value == LED_OFF ? 0 : 1);
> > >  }
> > >
> > >  // Get the last set keyboard LED brightness
> > > @@ -121,13 +121,13 @@ static enum led_brightness kb_led_get(struct
> > > led_classdev *led)
> > >  }
> > >
> > >  // Set the keyboard LED brightness
> > > -static void kb_led_set(struct led_classdev *led, enum led_brightness value)
> > > +static int kb_led_set(struct led_classdev *led, enum led_brightness value)
> > >  {
> > >         struct system76_data *data;
> > >
> > >         data = container_of(led, struct system76_data, kb_led);
> > >         data->kb_brightness = value;
> > > - system76_set(data, "SKBL", (int)data->kb_brightness);
> > > + return system76_set(data, "SKBL", (int)data->kb_brightness);
> > >  }
> > >
> > >  // Get the last set keyboard LED color
> > > @@ -313,7 +313,7 @@ static int system76_add(struct acpi_device *acpi_dev)
> > >         data->ap_led.name = "system76_acpi::airplane";
> > >         data->ap_led.flags = LED_CORE_SUSPENDRESUME;
> > >         data->ap_led.brightness_get = ap_led_get;
> > > - data->ap_led.brightness_set = ap_led_set;
> > > + data->ap_led.brightness_set_blocking = ap_led_set;
> > >         data->ap_led.max_brightness = 1;
> > >         data->ap_led.default_trigger = "rfkill-none";
> > >         err = devm_led_classdev_register(&acpi_dev->dev, &data->ap_led);
> > > @@ -323,7 +323,7 @@ static int system76_add(struct acpi_device *acpi_dev)
> > >         data->kb_led.name = "system76_acpi::kbd_backlight";
> > >         data->kb_led.flags = LED_BRIGHT_HW_CHANGED | LED_CORE_SUSPENDRESUME;
> > >         data->kb_led.brightness_get = kb_led_get;
> > > - data->kb_led.brightness_set = kb_led_set;
> > > + data->kb_led.brightness_set_blocking = kb_led_set;
> > >         if (acpi_has_method(acpi_device_handle(data->acpi_dev), "SKBC")) {
> > >                 data->kb_led.max_brightness = 255;
> > >                 data->kb_toggle_brightness = 72;
> > > --
> > > 2.27.0
> > 
> > 
> > 
> > -- 
> > With Best Regards,
> > Andy Shevchenko
> >
>
