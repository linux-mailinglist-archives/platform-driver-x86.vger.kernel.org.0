Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775ED3F177C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Aug 2021 12:48:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238318AbhHSKsn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 19 Aug 2021 06:48:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34999 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238313AbhHSKsf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 06:48:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629370075;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4PYjr/pPEkhqJtnx1k+32Cxpa9nt9LjIB1niDvNNZ+Y=;
        b=Cgskboziu3zXjfULTprmhy3rm+jibIq+f8dzZxn4Eq0pvYUjoMFh9fl0Qs9VG6f9PKtMpK
        5lDjrL7MMTaS9l3XAnGYAteryBI91lo3OqJ1HA9JlhiT13hqKTuYhl8lnJMTKCYJSJzhSj
        xoFNVPj1rfvQU995f+IeeYUjTWw4nyc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-87mNAeoqP9e_Wnzp9c1u_Q-1; Thu, 19 Aug 2021 06:47:54 -0400
X-MC-Unique: 87mNAeoqP9e_Wnzp9c1u_Q-1
Received: by mail-ed1-f72.google.com with SMTP id n4-20020aa7c6840000b02903be94ce771fso2631475edq.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Aug 2021 03:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4PYjr/pPEkhqJtnx1k+32Cxpa9nt9LjIB1niDvNNZ+Y=;
        b=E/1ciNScR7GTfnBfefUtoAXCtA6NV4wMt28he7k9b1prqiW/teL2fIA+o8lHKocb5X
         efF1HXE1r9CQ/HURwhdBWpk7sok2ZOswmSPsNKXbO6x9lznbwVVwCpX67MxZP2PHGxz6
         HTECjn7qk0hgLrO9yLxdqRa6HdDh43RN3zWIdZJ6hikgiaOllY6Q5+q5ZrnE+41/vAI7
         WZ7Q6u2jVWu8U2mXfA2cQne3DUcuUmXPI/vY0vzYsQ8MaurlOzXNpwpEwd0I1Szpj9tu
         04ZL6LwRgr3IZ5Vgsgoa6DoW1D2BwJMtq814L5VR4fIb1NwGaRfmYoCtMNk9LwZvXO/B
         XVPw==
X-Gm-Message-State: AOAM531uDA30U8/yCrtucB9Et6I86f/B8IgGIc6OnInzIgISNFN7qcNJ
        GaKbjSL91VDE0Ox6KVTC0mY/WXHy1gXtli14DwB/YjfhgX1r9caRVau9+tLXLezfFDAdlsZJVix
        Uc+7B3i0AYuMOO7U0W23i8qmp+Qngi4fucdTLQ8t3OkJvMvMAiq+xYRconrJFdXKO/dQJSX5c2I
        9f4xF6DW3D7g==
X-Received: by 2002:a17:906:720e:: with SMTP id m14mr14873942ejk.500.1629370073420;
        Thu, 19 Aug 2021 03:47:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxWGZfyQpZDrg3n09v+KAz9ExfbaEUAmky7CANl0KStgIWopiasAs2lJfrm2RG9fJ0UzQ245g==
X-Received: by 2002:a17:906:720e:: with SMTP id m14mr14873911ejk.500.1629370073155;
        Thu, 19 Aug 2021 03:47:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ay3sm1112372ejb.0.2021.08.19.03.47.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 03:47:52 -0700 (PDT)
Subject: Re: [PATCH v3 00/20] Intel platform driver code movement
To:     Kate Hsuan <hpa@redhat.com>, Alex Hung <alex.hung@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20210819033001.20136-1-hpa@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1360c64f-b695-a4b8-8b61-a4dfb0e896f0@redhat.com>
Date:   Thu, 19 Aug 2021 12:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819033001.20136-1-hpa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/21 5:29 AM, Kate Hsuan wrote:
> v3 has some improvement and listed below.
> kconfig typo correction.
> commit message improvement.
> Fix two kernel test robot fail issues.
> 
> Kate Hsuan (20):
>   platform/x86: intel_bxtwc_tmu: Move to intel sub-directory
>   platform/x86: intel_chtdc_ti_pwrbtn: Move to intel sub-directory
>   platform/x86: intel_mrfld_pwrbtn: Move to intel sub-directory
>   platform/x86: intel_punit_ipc: Move to intel sub-directory
>   platform/x86: intel_pmc_core: Move to intel sub-directory
>   platform/x86: intel_scu: Move to intel sub-directory
>   platform/x86: intel_telemetry: Move to intel sub-directory
>   platform/x86: intel_ips: Move to intel sub-directory
>   platform/x86: intel-rst: Move to intel sub-directory
>   platform/x86: intel-smartconnect: Move to intel sub-directory
>   platform/x86: intel_turbo_max_3: Move to intel sub-directory
>   platform/x86: intel-uncore-frequency: Move to intel sub-directory
>   platform/x86: intel_speed_select_if: Move to intel sub-directory
>   platform/x86: intel_atomisp2_led: Move to intel sub-directory
>   platform/x86: intel-hid: Move to intel sub-directory
>   platform/x86: intel_int0002_vgpio: Move to intel sub-directory
>   platform/x86: intel_oaktrail: Move to intel sub-directory
>   platform/x86: intel-vbtn: Move to intel sub-directory
>   platform/x86: intel-wmi-sbl-fw-updat: Move to intel sub-directory
>   platform/x86: intel-wmi-thunderbolt: Move to intel sub-directory

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

With the changes mentioned in replies to individual patches.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
>  drivers/platform/x86/Kconfig                  | 287 ------------------
>  drivers/platform/x86/Makefile                 |  34 +--
>  drivers/platform/x86/intel/Kconfig            | 160 ++++++++++
>  drivers/platform/x86/intel/Makefile           |  44 +++
>  drivers/platform/x86/intel/atomisp2/Kconfig   |  38 +++
>  drivers/platform/x86/intel/atomisp2/Makefile  |   9 +
>  .../atomisp2/led.c}                           |   0
>  .../atomisp2/pm.c}                            |   0
>  .../{intel_bxtwc_tmu.c => intel/bxtwc_tmu.c}  |   0
>  .../chtdc_ti_pwrbtn.c}                        |   0
>  .../platform/x86/{intel-hid.c => intel/hid.c} |   2 +-
>  .../int0002_vgpio.c}                          |   0
>  .../platform/x86/{intel_ips.c => intel/ips.c} |   2 +-
>  .../mrfld_pwrbtn.c}                           |   0
>  .../{intel_oaktrail.c => intel/oaktrail.c}    |   0
>  drivers/platform/x86/intel/pmc/Kconfig        |  26 ++
>  drivers/platform/x86/intel/pmc/Makefile       |   9 +
>  .../x86/{ => intel/pmc}/intel_pmc_core.h      |   0
>  .../pmc/pmc_core.c}                           |   0
>  .../pmc/pmc_core_pltdrv.c}                    |   0
>  .../{intel_punit_ipc.c => intel/punit_ipc.c}  |   0
>  .../platform/x86/{intel-rst.c => intel/rst.c} |   0
>  drivers/platform/x86/intel/scu/Kconfig        |  52 ++++
>  drivers/platform/x86/intel/scu/Makefile       |  13 +
>  .../x86/{intel_scu_ipc.c => intel/scu/ipc.c}  |   0
>  .../scu/ipcutil.c}                            |   0
>  .../scu/pcidrv.c}                             |   0
>  .../scu/pltdrv.c}                             |   0
>  .../x86/{intel_scu_wdt.c => intel/scu/wdt.c}  |   0
>  .../smartconnect.c}                           |   0
>  .../speed_select_if}/Kconfig                  |   0
>  .../speed_select_if}/Makefile                 |   0
>  .../speed_select_if}/isst_if_common.c         |   0
>  .../speed_select_if}/isst_if_common.h         |   0
>  .../speed_select_if}/isst_if_mbox_msr.c       |   0
>  .../speed_select_if}/isst_if_mbox_pci.c       |   0
>  .../speed_select_if}/isst_if_mmio.c           |   0
>  drivers/platform/x86/intel/telemetry/Kconfig  |  16 +
>  drivers/platform/x86/intel/telemetry/Makefile |  11 +
>  .../telemetry/core.c}                         |   0
>  .../telemetry/debugfs.c}                      |   0
>  .../telemetry/pltdrv.c}                       |   0
>  .../turbo_max_3.c}                            |   0
>  .../uncore-frequency.c}                       |   0
>  .../x86/{intel-vbtn.c => intel/vbtn.c}        |   2 +-
>  drivers/platform/x86/intel/wmi/Kconfig        |  26 ++
>  drivers/platform/x86/intel/wmi/Makefile       |   9 +
>  .../wmi/sbl-fw-update.c}                      |   0
>  .../wmi/thunderbolt.c}                        |   0
>  49 files changed, 419 insertions(+), 321 deletions(-)
>  create mode 100644 drivers/platform/x86/intel/atomisp2/Kconfig
>  create mode 100644 drivers/platform/x86/intel/atomisp2/Makefile
>  rename drivers/platform/x86/{intel_atomisp2_led.c => intel/atomisp2/led.c} (100%)
>  rename drivers/platform/x86/{intel_atomisp2_pm.c => intel/atomisp2/pm.c} (100%)
>  rename drivers/platform/x86/{intel_bxtwc_tmu.c => intel/bxtwc_tmu.c} (100%)
>  rename drivers/platform/x86/{intel_chtdc_ti_pwrbtn.c => intel/chtdc_ti_pwrbtn.c} (100%)
>  rename drivers/platform/x86/{intel-hid.c => intel/hid.c} (99%)
>  rename drivers/platform/x86/{intel_int0002_vgpio.c => intel/int0002_vgpio.c} (100%)
>  rename drivers/platform/x86/{intel_ips.c => intel/ips.c} (99%)
>  rename drivers/platform/x86/{intel_mrfld_pwrbtn.c => intel/mrfld_pwrbtn.c} (100%)
>  rename drivers/platform/x86/{intel_oaktrail.c => intel/oaktrail.c} (100%)
>  create mode 100644 drivers/platform/x86/intel/pmc/Kconfig
>  create mode 100644 drivers/platform/x86/intel/pmc/Makefile
>  rename drivers/platform/x86/{ => intel/pmc}/intel_pmc_core.h (100%)
>  rename drivers/platform/x86/{intel_pmc_core.c => intel/pmc/pmc_core.c} (100%)
>  rename drivers/platform/x86/{intel_pmc_core_pltdrv.c => intel/pmc/pmc_core_pltdrv.c} (100%)
>  rename drivers/platform/x86/{intel_punit_ipc.c => intel/punit_ipc.c} (100%)
>  rename drivers/platform/x86/{intel-rst.c => intel/rst.c} (100%)
>  create mode 100644 drivers/platform/x86/intel/scu/Kconfig
>  create mode 100644 drivers/platform/x86/intel/scu/Makefile
>  rename drivers/platform/x86/{intel_scu_ipc.c => intel/scu/ipc.c} (100%)
>  rename drivers/platform/x86/{intel_scu_ipcutil.c => intel/scu/ipcutil.c} (100%)
>  rename drivers/platform/x86/{intel_scu_pcidrv.c => intel/scu/pcidrv.c} (100%)
>  rename drivers/platform/x86/{intel_scu_pltdrv.c => intel/scu/pltdrv.c} (100%)
>  rename drivers/platform/x86/{intel_scu_wdt.c => intel/scu/wdt.c} (100%)
>  rename drivers/platform/x86/{intel-smartconnect.c => intel/smartconnect.c} (100%)
>  rename drivers/platform/x86/{intel_speed_select_if => intel/speed_select_if}/Kconfig (100%)
>  rename drivers/platform/x86/{intel_speed_select_if => intel/speed_select_if}/Makefile (100%)
>  rename drivers/platform/x86/{intel_speed_select_if => intel/speed_select_if}/isst_if_common.c (100%)
>  rename drivers/platform/x86/{intel_speed_select_if => intel/speed_select_if}/isst_if_common.h (100%)
>  rename drivers/platform/x86/{intel_speed_select_if => intel/speed_select_if}/isst_if_mbox_msr.c (100%)
>  rename drivers/platform/x86/{intel_speed_select_if => intel/speed_select_if}/isst_if_mbox_pci.c (100%)
>  rename drivers/platform/x86/{intel_speed_select_if => intel/speed_select_if}/isst_if_mmio.c (100%)
>  create mode 100644 drivers/platform/x86/intel/telemetry/Kconfig
>  create mode 100644 drivers/platform/x86/intel/telemetry/Makefile
>  rename drivers/platform/x86/{intel_telemetry_core.c => intel/telemetry/core.c} (100%)
>  rename drivers/platform/x86/{intel_telemetry_debugfs.c => intel/telemetry/debugfs.c} (100%)
>  rename drivers/platform/x86/{intel_telemetry_pltdrv.c => intel/telemetry/pltdrv.c} (100%)
>  rename drivers/platform/x86/{intel_turbo_max_3.c => intel/turbo_max_3.c} (100%)
>  rename drivers/platform/x86/{intel-uncore-frequency.c => intel/uncore-frequency.c} (100%)
>  rename drivers/platform/x86/{intel-vbtn.c => intel/vbtn.c} (99%)
>  create mode 100644 drivers/platform/x86/intel/wmi/Kconfig
>  create mode 100644 drivers/platform/x86/intel/wmi/Makefile
>  rename drivers/platform/x86/{intel-wmi-sbl-fw-update.c => intel/wmi/sbl-fw-update.c} (100%)
>  rename drivers/platform/x86/{intel-wmi-thunderbolt.c => intel/wmi/thunderbolt.c} (100%)
> 

