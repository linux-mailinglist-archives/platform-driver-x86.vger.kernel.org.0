Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 274006C5825
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Mar 2023 21:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbjCVUvn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Mar 2023 16:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbjCVUvZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 16:51:25 -0400
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CC1C2705
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 13:49:20 -0700 (PDT)
Received: from [192.168.0.31] (51b68d67.dsl.pool.telekom.hu [::ffff:81.182.141.103])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000070A47.00000000641B69CF.00156837; Wed, 22 Mar 2023 21:49:19 +0100
Message-ID: <8d4304d9-eb5e-6c62-c14d-1d912ec87b74@irl.hu>
Date:   Wed, 22 Mar 2023 21:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Content-Language: en-US, hu
To:     Hans de Goede <hdegoede@redhat.com>,
        Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <85e87867-5001-da05-dd7c-020977c75288@irl.hu>
 <de4b95c5-988d-894d-d0ff-2ce67286abab@redhat.com>
From:   Gergo Koteles <soyer@irl.hu>
In-Reply-To: <de4b95c5-988d-894d-d0ff-2ce67286abab@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 2023. 03. 21. 10:13, Hans de Goede wrote:
> Hi Gergo,
> 
> On 3/21/23 02:05, Gergo Koteles wrote:
>> Hi Andrew,
>>
>> Thanks for picking this up. Sorry for the late reply.
>> I no longer think this driver should do the same workaround as ymc.exe does, it shouldn't make non-WMI calls.
>> I think the 14ARB7 should be fixed in the BIOS to work like the other Yogas with the same WMI IDs.
>>
>> So PATCH 1/2 and codes related to ec_trigger are unnecessary.
> 
> Good to hear from you. May I ask why you think that the ec_trigger is unnecessary ?
> 

Just the usual struggle for simplicity.

> I agree that it should be limited to only models which need it,
> but if it is necessary on some models to make things work and
> if it is what the Lenovo Windows software does on this model,
> then I think we should do this in Linux too to make things
> work on models which need the EC trigger.
> 
> In my experience waiting for a BIOS update to fix this properly
> is idle hope and such a BIOS update is very unlikely to happen.
> 
> Lenovo seems to have worked around this in their Windows software
> with the EC trigger thing, so there is no reason for Lenovo
> to change the BIOS.
> 
You are right, it's unlikely they'll change this.

Thanks for bringing me back to reality,
Gergo

>> I only have the 14ARB7 and I can't test this without the ec_trigger.
>> For this reason, I don't want to be the author of this module.
>> Could you be the author?
> 
> Note that making Andrew the primary author of the patch is
> fine regardless of if we keep the EC trigger or not.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>>
>> The working C940, 14API reports are from https://github.com/lukas-w/yoga-usage-mode module, which uses the same WMI IDs.
>>
>> Regards,
>> Gergo
>>
>> Co-developed-by: Gergo Koteles <soyer@irl.hu>
>> Signed-off-by: Gergo Koteles <soyer@irl.hu>
>>
>>
>> On 2023. 03. 10. 5:17, Andrew Kallmeyer wrote:
>>> This WMI driver for the tablet mode control switch for Lenovo Yoga
>>> notebooks was originally written by Gergo Koteles. The mode is mapped to
>>> a SW_TABLET_MODE switch capable input device.
>>>
>>> I (Andrew) followed the suggestions that were posted in reply to Gergo's
>>> RFC patch to follow-up and get it merged. Additionally I merged the
>>> lenovo_ymc_trigger_ec function with the ideapad_trigger_ymc_next_read
>>> function since it was no longer external. I have also added the word
>>> "Tablet" to the driver description to hopefully make it more clear.
>>>
>>> As Gergo said: It should work with  models like the Yoga C940, Ideapad
>>> flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7.
>>> The 14ARB7 model must trigger the EC to send mode change events. This
>>> might be a firmware bug.
>>>
>>> I have additionally tested this on the Yoga 7 14IAL7.
>>>
>>> Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
>>> Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
>>> Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
>>> ---
>>>    drivers/platform/x86/Kconfig          |  10 ++
>>>    drivers/platform/x86/Makefile         |   1 +
>>>    drivers/platform/x86/ideapad-laptop.h |   1 +
>>>    drivers/platform/x86/lenovo-ymc.c     | 177 ++++++++++++++++++++++++++
>>>    4 files changed, 189 insertions(+)
>>>    create mode 100644 drivers/platform/x86/lenovo-ymc.c
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index 5692385e2..858be0c65 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -470,6 +470,16 @@ config IDEAPAD_LAPTOP
>>>          This is a driver for Lenovo IdeaPad netbooks contains drivers for
>>>          rfkill switch, hotkey, fan control and backlight control.
>>>    +config LENOVO_YMC
>>> +    tristate "Lenovo Yoga Tablet Mode Control"
>>> +    depends on ACPI_WMI
>>> +    depends on INPUT
>>> +    depends on IDEAPAD_LAPTOP
>>> +    select INPUT_SPARSEKMAP
>>> +    help
>>> +      This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
>>> +      events for Lenovo Yoga notebooks.
>>> +
>>>    config SENSORS_HDAPS
>>>        tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
>>>        depends on INPUT
>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>>> index 1d3d1b025..10054cdea 100644
>>> --- a/drivers/platform/x86/Makefile
>>> +++ b/drivers/platform/x86/Makefile
>>> @@ -63,6 +63,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>>>    # IBM Thinkpad and Lenovo
>>>    obj-$(CONFIG_IBM_RTL)        += ibm_rtl.o
>>>    obj-$(CONFIG_IDEAPAD_LAPTOP)    += ideapad-laptop.o
>>> +obj-$(CONFIG_LENOVO_YMC)    += lenovo-ymc.o
>>>    obj-$(CONFIG_SENSORS_HDAPS)    += hdaps.o
>>>    obj-$(CONFIG_THINKPAD_ACPI)    += thinkpad_acpi.o
>>>    obj-$(CONFIG_THINKPAD_LMI)    += think-lmi.o
>>> diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
>>> index 7dd8ce027..2564cb1cd 100644
>>> --- a/drivers/platform/x86/ideapad-laptop.h
>>> +++ b/drivers/platform/x86/ideapad-laptop.h
>>> @@ -35,6 +35,7 @@ enum {
>>>        VPCCMD_W_FAN,
>>>        VPCCMD_R_RF,
>>>        VPCCMD_W_RF,
>>> +    VPCCMD_W_YMC = 0x2A,
>>>        VPCCMD_R_FAN = 0x2B,
>>>        VPCCMD_R_SPECIAL_BUTTONS = 0x31,
>>>        VPCCMD_W_BL_POWER = 0x33,
>>> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
>>> new file mode 100644
>>> index 000000000..e29ada1b4
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-ymc.c
>>> @@ -0,0 +1,177 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * lenovo-ymc.c - Lenovo Yoga Mode Control driver
>>> + *
>>> + * Copyright © 2022 Gergo Koteles <soyer@irl.hu>
>>> + */
>>> +
>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/dmi.h>
>>> +#include <linux/input.h>
>>> +#include <linux/input/sparse-keymap.h>
>>> +#include <linux/wmi.h>
>>> +#include "ideapad-laptop.h"
>>> +
>>> +#define LENOVO_YMC_EVENT_GUID    "06129D99-6083-4164-81AD-F092F9D773A6"
>>> +#define LENOVO_YMC_QUERY_GUID    "09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
>>> +
>>> +#define LENOVO_YMC_QUERY_INSTANCE 0
>>> +#define LENOVO_YMC_QUERY_METHOD 0xAB
>>> +
>>> +static bool ec_trigger __read_mostly;
>>> +module_param(ec_trigger, bool, 0644);
>>> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events");
>>> +
>>> +static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
>>> +    {
>>> +        // Lenovo Yoga 7 14ARB7
>>> +        .matches = {
>>> +            DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
>>> +            DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
>>> +        },
>>> +    },
>>> +    { },
>>> +};
>>> +
>>> +struct lenovo_ymc_private {
>>> +    struct input_dev *input_dev;
>>> +    struct acpi_device *ec_acpi_dev;
>>> +};
>>> +
>>> +static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenovo_ymc_private *priv)
>>> +{
>>> +    int err;
>>> +
>>> +    if (!ec_trigger || !priv || !priv->ec_acpi_dev)
>>> +        return;
>>> +    err = write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
>>> +    if (err)
>>> +        dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
>>> +}
>>> +
>>> +static const struct key_entry lenovo_ymc_keymap[] = {
>>> +    // Laptop
>>> +    { KE_SW, 0x01, { .sw = { SW_TABLET_MODE, 0 } } },
>>> +    // Tablet
>>> +    { KE_SW, 0x02, { .sw = { SW_TABLET_MODE, 1 } } },
>>> +    // Drawing Board
>>> +    { KE_SW, 0x03, { .sw = { SW_TABLET_MODE, 1 } } },
>>> +    // Tent
>>> +    { KE_SW, 0x04, { .sw = { SW_TABLET_MODE, 1 } } },
>>> +    { KE_END },
>>> +};
>>> +
>>> +static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
>>> +{
>>> +    struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
>>> +
>>> +    u32 input_val = 0;
>>> +    struct acpi_buffer input = {sizeof(input_val), &input_val};
>>> +    struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
>>> +    acpi_status status;
>>> +    union acpi_object *obj;
>>> +    int code;
>>> +
>>> +    status = wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
>>> +                LENOVO_YMC_QUERY_INSTANCE,
>>> +                LENOVO_YMC_QUERY_METHOD,
>>> +                &input, &output);
>>> +
>>> +    if (ACPI_FAILURE(status)) {
>>> +        dev_warn(&wdev->dev,
>>> +            "Failed to evaluate query method: %s\n",
>>> +            acpi_format_exception(status));
>>> +        return;
>>> +    }
>>> +
>>> +    obj = output.pointer;
>>> +
>>> +    if (obj->type != ACPI_TYPE_INTEGER) {
>>> +        dev_warn(&wdev->dev,
>>> +            "WMI event data is not an integer\n");
>>> +        goto free_obj;
>>> +    }
>>> +    code = obj->integer.value;
>>> +
>>> +    if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
>>> +        dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
>>> +
>>> +free_obj:
>>> +    kfree(obj);
>>> +    lenovo_ymc_trigger_ec(wdev, priv);
>>> +}
>>> +
>>> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
>>> +{
>>> +    struct input_dev *input_dev;
>>> +    struct lenovo_ymc_private *priv;
>>> +    int err;
>>> +
>>> +    ec_trigger |= dmi_check_system(ec_trigger_quirk_dmi_table);
>>> +
>>> +    priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +    if (!priv)
>>> +        return -ENOMEM;
>>> +
>>> +    if (ec_trigger) {
>>> +        pr_debug("Lenovo YMC enable EC triggering.\n");
>>> +        priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VCP2004", NULL, -1);
>>> +        if (!priv->ec_acpi_dev) {
>>> +            dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
>>> +            return -ENODEV;
>>> +        }
>>> +    }
>>> +
>>> +    input_dev = devm_input_allocate_device(&wdev->dev);
>>> +    if (!input_dev)
>>> +        return -ENOMEM;
>>> +
>>> +    input_dev->name = "Lenovo Yoga Tablet Mode Control switch";
>>> +    input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
>>> +    input_dev->id.bustype = BUS_HOST;
>>> +    input_dev->dev.parent = &wdev->dev;
>>> +
>>> +    input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
>>> +
>>> +    err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
>>> +    if (err) {
>>> +        dev_err(&wdev->dev,
>>> +            "Could not set up input device keymap: %d\n", err);
>>> +        return err;
>>> +    }
>>> +
>>> +    err = input_register_device(input_dev);
>>> +    if (err) {
>>> +        dev_err(&wdev->dev,
>>> +            "Could not register input device: %d\n", err);
>>> +        return err;
>>> +    }
>>> +
>>> +    priv->input_dev = input_dev;
>>> +    dev_set_drvdata(&wdev->dev, priv);
>>> +    lenovo_ymc_trigger_ec(wdev, priv);
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct wmi_device_id lenovo_ymc_wmi_id_table[] = {
>>> +    { .guid_string = LENOVO_YMC_EVENT_GUID },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
>>> +
>>> +static struct wmi_driver lenovo_ymc_driver = {
>>> +    .driver = {
>>> +        .name = "lenovo-ymc",
>>> +    },
>>> +    .id_table = lenovo_ymc_wmi_id_table,
>>> +    .probe = lenovo_ymc_probe,
>>> +    .notify = lenovo_ymc_notify,
>>> +};
>>> +
>>> +module_wmi_driver(lenovo_ymc_driver);
>>> +
>>> +MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
>>> +MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
>>> +MODULE_LICENSE("GPL");
>>
> 

