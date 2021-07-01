Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C84E3B9115
	for <lists+platform-driver-x86@lfdr.de>; Thu,  1 Jul 2021 13:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236194AbhGALZo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 1 Jul 2021 07:25:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236173AbhGALZk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Jul 2021 07:25:40 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85899C061756
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Jul 2021 04:23:09 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso6590107wmh.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Jul 2021 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JbizASzFyiH7QXpq2ZXPRBHVK2mj4yMm6bpaT6TBR4Q=;
        b=BQFKRMpNUNTrQ8qTxAEhrp8IGSbCvaj88L6kzdh1JOHOtSd72X6pNzpaJHI/tzI+6Q
         nCU5hNdAwafy9n8GEAZbEtLojwatbb8Z/vdrKJKMXqmEy8VvZqrNqzjQqowPce3Go6g8
         hnif4uG2t4RFdMCa61/KgK75KjOTJG6kyn1XwU050pz4ylZzN4MjO9CWQtDlyGGntL3U
         cKwa5Q0I7cjlF8+n/wYKD/vau423gjbf/bRthO9gpBTPKl9qtN1MRohto8SqXE4Z2IWu
         LZ/pdsfWef9St0wvhjG5k9sB9Zwlo5HKcFqAdQEmyGSruexuMfFRHTht39xI3xwaB2Lt
         +0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JbizASzFyiH7QXpq2ZXPRBHVK2mj4yMm6bpaT6TBR4Q=;
        b=YVLQPtP8GFkpPU/Cxo283QpQQopAzJWvnb8puB1N3bMxB7HkUn+3GDB2J3N4rXDSFa
         3IndKQMUBs90Xyhtfr9mhzdQY0lSwDdLCk28q0b3TqF8zzy1C7BqizmCVnX5TEiGFxN4
         mqR+I/GdSaMU/gGPPO2yrRz/tUcZrwdRlmdq4VHNJnjuw9NrXTS1maWEC4Pu6kaW8U1n
         Pm0fwKRQvIDOpl109u6U6+EAfJljkLFwU4HcdiydI7P3JW/fLCoP7+rWV7t6Zibyf1WD
         365iH9guXNLSiebjBubipqgr7rc+59KVFvw/rZtDvR7/fHa0Frsn9vUVm8SibmWfMvlv
         FmRw==
X-Gm-Message-State: AOAM530vsWLPBkuLOav81RFwDs/d1zT+b6r4tyyUpU/Q1i0Yyapr+c/e
        buxjNF1EoeRsEb7FXg5rk2fzhw==
X-Google-Smtp-Source: ABdhPJxPfR5J8AHD5e1p6cOqxPzXVSSFGmJ+II5CoaRSDF0OhvWYG8FLsprUCB2cLRHmAwWaUk/ZcA==
X-Received: by 2002:a7b:c449:: with SMTP id l9mr1323819wmi.98.1625138587862;
        Thu, 01 Jul 2021 04:23:07 -0700 (PDT)
Received: from dell ([109.180.115.217])
        by smtp.gmail.com with ESMTPSA id b9sm29566283wrh.81.2021.07.01.04.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jul 2021 04:23:07 -0700 (PDT)
Date:   Thu, 1 Jul 2021 12:23:05 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     david.e.box@linux.intel.com, mgross@linux.intel.com,
        bhelgaas@google.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/4] MFD: intel_pmt: Remove OOBMSM device
Message-ID: <YN2lmdDAOaykCvHK@dell>
References: <20210617215408.1412409-1-david.e.box@linux.intel.com>
 <20210617215408.1412409-3-david.e.box@linux.intel.com>
 <YNxENGGctLXmifzj@dell>
 <f590ee871d0527a12b307f1494cb4c8a91c5e3c2.camel@linux.intel.com>
 <e734a968-818a-380d-0ae5-fee41b3db246@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e734a968-818a-380d-0ae5-fee41b3db246@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 01 Jul 2021, Hans de Goede wrote:

> Hi,
> 
> On 6/30/21 11:11 PM, David E. Box wrote:
> > On Wed, 2021-06-30 at 11:15 +0100, Lee Jones wrote:
> >> On Thu, 17 Jun 2021, David E. Box wrote:
> >>
> >>> Unlike the other devices in intel_pmt, the Out of Band Management
> >>> Services
> >>> Module (OOBMSM) is actually not a PMT dedicated device. It can also
> >>> be used
> >>> to describe non-PMT capabilities. Like PMT, these capabilities are
> >>> also
> >>> enumerated using PCIe Vendor Specific registers in config space. In
> >>> order
> >>> to better support these devices without the confusion of a
> >>> dependency on
> >>> MFD_INTEL_PMT, remove the OOBMSM device from intel_pmt so that it
> >>> can be
> >>> later placed in its own driver. Since much of the same code will be
> >>> used by
> >>> intel_pmt and the new driver, create a new file with symbols to be
> >>> used by
> >>> both.
> >>>
> >>> While performing this split we need to also handle the creation of
> >>> platform
> >>> devices for the non-PMT capabilities. Currently PMT devices are
> >>> named by
> >>> their capability (e.g. pmt_telemetry). Instead, generically name
> >>> them by
> >>> their capability ID (e.g. intel_extnd_cap_2). This allows the IDs
> >>> to be
> >>> created automatically.  However, to ensure that unsupported devices
> >>> aren't
> >>> created, use an allow list to specify supported capabilities.
> >>>
> >>> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> >>> ---
> >>>  MAINTAINERS                                |   1 +
> >>>  drivers/mfd/Kconfig                        |   4 +
> >>>  drivers/mfd/Makefile                       |   1 +
> >>>  drivers/mfd/intel_extended_caps.c          | 208
> >>> +++++++++++++++++++++
> >>
> >> Please consider moving this <whatever this is> out to either
> >> drivers/pci or drivers/platform/x86.
> > 
> > None of the cell drivers are in MFD, only the PCI drivers from which
> > the cells are created. I understood that these should be in MFD. But
> > moving it to drivers/platform/x86 would be fine with me. That keeps the
> > code together in the same subsystem. Comment from Hans or Andy? 
> 
> I'm fine with moving everything to drivers/platform/x86, but AFAIK
> usually the actual code which has the MFD cells and creates the
> child devices usually lives under drivers/mfd

Correct.  It must.

No MFD API users outside of drivers/mfd please.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
