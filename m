Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3681F2570AC
	for <lists+platform-driver-x86@lfdr.de>; Sun, 30 Aug 2020 23:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbgH3VRz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 Aug 2020 17:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbgH3VRy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Aug 2020 17:17:54 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D400C061573
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2020 14:17:54 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h4so4354404ejj.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2020 14:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Ix6h5gGnRSR+rPhG/QUMeRmRPMBUMVIVnPPTyEwHNIQ=;
        b=YuZy+8tiHEm8+1xUFpFl1y+6HkD33hUvDqFr0dEzeGSqBlnM4ThEnl8G8JFjKlg6YM
         nVkF+7j8U76CIzDgfgT2XsKYhxcfPGNl7hkTD80OY/Dncg7LNUTCiip3Fm3WoIPfdJRS
         fbzc2s7rKHgcjAsKMnHUze404psFt2tdS5i4jM5buyWeyr3LdPpxKs3i1K/iUQFBp4Y7
         +HUcjoG7CBBA3gIp7ESWNT/osU7KdNi7mSDL8rEc5mRx3qH7en7DE64rY0mFsBLqz5UY
         yYyYn6neL8mplzlSdXo5M+XlNisEjOlt0M1Xq134UCH7vBEWItznikT07HoJlqxZ+y3U
         kGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ix6h5gGnRSR+rPhG/QUMeRmRPMBUMVIVnPPTyEwHNIQ=;
        b=SsVA3n7g8sI4Rr8AaWSkFWMI8M3IlW12fJyRuurvk3M6UNEjPUwIjXvB8XatwYWuuY
         aslo4a+OgkG/MtPIQdISNCVRmDcyvdtmZYSbtXV7/zTQQMlKQgqm1L4JoDbxLzuoxiMi
         480TOeiyKUm2v8oPCZA/HSnrzolfybF94SI9rxhb/PP/CM5azWKuBM6CUwTulAobndIf
         STqCrKXwwkX5f0Q0ssHcHH16rVuZjcs3d24IAYYNsuzP3R7MnG7FwiFKXG2XL9QbaEtt
         UadcSaM2fPDR6pAZdJc0ITt2ioW0RRPCcdZR5u64k2QYWhv5++szZzSyMu30jkqWJtAt
         8IMQ==
X-Gm-Message-State: AOAM532s9afw+S/5VOprWWG7EcgYG5JuNurrPLDfDA3gihhQ2qHYEtY4
        1EC5AkUcziwG5MbYHjvB6CA=
X-Google-Smtp-Source: ABdhPJxhx6E92PPSeIcUNeJqgnDHtCiA0K7lJks19D+wYe85zTAflzv8q50qL2rQyrgC4/XWtjvMRg==
X-Received: by 2002:a17:906:3fc7:: with SMTP id k7mr9047034ejj.301.1598822272549;
        Sun, 30 Aug 2020 14:17:52 -0700 (PDT)
Received: from archer ([82.77.79.3])
        by smtp.gmail.com with ESMTPSA id lo25sm2670265ejb.53.2020.08.30.14.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 14:17:51 -0700 (PDT)
Date:   Mon, 31 Aug 2020 00:17:50 +0300
From:   Marius Iacob <themariusus@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?utf-8?B?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
Message-ID: <20200830211750.bmi2fpylctehqsnm@archer>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
 <20200824190043.tvy3ryzr27su4bg4@archer-mini>
 <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 20-08-24 22:23:41, Hans de Goede wrote:
> Hi,
> 
> On 8/24/20 9:00 PM, Marius Iacob wrote:
> > On 20-08-24 12:02:12, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 8/24/20 10:25 AM, Andy Shevchenko wrote:
> > > > On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
> > > > 
> > > > > I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
> > > > 
> > > > Can you be more specific, why that module is not loaded?
> > > 
> > > Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
> > > kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.
> > > 
> > 
> > I'm sorry, forgot to mention, because my device is a 2-in-1 it uses a detachable keyboard/touchpad and is connected by USB interface. So when trying to load i8042 module (also tried reset/nomux) it always says in dmesg "i8042: PNP: No PS/2 controller found." I'm guessing there is no PS/2 controller on this device...
> 
> Ah I see, and I guess that after the "i8042: PNP: No PS/2 controller found." message (which is fine) the module fails to load, right ?

Yes, modprobe: ERROR: could not insert 'i8042': No such device, and there's no trace of i8042 in lsmod output.

> That really is a bug in the i8042 code, if a module is providing symbols to another module it should never exit with an error from
> its module_init function.

i8042 is doing a full init in its module_init. I've bypassed the PNP controller check and it fail while trying to talk to the controller:
	i8042: PNP detection disabled
	i8042: Can't read CTR while initializing i8042
	i8042: probe of i8042 failed with error -5
I'm guessing it's module_init should look like asus-wmi's: a message saying it's loaded and return 0; but I don't have enough kernel development experience to do this modification.

> I guess most people do not have this problem because in the typical distro config the i8042 driver is built into the kernel.

I guess I could ask the Arch Linux devs to build the kernel with i8042 in it. But that wouldn't be my first choice.

> > > > > I see that i8042 is used in asus-nb-wmi for a quirk, so it's not necessary all the time. How can I make it an optional dependecy?
> > > 
> > > include/linux/i8042.h
> > > 
> > > Contains a stub for i8042_install_filter() for when CONFIG_SERIO_I8042 is not enabled, so you can build
> > > your own kernel with that option unset. But we really ought to come up with a better fix which will also
> > > work for standard distro kernels, see above.
> > 
> > I've built a asus-nb-wmi module without i8042 references and it works. I had to add "BATC" for battery RSOC (my battery is named BATC). And yes, I also have tried to make the module work for my device around the i8042 dependecy, tried to add IS_REACHABLE(CONFIG_SERIO_I8042) in .c and imply SERIO_I8042 in Kconfig, but it didn't work, so I don't think I was on the right track. I have little experience with kernel development and I figured asking some more experienced people was a better idea.
> > Thanks for your reply. If you have any ideas I'm more than happy to try/code them out and submit a patch if/when it works.
> 
> If I understand things correctly (see above) then the right fix for the I8042 driver issue is to patch
> its module_init function to return with 0 instead of -ENODEV (I guess) when it hits the code path with the
> "i8042: PNP: No PS/2 controller found." message.
> 
> Let me know if you need any help with that.

As I explained above, I think it's more complicated than that. If you have any suggestions of what would be a good course of action here I'd be happy to do the grunt work.

> As for the "I had to add "BATC" for battery RSOC (my battery is named BATC)" bit I'm missing some
> context there / not entirely following you, but lets first tackle the i8042 thing and then look
> at that other issue later.

The short story for this is that the battery on my device is named BATC and I've had to add a check for BATC (there were alredy checks for BAT0,BAT1,BATT) in asus_wmi_battery_add in asus-wmi.c that is used when asus-nb-wmi is loaded. And this was the main reason I wanted to make this module work, for the battery charge limit.

Thank you,
Marius
