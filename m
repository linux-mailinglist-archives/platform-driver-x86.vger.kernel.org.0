Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6C24A777B
	for <lists+platform-driver-x86@lfdr.de>; Wed,  2 Feb 2022 19:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346514AbiBBSHX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 2 Feb 2022 13:07:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45253 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346547AbiBBSHV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Feb 2022 13:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1643825241;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=m3aJbLwpYHN269fbcuY9B5J6QMlrbznLlNBdaK07iJY=;
        b=Avge8yNQX/VqJIV72aQTwGABMT9uFDFakhQK8RUR/zr0OaqgDHs4dt6goGsmsepqLbtTiH
        ut+DAMHZW+rO71w/UihESptUYp+ezIz40JzeHDVCVRwzpIenqHQuA+f6PlZnxR/hUu/ZcZ
        0t81kZxxY7/VcXhBc+CyYVDqnJZZgq8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-656-wiPgjKSjOR23dwXzV67r-Q-1; Wed, 02 Feb 2022 13:07:19 -0500
X-MC-Unique: wiPgjKSjOR23dwXzV67r-Q-1
Received: by mail-ej1-f72.google.com with SMTP id v2-20020a170906292200b006a94a27f903so16292ejd.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Feb 2022 10:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:cc:content-transfer-encoding;
        bh=m3aJbLwpYHN269fbcuY9B5J6QMlrbznLlNBdaK07iJY=;
        b=hx1rHaQTYkqpW9guuvxKx0SV+NsWd5LSOVhBjkHywufCvT+r/p/uZOcdTkGKeZXDmG
         6dH2nVtjNCz6CpEkVb/pY6NR021E9Og68LecElVPUFXlgplRpAbLEYTzykFQcMkVHGfB
         sdoDzaJrAUoOic9r49pE36pHwaROS6+XlS8Xhqb504axuZDcPk0F77vyA+aFchiq+y/Q
         dDuKlB+6tjRqI8Qt+lw/YumdR6e9S57PhI2+kp9E4XyVn9GN+KEHOKdKmf2bpq7De2xm
         oHg3IC8G7iNqE+mnKoN92jfRNW0uFC54OfSyWy76WwCl4i1tscf8BdFOsi/lTEBgmomg
         NVTw==
X-Gm-Message-State: AOAM533ckiOzcNz4gZHaNVxQM6hLSmBhOpQ568iCRyY+YSGYsfUxd5pe
        104ptNWNTEXnap/sz+12vysRrC0R8V+65efVTj9B964ItD9O4+Hj5rTEPFxSYuR4KXh/zkn9ATG
        6WiY0f3bsqVPLeWFihsFAYnOeINyDoijOrA==
X-Received: by 2002:aa7:cdc6:: with SMTP id h6mr31423366edw.140.1643825237846;
        Wed, 02 Feb 2022 10:07:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweD3gxij9jg7L3yrFZZFg9hltu+qep/l9q69NHRkppYMewyNPwVAu1zpXVSRoramDOs2xfJw==
X-Received: by 2002:aa7:cdc6:: with SMTP id h6mr31423346edw.140.1643825237668;
        Wed, 02 Feb 2022 10:07:17 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id y5sm21774349edw.45.2022.02.02.10.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 10:07:17 -0800 (PST)
Message-ID: <2062f567-9756-1e13-bb50-89c7211955fd@redhat.com>
Date:   Wed, 2 Feb 2022 19:07:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To:     Takashi Iwai <tiwai@suse.de>,
        "Rafael J . Wysocki" <rafael@kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch with spi in i2c-multi-instantiate changes
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        linux-acpi <linux-acpi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Takashi, Rafael,

As discussed here is a pull-req for an immutable branch with all the changes
from the "[PATCH v6 0/9] Support Spi in i2c-multi-instantiate driver"
series, including one ALSA change, in case you want to merge this to
avoid conflicts.

Regards,

Hans


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-serial-multi-instantiate-1

for you to fetch changes up to d9c01c530cc5e3b6d5bdfeae12c3d0f33fae7498:

  ACPI / scan: Create platform device for CS35L41 (2022-02-02 18:12:41 +0100)

----------------------------------------------------------------
This branch contains 5.17-rc1 + the SPI tree's spi-acpi-helpers tag +
the other patches from the "[PATCH v6 0/9] Support Spi in
i2c-multi-instantiate driver" series.

----------------------------------------------------------------
Lucas Tanure (4):
      platform/x86: i2c-multi-instantiate: Rename it for a generic serial driver name
      platform/x86: serial-multi-instantiate: Reorganize I2C functions
      ALSA: hda/realtek: Add support for HP Laptops
      ACPI / scan: Create platform device for CS35L41

Stefan Binding (5):
      spi: Make spi_alloc_device and spi_add_device public again
      spi: Create helper API to lookup ACPI info for spi device
      spi: Support selection of the index of the ACPI Spi Resource before alloc
      spi: Add API to count spi acpi resources
      platform/x86: serial-multi-instantiate: Add SPI support

 MAINTAINERS                                     |   4 +-
 drivers/acpi/scan.c                             |  16 +-
 drivers/platform/x86/Kconfig                    |  12 +-
 drivers/platform/x86/Makefile                   |   2 +-
 drivers/platform/x86/i2c-multi-instantiate.c    | 174 ------------
 drivers/platform/x86/serial-multi-instantiate.c | 348 ++++++++++++++++++++++++
 drivers/spi/spi.c                               | 137 ++++++++--
 include/linux/spi/spi.h                         |  20 ++
 sound/pci/hda/patch_realtek.c                   |  43 ++-
 9 files changed, 550 insertions(+), 206 deletions(-)
 delete mode 100644 drivers/platform/x86/i2c-multi-instantiate.c
 create mode 100644 drivers/platform/x86/serial-multi-instantiate.c

