Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555DE41AC96
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Sep 2021 12:03:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239815AbhI1KE4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Sep 2021 06:04:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240124AbhI1KE4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 06:04:56 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6546C061604
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:03:16 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id b192so2979561wmb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 03:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yz7OSxKrs5tDs3iPjdQ84SnbqujRTE3B+86PcByyECI=;
        b=ccy5lOzpyBKsENGgU3HIS0chBhX6A/t8rSbAwK/u0Rx6pM6GJWJb+0Oubyy7wlqtpT
         kR7Z4v5O/T/JAUPSWWCQmkMP0SKtpsgzbjmaA6fdvlzAQjzV4FWxgSyENfxXl4IcJD4p
         509+WTfEDbHXYTADcotWB6cacZbX4m/gaLI5q83CDkKWNZcCa1VSpJZYKTYCXbiAnPzh
         q378NkglDcDVIzPny7hgwXkw+pjtvygClmArk3YCWvKY0h9nvuQGElefYNrf93rL510u
         Hc52apND0kR6oeHAy3EWI3QPQCLKEu9ThHJfOaDIQ/Y1YoQO8a5Z7QIlZbi5qX9sEPMi
         v4AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yz7OSxKrs5tDs3iPjdQ84SnbqujRTE3B+86PcByyECI=;
        b=UTKSY3giwXzrOWsTs0w05zZ3cc4VRoZTWsr87KLRmvwIAeJ7HNSYSbZMqDLoltbqjL
         VPxg/9FlwRRn2g/8PHa8mF5cRLWq/yuNpmr5dHatkvuhK+PniTA+HVDq+OeHHxSiXGS3
         eCYHPUkES6DlZOWzYl2uZxjZg+MEv1J/BqLFGqeqldq04Gietoxt8Tx30SHeEY1vG7Fy
         PXKYngb4rKfVYdptTb6SA2sLXp0UyogZJsIrQgSH/YMPhPzQNji2hp+B0q57Z4xF1fLj
         hwiF2iKZhPJTbM9WhlO9s7TwtHdtgQv8SKkH0xO9RCtA5K/bLMg05W9juigdF9Q6Fxxa
         M9iQ==
X-Gm-Message-State: AOAM532/+ATRVxYKgJSyF6pYJFfFMBd5WDKa6xRZqpz3vrlI/HsBpMS4
        b14Fs3vGU90RsWres4UVxl3e0g==
X-Google-Smtp-Source: ABdhPJwdbB0131GO5e9RXgw7jZajpVoD+s7BqbYj4LRTMgnSJC90hHj+bS2xwaNZ7M3DVBRF0okusQ==
X-Received: by 2002:a1c:22d5:: with SMTP id i204mr3680039wmi.145.1632823395493;
        Tue, 28 Sep 2021 03:03:15 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id 8sm2139893wmj.18.2021.09.28.03.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:03:15 -0700 (PDT)
Date:   Tue, 28 Sep 2021 11:03:13 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "David E. Box" <david.e.box@linux.intel.com>, bhelgaas@google.com,
        andy.shevchenko@gmail.com, mgross@linux.intel.com,
        srinivas.pandruvada@intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 2/5] MFD: intel_pmt: Support non-PMT capabilities
Message-ID: <YVLoYZQ1fYLeEYXt@google.com>
References: <20210922213007.2738388-1-david.e.box@linux.intel.com>
 <20210922213007.2738388-3-david.e.box@linux.intel.com>
 <YVIBI6TQrD/rehli@kroah.com>
 <d540894d3d8c05722bd924c21bd9dd9c2b9def53.camel@linux.intel.com>
 <YVLKRSQx01vB4N77@google.com>
 <YVLb/GrePEKNDdtb@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YVLb/GrePEKNDdtb@kroah.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 28 Sep 2021, Greg KH wrote:

> On Tue, Sep 28, 2021 at 08:54:45AM +0100, Lee Jones wrote:
> > On Mon, 27 Sep 2021, David E. Box wrote:
> > 
> > > On Mon, 2021-09-27 at 19:36 +0200, Greg KH wrote:
> > > > On Wed, Sep 22, 2021 at 02:30:04PM -0700, David E. Box wrote:
> > > > > Intel Platform Monitoring Technology (PMT) support is indicated by presence
> > > > > of an Intel defined PCIe DVSEC structure with a PMT ID. However DVSEC
> > > > > structures may also be used by Intel to indicate support for other
> > > > > capabilities unrelated to PMT.  OOBMSM is a device that can have both PMT
> > > > > and non-PMT capabilities. In order to support these capabilities it is
> > > > > necessary to modify the intel_pmt driver to handle the creation of platform
> > > > > devices more generically.
> > > > 
> > > > I said this on your other driver submission, but why are you turning a
> > > > PCIe device into a set of platform devices and craming it into the MFD
> > > > subsystem?
> > > > 
> > > > PCIe devices are NOT platform devices.
> > > 
> > > But they *are* used to create platform devices when the PCIe device is multi-functional, which is
> > > what intel_pmt is.
> > > 
> > > > 
> > > > Why not use the auxiliary bus for this thing if you have individual
> > > > drivers that need to "bind" to the different attributes that this single
> > > > PCIe device is exporting.
> > > 
> > > It wasn't clear in the beginning how this would evolve. MFD made sense for the PMT (platform
> > > monitoring technology) driver. PMT has 3 related but individually enumerable devices on the same IP,
> > > like lpss. But the same IP is now being used for other features too like SDSi. We could work on
> > > converting this to the auxiliary bus and then covert the cell drivers.
> > 
> > I see this as subsequent work.  It should not affect this submission.
> > 
> > FWIW, I still plan to review this set for inclusion into MFD.
> 
> That's fine, but as the add-on submission that builds on top of this is
> a broken mess (which is what caused me to have to review this series), I
> can't recommend that be taken yet as it needs work to prevent systems
> from doing bad things.

Understood.  Deferred.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
