Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CB9B6695B3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 13 Jan 2023 12:35:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241369AbjAMLfL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 13 Jan 2023 06:35:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240122AbjAMLdq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 13 Jan 2023 06:33:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDF954720
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2023 03:07:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673608052;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=j1viz+m73p83+dF2CKzyciv4KLNjvt2LElLXL8ePhho=;
        b=QYXk7TNldKSw2lNsZ5I2HPsNvF31CN3MZY8Ka2Ok1Z/HUV+lj+fizh86dl9Cn44NyVCTaX
        VypVbVSLYq/ygOdAjy8dSR/3sTBgLstgUJGiURSZZZu05GQKjZY1OyXLSFoxP2YecujxLM
        bOd4qnVa4/zopEZeBoDYpP71kHRkCUQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-sf126Mv8M1KTAuAUVMszpg-1; Fri, 13 Jan 2023 06:07:31 -0500
X-MC-Unique: sf126Mv8M1KTAuAUVMszpg-1
Received: by mail-ej1-f72.google.com with SMTP id qw20-20020a1709066a1400b007c1727f7c55so14704443ejc.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Jan 2023 03:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j1viz+m73p83+dF2CKzyciv4KLNjvt2LElLXL8ePhho=;
        b=gXchAZB9b6+ct+JT7HC36VWhxt7Wg6k2D4hAPm2c0t2pwcZpnxoNHoVdYWQuNnzdgB
         GXhCL1g3x8f7kpQPhQ2F7PfCQpJCMg+nF7SdyvDnWw2cN2TIWDgU32xfMn1Gfaai+pP8
         jA7rUTNOdifi3ijnHFszH9o5+zXHw5/GZs6rwSJVmaTQVl3htqv7L/FobpI+2f//oWHZ
         J2GpFUSBKOLkUHDjIKeRISFZMp7SFeB9eOfe45I3Na4zMEk7X2fLGAKgUJg11XmMpJst
         b4hMzo6a5HTfMPeyu8Ojz9uokKTphTUss+p84ihv/SFSJXmi+S7577P8gP6wnj9dG1aM
         f3LA==
X-Gm-Message-State: AFqh2kpWcBmr/Do8XajB4wEU07IdAYCY2lsEXql28t6mISoShUO4ZFf/
        JUjEoFnjWOvh25WxIvW/tg1ytAkKIiy+hJdceNEBbBuL6Ip7jQvpqhoChgQfVCn2xhSQIPm3yAp
        uBqATgt7yoqNagSgbf4Aq91NxDBip/v1WMQ==
X-Received: by 2002:aa7:c78a:0:b0:498:f2d:f52e with SMTP id n10-20020aa7c78a000000b004980f2df52emr21664100eds.21.1673608050290;
        Fri, 13 Jan 2023 03:07:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv8vJX/eFCzo/3Ow5GaVX46ffUpouhJeOnvlcMDGgQUTUf+JsrvwTFIjqQgDwya+03G6J+Jlg==
X-Received: by 2002:aa7:c78a:0:b0:498:f2d:f52e with SMTP id n10-20020aa7c78a000000b004980f2df52emr21664087eds.21.1673608050060;
        Fri, 13 Jan 2023 03:07:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id o11-20020a170906768b00b0084d242d07ffsm8097390ejm.8.2023.01.13.03.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:07:29 -0800 (PST)
Message-ID: <2d040d2d-4f4d-f106-49ba-317142e0ce74@redhat.com>
Date:   Fri, 13 Jan 2023 12:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.2-2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is the first round of fixes for platform-drivers-x86 for 6.2.

Nothing special to report just various small fixes and
hardware-id additions.

Regards,

Hans


The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.2-2

for you to fetch changes up to fde5f74ccfc771941b018b5415fa9664426e10ad:

  platform/x86: thinkpad_acpi: Fix profile mode display in AMT mode (2023-01-13 11:40:30 +0100)

----------------------------------------------------------------
platform-drivers-x86 for v6.2-2

A small set of assorted fixes and hardware-id additions for 6.2.

The following is an automated git shortlog grouped by driver:

asus-nb-wmi:
 -  Add alternate mapping for KEY_SCREENLOCK
 -  Add alternate mapping for KEY_CAMERA

asus-wmi:
 -  Don't load fan curves without fan
 -  Ignore fan on E410MA
 -  Add quirk wmi_ignore_fan

dell-privacy:
 -  Only register SW_CAMERA_LENS_COVER if present
 -  Fix SW_CAMERA_LENS_COVER reporting

ideapad-laptop:
 -  Add Legion 5 15ARH05 DMI id to set_fn_lock_led_list[]

int3472/discrete:
 -  Ensure the clk/power enable pins are in output mode

intel/pmc/core:
 -  Add Meteor Lake mobile support

platform/surface:
 -  aggregator: Add missing call to ssam_request_sync_free()
 -  aggregator: Ignore command messages not intended for us

platform/x86/amd:
 -  Fix refcount leak in amd_pmc_probe

simatic-ipc:
 -  add another model
 -  correct name of a model

sony-laptop:
 -  Don't turn off 0x153 keyboard backlight during probe

thinkpad_acpi:
 -  Fix profile mode display in AMT mode

touchscreen_dmi:
 -  Add info for the CSL Panther Tab HD

----------------------------------------------------------------
Gayatri Kammela (1):
      platform/x86: intel/pmc/core: Add Meteor Lake mobile support

Hans de Goede (6):
      platform/x86: sony-laptop: Don't turn off 0x153 keyboard backlight during probe
      platform/x86: ideapad-laptop: Add Legion 5 15ARH05 DMI id to set_fn_lock_led_list[]
      platform/x86: asus-nb-wmi: Add alternate mapping for KEY_SCREENLOCK
      platform/x86: dell-privacy: Fix SW_CAMERA_LENS_COVER reporting
      platform/x86: dell-privacy: Only register SW_CAMERA_LENS_COVER if present
      platform/x86: int3472/discrete: Ensure the clk/power enable pins are in output mode

Henning Schild (2):
      platform/x86: simatic-ipc: correct name of a model
      platform/x86: simatic-ipc: add another model

Mark Pearson (1):
      platform/x86: thinkpad_acpi: Fix profile mode display in AMT mode

Maximilian Luz (2):
      platform/surface: aggregator: Ignore command messages not intended for us
      platform/surface: aggregator: Add missing call to ssam_request_sync_free()

Miaoqian Lin (1):
      platform/x86/amd: Fix refcount leak in amd_pmc_probe

Michael Klein (1):
      platform/x86: touchscreen_dmi: Add info for the CSL Panther Tab HD

Thomas Weißschuh (4):
      platform/x86: asus-nb-wmi: Add alternate mapping for KEY_CAMERA
      platform/x86: asus-wmi: Add quirk wmi_ignore_fan
      platform/x86: asus-wmi: Ignore fan on E410MA
      platform/x86: asus-wmi: Don't load fan curves without fan

 drivers/platform/surface/aggregator/controller.c   |  4 ++-
 .../surface/aggregator/ssh_request_layer.c         | 14 ++++++++
 drivers/platform/x86/amd/pmc.c                     |  2 +-
 drivers/platform/x86/asus-nb-wmi.c                 | 15 ++++++++
 drivers/platform/x86/asus-wmi.c                    |  7 +++-
 drivers/platform/x86/asus-wmi.h                    |  1 +
 drivers/platform/x86/dell/dell-wmi-privacy.c       | 41 ++++++++++++++++------
 drivers/platform/x86/ideapad-laptop.c              |  6 ++++
 .../platform/x86/intel/int3472/clk_and_regulator.c |  3 ++
 drivers/platform/x86/intel/int3472/discrete.c      |  4 +++
 drivers/platform/x86/intel/pmc/core.c              |  1 +
 drivers/platform/x86/simatic-ipc.c                 |  3 +-
 drivers/platform/x86/sony-laptop.c                 | 21 +++++++----
 drivers/platform/x86/thinkpad_acpi.c               | 23 ++++++++----
 drivers/platform/x86/touchscreen_dmi.c             | 25 +++++++++++++
 include/linux/platform_data/x86/simatic-ipc.h      |  3 +-
 16 files changed, 145 insertions(+), 28 deletions(-)

