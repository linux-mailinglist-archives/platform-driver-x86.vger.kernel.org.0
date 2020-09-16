Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13C5E26CDB7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 23:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgIPVET (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 17:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726249AbgIPQPB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 12:15:01 -0400
Received: from mail.sammserver.com (sammserver.com [IPv6:2001:470:5a5b:1::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 601DFC035433
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 09:06:08 -0700 (PDT)
Received: by mail.sammserver.com (Postfix, from userid 5011)
        id E89E810580FD; Wed, 16 Sep 2020 18:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1600272366; bh=36Zio7BBp5cw1oKfhjS3qQh9D2XAPuIo4eAIqnmA+d0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYPMObxWg7Kq3mz5tXM9TBTBOT60NX0UvY6rtY3oD1qvv2VLUldwwHRcRB07bWnNJ
         c3PvgylKLIf32FTOHa9mu2MA1qJ2hBuqXmb7IwND53TpbfHeNLI6mMKt9Fd7JDch5V
         1nX8HHHn4yx5HuJWKaG6JILYLDn3CIPRe1sJjr9o=
Received: from fastboi.localdomain (fastboi.wg [10.32.40.5])
        by mail.sammserver.com (Postfix) with ESMTP id ADEC910580F8;
        Wed, 16 Sep 2020 18:06:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cavoj.net; s=email;
        t=1600272366; bh=36Zio7BBp5cw1oKfhjS3qQh9D2XAPuIo4eAIqnmA+d0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WYPMObxWg7Kq3mz5tXM9TBTBOT60NX0UvY6rtY3oD1qvv2VLUldwwHRcRB07bWnNJ
         c3PvgylKLIf32FTOHa9mu2MA1qJ2hBuqXmb7IwND53TpbfHeNLI6mMKt9Fd7JDch5V
         1nX8HHHn4yx5HuJWKaG6JILYLDn3CIPRe1sJjr9o=
Received: by fastboi.localdomain (Postfix, from userid 1000)
        id A04961420578; Wed, 16 Sep 2020 18:06:05 +0200 (CEST)
Date:   Wed, 16 Sep 2020 18:06:05 +0200
From:   Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always
 reporting 1 on the Asus UX360CA
Message-ID: <20200916160605.2wx735h2jn5773fs@fastboi.localdomain>
References: <20200911132618.187297-1-hdegoede@redhat.com>
 <8035726f-536e-4e62-2ef3-b27e43e15759@redhat.com>
 <86d3f91e-8ada-2992-7197-dfca738f7974@redhat.com>
 <20200916140008.5rlepwg5j4v6qx4d@fastboi.localdomain>
 <055d8a05-fd09-ba51-7f2b-737b66202994@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <055d8a05-fd09-ba51-7f2b-737b66202994@redhat.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=ALL_TRUSTED,BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS autolearn=no autolearn_force=no
        version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on sammserver.tu
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 16.09.2020 17:00, Hans de Goede wrote:
> Hi,
> 
> On 9/16/20 4:00 PM, Samuel Čavoj wrote:
> > Hello,
> > 
> > On 16.09.2020 15:13, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 9/16/20 3:04 PM, Hans de Goede wrote:
> > > > Hi,
> > > > 
> > > > On 9/11/20 3:26 PM, Hans de Goede wrote:
> > > > > On the Asus UX360CA the ASUS_WMI_DEVID_KBD_DOCK devstate always reports 0,
> > > > > which we translate to SW_TABLET_MODE=1. Which causes libinput to disable
> > > > > the keyboard and touchpad even if the 360 degree hinges style 2-in-1 is
> > > > > in laptop mode.
> > > > > 
> > > > > Samuel found out that this model has another WMI "object" with an devid of
> > > > > 0x00060062 which correctly reports laptop vs tablet-mode on the
> > > > > Asus UX360CA.
> > > > > 
> > > > > All the models on which the SW_TABLET_MODE code was previously tested do
> > > > > not have this new devid 0x00060062 object.
> > > > > 
> > > > > This commit adds support for the new devid 0x00060062 object and prefers it
> > > > > over the older 0x00120063 object when present, fixing SW_TABLET_MODE always
> > > > > being reported as 1 on these models.
> > > > > 
> > > > > Reported-and-tested-by: Samuel Čavoj <samuel@cavoj.net>
> > > > > Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> > > > 
> > > > Self NACK, preferring the newer ASUS WMI device-id for the switch when present
> > > > does not fix this everywhere.
> > > > 
> > > > Recently there have been more bug-reports about this and at least the Asus E200HA
> > > > laptop does not have the newer ASUS WMI device-id in its DSDT:
> > > > 
> > > >     https://bugzilla.redhat.com/show_bug.cgi?id=1875339
> > > >     https://bugzilla.redhat.com/show_bug.cgi?id=1875828
> > > >     https://bugzilla.redhat.com/show_bug.cgi?id=1876997
> > > > 
> > > > So I'm preparing a new patch which uses a DMI based whitelist for the SW_TABLET_MODE
> > > > functionality, Using the existing DMI quirks mechanism in asus-nb-wmi.c .
> > > 
> > > p.s.
> > > 
> > > Note the new ASUS-WMI device-id did actually give a working SW_TABLET_MODE
> > > on the Asus Zenbook Flip UX360CA.
> > > 
> > > Samuel Čavoj, perhaps you can do a follow-up patch to my fix (once I've
> > > posted it) enabling the new dev-id on devices with "Zenbook Flip*" as
> > > DMI product-name ?
> > 
> > I would be happy to.
> > 
> > > 
> > > At least I hope the DMI product-name starts with a prefix which has Flip in it?  See:
> > > at /sys/class/dmi/id/product_name
> > 
> > Unfortunately, this is not the case. product_name is just "UX360CAK" and
> > none of the other values contain anything useful either. (e.g.
> > product_family is just "UX")
> 
> It seems all the UX360 models are flip models (I guess the 360 refers
> to 360 degree hinges), so you could do a non-exact (the default) DMI_MATCH
> on product-name containing UX360.

I didn't realize that. Yeah, it sounds reasonable.

> 
> > Two solutions come to my mind:
> >   1. Manually build up a whitelist of devices with DEVID_FLIP_TABLET_MODE.
> >   2. Keep the logic of first checking the DEVID_FLIP_TABLET_MODE. If
> >      present use it, if not present then fall back to your DMI whitelist
> >      for the DEVID_KDB_DOCK.
> > 
> > The first solution sounds like an uphill battle and I don't know how I
> > would even start collecting devices. The second one is risky, but as we
> > haven't yet seen a device which misreports DEVID_FLIP_TABLET_MODE, I
> > think it should be fine. Unless ASUS does it yet again, of course.
> 
> I fully expect Asus to have done this again.

Right on. I guess I'm still new enough to this that I have hope.

> 
> > What do you think?
> 
> One advantage of the DEVID_FLIP_TABLET_MODE is that it directly
> returns SW_TABLET_MODE, where as ASUS_WMI_DEVID_KBD_DOCK returns 1
> when a Transformer model is attached to its kbd-dock, so we need
> to invert the value to get SW_TABLET_MODE and it seems that on
> all non transformers ASUS_WMI_DEVID_KBD_DOCK simply always returns 0
> which we invert to 1, causing the issue at hand.
> 
> So assuming that on non flips DEVID_FLIP_TABLET_MODE defaults
> to returning 0, we should avoid the alwasy reporting 1 problem.
> 
> But the mere presence of a SW_TABLET_MODE switch hints to userspace
> that it is dealing with a 2-in-1 which might make userspace change
> some behavior even if currently not in tablet-mode.
> 
> > Hans, you have a collection of DSTS's, is that right? Could you try
> > searching it for DEVID_FLIP_TABLET_MODE and seeing if the devices which
> > have it actually also have a 360 degree hinge? This could shed some
> > light on the situation. I have indirect access to a UX434FLC as well (it
> > does not have the hinge) so I can check it myself.
> 
> Most of my Asus DSDTs are from various Transformer models. Of the
> non transform DSDTs which I have both the FX503VD and the GL503VD
> have the DEVID_FLIP_TABLET_MODE even though they are not 2-in-1s

Oh well. That's unfortunate.

> so I believe that it would be best to support DEVID_FLIP_TABLET_MODE
> through an allow-list too, just like I'm doing for the
> ASUS_WMI_DEVID_KBD_DOCK in my upcoming fix.

Yeah, that does seem best indeed. I'll give it a shot.

Regards,
Sam

> > > > > ---
> > > > >    drivers/platform/x86/asus-wmi.c            | 32 ++++++++++++++++++----
> > > > >    include/linux/platform_data/x86/asus-wmi.h |  1 +
> > > > >    2 files changed, 28 insertions(+), 5 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > > > > index 8f4acdc06b13..c8689da0323b 100644
> > > > > --- a/drivers/platform/x86/asus-wmi.c
> > > > > +++ b/drivers/platform/x86/asus-wmi.c
> > > > > @@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
> > > > >    #define NOTIFY_KBD_BRTTOGGLE        0xc7
> > > > >    #define NOTIFY_KBD_FBM            0x99
> > > > >    #define NOTIFY_KBD_TTP            0xae
> > > > > +#define NOTIFY_FLIP_TABLET_MODE_CHANGE    0xfa
> > > > >    #define ASUS_WMI_FNLOCK_BIOS_DISABLED    BIT(0)
> > > > > @@ -173,6 +174,7 @@ struct asus_wmi {
> > > > >        int spec;
> > > > >        int sfun;
> > > > >        bool wmi_event_queue;
> > > > > +    bool use_flip_tablet_mode;
> > > > >        struct input_dev *inputdev;
> > > > >        struct backlight_device *backlight_device;
> > > > > @@ -365,12 +367,22 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
> > > > >        if (err)
> > > > >            goto err_free_dev;
> > > > > -    result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
> > > > > +    result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_FLIP_TABLET_MODE);
> > > > >        if (result >= 0) {
> > > > > +        asus->use_flip_tablet_mode = true;
> > > > >            input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> > > > > -        input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
> > > > > -    } else if (result != -ENODEV) {
> > > > > -        pr_err("Error checking for keyboard-dock: %d\n", result);
> > > > > +        input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> > > > > +    } else {
> > > > > +        if (result != -ENODEV)
> > > > > +            pr_err("Error checking for flip-tablet-mode: %d\n", result);
> > > > > +
> > > > > +        result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
> > > > > +        if (result >= 0) {
> > > > > +            input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> > > > > +            input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
> > > > > +        } else if (result != -ENODEV) {
> > > > > +            pr_err("Error checking for keyboard-dock: %d\n", result);
> > > > > +        }
> > > > >        }
> > > > >        err = input_register_device(asus->inputdev);
> > > > > @@ -2114,7 +2126,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> > > > >            return;
> > > > >        }
> > > > > -    if (code == NOTIFY_KBD_DOCK_CHANGE) {
> > > > > +    if (!asus->use_flip_tablet_mode && code == NOTIFY_KBD_DOCK_CHANGE) {
> > > > >            result = asus_wmi_get_devstate_simple(asus,
> > > > >                                  ASUS_WMI_DEVID_KBD_DOCK);
> > > > >            if (result >= 0) {
> > > > > @@ -2125,6 +2137,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
> > > > >            return;
> > > > >        }
> > > > > +    if (asus->use_flip_tablet_mode && code == NOTIFY_FLIP_TABLET_MODE_CHANGE) {
> > > > > +        result = asus_wmi_get_devstate_simple(asus,
> > > > > +                              ASUS_WMI_DEVID_FLIP_TABLET_MODE);
> > > > > +        if (result >= 0) {
> > > > > +            input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> > > > > +            input_sync(asus->inputdev);
> > > > > +        }
> > > > > +        return;
> > > > > +    }
> > > > > +
> > > > >        if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
> > > > >            fan_boost_mode_switch_next(asus);
> > > > >            return;
> > > > > diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> > > > > index 897b8332a39f..1897b4683562 100644
> > > > > --- a/include/linux/platform_data/x86/asus-wmi.h
> > > > > +++ b/include/linux/platform_data/x86/asus-wmi.h
> > > > > @@ -62,6 +62,7 @@
> > > > >    /* Misc */
> > > > >    #define ASUS_WMI_DEVID_CAMERA        0x00060013
> > > > > +#define ASUS_WMI_DEVID_FLIP_TABLET_MODE    0x00060062
> > > > >    /* Storage */
> > > > >    #define ASUS_WMI_DEVID_CARDREADER    0x00080013
> > > > > 
> > > 
> > 
> 
