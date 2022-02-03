Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17B1E4A88CC
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Feb 2022 17:43:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352195AbiBCQns (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Feb 2022 11:43:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233896AbiBCQnr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 11:43:47 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C881C06173B
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 08:43:47 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id m9so4858639oia.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Feb 2022 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmSfrWHOO84iaJyreyRK8M8+SfjOnwhXnoamUVhnFVM=;
        b=f1HPfVimFD2LZF1Lv4H8bnNprlEGted0B5APv+dH6dI4e6En6v9iU/qKC87lQF7OL6
         vUeB3V5BqfhiVuS7SNo6YRY0C1ckL2SCQFbSexD9mZnwCb4QntyBRFtG1EDwuiYFB+7S
         Vql6hAwLAg/XxDA1dF4rji3yz+Ha+DhEo+WKd+qW6m2Vf7PMQDoTwecNBCY+pBoZrRza
         36Nqtrnx9tVdba0bTzcmyETWSt05dtU1phg/Vg0kL5rNdHosWABja3G2Y5r5nqf9pfEV
         9bT/pxBS5Wjc2GHR4Et/4nIgwQlI9m1xINpO79hPUlPA97f3NRLzGfhgoW4HnyIFXVOa
         wTCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QmSfrWHOO84iaJyreyRK8M8+SfjOnwhXnoamUVhnFVM=;
        b=DwPD+KBUokeIa8912A4Fc+QFtnV8Qm9H0XBRIxLXHJrtFdfR8kz5hJ44OAGjHV9ER8
         gyvMk6AeVLhQ3xbf5UD3aObt3NX/izEXaxLI7XCf+3TI+ne9+tPaBNGq3Qn/x2MsGnx6
         SSr6zCer65QmmoH1G0ly00nr3rKD6XtgxPNInNJ2ACfDYIQHD0Fb4dVZwQ/VDLn+FUIQ
         cByK2nNl0ehnB6QFjijykH8kF67CGh4fueB6n89fcV8OBupMet479radoGxhnC6Ee9KQ
         MLEPeZ2wukVadlGjSNrFYr+hXlmfEMqeU+MQAn+cI4YsDcxz2B2uZiUgELIahxgGqYNR
         ChkQ==
X-Gm-Message-State: AOAM531+8oHf9JbtRPkxOvEoxwEBNBgbR58LoVD/MwjBFo9J+u6rHBr9
        EDBOah4NVUnEQGexPJdxhlD4ScvHYcSe+bjH
X-Google-Smtp-Source: ABdhPJyHt9krov7XOEQrs2XrKBepLYGKwwnCV87B2YLejYqTSyb4UBUr29AAuHXP3cehb+4vmGUQug==
X-Received: by 2002:aca:bb83:: with SMTP id l125mr7554966oif.153.1643906626460;
        Thu, 03 Feb 2022 08:43:46 -0800 (PST)
Received: from localhost (host8.190-224-49.telecom.net.ar. [190.224.49.8])
        by smtp.gmail.com with ESMTPSA id cy22sm226253oab.17.2022.02.03.08.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 08:43:46 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v6 0/6] x86: Show in sysfs if a memory node is able to do encryption
Date:   Thu,  3 Feb 2022 13:43:22 -0300
Message-Id: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show for each node if every memory descriptor in that node has the
EFI_MEMORY_CPU_CRYPTO attribute.

fwupd project plans to use it as part of a check to see if the users
have properly configured memory hardware encryption
capabilities. fwupd's people have seen cases where it seems like there
is memory encryption because all the hardware is capable of doing it,
but on a closer look there is not, either because of system firmware
or because some component requires updating to enable the feature.

It's planned to make it part of a specification that can be passed to
people purchasing hardware

These checks will run at every boot. The specification is called Host
Security ID: https://fwupd.github.io/libfwupdplugin/hsi.html.

We choosed to do it a per-node basis because although an ABI that
shows that the whole system memory is capable of encryption would be
useful for the fwupd use case, doing it in a per-node basis gives also
the capability to the user to target allocations from applications to
NUMA nodes which have encryption capabilities.


Changes since v5:

Refactor e820__range_{update, remove, set_crypto_capable} in order to
avoid code duplication.

Warn the user when a node has both encryptable and non-encryptable
regions.

Check that e820_table has enough size to store both current e820_table
and EFI memmap.


Changes since v4:

Add enum to represent the cryptographic capabilities in e820:
e820_crypto_capabilities.

Revert __e820__range_update, only adding the new argument for
__e820__range_add about crypto capabilities.

Add a function __e820__range_update_crypto similar to
__e820__range_update but to only update this new field.


Changes since v3:

Update date in Doc/ABI file.

More information about the fwupd usecase and the rationale behind
doing it in a per-NUMA-node.


Changes since v2:

e820__range_mark_crypto -> e820__range_mark_crypto_capable.

In e820__range_remove: Create a region with crypto capabilities
instead of creating one without it and then mark it.


Changes since v1:

Modify __e820__range_update to update the crypto capabilities of a
range; now this function will change the crypto capability of a range
if it's called with the same old_type and new_type. Rework
efi_mark_e820_regions_as_crypto_capable based on this.

Update do_add_efi_memmap to mark the regions as it creates them.

Change the type of crypto_capable in e820_entry from bool to u8.

Fix e820__update_table changes.

Remove memblock_add_crypto_capable. Now you have to add the region and
mark it then.

Better place for crypto_capable in pglist_data.


Martin Fernandez (6):
  mm/memblock: Tag memblocks with crypto capabilities
  mm/mmzone: Tag pg_data_t with crypto capabilities
  x86/e820: Refactor range_update and range_remove
  x86/e820: Tag e820_entry with crypto capabilities
  x86/efi: Tag e820_entries as crypto capable from EFI memmap
  drivers/node: Show in sysfs node's crypto capabilities

 Documentation/ABI/testing/sysfs-devices-node |  10 +
 arch/x86/include/asm/e820/api.h              |   1 +
 arch/x86/include/asm/e820/types.h            |  12 +-
 arch/x86/kernel/e820.c                       | 485 +++++++++++++++----
 arch/x86/platform/efi/efi.c                  |  37 ++
 drivers/base/node.c                          |  10 +
 include/linux/memblock.h                     |  15 +-
 include/linux/mmzone.h                       |   3 +
 mm/memblock.c                                |  64 +++
 mm/page_alloc.c                              |   1 +
 10 files changed, 531 insertions(+), 107 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node

-- 
2.30.2

