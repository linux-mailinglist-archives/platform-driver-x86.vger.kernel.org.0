Return-Path: <platform-driver-x86+bounces-5135-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CF69641F2
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Aug 2024 12:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8553BB26839
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Aug 2024 10:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29D0318EFF8;
	Thu, 29 Aug 2024 10:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaViTmdl"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7035D18E74E
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Aug 2024 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724927130; cv=none; b=Y5hijw2vJGFvcE4NkVsVFVTRL+f4UQNqBRu/oA8P7tg1ydn65ANbFA1ei1FuK8VhV3VMEJTNCHtuAzlUJQo0DS7ir1Z7a6LeQ3SEp3Rft5ZQm2PPGM93qydGYgsiPPxdl6ruXjqmWhGrpYfqW1PuihnHJfNUgctcy6NfT1EabOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724927130; c=relaxed/simple;
	bh=JF0eDhKuZ07Gi7a1fYQSvWMqVYnb07sEbGAHzKYo/3o=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pmyZT2XoqiHWZWpz+1wk40gxJ9lBWtKHFF6h9Ijxc/lGAyQj6o9StSF6L5Fa1RT50YocqYokYI83Fe3rz+nnHq7hoM//5wJ8uq3+6BsISEjiBtUjUjfeGrpUMA+RoYI8BouIDzeXciCb51zATZMAOqkcTxm0X7m+4dNHA9fTUxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaViTmdl; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724927127; x=1756463127;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JF0eDhKuZ07Gi7a1fYQSvWMqVYnb07sEbGAHzKYo/3o=;
  b=QaViTmdlC0/xumT1trofTw/LQ1sxm6cY2rPFBHH5xJc+svwu2nWSeEof
   cU7vPR5149xV/2ZS3qg7YBYm3yDNzCL4wxbBZRan3BAIBa8OGiuRNpYB1
   lZI9rIlx88njwgN7VlhNxNQnpuLLBtGAcLhbcsu2RMtBq0CKXc143IcS8
   qdLdxnenwj6XQYYQDj8CAm85YdQRSYfTws70QbCvFGiz3u3Ovtc6bOrJK
   Ncn5pf7FML/t/+CM3J5h4uefE6KTBmnDSfWXN4oZuj9IO+uCRTvU78AIP
   TrNRJgO+e7riFjMSZrt2Z+m04H/7LJpxlFPoEW6Ro5xYU1t87cwbQ8Zfy
   w==;
X-CSE-ConnectionGUID: 4SBwsemhTAqT2tSyNm0Tow==
X-CSE-MsgGUID: YflCqmikTHeJgsNMvg7XzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23372394"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="23372394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:25:26 -0700
X-CSE-ConnectionGUID: krx0as3XTgWFsV3OoiGwYA==
X-CSE-MsgGUID: msIXauzbRnCDRuqCcAwUAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; 
   d="scan'208";a="63730224"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 03:25:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 29 Aug 2024 13:25:20 +0300 (EEST)
To: Suma Hegde <suma.hegde@amd.com>
cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
    Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
Subject: Re: [v6 08/10] platform/x86/amd/hsmp: Create mutually exclusive ACPI
 and plat drivers
In-Reply-To: <20240829060617.1548658-8-suma.hegde@amd.com>
Message-ID: <9d0e3305-d957-621b-202e-5919b4aa6cb8@linux.intel.com>
References: <20240829060617.1548658-1-suma.hegde@amd.com> <20240829060617.1548658-8-suma.hegde@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Aug 2024, Suma Hegde wrote:

> Separate the probes for HSMP ACPI and platform device drivers.
> 
> Provide a Kconfig option to choose between
> ACPI or the platform device based driver.
> The common code which is the core part of the HSMP driver
> maintained at hsmp.c is guarded by AMD_HSMP config and is selected by
> these two driver configs.
> 
> Also add "|| COMPILE_TEST" clause in Kconfig to get build coverage
> for HSMP.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> ---
> Changes since v5:
> 1. Update documentation to reduce line length, update SPDK line and update the wordings.
> 2. Change module license from GPL v2 to GPL and update SPDX license line in plat.c and acpi.c.

Hi Suma,

Just to be sure you're not doing the SPDX license line change because of 
what I said, the change in MODULE_LICENSE() from "GPL v2" -> "GPL" by no 
means implies SPDX license has to be changed from "GPL-2.0" to 
"GPL-2.0-or-later".

I'm sorry about the confusion I might have caused.

If I've understood correctly, MODULE_LICENSE()'s value is mainly used to 
determine eg. which exports (if the _GPL EXPORTs can be used) can be 
used and taint flags, and that does not require knowing exact GPL version 
so it was simplified to "GPL" long time ago w/o requirement to change the 
oldones (to avoid unnecessary churn).

> 3. Update Kconfig with amd_hsmp.rst document name.
> 
> Changes since v4:
> 1. Update commit description.
> 2. Move common code from plat.c and acpi.c to hsmp.c and name it as hsmp_misc_register()
>    and hsmp_misc_deregister().
> 3. Reduce line size in documentation.
> 4. Remove check_acpi_support() related code.
> 
> Changes since v3:
> 1. Added documentation for ACPI object.
> 2. Kconfig is updated.
> 3. Added COMPILE_TEST clause in Kconfig.
> 
> Changes since v2:
> Following files are modified to add new symbol
>  - drivers/platform/x86/amd/hsmp/Kconfig, 
>  - drivers/platform/x86/amd/hsmp/Makefile
>  - drivers/platform/x86/amd/Makefile
> AMD_HSMP is used as common symbol and new AMD_HSMP_PLAT symbol is added
> 
> Changes since v1:
> Rename "plat_dev" to "hsmp_pdev"
> 
>  Documentation/arch/x86/amd_hsmp.rst    |  69 +++++++-
>  arch/x86/include/asm/amd_hsmp.h        |   2 +-
>  drivers/platform/x86/amd/Makefile      |   2 +-
>  drivers/platform/x86/amd/hsmp/Kconfig  |  37 ++++-
>  drivers/platform/x86/amd/hsmp/Makefile |   6 +-
>  drivers/platform/x86/amd/hsmp/acpi.c   |  84 +++++++++-
>  drivers/platform/x86/amd/hsmp/hsmp.c   | 212 ++-----------------------
>  drivers/platform/x86/amd/hsmp/hsmp.h   |   8 +-
>  drivers/platform/x86/amd/hsmp/plat.c   | 146 ++++++++++++++++-
>  9 files changed, 345 insertions(+), 221 deletions(-)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 1e499ecf5f4e..d30ed490e6d3 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -1,11 +1,12 @@
> -.. SPDX-License-Identifier: GPL-2.0
> +.. SPDX-License-Identifier: GPL-2.0-or-later
>  
>  ============================================
>  AMD HSMP interface
>  ============================================
>  
> -Newer Fam19h EPYC server line of processors from AMD support system
> -management functionality via HSMP (Host System Management Port).
> +Newer Fam19h(model 0x00-0x1f, 0x30-0x3f, 0x90-0x9f, 0xa0-0xaf),
> +Fam1Ah(model 0x00-0x1f) EPYC server line of processors from AMD support
> +system management functionality via HSMP (Host System Management Port).
>  
>  The Host System Management Port (HSMP) is an interface to provide
>  OS-level software with access to system management functions via a
> @@ -16,14 +17,25 @@ More details on the interface can be found in chapter
>  Eg: https://www.amd.com/content/dam/amd/en/documents/epyc-technical-docs/programmer-references/55898_B1_pub_0_50.zip
>  
>  
> -HSMP interface is supported on EPYC server CPU models only.
> +HSMP interface is supported on EPYC line of server CPUs and MI300A (APU).
>  
>  
>  HSMP device
>  ============================================
>  
> -amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
> -/dev/hsmp to let user space programs run hsmp mailbox commands.
> +amd_hsmp driver under drivers/platforms/x86/amd/hsmp/ has separate
> +driver files for ACPI object based probing and platform device based probing.
> +These two drivers are mutually exclusive drivers with compile
> +time Kconfig options to choose between them.
> +Both drivers create the miscdevice /dev/hsmp to let user space programs run
> +hsmp mailbox commands.

This, while now limited to 80 chars is not flowing nicely as some lines 
are much shorter. Please reflow the entire paragraph properly.

> +
> +The ACPI object format supported by the driver is defined below.
> +
> +Kconfig option CONFIG_AMD_HSMP compiles plat.c + hsmp.c
> +for platform device based probing.
> +Kconfig option CONFIG_AMD_HSMP_ACPI compiles acpi.c + hsmp.c
> +for ACPI object based probing.
>  
>  $ ls -al /dev/hsmp
>  crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
> @@ -59,6 +71,51 @@ Note: lseek() is not supported as entire metrics table is read.
>  Metrics table definitions will be documented as part of Public PPR.
>  The same is defined in the amd_hsmp.h header.
>  
> +ACPI device object format
> +=========================
> +The ACPI object format expected from the amd_hsmp driver
> +for socket with ID00 is given below.
> +
> +Device(HSMP)
> +		{
> +			Name(_HID, "AMDI0097")
> +			Name(_UID, "ID00")
> +			Name(HSE0, 0x00000001)
> +			Name(RBF0, ResourceTemplate()
> +			{
> +				Memory32Fixed(ReadWrite, 0xxxxxxx, 0x00100000)
> +			})
> +			Method(_CRS, 0, NotSerialized)
> +			{
> +				Return(RBF0)
> +			}
> +			Method(_STA, 0, NotSerialized)
> +			{
> +				If(LEqual(HSE0, One))
> +				{
> +					Return(0x0F)
> +				}
> +				Else
> +				{
> +					Return(Zero)
> +				}
> +			}
> +			Name(_DSD, Package(2)
> +			{
> +				Buffer(0x10)
> +				{
> +					0x9D, 0x61, 0x4D, 0xB7, 0x07, 0x57, 0xBD, 0x48,
> +					0xA6, 0x9F, 0x4E, 0xA2, 0x87, 0x1F, 0xC2, 0xF6
> +				},
> +				Package(3)
> +				{
> +					Package(2) {"MsgIdOffset", 0x00010934},
> +					Package(2) {"MsgRspOffset", 0x00010980},
> +					Package(2) {"MsgArgOffset", 0x000109E0}
> +				}
> +			})
> +		}
> +
>  
>  An example
>  ==========
> diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
> index 03c2ce3edaf5..ada14e55f9f4 100644
> --- a/arch/x86/include/asm/amd_hsmp.h
> +++ b/arch/x86/include/asm/amd_hsmp.h
> @@ -5,7 +5,7 @@
>  
>  #include <uapi/asm/amd_hsmp.h>
>  
> -#if IS_ENABLED(CONFIG_AMD_HSMP)
> +#if IS_ENABLED(CONFIG_AMD_HSMP) || IS_ENABLED(CONFIG_AMD_HSMP_ACPI)
>  int hsmp_send_message(struct hsmp_message *msg);
>  #else
>  static inline int hsmp_send_message(struct hsmp_message *msg)
> diff --git a/drivers/platform/x86/amd/Makefile b/drivers/platform/x86/amd/Makefile
> index 96ec24c8701b..f0b2fe81c685 100644
> --- a/drivers/platform/x86/amd/Makefile
> +++ b/drivers/platform/x86/amd/Makefile
> @@ -5,6 +5,6 @@
>  #
>  
>  obj-$(CONFIG_AMD_PMC)		+= pmc/
> -obj-y				+= hsmp/
> +obj-$(CONFIG_AMD_HSMP)		+= hsmp/
>  obj-$(CONFIG_AMD_PMF)		+= pmf/
>  obj-$(CONFIG_AMD_WBRF)		+= wbrf.o
> diff --git a/drivers/platform/x86/amd/hsmp/Kconfig b/drivers/platform/x86/amd/hsmp/Kconfig
> index b55d4ed9bceb..b10ff91e9f5a 100644
> --- a/drivers/platform/x86/amd/hsmp/Kconfig
> +++ b/drivers/platform/x86/amd/hsmp/Kconfig
> @@ -4,14 +4,45 @@
>  #
>  
>  config AMD_HSMP
> -	tristate "AMD HSMP Driver"
> -	depends on AMD_NB && X86_64 && ACPI
> +	tristate
> +
> +menu "AMD HSMP Driver"
> +	depends on AMD_NB || COMPILE_TEST
> +
> +config AMD_HSMP_ACPI
> +	tristate "AMD HSMP ACPI device driver"
> +	depends on ACPI
> +	select AMD_HSMP
>  	help
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
>  	  The driver provides a way for user space tools to monitor and manage
> -	  system management functionality on EPYC server CPUs from AMD.
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports ACPI based probing.
> +	  You may enable this, if your platform BIOS provides an ACPI object
> +	  as described in amd_hsmp.rst document.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
>  
> +config AMD_HSMP_PLAT
> +	tristate "AMD HSMP platform device driver"
> +	depends on AMD_HSMP_ACPI=n
> +	select AMD_HSMP
> +	help
>  	  Host System Management Port (HSMP) interface is a mailbox interface
>  	  between the x86 core and the System Management Unit (SMU) firmware.
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC and MI300A server CPUs
> +	  from AMD.
> +
> +	  This option supports platform device based probing.
> +	  You may enable this, if your platform BIOS does not provide
> +	  HSMP ACPI object.
>  
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd_hsmp.
> +
> +endmenu
> diff --git a/drivers/platform/x86/amd/hsmp/Makefile b/drivers/platform/x86/amd/hsmp/Makefile
> index 0cc92865c0a2..18d9a0d1e8c5 100644
> --- a/drivers/platform/x86/amd/hsmp/Makefile
> +++ b/drivers/platform/x86/amd/hsmp/Makefile
> @@ -4,5 +4,7 @@
>  # AMD HSMP Driver
>  #
>  
> -obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
> -amd_hsmp-objs			:= hsmp.o plat.o acpi.o
> +obj-$(CONFIG_AMD_HSMP)			+= amd_hsmp.o
> +amd_hsmp-objs				:= hsmp.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_PLAT)	+= plat.o
> +amd_hsmp-$(CONFIG_AMD_HSMP_ACPI)	+= acpi.o
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 6f8e7962266a..196c5eaa2ac7 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * AMD HSMP Platform Driver
>   * Copyright (c) 2024, AMD.
> @@ -9,11 +9,15 @@
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
> +#include <asm/amd_nb.h>
> +
>  #include <linux/acpi.h>
>  #include <linux/device.h>
>  #include <linux/dev_printk.h>
>  #include <linux/ioport.h>
>  #include <linux/kstrtox.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  #include <linux/uuid.h>
>  
> @@ -21,6 +25,10 @@
>  
>  #include "hsmp.h"
>  
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> +
>  /* These are the strings specified in ACPI table */
>  #define MSG_IDOFF_STR		"MsgIdOffset"
>  #define MSG_ARGOFF_STR		"MsgArgOffset"
> @@ -200,7 +208,6 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	sock->sock_ind		= sock_ind;
>  	sock->dev		= dev;
>  	sock->amd_hsmp_rdwr	= amd_hsmp_acpi_rdwr;
> -	hsmp_pdev.is_acpi_device	= true;
>  
>  	sema_init(&sock->hsmp_sem, 1);
>  
> @@ -213,7 +220,7 @@ static int hsmp_parse_acpi_table(struct device *dev, u16 sock_ind)
>  	return hsmp_read_acpi_dsd(sock);
>  }
>  
> -int hsmp_create_acpi_sysfs_if(struct device *dev)
> +static int hsmp_create_acpi_sysfs_if(struct device *dev)
>  {
>  	struct attribute_group *attr_grp;
>  	u16 sock_ind;
> @@ -236,7 +243,7 @@ int hsmp_create_acpi_sysfs_if(struct device *dev)
>  	return devm_device_add_group(dev, attr_grp);
>  }
>  
> -int init_acpi(struct device *dev)
> +static int init_acpi(struct device *dev)
>  {
>  	u16 sock_ind;
>  	int ret;
> @@ -270,3 +277,72 @@ int init_acpi(struct device *dev)
>  
>  	return ret;
>  }
> +
> +static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> +	{ACPI_HSMP_DEVICE_HID, 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> +
> +static int hsmp_acpi_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	if (!hsmp_pdev.is_probed) {
> +		hsmp_pdev.num_sockets = amd_nb_num();
> +		if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> +			return -ENODEV;
> +
> +		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +					      sizeof(*hsmp_pdev.sock),
> +					      GFP_KERNEL);
> +		if (!hsmp_pdev.sock)
> +			return -ENOMEM;
> +	}
> +
> +	ret = init_acpi(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to initialize HSMP interface.\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +
> +	if (!hsmp_pdev.is_probed) {
> +		ret = hsmp_misc_register(&pdev->dev);
> +		if (ret)
> +			return ret;
> +		hsmp_pdev.is_probed = true;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hsmp_acpi_remove(struct platform_device *pdev)
> +{
> +	/*
> +	 * We register only one misc_device even on multi-socket system.
> +	 * So, deregister should happen only once.
> +	 */
> +	if (hsmp_pdev.is_probed) {
> +		hsmp_misc_deregister();
> +		hsmp_pdev.is_probed = false;
> +	}
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_acpi_probe,
> +	.remove_new	= hsmp_acpi_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +		.acpi_match_table = amd_hsmp_acpi_ids,
> +	},
> +};
> +
> +module_platform_driver(amd_hsmp_driver);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.c b/drivers/platform/x86/amd/hsmp/hsmp.c
> index 78945750d590..5e0c9c36f435 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.c
> @@ -15,17 +15,11 @@
>  #include <linux/acpi.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> -#include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/semaphore.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
>  
> -#define DRIVER_NAME		"amd_hsmp"
> -#define DRIVER_VERSION		"2.2"
> -#define ACPI_HSMP_DEVICE_HID	"AMDI0097"
> -
>  /* HSMP Status / Error codes */
>  #define HSMP_STATUS_NOT_READY	0x00
>  #define HSMP_STATUS_OK		0x01
> @@ -228,7 +222,7 @@ int hsmp_test(u16 sock_ind, u32 value)
>  	return ret;
>  }
>  
> -static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  {
>  	int __user *arguser = (int  __user *)arg;
>  	struct hsmp_message msg = { 0 };
> @@ -284,12 +278,6 @@ static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>  	return 0;
>  }
>  
> -static const struct file_operations hsmp_fops = {
> -	.owner		= THIS_MODULE,
> -	.unlocked_ioctl	= hsmp_ioctl,
> -	.compat_ioctl	= hsmp_ioctl,
> -};
> -
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count)
> @@ -414,193 +402,25 @@ int hsmp_cache_proto_ver(u16 sock_ind)
>  	return ret;
>  }
>  
> -static const struct acpi_device_id amd_hsmp_acpi_ids[] = {
> -	{ACPI_HSMP_DEVICE_HID, 0},
> -	{}
> -};
> -MODULE_DEVICE_TABLE(acpi, amd_hsmp_acpi_ids);
> -
> -static bool check_acpi_support(struct device *dev)
> -{
> -	struct acpi_device *adev = ACPI_COMPANION(dev);
> -
> -	if (adev && !acpi_match_device_ids(adev, amd_hsmp_acpi_ids))
> -		return true;
> -
> -	return false;
> -}
> -
> -static int hsmp_pltdrv_probe(struct platform_device *pdev)
> -{
> -	int ret;
> -
> -	/*
> -	 * On ACPI supported BIOS, there is an ACPI HSMP device added for
> -	 * each socket, so the per socket probing, but the memory allocated for
> -	 * sockets should be contiguous to access it as an array,
> -	 * Hence allocate memory for all the sockets at once instead of allocating
> -	 * on each probe.
> -	 */
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> -					      sizeof(*hsmp_pdev.sock),
> -					      GFP_KERNEL);
> -		if (!hsmp_pdev.sock)
> -			return -ENOMEM;
> -	}
> -	if (check_acpi_support(&pdev->dev)) {
> -		ret = init_acpi(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -	} else {
> -		ret = init_platform_device(&pdev->dev);
> -		if (ret) {
> -			dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> -			return ret;
> -		}
> -		ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> -		if (ret)
> -			dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> -	}
> -
> -	if (!hsmp_pdev.is_probed) {
> -		hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> -		hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> -		hsmp_pdev.mdev.fops	= &hsmp_fops;
> -		hsmp_pdev.mdev.parent	= &pdev->dev;
> -		hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> -		hsmp_pdev.mdev.mode	= 0644;
> -
> -		ret = misc_register(&hsmp_pdev.mdev);
> -		if (ret)
> -			return ret;
> -
> -		hsmp_pdev.is_probed = true;
> -	}
> -
> -	return 0;
> -
> -}
> -
> -static void hsmp_pltdrv_remove(struct platform_device *pdev)
> -{
> -	/*
> -	 * We register only one misc_device even on multi socket system.
> -	 * So, deregister should happen only once.
> -	 */
> -	if (hsmp_pdev.is_probed) {
> -		misc_deregister(&hsmp_pdev.mdev);
> -		hsmp_pdev.is_probed = false;
> -	}
> -}
> -
> -static struct platform_driver amd_hsmp_driver = {
> -	.probe		= hsmp_pltdrv_probe,
> -	.remove_new	= hsmp_pltdrv_remove,
> -	.driver		= {
> -		.name	= DRIVER_NAME,
> -		.acpi_match_table = amd_hsmp_acpi_ids,
> -	},
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
>  };
>  
> -static struct platform_device *amd_hsmp_platdev;
> -
> -static int hsmp_plat_dev_register(void)
> +int hsmp_misc_register(struct device *dev)
>  {
> -	int ret;
> -
> -	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> -	if (!amd_hsmp_platdev)
> -		return -ENOMEM;
> -
> -	ret = platform_device_add(amd_hsmp_platdev);
> -	if (ret)
> -		platform_device_put(amd_hsmp_platdev);
> -
> -	return ret;
> +	hsmp_pdev.mdev.name	= HSMP_CDEV_NAME;
> +	hsmp_pdev.mdev.minor	= MISC_DYNAMIC_MINOR;
> +	hsmp_pdev.mdev.fops	= &hsmp_fops;
> +	hsmp_pdev.mdev.parent	= dev;
> +	hsmp_pdev.mdev.nodename	= HSMP_DEVNODE_NAME;
> +	hsmp_pdev.mdev.mode	= 0644;
> +
> +	return misc_register(&hsmp_pdev.mdev);
>  }
>  
> -/*
> - * This check is only needed for backward compatibility of previous platforms.
> - * All new platforms are expected to support ACPI based probing.
> - */
> -static bool legacy_hsmp_support(void)
> +void hsmp_misc_deregister(void)
>  {
> -	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> -		return false;
> -
> -	switch (boot_cpu_data.x86) {
> -	case 0x19:
> -		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> -		case 0x30 ... 0x3F:
> -		case 0x90 ... 0x9F:
> -		case 0xA0 ... 0xAF:
> -			return true;
> -		default:
> -			return false;
> -		}
> -	case 0x1A:
> -		switch (boot_cpu_data.x86_model) {
> -		case 0x00 ... 0x1F:
> -			return true;
> -		default:
> -			return false;
> -		}
> -	default:
> -		return false;
> -	}
> -
> -	return false;
> +	misc_deregister(&hsmp_pdev.mdev);
>  }
> -
> -static int __init hsmp_plt_init(void)
> -{
> -	int ret = -ENODEV;
> -
> -	/*
> -	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> -	 * if we have N SMN/DF interfaces that ideally means N sockets
> -	 */
> -	hsmp_pdev.num_sockets = amd_nb_num();
> -	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> -		return ret;
> -
> -	ret = platform_driver_register(&amd_hsmp_driver);
> -	if (ret)
> -		return ret;
> -
> -	if (!hsmp_pdev.is_acpi_device) {
> -		if (legacy_hsmp_support()) {
> -			/* Not ACPI device, but supports HSMP, register a plat_dev */
> -			ret = hsmp_plat_dev_register();
> -		} else {
> -			/* Not ACPI, Does not support HSMP */
> -			pr_info("HSMP is not supported on Family:%x model:%x\n",
> -				boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			ret = -ENODEV;
> -		}
> -		if (ret)
> -			platform_driver_unregister(&amd_hsmp_driver);
> -	}
> -
> -	return ret;
> -}
> -
> -static void __exit hsmp_plt_exit(void)
> -{
> -	platform_device_unregister(amd_hsmp_platdev);
> -	platform_driver_unregister(&amd_hsmp_driver);
> -}
> -
> -device_initcall(hsmp_plt_init);
> -module_exit(hsmp_plt_exit);
> -
> -MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> -MODULE_VERSION(DRIVER_VERSION);
> -MODULE_LICENSE("GPL v2");
> diff --git a/drivers/platform/x86/amd/hsmp/hsmp.h b/drivers/platform/x86/amd/hsmp/hsmp.h
> index 9c5b9c263fc1..9ab50bc74676 100644
> --- a/drivers/platform/x86/amd/hsmp/hsmp.h
> +++ b/drivers/platform/x86/amd/hsmp/hsmp.h
> @@ -52,7 +52,6 @@ struct hsmp_plat_device {
>  	struct hsmp_socket *sock;
>  	u32 proto_ver;
>  	u16 num_sockets;
> -	bool is_acpi_device;
>  	bool is_probed;
>  };
>  
> @@ -61,14 +60,13 @@ extern struct hsmp_plat_device hsmp_pdev;
>  ssize_t hsmp_metric_tbl_read(struct file *filp, struct kobject *kobj,
>  			     struct bin_attribute *bin_attr, char *buf,
>  			     loff_t off, size_t count);
> -int hsmp_create_non_acpi_sysfs_if(struct device *dev);
> -int hsmp_create_acpi_sysfs_if(struct device *dev);
>  int hsmp_cache_proto_ver(u16 sock_ind);
>  umode_t hsmp_is_sock_attr_visible(struct kobject *kobj,
>  				  struct bin_attribute *battr, int id);
>  int hsmp_create_attr_list(struct attribute_group *attr_grp,
>  			  struct device *dev, u16 sock_ind);
>  int hsmp_test(u16 sock_ind, u32 value);
> -int init_platform_device(struct device *dev);
> -int init_acpi(struct device *dev);
> +long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg);
> +void hsmp_misc_deregister(void);
> +int hsmp_misc_register(struct device *dev);
>  #endif /* HSMP_H */
> diff --git a/drivers/platform/x86/amd/hsmp/plat.c b/drivers/platform/x86/amd/hsmp/plat.c
> index e18cf82478a0..be5bb8fe346c 100644
> --- a/drivers/platform/x86/amd/hsmp/plat.c
> +++ b/drivers/platform/x86/amd/hsmp/plat.c
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +// SPDX-License-Identifier: GPL-2.0-or-later
>  /*
>   * AMD HSMP Platform Driver
>   * Copyright (c) 2024, AMD.
> @@ -12,11 +12,16 @@
>  #include <asm/amd_nb.h>
>  
>  #include <linux/device.h>
> +#include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/platform_device.h>
>  #include <linux/sysfs.h>
>  
>  #include "hsmp.h"
>  
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"2.3"
> +
>  /*
>   * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>   * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
> @@ -50,7 +55,13 @@ static int amd_hsmp_pci_rdwr(struct hsmp_socket *sock, u32 offset,
>  	return ret;
>  }
>  
> -int hsmp_create_non_acpi_sysfs_if(struct device *dev)
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
> +};
> +
> +static int hsmp_create_non_acpi_sysfs_if(struct device *dev)
>  {
>  	const struct attribute_group **hsmp_attr_grps;
>  	struct attribute_group *attr_grp;
> @@ -88,7 +99,7 @@ static inline bool is_f1a_m0h(void)
>  	return false;
>  }
>  
> -int init_platform_device(struct device *dev)
> +static int init_platform_device(struct device *dev)
>  {
>  	struct hsmp_socket *sock;
>  	int ret, i;
> @@ -134,3 +145,132 @@ int init_platform_device(struct device *dev)
>  
>  	return 0;
>  }
> +
> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
> +{
> +	int ret;
> +
> +	hsmp_pdev.sock = devm_kcalloc(&pdev->dev, hsmp_pdev.num_sockets,
> +				      sizeof(*hsmp_pdev.sock),
> +				      GFP_KERNEL);
> +	if (!hsmp_pdev.sock)
> +		return -ENOMEM;
> +
> +	ret = init_platform_device(&pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to init HSMP mailbox\n");
> +		return ret;
> +	}
> +
> +	ret = hsmp_create_non_acpi_sysfs_if(&pdev->dev);
> +	if (ret)
> +		dev_err(&pdev->dev, "Failed to create HSMP sysfs interface\n");
> +
> +	return hsmp_misc_register(&pdev->dev);
> +}
> +
> +static void hsmp_pltdrv_remove(struct platform_device *pdev)
> +{
> +	hsmp_misc_deregister();
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_pltdrv_probe,
> +	.remove_new	= hsmp_pltdrv_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +	},
> +};
> +
> +static struct platform_device *amd_hsmp_platdev;
> +
> +static int hsmp_plat_dev_register(void)
> +{
> +	int ret;
> +
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, PLATFORM_DEVID_NONE);
> +	if (!amd_hsmp_platdev)
> +		return -ENOMEM;
> +
> +	ret = platform_device_add(amd_hsmp_platdev);
> +	if (ret)
> +		platform_device_put(amd_hsmp_platdev);
> +
> +	return ret;
> +}
> +
> +/*
> + * This check is only needed for backward compatibility of previous platforms.
> + * All new platforms are expected to support ACPI based probing.
> + */
> +static bool legacy_hsmp_support(void)
> +{
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
> +		return false;
> +
> +	switch (boot_cpu_data.x86) {
> +	case 0x19:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +		case 0x30 ... 0x3F:
> +		case 0x90 ... 0x9F:
> +		case 0xA0 ... 0xAF:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	case 0x1A:
> +		switch (boot_cpu_data.x86_model) {
> +		case 0x00 ... 0x1F:
> +			return true;
> +		default:
> +			return false;
> +		}
> +	default:
> +		return false;
> +	}
> +
> +	return false;
> +}
> +
> +static int __init hsmp_plt_init(void)
> +{
> +	int ret = -ENODEV;
> +
> +	if (!legacy_hsmp_support()) {
> +		pr_info("HSMP is not supported on Family:%x model:%x\n",
> +			boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		return ret;
> +	}
> +
> +	/*
> +	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> +	 * if we have N SMN/DF interfaces that ideally means N sockets
> +	 */
> +	hsmp_pdev.num_sockets = amd_nb_num();
> +	if (hsmp_pdev.num_sockets == 0 || hsmp_pdev.num_sockets > MAX_AMD_SOCKETS)
> +		return ret;
> +
> +	ret = platform_driver_register(&amd_hsmp_driver);
> +	if (ret)
> +		return ret;
> +
> +	ret = hsmp_plat_dev_register();
> +	if (ret)
> +		platform_driver_unregister(&amd_hsmp_driver);
> +
> +	return ret;
> +}
> +
> +static void __exit hsmp_plt_exit(void)
> +{
> +	platform_device_unregister(amd_hsmp_platdev);
> +	platform_driver_unregister(&amd_hsmp_driver);
> +}
> +
> +device_initcall(hsmp_plt_init);
> +module_exit(hsmp_plt_exit);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL");

The code change looks fine but please consider what I said about the 
SPDX lines above (I didn't mean you are expected to change the SPDX lines 
just because MODULE_LICENSE() now says "GPL" instead of "GPL v2").

-- 
 i.


