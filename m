Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCF16FDBA6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 May 2023 12:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236706AbjEJKbB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 10 May 2023 06:31:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236709AbjEJKah (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 May 2023 06:30:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70745659D
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 May 2023 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1683714594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=WtuxbebE1vm0Cyf2ccSCCbuiNJdzXkyIZyuRiPAW/XY=;
        b=ignBV4w0bLfhAPiAXWjXbYzZ8qIX0etfj/ttJKqrvg2MvJ1y1DnE5HP4ydNUdTKnr6rVe4
        7ZBQ4OLr3fOQQHa/kU1RcyulyTo4H2r07d/7b7cVO3nvSp9J/RYapCbPzuACl3HU9MToJ2
        xzhWPCBtyPayIItHwctQVtocUjRR8Wg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-1ZOeTO3PMAKNFxKWET8o0Q-1; Wed, 10 May 2023 06:29:53 -0400
X-MC-Unique: 1ZOeTO3PMAKNFxKWET8o0Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-95847b4b4e7so818572066b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 May 2023 03:29:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683714591; x=1686306591;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WtuxbebE1vm0Cyf2ccSCCbuiNJdzXkyIZyuRiPAW/XY=;
        b=dq4NbCiU2jDKyiUK/iNE6GJMbLw5v1xsLPIibDOUMxQW/B/qH5BEWrvupOAWvbLQ6e
         VhSJrgT9FxygauFDxwEJ/IlABpGiKXzMSX8aO+XuHWHim6AXsRsCr0UuaASJJNbrB3A/
         CjXBLYPqb6LjeHffQzXhSQyKI0lP6mN5Std7bC2E6Qxq3stKY/2lO+TLaz+geKSGW1bL
         VjYXE8BK4uaHIK0l4UR5U/gmTzTJ0Y9UIazM7c2Lthp67C1FJqQp1xu9w/Eg4Pn0dFyB
         LRkQmRKtvoiH0aC20hgR5Hbzr4+NRYg/jpxsBdm9thy+G/ZxbfBH6eRkUa9BiP8eDrdU
         6Efg==
X-Gm-Message-State: AC+VfDxUzM1p+XnwJpPxwaIKCR5/aQ16GUi/pwcy8I/NItYVwAPXNrji
        H2fQdl2rvtUo54NGOgQ0W5Ma578EKzIv2cJ67WB9HpeKNjzTRvoxRDan2+Zt8BmOL+XVKseO8Lk
        0SDYhyaIynBEzGMyJ68ylPWA6gTdKwM4G/bJw3doxxQ==
X-Received: by 2002:a17:907:1622:b0:94a:9f9a:b3c4 with SMTP id hb34-20020a170907162200b0094a9f9ab3c4mr17644439ejc.49.1683714591666;
        Wed, 10 May 2023 03:29:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5zoYGJIzNTbDeliJHH6ShUAOp0YxJQ2KMTXLbcFVPVpTuqWdJLii4BQu+3aiM1+MRoy2FqFA==
X-Received: by 2002:a17:907:1622:b0:94a:9f9a:b3c4 with SMTP id hb34-20020a170907162200b0094a9f9ab3c4mr17644425ejc.49.1683714591371;
        Wed, 10 May 2023 03:29:51 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d4-20020a170907272400b00965e9b435dfsm2506419ejl.65.2023.05.10.03.29.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 03:29:50 -0700 (PDT)
Message-ID: <fcddbd63-758f-4e05-c9c5-39a904eebf9d@redhat.com>
Date:   Wed, 10 May 2023 12:29:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.4-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.4.

Nothing special to report just various small fixes:

 -  thinkpad_acpi: Fix profile (performance/bal/low-power) regression on T490
 -  misc. other small fixes / hw-id additions

Regards,

Hans


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.4-2

for you to fetch changes up to 3d43f9f639542fadfb28f40b509bf147a6624d48:

  platform/mellanox: fix potential race in mlxbf-tmfifo driver (2023-05-09 11:54:35 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.4-2

Highlights:
 -  thinkpad_acpi: Fix profile (performance/bal/low-power) regression on T490
 -  misc. other small fixes / hw-id additions

The following is an automated git shortlog grouped by driver:

hp-wmi:
 -  add micmute to hp_wmi_keymap struct

intel_scu_pcidrv:
 -  Add back PCI ID for Medfield

platform/mellanox:
 -  fix potential race in mlxbf-tmfifo driver

platform/x86/intel-uncore-freq:
 -  Return error on write frequency

thinkpad_acpi:
 -  Add profile force ability
 -  Fix platform profiles on T490

touchscreen_dmi:
 -  Add info for the Dexp Ursus KX210i
 -  Add upside-down quirk for GDIX1002 ts on the Juno Tablet

----------------------------------------------------------------
Andrey Avdeev (1):
      platform/x86: touchscreen_dmi: Add info for the Dexp Ursus KX210i

Fae (1):
      platform/x86: hp-wmi: add micmute to hp_wmi_keymap struct

Hans de Goede (1):
      platform/x86: touchscreen_dmi: Add upside-down quirk for GDIX1002 ts on the Juno Tablet

Julian Winkler (1):
      platform/x86: intel_scu_pcidrv: Add back PCI ID for Medfield

Liming Sun (1):
      platform/mellanox: fix potential race in mlxbf-tmfifo driver

Mark Pearson (2):
      platform/x86: thinkpad_acpi: Fix platform profiles on T490
      platform/x86: thinkpad_acpi: Add profile force ability

Srinivas Pandruvada (1):
      platform/x86/intel-uncore-freq: Return error on write frequency

 drivers/platform/mellanox/mlxbf-tmfifo.c           | 11 ++++--
 drivers/platform/x86/hp/hp-wmi.c                   |  1 +
 .../uncore-frequency/uncore-frequency-common.c     |  6 +++-
 drivers/platform/x86/intel_scu_pcidrv.c            |  1 +
 drivers/platform/x86/thinkpad_acpi.c               | 24 ++++++++++---
 drivers/platform/x86/touchscreen_dmi.c             | 41 ++++++++++++++++++++++
 6 files changed, 76 insertions(+), 8 deletions(-)

