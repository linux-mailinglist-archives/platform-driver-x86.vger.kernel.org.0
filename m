Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E88918E32D
	for <lists+platform-driver-x86@lfdr.de>; Thu, 15 Aug 2019 05:28:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728320AbfHOD2j (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 14 Aug 2019 23:28:39 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:34563 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728517AbfHOD2j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 14 Aug 2019 23:28:39 -0400
Received: by mail-qt1-f194.google.com with SMTP id q4so1089375qtp.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2019 20:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vmOEMpDgogk2v51C3ySUpxP4HnLnH+1N9fw2yd31Geo=;
        b=Uc5DxlAGkAhiI64FBhotgrW/PGj4q0hydzGXVNPiRF/iZ9PzLfwn2xD4YFSvdNYW6R
         6DlT/hsAcbNSydEpKxQbzKwnaPrHObYWQkL9hZC8W0N67RnG2NxpgEg9WSVG/Fh9oKXI
         JKl7dnf8cdkvcZduuWILlOEn27S5HxETYfEC6DPjMXJjDZCRs/PX3O+MWTOv9nILU0TM
         l6WE9bwjQTP2zlQdAg20Gn171fQnqxa+W/vmh+NEE9lk0zsAFjDVi8/OPVKWvcY5tqAL
         yEb3PrGZIYE6m+9VsBxqHZorzp5D0yEXky+Q1pSfVtpjg8LQFQsYKrwZhF9z2a1Or5AE
         MrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vmOEMpDgogk2v51C3ySUpxP4HnLnH+1N9fw2yd31Geo=;
        b=QuS3xIFek+h7823YsOCuxee4LbE5Rt7MWKXLC9rDHkwHNoLi+FOjU0skMCbwLSIshO
         FNisBEbYwj9zmBYvg2hE6gs40A58oNgEWnJWObhbcw9v/RTDUr2u+x0Be3KA5kn6+zkF
         kkp8liueePahdy8LSZLUJGkQOAWwXEULImqCOD2Zh7D0qvJ6Z2IN2nziMIEPYC8Tx2Ic
         6/mH+A5Szb4Ogt3Ea2PwS+zdgvTPbsS4BsnfD1HYJSt5qN/ycjTgZxsEUTpwcI7ClNTW
         pvzBRZ+WJFeHTvAg7a4xkU32C+rnCg6R3YmEU2dX9OZ1CkSOsmxJfjXRIDBtgHJu72/f
         33OQ==
X-Gm-Message-State: APjAAAUQcASRgfqd8sMjw9brv8lJC6IHGwOjGKTBi1sISPFXho8hsIPf
        LgYbFIw0NfABNzpoIKF5VcNvIZHnNiet2oO+ysdq/x0nQos=
X-Google-Smtp-Source: APXvYqy01b67x1bxC93EBVGcil5h6XOFZXFSqy4M2mywOEVNXGC/Rlx9qoDOb2+73etAoC4247QZqiU33xU7TduYNYM=
X-Received: by 2002:ac8:2cd6:: with SMTP id 22mr2180764qtx.80.1565839717603;
 Wed, 14 Aug 2019 20:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190813003023.6748-1-kristian@klausen.dk>
In-Reply-To: <20190813003023.6748-1-kristian@klausen.dk>
From:   Daniel Drake <drake@endlessm.com>
Date:   Thu, 15 Aug 2019 11:28:26 +0800
Message-ID: <CAD8Lp47pSr-0VWqSBTAAJe3Ny5gW2XMXXYxmiH5-EOk42MhvHw@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
To:     Kristian Klausen <kristian@klausen.dk>,
        =?UTF-8?Q?Ognjen_Gali=C4=87?= <smclt30p@gmail.com>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 13, 2019 at 8:30 AM Kristian Klausen <kristian@klausen.dk> wrote:
>
> Most newer ASUS laptops supports settings a maximum charging percentage,
> which help prolonging the battery life.
>
> Tested on a Zenbook UX430UNR.
>
> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> ---
> I can't pass the asus struct to asus_wmi_battery_{add,remove}, so I use a
> global variable. Is there any better way to do it?
> I think the implementation of asus_wmi_battery_{init,exit} could be
> improved, any ideas?

Added Ognjen and Rafael.
Is there a better way to have the sysfs file handlers of files added
via the battery hooking API reach back to the device that hooked in,
in order to access it's private data?
I see that thinkpad_acpi also uses global variables for this :(

> V3:
> Refactor to use the new battery hooking API[1] and knobs[2].
>
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa93854f7a7ed63d054405bf3779247d5300edd3
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=813cab8f3994250e136819ae48fbd1c95d980466
>
> V2:
> Add sysfs documentation.
> Reorder ASUS_WMI_CHARGE_THRESHOLD and rename to ASUS_WMI_DEVID_RSOC.
> Add a comment explaining the charge_threshold variable.
> Rephrase the commit message (charge threshold -> maximum charging
> percentage).
>
> The sysfs knob is still called "charge_threshold", as
> maximum_charging_percentage seems a bit long.
> I did look on some of the other platform modules, the LG module
> use battery_care_limit and the Samsung module use
> battery_life_extender.
>
>  drivers/platform/x86/asus-wmi.c            | 91 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  3 +
>  2 files changed, 94 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 34dfbed65332..06c830c1c04f 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -26,6 +26,7 @@
>  #include <linux/rfkill.h>
>  #include <linux/pci.h>
>  #include <linux/pci_hotplug.h>
> +#include <linux/power_supply.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/debugfs.h>
> @@ -36,6 +37,7 @@
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <acpi/video.h>
> +#include <acpi/battery.h>
>
>  #include "asus-wmi.h"
>
> @@ -368,6 +370,92 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>         return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>  }
>
> +/* Battery ********************************************************************/
> +
> +/* The battery maximum charging percentage */
> +static int charge_end_threshold;
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev,
> +                                                 struct device_attribute *attr,
> +                                                 const char *buf, size_t count)
> +{
> +       int value, ret, rv;
> +
> +       ret = kstrtouint(buf, 10, &value);
> +
> +       if (!count || ret != 0)
> +               return -EINVAL;
> +       if (value < 0 || value > 100)
> +               return -EINVAL;
> +
> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, value, &rv);
> +
> +       if (rv != 1)
> +               return -EIO;
> +
> +       /* There isn't any method in the DSDT to read the threshold, so we
> +        * save the threshold.
> +        */
> +       charge_end_threshold = value;
> +       return count;
> +}
> +
> +static ssize_t charge_control_end_threshold_show(struct device *device,
> +                                                struct device_attribute *attr,
> +                                                char *buf)
> +{
> +       return sprintf(buf, "%d\n", charge_end_threshold);
> +}
> +
> +static DEVICE_ATTR_RW(charge_control_end_threshold);
> +
> +static int asus_wmi_battery_add(struct power_supply *battery)
> +{
> +       /* The WMI method does not provide a way to specific a battery, so we
> +        * just assume it is the first battery.
> +        */
> +       if (!strcmp(battery->desc->name, "BAT0") == 0)
> +               return -ENODEV;
> +
> +       if (device_create_file(&battery->dev,
> +           &dev_attr_charge_control_end_threshold))
> +               return -ENODEV;
> +
> +       /* The charge threshold is only reset when the system is power cycled,
> +        * and we can't get the current threshold so let set it to 100% when
> +        * a battery is added.
> +        */
> +       asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> +       charge_end_threshold = 100;
> +
> +       return 0;
> +}
> +
> +static int asus_wmi_battery_remove(struct power_supply *battery)
> +{
> +       device_remove_file(&battery->dev,
> +                          &dev_attr_charge_control_end_threshold);
> +       return 0;
> +}
> +
> +static struct acpi_battery_hook battery_hook = {
> +       .add_battery = asus_wmi_battery_add,
> +       .remove_battery = asus_wmi_battery_remove,
> +       .name = "ASUS Battery Extension",
> +};
> +
> +static void asus_wmi_battery_init(struct asus_wmi *asus)
> +{
> +       if (asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_RSOC) >= 0)
> +               battery_hook_register(&battery_hook);
> +}

asus_wmi_get_devstate_simple() checks ASUS_WMI_DSTS_STATUS_BIT and
ASUS_WMI_DSTS_UNKNOWN_BIT for this device. However the spec makes no
mentions of those bits being valid in this case.
Your code probably works anyway but I think it would be better to use
asus_wmi_dev_is_present() instead.

> +static void asus_wmi_battery_exit(struct asus_wmi *asus)
> +{
> +       if (asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_RSOC) >= 0)
> +               battery_hook_unregister(&battery_hook);
> +}

The unregister here should probably happen on the condition that we
previously registered the hook.
Don't rely on the devstate bits, since they might have changed
unpredictably (who knows), there might be a problem communicating with
the hardware, etc.

>  /* LEDs ***********************************************************************/
>
>  /*
> @@ -2433,6 +2521,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>                 goto fail_wmi_handler;
>         }
>
> +       asus_wmi_battery_init(asus);
> +
>         asus_wmi_debugfs_init(asus);
>
>         return 0;
> @@ -2468,6 +2558,7 @@ static int asus_wmi_remove(struct platform_device *device)
>         asus_wmi_debugfs_exit(asus);
>         asus_wmi_sysfs_exit(asus->platform_device);
>         asus_fan_set_auto(asus);
> +       asus_wmi_battery_exit(asus);
>
>         kfree(asus);
>         return 0;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 409e16064f4b..60249e22e844 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -81,6 +81,9 @@
>  /* Deep S3 / Resume on LID open */
>  #define ASUS_WMI_DEVID_LID_RESUME      0x00120031
>
> +/* Maximum charging percentage */
> +#define ASUS_WMI_DEVID_RSOC            0x00120057
> +
>  /* DSTS masks */
>  #define ASUS_WMI_DSTS_STATUS_BIT       0x00000001
>  #define ASUS_WMI_DSTS_UNKNOWN_BIT      0x00000002
> --
> 2.22.0
>
