Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D33A5F5520
	for <lists+platform-driver-x86@lfdr.de>; Wed,  5 Oct 2022 15:14:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229985AbiJENOW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 5 Oct 2022 09:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229853AbiJENOQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Oct 2022 09:14:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B34C22B19
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664975654;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fmWnVgGbQzqrc93mIlWejvSVmYW010XhCCw1LIHPVs4=;
        b=TKd5MMzf0lkYC0EFj6kATAgH+fXIFRUb3MKKIEPrLurJXDZU+EeYB1OdwoI+UJwjwJqcOW
        kZwyzqRg9qGBjigRmHWIVps1Q/p2VHA1ws6OmrRiLoOSIJvpxwxOm8KwBnrxjkyBtWj6Xm
        0+s2MRrA9XYDOST/kjF07fIkKxeCMc4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-9M9XSeBmMMutCYPk1IRuNg-1; Wed, 05 Oct 2022 09:14:13 -0400
X-MC-Unique: 9M9XSeBmMMutCYPk1IRuNg-1
Received: by mail-ed1-f72.google.com with SMTP id w2-20020a056402268200b00458ef2a5a4eso7171920edd.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Oct 2022 06:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fmWnVgGbQzqrc93mIlWejvSVmYW010XhCCw1LIHPVs4=;
        b=a4t4XkemXxjKKIoUW+FgWBxuGdUoxvMD0CcIBo6LNiUZQWdO2KMz0nk3N/DP98T2Bt
         55iTmD3ZZOwPMXber41ojNd03D45xwvs1+QhJBTKfjDVYdJdis3HZAS4fq48apfg5Wq5
         lbK/Z14nQoEU0PU1ayuGueIeWG7gqRSq3i1F21Gi1leRQVFtHf8jTF+w0V+ylA1V7GmP
         4XvJCp3rXXrC+wqd4m66EHcbqMNQ0Cs4wVerxfi04Tz6GM5HWbxMGRgMnQh/hDJL/baH
         0t+eaVX0TNdskW20PJiekeYG4ZMMucs4PYb3trQKwPxYXpCYm4ar150VkwTxM/wigKlz
         F3kA==
X-Gm-Message-State: ACrzQf16ZFLJpU1sOUXu5BlAgQJRQh7o3AiF9N/IVq71M82/D1zkWMTn
        7t95iE/bjlVNhyROi+KodNncinFDZkoZgRdR5JEUD6Zhd46suLEjiI116qFMoiAR8F66A5C6Iw1
        Nuzw/qA9ggfuoBsKP66+ITaIi1qswpXNYbw==
X-Received: by 2002:a05:6402:1e8d:b0:454:79a9:201f with SMTP id f13-20020a0564021e8d00b0045479a9201fmr28988852edf.176.1664975651838;
        Wed, 05 Oct 2022 06:14:11 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7as6iUGFLxPb0qKaKcM3R1vclPyotre0OyoF2n8fNlYqbN3Q9AvCM/2wEUfYwXxcpHBfrjGA==
X-Received: by 2002:a05:6402:1e8d:b0:454:79a9:201f with SMTP id f13-20020a0564021e8d00b0045479a9201fmr28988829edf.176.1664975651562;
        Wed, 05 Oct 2022 06:14:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id t26-20020a056402021a00b004575085bf18sm3731771edv.74.2022.10.05.06.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 06:14:10 -0700 (PDT)
Message-ID: <3fa09f08-9915-798c-e309-c738d916d0d4@redhat.com>
Date:   Wed, 5 Oct 2022 15:14:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [RFC PATCH] Add Lenovo Yoga Mode Control driver
Content-Language: en-US, nl
To:     Gergo Koteles <soyer@irl.hu>, platform-driver-x86@vger.kernel.org,
        dwmw2@infradead.org
References: <20221004214332.35934-1-soyer@irl.hu>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221004214332.35934-1-soyer@irl.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Gergo,

On 10/4/22 23:43, Gergo Koteles wrote:
> This is a WMI driver for the Mode Control switch for Lenovo Yoga
> notebooks.
> The mode is mapped to a SW_TABLET_MODE switch capable input device.

Thank you for doing this. This is going to be very helpful for various
people who are having issue with GNOME3 not doing screen autorotation
on yoga style devices when there is no SW_TABLET_MODE reporting.

On a quick scan one thing which stands out it that I believe
that you don't need this, so please drop it:

+	select ACPI_PLATFORM_PROFILE

> It should work with  models like the Yoga C940, Ideapad flex 14API,
> Yoga 9 14IAP7, Yoga 7 14ARB7.
> The 14ARB7 model must trigger the EC to send mode change events.
> This might be a firmware bug.
> 
> Introduces a global variable in the ideapad-laptop driver.
> I would like some advice on how to do it without the variable,
> or how to do it better.

I think it would be cleaner to:

1. Do a new prep commit/patch adding a drivers/platform/x86/ideapad-laptop.h and:
1.1 Move the VPCCMD_* enum there (including adding the command you need)
1.2 Move eval_vpcr(), eval_vpcw(), read_ec_data() and write_ec_cmd() there
as static inline helpers

And then in your driver do

1. #include "ideapad-laptop.h"
2. Add a "struct acpi_device *ec_acpi_dev" to struct lenovo_ymc_private {}
3. On probe do:

	if (quirk) {
		priv->ec_acpi_dev = acpi_dev_get_first_match_dev("VPC2004", NULL, -1);
		if (!priv->ec_acpi_dev) {
			dev_err(...);
			return -ENODEV;
		}
	}

4. When needing to do the write do

	if (priv->ec_acpi_dev)
		write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);

This means duplicating a few functions (at compile time) between
the 2 modules, but these will be quite small so I think this will
be fine.

An alternative would be to just shoe-horn this functionality to fit
inside the ideapad-laptop.c driver. But I don't like that idea,
I like the nice clean small separate WMI driver approach you have
gone with a lot better.

I also wonder if maybe the presence, or the _HRV (hardware revision)
field of the VPC2004 device (see DSDT dumps) can be used to check if
we should do the ec-writes or not? But if you cannot find anything
looking like a pattern there just using the DMI quirk approach is fine.

Note if you end up only wanting to do this with a specific _HRV of
VPC2004 then you can just pass that _HRV as third argument to
acpi_dev_get_first_match_dev() and then VPC2004 ACPI devices with
a different _HRV will not be returned.

Regards,

Hans


> ---
>  drivers/platform/x86/Kconfig          |  10 ++
>  drivers/platform/x86/Makefile         |   1 +
>  drivers/platform/x86/ideapad-laptop.c |  18 +++
>  drivers/platform/x86/lenovo-ymc.c     | 185 ++++++++++++++++++++++++++
>  4 files changed, 214 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-ymc.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f2f98e942cf2..72ff6713e447 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -510,6 +510,16 @@ config IDEAPAD_LAPTOP
>  	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>  	  rfkill switch, hotkey, fan control and backlight control.
>  
> +config LENOVO_YMC
> +	tristate "Lenovo Yoga Mode Control"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on IDEAPAD_LAPTOP
> +	select ACPI_PLATFORM_PROFILE
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This is a driver for the Mode Control switch for Lenovo Yoga notebooks.
> +
>  config SENSORS_HDAPS
>  	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
>  	depends on INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5a428caa654a..f8f0d6a0b43b 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -65,6 +65,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>  # IBM Thinkpad and Lenovo
>  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>  obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
>  obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>  obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index abd0c81d62c4..d88a4ee72bf6 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -103,6 +103,7 @@ enum {
>  	VPCCMD_W_FAN,
>  	VPCCMD_R_RF,
>  	VPCCMD_W_RF,
> +	VPCCMD_W_YMC = 0x2A,
>  	VPCCMD_R_FAN = 0x2B,
>  	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
>  	VPCCMD_W_BL_POWER = 0x33,
> @@ -156,6 +157,8 @@ static bool allow_v4_dytc;
>  module_param(allow_v4_dytc, bool, 0444);
>  MODULE_PARM_DESC(allow_v4_dytc, "Enable DYTC version 4 platform-profile support.");
>  
> +static struct ideapad_private *ideapad_priv;
> +
>  /*
>   * ACPI Helpers
>   */
> @@ -1421,6 +1424,19 @@ static void ideapad_sync_touchpad_state(struct ideapad_private *priv)
>  	}
>  }
>  
> +void ideapad_trigger_ymc_next_read(void)
> +{
> +	int err;
> +	if (ideapad_priv != NULL) {
> +		err = write_ec_cmd(ideapad_priv->adev->handle,
> +			VPCCMD_W_YMC, 1);
> +		if (err)
> +			dev_warn(&ideapad_priv->platform_device->dev,
> +				"Could not write YMC: %d\n", err);
> +	}
> +}
> +EXPORT_SYMBOL(ideapad_trigger_ymc_next_read);
> +
>  static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  {
>  	struct ideapad_private *priv = data;
> @@ -1663,6 +1679,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	}
>  #endif
>  
> +	ideapad_priv = priv;
>  	return 0;
>  
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> @@ -1696,6 +1713,7 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>  	struct ideapad_private *priv = dev_get_drvdata(&pdev->dev);
>  	int i;
>  
> +	ideapad_priv = NULL;
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
>  	if (priv->fnesc_guid)
>  		wmi_remove_notify_handler(priv->fnesc_guid);
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
> new file mode 100644
> index 000000000000..0b899b02e12f
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -0,0 +1,185 @@
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
> +
> +#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
> +#define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
> +
> +#define LENOVO_YMC_QUERY_INSTANCE 0
> +#define LENOVO_YMC_QUERY_METHOD 0xAB
> +
> +extern void ideapad_trigger_ymc_next_read(void);
> +
> +static bool ec_trigger __read_mostly;
> +module_param(ec_trigger, bool, 0644);
> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events");
> +
> +static int enable_ec_trigger(const struct dmi_system_id *id)
> +{
> +       pr_debug("Lenovo YMC enable EC triggering.\n");
> +       ec_trigger = true;
> +       return 0;
> +}
> +
> +static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
> +	{
> +		// Lenovo Yoga 7 14ARB7
> +		.callback = enable_ec_trigger,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
> +		},
> +	},
> +	{ },
> +};
> +
> +static void lenovo_ymc_trigger_ec(void) {
> +	if (ec_trigger) {
> +		ideapad_trigger_ymc_next_read();
> +	}
> +}
> +
> +
> +struct lenovo_ymc_private {
> +	struct input_dev *input_dev;
> +};
> +
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
> +	u32 input_val = 0;
> +	struct acpi_buffer input = {sizeof(input), &input_val};
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
> +			"Failed to evaluate query method %ud\n", status);
> +		return;
> +	}
> +
> +	obj = (union acpi_object *)output.pointer;
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
> +	lenovo_ymc_trigger_ec();
> +}
> +
> +static void lenovo_ymc_remove(struct wmi_device *wdev)
> +{
> +	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
> +
> +	input_unregister_device(priv->input_dev);
> +}
> +
> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	struct lenovo_ymc_private *priv;
> +	int err;
> +
> +	dmi_check_system(ec_trigger_quirk_dmi_table);
> +
> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	input_dev = input_allocate_device();
> +	if (!input_dev) {
> +		return -ENOMEM;
> +	}
> +
> +	input_dev->name = "Lenovo Yoga Mode Control switch";
> +	input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
> +	input_dev->id.bustype = BUS_HOST;
> +	input_dev->dev.parent = &wdev->dev;
> +
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not set up input device keymap: %d\n", err);
> +		goto err_free_dev;
> +	}
> +
> +	err = input_register_device(input_dev);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not register input device: %d\n", err);
> +		goto err_free_dev;
> +	}
> +
> +	priv->input_dev = input_dev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +	lenovo_ymc_trigger_ec();
> +	return 0;
> +
> +err_free_dev:
> +	input_free_device(input_dev);
> +	return err;
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
> +	.remove = lenovo_ymc_remove,
> +	.notify = lenovo_ymc_notify,
> +};
> +
> +module_wmi_driver(lenovo_ymc_driver);
> +
> +MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> +MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
> +MODULE_LICENSE("GPL");

