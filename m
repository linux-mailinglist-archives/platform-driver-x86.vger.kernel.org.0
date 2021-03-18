Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C4343409D3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Mar 2021 17:14:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhCRQO0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 18 Mar 2021 12:14:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24100 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231886AbhCRQOT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 12:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616084058;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=T8zIGo5aMMkeDnOaf7qQ/5UVhU5Z5eZf60PLmfXhlco=;
        b=J5/8dipwnjF03RVfkcWMea+bvublJY1H0DFmBqD0+gxJkSzsLWcS/iz93SCRFuWBN5s+Ds
        zUf1BExvOg3r64RG1ZBqQxKz9QwsyDS8m09O8qN5loEGC5k6iRuKXRInObmaDh8wi60GHZ
        tec5OUKkjLB6YMFe3yXN2gyVaoh27m4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-B__pVIKcPJWFWDkaqQoL_A-1; Thu, 18 Mar 2021 12:14:03 -0400
X-MC-Unique: B__pVIKcPJWFWDkaqQoL_A-1
Received: by mail-ej1-f69.google.com with SMTP id v27so12092597ejq.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Mar 2021 09:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T8zIGo5aMMkeDnOaf7qQ/5UVhU5Z5eZf60PLmfXhlco=;
        b=TTeND4aP0gcrpP54KaBKuGRSHpq82GTwts/HVJ6NMjqmcqyWIhnwImWYL0jHVYRabF
         Ro8A2vC8bmSq6WE+/51z/Qlgzg0D6inShrR96TsSuHNjHZnCVRDfSqRKh1tdBwgzylAi
         eP4ujZPU4jZEokF6ikF7sScQuTPlUK6PX3gyIr7WHzITBGGNLZMHLfClfHCvCdqTKcWU
         haDA/bH7j9J0/C9q2pEhATkEnJqmYe/V0PNJJJ/uSFAIIaPksnLyYppUSRRAuuPqplNk
         vd+Z80KZ4WivWV9rQ3pQEaUgD9HH7eboz4gVGXe+zyJvGAVtk/EHl7tgm//13p8fzSBl
         Vpmw==
X-Gm-Message-State: AOAM531/4nNmkWZeqqlnOZPyZRRD0kFDB7FgC8N0jTtRM0FHBRoRk7tx
        UmT194843Onq+dirK2MBPZEVrjCGCFqWanAYL6iQEhiEs9v8TUW0nCptRJw5ZzugOFGzVplvOfQ
        zNZ6B6WngwmUKH56heuXxnIeXRbsA6eZlWw==
X-Received: by 2002:a05:6402:b48:: with SMTP id bx8mr4802470edb.162.1616084042368;
        Thu, 18 Mar 2021 09:14:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwAaUILc6vRJ9VYGVtNEpSTl0X1EEOY6ubNb0CKPEew/dnK92T58ifpV8BEIvstNPOxQ2Pnw==
X-Received: by 2002:a05:6402:b48:: with SMTP id bx8mr4802444edb.162.1616084042077;
        Thu, 18 Mar 2021 09:14:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gq25sm2246023ejb.85.2021.03.18.09.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 09:14:01 -0700 (PDT)
Subject: Re: [V2,1/1] platform/x86: add support for Advantech software defined
 button
To:     YingChieh Ho <andrea.cs97g@nctu.edu.tw>,
        platform-driver-x86@vger.kernel.org,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Mark Gross <mgross@linux.intel.com>, linux-kernel@vger.kernel.org,
        Andrea Ho <andrea.ho@advantech.com.tw>
References: <CAGBRx8NKMqYxz=PWHnHQoxP4f9J4faooMt82DwUAKT8oWYH34w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <283c9df1-9911-d0bd-7db5-2349927c21d1@redhat.com>
Date:   Thu, 18 Mar 2021 17:14:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAGBRx8NKMqYxz=PWHnHQoxP4f9J4faooMt82DwUAKT8oWYH34w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/12/21 9:11 AM, YingChieh Ho wrote:
> From: "Andrea.Ho" <Andrea.Ho@advantech.com.tw>
> 
> Advantech sw_button is a ACPI event trigger button.
> 
> With this driver, we can report KEY_EVENT on the
> Advantech Tabletop Network Appliances products and it has been
> tested in FWA1112VC.
> 
> Add the software define button support to report EV_REP key_event
> (KEY_PROG1) by pressing button that cloud be get on user
> interface and trigger the customized actions.
> 
> Signed-off-by: Andrea.Ho <Andrea.Ho@advantech.com.tw>
> 
> v2:
>         - change evdev key-code from BTN_TRIGGER_HAPPY to KEY_PROG1
>         - to rewrite the driver to be a regular platform_driver
>         - use specific names instead of generic names,
>           "Software Button" to "Advantech Software Button",
>           "button" to "adv_swbutton"
>         - remove unused defines or use-once defines, ACPI_BUTTON_FILE_INFO,
>           ACPI_BUTTON_FILE_STATE, ACPI_BUTTON_TYPE_UNKNOWN, ACPI_SWBTN_NAME

Thank you this version is much better, I have various review remarks below.

Please send a v3 with those fixed.


> ---
>  MAINTAINERS                         |   5 +
>  drivers/platform/x86/Kconfig        |  11 ++
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/adv_swbutton.c | 192 ++++++++++++++++++++++++++++
>  4 files changed, 211 insertions(+)
>  create mode 100644 drivers/platform/x86/adv_swbutton.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 68f21d46614c..e35c48e411b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -562,6 +562,11 @@ S: Maintained
>  F:     Documentation/scsi/advansys.rst
>  F:     drivers/scsi/advansys.c
> 
> +ADVANTECH SWBTN DRIVER
> +M:     Andrea Ho <Andrea.Ho@advantech.com.tw>
> +S:     Maintained
> +F:     drivers/platform/x86/adv_swbutton.c
> +
>  ADXL34X THREE-AXIS DIGITAL ACCELEROMETER DRIVER (ADXL345/ADXL346)
>  M:     Michael Hennerich <michael.hennerich@analog.com>
>  S:     Supported
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0581a54cf562..b1340135c5e9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -180,6 +180,17 @@ config ACER_WMI
>           If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>           here.

This is supposed to be indented by a space (from the diff format) and then
a tab + 2 spaces, but in your patch this is now indented by 10 spaces.

In general your entire patch has all tabs replaced by spaces, I guess that
your mail-client or editor is mangling things. Please do the following:

1. Check your patch for checkpatch errors:

git format-patch HEAD~
scripts/checkpatch.pl 0001-platform...patch

And fix all reported issues, both whitespace issues and others.

2. Send the next version of the patch like this:

git format-patch -v3 HEAD~
git send-email v3-0001-platform...patch

Do NOT edit the v3-0001-platform...patch file between these 2 steps.


> +config ADV_SWBUTTON
> +    tristate "Advantech ACPI Software Button Driver"

You are using indent steps of 4 spaces here, that should be a tab
> +    depends on ACPI
> +    help
> +      Say Y here to enable support for Advantech software defined
> +      button feature. More information can be fount at
> +      <http://www.advantech.com.tw/products/>

And a tab and 2 spaces for the help text.

> +
> +      To compile this driver as a module, choose M here. The module will
> +      be called adv_swbutton.
> +
>  config APPLE_GMUX
>         tristate "Apple Gmux Driver"
>         depends on ACPI && PCI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 2b85852a1a87..76a321fc58ba 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -22,6 +22,9 @@ obj-$(CONFIG_ACERHDF)         += acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)    += acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)         += acer-wmi.o
> 
> +# Advantech
> +obj-$(CONFIG_ADV_SWBUTTON)  += adv_swbutton.o
> +

The indent before the += should use tabs not spaces.

>  # Apple
>  obj-$(CONFIG_APPLE_GMUX)       += apple-gmux.o
> 
> diff --git a/drivers/platform/x86/adv_swbutton.c
> b/drivers/platform/x86/adv_swbutton.c
> new file mode 100644
> index 000000000000..f4387220e8a0
> --- /dev/null
> +++ b/drivers/platform/x86/adv_swbutton.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  adv_swbutton.c - Software Button Interface Driver.
> + *
> + *  (C) Copyright 2020 Advantech Corporation, Inc
> + *
> + */
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/version.h>
> +#include <linux/types.h>
> +#include <linux/proc_fs.h>
> +#include <linux/input.h>
> +#include <linux/slab.h>
> +#include <linux/acpi.h>
> +#include <linux/platform_device.h>
> +#include <acpi/button.h>
> +#include <acpi/acpi_drivers.h>

Please drop the following unused defines:

#include <linux/init.h>
#include <linux/version.h>
#include <linux/types.h>
#include <linux/proc_fs.h>
#include <linux/slab.h>
#include <acpi/button.h>
#include <acpi/acpi_drivers.h>

And sort the remaining includes alphabetically.

> +
> +#define MODULE_NAME                         "adv_swbutton"

Please drop this define, instead just set the .driver.name part of the platform_driver struct directly to "adv_swbutton".

> +
> +#define ACPI_BUTTON_HID_SWBTN               "AHC0310"
> +#define ACPI_BUTTON_TYPE_SOFTWARE           0x07

Please drop the ACPI_BUTTON_TYPE_SOFTWARE define.

> +
> +#define ACPI_BUTTON_NOTIFY_SWBTN_RELEASE    0x86
> +#define ACPI_BUTTON_NOTIFY_SWBTN_PRESSED    0x85
> +
> +#define SOFTWARE_BUTTON                     KEY_PROG1

Please drop this unnecessary define and just use KEY_PROG1 directly.

> +
> +#define _COMPONENT                          ACPI_BUTTON_COMPONENT
> +
> +struct acpi_button {

Please give this struct-type a different name, e.g. use:

struct adv_swbutton {

> +       unsigned int type;

And drop the type here, it is always set to ACPI_BUTTON_TYPE_SOFTWARE, so it has no function.

> +       struct input_dev *input;
> +       char phys[32];
> +       bool pressed;

Also please drop the pressed bool, see below.


> +};
> +
> +/*-------------------------------------------------------------------------
> + *                               Driver Interface
> + *--------------------------------------------------------------------------
> + */
> +static void acpi_button_notify(acpi_handle handle, u32 event, void *context)
> +{
> +       struct acpi_device *device = context;
> +
> +       struct acpi_button *button = dev_get_drvdata(&device->dev);

You must not call dev_set_drvdata on the acpi_device since you are not binding
to the acpi_device, you are binding to the platform_device, so set the drv_data
there and please don't touch the acpi_device.

> +       struct input_dev *input;
> +
> +       int keycode, BTN_KEYCODE = SOFTWARE_BUTTON;

Please drop these 3 variables, they are not necessary.

> +
> +       switch (event) {
> +       case ACPI_BUTTON_NOTIFY_SWBTN_RELEASE:
> +               input = button->input;

Just use button->input below instead of having this unnecessary
helper variable.

> +
> +               if (!button->pressed)
> +                       return;

This is not necessary, the input core takes care of not sending
events when the state does not change.

> +
> +               keycode = test_bit(BTN_KEYCODE, input->keybit) ?
> +                               BTN_KEYCODE : KEY_UNKNOWN;

No idea why you are doing this, but it is not necessary,
also it is wrong, you should be using KEY_PROG1 here.

> +
> +               button->pressed = false;

Keeping track of the pressed state is not necessary.

> +
> +               input_report_key(input, keycode, 0);
> +               input_sync(input);

Basically this entire case can be simplified to:

       case ACPI_BUTTON_NOTIFY_SWBTN_RELEASE:
               input_report_key(button->input, KEY_PROG1, 0);
               input_sync(button->input);
               break;


> +       break;

This break is indented wrong.

> +       case ACPI_BUTTON_NOTIFY_SWBTN_PRESSED:
> +               input = button->input;
> +               button->pressed = true;
> +
> +               keycode = test_bit(BTN_KEYCODE, input->keybit) ?
> +                           BTN_KEYCODE : KEY_UNKNOWN;
> +
> +               input_report_key(input, keycode, 1);
> +               input_sync(input);
> +       break;

And the same as above here, this can be simplified to:

       case ACPI_BUTTON_NOTIFY_SWBTN_PRESSED:
               input_report_key(button->input, KEY_PROG1, 1);
               input_sync(button->input);
               break;


> +       default:
> +               ACPI_DEBUG_PRINT((ACPI_DB_INFO,
> +                                 "Unsupported event [0x%x]\n", event));

Please don't use ACPI_DEBUG_PRINTF outside of drivers/acpi, instead
use:

                  dev_dbg(&platform_device->dev, ...);

> +       break;

There is no need for a break at the end of a switch-case

> +       }
> +}
> +
> +static int acpi_button_probe(struct platform_device *device)
> +{
> +       struct acpi_device *acpi_device;
> +       struct acpi_button *button;
> +       struct input_dev *input;
> +       acpi_status status;
> +
> +       int error;
> +
> +       acpi_device = ACPI_COMPANION(&device->dev);
> +       if (!acpi_device) {
> +               dev_err(&device->dev, "ACPI companion is missing\n");
> +               return -ENOMEM;
> +       }
> +
> +       status = acpi_install_notify_handler(acpi_device->handle,
> +                                            ACPI_DEVICE_NOTIFY,
> +                                            acpi_button_notify,
> +                                            acpi_device);
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&device->dev, "Error installing notify handler\n");
> +               error = -ENODEV;
> +       }

This needs to be done at the end of probe, if the notifier now runs, before
you have called dev_set_drvdata(), you will have a NULL pointer deref,
and even if the dev_set_drvdata() then the notifier may run before you have
set button->input = input and you still have a NULL pointer deref.

So first setup everything and only then call acpi_install_notify_handler().

> +
> +       button = devm_kzalloc(&acpi_device->dev, sizeof(*button), GFP_KERNEL);
> +       if (!button)
> +               return -ENOMEM;
> +
> +       dev_set_drvdata(&acpi_device->dev, button);

Call this on the platform_device, so:

       dev_set_drvdata(&device->dev, button);

Also see above.

> +
> +       input = devm_input_allocate_device(&acpi_device->dev);
> +       if (!input) {
> +               error =  -ENOMEM;
> +               goto err_free_mem;

There is no need for the goto err_free_mem here (see below), so this
can be simplified to just:

      input = devm_input_allocate_device(&acpi_device->dev);
      if (!input)
               return -ENOMEM;

> +       }
> +
> +       button->input = input;
> +       button->type = ACPI_BUTTON_TYPE_SOFTWARE;
> +       button->pressed = false;

Drop the setting of type/pressed, see above.


> +
> +       snprintf(button->phys, sizeof(button->phys),
> "%s/button/input0", ACPI_BUTTON_HID_SWBTN);
> +
> +       input->name = "Advantech Software Button";
> +       input->phys = button->phys;
> +       input->id.bustype = BUS_HOST;
> +       input->id.product = button->type;

Don't set product to some semi-random value. Just leave it at 0.

> +       input->dev.parent = &acpi_device->dev;

This should be:

	input->dev.parent = &device->dev;

> +
> +       switch (button->type) {
> +       case ACPI_BUTTON_TYPE_SOFTWARE:
> +               set_bit(EV_KEY, input->evbit);
> +               set_bit(EV_REP, input->evbit);
> +
> +               input_set_capability(input, EV_KEY, SOFTWARE_BUTTON);
> +       break;
> +       }

button->type always equals ACPI_BUTTON_TYPE_SOFTWARE, so you can drop the whole
switch-case here and input_set_capability(input, EV_KEY, ...) already does:
set_bit(EV_KEY, input->evbit);, so this entire block can be simplified to just:

          set_bit(EV_REP, input->evbit);
          input_set_capability(input, EV_KEY, KEY_PROG1);


> +
> +       input_set_drvdata(input, acpi_device);

You are never using the drvdata associated with the input_dev, so
this can be dropped. Also please don't use acpi_device for this/

> +       error = input_register_device(input);
> +       if (error)
> +               return error;
> +
> +       device_init_wakeup(&acpi_device->dev, true);

Don't use acpi_device, instead do:

          device_init_wakeup(&device->dev, true);



	
> +
> +       return 0;
> +
> +err_free_mem:
> +       devm_kfree(&device->dev, button);

devm_kzalloced mem will automatically be free-ed when the probe function
returns with an error, or when the driver is unbound (removed) so there
is no need to call devm_kfree() here.

> +       return error;
> +}
> +
> +static int acpi_button_remove(struct platform_device *device)
> +{
> +       struct acpi_device *acpi_device = ACPI_COMPANION(&device->dev);
> +       struct acpi_button *button = dev_get_drvdata(&acpi_device->dev);
> +
> +       acpi_remove_notify_handler(acpi_device->handle, ACPI_DEVICE_NOTIFY,
> +                                  acpi_button_notify);
> +
> +       input_unregister_device(button->input);
> +       devm_kfree(&acpi_device->dev, button);

The input_unregister_device() and devm_kfree() will be done automatically
when the remove function exits, so you can drop these 2 calls.

> +
> +       return 0;
> +}
> +
> +static const struct acpi_device_id button_device_ids[] = {
> +       {ACPI_BUTTON_HID_SWBTN, 0},
> +       {"", 0},
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, button_device_ids);
> +
> +static struct platform_driver acpi_button_driver = {
> +       .driver = {
> +               .name = MODULE_NAME,
> +               .acpi_match_table = button_device_ids,
> +       },
> +       .probe = acpi_button_probe,
> +       .remove = acpi_button_remove,
> +};
> +
> +module_platform_driver(acpi_button_driver);
> +

This is not an ACPI driver, please drop the ACPI_MODULE_NAME() call.

> +ACPI_MODULE_NAME(MODULE_NAME);
> +
> +MODULE_AUTHOR("Andrea Ho");
> +MODULE_DESCRIPTION("Advantech ACPI SW Button Driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.17.1
> 

Regards,

Hans

