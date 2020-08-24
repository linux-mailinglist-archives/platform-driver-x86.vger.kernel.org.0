Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF672508A0
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Aug 2020 21:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgHXTAv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Aug 2020 15:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725963AbgHXTAt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Aug 2020 15:00:49 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F963C061573
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2020 12:00:49 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i26so9051514edv.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2020 12:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6rZIqv+St0ikLG/GlnsSvydbJ26u3tr5eKLBnwDtvgg=;
        b=KD2EyUBVhJa+tpJo+dLqThCbIc5VWQs854NrEVnl+pUVU+WbRWDgRBy3u+KZM72H2n
         iW2MlTiXNaKLbOwEpOfCrk2KRgd1DpnkOOkveBuJGSxIkRoRgLz3CMRx8g4iiCXvVOOt
         V56Z9AjrvDrTzh85EP5APsGsI6ovhI4vbnHpcDwu2NFHw+UMMrerOkrP4fWH3iJxVFJr
         mCnO8DnFVtC7rt+foE+OP09S4rrKXkWnbDqReIdjRnSm2KOAE2rH5PIEBd3rtRbe9omx
         o9VqvfKQpg07SHrkyViILLeDV9Fi8WpPRqLv3mRjjwgfMPFVIwqk2D0fwYyWFiM7R+Gu
         67mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6rZIqv+St0ikLG/GlnsSvydbJ26u3tr5eKLBnwDtvgg=;
        b=uJ/kSoSL1N5to8/pKXPhY7hGGanqNZj9SUgjjqLb3r03BwQ2Ydm02X8cGDPXpmFeZ8
         57GjyCET3B/bzeYGlXO/y427PYsbq7mXO55Gtn+2qgfwHuaBDx8THLF3D7VBWq0o6cm5
         OFxcjGeIhkxFz8HLl7vyxWRm3g77F9C0AxfVAGo5oJTmFCanIs9dgGtP1vDSt3Adf1hm
         UPq5B/s4oDEFYjHR4BCZg+z9E3iElGNmQVxKmW6DRI6Ya9ZUNMbyX5AIiu1IFC7j1yUK
         cE/4knDU+X1IBBjeVCVpm7t4vcUypxDv+QSsk/V9TgMNko7NeXu+WHg3JVWZ7eQk1pwk
         VOAg==
X-Gm-Message-State: AOAM533lvlrMiVjD+OWNWfouEbGW3axjBCaZLYopV9ARn81S8LJ80qkX
        8kFZFrLbKKeX63WLvynDj00=
X-Google-Smtp-Source: ABdhPJzlduYEpQ470iu7sZ5fCuRVkLgFi3VYWZ/dBzGSAGMQu/ejp0se76RxXbU13BrEnWbC/Xjnrg==
X-Received: by 2002:a05:6402:17c2:: with SMTP id s2mr6638555edy.188.1598295648009;
        Mon, 24 Aug 2020 12:00:48 -0700 (PDT)
Received: from archer-mini ([82.137.9.48])
        by smtp.gmail.com with ESMTPSA id l25sm2692307ejg.11.2020.08.24.12.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 12:00:47 -0700 (PDT)
Date:   Mon, 24 Aug 2020 22:00:43 +0300
From:   Marius Iacob <themariusus@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?utf-8?B?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
Message-ID: <20200824190043.tvy3ryzr27su4bg4@archer-mini>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 20-08-24 12:02:12, Hans de Goede wrote:
> Hi,
> 
> On 8/24/20 10:25 AM, Andy Shevchenko wrote:
> > On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
> > 
> > > I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
> > 
> > Can you be more specific, why that module is not loaded?
> 
> Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
> kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.
>

I'm sorry, forgot to mention, because my device is a 2-in-1 it uses a detachable keyboard/touchpad and is connected by USB interface. So when trying to load i8042 module (also tried reset/nomux) it always says in dmesg "i8042: PNP: No PS/2 controller found." I'm guessing there is no PS/2 controller on this device...

> > > I see that i8042 is used in asus-nb-wmi for a quirk, so it's not necessary all the time. How can I make it an optional dependecy?
> 
> include/linux/i8042.h
> 
> Contains a stub for i8042_install_filter() for when CONFIG_SERIO_I8042 is not enabled, so you can build
> your own kernel with that option unset. But we really ought to come up with a better fix which will also
> work for standard distro kernels, see above.

I've built a asus-nb-wmi module without i8042 references and it works. I had to add "BATC" for battery RSOC (my battery is named BATC). And yes, I also have tried to make the module work for my device around the i8042 dependecy, tried to add IS_REACHABLE(CONFIG_SERIO_I8042) in .c and imply SERIO_I8042 in Kconfig, but it didn't work, so I don't think I was on the right track. I have little experience with kernel development and I figured asking some more experienced people was a better idea.
Thanks for your reply. If you have any ideas I'm more than happy to try/code them out and submit a patch if/when it works.
> 
> Regards,
> 
> Hans
> 

Danke,

Marius
