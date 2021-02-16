Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87C0931C6A1
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Feb 2021 07:50:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhBPGtX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 16 Feb 2021 01:49:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhBPGtR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Feb 2021 01:49:17 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90964C061574;
        Mon, 15 Feb 2021 22:48:36 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id j11so8141227wmi.3;
        Mon, 15 Feb 2021 22:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=mzuKjJ7CDBbJuBrMl5D6+u4m41tZ8SAtaNdL7g3FQ/k=;
        b=URRL00s96doKC+aKXYyXO0CZ5oMT1YsCMjGPHddZJ0iG848wRVhK3GwB6zFA4kD9kR
         gmLwL3hsWCJcN4cZnoltzXodVUQQNATradxrmq4i+OpUdyWZ67IxI7oxul1qrhjje3Kl
         LXzdL7XZ6orTFmqiYiWKKBc0n07K/+ZF3tReqi00++3TAtsmoNBy0ZFGuTpwN9zO53Ao
         j7AXoaLNUHSbkJs9EKLL9LDym+h2O3UrCbsp5g4e3GMTzDIOq8lJYkNNPCUhTTERACU+
         JsGfiqCXfU/PSPyfgucmcOHIm3uNx5XJe3Nielq84iuNKVwWBF5b79NnEwi3kl1GdHJt
         Vi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=mzuKjJ7CDBbJuBrMl5D6+u4m41tZ8SAtaNdL7g3FQ/k=;
        b=llzk2d029WOhewxGljNFsz8D5mIPOKBkY9A8yi0/u7hsAuuBM1uM4HgEgFG7NjOtN5
         lkoew31MJcWQj97mUHIloy7Q+NDeJedKK0ieq/Tkgi+bBYVaHXZQxGR2PT9xXKjroyj/
         4i8DFUHdk4noW5c8iIQdZLRLt06S0bnSCpei+hm+VA2BNFtrupEUO7J9OhhbLFCCJfjR
         0wzMta/e6NB6WsjTcAkfQh7hxckAHPI3FmG2vwcM+AB9sLoygF6nwKCOsfmW+xQuXeLY
         M5AdY1vYo4tBmM9BIMgtwlcGwaidSn5/s7jFY/+i2T9rJXLuG89iO0srjWS8nF2ofgqD
         Djpg==
X-Gm-Message-State: AOAM5307zrXZsbldcCPJGxEPNSjDsfJ8hmBLhQWKM1dta+BL34u76DXU
        +vMWcdZ36iPDVD7jpKMREIc=
X-Google-Smtp-Source: ABdhPJyI8Pff3GrTbijXIozN5k3NxiR+pNvmYlHZIPLiCUhJgyWVyDighnwtJLVM4FQO+/Knpfob6Q==
X-Received: by 2002:a1c:4c03:: with SMTP id z3mr1885840wmf.82.1613458115189;
        Mon, 15 Feb 2021 22:48:35 -0800 (PST)
Received: from [0.0.0.0] ([2a01:4f8:c17:e10a::1])
        by smtp.gmail.com with ESMTPSA id a9sm23760630wrn.60.2021.02.15.22.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 22:48:34 -0800 (PST)
Subject: Re: [PATCH v3 1/3] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Perry Yuan <Perry.Yuan@dell.com>, oder_chiou@realtek.com,
        perex@perex.cz, tiwai@suse.com, hdegoede@redhat.com,
        mgross@linux.intel.com
Cc:     alsa-devel@alsa-project.org, Mario.Limonciello@dell.com,
        linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
        platform-driver-x86@vger.kernel.org, broonie@kernel.org
References: <20210112171723.19484-1-Perry_Yuan@Dell.com>
 <bf048701-4e6b-ad18-1a73-8bca5c922425@linux.intel.com>
From:   Perry Yuan <perry979106@gmail.com>
Message-ID: <79277bf2-3c9e-8b66-47a9-b926a2576f7f@gmail.com>
Date:   Tue, 16 Feb 2021 14:48:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <bf048701-4e6b-ad18-1a73-8bca5c922425@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Pierre:
thanks for the review effort.
On 2021/1/13 3:00, Pierre-Louis Bossart wrote:
> 
> 
> On 1/12/21 11:17 AM, Perry Yuan wrote:
>> From: Perry Yuan <perry_yuan@dell.com>
>>
>> add support for dell privacy driver for the dell units equipped
>> hardware privacy design, which protect users privacy of audio and
>> camera from hardware level. once the audio or camera privacy mode
>> enabled, any applications will not get any audio or video stream
>> when user pressed ctrl+F4 hotkey, audio privacy mode will be
>> enabled,Micmute led will be also changed accordingly
>> The micmute led is fully controlled by hardware & EC(embedded controller)
>> and camera mute hotkey is ctrl+f9. currently design only emmit
>> SW_CAMERA_LENS_COVER event while the camera lens shutter will be
>> changed by EC & hw(hadware) control
> 
> It wouldn't hurt to use capital letters and punctuation, it helps with 
> readility..
> 
I will try to improve the description in V4
> [...]
> 
>> diff --git a/drivers/platform/x86/dell-laptop.c 
>> b/drivers/platform/x86/dell-laptop.c
>> index 70edc5bb3a14..2fea1f34fcf9 100644
>> --- a/drivers/platform/x86/dell-laptop.c
>> +++ b/drivers/platform/x86/dell-laptop.c
>> @@ -30,6 +30,7 @@
>>   #include <acpi/video.h>
>>   #include "dell-rbtn.h"
>>   #include "dell-smbios.h"
>> +#include "dell-privacy-wmi.h"
>>   struct quirk_entry {
>>       bool touchpad_led;
>> @@ -90,6 +91,7 @@ static struct rfkill *wifi_rfkill;
>>   static struct rfkill *bluetooth_rfkill;
>>   static struct rfkill *wwan_rfkill;
>>   static bool force_rfkill;
>> +static bool privacy_valid;
> 
> why is this variable needed? Was the intent to have a kernel parameter 
> here?
The var is used to mark if the Dell privacy wmi  driver was loaded 
successfully for now,if privacy loaded,the micmute_led_cdev.brightness
will not be registered by dell-laptop, it will be in dell-privacy-acpi
file using dell_privacy_leds_setup to register the led class.

> 
>>   module_param(force_rfkill, bool, 0444);
>>   MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted 
>> models");
>> @@ -2205,11 +2207,18 @@ static int __init dell_init(void)
>>       dell_laptop_register_notifier(&dell_laptop_notifier);
>>       if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>> -        dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>> -        micmute_led_cdev.brightness = 
>> ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> -        ret = led_classdev_register(&platform_device->dev, 
>> &micmute_led_cdev);
>> -        if (ret < 0)
>> -            goto fail_led;
>> +            dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +        ret = dell_privacy_valid();
>> +        if (!ret)
>> +            privacy_valid = true;
>> +#endif
>> +        if (!privacy_valid) {
> 
> if it was intended to be used as a kernel parameter it's not done the 
> right way: the value set by the user would be ignored...
The privacy_valid value will be retrieved from dell-privacy-wmi showing 
if the privacy driver loaded.
> 
>> +            micmute_led_cdev.brightness = 
>> ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> +            ret = led_classdev_register(&platform_device->dev, 
>> &micmute_led_cdev);
>> +            if (ret < 0)
>> +                goto fail_led;
>> +        }
>>       }
>>       if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>> @@ -2257,7 +2266,8 @@ static int __init dell_init(void)
>>   fail_get_brightness:
>>       backlight_device_unregister(dell_backlight_device);
>>   fail_backlight:
>> -    led_classdev_unregister(&micmute_led_cdev);
>> +    if (!privacy_valid)
>> +        led_classdev_unregister(&micmute_led_cdev);
>>   fail_led:
>>       dell_cleanup_rfkill();
>>   fail_rfkill:
>> @@ -2278,7 +2288,8 @@ static void __exit dell_exit(void)
>>           touchpad_led_exit();
>>       kbd_led_exit();
>>       backlight_device_unregister(dell_backlight_device);
>> -    led_classdev_unregister(&micmute_led_cdev);
>> +    if (!privacy_valid)
>> +        led_classdev_unregister(&micmute_led_cdev);
>>       dell_cleanup_rfkill();
>>       if (platform_device) {
>>           platform_device_unregister(platform_device);
>> diff --git a/drivers/platform/x86/dell-privacy-acpi.c 
>> b/drivers/platform/x86/dell-privacy-acpi.c
>> new file mode 100644
>> index 000000000000..df6a86e1345c
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell-privacy-acpi.c
>> @@ -0,0 +1,167 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Dell privacy notification driver
>> + *
>> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bits.h>
>> +#include <linux/device.h>
>> +#include <linux/fs.h>
>> +#include <linux/kernel.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/string.h>
>> +#include <linux/sysfs.h>
>> +#include <linux/slab.h>
>> +#include <linux/types.h>
>> +#include <linux/wmi.h>
>> +
>> +#include "dell-privacy-wmi.h"
>> +
>> +#define PRIVACY_PLATFORM_NAME    "dell-privacy-acpi"
>> +#define DELL_PRIVACY_GUID    "6932965F-1671-4CEB-B988-D3AB0A901919"
>> +
>> +struct privacy_acpi_priv {
>> +    struct device *dev;
>> +    struct platform_device *platform_device;
>> +    struct led_classdev cdev;
>> +};
>> +static struct privacy_acpi_priv *privacy_acpi;
>> +
>> +static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
>> +        enum led_brightness brightness)
>> +{
>> +    struct privacy_acpi_priv *priv = privacy_acpi;
>> +    acpi_status status;
>> +    acpi_handle handle;
>> +    char *acpi_method;
>> +
>> +    handle = ec_get_handle();
>> +    if (!handle)
>> +        return -EIO;
>> +    acpi_method = "ECAK";
>> +    status = acpi_evaluate_object(handle, acpi_method, NULL, NULL);
>> +    if (ACPI_FAILURE(status)) {
>> +        dev_err(priv->dev, "Error setting privacy EC ack value: %s\n",
>> +                acpi_format_exception(status));
>> +        return -EIO;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static int dell_privacy_acpi_remove(struct platform_device *pdev)
>> +{
>> +    struct privacy_acpi_priv *priv = dev_get_drvdata(privacy_acpi->dev);
>> +
>> +    led_classdev_unregister(&priv->cdev);
>> +
>> +    return 0;
>> +}
>> +/*
>> + * Pressing the mute key activates a time delayed circuit to 
>> physically cut
>> + * off the mute. The LED is in the same circuit, so it reflects the true
>> + * state of the HW mute.  The reason for the EC "ack" is so that 
>> software
>> + * can first invoke a SW mute before the HW circuit is cut off.  
>> Without SW
>> + * cutting this off first does not affect the time delayed muting or 
>> status
>> + * of the LED but there is a possibility of a "popping" noise.
>> + *
>> + * If the EC receives the SW ack, the circuit will be activated 
>> before the
>> + * delay completed.
>> + *
>> + * Exposing as an LED device allows the codec drivers notification 
>> path to
>> + * EC ACK to work
>> + */
>> +static int dell_privacy_leds_setup(struct device *dev)
>> +{
>> +    struct privacy_acpi_priv *priv = dev_get_drvdata(dev);
>> +    int ret = 0;
>> +
>> +    priv->cdev.name = "dell-privacy::micmute";
>> +    priv->cdev.max_brightness = 1;
>> +    priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
>> +    priv->cdev.default_trigger = "audio-micmute";
>> +    priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> +    ret = devm_led_classdev_register(dev, &priv->cdev);
>> +    if (ret < 0)
>> +        return ret;
>> +    return 0;
>> +}
>> +
>> +static int dell_privacy_acpi_probe(struct platform_device *pdev)
>> +{
>> +    platform_set_drvdata(pdev, privacy_acpi);
>> +    privacy_acpi->dev = &pdev->dev;
>> +    privacy_acpi->platform_device = pdev;
>> +    return 0;
>> +}
>> +
>> +static const struct acpi_device_id privacy_acpi_device_ids[] = {
>> +    {"PNP0C09", 0},
>> +    { },
>> +};
>> +MODULE_DEVICE_TABLE(acpi, privacy_acpi_device_ids);
>> +
>> +static struct platform_driver dell_privacy_platform_drv = {
>> +    .driver = {
>> +        .name = PRIVACY_PLATFORM_NAME,
>> +        .acpi_match_table = ACPI_PTR(privacy_acpi_device_ids),
>> +    },
> 
> no .probe?
Originally i added the probe here, but it cause the driver  .probe 
called twice. after i use platform_driver_probe to register the driver 
loading process, the duplicated probe issue resolved.

I
> 
>> +    .remove = dell_privacy_acpi_remove,
>> +};
>> +
>> +int __init dell_privacy_acpi_init(void)
>> +{
>> +    int err;
>> +    struct platform_device *pdev;
>> +    int privacy_capable = wmi_has_guid(DELL_PRIVACY_GUID);
>> +
>> +    if (!wmi_has_guid(DELL_PRIVACY_GUID))
>> +        return -ENODEV;
>> +
>> +    privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
>> +    if (!privacy_acpi)
>> +        return -ENOMEM;
>> +
>> +    pdev = platform_device_register_simple(
>> +            PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>> +    if (IS_ERR(pdev)) {
>> +        err = PTR_ERR(pdev);
>> +        goto pdev_err;
>> +    }
>> +    err = platform_driver_probe(&dell_privacy_platform_drv,
>> +            dell_privacy_acpi_probe);
>> +    if (err)
>> +        goto pdrv_err;
> 
> why is the probe done here? Put differently, what prevents you from 
> using a 'normal' platform driver, and do the leds_setup in the .probe()?
At first ,I used the normal platform driver framework, however tt cause 
the driver  .probe called twice. after i use platform_driver_probe to 
register the driver loading process, the duplicated probe issue resolved.

> 
>> +
>> +    err = dell_privacy_leds_setup(&pdev->dev);
>> +    if (err < 0)
>> +        goto pdrv_err;
>> +
>> +    return 0;
>> +
>> +pdrv_err:
>> +    platform_device_unregister(pdev);
>> +pdev_err:
>> +    kfree(privacy_acpi);
>> +    return err;
>> +}
>> +
>> +void __exit dell_privacy_acpi_exit(void)
>> +{
>> +    struct platform_device *pdev = 
>> to_platform_device(privacy_acpi->dev);
>> +
>> +    platform_device_unregister(pdev);
>> +    platform_driver_unregister(&dell_privacy_platform_drv);
>> +    kfree(privacy_acpi);
>> +}
>> +
>> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
>> +MODULE_DESCRIPTION("DELL Privacy ACPI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/dell-privacy-wmi.c 
>> b/drivers/platform/x86/dell-privacy-wmi.c
>> new file mode 100644
>> index 000000000000..432a3f4ed226
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell-privacy-wmi.c
>> @@ -0,0 +1,320 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Dell privacy notification driver
>> + *
>> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/list.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +#include "dell-privacy-wmi.h"
>> +
>> +#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
>> +#define MICROPHONE_STATUS            BIT(0)
>> +#define CAMERA_STATUS                BIT(1)
>> +#define PRIVACY_SCREEN_STATUS        BIT(2)
>> +
>> +static int privacy_valid = -EPROBE_DEFER;
> 
> this is set to -ENODEV on remove. that looks odd to me.
> 
>> +static LIST_HEAD(wmi_list);
>> +static DEFINE_MUTEX(list_mutex);
>> +
>> +struct privacy_wmi_data {
>> +    struct input_dev *input_dev;
>> +    struct wmi_device *wdev;
>> +    struct list_head list;
>> +    u32 features_present;
>> +    u32 last_status;
>> +};
>> +
>> +/*
>> + * Keymap for WMI privacy events of type 0x0012
>> + */
>> +static const struct key_entry dell_wmi_keymap_type_0012[] = {
>> +    /* privacy mic mute */
>> +    { KE_KEY, 0x0001, { KEY_MICMUTE } },
>> +    /* privacy camera mute */
>> +    { KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
>> +    { KE_END, 0},
>> +};
>> +
>> +int dell_privacy_valid(void)
>> +{
>> +    int ret;
>> +
>> +    ret = wmi_has_guid(DELL_PRIVACY_GUID);
>> +    if (!ret)
>> +        return -ENODEV;
>> +    ret = privacy_valid;
>> +    return ret;
> 
> return privacy_valid?
> 
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_valid);
>> +
>> +void dell_privacy_process_event(int type, int code, int status)
>> +{
>> +    struct privacy_wmi_data *priv;
>> +    const struct key_entry *key;
>> +
>> +    mutex_lock(&list_mutex);
>> +    priv = list_first_entry_or_null(&wmi_list,
>> +            struct privacy_wmi_data,
>> +            list);
>> +    if (!priv) {
>> +        pr_err("dell privacy priv is NULL\n");
>> +        goto error;
>> +    }
>> +    key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 
>> 16)|code);
> 
> missing spaces, does this even pass with checkpatch.pl
> 
>> +    if (!key) {
>> +        dev_dbg(&priv->wdev->dev, "Unknown key with type 0x%04x and 
>> code 0x%04x pressed\n",
>> +                type, code);
>> +        goto error;
>> +    }
>> +    switch (code) {
>> +    case DELL_PRIVACY_TYPE_AUDIO: /* Mic mute */
>> +        priv->last_status = status;
>> +        sparse_keymap_report_entry(priv->input_dev, key, 1, true);
>> +        break;
>> +    case DELL_PRIVACY_TYPE_CAMERA: /* Camera mute */
> 
> Never seen anyone 'mute' their camera? 'switch off' or 'disable'?
Camera Mute will be added to Dell platforms very soon.
It needs to add this for that coming camera mute privacy feature.
> 
>> +        priv->last_status = status;
>> +        sparse_keymap_report_entry(priv->input_dev, key, 1, true);
>> +        break;
>> +    default:
>> +            dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 
>> 0x%04x",
>> +                    type, code);
>> +    }
>> +error:
>> +    mutex_unlock(&list_mutex);
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_process_event);
> 
> [...]
> 
>> +/*
>> + * Describes the Device State class exposed by BIOS which can be 
>> consumed by
>> + * various applications interested in knowing the Privacy feature 
>> capabilities.
>> + * class DeviceState
>> + * {
>> + *  [key, read] string InstanceName;
>> + *  [read] boolean ReadOnly;
>> + *  [WmiDataId(1), read] uint32 DevicesSupported;
>> + *   0 – None, 0x1 – Microphone, 0x2 – Camera, 0x4 -ePrivacy  Screen
>> + *  [WmiDataId(2), read] uint32 CurrentState;
>> + *   0:Off; 1:On. Bit0 – Microphone, Bit1 – Camera, Bit2 - 
>> ePrivacyScreen
>> + * };
>> + */
>> +
>> +static int get_current_status(struct wmi_device *wdev)
>> +{
>> +    struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +    union acpi_object *obj_present;
>> +    u32 *buffer;
>> +    int ret = 0;
>> +
>> +    if (!priv) {
>> +        pr_err("dell privacy priv is NULL\n");
>> +        return -EINVAL;
>> +    }
> 
> can this happen? when would this pointer be NULL?
Hopefully not happening, but i want to make sure the priv is not NULL,
Otherwise it will cause kernel oops or panic.
In that case, i would prefer to check the priv data again safely.
> 
>> +    /* check privacy support features and device states */
>> +    obj_present = wmidev_block_query(wdev, 0);
>> +    if (!obj_present) {
>> +        dev_err(&wdev->dev, "failed to read Binary MOF\n");
>> +        ret = -EIO;
>> +        privacy_valid = ret;
>> +        return ret;
>> +    }
>> +
>> +    if (obj_present->type != ACPI_TYPE_BUFFER) {
>> +        dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
>> +        ret = -EIO;
>> +        privacy_valid = ret;
>> +        goto obj_free;
>> +    }
>> +    /*  Although it's not technically a failure, this would lead to
>> +     *  unexpected behavior
>> +     */
>> +    if (obj_present->buffer.length != 8) {
>> +        dev_err(&wdev->dev, "Dell privacy buffer has unexpected 
>> length (%d)!\n",
>> +                obj_present->buffer.length);
>> +        ret = -EINVAL;
>> +        privacy_valid = ret;
>> +        goto obj_free;
>> +    }
>> +    buffer = (u32 *)obj_present->buffer.pointer;
>> +    priv->features_present = buffer[0];
>> +    priv->last_status = buffer[1];
>> +    privacy_valid = 0;
>> +
>> +obj_free:
>> +    kfree(obj_present);
>> +    return ret;
>> +}
>> +
>> +static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void 
>> *context)
>> +{
>> +    struct privacy_wmi_data *priv;
>> +    struct key_entry *keymap;
>> +    int ret, i, pos = 0;
>> +
>> +    priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +    if (!priv)
>> +        return -ENOMEM;
>> +
>> +    dev_set_drvdata(&wdev->dev, priv);
>> +    priv->wdev = wdev;
>> +    /* create evdev passing interface */
>> +    priv->input_dev = devm_input_allocate_device(&wdev->dev);
>> +    if (!priv->input_dev)
>> +        return -ENOMEM;
>> +    /* remap the wmi keymap event to new keymap */
>> +    keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012) +
>> +            1,
> 
> same line?
Yes,it is the same line
If it is not good shape. i changed like this is also OK for me.


         keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012) + 1,
                         sizeof(struct key_entry), GFP_KERNEL);

> 
>> +            sizeof(struct key_entry), GFP_KERNEL);
>> +    if (!keymap) {
>> +        ret = -ENOMEM;
>> +        goto err_free_dev;
>> +    }
>> +    /* remap the keymap code with Dell privacy key type 0x12 as prefix
>> +     * KEY_MICMUTE scancode will be reported as 0x120001
>> +     */
>> +    for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
>> +        keymap[pos] = dell_wmi_keymap_type_0012[i];
>> +        keymap[pos].code |= (0x0012 << 16);
>> +        pos++;
>> +    }
>> +    ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
>> +    if (ret)
>> +        return ret;
>> +    priv->input_dev->dev.parent = &wdev->dev;
>> +    priv->input_dev->name = "Dell Privacy Driver";
>> +    priv->input_dev->id.bustype = BUS_HOST;
>> +    if (input_register_device(priv->input_dev)) {
>> +        pr_debug("input_register_device failed to register!\n");
>> +        goto err_free_keymap;
>> +    }
>> +    mutex_lock(&list_mutex);
>> +    list_add_tail(&priv->list, &wmi_list);
>> +    mutex_unlock(&list_mutex);
>> +    if (get_current_status(priv->wdev))
>> +        goto err_free_input;
>> +    ret = devm_device_add_group(&wdev->dev, &privacy_attribute_group);
>> +    if (ret)
>> +        goto err_free_input;
>> +    kfree(keymap);
>> +    return 0;
> 
> having a set of newlines wouldn't hurt, thsi is not very easy to read 
> and split in logical sections...
> 
Agreed,add some new lines to make the section more logically to review.
>> +
>> +err_free_input:
>> +    input_unregister_device(priv->input_dev);
>> +err_free_keymap:
>> +    privacy_valid = -ENODEV;
>> +    kfree(keymap);
>> +err_free_dev:
>> +    input_free_device(priv->input_dev);
>> +    return ret;
>> +}
>> +
>> +static int dell_privacy_wmi_remove(struct wmi_device *wdev)
>> +{
>> +    struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +    mutex_lock(&list_mutex);
>> +    list_del(&priv->list);
>> +    mutex_unlock(&list_mutex);
>> +    privacy_valid = -ENODEV;
>> +    input_unregister_device(priv->input_dev);
>> +
>> +    return 0;
>> +}
> 
> [...]
> 
>> +        case 0x0012:
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +            err = dell_privacy_valid();
>> +            if (err == 0) {
>> +                dell_privacy_process_event(buffer_entry[1],
>> +                        buffer_entry[3], buffer_entry[4]);
>> +            } else {
>> +                if (len > 2)
>> +                    dell_wmi_process_key(wdev, buffer_entry[1],
>> +                            buffer_entry[2]);
>> +                /* Extended data is currently ignored */
>> +            }
>> +#else
>> +            if (len > 2)
>> +                dell_wmi_process_key(wdev, buffer_entry[1],
>> +                        buffer_entry[2]);
>> +            /* Extended data is currently ignored */
>> +#endif
> 
> this doesn't look very nice, can we avoid the duplication?
Sure, I clear the duplicated comments.
> 
>> +            break;
>>           default: /* Unknown event */
>>               pr_info("Unknown WMI event type 0x%x\n",
>>                   (int)buffer_entry[1]);
>>

