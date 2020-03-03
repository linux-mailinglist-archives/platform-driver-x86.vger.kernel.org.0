Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2A89177DD8
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Mar 2020 18:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgCCRoR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 3 Mar 2020 12:44:17 -0500
Received: from mail.klausen.dk ([174.138.9.187]:33852 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728022AbgCCRoQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Mar 2020 12:44:16 -0500
Subject: Re: [PATCH v4] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1583257453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HuFJYMnjvhTiE7dwFWQo1WUvKYHsMpMqrz8JDkF30NA=;
        b=oLwLmJ8oA3JXVqtRK1wautQz/m46L/6xzDk9FWLEyGi4FuDrl5M4UwMUpPM38XcBYtKmFn
        uoy3eYyYpiX6zR+3N8PxPM1r73dkPbfv1g3ZTZiHm+Uyu1RgBPO2/UKai0/7SG0XNl6reg
        GJjw+j2dPW1Wiqu74O+gCtFMHt0Iyh4=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Daniel Drake <drake@endlessm.com>
References: <20190901190453.29720-1-kristian@klausen.dk>
 <CAHp75Vd6yK=uHBeT5AJ_7VvVm_DEoUkR0aQ8xG76brQ4-ydTBQ@mail.gmail.com>
From:   Kristian Klausen <kristian@klausen.dk>
Message-ID: <a8ce0974-22a2-a193-3eaf-956a93fe7d84@klausen.dk>
Date:   Tue, 3 Mar 2020 18:44:12 +0100
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd6yK=uHBeT5AJ_7VvVm_DEoUkR0aQ8xG76brQ4-ydTBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 03.03.2020 15.45, Andy Shevchenko wrote:
> On Sun, Sep 1, 2019 at 10:11 PM Kristian Klausen <kristian@klausen.dk> wrote:
>> Most newer ASUS laptops supports settings a maximum charging percentage,
>> which help prolonging the battery life.
>>
>> Tested on a Zenbook UX430UNR.
> Hi!
>
> I found this patch in my email box eventually.
> Can you remind what is the status of it?
> Is this change still needed?

No, it isn't needed anymore. It was superseded by another patch series, 
which was accepted a long time ago.

https://www.spinics.net/lists/platform-driver-x86/msg19540.html
https://www.spinics.net/lists/platform-driver-x86/msg19542.html
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7c28503db19cfa28e394a394aca61c79fbf3f969

>
>> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
>> ---
>> V4:
>> Use asus_wmi_dev_is_present() instead of asus_wmi_get_devstate_simple()
>> to check if the RSOC is available.
>> asus_wmi_dev_is_present() use ASUS_WMI_DSTS_STATUS_BIT and
>> ASUS_WMI_DSTS_UNKNOWN_BIT which isn't mentioned in the spec for the RSOC.
>> Only unregister the battery_hook if battery_hook_register was called
>> previously.
>>
>> V3:
>> Refactor to use the new battery hooking API[1] and knobs[2].
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa93854f7a7ed63d054405bf3779247d5300edd3
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=813cab8f3994250e136819ae48fbd1c95d980466
>>
>> V2:
>> Add sysfs documentation.
>> Reorder ASUS_WMI_CHARGE_THRESHOLD and rename to ASUS_WMI_DEVID_RSOC.
>> Add a comment explaining the charge_threshold variable.
>> Rephrase the commit message (charge threshold -> maximum charging
>> percentage).
>>
>> The sysfs knob is still called "charge_threshold", as
>> maximum_charging_percentage seems a bit long.
>> I did look on some of the other platform modules, the LG module
>> use battery_care_limit and the Samsung module use
>> battery_life_extender.
>>
>>   drivers/platform/x86/asus-wmi.c            | 97 ++++++++++++++++++++++
>>   include/linux/platform_data/x86/asus-wmi.h |  3 +
>>   2 files changed, 100 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 34dfbed65332..f0085953b381 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -26,6 +26,7 @@
>>   #include <linux/rfkill.h>
>>   #include <linux/pci.h>
>>   #include <linux/pci_hotplug.h>
>> +#include <linux/power_supply.h>
>>   #include <linux/hwmon.h>
>>   #include <linux/hwmon-sysfs.h>
>>   #include <linux/debugfs.h>
>> @@ -36,6 +37,7 @@
>>   #include <linux/acpi.h>
>>   #include <linux/dmi.h>
>>   #include <acpi/video.h>
>> +#include <acpi/battery.h>
>>
>>   #include "asus-wmi.h"
>>
>> @@ -195,6 +197,9 @@ struct asus_wmi {
>>          u8 fan_boost_mode_mask;
>>          u8 fan_boost_mode;
>>
>> +       // The RSOC controls the maximum charging percentage.
>> +       bool battery_rsoc_available;
>> +
>>          struct hotplug_slot hotplug_slot;
>>          struct mutex hotplug_lock;
>>          struct mutex wmi_lock;
>> @@ -368,6 +373,95 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>>          return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>>   }
>>
>> +/* Battery ********************************************************************/
>> +
>> +/* The battery maximum charging percentage */
>> +static int charge_end_threshold;
>> +
>> +static ssize_t charge_control_end_threshold_store(struct device *dev,
>> +                                                 struct device_attribute *attr,
>> +                                                 const char *buf, size_t count)
>> +{
>> +       int value, ret, rv;
>> +
>> +       ret = kstrtouint(buf, 10, &value);
>> +
>> +       if (!count || ret != 0)
>> +               return -EINVAL;
>> +       if (value < 0 || value > 100)
>> +               return -EINVAL;
>> +
>> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, value, &rv);
>> +
>> +       if (rv != 1)
>> +               return -EIO;
>> +
>> +       /* There isn't any method in the DSDT to read the threshold, so we
>> +        * save the threshold.
>> +        */
>> +       charge_end_threshold = value;
>> +       return count;
>> +}
>> +
>> +static ssize_t charge_control_end_threshold_show(struct device *device,
>> +                                                struct device_attribute *attr,
>> +                                                char *buf)
>> +{
>> +       return sprintf(buf, "%d\n", charge_end_threshold);
>> +}
>> +
>> +static DEVICE_ATTR_RW(charge_control_end_threshold);
>> +
>> +static int asus_wmi_battery_add(struct power_supply *battery)
>> +{
>> +       /* The WMI method does not provide a way to specific a battery, so we
>> +        * just assume it is the first battery.
>> +        */
>> +       if (!strcmp(battery->desc->name, "BAT0") == 0)
>> +               return -ENODEV;
>> +
>> +       if (device_create_file(&battery->dev,
>> +           &dev_attr_charge_control_end_threshold))
>> +               return -ENODEV;
>> +
>> +       /* The charge threshold is only reset when the system is power cycled,
>> +        * and we can't get the current threshold so let set it to 100% when
>> +        * a battery is added.
>> +        */
>> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
>> +       charge_end_threshold = 100;
>> +
>> +       return 0;
>> +}
>> +
>> +static int asus_wmi_battery_remove(struct power_supply *battery)
>> +{
>> +       device_remove_file(&battery->dev,
>> +                          &dev_attr_charge_control_end_threshold);
>> +       return 0;
>> +}
>> +
>> +static struct acpi_battery_hook battery_hook = {
>> +       .add_battery = asus_wmi_battery_add,
>> +       .remove_battery = asus_wmi_battery_remove,
>> +       .name = "ASUS Battery Extension",
>> +};
>> +
>> +static void asus_wmi_battery_init(struct asus_wmi *asus)
>> +{
>> +       asus_wmi->battery_rsoc_available = false;
>> +       if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_RSOC)) {
>> +               asus_wmi->battery_rsoc_available = true;
>> +               battery_hook_register(&battery_hook);
>> +       }
>> +}
>> +
>> +static void asus_wmi_battery_exit(struct asus_wmi *asus)
>> +{
>> +       if (asus_wmi->battery_rsoc_available)
>> +               battery_hook_unregister(&battery_hook);
>> +}
>> +
>>   /* LEDs ***********************************************************************/
>>
>>   /*
>> @@ -2433,6 +2527,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>>                  goto fail_wmi_handler;
>>          }
>>
>> +       asus_wmi_battery_init(asus);
>> +
>>          asus_wmi_debugfs_init(asus);
>>
>>          return 0;
>> @@ -2468,6 +2564,7 @@ static int asus_wmi_remove(struct platform_device *device)
>>          asus_wmi_debugfs_exit(asus);
>>          asus_wmi_sysfs_exit(asus->platform_device);
>>          asus_fan_set_auto(asus);
>> +       asus_wmi_battery_exit(asus);
>>
>>          kfree(asus);
>>          return 0;
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 409e16064f4b..60249e22e844 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -81,6 +81,9 @@
>>   /* Deep S3 / Resume on LID open */
>>   #define ASUS_WMI_DEVID_LID_RESUME      0x00120031
>>
>> +/* Maximum charging percentage */
>> +#define ASUS_WMI_DEVID_RSOC            0x00120057
>> +
>>   /* DSTS masks */
>>   #define ASUS_WMI_DSTS_STATUS_BIT       0x00000001
>>   #define ASUS_WMI_DSTS_UNKNOWN_BIT      0x00000002
>> --
>> 2.23.0
>>
>

