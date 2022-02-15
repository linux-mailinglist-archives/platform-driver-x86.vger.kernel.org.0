Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084B14B77A0
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Feb 2022 21:50:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242557AbiBORaH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Feb 2022 12:30:07 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242558AbiBORaG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Feb 2022 12:30:06 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E1DDB854
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 09:29:55 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d27so33340990wrc.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Feb 2022 09:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ICO1ml37Huyez+etV+dT6D2+k0fK+dVgQX5aKLEtpWE=;
        b=im6LJNHwlFAY9cu/QQdYtskumJ2IlnWWzqdt5Z9BVaTZVNb6jEK7vusRjOzoETzlLy
         D8CRih2welvIHDPxp+CBf1zRAWFB46gczAOOyzgQoBImzsy1sUBHpK17HTxUymgTgY+4
         k3OV3VwgNG34VgF+pPMAWCJ+0t3V1u9KfifiwaoSxom9ARUIvx/a2Mq54gahxgbpXCkM
         xHHr1UsBoR0xMqLrL39HDlu+dvBcZQuK+Q0jSfIhSP2cacCDhNapx7cvb+CrUi3VYD7F
         5w1bEqTDFVkfjQnDy6CGZEuG8TFGtZSsdrSsfrYE/OPXw2taYRSitUXrncwpTOU/rkyj
         yUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ICO1ml37Huyez+etV+dT6D2+k0fK+dVgQX5aKLEtpWE=;
        b=HuOmHsapOqmstGuoqYoBxcP5FFJcxEPNx4LOuSXZ34q6LWBxHzpIH4yE012Np4R3cK
         0ibmf2tkksAuXrF2mJvEK7iS5Db0dq21dpM5j9N14chdE1v+ZtIoPdcdg9TB600IZTiS
         9aUwE/qMvh8iJ1vpzaJb6w/Htbzd0n/ZYs/huY2pbThrQ16BLsU3/cqZpBz6lHYlLQjS
         sRyd+yG65O8Kn6By+z9sTJMk9aNlTX/hos530z11UpcqUdwjqdHYJM1Ba9/YumbfOUlX
         mbocuRgnxmGKBhqhIjsMfJL5AGECi6wxdAMdx9L8H7saQtXcCS1mgKkEz2WT8Cb7tO11
         yBrA==
X-Gm-Message-State: AOAM532qmzIGipS4Q8f46aZ3RijeiIoUElJ7GU3617ONTqrJZJ4f0WMR
        FwsVsuXFJCCh4OK554AI+lUmAw==
X-Google-Smtp-Source: ABdhPJwOSH7G6HmOK9tUgixHAXjPC1RBzQXDR1s7T2yUWuUsnh1GJ/d+msUEl3DzoTdLHmv2ZT68gw==
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr17283wrn.255.1644946193787;
        Tue, 15 Feb 2022 09:29:53 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id f8sm13204075wmq.19.2022.02.15.09.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 09:29:53 -0800 (PST)
Date:   Tue, 15 Feb 2022 17:29:51 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: Re: [PATCH v4 5/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI
 system
Message-ID: <YgvjDy1R06IC8FE5@google.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
 <20220131151346.45792-6-andriy.shevchenko@linux.intel.com>
 <YgvaqBB8fNVWp1lN@google.com>
 <YgveyspHVXCp2ul+@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YgveyspHVXCp2ul+@smile.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 15 Feb 2022, Andy Shevchenko wrote:

> On Tue, Feb 15, 2022 at 04:54:00PM +0000, Lee Jones wrote:
> > On Mon, 31 Jan 2022, Andy Shevchenko wrote:
> 
> Thank you for the review, my answers below.
> 
> ...
> 
> > > +static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
> > > +	[APL_GPIO_NORTH] = {
> > > +		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, 0x1000),
> > 
> > Are these 0x1000's being over-written in lpc_ich_init_pinctrl()?
> > 
> > If so, why pre-initialise?
> 
> You mean to pre-initialize the offsets, but leave the length to be added
> in the function? It can be done, but it feels inconsistent, since we would
> have offsets and lengths in different places for the same thingy. That said,
> I prefer current way for the sake of consistency.

Don't you over-write this entry entirely?

  for (i = 0; i < ARRAY_SIZE(apl_gpio_devices); i++) {
        struct resource *mem = &apl_gpio_resources[i][0];

        /* Fill MEM resource */
        mem->start += base.start;
        mem->end += base.start;
        mem->flags = base.flags;
  }

Oh wait, you're just adding the base value to the offsets.

In which case that comment is also confusing!

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
