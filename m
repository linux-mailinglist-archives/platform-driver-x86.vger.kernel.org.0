Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A6F06D9439
	for <lists+platform-driver-x86@lfdr.de>; Thu,  6 Apr 2023 12:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236339AbjDFKfZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 6 Apr 2023 06:35:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229820AbjDFKfY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 06:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14B734C08
        for <platform-driver-x86@vger.kernel.org>; Thu,  6 Apr 2023 03:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680777276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nXa8cR9taAiSOmGD/OoboDS1scOLjaOzfzq/SJu4R70=;
        b=KvUL6lFGA0o30m8A2gIWuOVrBuFlmZLJrsKAU09StwovbnWGT5DJTXpH01wUcCxo5+KEFc
        XLNTw++i7jIaJgMnmMqawJhf8Rf56UTXn2SQE0Qlh4UCbH4SNSolH1R63YmD0J5bil1Koq
        wsqjw9/KJ8lnaB3M55jIwnHsreSKoA4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-JM-6l-9gMJClNcXlwvFfLA-1; Thu, 06 Apr 2023 06:34:35 -0400
X-MC-Unique: JM-6l-9gMJClNcXlwvFfLA-1
Received: by mail-ej1-f72.google.com with SMTP id fy17-20020a1709069f1100b00948fd62a55cso38467ejc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 06 Apr 2023 03:34:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680777273; x=1683369273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nXa8cR9taAiSOmGD/OoboDS1scOLjaOzfzq/SJu4R70=;
        b=nQL66tQR1BgnZUpnftI6XK1sj+BfafvN2Pb/a0rvl1/bsLH0WycasN59dCDA2hwuPw
         JCdJgixCpD6CLqxSlPrK9nEq63Ko/uJgfQOMgKrwJETYvjLPxaAMjTpdiKBlAcEjCBgh
         UsJrdN4RoL0aQx1kPTQu1g23UWz2on+t8F3MrHNt2aqrTALh2M7OohmIQ15pF2eY0ynM
         n4F0e32cF4q4SCgj/uO7e+Yi1ylpzUa4J9fWSUyTHqaJThj4zBA3BX7XIjeco8PAiv/i
         NkVgw9Df91yXUZhZJVrbEq6r6XfA+QcVKmK3D2FMIHEI9dSfFMJNAvg/SI2ans/TKWmR
         JgFw==
X-Gm-Message-State: AAQBX9d8CY6mEldV4zrtJKRyLBqCCw+omU8jcGxyzA216XDo27fDyvl7
        dNzgAKAR7S8K80rNPwj7yO81F7/KJcSYluIS9B0iuVF5bO6NsUgc80l1RY4jhBCJHs0/8S+7uZE
        lcEvkmxPLvmhbSFC/xHOw5pvlYGJMKcHJI4nrz/D4Mg==
X-Received: by 2002:a17:906:4e56:b0:948:b988:8cc3 with SMTP id g22-20020a1709064e5600b00948b9888cc3mr5506965ejw.75.1680777273228;
        Thu, 06 Apr 2023 03:34:33 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yg+AaaioBieP6I/juW6eZiFmzd7CmZn6IDODYrBIr9P+GevyUxBcVi7hUGLZ03OIiu6Q2hXA==
X-Received: by 2002:a17:906:4e56:b0:948:b988:8cc3 with SMTP id g22-20020a1709064e5600b00948b9888cc3mr5506950ejw.75.1680777272879;
        Thu, 06 Apr 2023 03:34:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id td1-20020a1709078c8100b009481d17befdsm647518ejc.2.2023.04.06.03.34.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 03:34:32 -0700 (PDT)
Message-ID: <a24153ed-fafc-0e73-1db1-35168464b973@redhat.com>
Date:   Thu, 6 Apr 2023 12:34:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/2] platform/x86: Add driver for Yoga Tablet Mode
 switch
Content-Language: en-US, nl
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
        linux-input@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
References: <20230329014559.44494-1-kallmeyeras@gmail.com>
 <20230329014559.44494-3-kallmeyeras@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230329014559.44494-3-kallmeyeras@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andrew,

Thank you for your patch. I have merged this now,
with tiny code cleanups squashed in.

I've described the code-cleanups below (inline) :

On 3/29/23 03:45, Andrew Kallmeyer wrote:
> From: Gergo Koteles <soyer@irl.hu>
> 
> This WMI driver for the tablet mode control switch for Lenovo Yoga
> notebooks was originally written by Gergo Koteles. The mode is mapped to
> a SW_TABLET_MODE switch capable input device.
> 
> Andrew followed the suggestions that were posted in reply to Gergo's RFC
> patch, and on the v1 & v2 versions of this patch to follow-up and get it
> merged.
> 
> Changes from Gergo's RFC:
> 
>  - Refactored obtaining a reference to the EC ACPI device needed for the
>    quirk implementation as suggested by Hans de Goede
>  - Applied small fixes and switched to always registering handles with
>    the driver for automatic cleanup as suggested by Barnabás Pőcze.
>  - Merged the lenovo_ymc_trigger_ec function with the
>    ideapad_trigger_ymc_next_read function since it was no longer
>    external.
>  - Added the word "Tablet" to the driver description to hopefully make
>    it more clear.
>  - Fixed the LENOVO_YMC_QUERY_METHOD ID and the name string for the EC
>    APCI device trigged for the quirk
>  - Triggered the input event on probe so that the initial tablet mode
>    state when the driver is loaded is reported to userspace as suggested
>    by Armin Wolf.
>  - Restricted the permissions of the ec_trigger parameter as suggested
>    by Armin Wolf. Also updated the description.
> 
> We have tested this on the Yoga 7 14AIL7 for the non-quirk path and on
> the Yoga 7 14ARB7 which has the firmware bug that requires triggering
> the embedded controller to send the mode change events. This workaround
> is also used by the Windows drivers.
> 
> According to reports at https://github.com/lukas-w/yoga-usage-mode,
> which uses the same WMI devices, the following models should also work:
> Yoga C940, Ideapad flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7, etc.
> 
> Signed-off-by: Gergo Koteles <soyer@irl.hu>
> Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
> Link: https://lore.kernel.org/r/20230310041726.217447-1-kallmeyeras@gmail.com/
> Link: https://lore.kernel.org/r/20230323025200.5462-1-kallmeyeras@gmail.com/
> ---
>  drivers/platform/x86/Kconfig          |  10 ++
>  drivers/platform/x86/Makefile         |   1 +
>  drivers/platform/x86/ideapad-laptop.h |   1 +
>  drivers/platform/x86/lenovo-ymc.c     | 186 ++++++++++++++++++++++++++
>  4 files changed, 198 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-ymc.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 5692385e2..858be0c65 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -470,6 +470,16 @@ config IDEAPAD_LAPTOP
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
>  
> +config LENOVO_YMC
> +	tristate "Lenovo Yoga Tablet Mode Control"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on IDEAPAD_LAPTOP

I don't believe that we need any symbols from IDEAPAD_LAPTOP with
the new static inline helpers, so I've dropped this depends on.

> +	select INPUT_SPARSEKMAP
> +	help
> +	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
> +	  events for Lenovo Yoga notebooks.
> +
>  config SENSORS_HDAPS
>  	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
>  	depends on INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 1d3d1b025..10054cdea 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>  # IBM Thinkpad and Lenovo
>  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>  obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
>  obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>  obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
> diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
> index 7dd8ce027..2564cb1cd 100644
> --- a/drivers/platform/x86/ideapad-laptop.h
> +++ b/drivers/platform/x86/ideapad-laptop.h
> @@ -35,6 +35,7 @@ enum {
>  	VPCCMD_W_FAN,
>  	VPCCMD_R_RF,
>  	VPCCMD_W_RF,
> +	VPCCMD_W_YMC = 0x2A,
>  	VPCCMD_R_FAN = 0x2B,
>  	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
>  	VPCCMD_W_BL_POWER = 0x33,
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
> new file mode 100644
> index 000000000..5e520a764
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * lenovo-ymc.c - Lenovo Yoga Mode Control driver
> + *
> + * Copyright © 2022 Gergo Koteles <soyer@irl.hu>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/wmi.h>
> +#include "ideapad-laptop.h"
> +
> +#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
> +#define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
> +
> +#define LENOVO_YMC_QUERY_INSTANCE 0
> +#define LENOVO_YMC_QUERY_METHOD 0x01
> +
> +static bool ec_trigger __read_mostly;
> +module_param(ec_trigger, bool, 0444);
> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering work-around to force emitting tablet mode events");
> +
> +static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
> +	{
> +		// Lenovo Yoga 7 14ARB7

Generally speaking we prefer C-style /* */ comments in pdx86,
so I've converted all comments to this style.

> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
> +		},
> +	},
> +	{ },

Since this is a terminator, it should not have a trailing comma (removed).

> +};
> +
> +struct lenovo_ymc_private {
> +	struct input_dev *input_dev;
> +	struct acpi_device *ec_acpi_dev;
> +};
> +
> +static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenovo_ymc_private *priv)
> +{
> +	int err;

There must be an empty line between declarations and
the first statement (added).

> +	if (!priv->ec_acpi_dev)
> +		return;
> +	err = write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
> +	if (err)
> +		dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
> +}
> +
> +static const struct key_entry lenovo_ymc_keymap[] = {
> +	// Laptop
> +	{ KE_SW, 0x01, { .sw = { SW_TABLET_MODE, 0 } } },
> +	// Tablet
> +	{ KE_SW, 0x02, { .sw = { SW_TABLET_MODE, 1 } } },
> +	// Drawing Board
> +	{ KE_SW, 0x03, { .sw = { SW_TABLET_MODE, 1 } } },
> +	// Tent
> +	{ KE_SW, 0x04, { .sw = { SW_TABLET_MODE, 1 } } },
> +	{ KE_END },
> +};
> +
> +static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
> +{
> +	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
> +

And this empty line here looks weird. I have removed this and also
moved the status declaration down a bit since normally we order
variable declarations from long declaration to short declarations
(known as reverse christmas tree order).

> +	u32 input_val = 0;
> +	struct acpi_buffer input = {sizeof(input_val), &input_val};
> +	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
> +	acpi_status status;
> +	union acpi_object *obj;
> +	int code;
> +
> +	status = wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
> +				LENOVO_YMC_QUERY_INSTANCE,
> +				LENOVO_YMC_QUERY_METHOD,
> +				&input, &output);
> +
> +	if (ACPI_FAILURE(status)) {
> +		dev_warn(&wdev->dev,
> +			"Failed to evaluate query method: %s\n",
> +			acpi_format_exception(status));
> +		return;
> +	}
> +
> +	obj = output.pointer;
> +
> +	if (obj->type != ACPI_TYPE_INTEGER) {
> +		dev_warn(&wdev->dev,
> +			"WMI event data is not an integer\n");
> +		goto free_obj;
> +	}
> +	code = obj->integer.value;
> +
> +	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
> +		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
> +
> +free_obj:
> +	kfree(obj);
> +	lenovo_ymc_trigger_ec(wdev, priv);
> +}
> +
> +static void acpi_dev_put_helper(void *p) { acpi_dev_put(p); }
> +
> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	struct lenovo_ymc_private *priv;
> +	int err;
> +
> +	ec_trigger |= dmi_check_system(ec_trigger_quirk_dmi_table);
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (ec_trigger) {
> +		pr_debug("Lenovo YMC enable EC triggering.\n");
> +		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VPC2004", NULL, -1);
> +
> +		if (!priv->ec_acpi_dev) {
> +			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
> +			return -ENODEV;
> +		}
> +		err = devm_add_action_or_reset(&wdev->dev,
> +				acpi_dev_put_helper, priv->ec_acpi_dev);
> +		if (err) {
> +			dev_err(&wdev->dev,
> +				"Could not clean up EC ACPI device: %d\n", err);
> +			return err;
> +		}
> +	}
> +
> +	input_dev = devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name = "Lenovo Yoga Tablet Mode Control switch";
> +	input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
> +	input_dev->id.bustype = BUS_HOST;
> +	input_dev->dev.parent = &wdev->dev;
> +	err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not set up input device keymap: %d\n", err);
> +		return err;
> +	}
> +
> +	err = input_register_device(input_dev);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not register input device: %d\n", err);
> +		return err;
> +	}
> +
> +	priv->input_dev = input_dev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +
> +	// Report the state for the first time on probe
> +	lenovo_ymc_trigger_ec(wdev, priv);
> +	lenovo_ymc_notify(wdev, NULL);
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lenovo_ymc_wmi_id_table[] = {
> +	{ .guid_string = LENOVO_YMC_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
> +
> +static struct wmi_driver lenovo_ymc_driver = {
> +	.driver = {
> +		.name = "lenovo-ymc",
> +	},
> +	.id_table = lenovo_ymc_wmi_id_table,
> +	.probe = lenovo_ymc_probe,
> +	.notify = lenovo_ymc_notify,
> +};
> +
> +module_wmi_driver(lenovo_ymc_driver);
> +
> +MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> +MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
> +MODULE_LICENSE("GPL");

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

