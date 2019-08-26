Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF8ED9D5FD
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Aug 2019 20:47:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfHZSrt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 26 Aug 2019 14:47:49 -0400
Received: from mail.klausen.dk ([174.138.9.187]:41346 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732007AbfHZSrt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Aug 2019 14:47:49 -0400
Subject: Re: [PATCH v3] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1566845265;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JbbrIlQ9WSvoyQ26shOfjSE9qAtWBn9izR0xsuwSLD4=;
        b=E83yLJvaDp4BfKRRqohzHo511EQLspfgoDYJLAr4BO/fdyFhoVdfqznnAiaa4quBIkr/eB
        SvgYgi8g418b16VTPMahhRK8dZipK8IIoIJ/TFrxJ1ECqVl3qa0gn6QGc8l66Xkof3LLK7
        x6eP2LU/O1XVLLsOWNOq2Cmv6DvviqE=
To:     Daniel Drake <drake@endlessm.com>,
        =?UTF-8?Q?Ognjen_Gali=c4=87?= <smclt30p@gmail.com>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20190813003023.6748-1-kristian@klausen.dk>
 <CAD8Lp47pSr-0VWqSBTAAJe3Ny5gW2XMXXYxmiH5-EOk42MhvHw@mail.gmail.com>
From:   Kristian Klausen <kristian@klausen.dk>
Message-ID: <a5f6bd92-076b-57be-75d8-7509b86b5fea@klausen.dk>
Date:   Mon, 26 Aug 2019 20:47:44 +0200
MIME-Version: 1.0
In-Reply-To: <CAD8Lp47pSr-0VWqSBTAAJe3Ny5gW2XMXXYxmiH5-EOk42MhvHw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 15.08.2019 05.28, Daniel Drake wrote:
> On Tue, Aug 13, 2019 at 8:30 AM Kristian Klausen <kristian@klausen.dk> wrote:
>> Most newer ASUS laptops supports settings a maximum charging percentage,
>> which help prolonging the battery life.
>>
>> Tested on a Zenbook UX430UNR.
>>
>> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
>> ---
>> I can't pass the asus struct to asus_wmi_battery_{add,remove}, so I use a
>> global variable. Is there any better way to do it?
>> I think the implementation of asus_wmi_battery_{init,exit} could be
>> improved, any ideas?
> Added Ognjen and Rafael.
> Is there a better way to have the sysfs file handlers of files added
> via the battery hooking API reach back to the device that hooked in,
> in order to access it's private data?
> I see that thinkpad_acpi also uses global variables for this :(
For now I think it is the only option.

I did notice that V1 of this patch has been merged into the for-next 
branch by Andy[1].
Was that a mistake Andy? and how do you want me to proceed? Should I 
create a refactoring patch? V1 really isn't the proper way to do this.

[1] 
http://git.infradead.org/linux-platform-drivers-x86.git/commit/d507a54f5865d8dcbdd16c66a1a2da15640878ca
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
>>   drivers/platform/x86/asus-wmi.c            | 91 ++++++++++++++++++++++
>>   include/linux/platform_data/x86/asus-wmi.h |  3 +
>>   2 files changed, 94 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 34dfbed65332..06c830c1c04f 100644
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
>> @@ -368,6 +370,92 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
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
>> +       if (asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_RSOC) >= 0)
>> +               battery_hook_register(&battery_hook);
>> +}
> asus_wmi_get_devstate_simple() checks ASUS_WMI_DSTS_STATUS_BIT and
> ASUS_WMI_DSTS_UNKNOWN_BIT for this device. However the spec makes no
> mentions of those bits being valid in this case.
> Your code probably works anyway but I think it would be better to use
> asus_wmi_dev_is_present() instead.
Ack
>
>> +static void asus_wmi_battery_exit(struct asus_wmi *asus)
>> +{
>> +       if (asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_RSOC) >= 0)
>> +               battery_hook_unregister(&battery_hook);
>> +}
> The unregister here should probably happen on the condition that we
> previously registered the hook.
> Don't rely on the devstate bits, since they might have changed
> unpredictably (who knows), there might be a problem communicating with
> the hardware, etc.
Ack, something like a: bool charge_threshold_supported?
>
>>   /* LEDs ***********************************************************************/
>>
>>   /*
>> @@ -2433,6 +2521,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>>                  goto fail_wmi_handler;
>>          }
>>
>> +       asus_wmi_battery_init(asus);
>> +
>>          asus_wmi_debugfs_init(asus);
>>
>>          return 0;
>> @@ -2468,6 +2558,7 @@ static int asus_wmi_remove(struct platform_device *device)
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
>> 2.22.0
>>

