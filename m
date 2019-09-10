Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89550AE846
	for <lists+platform-driver-x86@lfdr.de>; Tue, 10 Sep 2019 12:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbfIJKhc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 10 Sep 2019 06:37:32 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:36633 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726193AbfIJKhc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 10 Sep 2019 06:37:32 -0400
Received: by mail-pf1-f193.google.com with SMTP id y22so11308740pfr.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 10 Sep 2019 03:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u9/Jji7yDwqO7ZLTfqiIFunRCfjFDlaNqO+nuASsHq8=;
        b=jlcg+U6r+lvRqFS3/w3hjiArf5FK9xFmNgzvrzPEwFmAE3CaFH0oNGjTPorZfKo7me
         U36739KC4BD2glN/0PPlI01hRcHLYmG9oIINun+LL7uflLnqVeqDBciuylHQkCp0QAQc
         +EBi7nhOME/rCX6bo1v6FMsyjDICv3fpkL8OyXoniWrnNMDogr5MlTJfP4OV1LuQ0svg
         GBzt7fN1gxsjTtz4UfUp/pYbo/69WGRvz8VM/9+72S00r/GzlYwKjE+LenMldO+P3qtU
         2Tq4gTdHTyI3I5IV5nN+eWtBsMTzwhiaG4sU+sji+oZmGbQQAkRf8+lRTxHyp/g51QH6
         benQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u9/Jji7yDwqO7ZLTfqiIFunRCfjFDlaNqO+nuASsHq8=;
        b=I4QRdnYeQ4Na5akd28/IMV5UfNT96I3BBTStJFlTb0YAOIfGxrLyUKDi8ShRycxwml
         dCdZyYLgrb55rKDIR4VHLC1SCu1mWQWfaUDX2BFv1hMTfbUfv/ODQiSek3ocu8zhfvBy
         IVtpWtRK+EEN8SjFrbH1npqrtayvf7kjOX3xNvwKoJKXjnbO9Y8bEsyh0mNOSixPzMaE
         DyqnQ9IIUbNkD0hH/Hxb2RJsIjAOi98g/pJom8fIs//GkmKbXIDDvnMlkKwjl4KOxEDv
         EY04TUDGLE420Lcu+3SpTwWA2LGxQPFcQInUhHAme8Iq5teTBxnunv2xxeigoomzdf1P
         kGfw==
X-Gm-Message-State: APjAAAVjj7Bk9u3mAlTSRA0jYco8Dr1TIFgdy5Qlkvupii/QDC0T4EVO
        R/19MwumlV9c3av5L/uZIvTnUcCczHUpb4Rd9n8=
X-Google-Smtp-Source: APXvYqylxSkOWLdwu/d6UUIxt0/2YBZH6QymiR4rL4IfA+uYEgxZCede96nla6AT09BV1FR83eHOepjbwfy3jXn8xVM=
X-Received: by 2002:a62:c141:: with SMTP id i62mr34681819pfg.64.1568111850185;
 Tue, 10 Sep 2019 03:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190909173128.1670-1-kristian@klausen.dk> <20190909173128.1670-3-kristian@klausen.dk>
 <b7ea610a-993c-78d6-d633-2dd7e647b6c2@klausen.dk>
In-Reply-To: <b7ea610a-993c-78d6-d633-2dd7e647b6c2@klausen.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 10 Sep 2019 13:37:19 +0300
Message-ID: <CAHp75Vcar0XKMYdaBd4s97xHdLsfLD3tYox9GtwVXVo57rJwvQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] platform/x86: asus-wmi: Refactor charge threshold to
 use the battery hooking API
To:     Kristian Klausen <kristian@klausen.dk>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Daniel Drake <drake@endlessm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Sep 10, 2019 at 12:15 PM Kristian Klausen <kristian@klausen.dk> wrote:
>
> On 09.09.2019 19.31, Kristian Klausen wrote:
> > At the same time use the official naming for the knobs.
> >
> > Tested on a Zenbook UX430UNR.
> >

All three pushed to my review and testing queue, thanks!

> > Signed-off-by: Kristian Klausen <kristian@klausen.dk>
> > ---
> >   drivers/platform/x86/asus-wmi.c | 147 +++++++++++++++++++++-----------
> >   1 file changed, 98 insertions(+), 49 deletions(-)
> >
> > diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> > index 92c149dc2e6e..4dad22c0384b 100644
> > --- a/drivers/platform/x86/asus-wmi.c
> > +++ b/drivers/platform/x86/asus-wmi.c
> > @@ -26,6 +26,7 @@
> >   #include <linux/rfkill.h>
> >   #include <linux/pci.h>
> >   #include <linux/pci_hotplug.h>
> > +#include <linux/power_supply.h>
> >   #include <linux/hwmon.h>
> >   #include <linux/hwmon-sysfs.h>
> >   #include <linux/debugfs.h>
> > @@ -36,6 +37,7 @@
> >   #include <linux/acpi.h>
> >   #include <linux/dmi.h>
> >   #include <acpi/video.h>
> > +#include <acpi/battery.h>
> >
> >   #include "asus-wmi.h"
> >
> > @@ -195,7 +197,8 @@ struct asus_wmi {
> >       u8 fan_boost_mode_mask;
> >       u8 fan_boost_mode;
> >
> > -     int charge_threshold;
> > +     // The RSOC controls the maximum charging percentage.
> > +     bool battery_rsoc_available;
> >
> >       struct hotplug_slot hotplug_slot;
> >       struct mutex hotplug_lock;
> > @@ -369,6 +372,97 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
> >       return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
> >   }
> >
> > +/* Battery ********************************************************************/
> > +
> > +/* The battery maximum charging percentage */
> > +static int charge_end_threshold;
> > +
> > +static ssize_t charge_control_end_threshold_store(struct device *dev,
> > +                                               struct device_attribute *attr,
> > +                                               const char *buf, size_t count)
> > +{
> > +     int value, ret, rv;
> > +
> > +     ret = kstrtouint(buf, 10, &value);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (value < 0 || value > 100)
> > +             return -EINVAL;
> > +
> > +     ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, value, &rv);
> > +     if(ret)
> A space is required here, I forgot to run ./scripts/checkpatch.pl before
> submitting the patch series.
> > +             return ret;
> > +
> > +     if (rv != 1)
> > +             return -EIO;
> > +
> > +     /* There isn't any method in the DSDT to read the threshold, so we
> > +      * save the threshold.
> > +      */
> > +     charge_end_threshold = value;
> > +     return count;
> > +}
> > +
> > +static ssize_t charge_control_end_threshold_show(struct device *device,
> > +                                              struct device_attribute *attr,
> > +                                              char *buf)
> > +{
> > +     return sprintf(buf, "%d\n", charge_end_threshold);
> > +}
> > +
> > +static DEVICE_ATTR_RW(charge_control_end_threshold);
> > +
> > +static int asus_wmi_battery_add(struct power_supply *battery)
> > +{
> > +     /* The WMI method does not provide a way to specific a battery, so we
> > +      * just assume it is the first battery.
> > +      */
> > +     if (!strcmp(battery->desc->name, "BAT0") == 0)
> > +             return -ENODEV;
> > +
> > +     if (device_create_file(&battery->dev,
> > +         &dev_attr_charge_control_end_threshold))
> > +             return -ENODEV;
> > +
> > +     /* The charge threshold is only reset when the system is power cycled,
> > +      * and we can't get the current threshold so let set it to 100% when
> > +      * a battery is added.
> > +      */
> > +     asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> > +     charge_end_threshold = 100;
> > +
> > +     return 0;
> > +}
> > +
> > +static int asus_wmi_battery_remove(struct power_supply *battery)
> > +{
> > +     device_remove_file(&battery->dev,
> > +                        &dev_attr_charge_control_end_threshold);
> > +     return 0;
> > +}
> > +
> > +static struct acpi_battery_hook battery_hook = {
> > +     .add_battery = asus_wmi_battery_add,
> > +     .remove_battery = asus_wmi_battery_remove,
> > +     .name = "ASUS Battery Extension",
> > +};
> > +
> > +static void asus_wmi_battery_init(struct asus_wmi *asus)
> > +{
> > +     asus->battery_rsoc_available = false;
> > +     if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_RSOC)) {
> > +             asus->battery_rsoc_available = true;
> > +             battery_hook_register(&battery_hook);
> > +     }
> > +}
> > +
> > +static void asus_wmi_battery_exit(struct asus_wmi *asus)
> > +{
> > +     if (asus->battery_rsoc_available)
> > +             battery_hook_unregister(&battery_hook);
> > +}
> > +
> >   /* LEDs ***********************************************************************/
> >
> >   /*
> > @@ -2052,45 +2146,6 @@ static ssize_t cpufv_store(struct device *dev, struct device_attribute *attr,
> >
> >   static DEVICE_ATTR_WO(cpufv);
> >
> > -
> > -static ssize_t charge_threshold_store(struct device *dev,
> > -                                   struct device_attribute *attr,
> > -                                   const char *buf, size_t count)
> > -{
> > -     struct asus_wmi *asus = dev_get_drvdata(dev);
> > -     int value, ret, rv;
> > -
> > -     ret = kstrtouint(buf, 10, &value);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (value < 0 || value > 100)
> > -             return -EINVAL;
> > -
> > -     ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, value, &rv);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (rv != 1)
> > -             return -EIO;
> > -
> > -     /* There isn't any method in the DSDT to read the threshold, so we
> > -      * save the threshold.
> > -      */
> > -     asus->charge_threshold = value;
> > -     return count;
> > -}
> > -
> > -static ssize_t charge_threshold_show(struct device *dev,
> > -                                  struct device_attribute *attr, char *buf)
> > -{
> > -     struct asus_wmi *asus = dev_get_drvdata(dev);
> > -
> > -     return sprintf(buf, "%d\n", asus->charge_threshold);
> > -}
> > -
> > -static DEVICE_ATTR_RW(charge_threshold);
> > -
> >   static struct attribute *platform_attributes[] = {
> >       &dev_attr_cpufv.attr,
> >       &dev_attr_camera.attr,
> > @@ -2099,7 +2154,6 @@ static struct attribute *platform_attributes[] = {
> >       &dev_attr_lid_resume.attr,
> >       &dev_attr_als_enable.attr,
> >       &dev_attr_fan_boost_mode.attr,
> > -     &dev_attr_charge_threshold.attr,
> >       NULL
> >   };
> >
> > @@ -2123,8 +2177,6 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
> >               devid = ASUS_WMI_DEVID_ALS_ENABLE;
> >       else if (attr == &dev_attr_fan_boost_mode.attr)
> >               ok = asus->fan_boost_mode_available;
> > -     else if (attr == &dev_attr_charge_threshold.attr)
> > -             devid = ASUS_WMI_DEVID_RSOC;
> >
> >       if (devid != -1)
> >               ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
> > @@ -2450,13 +2502,9 @@ static int asus_wmi_add(struct platform_device *pdev)
> >               goto fail_wmi_handler;
> >       }
> >
> > +     asus_wmi_battery_init(asus);
> > +
> >       asus_wmi_debugfs_init(asus);
> > -     /* The charge threshold is only reset when the system is power cycled,
> > -      * and we can't get the current threshold so let set it to 100% on
> > -      * module load.
> > -      */
> > -     asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
> > -     asus->charge_threshold = 100;
> >
> >       return 0;
> >
> > @@ -2491,6 +2539,7 @@ static int asus_wmi_remove(struct platform_device *device)
> >       asus_wmi_debugfs_exit(asus);
> >       asus_wmi_sysfs_exit(asus->platform_device);
> >       asus_fan_set_auto(asus);
> > +     asus_wmi_battery_exit(asus);
> >
> >       kfree(asus);
> >       return 0;
>


-- 
With Best Regards,
Andy Shevchenko
