Return-Path: <platform-driver-x86+bounces-479-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE8816D55
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Dec 2023 13:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A1D61C23715
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Dec 2023 12:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC3321B273;
	Mon, 18 Dec 2023 12:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cHwarTm5"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C52495E9
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 12:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702901151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eA0kIJqGuUxF1yjpOBgJ7mhW0Mb0bJtFwvciz8W+LTM=;
	b=cHwarTm5J3Ag7y1bEIRynROkbMNaq8xj8MiETd+4HI7MkrFw7Yj6LfyBelw6bHolFnnegd
	IjhqP+uEhzzYAicXSdn/XGE9xSHKYTZlH2zQsdKuTJKhOcjgIWcZKYboOQ7f2ITRpE7ltp
	s49WrLk0pQcwoqNtssSFaulBBfInttg=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-DgQt1qM1OOCNqCOr9F4pdA-1; Mon, 18 Dec 2023 07:05:50 -0500
X-MC-Unique: DgQt1qM1OOCNqCOr9F4pdA-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2cc433c0ba0so21565011fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 04:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702901149; x=1703505949;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eA0kIJqGuUxF1yjpOBgJ7mhW0Mb0bJtFwvciz8W+LTM=;
        b=Bl803pItBteNqQCHm2SWELsx5jNH9wkiyEgBOpNEJofs+S1lkzGcC5IT5jEYusQxIt
         BxeQhG/hgRa+BvqKeHslBY8MMuJQbVAsMnUwlAG85YvVTxPpwIxnfEJRIGpZUCX+TauG
         LYEJYoqbmVcuOWfeAQrEVDRr855IoYaf2RW2dVOSgxmRr+TkXBey8wd6Xd86gjZgmJAg
         PE7qJ2Wcixh/aG/7PrF4kb69Q5Qn5X2TRH95XYeGQctiyZg9PkVoY3BVufcSyUDGHbTR
         V02KPNxgN7Mn3jnP3mgAouyZfmwr/yXUHpCn7fxhKTHeN6N6rMl7fEA1UGGgIhUmJ9Fw
         Oezw==
X-Gm-Message-State: AOJu0Yyifyvq9C+HRZxwmIX+H5ums408EzyvQD0BQYD9DxZC7GqeW3hK
	KqmdIamtH8OGiciBhlAyGe3xrG5++IHDwfVZqk/YYdecLea3oNL4VaNCl2XLn2v8ge5UV/hu7H/
	c8J0hdX7evd4jTVpwjkfvAyJi9XHqTSpwtw==
X-Received: by 2002:a05:6512:3683:b0:50e:3377:a199 with SMTP id d3-20020a056512368300b0050e3377a199mr904840lfs.81.1702901149135;
        Mon, 18 Dec 2023 04:05:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeGzFdmdvLs8iP9LRyvzEpk4nRoTOU2QyPvvZrIkIkcjaSDD0pqDdK2GeQX6nzbhNSExHe1Q==
X-Received: by 2002:a05:6512:3683:b0:50e:3377:a199 with SMTP id d3-20020a056512368300b0050e3377a199mr904828lfs.81.1702901148821;
        Mon, 18 Dec 2023 04:05:48 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id o24-20020a1709061d5800b00a2350a75dc0sm1568390ejh.207.2023.12.18.04.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 04:05:48 -0800 (PST)
Message-ID: <a98c0c5a-caab-4cff-85de-b1b43c19b736@redhat.com>
Date: Mon, 18 Dec 2023 13:05:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/12] Introduce PMF Smart PC Solution Builder Feature
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212014705.2017474-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 02:46, Shyam Sundar S K wrote:
> Smart PC Solutions Builder allows for OEM to define a large number of
> custom system states to dynamically switch to. The system states are
> referred to as policies, and multiple policies can be loaded onto the
> system at any given time, however only one policy can be active at a
> given time.
> 
> Policy is a combination of PMF input and output capabilities. The inputs
> are the incoming information from the other kernel subsystems like LID
> state, Sensor info, GPU info etc and the actions are the updating the 
> power limits of SMU etc.
> 
> The policy binary is signed and encrypted by a special key from AMD. This
> policy binary shall have the inputs and outputs which the OEMs can build
> for the platform customization that can enhance the user experience and
> system behavior.
> 
> This series adds the initial support for Smart PC solution to PMF driver.
> 
> Note that, on platforms where CnQF and Smart PC is advertised, Smart PC
> shall have higher precedence and same applies for Auto Mode.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
> v6->v7:
> ---------
>  - handle buffer free during suspend/resume
>  - Move Smart PC checks within Smart PC init function
>  - realloc a updated buffer size during the side load.
>  - Drop patches from 13/15 to 15/15 of V6 series
> 
> v5->v6:
> ---------
>  - Add Ilpo's and Mario's Reviewed-by tags
>  - Drop 13/17 and 14/17 patches from this series which are GPU centric
>  - Drop separate checks for battery handling.
>  - Handle SFH failure cases
> 
> v4->v5:
> ---------
>  - Remove PMF-GPU interface from amdgpu driver and add DRM/backlight
>    changes within PMF
>  - Add module_softdep for AMDGPU
>  - remove error checks for debugfs_create_file()
>  - Add "Reviewed-by:" tags
>  - Add kerneldoc for kernel-wide headers
>  - Add checks for acpi_backlight_native
>  - Add early return for SFH path
>  - other cosmetic changes
>  
> v3->v4:
> ---------
> - Split v3 9/16 into 2 patches, that addresses using generic fn names
> - Add softdep [Ilpo] instead of request_module()
> - return proper ACPI status [Mario]
> - Update comments in code [Mario]
> - Remove missed double _ remarks
> - handle battery status branches [Ilpo]
> - Address KASAN problems 
> 
> v2->v3:
> ---------
> - Remove pci_get_device() for getting gpu handle
> - add .suspend handler for pmf driver
> - remove unwanted type caste
> - Align comments, spaces etc.
> - add wrapper for print_hex_dump_debug()
> - Remove lkp tags in commit-msg
> - Add macros for magic numbers
> - use right format specifiers for printing
> - propagate error codes back to the caller
> - remove unwanted comments
> 
> v1->v2:
> ---------
> - Remove __func__ macros
> - Remove manual function names inside prints
> - Handle tee_shm_get_va() failure
> - Remove double _
> - Add meaningful prints
> - pass amd_pmf_set_dram_addr() failure errors
> - Add more information to commit messages
> - use right format specifiers
> - use devm_ioremap() instead of ioremap()
> - address unsigned long vs u32 problems
> - Fix lkp reported issues
> - Add amd_pmf_remove_pb() to remove the debugfs files created(if any).
> - Make amd_pmf_open_pb() as static.
> - Add cooling device APIs for controlling amdgpu backlight
> - handle amd_pmf_apply_policies() failures
> - Split v1 14/15 into 2 patches further
> - use linux/units.h for better handling
> - add "depends on" AMD_SFH_HID for interaction with SFH
> - other cosmetic remarks
> 
> Shyam Sundar S K (12):
>   platform/x86/amd/pmf: Add PMF TEE interface
>   platform/x86/amd/pmf: Add support for PMF-TA interaction
>   platform/x86/amd/pmf: Change return type of amd_pmf_set_dram_addr()
>   platform/x86/amd/pmf: Add support for PMF Policy Binary
>   platform/x86/amd/pmf: change amd_pmf_init_features() call sequence
>   platform/x86/amd/pmf: Add support to get inputs from other subsystems
>   platform/x86/amd/pmf: Add support update p3t limit
>   platform/x86/amd/pmf: Add support to update system state
>   platform/x86/amd/pmf: Make source_as_str() as non-static
>   platform/x86/amd/pmf: Add facility to dump TA inputs
>   platform/x86/amd/pmf: Add capability to sideload of policy binary
>   platform/x86/amd/pmf: dump policy binary data
> 
>  Documentation/admin-guide/index.rst   |   1 +
>  Documentation/admin-guide/pmf.rst     |  24 ++
>  drivers/platform/x86/amd/pmf/Kconfig  |   1 +
>  drivers/platform/x86/amd/pmf/Makefile |   3 +-
>  drivers/platform/x86/amd/pmf/acpi.c   |  37 ++
>  drivers/platform/x86/amd/pmf/core.c   |  52 ++-
>  drivers/platform/x86/amd/pmf/pmf.h    | 203 +++++++++++
>  drivers/platform/x86/amd/pmf/spc.c    | 158 +++++++++
>  drivers/platform/x86/amd/pmf/sps.c    |   5 +-
>  drivers/platform/x86/amd/pmf/tee-if.c | 469 ++++++++++++++++++++++++++
>  10 files changed, 936 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/admin-guide/pmf.rst
>  create mode 100644 drivers/platform/x86/amd/pmf/spc.c
>  create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
> 


