Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77467586BDA
	for <lists+platform-driver-x86@lfdr.de>; Mon,  1 Aug 2022 15:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230433AbiHANWl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 1 Aug 2022 09:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230315AbiHANWl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 09:22:41 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25A7432049
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 06:22:40 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id h205-20020a1c21d6000000b003a34ac64bdfso4322313wmh.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc;
        bh=bYiybKe240H/UzM6bAAOcpT8lfmz1vttebIHklWhVHk=;
        b=Q4JAv4HONdpQLBE/p/Ek3s0qcIa99xPlmMQ0qaA86GYZBjiBksNVlJDFCtCNsDplKf
         icszQncbkedSDsvTbTz10AINYhpW7Uysvn7z08WhYvZJyzx0Ekwv/Rhc3CV1yBIMLSpF
         8/YLuAkU0FH6Kuqypq+Ul2fo0XMW7w7lSosBfjy8ozr73Tdqq7lv5auiVzuHSe+tuIUL
         j/v/bTB+K7bKaLfYnKHXKXIp49M+lskgRiKmWD1WM5bzINZROEMqnf6X4ZuCwFBMBVgU
         UKkzxEjJ91p72zTPfpyd0F1MiPMiNhPMcmfYBu41vDYCzoB41prTnSIQQwtG5ItbMtok
         g2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc;
        bh=bYiybKe240H/UzM6bAAOcpT8lfmz1vttebIHklWhVHk=;
        b=1wOjjGPvDyBWoemCsE6tsSdUYLBn0BcXRXsryRjSqd8/BH7GF0gk+zr3nPCibJpk28
         Th0wL0rjuTKmNwZwiG7GrsNWATyHHiTe04ljVuboZJurE/4jPK/Jc88eEFbscbuE78Yi
         oELlnbSSeH7S0quwEq8Md2xhgNGg8PXMWogg3gIZ+GsgWv7MMWS1DmkqKOQFR2e7xi1P
         8JMO+1tr/1h9DE55h0hQhgmYuXc7oWhrnb6852/cTV0bXPtAbEqwEVwhkbOagKfiR/iL
         7iYKeJdDT0dWeHSI9NJ++ujNGbcuM/fO/xLm5RuSIo60V1QTa1vsL0Hk6jCDiEdO5x8K
         a/JQ==
X-Gm-Message-State: AJIora8RoQEJHPh070JHLuz+gt2ko2KVcF8XlYtjrDjqU1R7Xagco+rW
        xN5l3lTd1+/sSsWNreS4JOdLdA==
X-Google-Smtp-Source: AGRyM1sT8kgP7yoLPnEkIsmp/wb38CVp0J6ciW5gur1tk5aeufcJISOIsWxNDTEwThdHnIyZadSdCA==
X-Received: by 2002:a05:600c:35ce:b0:3a3:1b7f:bbd8 with SMTP id r14-20020a05600c35ce00b003a31b7fbbd8mr10672603wmq.22.1659360158676;
        Mon, 01 Aug 2022 06:22:38 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f1-20020a5d4dc1000000b0021f1ec8776fsm7942298wru.61.2022.08.01.06.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 06:22:38 -0700 (PDT)
Date:   Mon, 1 Aug 2022 14:22:35 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 1/1] platform/x86: p2sb: Move out of
 X86_PLATFORM_DEVICES dependency
Message-ID: <YufTmwg/A94XjrQ8@google.com>
References: <20220718145328.14374-1-andriy.shevchenko@linux.intel.com>
 <2b1b4cd1-faec-85a1-5ad2-e2b29290e0c1@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2b1b4cd1-faec-85a1-5ad2-e2b29290e0c1@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 28 Jul 2022, Hans de Goede wrote:

> Hi,
> 
> On 7/18/22 16:53, Andy Shevchenko wrote:
> > The P2SB library is used for various drivers, including server
> > platforms. That's why the dependency on X86_PLATFORM_DEVICES
> > seems superfluous.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > v2: added X86 to the dependencies of P2SB (Hans), added Rb tag (Hans)
> 
> Lee I presume that since you've merged the original series
> (in your ib-mfd-edac-i2c-leds-pinctrl-platform-watchdog-5.20
> branch) that you will take this fix on top ?

The point of supplying an immutable branch is that whoever maintains
this subsystem can pull from it and apply this patch on-top.

> This fix is necessary to fix a bunch of randconfig build
> failures in the current linux-next.
> 
> >  drivers/platform/x86/Kconfig            | 12 ++++++++++++
> >  drivers/platform/x86/Makefile           |  4 ++++
> >  drivers/platform/x86/intel/Kconfig      | 12 ------------
> >  drivers/platform/x86/intel/Makefile     |  2 --
> >  drivers/platform/x86/{intel => }/p2sb.c |  0
> >  5 files changed, 16 insertions(+), 14 deletions(-)
> >  rename drivers/platform/x86/{intel => }/p2sb.c (100%)

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
