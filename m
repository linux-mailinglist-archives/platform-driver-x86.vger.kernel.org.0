Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 980A7257531
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Aug 2020 10:21:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbgHaIVd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Aug 2020 04:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbgHaIVa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Aug 2020 04:21:30 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C4DBC061573
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 01:21:30 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id m22so7268489eje.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 01:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DI6AfyTjIK5E1HCyegqXJ6qZsQaVI2goBravj97iFLc=;
        b=X1pylGFqlesJQPK9c8R52BnPjrVAVFosQF27ypWl/4tWl0oHxiqV8n3CV/lwCfrwfe
         3bi7LCyHu4nw2QDkgJxuSnMDgNGKQSdYvgx6ZjEz8ZUfWayN7XhJO/kT90deeevlukrP
         PmyzFQJrOFJhV/rrdc/CMqczsij+61kF4W/RSjzRoCnzAaCct2ghokAdyhcnliKCgbPr
         pgWsFCoh7s0nNqxuMt3TtxpwJ9YscWnUeTMJyfOwjawErHqYVTqU0GHWwIV/3hiJ5cuG
         a+K5Qw/YTOlOvzU2Se5tKZ4sh0w4W37XVwn6F+sfEkN1Ff7yMcDQEZkSuj80UMRkeUzr
         qbtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DI6AfyTjIK5E1HCyegqXJ6qZsQaVI2goBravj97iFLc=;
        b=mpkH9scxif/oiOqR3TupdBP6F5pIKE+yfGrQwG2ArGgSdQ/WNKI/RxNZsw1UrOb92c
         FnOZUUVZFmh91iCZW8+3c0CnuGS4VnJrNaKdt7pcdnkBWxw4hiQPL3OdPNIRRJK/BbVk
         764ibiqZvDaScZo0yz08Z2pF2WFtwiiRUeW8wgkaxtvPrE6ME7cHj6y551HoX/sEGxm3
         iozlUg+tQ2lljm+VQNSew/a3fPEEqio1LNzQviDQT4zLv/1/iZpqH09C1ov7dT1k9H1t
         fBPPpNFXOxo3WjkefCjuKnTL3hU3q4cR2Ew9k5zeNFlgqWHfMl3iHlu+ewacbLs5++/w
         LRLg==
X-Gm-Message-State: AOAM531nqOGAvNfDzYHJ2kIlxJT/2ARFJeg98lsYTKlzNPbLeBbUKjul
        uYAnkk6/E5Zz+DsuBT9eKFw=
X-Google-Smtp-Source: ABdhPJwj7MXUUhOqjXdcLCzRrYtbGyZ66yDpNlpgn3FhBfVM+EBb9o/MLocwrRNKu9a9xFo2lGQdKg==
X-Received: by 2002:a17:906:3485:: with SMTP id g5mr53670ejb.411.1598862088928;
        Mon, 31 Aug 2020 01:21:28 -0700 (PDT)
Received: from archer ([82.77.79.3])
        by smtp.gmail.com with ESMTPSA id c5sm4442744edt.24.2020.08.31.01.21.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 01:21:27 -0700 (PDT)
Date:   Mon, 31 Aug 2020 11:21:26 +0300
From:   Marius Iacob <themariusus@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?utf-8?B?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
Message-ID: <20200831082126.wsto3d2qqkylscm4@archer>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
 <20200824190043.tvy3ryzr27su4bg4@archer-mini>
 <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
 <20200830211750.bmi2fpylctehqsnm@archer>
 <a7a5b70e-47bb-e4bc-76ac-82e83fd4d746@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7a5b70e-47bb-e4bc-76ac-82e83fd4d746@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 20-08-31 09:36:24, Hans de Goede wrote:
> Hi,
> 
> On 8/30/20 11:17 PM, Marius Iacob wrote:
> > On 20-08-24 22:23:41, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 8/24/20 9:00 PM, Marius Iacob wrote:
> > > > On 20-08-24 12:02:12, Hans de Goede wrote:
> > > > > Hi,
> > > > > 
> > > > > On 8/24/20 10:25 AM, Andy Shevchenko wrote:
> > > > > > On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
> > > > > > 
> > > > > > > I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
> > > > > > 
> > > > > > Can you be more specific, why that module is not loaded?
> > > > > 
> > > > > Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
> > > > > kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.
> > > > > 
> > > > 
> > > > I'm sorry, forgot to mention, because my device is a 2-in-1 it uses a detachable keyboard/touchpad and is connected by USB interface. So when trying to load i8042 module (also tried reset/nomux) it always says in dmesg "i8042: PNP: No PS/2 controller found." I'm guessing there is no PS/2 controller on this device...
> > > 
> > > Ah I see, and I guess that after the "i8042: PNP: No PS/2 controller found." message (which is fine) the module fails to load, right ?
> > 
> > Yes, modprobe: ERROR: could not insert 'i8042': No such device, and there's no trace of i8042 in lsmod output.
> > 
> > > That really is a bug in the i8042 code, if a module is providing symbols to another module it should never exit with an error from
> > > its module_init function.
> > 
> > i8042 is doing a full init in its module_init. I've bypassed the PNP controller check and it fail while trying to talk to the controller:
> > 	i8042: PNP detection disabled
> > 	i8042: Can't read CTR while initializing i8042
> > 	i8042: probe of i8042 failed with error -5
> > I'm guessing it's module_init should look like asus-wmi's: a message saying it's loaded and return 0; but I don't have enough kernel development experience to do this modification.
> 
> I haven't looked at the code (yet) but going by your description the trick would be to keep the PnP
> check in the module_init function and instead of -ENODEV just return 0 when the check fails so that
> the rest of the init function gets skipped.
> 
> You probably want to check module_exit in this case to see if that is safe to run with the
> rest of module_init skipped.
> 
> Let me know if you need more help with this, I believe that fixing this should be pretty easy.

Unfortunately the PNP check is 2 layers deeper from module_init and it's expected to return 0 for success for the rest of the init procedure to continue (so that it's not that straightforward). The module seems to be built with a full init procedure on load in mind. I've looked at the code for quite a bit and it seems that it's a bit of patch to write, and most of the places the i8042 code is used (in other modules) expects the module to be not just loaded but fully initialized. So this should be a consideration also.

> > > I guess most people do not have this problem because in the typical distro config the i8042 driver is built into the kernel.
> > 
> > I guess I could ask the Arch Linux devs to build the kernel with i8042 in it. But that wouldn't be my first choice.
> > 
> > > > > > > I see that i8042 is used in asus-nb-wmi for a quirk, so it's not necessary all the time. How can I make it an optional dependecy?
> > > > > 
> > > > > include/linux/i8042.h
> > > > > 
> > > > > Contains a stub for i8042_install_filter() for when CONFIG_SERIO_I8042 is not enabled, so you can build
> > > > > your own kernel with that option unset. But we really ought to come up with a better fix which will also
> > > > > work for standard distro kernels, see above.
> > > > 
> > > > I've built a asus-nb-wmi module without i8042 references and it works. I had to add "BATC" for battery RSOC (my battery is named BATC). And yes, I also have tried to make the module work for my device around the i8042 dependecy, tried to add IS_REACHABLE(CONFIG_SERIO_I8042) in .c and imply SERIO_I8042 in Kconfig, but it didn't work, so I don't think I was on the right track. I have little experience with kernel development and I figured asking some more experienced people was a better idea.
> > > > Thanks for your reply. If you have any ideas I'm more than happy to try/code them out and submit a patch if/when it works.
> > > 
> > > If I understand things correctly (see above) then the right fix for the I8042 driver issue is to patch
> > > its module_init function to return with 0 instead of -ENODEV (I guess) when it hits the code path with the
> > > "i8042: PNP: No PS/2 controller found." message.
> > > 
> > > Let me know if you need any help with that.
> > 
> > As I explained above, I think it's more complicated than that. If you have any suggestions of what would be a good course of action here I'd be happy to do the grunt work.
> 
> See my answer above, again let me know if you need more help (I will
> likely just write a patch for this myself then).
> 
> > > As for the "I had to add "BATC" for battery RSOC (my battery is named BATC)" bit I'm missing some
> > > context there / not entirely following you, but lets first tackle the i8042 thing and then look
> > > at that other issue later.
> > 
> > The short story for this is that the battery on my device is named BATC and I've had to add a check for BATC (there were alredy checks for BAT0,BAT1,BATT) in asus_wmi_battery_add in asus-wmi.c that is used when asus-nb-wmi is loaded. And this was the main reason I wanted to make this module work, for the battery charge limit.
> 
> Ah I see, I was not aware of the existing checks and yes being able to set
> battery charge limits is quite useful. So this needs to go into a separate
> patch (obviously, since the other patch will be for the i8042 code), but
> otherwise this sounds fine for upstream.

I will definitely write a patch for this when the i8042 issue is resolved.

Regards,
Marius

