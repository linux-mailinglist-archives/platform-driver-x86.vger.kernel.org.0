Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC6D333AD0
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Mar 2021 11:57:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232065AbhCJK5W (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 10 Mar 2021 05:57:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232623AbhCJK5P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Mar 2021 05:57:15 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A31BDC061760
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Mar 2021 02:57:14 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id w11so22800025wrr.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Mar 2021 02:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Ran6jv4T8eASAxUQF++U7Sou6onWiHh/0sYKH562zOU=;
        b=Qukof5fOttc8noCDQV1vJ9KKLni6o1NOZtnmt9PKg4/cpfSB4v1U/5DMEJzTKzPs2B
         TveXJDPY8cBY3o0pQVttbnaj8QU+wruMpoaZeIDQUC24zKd9nQYwhAw8XTISusfamveo
         b9HtneIFd1HGtOdKyfgClKEgh9UJxOGI/oUYUJ1yoU08kg8Eu+z2DcwQu5bLETKBjNhB
         aeC7nfqeigGlJWp+Qz1K5QLu5UMAOvqTnMFANRp5EGnh5bcNUUgNmojcVQSA81GBkudx
         CAnpHKlfKpPIIRITNsF7zfp45pBfSnQkCaLll2dSTmqMQsTAKhHdA2lBzT7weXbYRuke
         tcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Ran6jv4T8eASAxUQF++U7Sou6onWiHh/0sYKH562zOU=;
        b=DSuECbCvUCk7lndRsC0ODasYkFg+V/SSyXy7Q9yv8eTXLIbI2oPXmSnzR5IIAYV4N8
         4BntPMB3rzjH1a9Yw7cfYrKO0rWifZfoGYEE6Hf2wn1ZsBPobBAneaJJq07n4aOolpc3
         0pYxtfg7FHgEK1VN4CddfyoyUUp9CzkIMz3mYHIArTT/nENSuTOMHcfgnHlU/2h4IIwB
         raQbo4bmMmmlpoeFfcTC3+sZDq+QgZGcvWg0+C1O/nsCuRu1AbTmb99KQwdkj4ER7rof
         6hYZqAK+Yj/tMmxFwMEXbWGhqbS42yQb+m5omc1Jy1Rn66366MKOOxsi6FPHhqPfn4SZ
         QVaQ==
X-Gm-Message-State: AOAM53164dWdPY1UJv3MJynppeqAZT2VskI45bXMaweh4QPdEzbSd0gR
        4w+IY4Q3JFUR+4ksqgdZ8W0ZXA==
X-Google-Smtp-Source: ABdhPJyzR6rierxPNgJjnnbYdjb5jyK9H+K8960XSYyXKm+A1lBmGrul+T7317lMk+Xo+8YP7jD5Ug==
X-Received: by 2002:adf:ea0e:: with SMTP id q14mr2933779wrm.389.1615373833373;
        Wed, 10 Mar 2021 02:57:13 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id q19sm3343882wrg.80.2021.03.10.02.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:57:12 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:57:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [GIT PULL v2] Immutable branch between MFD and Platform/X86 due for
 the v5.13 merge window
Message-ID: <20210310105711.GJ701493@dell>
References: <20210128172846.99352-1-david.e.box@linux.intel.com>
 <20210224201005.1034005-1-david.e.box@linux.intel.com>
 <20210309181206.GT4931@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210309181206.GT4931@dell>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Rebased onto -rc2

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-platform-x86-v5.13

for you to fetch changes up to aa47ad3f853ae72c32b7e46dfc8bc2c8dc2dbad7:

  mfd: intel_pmt: Add support for DG1 (2021-03-10 10:48:48 +0000)

----------------------------------------------------------------
Immutable branch between MFD and Platform/x86 due for the v5.13 merge window

----------------------------------------------------------------
David E. Box (2):
      mfd: intel_pmt: Fix nuisance messages and handling of disabled capabilities
      mfd: intel_pmt: Add support for DG1

 drivers/mfd/intel_pmt.c                    | 112 +++++++++++++++++++----------
 drivers/platform/x86/intel_pmt_class.c     |  46 ++++++++++++
 drivers/platform/x86/intel_pmt_class.h     |   1 +
 drivers/platform/x86/intel_pmt_telemetry.c |  20 ------
 4 files changed, 122 insertions(+), 57 deletions(-)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
