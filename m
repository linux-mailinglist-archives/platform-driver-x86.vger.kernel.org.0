Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94372578E2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Aug 2020 14:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgHaMCb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Aug 2020 08:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgHaMCY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Aug 2020 08:02:24 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4A6C061573
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 05:02:23 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id i22so2248461eja.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=niZ6XoKmw7NHnCb63ALIlkObmxNNLrfHYASn1LtcyWE=;
        b=Xt0/4o+wtY7EyEuBBtZUCBodN+4Ix4JrZCeuOxiuQi8VNidYxMSefQwh+KzMMWDl0z
         2k34KmWQQQzrXUkXKFN6oCUN7B69n8+0bK5cw1UIwMFABwFLHcGKmPUV7S3XQLnvj6rN
         5Z0H3+vIATqANcvoPusLowM+b+SgFVIABRBMl7AiqrcdBym5o9CJX1JfSRAMT8MmWEuj
         l7qhp7tpYgUYThbU0TD65vMz8zZ4Q+nwGZ6BocuqfoKihRq8TQgWM0vnUvaS8Jc6GG9W
         Vz+Pz5sZLtgy+JxmlwT2FpRv5YG5kXW/MoBbUNc3EMpIvTQ2xg76e6poGlTqD5rS9yg3
         y29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=niZ6XoKmw7NHnCb63ALIlkObmxNNLrfHYASn1LtcyWE=;
        b=fTi7+Ep/+sv9ZZbKU9W7WMFt/KJEzdqXDAa80BjRMX8T6x+BQ41R8YeVJovhlISUQE
         U7RpOPqJTtJat8yrnpzm6mTtCjX1iw8d9B/sFut0k+mjKQvEvgBOhIX9fEnPcp9SLSBx
         j7gp7H2E2AlSbu4k+hBwIJvhLvMRZvd5BqRBViit3nIjAm0cFsRP8t/wzVPj9b1wMPrA
         pTdIBxPUrlb4TkDWZcVHfYjHObBvtBrkKzNcnoTELR1fKotnGpbzWf9jK9zTfyqdm/3E
         nTFa3LRJd5bUKLMxAxnpY7RFGQQfwxSwBdVR3t86kBnwnAZk14xFCYFxCSRVGU4jc6Zx
         e9lw==
X-Gm-Message-State: AOAM532gRw5QyMrKrDg0R/AQTSCfb9JIU40RsH3YseU8VSPuIslCCt+e
        Il8IQ8NxTEuGyyYcXIVqeR4=
X-Google-Smtp-Source: ABdhPJyiQ9Gdg7vURWv59YgK8sXenIMkJh8ZdwRJ6xfYFSrTtT6NyUWmpyYdJZbazOkruDjdKtQozw==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr802686ejo.33.1598875342497;
        Mon, 31 Aug 2020 05:02:22 -0700 (PDT)
Received: from archer ([82.77.79.3])
        by smtp.gmail.com with ESMTPSA id k13sm7388880edh.37.2020.08.31.05.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 05:02:21 -0700 (PDT)
Date:   Mon, 31 Aug 2020 15:02:20 +0300
From:   Marius Iacob <themariusus@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?utf-8?B?Sm/Do28=?= Paulo Rechi Vita <jprvita@gmail.com>
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
Message-ID: <20200831120220.kxhtamyakvw54xrw@archer>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
 <20200824190043.tvy3ryzr27su4bg4@archer-mini>
 <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
 <20200830211750.bmi2fpylctehqsnm@archer>
 <a7a5b70e-47bb-e4bc-76ac-82e83fd4d746@redhat.com>
 <20200831082126.wsto3d2qqkylscm4@archer>
 <183aa099-47d7-4647-1651-9134d720f71c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <183aa099-47d7-4647-1651-9134d720f71c@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 20-08-31 12:18:27, Hans de Goede wrote:
> Hi,
> 
> On 8/31/20 10:21 AM, Marius Iacob wrote:
> > On 20-08-31 09:36:24, Hans de Goede wrote:
> > > Hi,
> > > 
> > > On 8/30/20 11:17 PM, Marius Iacob wrote:
> > > > On 20-08-24 22:23:41, Hans de Goede wrote:
> > > > > Hi,
> > > > > 
> > > > > On 8/24/20 9:00 PM, Marius Iacob wrote:
> > > > > > On 20-08-24 12:02:12, Hans de Goede wrote:
> > > > > > > Hi,
> > > > > > > 
> > > > > > > On 8/24/20 10:25 AM, Andy Shevchenko wrote:
> > > > > > > > On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
> > > > > > > > 
> > > > > > > > > I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
> > > > > > > > 
> > > > > > > > Can you be more specific, why that module is not loaded?
> > > > > > > 
> > > > > > > Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
> > > > > > > kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.
> > > > > > > 
> > > > > > 
> > > > > > I'm sorry, forgot to mention, because my device is a 2-in-1 it uses a detachable keyboard/touchpad and is connected by USB interface. So when trying to load i8042 module (also tried reset/nomux) it always says in dmesg "i8042: PNP: No PS/2 controller found." I'm guessing there is no PS/2 controller on this device...
> > > > > 
> > > > > Ah I see, and I guess that after the "i8042: PNP: No PS/2 controller found." message (which is fine) the module fails to load, right ?
> > > > 
> > > > Yes, modprobe: ERROR: could not insert 'i8042': No such device, and there's no trace of i8042 in lsmod output.
> > > > 
> > > > > That really is a bug in the i8042 code, if a module is providing symbols to another module it should never exit with an error from
> > > > > its module_init function.
> > > > 
> > > > i8042 is doing a full init in its module_init. I've bypassed the PNP controller check and it fail while trying to talk to the controller:
> > > > 	i8042: PNP detection disabled
> > > > 	i8042: Can't read CTR while initializing i8042
> > > > 	i8042: probe of i8042 failed with error -5
> > > > I'm guessing it's module_init should look like asus-wmi's: a message saying it's loaded and return 0; but I don't have enough kernel development experience to do this modification.
> > > 
> > > I haven't looked at the code (yet) but going by your description the trick would be to keep the PnP
> > > check in the module_init function and instead of -ENODEV just return 0 when the check fails so that
> > > the rest of the init function gets skipped.
> > > 
> > > You probably want to check module_exit in this case to see if that is safe to run with the
> > > rest of module_init skipped.
> > > 
> > > Let me know if you need more help with this, I believe that fixing this should be pretty easy.
> > 
> > Unfortunately the PNP check is 2 layers deeper from module_init and it's expected to return 0 for success for the rest of the init procedure to continue (so that it's not that straightforward). The module seems to be built with a full init procedure on load in mind. I've looked at the code for quite a bit and it seems that it's a bit of patch to write, and most of the places the i8042 code is used (in other modules) expects the module to be not just loaded but fully initialized. So this should be a consideration also.
> 
> Please give the attached patch a try, I believe that this should fix the i8042 issue.
> 
> Once you have let me know that this works I'll replace the:
> 
> Reported-by: Marius Iacob <themariusus@gmail.com>
> 
> By:
> 
> Reported-and-tested-by: Marius Iacob <themariusus@gmail.com>
> 
> And submit the patch upstream. Note the input subsys
> maintainers seems to be a bit slow to respond lately,
> so I'm not sure how fast we can get this reviewed / merged.
> 
> Anyways first lets test it and see if it helps :)

The patch works as intended. I also tried it on a system that has PS/2 controller and the module works as intended on that system too.

Regards,
Marius
