Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80A3342A80D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Oct 2021 17:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhJLPTq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 12 Oct 2021 11:19:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54066 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237167AbhJLPTp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Oct 2021 11:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634051863;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=10aXNDKfZw3j/Q6GRxYEoqvrWGBnZSBNXLMAxqiv6VA=;
        b=h6DeM/V5lwCH4wXPhkWXVBfClslCrPTVHkWP+h0vDYXvBtS6LjdAkEjxdUgvrVsITuG2hU
        FvMcw6pcvMB9vEVD5UvpjVchJrXPaGiZj44BD6D/aQLiTSXt7VrWbjThSQIVd/h9gLNAhi
        qILkqhtbEyrUKZHZTuKNr7NBmeA5hR8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-xmGdLXnoPVyNh8xoq3z4AA-1; Tue, 12 Oct 2021 11:17:42 -0400
X-MC-Unique: xmGdLXnoPVyNh8xoq3z4AA-1
Received: by mail-ed1-f72.google.com with SMTP id g28-20020a50d0dc000000b003dae69dfe3aso227346edf.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Oct 2021 08:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=10aXNDKfZw3j/Q6GRxYEoqvrWGBnZSBNXLMAxqiv6VA=;
        b=AzNmbLXU65ms/THs+fE5gvorKRLrg83Y4arU7lAtZ9ABLKkFst6I8jIWvc9+paiZF5
         dUjnmLoNHcNtyeTIgX+2VJOpLnwuXtn2bOsBgyXvCPfG2WAlcVGpeXMAuqYL7Fc7tpEt
         puXuPaBRelVf97l0HDZslVXfquPC7GzmH4tvjyw4FQiRgbFR0ScdDlzAvraReE6LyLpo
         pcERmojro/FpPc/HLt6XCzeTxK9CHax+D38WkIipKnwYWIKXoFwrc+qcdOSGDwQYeiev
         /ArFbHGsrClalrYexIDXa0q/X0Xjj18AjRJFl96atjCMkYELStFG+jrzi3fKdk5tKd/T
         +PPg==
X-Gm-Message-State: AOAM533dPOdnDSGJ0o5gqtqndKWSWq70LwWL8EdxWUVu4WLs+tuOMnUQ
        j73A/q0UvB97Ggt63PhMuozYXWSfcKxuIRngYpwpsPYhyebwb5Hvm9sR9TYUY6pgQ8jzIT+v6gv
        GthbqRZIeycgJv0UpnEn2EE+xLUNtC6iF0beakyBXOLpVdwbAsvxSPA9RGRbNAGtkpYD+SHSTAZ
        cznh8l0UdqRw==
X-Received: by 2002:a17:906:5801:: with SMTP id m1mr33766627ejq.296.1634051859672;
        Tue, 12 Oct 2021 08:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6afB2X2z24HUckFfKv3ojzCDeN/NsXdu29QaJ5kJP/96m8xo6jXCL/fQrPEHtm+4j7U6XmQ==
X-Received: by 2002:a17:906:5801:: with SMTP id m1mr33766596ejq.296.1634051859328;
        Tue, 12 Oct 2021 08:17:39 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id rv25sm5128158ejb.21.2021.10.12.08.17.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 08:17:38 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 5.15-3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org
Message-ID: <30dcf211-9359-dd17-dcee-cb688a7bfc71@redhat.com>
Date:   Tue, 12 Oct 2021 17:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Here is a set of bug-fixes and new hardware-ids for platform-drivers-x86 for 5.15.

Regards,

Hans


The following changes since commit 6f6aab1caf6c7fef46852aaab03f4e8250779e52:

  platform/x86: gigabyte-wmi: add support for B550I Aorus Pro AX (2021-09-21 15:49:23 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v5.15-3

for you to fetch changes up to 7df227847ab562c42d318bceccebb0c911c87b04:

  platform/x86: int1092: Fix non sequential device mode handling (2021-10-11 16:39:25 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v5.15-3

Second (small) set of pdx86 fixes for 5.15.

The following is an automated git shortlog grouped by driver:

amd-pmc:
 -  Add alternative acpi id for PMC controller

dell:
 -  Make DELL_WMI_PRIVACY depend on DELL_WMI

gigabyte-wmi:
 -  add support for B550 AORUS ELITE AX V2

int1092:
 -  Fix non sequential device mode handling

intel_scu_ipc:
 -  Update timeout value in comment
 -  Increase virtual timeout to 10s
 -  Fix busy loop expiry time

intel_skl_int3472:
 -  Correct null check

platform/mellanox:
 -  mlxreg-io: Fix read access of n-bytes size attributes
 -  mlxreg-io: Fix argument base in kstrtou32() call

----------------------------------------------------------------
Daniel Scally (1):
      platform/x86: intel_skl_int3472: Correct null check

Hans de Goede (1):
      platform/x86: dell: Make DELL_WMI_PRIVACY depend on DELL_WMI

Prashant Malani (3):
      platform/x86: intel_scu_ipc: Fix busy loop expiry time
      platform/x86: intel_scu_ipc: Increase virtual timeout to 10s
      platform/x86: intel_scu_ipc: Update timeout value in comment

Sachi King (1):
      platform/x86: amd-pmc: Add alternative acpi id for PMC controller

Shravan S (1):
      platform/x86: int1092: Fix non sequential device mode handling

Vadim Pasternak (2):
      platform/mellanox: mlxreg-io: Fix argument base in kstrtou32() call
      platform/mellanox: mlxreg-io: Fix read access of n-bytes size attributes

Zephaniah E. Loss-Cutler-Hull (1):
      platform/x86: gigabyte-wmi: add support for B550 AORUS ELITE AX V2

 MAINTAINERS                                        |  2 +-
 drivers/platform/mellanox/mlxreg-io.c              |  4 ++--
 drivers/platform/x86/amd-pmc.c                     |  1 +
 drivers/platform/x86/dell/Kconfig                  |  1 +
 drivers/platform/x86/gigabyte-wmi.c                |  1 +
 drivers/platform/x86/intel/int1092/intel_sar.c     | 23 ++++++++++++++--------
 .../x86/intel/int3472/intel_skl_int3472_discrete.c |  2 +-
 drivers/platform/x86/intel_scu_ipc.c               |  6 +++---
 8 files changed, 25 insertions(+), 15 deletions(-)

