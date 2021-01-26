Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0F7630400F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Jan 2021 15:21:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405892AbhAZOUa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 26 Jan 2021 09:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47259 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2405891AbhAZOUY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jan 2021 09:20:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611670735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9I8p+Ci0/xpqxGaFumiac79ntNWaBlV4+vZdBjkXnXQ=;
        b=RCtJ0UotIlVHlD8ZR2X4EPqDsGZypCotsSD1sRBbYYHrgnv6Zg0CXffTxkNkbAmO1WeYsr
        9VqSBWiycRM01ZQb42Vx9XVKva11LjvFMc6H3pq8C9F1AvcILJAbjEZLk4EYumJI12fEtb
        oAXMoSH9GH9fXOGelETD62io2Nk4/gI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-KIAZT1IMNo-MeWN80XACfQ-1; Tue, 26 Jan 2021 09:18:53 -0500
X-MC-Unique: KIAZT1IMNo-MeWN80XACfQ-1
Received: by mail-ed1-f71.google.com with SMTP id k5so9424564edk.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 26 Jan 2021 06:18:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9I8p+Ci0/xpqxGaFumiac79ntNWaBlV4+vZdBjkXnXQ=;
        b=sqZ4+IBrnFDwf9FNFgfv45IBM8Cw4FvqqhlELXQTnLBXZ6q0KMqouUh9KkrbSyQVNJ
         2YmNrlEmwCDDf+B9H7rsw27VhSgcLu4y7QOhM894vQMrqRMNTQKwf4bFDAapaiAohP8k
         fASqkMdalkQhuTVJw2eG9Jj4nylMo4x3MgOO/+JhoFClbExfcl0stfHvX8VSLQ2OvQCr
         sIYlo8HO7VLe7KMBHTTIobcjZYJiwZ0EdHPPtq3jNRAuMOr+nWBKjFfJWX+WG5elCemc
         I5NzYoEuWKZMZccFGBx1Q91H5bjZsxTFfmW6CqXiiEZrK/wEhmpb+yR2CkA0V0A7XLij
         6BJw==
X-Gm-Message-State: AOAM533hDXfrdFtZjNn78XKa9/3GYPyHmuNKFWxOdQcNWpTMiY8MlStq
        CZpiAYqoq6FcNIadnL53Of9fmdY4QLk0mw1AGsii329UZ+OCXjBbCA/sfsc6jFLfp/9kNm80ACO
        dojLQDeKCadZQgb1SLaC4olCBMGlIJciFPA==
X-Received: by 2002:a17:906:4d19:: with SMTP id r25mr3514239eju.148.1611670731827;
        Tue, 26 Jan 2021 06:18:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJ1/FPWeGRhQ0LfRAvJV/O2bGB7Bz5NpRDtudi4ZvB3O+minuiRcWfczlLGMywI1Qt3TZZFA==
X-Received: by 2002:a17:906:4d19:: with SMTP id r25mr3514229eju.148.1611670731661;
        Tue, 26 Jan 2021 06:18:51 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id d5sm4959051edu.12.2021.01.26.06.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 06:18:51 -0800 (PST)
Subject: Re: [GIT PULL] ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>
Cc:     Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
References: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <886bbdc0-3391-2140-a2d4-1688b262966f@redhat.com>
Date:   Tue, 26 Jan 2021 15:18:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YBANNJ8XtoRf7SuW@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/26/21 1:38 PM, Andy Shevchenko wrote:
> Hi guys,
> 
> This is first part of Intel MID outdated platforms removal. It's collected into
> immutable branch with a given tag, please pull to yours subsystems.
> 
> (All changes are tagged by the respective maintainers)
> 
> Thanks,
> 
> With Best Regards,
> Andy Shevchenko
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.infradead.org/linux-platform-drivers-x86.git tags/ib-drm-gpio-pdx86-rtc-wdt-v5.12-1
> 
> for you to fetch changes up to a507e5d90f3d6846a02d9c2c79e6f6395982db92:
> 
>   platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison (2021-01-25 20:05:32 +0200)
> 
> ----------------------------------------------------------------
> ib-drm-gpio-pdx86-rtc-wdt for v5.12-1
> 
> First part of Intel MID outdated platforms removal.
> 
> The following is an automated git shortlog grouped by driver:
> 
> drm/gma500:
>  -  Get rid of duplicate NULL checks
>  -  Convert to use new SCU IPC API
> 
> gpio:
>  -  msic: Remove driver for deprecated platform
>  -  intel-mid: Remove driver for deprecated platform
> 
> intel_mid_powerbtn:
>  -  Remove driver for deprecated platform
> 
> intel_mid_thermal:
>  -  Remove driver for deprecated platform
> 
> intel_scu_wdt:
>  -  Get rid of custom x86 model comparison
>  -  Drop SCU notification
>  -  Move driver from arch/x86
> 
> rtc:
>  -  mrst: Remove driver for deprecated platform
> 
> watchdog:
>  -  intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
>  -  intel_scu_watchdog: Remove driver for deprecated platform
> 
> ----------------------------------------------------------------
> Andy Shevchenko (12):
>       drm/gma500: Convert to use new SCU IPC API
>       drm/gma500: Get rid of duplicate NULL checks
>       gpio: intel-mid: Remove driver for deprecated platform
>       gpio: msic: Remove driver for deprecated platform

>       platform/x86: intel_mid_thermal: Remove driver for deprecated platform
>       platform/x86: intel_mid_powerbtn: Remove driver for deprecated platform

Erm, I already have this 2 in platform-drivers-x86/for-next since you said that
these 2 could be merged independently.

Anyways I just did a test-merge and there is no conflict, so everything is ok.

From my pov this looks good and I plan to merge this into platform-drivers-x86/for-next
before the merge-window.

I'm going to hold off on doing that for a bit for now in case one of the other
subsys maintainers has any objections.

Regards,

Hans





>       rtc: mrst: Remove driver for deprecated platform
>       watchdog: intel_scu_watchdog: Remove driver for deprecated platform
>       watchdog: intel-mid_wdt: Postpone IRQ handler registration till SCU is ready
>       platform/x86: intel_scu_wdt: Move driver from arch/x86
>       platform/x86: intel_scu_wdt: Drop SCU notification
>       platform/x86: intel_scu_wdt: Get rid of custom x86 model comparison
> 
>  MAINTAINERS                                        |   2 -
>  arch/x86/platform/intel-mid/device_libs/Makefile   |   1 -
>  drivers/gpio/Kconfig                               |  14 -
>  drivers/gpio/Makefile                              |   1 -
>  drivers/gpio/TODO                                  |   2 +-
>  drivers/gpio/gpio-intel-mid.c                      | 414 ---------------
>  drivers/gpio/gpio-msic.c                           | 314 ------------
>  drivers/gpu/drm/gma500/Kconfig                     |   1 +
>  drivers/gpu/drm/gma500/mdfld_device.c              |   2 -
>  drivers/gpu/drm/gma500/mdfld_dsi_output.c          |   2 -
>  drivers/gpu/drm/gma500/mdfld_output.c              |   8 +-
>  drivers/gpu/drm/gma500/oaktrail_device.c           |   3 -
>  drivers/gpu/drm/gma500/psb_drv.h                   |   3 +
>  drivers/gpu/drm/gma500/tc35876x-dsi-lvds.c         |  30 +-
>  drivers/platform/x86/Kconfig                       |  23 +-
>  drivers/platform/x86/Makefile                      |   3 +-
>  drivers/platform/x86/intel_mid_powerbtn.c          | 233 ---------
>  drivers/platform/x86/intel_mid_thermal.c           | 560 ---------------------
>  .../platform/x86/intel_scu_wdt.c                   |  41 +-
>  drivers/rtc/Kconfig                                |  12 -
>  drivers/rtc/Makefile                               |   1 -
>  drivers/rtc/rtc-mrst.c                             | 521 -------------------
>  drivers/watchdog/Kconfig                           |   9 -
>  drivers/watchdog/Makefile                          |   1 -
>  drivers/watchdog/intel-mid_wdt.c                   |   8 +-
>  drivers/watchdog/intel_scu_watchdog.c              | 533 --------------------
>  drivers/watchdog/intel_scu_watchdog.h              |  50 --
>  27 files changed, 54 insertions(+), 2738 deletions(-)
>  delete mode 100644 drivers/gpio/gpio-intel-mid.c
>  delete mode 100644 drivers/gpio/gpio-msic.c
>  delete mode 100644 drivers/platform/x86/intel_mid_powerbtn.c
>  delete mode 100644 drivers/platform/x86/intel_mid_thermal.c
>  rename arch/x86/platform/intel-mid/device_libs/platform_mrfld_wdt.c => drivers/platform/x86/intel_scu_wdt.c (69%)
>  delete mode 100644 drivers/rtc/rtc-mrst.c
>  delete mode 100644 drivers/watchdog/intel_scu_watchdog.c
>  delete mode 100644 drivers/watchdog/intel_scu_watchdog.h
> 

