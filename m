Return-Path: <platform-driver-x86+bounces-2622-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891EF89C232
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 15:28:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 401CA2834B9
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Apr 2024 13:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0972370CCB;
	Mon,  8 Apr 2024 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RuD4A+Hk"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047F7BAE4
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 13:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712582625; cv=none; b=hWVVIMo35oL4gDZyts2/WyZqvve4DKempP8/SN0F7vUA3ADv0pBcm8dWEoSCEXM6O5+4HDRbnmmkncdX2byEjMfVZUp8LMXoUre30RbftWC87kRlfa6Pj6LGgV8kpBC7b4le5NI4bZwwCMms0geSzw8IDPnDgYgKXcSOtohDkv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712582625; c=relaxed/simple;
	bh=AjMcuDVSfQz9mEkdUJ3nOENaBtruvEhJ1oKoGoktTdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=tSR4iLUxxLPQYJW5mdRucEc5xqlOMGXtSDXByFco2DkzcHhx1mErCBLqpLhV9cE4ZDtufHLT/kzW/IA/N8Gw6ydRvDaBKWo+ETpY3GAClLGWpVrAyD5DYfT1WwhBr9g8XVAPLPCL4UXlO+MLFuRiDveA5R+ThLmjY4RUzkrhRYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RuD4A+Hk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712582623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0mxn2AaedYDOGszqLmSIzySTE68+KWDxw9NAP4Ae8Ao=;
	b=RuD4A+HkLuDVPSUw1Y8wyhWm1p/Rkp/3ZWQzWupfSb49gifrFuZpInUEk+1hr5NWOMOg9Z
	WnmdO1shAJ+EVbUQUSfWGX7QcrEIYlEO45gowHSIPux+KHcp23aTe4qAUiYAeUzWGXMSEf
	t5eAElpzggGG3w3RBnnL9MiBPRkfVuA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-Nz8fvuGBOXWz7wjBYc0lWQ-1; Mon, 08 Apr 2024 09:23:41 -0400
X-MC-Unique: Nz8fvuGBOXWz7wjBYc0lWQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5684c1abc7fso1838918a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 06:23:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582621; x=1713187421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0mxn2AaedYDOGszqLmSIzySTE68+KWDxw9NAP4Ae8Ao=;
        b=teteQzPDK7cJcyfJ8iJtehkNAW/bgEwi02Mw6G3Cwx8r/78+0yHAiU0xElUGpJhguT
         p8cAg0U76gQH+cbMfgRtcTvasCg2bxHKzwFvy9+dQQiarMdQrhMQfH6ru/RkU7td0GGi
         n9MD5f5xr9OJz1wEILuEuUyLgdt4KMs6dX1sXgSmwMJVcKdTuoS5jLiajR4iYw48jF/s
         KRnQ5z59W3arZUmSpkUuoMB/C3AyId8SpAWnqa4ZefrNGwxzIGloRcfZjF/D08ois7tZ
         7gWFqed8g1FTfAnl6MrdjwmynlIlZjtZ7RpTbL/m8gAd1UhdtLqyHP2idzbCUrT5L9QA
         YVeA==
X-Forwarded-Encrypted: i=1; AJvYcCWGujBOz8V1+70vcBkDaFh90TSd1knUaG7hSZ530zp9E2ClvRu3xCX036FCrnmcyE3A7RovzOTvaY8Pei0kSLlBVpvW2VnsoSFcoFS2gJ1B0ydtZA==
X-Gm-Message-State: AOJu0YzOKKLzVCnnExTPJapjAWF25UUq2g6HBjQw1tENOxJ21PL/gUOP
	3P8BvLA6HVqPHRc38AoSHsG3cpppAGOiMn0G60T3+9p56jCh/ow6+rhiwmKLBgMV2Gu/UB8HBqv
	s6BA6zFVisJS1kCStWrZ7DhkxnTqGWL/+IpGKjGr2N8I1cqUjbHTieOiKxNxlbpCT7bN1LYE=
X-Received: by 2002:a50:d59b:0:b0:56b:cfef:b2de with SMTP id v27-20020a50d59b000000b0056bcfefb2demr6959815edi.26.1712582620752;
        Mon, 08 Apr 2024 06:23:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE50OwnyeeTq8ukE1a70PAtB3pBPLYwURLkK9afjse+/Yq/o9SrygSaXsBVnaES0Wgt0JUivw==
X-Received: by 2002:a50:d59b:0:b0:56b:cfef:b2de with SMTP id v27-20020a50d59b000000b0056bcfefb2demr6959801edi.26.1712582620322;
        Mon, 08 Apr 2024 06:23:40 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fd21-20020a056402389500b00568d7b0a21csm4070948edb.61.2024.04.08.06.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 06:23:39 -0700 (PDT)
Message-ID: <be0f0a67-d397-470c-ac29-8707b5e6a1a8@redhat.com>
Date: Mon, 8 Apr 2024 15:23:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12] platform/x86: add lenovo WMI camera button driver
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Ai Chao <aichao@kylinos.cn>, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240327082737.336992-1-aichao@kylinos.cn>
 <3552cb41-88b2-41c0-b327-a1aefe508e14@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3552cb41-88b2-41c0-b327-a1aefe508e14@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/28/24 12:35 AM, Kuppuswamy Sathyanarayanan wrote:
> 
> On 3/27/24 1:27 AM, Ai Chao wrote:
>> Add lenovo WMI camera button driver to support camera button.
>> The Camera button is a GPIO device. This driver receives ACPI notifyi
> 
> /s/notifyi/notification
> 
>> when the camera button is switched on/off. This driver is used in
>> Lenovo A70, it is a Computer integrated machine.
>>
>> Signed-off-by: Ai Chao <aichao@kylinos.cn>
>> ---
>> v12: Remove useless parentheses and unneeded blank line.
>> v11: Remove input_unregister_device.
>> v10: Add lenovo_wmi_remove and mutex_destroy.
>> v9: Add mutex for wmi notify.
>> v8: Dev_deb convert to dev_err.
>> v7: Add dev_dbg and remove unused dev in struct.
>> v6: Modify SW_CAMERA_LENS_COVER to KEY_CAMERA_ACCESS_ENABLE/KEY_CAMERA_ACCESS_DISABLE.
>> v5: Remove camera button groups, modify KEY_CAMERA to SW_CAMERA_LENS_COVER.
>> v4: Remove lenovo_wmi_input_setup, move camera_mode into struct lenovo_wmi_priv.
>> v3: Remove lenovo_wmi_remove function.
>> v2: Adjust GPL v2 to GPL, adjust sprintf to sysfs_emit.
>>
>>  drivers/platform/x86/Kconfig             |  12 +++
>>  drivers/platform/x86/Makefile            |   1 +
>>  drivers/platform/x86/lenovo-wmi-camera.c | 127 +++++++++++++++++++++++
>>  3 files changed, 140 insertions(+)
>>  create mode 100644 drivers/platform/x86/lenovo-wmi-camera.c
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 7e9251fc3341..b8c806506423 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -996,6 +996,18 @@ config INSPUR_PLATFORM_PROFILE
>>  	To compile this driver as a module, choose M here: the module
>>  	will be called inspur-platform-profile.
>>  
>> +config LENOVO_WMI_CAMERA
>> +	tristate "Lenovo WMI Camera Button driver"
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	help
>> +	  This driver provides support for Lenovo camera button. The Camera
>> +	  button is a GPIO device. This driver receives ACPI notify when the
> 
> /s/notify/notification

Thank you. Since I already merged v12 I've squashed a fix for this
into the patch/commit in my review-hans branch.

Regards,

Hans




> 
>> +	  camera button is switched on/off.
>> +
>> +	  To compile this driver as a module, choose M here: the module
>> +	  will be called lenovo-wmi-camera.
>> +
>>  source "drivers/platform/x86/x86-android-tablets/Kconfig"
>>  
>>  config FW_ATTR_CLASS
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index 1de432e8861e..217e94d7c877 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -66,6 +66,7 @@ obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>>  obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>>  obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
>>  obj-$(CONFIG_YOGABOOK)		+= lenovo-yogabook.o
>> +obj-$(CONFIG_LENOVO_WMI_CAMERA)	+= lenovo-wmi-camera.o
>>  
>>  # Intel
>>  obj-y				+= intel/
>> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo-wmi-camera.c
>> new file mode 100644
>> index 000000000000..0c0bedaf7407
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
>> @@ -0,0 +1,127 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Lenovo WMI Camera Button Driver
>> + *
>> + * Author: Ai Chao <aichao@kylinos.cn>
>> + * Copyright (C) 2024 KylinSoft Corporation.
>> + */
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/device.h>
>> +#include <linux/input.h>
>> +#include <linux/types.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/wmi.h>
>> +
>> +#define WMI_LENOVO_CAMERABUTTON_EVENT_GUID "50C76F1F-D8E4-D895-0A3D-62F4EA400013"
>> +
>> +struct lenovo_wmi_priv {
>> +	struct input_dev *idev;
>> +	struct mutex notify_lock;	/* lenovo WMI camera button notify lock */
>> +};
>> +
>> +enum {
>> +	SW_CAMERA_OFF	= 0,
>> +	SW_CAMERA_ON	= 1,
>> +};
>> +
>> +static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>> +{
>> +	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>> +	unsigned int keycode;
>> +	u8 camera_mode;
>> +
>> +	if (obj->type != ACPI_TYPE_BUFFER) {
>> +		dev_err(&wdev->dev, "Bad response type %u\n", obj->type);
>> +		return;
>> +	}
>> +
>> +	if (obj->buffer.length != 1) {
>> +		dev_err(&wdev->dev, "Invalid buffer length %u\n", obj->buffer.length);
>> +		return;
>> +	}
>> +
>> +	/*
>> +	 * obj->buffer.pointer[0] is camera mode:
>> +	 *      0 camera close
>> +	 *      1 camera open
>> +	 */
>> +	camera_mode = obj->buffer.pointer[0];
>> +	if (camera_mode > SW_CAMERA_ON) {
>> +		dev_err(&wdev->dev, "Unknown camera mode %u\n", camera_mode);
>> +		return;
>> +	}
>> +
>> +	mutex_lock(&priv->notify_lock);
>> +
>> +	keycode = camera_mode == SW_CAMERA_ON ?
>> +		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
>> +	input_report_key(priv->idev, keycode, 1);
>> +	input_sync(priv->idev);
>> +	input_report_key(priv->idev, keycode, 0);
>> +	input_sync(priv->idev);
>> +
>> +	mutex_unlock(&priv->notify_lock);
>> +}
>> +
>> +static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	struct lenovo_wmi_priv *priv;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +
>> +	priv->idev = devm_input_allocate_device(&wdev->dev);
>> +	if (!priv->idev)
>> +		return -ENOMEM;
>> +
>> +	priv->idev->name = "Lenovo WMI Camera Button";
>> +	priv->idev->phys = "wmi/input0";
>> +	priv->idev->id.bustype = BUS_HOST;
>> +	priv->idev->dev.parent = &wdev->dev;
>> +	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_ENABLE);
>> +	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_DISABLE);
>> +
>> +	ret = input_register_device(priv->idev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	mutex_init(&priv->notify_lock);
>> +
>> +	return 0;
>> +}
>> +
>> +static void lenovo_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +	mutex_destroy(&priv->notify_lock);
>> +}
>> +
>> +static const struct wmi_device_id lenovo_wmi_id_table[] = {
>> +	{ .guid_string = WMI_LENOVO_CAMERABUTTON_EVENT_GUID },
>> +	{  }
>> +};
>> +MODULE_DEVICE_TABLE(wmi, lenovo_wmi_id_table);
>> +
>> +static struct wmi_driver lenovo_wmi_driver = {
>> +	.driver = {
>> +		.name = "lenovo-wmi-camera",
>> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +	.id_table = lenovo_wmi_id_table,
>> +	.no_singleton = true,
>> +	.probe = lenovo_wmi_probe,
>> +	.notify = lenovo_wmi_notify,
>> +	.remove = lenovo_wmi_remove,
>> +};
>> +module_wmi_driver(lenovo_wmi_driver);
>> +
>> +MODULE_AUTHOR("Ai Chao <aichao@kylinos.cn>");
>> +MODULE_DESCRIPTION("Lenovo WMI Camera Button Driver");
>> +MODULE_LICENSE("GPL");
> 


