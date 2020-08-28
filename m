Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46A2255902
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Aug 2020 13:00:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbgH1K7s (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Aug 2020 06:59:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729052AbgH1K5A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Aug 2020 06:57:00 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8114C06121B
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 03:56:58 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id y3so889406wrl.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6dAy6oQX3mxrE+oxJsDs9WAbPrSNKxjGvuLNGWIC4oM=;
        b=kM4ssiCWMiZAAZ2OWMpy/DriODdVtl3gCmEfDR/c50iR/N3ODFW0YACnDWzoTSYz+a
         qFaIZe8BCjsreh8eip7ZRi6Eu39LwT/WEGLyVO+MrgO8GEbDddMQ9mfr5WAD6AxfH98v
         weZqD9j6lXoxksJvmm3YdHu8BsZ3tsu8oxCEvMbV1AHWadxh97loR8QbvMdZDJyfqpmv
         uLJY42pCGRq9Ra5MTPtqpA1SXRCysf9Yo778mEl+vohDD5yX3qMYPp5mvFflXvEux12n
         743jcdL6DcisuXKqTQ5RrGeZSGCd9Efphkt2/DkqoFt16DhKFRU/kwVo57qbUywTcuup
         1/NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6dAy6oQX3mxrE+oxJsDs9WAbPrSNKxjGvuLNGWIC4oM=;
        b=ugW/tg6lcn/MUxtbU4DDgvKvFbKHFZ/GsGKD6ck03KV5mIDpYml/G4ZO3g08r/vc7R
         6qKbt/3eD4Vbl8hsGoYvOXh+DEGrFrcn8QaebHfqWZzDQjrmMV8rwhdXianpewPzbl5p
         wd571sVSN7dDRz7n0Uyisr10lUVpe28HmcePxZWBiJfkhpr1W5jCpg6YdwLweFUBp1eA
         FnTS+3Sdynm6GBlkxdnhy91133yYx+xplnKsJ5mqsTnKXAWJkn6Q4udwl98/CkT0EUzg
         f1QvRZfPMy4lf6tZ544HqfAunbjK36QruAU6xqJVOBdNkAejVqZIWxjZaH3Y10y1rsIR
         4u5A==
X-Gm-Message-State: AOAM531hrcO3VsExYFsImfNnXtfJqQrvflCrqIjVqo4gTik1PBSSJegH
        mcp/COQQBMYwFDKTDiQBEZxfbA==
X-Google-Smtp-Source: ABdhPJw/pGifNiKSDL+fZAMKRrWedIGRP9Xar1f6rZ+tD/5UoRm11w6CkIx3lDRpcW4omPV/wyXKng==
X-Received: by 2002:adf:f808:: with SMTP id s8mr995576wrp.218.1598612217550;
        Fri, 28 Aug 2020 03:56:57 -0700 (PDT)
Received: from dell ([91.110.221.141])
        by smtp.gmail.com with ESMTPSA id q11sm1313636wrw.61.2020.08.28.03.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2020 03:56:56 -0700 (PDT)
Date:   Fri, 28 Aug 2020 11:56:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com,
        alexander.h.duyck@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [RESEND PATCH V5 0/3] Intel Platform Monitoring Technology
Message-ID: <20200828105655.GU1826686@dell>
References: <20200819180255.11770-1-david.e.box@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200819180255.11770-1-david.e.box@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 19 Aug 2020, David E. Box wrote:

[...]

> David E. Box (3):
>   PCI: Add defines for Designated Vendor-Specific Extended Capability
>   mfd: Intel Platform Monitoring Technology support
>   platform/x86: Intel PMT Telemetry capability driver
> 
>  .../ABI/testing/sysfs-class-pmt_telemetry     |  46 ++
>  MAINTAINERS                                   |   6 +
>  drivers/mfd/Kconfig                           |  10 +
>  drivers/mfd/Makefile                          |   1 +
>  drivers/mfd/intel_pmt.c                       | 220 +++++++++
>  drivers/platform/x86/Kconfig                  |  10 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/intel_pmt_telemetry.c    | 448 ++++++++++++++++++
>  include/uapi/linux/pci_regs.h                 |   5 +
>  9 files changed, 747 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_telemetry
>  create mode 100644 drivers/mfd/intel_pmt.c
>  create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c

What's the plan for this set?

I'm happy to pick it up and take it through MFD if required.

If that's the route of choice, I'll pick it up in just over a week.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
