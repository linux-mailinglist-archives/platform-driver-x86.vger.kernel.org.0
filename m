Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63FCA16BD2F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Feb 2020 10:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728981AbgBYJY2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 25 Feb 2020 04:24:28 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46593 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726764AbgBYJY2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Feb 2020 04:24:28 -0500
Received: by mail-wr1-f65.google.com with SMTP id j7so1273155wrp.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Feb 2020 01:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=B2Wn7bp8mwDsyKil1xJSYrr5dzE0ECUygFczfDQtiCc=;
        b=UX/uBkctcPJP7Z9Ef3O9L7Rh8MRawKboHaoXxjT/K66NeGwG0xk3hLaVqNsZib8s2m
         X5X251q1fKiBr05kj8dAU1xM1nk70DwP0UEVz4cQptIEKTTjTFGM+I6Fp/l2yLHju8Uc
         b1Y56hmnySg6k0r0yqRIUS+Vbz9zP9Oq2Bka56+o+ZdH05r9+ENl+1C7RwhWreRM/YKX
         uvALM6Hqi5NPnpd/9wXgl/21UdavNoJjnyfOr7r2wP/SDXRCkM0N7gJdzA2l4onPDIu8
         FX0Slj6HNRxpG8w1fgeCB/RKyvDj0Hn7z3iNkh7Ky6ft4T9vxNXOvf4PcZElGbN7saqa
         r7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=B2Wn7bp8mwDsyKil1xJSYrr5dzE0ECUygFczfDQtiCc=;
        b=ayDPki1OBCXyD1zGEOZgYW4Sn+4SwL0wYotz8pZlbbNnpY54VJr6G8mU+TZE9AOAET
         reyq4yE4IVfPuEig1sKHa8YscbGrv7dJn3PYeVIRYQgUX8SevjhJglsBWcGgA8tYgqf5
         KyRlqMVbGW93mKio71YTN+vekI5bn1Gyi6af9epBbWTRBp5wI3CvruaJFQuiHqw+BE+/
         O9S88s2mdS4hZJ9ubgP3pwOKSCFVy6FG/K2cKG/M7BGhsMwCa/gxcBRpV8uBcTY0Ijgr
         +A3v588tvYq6pc8C4e098vBAHkk0u1QYRSYM+AaWvKwi5Bz5aCDqIhv7myGceefbc3sp
         GmCQ==
X-Gm-Message-State: APjAAAVEC6uTuKwu61aU/RO98fLGxCWIkc/rbRwUwDwZZpPDBXt2oHBf
        Ltvf1DhjoMYC3y0nLrwj7PuGrQ==
X-Google-Smtp-Source: APXvYqyFOfTgV+V6vmdVHCuWMMJUDmnzwi6Ot5XHkHO9FlpDBsFTOAzK2PxOP/WSt92wo2kSTR0qPA==
X-Received: by 2002:adf:aadb:: with SMTP id i27mr75876977wrc.105.1582622666951;
        Tue, 25 Feb 2020 01:24:26 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id a22sm3344132wmd.20.2020.02.25.01.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 01:24:25 -0800 (PST)
Date:   Tue, 25 Feb 2020 09:24:57 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/19] mfd: intel_soc_pmic_bxtwc: Convert to use new
 SCU IPC API
Message-ID: <20200225092457.GY3494@dell>
References: <20200217131446.32818-1-mika.westerberg@linux.intel.com>
 <20200217131446.32818-12-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200217131446.32818-12-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 17 Feb 2020, Mika Westerberg wrote:

> Convert the Intel Broxton Whiskey Cover PMIC driver to use the new SCU
> IPC API. This allows us to get rid of the PMC IPC implementation which
> is now covered in SCU IPC driver. We drop the error log if the IPC
> command fails because intel_scu_ipc_dev_command() does that already.
> 
> Also move PMIC specific IPC message constants to the PMIC driver from
> the intel_pmc_ipc.h header.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h |  3 ---
>  drivers/mfd/intel_soc_pmic_bxtwc.c   | 34 ++++++++++++++--------------
>  2 files changed, 17 insertions(+), 20 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
