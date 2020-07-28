Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F4FA23158E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 00:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729628AbgG1Wc1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Jul 2020 18:32:27 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19266 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729223AbgG1Wc1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jul 2020 18:32:27 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f20a76d0000>; Tue, 28 Jul 2020 15:32:13 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 28 Jul 2020 15:32:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 28 Jul 2020 15:32:27 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 28 Jul
 2020 22:32:26 +0000
Subject: Re: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based backlight
 control
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     Aaron Plattner <aplattner@nvidia.com>
References: <20200727205703.28140-1-ddadap@nvidia.com>
 <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <90b12b28-b273-4c53-7ba4-56524628506b@nvidia.com>
Date:   Tue, 28 Jul 2020 17:34:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595975534; bh=6Vh76U4ORujiy1tWlIKcoZyly8L8LOBBxDIn1ziu1jA=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=XBHUD+nzpfDoYOcfwYzLCOgiP2CCzxMEQ6asREbB9zhnfeBqujBGySWeO1bMuycv3
         PXxlAyxCDWNFLw8BW74YTo2dOSIaLLeCt+g5OSRPKknSKU4w1V2eZ09AcVPvVVJNpB
         w3fcbIrgIspUsvGExMErKDjTMZmHDhGi7VAuFkAuxqbtQAKKMP4wFBLjjyp1x8p20j
         hwJPGNryF/QeT9R94f4XQK4U4i663X2MKgiq5VRodEixAhrDInc8Cjfo5BpFvFuWsV
         wxu/KYpqbsX+3KeomsFbR8DVeGSD5cN7OM5hZWV3OKAUhdaKwBprhGOGeAOQ791ZKZ
         05QZ1ZIR2oVWw==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 7/28/20 3:02 PM, Limonciello, Mario wrote:
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>> owner@vger.kernel.org> On Behalf Of Daniel Dadap
>> Sent: Monday, July 27, 2020 3:57 PM
>> To: platform-driver-x86@vger.kernel.org
>> Cc: Daniel Dadap; Aaron Plattner
>> Subject: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based backlight
>> control
>>
>>
>> [EXTERNAL EMAIL]
>>
>> A number of upcoming notebook computer designs drive the internal
>> display panel's backlight PWM through the Embedded Controller (EC).
>> This EC-based backlight control can be plumbed through to an ACPI
>> "WMAA" method interface, which in turn can be wrapped by WMI with
>> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>>
>> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
>> backlight class driver to control backlight levels on systems with
>> EC-driven backlights.
>>
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   MAINTAINERS                               |   6 +
>>   drivers/platform/x86/Kconfig              |  11 ++
>>   drivers/platform/x86/Makefile             |   2 +
>>   drivers/platform/x86/wmaa-backlight-wmi.c | 153 ++++++++++++++++++++++
>>   4 files changed, 172 insertions(+)
>>   create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index eeff55560759..e5ce6544a3c8 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -18249,6 +18249,12 @@ L:   linux-wireless@vger.kernel.org
>>   S:   Odd fixes
>>   F:   drivers/net/wireless/wl3501*
>>
>> +WMAA BACKLIGHT DRIVER
>> +M:   Daniel Dadap <ddadap@nvidia.com>
>> +L:   platform-driver-x86@vger.kernel.org
>> +S:   Supported
>> +F:   drivers/platform/x86/wmaa-backlight-wmi.c
>> +
>>   WOLFSON MICROELECTRONICS DRIVERS
>>   L:   patches@opensource.cirrus.com
>>   T:   git https://github.com/CirrusLogic/linux-drivers.git
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 0ad7ad8cf8e1..db342e480aa9 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1368,6 +1368,17 @@ config INTEL_TELEMETRY
>>          directly via debugfs files. Various tools may use
>>          this interface for SoC state monitoring.
>>
>> +config WMAA_BACKLIGHT_WMI
>> +     tristate "ACPI WMAA Backlight Driver"
>> +     depends on ACPI_WMI
>> +     depends on ACPI
>> +     depends on BACKLIGHT_CLASS_DEVICE
>> +     help
>> +       This driver provides a sysfs backlight interface for notebook
>> +       systems which expose the WMAA ACPI method and an associated WMI
>> +       wrapper to drive LCD backlight levels through the system's
>> +       Embedded Controller.
>> +
>>   endif # X86_PLATFORM_DEVICES
>>
>>   config PMC_ATOM
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 53408d965874..fb6e16d62031 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)             +=
>> intel_telemetry_core.o \
>>                                           intel_telemetry_pltdrv.o \
>>                                           intel_telemetry_debugfs.o
>>   obj-$(CONFIG_PMC_ATOM)                       += pmc_atom.o
>> +
>> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)     += wmaa-backlight-wmi.o
>> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c
>> b/drivers/platform/x86/wmaa-backlight-wmi.c
>> new file mode 100644
>> index 000000000000..890e9371f91a
>> --- /dev/null
>> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
>> @@ -0,0 +1,153 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * WMAA Backlight WMI driver
>> + *
>> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/backlight.h>
>> +
>> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
>> +MODULE_LICENSE("GPL v2");
>> +
>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>> +
>> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
>> +
>> +static struct backlight_device *backlight;
>> +
>> +enum wmaa_method {
>> +     WMAA_BRIGHTNESS_LEVEL = 1,
>> +     WMAA_BRIGHTNESS_SOURCE = 2,
>> +};
>> +
>> +enum wmaa_get_or_set {
>> +     WMAA_GET = 0,
>> +     WMAA_SET = 1,
>> +     WMAA_GET_MAX = 2, // for WMAA_BRIGHTNESS_LEVEL only
>> +};
>> +
>> +enum wmaa_source {
>> +     WMAA_SOURCE_CLEAR = 0,
>> +     WMAA_SOURCE_GPU = 1,
>> +     WMAA_SOURCE_EC = 2,
>> +     WMAA_SOURCE_AUX = 3,
>> +     WMAA_SOURCE_COUNT
>> +};
>> +
>> +struct wmaa_args {
>> +     u32 set;
>> +     u32 val;
>> +     u32 ret;
>> +     u32 ignored[3];
>> +};
>> +
>> +static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set set,
>> +                      u32 *val)
>> +{
>> +     struct wmaa_args args = {
>> +             .set = set,
>> +             .val = 0,
>> +             .ret = 0,
>> +     };
>> +     struct acpi_buffer buf = { (acpi_size)sizeof(args), &args };
>> +     acpi_status status;
>> +
>> +     if (set == WMAA_SET)
>> +             args.val = *val;
>> +
>> +     status = wmi_evaluate_method(WMAA_WMI_GUID, 0, method, &buf, &buf);
>> +     if (ACPI_FAILURE(status))
>> +             return status;
>> +     if (set != WMAA_SET)
>> +             *val = args.ret;
>> +     return status;
> Could you talk a little bit about why wmidev_evaluate_method didn't work for you here?
>
> I would expect that if you use wmidev in this code that there can be less boilerplate
> init code since more is handled by wmi.ko.
>

It's quite likely that it would work; we just didn't try it. I'll rework 
this code to use wmidev_evaluate_method while waiting for the answer 
about the scale and power attributes.


>> +}
>> +
>> +static int wmaa_get_brightness(u32 *level)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
>> +}
>> +
>> +static int wmaa_set_brightness(u32 level)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
>> +}
>> +
>> +static int wmaa_backlight_update_status(struct backlight_device *bd)
>> +{
>> +     return wmaa_set_brightness(bd->props.brightness);
>> +}
>> +
>> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
>> +{
>> +     u32 level;
>> +     int ret = wmaa_get_brightness(&level);
>> +
>> +     WARN_ON(ret != 0);
>> +     return level;
>> +}
>> +
>> +static const struct backlight_ops wmaa_backlight_ops = {
>> +     .update_status = wmaa_backlight_update_status,
>> +     .get_brightness = wmaa_backlight_get_brightness,
>> +};
>> +
>> +static int wmaa_get_max_brightness(u32 *level)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
>> +}
>> +
>> +static int wmaa_get_brightness_source(u32 *source)
>> +{
>> +     return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
>> +}
>> +
>> +static int __init wmaa_backlight_wmi_init(void)
>> +{
>> +     struct backlight_properties props;
>> +     u32 source;
>> +
>> +     if (!wmi_has_guid(WMAA_WMI_GUID))
>> +             return -ENODEV;
>> +
>> +     if (wmaa_get_brightness_source(&source))
>> +             return -EINVAL;
>> +     if (source != WMAA_SOURCE_EC)
>> +             return -ENODEV;
>> +
>> +     // Register a backlight handler
>> +     props.type = BACKLIGHT_PLATFORM;
>> +     if (wmaa_get_max_brightness(&props.max_brightness) ||
>> +         wmaa_get_brightness(&props.brightness))
>> +             return -EINVAL;
>> +
>> +     backlight = backlight_device_register("wmaa_backlight", NULL, NULL,
>> +                                           &wmaa_backlight_ops, &props);
>> +     if (IS_ERR(backlight))
>> +             return PTR_ERR(backlight);
>> +
>> +     return 0;
>> +}
>> +
>> +static void __exit wmaa_backlight_wmi_exit(void)
>> +{
>> +     backlight_device_unregister(backlight);
>> +}
>> +
>> +module_init(wmaa_backlight_wmi_init);
>> +module_exit(wmaa_backlight_wmi_exit);
>> --
>> 2.18.4
