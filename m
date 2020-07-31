Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5395234D49
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 23:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgGaVo1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 17:44:27 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19063 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgGaVoZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 17:44:25 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2490ab0000>; Fri, 31 Jul 2020 14:44:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 14:44:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 14:44:25 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 21:44:24 +0000
Subject: Re: [PATCH v2 1/2] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>
CC:     "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "aplattner@nvidia.com" <aplattner@nvidia.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
 <DM6PR19MB2636962A4EE9208D0C84A97AFA4E0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <00d54dd9-004b-3de2-cd13-ff45615bfdf6@nvidia.com>
Date:   Fri, 31 Jul 2020 16:45:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636962A4EE9208D0C84A97AFA4E0@DM6PR19MB2636.namprd19.prod.outlook.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596231852; bh=PR2ALVPqVLqZyMUnNyi4tfRDox2ruWyqjSja15eYJxI=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=TRXgxBoOHekBDswo+lXChqqLBjXO8v/+SOTVFuremWZpgviSW9pFSQNPHA9lxqjIK
         ytUln2xF3H8Ybj5WZfdCDrTqWjLfotneOwDu4rfSdCqDi/+0Tu7Jq2EUN6a4oSnzw8
         +9LJABPgCSP7DeqfCUDfX2/BIlnF877iG56y5QvOZNbDPYCXMhGEb/IWuXQyLX/dRs
         XkO2nIBt6xtwWrvmQu4IEoq+mefXWvx+wY93oM8qbpM4wsyhqPbohnu+McJTkUmBoA
         AFSeXxOZ3EkjKqlup/yxpTCBSQjdZz1CipDrYUWkljaZjX2f4Ccu5KhwywDOg56RXr
         PRyVcn2fvahxQ==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 7/31/20 3:51 PM, Limonciello, Mario wrote:
> External email: Use caution opening links or attachments
>
>
> Hi Dan,
>
>> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   MAINTAINERS                               |   6 +
>>   drivers/platform/x86/Kconfig              |  11 ++
>>   drivers/platform/x86/Makefile             |   2 +
>>   drivers/platform/x86/wmaa-backlight-wmi.c | 188 ++++++++++++++++++++++
>>   4 files changed, 207 insertions(+)
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
>> index 000000000000..65117082787d
>> --- /dev/null
>> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
>> @@ -0,0 +1,188 @@
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
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/backlight.h>
>> +#include <linux/wmi.h>
>> +
>> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
>> +MODULE_LICENSE("GPL v2");
>> +
>> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
>> +
>> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
> With switching to wmidev is MODULE_ALIAS actually still needed?


Yes, it appears to be necessary. After you pointed this out, I removed 
the MODULE_ALIAS line, rebuilt the kernel, and rebooted, and the driver 
is no longer automatically loaded. It seems other drivers that use the 
module_wmi_driver macro explicitly use MODULE_DEVICE_TABLE or 
MODULE_ALIAS as well. As a separate cleanup change, we can probably 
update the macro to also wrap MODULE_DEVICE_TABLE and remove the 
redundant MODULE_DEVICE_TABLE usage from users of the module_wmi_driver 
macro.


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
>> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] = {
>> +     { .guid_string = WMAA_WMI_GUID },
>> +     { },
>> +};
>> +
>> +static struct wmi_device *wdev;
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
>> +     status = wmidev_evaluate_method(wdev, 0, method, &buf, &buf);
>> +     if (ACPI_FAILURE(status)) {
>> +             pr_err("ACPI WMAA failed with %s\n",
>> +                     acpi_format_exception(status));
>> +             return -EIO;
>> +     }
>> +
>> +     if (set != WMAA_SET)
>> +             *val = args.ret;
>> +
>> +     return 0;
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
>> +     return ret == 0 ? level : 0;
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
>> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ctx)
>> +{
>> +     struct wmi_wmaa_priv *priv;
>> +     struct backlight_properties props = {0};
>> +     u32 source;
>> +
>> +     priv = devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
>> +     if(!priv)
>> +             return -ENOMEM;
>> +
>> +     wdev = w;
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
>> +     priv->backlight = backlight_device_register("wmaa_backlight",
>> +             NULL, NULL, &wmaa_backlight_ops, &props);
>> +     if (IS_ERR(priv->backlight))
>> +             return PTR_ERR(priv->backlight);
>> +
>> +     dev_set_drvdata(&w->dev, priv);
>> +
>> +     return 0;
>> +}
>> +
>> +static int wmaa_backlight_wmi_remove(struct wmi_device *wdev)
>> +{
>> +     struct wmi_wmaa_priv *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +     backlight_device_unregister(priv->backlight);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct wmi_driver wmaa_backlight_wmi_driver = {
>> +     .driver = {
>> +             .name = "wmaa-backlight",
>> +     },
>> +     .probe = wmaa_backlight_wmi_probe,
>> +     .remove = wmaa_backlight_wmi_remove,
>> +     .id_table = wmaa_backlight_wmi_id_table,
>> +};
>> +
>> +module_wmi_driver(wmaa_backlight_wmi_driver);
>> --
>> 2.18.4
