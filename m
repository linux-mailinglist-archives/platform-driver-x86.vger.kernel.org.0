Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A674FBB87
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Apr 2022 14:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345001AbiDKMDl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 Apr 2022 08:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243449AbiDKMDk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 08:03:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D7EA236691
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 05:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649678485;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=oHGyKmJZVMoFrBzXud4AimrT6QwZEdA9Ks3IPXNEVBU=;
        b=eYHjHS2hLf+60OVwOaiVejiKL6YhLi9+9lJg1iyVcpLoul8wjg4h/80Jqmmf2h51bGS9jO
        6Pi5Zv+QioCH4pOjAD1qzNkzUbWh7iDhJq451QAYygzXGBeVVXZadrl2X4mpsreYJhcpJ/
        ytl/Ofw0IulP2vW/c+yHM1UTB8DvrXI=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-ZH3NCYfUMeOUPyjfH3DL0g-1; Mon, 11 Apr 2022 08:01:24 -0400
X-MC-Unique: ZH3NCYfUMeOUPyjfH3DL0g-1
Received: by mail-ed1-f71.google.com with SMTP id cn27-20020a0564020cbb00b0041b5b91adb5so8878194edb.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 05:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:content-transfer-encoding;
        bh=oHGyKmJZVMoFrBzXud4AimrT6QwZEdA9Ks3IPXNEVBU=;
        b=PVSEfqUlq/pXFGPHPNCvde2OqEacj3gKpsLIDc7YKy84HLDC024aAgCrU/nv36YmUE
         42th3u+PB3B/nk8HPuPyHCDXTfybf2dyktsCYfH3i5lVn3N8vfhWUd/Kkh/HLK5bo/R3
         xGYS1kGpwVkVZWN+B8CeW2a/qKR0R7rsVdAkzJAFJyK57xjqckO/jYwN00ttmL3n8PCz
         wfEK7cb2dtflCwsvffY8ZL5Kp3ZhgV6XBlxg4VtHHXO41OJtv1DIvTIXhcS9bUt5wh+k
         t2bzt2IldfcubmQ9isHlp//3Ks/qa+o8zQD/ywTo4YBdlVzUAhSQoMGsB803IR1SCSpR
         Qw9g==
X-Gm-Message-State: AOAM5302ufBbgtNCxCaLC5umNPvvu2nV40hD9w6YbwdlHP89npr7c/nV
        TMNAGqpYABNEmn6NmimRcKuOQW+ixAFxdt4jwaY6GApACLF6yh1gvlPRJ3Dic8zxuwHbn73xYi5
        fbg0u6xQedIiMmqxZBF9rcMA42nuOxb2+/w==
X-Received: by 2002:a17:906:5cb:b0:6cf:954:d84d with SMTP id t11-20020a17090605cb00b006cf0954d84dmr29359067ejt.560.1649678483421;
        Mon, 11 Apr 2022 05:01:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAzevc7YgXQoRZAFeD6m2YmOHnxMAYgHzARZwizrJD7wNzEHCmCMxAormMD9mR37tj7rM9Jg==
X-Received: by 2002:a17:906:5cb:b0:6cf:954:d84d with SMTP id t11-20020a17090605cb00b006cf0954d84dmr29359039ejt.560.1649678483134;
        Mon, 11 Apr 2022 05:01:23 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id s4-20020a170906a18400b006db0a78bde8sm11920348ejy.87.2022.04.11.05.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 05:01:22 -0700 (PDT)
Message-ID: <90de8805-387b-70f7-6e9d-ef353d1d3f60@redhat.com>
Date:   Mon, 11 Apr 2022 14:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.18-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 5.18.

This consists of various doc and code build- and warning-fixes
as well as a few small cleanups.

Regards,

Hans


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.18-2

for you to fetch changes up to 753ee989f7cf0c0a76a7f56956827a8863a60f97:

  platform/x86: amd-pmc: Fix compilation without CONFIG_SUSPEND (2022-04-04 16:26:09 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.18-2

Highlights:
- Doc + compilation warning fixes
- Kconfig dep fixes
- Misc. small code cleanups

The following is an automated git shortlog grouped by driver:

Documentation/ABI:
 -  sysfs-class-firmware-attributes: Misc. cleanups
 -  sysfs-class-firmware-attributes: Fix Sphinx errors
 -  sysfs-driver-intel_sdsi: Fix sphinx warnings

acerhdf:
 -  Cleanup str_starts_with()

amd-pmc:
 -  Fix compilation without CONFIG_SUSPEND

barco-p50-gpio:
 -  Fix duplicate included linux/io.h

samsung-laptop:
 -  Fix an unsigned comparison which can never be negative

think-lmi:
 -  certificate support clean ups

----------------------------------------------------------------
Hans de Goede (3):
      Documentation/ABI: sysfs-driver-intel_sdsi: Fix sphinx warnings
      Documentation/ABI: sysfs-class-firmware-attributes: Fix Sphinx errors
      Documentation/ABI: sysfs-class-firmware-attributes: Misc. cleanups

Haowen Bai (1):
      platform/x86: barco-p50-gpio: Fix duplicate included linux/io.h

Jiapeng Chong (1):
      platform/x86: samsung-laptop: Fix an unsigned comparison which can never be negative

Mario Limonciello (1):
      platform/x86: amd-pmc: Fix compilation without CONFIG_SUSPEND

Mark Pearson (1):
      platform/x86: think-lmi: certificate support clean ups

Wei Li (1):
      platform/x86: acerhdf: Cleanup str_starts_with()

 .../ABI/testing/sysfs-class-firmware-attributes    | 48 ++++++++++++----------
 Documentation/ABI/testing/sysfs-driver-intel_sdsi  | 18 ++++----
 drivers/platform/x86/acerhdf.c                     | 21 ++--------
 drivers/platform/x86/amd-pmc.c                     | 14 ++++++-
 drivers/platform/x86/barco-p50-gpio.c              |  1 -
 drivers/platform/x86/samsung-laptop.c              |  2 -
 drivers/platform/x86/think-lmi.c                   | 44 +++++++-------------
 drivers/platform/x86/think-lmi.h                   |  1 -
 8 files changed, 67 insertions(+), 82 deletions(-)

