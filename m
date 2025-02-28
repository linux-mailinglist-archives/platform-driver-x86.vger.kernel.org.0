Return-Path: <platform-driver-x86+bounces-9821-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32575A49440
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Feb 2025 10:01:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFED3A8A0E
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Feb 2025 09:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A954A1DDA20;
	Fri, 28 Feb 2025 09:00:59 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6F1A3158;
	Fri, 28 Feb 2025 09:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733259; cv=none; b=lU2er00CMreV+tIw4DQEtH9GTrMsgWoG5TqBBqS0/uCUHKlIJRI3ZYpYJ9EWLbkvUuT+L+F1Ip4GTOisj7W83TqCcrRHp1aHyOxTSRKsGxCDA8RWcrjIfQ9kmgImh03hjQmrsoQBAf2MF1lL8PT49OVJNHP3/L8chnuVqbUvjPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733259; c=relaxed/simple;
	bh=2XNDZh64fFOeannBOtG6YXR/pOy4ABoT3S8x1zYRQ1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SxJpxP4Y5RxJxdSa6QTBb2vVMY01kqiy66ky36U7o5oNkgbvav+dh4PTGKKzAoxvsF3cTW3TNsEU7qCpt/0FXn3euWh9qUNZoR9JdXx9PbaT2PAa44tIdgOIfXxD/viT22HWcejGT/vzclC+DqXWLNkjWSe9UzYmQxsiZcfdtz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [10.103.133.35] (unknown[123.114.236.251])
	by rmsmtp-lg-appmail-14-12003 (RichMail) with SMTP id 2ee367c17b3d57a-b1103;
	Fri, 28 Feb 2025 17:00:46 +0800 (CST)
X-RM-TRANSID:2ee367c17b3d57a-b1103
Message-ID: <01de1907-7b33-458e-b07f-b7d79f630564@139.com>
Date: Fri, 28 Feb 2025 17:00:45 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11] platform/x86:lenovo-wmi-hotkey-utilities.c:
 Supportfor mic and audio mute LEDs
To: Armin Wolf <W_Armin@gmx.de>, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 kuurtb@gmail.com, dongeg1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250222114532.4105-1-xy-jackie@139.com>
 <06516281-ae76-4354-a5f6-ce8d319e303c@gmx.de>
Content-Language: en-US
From: Jackie Dong <xy-jackie@139.com>
In-Reply-To: <06516281-ae76-4354-a5f6-ce8d319e303c@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/23/25 05:33, Armin Wolf wrote:
> Am 22.02.25 um 12:45 schrieb Jackie Dong:
> 
>> Implement Lenovo utility data WMI calls needed to make LEDs
>> work on Ideapads that support this GUID.
>> This enables the mic and audio LEDs to be updated correctly.
>>
>> Tested on below samples.
>> ThinkBook 13X Gen4 IMH
>> ThinkBook 14 G6 ABP
>> ThinkBook 16p Gen4-21J8
>> ThinkBook 16 G8 IRL
>> ThinkBook 16 G7+ ASP
> 
> Hi,
> 
> the whole patch looks good to me now.
> 
> Thanks,
> Armin Wolf
Hi all maintainers,
   First thanks comments and suggestion from Ilpo, Armin and Kurt. All 
of them are very helpful for me.
   Do you have any new comments or suggestion for this patch?

   Best Regards,
  Jackie Dong

> 
>> Signed-off-by: Jackie Dong <xy-jackie@139.com>
>> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Reviewed-by: Kurt Borja <kuurtb@gmail.com>
>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>
>> ---
>> Changes in v11:
>>   - Removed MODULE_INFO(depends, "wmi,ideapad-laptop")
>>
>> Changes in v10:
>>   - Using "imply" instead of "depends on" for CONFIG_IDEAPAD_LAPTOP
>>   - Drop led_reg_failed and call dev_err() directly
>>
>> Changes in v9:
>>   - Call devm_led_classdev_register() after the switch statement
>>   - Update struct wmi_driver with .name = "lenovo_wmi_hotkey_utilities"
>>
>> Changes in v8:
>>   - Update MAINTAINERS for this driver
>>   - Added Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>   - Added Reviewed-by: Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>>
>> Changes in v7:
>>   - Replaced spaces by tab for items in enum hotkey_set_feature
>>   - Directly return lenovo_super_hotkey_wmi_leds_setup(&wdev->dev)
>>   - Added Reviewed-by: Kurt Borja <kuurtb@gmail.com>
>>
>> Changes in v6:
>>   - Rename lenovo-super-hotkey-wmi.c to lenovo-wmi-hotkey-utilities
>>   - Update LENOVO_WMI_HOTKEY_UTILITIES item description and add select
>>     NEW_LEDS, LEDS_CLASS based on reviewer's suggestion.
>>   - Align items in enum hotkey_set_feature
>>   - Drop some brances and return error message directly
>>   - Check return value of lenovo_super_hotkey_wmi_led_init() in
>>     lenovo_super_hotkey_wmi_leds_setup
>>
>> Changes in v5:
>>   - Take out union acpi_object *obj __free(kfree) = output.pointer from
>>     if-else block
>>   - Remove lsk_wmi_context_lud_keys related source code
>>
>> Changes in v4:
>>   - Add related head files include cleanup.h, dev_printk.h, device.h,
>>     module.h
>>   - Replaced kfree() by __free()
>>   - Remove double free for obj
>>   - Remove wpriv->cdev[led_type].dev = dev
>>   - Remove *wpriv = *(const struct lenovo_super_hotkey_wmi_private 
>> *)context
>>   - Remove wpriv->event == LSH_WMI_EVENT_LUD_KEYS
>>   - Remove lenovo_super_hotkey_wmi_remove() for unnecessary
>>
>> Changes in v3:
>>   - Changed the name of the Kconfig entry to LENOVO_SUPER_HOTKEY_WMI
>>   - Renamed everything in this driver which contains the name "ideapad"
>>     to instead contain the name of this driver.
>>   - Moved struct wmi_device *led_wdev in lenovo_super_hotkey_wmi_private,
>>     and use container_of() to the led_wdev pointer.
>>   - Replaced sizeof(struct wmi_led_args) by sizeof(led_arg)
>>   - Added condtions checking for obj && obj->type == ACPI_TYPE_INTEGER
>>     and free the ACPI object after get the required value.
>>   - Removed led_classdev_unregister() after led_reg_failed label, but
>>     add lenovo_super_hotkey_wmi_remove(struct wmi_device *wdev) to free
>>     resource.
>>   - Removed IDEAPAD_WMI_EVENT_FN_KEYS/IDEAPAD_WMI_EVENT_LUD_KEYS related
>>     source codes and only keep LUD_WMI_METHOD_GUID.
>>
>> Changes in v2:
>>   - Update code layout and formatting as recommended in review
>>   - Improved error handling in ideapad_wmi_led_init
>>   - Separated a WMI driver named lenovo-super-hotkey-wmi.c from
>>     ideapad-lap.c, it's only for Lenovo Super Hotkey WMI devices.
>>
>>   MAINTAINERS                                   |   6 +
>>   drivers/platform/x86/Kconfig                  |  11 +
>>   drivers/platform/x86/Makefile                 |   1 +
>>   .../x86/lenovo-wmi-hotkey-utilities.c         | 212 ++++++++++++++++++
>>   4 files changed, 230 insertions(+)
>>   create mode 100644 drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 3864d473f52f..8588baacf137 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -13142,6 +13142,12 @@ S:    Maintained
>>   W:    http://legousb.sourceforge.net/
>>   F:    drivers/usb/misc/legousbtower.c
>>
>> +LENOVO WMI HOTKEY UTILITIES DRIVER
>> +M:    Jackie Dong <xy-jackie@139.com>
>> +L:    platform-driver-x86@vger.kernel.org
>> +S:    Maintained
>> +F:    drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>> +
>>   LETSKETCH HID TABLET DRIVER
>>   M:    Hans de Goede <hdegoede@redhat.com>
>>   L:    linux-input@vger.kernel.org
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 0258dd879d64..b5ac61a0f2fb 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -475,6 +475,17 @@ config IDEAPAD_LAPTOP
>>         This is a driver for Lenovo IdeaPad netbooks contains drivers for
>>         rfkill switch, hotkey, fan control and backlight control.
>>
>> +config LENOVO_WMI_HOTKEY_UTILITIES
>> +    tristate "Lenovo Hotkey Utility WMI extras driver"
>> +    depends on ACPI_WMI
>> +    select NEW_LEDS
>> +    select LEDS_CLASS
>> +    imply IDEAPAD_LAPTOP
>> +    help
>> +      This driver provides WMI support for Lenovo customized hotkeys 
>> function,
>> +      such as LED control for audio/mic mute event for Ideapad, YOGA, 
>> XiaoXin,
>> +      Gaming, ThinkBook and so on.
>> +
>>   config LENOVO_YMC
>>       tristate "Lenovo Yoga Tablet Mode Control"
>>       depends on ACPI_WMI
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/ 
>> Makefile
>> index e1b142947067..131fcf974477 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -61,6 +61,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>>   # IBM Thinkpad and Lenovo
>>   obj-$(CONFIG_IBM_RTL)        += ibm_rtl.o
>>   obj-$(CONFIG_IDEAPAD_LAPTOP)    += ideapad-laptop.o
>> +obj-$(CONFIG_LENOVO_WMI_HOTKEY_UTILITIES)    += lenovo-wmi-hotkey- 
>> utilities.o
>>   obj-$(CONFIG_LENOVO_YMC)    += lenovo-ymc.o
>>   obj-$(CONFIG_SENSORS_HDAPS)    += hdaps.o
>>   obj-$(CONFIG_THINKPAD_ACPI)    += thinkpad_acpi.o
>> diff --git a/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c b/ 
>> drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>> new file mode 100644
>> index 000000000000..89153afd7015
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
>> @@ -0,0 +1,212 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
>> + *
>> + *  Copyright (C) 2025    Lenovo
>> + */
>> +
>> +#include <linux/cleanup.h>
>> +#include <linux/dev_printk.h>
>> +#include <linux/device.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +/* Lenovo Super Hotkey WMI GUIDs */
>> +#define LUD_WMI_METHOD_GUID    "CE6C0974-0407-4F50-88BA-4FC3B6559AD8"
>> +
>> +/* Lenovo Utility Data WMI method_id */
>> +#define WMI_LUD_GET_SUPPORT 1
>> +#define WMI_LUD_SET_FEATURE 2
>> +
>> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
>> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
>> +
>> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
>> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
>> +
>> +/* Input parameters to mute/unmute audio LED and Mic LED */
>> +struct wmi_led_args {
>> +    u8 id;
>> +    u8 subid;
>> +    u16 value;
>> +};
>> +
>> +/* Values of input parameters to SetFeature of audio LED and Mic LED */
>> +enum hotkey_set_feature {
>> +    MIC_MUTE_LED_ON        = 1,
>> +    MIC_MUTE_LED_OFF    = 2,
>> +    AUDIO_MUTE_LED_ON    = 4,
>> +    AUDIO_MUTE_LED_OFF    = 5,
>> +};
>> +
>> +#define LSH_ACPI_LED_MAX 2
>> +
>> +struct lenovo_super_hotkey_wmi_private {
>> +    struct led_classdev cdev[LSH_ACPI_LED_MAX];
>> +    struct wmi_device *led_wdev;
>> +};
>> +
>> +enum mute_led_type {
>> +    MIC_MUTE,
>> +    AUDIO_MUTE,
>> +};
>> +
>> +static int lsh_wmi_mute_led_set(enum mute_led_type led_type, struct 
>> led_classdev *led_cdev,
>> +                enum led_brightness brightness)
>> +
>> +{
>> +    struct lenovo_super_hotkey_wmi_private *wpriv = 
>> container_of(led_cdev,
>> +            struct lenovo_super_hotkey_wmi_private, cdev[led_type]);
>> +    struct wmi_led_args led_arg = {0, 0, 0};
>> +    struct acpi_buffer input;
>> +    acpi_status status;
>> +
>> +    switch (led_type) {
>> +    case MIC_MUTE:
>> +        led_arg.id = brightness == LED_ON ? MIC_MUTE_LED_ON : 
>> MIC_MUTE_LED_OFF;
>> +        break;
>> +    case AUDIO_MUTE:
>> +        led_arg.id = brightness == LED_ON ? AUDIO_MUTE_LED_ON : 
>> AUDIO_MUTE_LED_OFF;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    input.length = sizeof(led_arg);
>> +    input.pointer = &led_arg;
>> +    status = wmidev_evaluate_method(wpriv->led_wdev, 0, 
>> WMI_LUD_SET_FEATURE, &input, NULL);
>> +    if (ACPI_FAILURE(status))
>> +        return -EIO;
>> +
>> +    return 0;
>> +}
>> +
>> +static int lsh_wmi_audiomute_led_set(struct led_classdev *led_cdev,
>> +                     enum led_brightness brightness)
>> +
>> +{
>> +    return lsh_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
>> +}
>> +
>> +static int lsh_wmi_micmute_led_set(struct led_classdev *led_cdev,
>> +                   enum led_brightness brightness)
>> +{
>> +    return lsh_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
>> +}
>> +
>> +static int lenovo_super_hotkey_wmi_led_init(enum mute_led_type 
>> led_type, struct device *dev)
>> +{
>> +    struct lenovo_super_hotkey_wmi_private *wpriv = 
>> dev_get_drvdata(dev);
>> +    struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>> +    struct acpi_buffer input;
>> +    int led_version, err = 0;
>> +    unsigned int wmiarg;
>> +    acpi_status status;
>> +
>> +    switch (led_type) {
>> +    case MIC_MUTE:
>> +        wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
>> +        break;
>> +    case AUDIO_MUTE:
>> +        wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>> +    input.length = sizeof(wmiarg);
>> +    input.pointer = &wmiarg;
>> +    status = wmidev_evaluate_method(wpriv->led_wdev, 0, 
>> WMI_LUD_GET_SUPPORT, &input, &output);
>> +    if (ACPI_FAILURE(status))
>> +        return -EIO;
>> +
>> +    union acpi_object *obj __free(kfree) = output.pointer;
>> +    if (obj && obj->type == ACPI_TYPE_INTEGER)
>> +        led_version = obj->integer.value;
>> +    else
>> +        return -EIO;
>> +
>> +    wpriv->cdev[led_type].max_brightness = LED_ON;
>> +    wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
>> +
>> +    switch (led_type) {
>> +    case MIC_MUTE:
>> +        if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER)
>> +            return -EIO;
>> +
>> +        wpriv->cdev[led_type].name = "platform::micmute";
>> +        wpriv->cdev[led_type].brightness_set_blocking = 
>> &lsh_wmi_micmute_led_set;
>> +        wpriv->cdev[led_type].default_trigger = "audio-micmute";
>> +        break;
>> +    case AUDIO_MUTE:
>> +        if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER)
>> +            return -EIO;
>> +
>> +        wpriv->cdev[led_type].name = "platform::mute";
>> +        wpriv->cdev[led_type].brightness_set_blocking = 
>> &lsh_wmi_audiomute_led_set;
>> +        wpriv->cdev[led_type].default_trigger = "audio-mute";
>> +        break;
>> +    default:
>> +        dev_err(dev, "Unknown LED type %d\n", led_type);
>> +        return -EINVAL;
>> +    }
>> +
>> +    err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
>> +    if (err < 0) {
>> +        dev_err(dev, "Could not register mute LED %d : %d\n", 
>> led_type, err);
>> +        return err;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int lenovo_super_hotkey_wmi_leds_setup(struct device *dev)
>> +{
>> +    int err;
>> +
>> +    err = lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev);
>> +    if (err)
>> +        return err;
>> +
>> +    err = lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev);
>> +    if (err)
>> +        return err;
>> +
>> +    return 0;
>> +}
>> +
>> +static int lenovo_super_hotkey_wmi_probe(struct wmi_device *wdev, 
>> const void *context)
>> +{
>> +    struct lenovo_super_hotkey_wmi_private *wpriv;
>> +
>> +    wpriv = devm_kzalloc(&wdev->dev, sizeof(*wpriv), GFP_KERNEL);
>> +    if (!wpriv)
>> +        return -ENOMEM;
>> +
>> +    dev_set_drvdata(&wdev->dev, wpriv);
>> +    wpriv->led_wdev = wdev;
>> +    return lenovo_super_hotkey_wmi_leds_setup(&wdev->dev);
>> +}
>> +
>> +static const struct wmi_device_id lenovo_super_hotkey_wmi_id_table[] = {
>> +    { LUD_WMI_METHOD_GUID, NULL }, /* Utility data */
>> +    { }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(wmi, lenovo_super_hotkey_wmi_id_table);
>> +
>> +static struct wmi_driver lenovo_wmi_hotkey_utilities_driver = {
>> +     .driver = {
>> +         .name = "lenovo_wmi_hotkey_utilities",
>> +         .probe_type = PROBE_PREFER_ASYNCHRONOUS
>> +     },
>> +     .id_table = lenovo_super_hotkey_wmi_id_table,
>> +     .probe = lenovo_super_hotkey_wmi_probe,
>> +     .no_singleton = true,
>> +};
>> +
>> +module_wmi_driver(lenovo_wmi_hotkey_utilities_driver);
>> +
>> +MODULE_AUTHOR("Jackie Dong <dongeg1@lenovo.com>");
>> +MODULE_DESCRIPTION("Lenovo Super Hotkey Utility WMI extras driver");
>> +MODULE_LICENSE("GPL");



