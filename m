Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FC14C2DA6
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Feb 2022 14:55:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235165AbiBXNyg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 24 Feb 2022 08:54:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbiBXNyf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 08:54:35 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9172C1A39D0
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 05:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645710844;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=feRIEn1EMTywS/YZ2elPMkem2Aupjr0V2pvxGMXyLJA=;
        b=ANr0mFTd5rjkjK8P+fGzbEG+tUwzB1qxAYnFhg6lu6/c1nnaW8imdLzXyP52d4UrIZ+jfA
        GW5KaW3G+E0neGsbk/5EVPEvBcxqRwlTSCawNJLkSU6Dc8SHqYe3UtGAcrsbnb8G0SUHyC
        nx0qpPbbboU2Q/lNHgiEKSLC9898qqM=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-I80l_A2kPbyHM2ISRIEI3w-1; Thu, 24 Feb 2022 08:54:03 -0500
X-MC-Unique: I80l_A2kPbyHM2ISRIEI3w-1
Received: by mail-ej1-f71.google.com with SMTP id o22-20020a1709061d5600b006d1aa593787so1266060ejh.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 05:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=feRIEn1EMTywS/YZ2elPMkem2Aupjr0V2pvxGMXyLJA=;
        b=sVPxG4NrBeMmGTo1BALJF0Fqf3btkEa8C7Qx1MhtUsbA+8IhWLSR4VR1tWmpPKCZB9
         AD5rjSbYZJpF9bpNPa9ao38YvyayZbBWeqmR9H3tBXQP3EpuPj2XXW07miR9XeZvLFnN
         V9voQ8kCB4C2oCIRlieE4nCMdQOdjoGb7o782jZwI2vxg9gH4MqsLF3WgLUaMuq9PlFb
         0kMX3MDQ0Kyg+BHo+2ad7lldpzt7EXFFs982OfycoXlmlgUkQ8Bb3y/XxFkNP830oACM
         /IRSQAQwaeiTEtxnJFANmygCy6Jg7l7T8Izdz3+N67+g4LE5v0q9uTg8Hgx+pDnfGGOi
         mTzQ==
X-Gm-Message-State: AOAM530oKSLCO9RqOKqHuvX6zHrIN4JO+3x2BV7kRBaWZX8C8GxAbivc
        f9Oj6QD2Xnh+OLy6RWejmEC6M6nPZlHWRhjvmXKwmmIrhLfVsEkb4ht7AJQYMmgFNifQtCpb1wT
        7k6/WN7Iuo3c+i1UGItCJUXkmyj4esv5n7A==
X-Received: by 2002:a05:6402:294e:b0:40f:905b:dab5 with SMTP id ed14-20020a056402294e00b0040f905bdab5mr2406924edb.103.1645710841537;
        Thu, 24 Feb 2022 05:54:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoCnD4zV3OaNb0QEnnNVFM30U+N2AP2i9f7OL+iW7JbQVkIf4rYvgG8Fud0UtUx/4zPLvqHg==
X-Received: by 2002:a05:6402:294e:b0:40f:905b:dab5 with SMTP id ed14-20020a056402294e00b0040f905bdab5mr2406910edb.103.1645710841294;
        Thu, 24 Feb 2022 05:54:01 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id 18sm1395613ejj.1.2022.02.24.05.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 05:54:00 -0800 (PST)
Message-ID: <0cacb607-64a1-47de-7cf4-294d89045806@redhat.com>
Date:   Thu, 24 Feb 2022 14:54:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.17-4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is another set of 2 bug-fixes for platform-drivers-x86
for 5.17:

 -  Fix suspend/resume regression on AMD Cezanne APUs in >= 5.16
 -  Fix Microsoft Surface 3 battery readings

Regards,

Hans


The following changes since commit ae09639e3b2a0291b37b122c94dd4f773cd4e513:

  platform/x86: int3472: Add terminator to gpiod_lookup_table (2022-02-21 14:47:59 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.17-4

for you to fetch changes up to 21d90aaee8d5c2a097ef41f1430d97661233ecc6:

  surface: surface3_power: Fix battery readings on batteries without a serial number (2022-02-24 13:48:39 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v5.17-4

2 fixes:
 -  Fix suspend/resume regression on AMD Cezanne APUs in >= 5.16
 -  Fix Microsoft Surface 3 battery readings

The following is an automated git shortlog grouped by driver:

amd-pmc:
 -  Set QOS during suspend on CZN w/ timer wakeup

surface:
 -  surface3_power: Fix battery readings on batteries without a serial number

----------------------------------------------------------------
Hans de Goede (1):
      surface: surface3_power: Fix battery readings on batteries without a serial number

Mario Limonciello (1):
      platform/x86: amd-pmc: Set QOS during suspend on CZN w/ timer wakeup

 drivers/platform/surface/surface3_power.c | 13 +++++++---
 drivers/platform/x86/amd-pmc.c            | 42 ++++++++++++++++++++++++-------
 2 files changed, 43 insertions(+), 12 deletions(-)

