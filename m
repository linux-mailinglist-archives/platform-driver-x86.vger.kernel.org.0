Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6788C542911
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jun 2022 10:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbiFHIPV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jun 2022 04:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbiFHIN2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 04:13:28 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C2863104C0
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 00:42:44 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id o37-20020a05600c512500b0039c4ba4c64dso4908409wms.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 00:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pDUMQH/JwikS3dGEuoL+s1rn8CjjChIDmrF7b583qjU=;
        b=fKa3RQzgR1C9gPuzjlK18lPR2ODRZc9Pj5Y+S/gKLpIzbFKHaf1hSkOcGwqMnNsq9r
         XMuR0mXisUyo/8tXYSJHQu1AEBby8iCEMYFo9QfFIPo7CeBdgGwt4qVeeX7wVgxf6yLX
         bw288huVE7wnORJcuCI5o1dxTMI8dpA+TRhyYRY3VuiE+BlZ/D2EkZIJVJKnQEiTN0M4
         2Tc/6fwu7DLHDdQbhhhmCxEbH3XYI2IzWnO/zUDfPluY0N6BMqQOxDd5pl8kgFNumtlP
         e0rNv4a89XGj4Yn2zUj5RD1kWvz2pHoia7MKcqd+835Rt8u8iwj82sJeJYf00LEQTTM1
         RbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pDUMQH/JwikS3dGEuoL+s1rn8CjjChIDmrF7b583qjU=;
        b=8HVXOjXZn1sC//QARkgrH01rmDsbRuzw8pZpIgoyyzPXtVC5S4lNn1oFY47f9kZir9
         p9Gf1uLCmj9dtsoS2irK98Nyg91dTBA567CIn4qZQN6DECCgTrDDPa/HotMy3VeSazqB
         rVDybNP1UuZmEsTGRRSRf7igKIf+qkhpjvCrzcqTnQE30f72X3j1RH9w2svT8YXKS/e/
         GmM+eoU/CglzpjvWBHKhsL7HKwOBDirDBoXUcu9WhMY0UhmoKqvyHHo8zxDFwl0jfB0o
         n6S7BM+/AgJCBReJ6aHcKZ10lktBvrAAkffBx4gOOswb5Fr7tHdzBUPn+Usr0Qn5+5SS
         urww==
X-Gm-Message-State: AOAM5330She9dpFMHrGcHxzeFU1/GtOW1Bj9G+KTkf4rulVPI8KoWEIC
        iO5sK/NrX1/9w3vmbgvfNBGIeA==
X-Google-Smtp-Source: ABdhPJxfmsfGuJRdtDGKUMYuiYyopBGOApn2Jgo+2/o+D5JV/RRywsnhNTpqwclfgNE8JAcQiqHOkA==
X-Received: by 2002:a05:600c:5021:b0:39c:6571:e0b0 with SMTP id n33-20020a05600c502100b0039c6571e0b0mr190102wmr.177.1654674163150;
        Wed, 08 Jun 2022 00:42:43 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4c9400b0039749b01ea7sm26101954wmp.32.2022.06.08.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 00:42:42 -0700 (PDT)
Date:   Wed, 8 Jun 2022 08:42:40 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tony Luck <tony.luck@intel.com>, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: Re: [PATCH v6 00/12] platform/x86: introduce p2sb_bar() helper
Message-ID: <YqBS8I62YBPFC9iS@google.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 06 Jun 2022, Andy Shevchenko wrote:

> There are a few users that would like to utilize P2SB mechanism of hiding
> and unhiding a device from the PCI configuration space.
> 
> Here is the series to consolidate p2sb handling code for existing users
> and to provide a generic way for new comer(s).
> 
> It also includes a patch to enable GPIO controllers on Apollo Lake
> when it's used with ABL bootloader w/o ACPI support.
> 
> The patch that brings the helper ("platform/x86/intel: Add Primary to
> Sideband (P2SB) bridge support") has a commit message that sheds a light
> on what the P2SB is and why this is needed.
> 
> I have tested this on Apollo Lake platform (I'm able to see SPI NOR and
> since we have an ACPI device for GPIO I do not see any attempts to recreate
> one).
> 
> The series is ready to be merged via MFD tree, but see below.
> 
> The series also includes updates for Simatic IPC drivers that partially
> tagged by respective maintainers (the main question is if Pavel is okay
> with the last three patches, since I believe Hans is okay with removing
> some code under PDx86). Hence the first 8 patches can be merged right
> away and the rest when Pavel does his review.

Can we just wait for Pavel's review, then merge them all at once?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
