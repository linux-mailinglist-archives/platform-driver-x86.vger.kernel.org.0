Return-Path: <platform-driver-x86+bounces-5163-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F16C967065
	for <lists+platform-driver-x86@lfdr.de>; Sat, 31 Aug 2024 10:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A67E81C21BD2
	for <lists+platform-driver-x86@lfdr.de>; Sat, 31 Aug 2024 08:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C82C816A92E;
	Sat, 31 Aug 2024 08:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zy0s3o9B"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26B13C90A
	for <platform-driver-x86@vger.kernel.org>; Sat, 31 Aug 2024 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725094439; cv=none; b=Qhg5T+9KI5ar4rhbHd6X6d1EiH13sUXnkfWSoobSeV0ySFhhuC9JUJ1uoJiqFN4YdHBmiL44KTuLZYOMKQxpamiF4t78XHEDP8ucNNyovyB8aMhDMd7ikJgG2sAezmkFBb/p4Xa58TvkXXv05flHnSkjbg/YiT6V3MsAvzK8la0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725094439; c=relaxed/simple;
	bh=xMNyCaQPuoW2JyU6Z6CoGsmhDfRjNG/09vrnqWyjFZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjrV4UcrdewY80Wgm7fjcsgoZ7EyZjkh/fgkhUc2y2eyKBDZeGuux7Adr2Gj+Hdsi9Jo9TlDZ0J1JOwt8Oah80iPoGeHi5HAdi0bZX2JYTTo8WXSZ4OnqCdkmuQMB7VRTklguKbhKu0/n7sfI1D7NFLZN4jEX6uJhcPNmk5ZLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zy0s3o9B; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374b5f27cf2so761557f8f.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 31 Aug 2024 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725094436; x=1725699236; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XrJxKojvYgIdgcmALEJbPkGfILHuZwWSCFpBkiFspZk=;
        b=zy0s3o9BgiIvhDdqxQTsvEDbf4dqEFzw0IsbxgFcZOXqZmLCcl1wMOpHRwLUMEm95K
         dOnY180nscD1XhmUOfa94AlLTZCHh4qSVlu44+O7aPVZSTAo8q+fiZzNXGZKNRPsZqNN
         4pQs+JcROu+vhwsgNj4JUHZ2SVodbpKWeGs3BSQ/rTDuboGUFVXz5YXnfkNTyfTaiW3q
         PMUUWnQdSvTyNSp4xpg1KurbtrlFf4T5RWh/Y6uGP4LzSTH/b1Hxq2s2bOZQspUHm2v7
         +C7sLqVPtKRUFptK8LgaLaKj+7EuqHv5xcpdpce9eKl1VLhErAxAA2aw2fCTE5B+0sST
         Ha+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725094436; x=1725699236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrJxKojvYgIdgcmALEJbPkGfILHuZwWSCFpBkiFspZk=;
        b=ug0f+ZygY+0MhWtYhg0YhwDu+SQqnkQnL18p3Hv5rKbFO34PqeDMv6SEQJ674sW+ce
         V0SqErd49/TSYwuZDICeDzNWWmLrgg2eR9Wv11YPYgKdL6++kSOsPz15LF3vdFtEPXwP
         sbXT/1cSdq/iGkviC7U9WUgVP6YHkTRboAr5YGgozza1nIFh27zCo/YvaLRLnePvguzb
         x/LuLRKdlnTyk9rcPscCojN9Ja2VcoWNjjhZ12tL9yp68b/IcDVXbDdVdG54I/zYt5DG
         aqtIJ0cFvoI06FLNq8tEayzK6FGsiDoY5XTBVr4HI1hNgNIar7We67pVMKGvZNfKrlcx
         Mrpw==
X-Forwarded-Encrypted: i=1; AJvYcCU4IxRe7DT38MIyW+y+MbhtGAKwAoB+KEWar7YbpaWNgtwzSXcAQjpfeLJ5Mo6ZT7CwillFPbCEYMzqwktYITt5vhtC@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk9oW9aM2Pxyvcdzqu4RfmJmrvpRdnym+tBwxwzfM0QdpjtIBF
	WYBUFX2YV5PkkfM+gEXv2y/VFE1IzYTjllzOPciSbURA3ICc1BMHHrddG9CDvvg=
X-Google-Smtp-Source: AGHT+IEgmyQVbYRyOI28gXGsGAapaHQo3aYCGCx2utsa65dhLn0iTApD5farIM/77mWb+gLOS07M0Q==
X-Received: by 2002:adf:a185:0:b0:36d:341d:276 with SMTP id ffacd0b85a97d-3749b54962amr5818852f8f.20.1725094436082;
        Sat, 31 Aug 2024 01:53:56 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee9ba8esm6003464f8f.50.2024.08.31.01.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 01:53:55 -0700 (PDT)
Date: Sat, 31 Aug 2024 11:53:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Scally <djrscally@gmail.com>
Subject: Re: [PATCH v2 1/4] driver core: Ignore 0 in dev_err_probe()
Message-ID: <96a19237-9380-4173-9e52-e8295a0f4883@stanley.mountain>
References: <20240822130722.1261891-1-andriy.shevchenko@linux.intel.com>
 <20240822130722.1261891-2-andriy.shevchenko@linux.intel.com>
 <ce59c3c6-8729-469f-a0df-b6844792e324@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ce59c3c6-8729-469f-a0df-b6844792e324@stanley.mountain>

On Sat, Aug 31, 2024 at 11:25:54AM +0300, Dan Carpenter wrote:
> On Thu, Aug 22, 2024 at 04:05:38PM +0300, Andy Shevchenko wrote:
> > In the similar way, ignore 0 error code (AKA "success") in
> > dev_err_probe(). This helps to simplify a code such as
> > 
> >   if (ret < 0)
> >     return dev_err_probe(int3472->dev, ret, err_msg);
> > 
> >   return ret;
> > 
> > to
> > 
> >   return dev_err_probe(int3472->dev, ret, err_msg);
> > 
> > Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This is a terrible idea because currently Smatch is able to detect about one
> bug per month where someone unintentionally passes the wrong error variable
> to dev_err_probe().

Here are the stats since Jan 2023.  All these bugs are impossible to detect now.

2024-08-12 d3bde2243d42 iio: proximity: hx9023s: Fix error code in hx9023s_property_get()
2024-07-08 101e5c5c4e76 PCI: qcom: Fix missing error code in qcom_pcie_probe()
2024-02-22 debabbb1f272 iio: adc: ti-ads1298: Fix error code in probe()
2024-01-08 9c46e3a5232d iio: adc: ad7091r8: Fix error code in ad7091r8_gpio_setup()
2023-12-04 35ddd61cf023 platform/x86: x86-android-tablets: Fix an IS_ERR() vs NULL check in probe
2023-11-20 2d37b3649c41 hwrng: starfive - Fix dev_err_probe return error
2023-11-30 03219a3aa6c8 drm/imagination: Fix error codes in pvr_device_clk_init()
2023-09-07 4b2b39f9395b watchdog: marvell_gti_wdt: Fix error code in probe()
2023-08-24 8886e1b03669 ASoC: codecs: Fix error code in aw88261_i2c_probe()
2023-06-23 ad5152b85e8b leds: aw200xx: Fix error code in probe()
2023-07-18 86fe3e9f4c63 phy: starfive: fix error code in probe
2023-07-12 0b64150c3429 Input: bcm-keypad - correct dev_err_probe() error
2023-06-26 5fb2864cbd50 OPP: Properly propagate error along when failing to get icc_path
2023-06-19 02474880e8fd ASoC: max98388: fix error code in probe()
2023-05-25 cc5f2eb7ce11 mfd: tps6594: Fix an error code in probe()
2023-05-22 1ca04f21b204 remoteproc: stm32: Fix error code in stm32_rproc_parse_dt()
2023-05-15 46f5dd7439e3 fbdev: omapfb: panel-tpo-td043mtea1: fix error code in probe()
2023-05-13 3530167c6fe8 soc: qcom: icc-bwmon: fix incorrect error code passed to dev_err_probe()
2023-05-12 bc97139ff135 power: supply: rt9467: Fix passing zero to 'dev_err_probe'
2023-03-23 c4351b646123 iio: adc: ti-ads1100: fix error code in probe()
2023-02-27 65609d3206f7 i2c: gxp: fix an error code in probe
2023-02-15 76f5aaabce49 ASoC: soc-ac97: Return correct error codes

regards,
dan carpenter

