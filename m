Return-Path: <platform-driver-x86+bounces-4034-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F98913B9C
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2024 16:10:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED6431C208F1
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2024 14:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F7815AD8B;
	Sun, 23 Jun 2024 14:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FpciiRpV"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955BF148300
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719151806; cv=none; b=ZB6MKgoz0GpucELOTd1YxOz1x6gz1sRejDX5IYKKxbqpgwO+9SwULFyrVgjJl41kzZYW5gLR9Hj+O2ZOEyBjMP2H3LqpFgL7h33YxG0MxF58lX/rWq5kj0yr82P07R7BxSbshq4Va8sVCB/sToTUw8/wBGw6UHYIaG4zS9oAXIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719151806; c=relaxed/simple;
	bh=acPSDwP2oFpfvRuVyl6z8xICC7TLAsEBz202VMm7m3o=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lOTMaQDKA3K0N2PUFowQsXqHb2313fVcKEZGwPq6EGVVwiZVQ7MuMkJdrgmsuqGAWe1u6VJvSrc2VcqNV/cu5X8l8F/w9v+FzCIDel8OWpc2z92hUi8OF+kC398yy62+jKb7qNKFXgTtV/BkvKntMVIalItc7gn7sA/i0bmKtGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FpciiRpV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719151803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ac/mHIZtfRwLBZUVjd7eEKao32nxqjmzAfUl3QJzQvQ=;
	b=FpciiRpVd7W7Ov6/w/DpoyPfrO2lHun73ROdXyo0tnibnm6GFVLeLqvMcTrsnvFn3pF9rV
	AcffrVFUwP4ypGu0+I6pFEVFbsJl9jtmH7f9A+n1WMlAGbE5+8hGiO7SkZymVUzNBfYVsu
	UKeue+bu7EewTZRrrJeV2vsWUvl+8fc=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-i4h3ZgOqPCuqR2ag29opbA-1; Sun, 23 Jun 2024 10:10:00 -0400
X-MC-Unique: i4h3ZgOqPCuqR2ag29opbA-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-52cd9433146so1714442e87.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 07:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719151798; x=1719756598;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ac/mHIZtfRwLBZUVjd7eEKao32nxqjmzAfUl3QJzQvQ=;
        b=cx81abOkauwUSNkWMsKdUlEK3SO890TM73RFaHHjyeYkA9TGmS+mimcXlx2y6Lr4AL
         GJKlgOjPAM7ua6Be657fWPDR+ODoDTmr7ef+WTm4GgPgqbTyD55vWvXui3CuubKnGDFj
         8Mn5J78HHnEHEcCQpd0MSb6rrbOfqzLhgtUCdOOn+RYOcKSnM3crFc3V7rRHm4rWPPDT
         r+sAUgI1h+4Hf1Lh/ffCKD0XDb91dBzBycgmmlU9/pcMVs60KUK9Zx1lJdfPqzEi4h3o
         CdiQTU2df34bMsisHUQqvq4KVRwH5pBefD6gQlGGKORrP4WBdVBfQBLb0GvGp70K+Lm/
         Ogfw==
X-Forwarded-Encrypted: i=1; AJvYcCWtaFQqTXhTBR1zj9cvS5WWyhEt4PyR7Iz/lsJoKK9HSxzGvNGV1tYdxQrspwQoD+doudx78VoGn8Qa15L568CSyNYvPFzrnUKeMqcI088meygxqA==
X-Gm-Message-State: AOJu0YyU6yTOGXl6cxDQ5Pn77xvoz3FsMaXqxG25QSyuscRyxJPgsSzL
	llo9mIel12jVoHVlBMJYIXFx2k0PY0IKfBsYO3LMl1hDkcXN7esEzurhBEIgjQah9Z2JCN3ucQj
	Z8JulY4cul/mZlaY9t3Jp8613RyyE7BErMsEWl81SDTxaMXsYxVd0qnsIBv5es6V+4QfQuwaYt2
	/TqM4=
X-Received: by 2002:a05:6512:3a2:b0:52c:dc70:ebf8 with SMTP id 2adb3069b0e04-52ce1834fb5mr1217074e87.19.1719151798415;
        Sun, 23 Jun 2024 07:09:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcqc6B4drbXqCR58K7QnebG0EPtCHrizqljzJZypnKy48tQHs4Hp5UV8cykdIIz5lozu+V/g==
X-Received: by 2002:a05:6512:3a2:b0:52c:dc70:ebf8 with SMTP id 2adb3069b0e04-52ce1834fb5mr1217054e87.19.1719151797908;
        Sun, 23 Jun 2024 07:09:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724a6e4201sm71676066b.132.2024.06.23.07.09.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 07:09:57 -0700 (PDT)
Message-ID: <38fefc37-0599-4dc3-84b4-3e4d0870474c@redhat.com>
Date: Sun, 23 Jun 2024 16:09:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622131650.qxoxtp6aaitpar6a@pali>
 <ffbb42d9-f6c6-456e-8427-0c75c2a2e90d@redhat.com>
 <20240622142015.7cfl2onabpr6kl6r@pali>
 <b76dc029-ded0-4911-92ee-ab46351105cc@redhat.com>
 <20240622151250.zvli73oxqmbsd3n4@pali> <20240622163518.rfm2wa2kzucy7in4@pali>
 <290a60a9-53d1-4bc0-968f-76e69afd784e@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <290a60a9-53d1-4bc0-968f-76e69afd784e@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/23/24 3:56 PM, Hans de Goede wrote:
> Hi Pali,
> 
> On 6/22/24 6:35 PM, Pali Rohár wrote:
>> On Saturday 22 June 2024 17:12:50 Pali Rohár wrote:
>>> On Saturday 22 June 2024 16:26:13 Hans de Goede wrote:
>>>> Hi Pali,
>>>>
>>>> On 6/22/24 4:20 PM, Pali Rohár wrote:
>>>>> On Saturday 22 June 2024 16:06:01 Hans de Goede wrote:
>>>>>> Hi Pali,
>>>>>>
>>>>>> On 6/22/24 3:16 PM, Pali Rohár wrote:
>>>>>>> On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
>>>>>>>> It is not necessary to handle the Dell specific instantiation of
>>>>>>>> i2c_client-s for SMO88xx ACPI devices without an ACPI I2cResource
>>>>>>>> inside the generic i801 I2C adapter driver.
>>>>>>>>
>>>>>>>> The kernel already instantiates platform_device-s for these ACPI devices
>>>>>>>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
>>>>>>>> platform drivers.
>>>>>>>>
>>>>>>>> Move the i2c_client instantiation from the generic i2c-i801 driver to
>>>>>>>> the SMO88xx specific dell-smo8800 driver.
>>>>>>>
>>>>>>> Why it has to be in dell-smo8800 driver? Code for registering lis3lv02d
>>>>>>> and freefall code for smo88xx are basically independent.
>>>>>>>
>>>>>>> lis3lv02d is for accelerometer axes and smo88xx is for freefall hardisk
>>>>>>> detection. The only thing which have these "drivers" common is the ACPI
>>>>>>> detection mechanism based on presence of SMO88?? identifiers from
>>>>>>> acpi_smo8800_ids[] array.
>>>>>>>
>>>>>>> I think it makes both "drivers" cleaner if they are put into separate
>>>>>>> files as they are independent of each one.
>>>>>>>
>>>>>>> What about moving it into drivers/platform/x86/dell/dell-lis3lv02d.c
>>>>>>> instead (or similar name)? And just share list of ACPI ids via some
>>>>>>> header file (or something like that).
>>>>>>
>>>>>> Interesting idea, but that will not work, only 1 driver can bind to
>>>>>> the platform_device instantiated by the ACPI code for the SMO88xx ACPI device.
>>>>>
>>>>> And it is required to bind lis3 device to ACPI code? What is needed is
>>>>> just to check if system matches DMI strings and ACPI strings. You are
>>>>> not binding device to DMI strings, so I think there is no need to bind
>>>>> it neither to ACPI strings.
>>>>
>>>> The driver needs to bind to something ...
>>>
>>> Why?
>>>
>>> Currently in i2c-i801.c file was called just
>>> register_dell_lis3lv02d_i2c_device() function and there was no binding
>>> to anything, no binding to DMI structure and neither no binding to ACPI
>>> structures.
>>>
>>> And if I'm looking correctly at your new function
>>> smo8800_instantiate_i2c_client() it does not bind device neither.
>>> And smo8800_i2c_bus_notify() does not depend on binding.
>>>
>>> So I do not see where is that binding requirement.
>>
>> Now I have tried to do it, to move code into dell-lis3lv02d.c file.
>>
>> Below is example how it could look like. I reused most of your code.
>> I have not tested it. It is just an idea.
> 
> Thank you for going through the trouble of writing this proof
> of concept.
> 
> The problem with DMI matching, instead of binding to the ACPI
> SMO88xx platform_device is that this will now only load on
> laptops for which we already have the DMI ids.

I guess we could put all of this from the current dell-smo8800.c
code in a .h :

static const struct acpi_device_id smo8800_ids[] = {
        { "SMO8800", 0 },
        { "SMO8801", 0 },
        { "SMO8810", 0 },
        { "SMO8811", 0 },
        { "SMO8820", 0 },
        { "SMO8821", 0 },
        { "SMO8830", 0 },
        { "SMO8831", 0 },
        { "", 0 },
};
MODULE_DEVICE_TABLE(acpi, smo8800_ids);

Andy, I guess this is what you ment with your MODULE_DEVICE_TABLE()
comment?

And then include that .h from both modules. Then both modules
will auto-load and in the dell-lis3lv02d module we can use
module_init() / module_exit() to register the bus-notifier.

Pali, since you have expressed a clear preference for splitting
things and since this solution should not impact functionality
in anyway, I'll do this split for v4 of this series.

I do plan to re-use the existing CONFIG_DELL_SMO8800 Kconfig
value to decide whether or not to build the new dell-lis3lv02d
module. Having 2 separate Kconfig options for this seems unnecessary.

Regards,

Hans




> 
> So this looses the warning about the i2c address info missing
> which we currently give when there is a SMO88xx ACPI device
> on laptops not in the DMI table (the current i2c-i801.c code
> has this already). Not giving the warning in turn means we
> cannot inform users about trying the new probe option, which is
> the whole reason to do this patch-set in the first place.
> 
> I still believe that keeping this new code in dell-smo8800.c
> is best:
> 
> 1. This very much is about handling the SMO88xx ACPI devices
> which makes putting it in the smo8800.c driver the logical /
> the right thing to do.
> 
> 2. This only adds 400 lines of code. After this all of
> dell-smo8800.c is only 600 lines. That is very small so
> I really so no pressing need to spread this out over 2 files.
> 
> 3. You claim the freefall IRQ and the i2c_client instantiation
> are 2 different things, but they are both for the same chip
> and normally would both be described in the same ACPI device
> node. The manual i2c_client instantation is done to address
> a shortcoming of the SMO88xx ACPI device node, so handling it
> belongs in the smo8800 driver.
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
>> #include <linux/acpi.h>
>> #include <linux/dmi.h>
>> #include <linux/i2c.h>
>> #include <linux/module.h>
>> #include <linux/notifier.h>
>> #include <linux/workqueue.h>
>>
>> static struct work_struct dell_lis3lv02d_i2c_work;
>> static struct i2c_client *dell_lis3lv02d_i2c_dev;
>> static unsigned short dell_lis3lv02d_i2c_addr;
>>
>> static int dell_lis3lv02d_find_i801(struct device *dev, void *data)
>> {
>> 	struct i2c_adapter *adap, **adap_ret = data;
>>
>> 	adap = i2c_verify_adapter(dev);
>> 	if (!adap)
>> 		return 0;
>>
>> 	if (!strstarts(adap->name, "SMBus I801 adapter"))
>> 		return 0;
>>
>> 	*adap_ret = i2c_get_adapter(adap->nr);
>> 	return 1;
>> }
>>
>> static void dell_lis3lv02d_instantiate_i2c_client(struct work_struct *work)
>> {
>> 	struct i2c_board_info info = { };
>> 	struct i2c_adapter *adap = NULL;
>> 	struct i2c_client *client;
>>
>> 	if (dell_lis3lv02d_i2c_dev)
>> 		return;
>>
>> 	bus_for_each_dev(&i2c_bus_type, NULL, &adap, dell_lis3lv02d_find_i801);
>> 	if (!adap)
>> 		return;
>>
>> 	info.addr = dell_lis3lv02d_i2c_addr;
>> 	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>>
>> 	client = i2c_new_client_device(adap, &info);
>> 	if (IS_ERR(client)) {
>> 		pr_err("error %ld registering %s i2c_client\n",
>> 			PTR_ERR(client), info.type);
>> 		return;
>> 	}
>>
>> 	dell_lis3lv02d_i2c_dev = client;
>>
>> 	pr_err("registered %s i2c_client on address 0x%02x\n",
>> 		info.type, info.addr);
>> }
>>
>> static int dell_lis3lv02d_i2c_bus_notify(struct notifier_block *nb,
>> 					 unsigned long action, void *data)
>> {
>> 	struct device *dev = data;
>> 	struct i2c_client *client;
>> 	struct i2c_adapter *adap;
>>
>> 	switch (action) {
>> 	case BUS_NOTIFY_ADD_DEVICE:
>> 		adap = i2c_verify_adapter(dev);
>> 		if (!adap)
>> 			break;
>>
>> 		if (strstarts(adap->name, "SMBus I801 adapter"))
>> 			queue_work(system_long_wq, &dell_lis3lv02d_i2c_work);
>> 		break;
>> 	case BUS_NOTIFY_REMOVED_DEVICE:
>> 		client = i2c_verify_client(dev);
>> 		if (!client)
>> 			break;
>>
>> 		if (dell_lis3lv02d_i2c_dev == client) {
>> 			pr_debug("accelerometer i2c_client removed\n");
>> 			dell_lis3lv02d_i2c_dev = NULL;
>> 		}
>> 		break;
>> 	default:
>> 		break;
>> 	}
>>
>> 	return 0;
>> }
>>
>> // TODO: move this array into dell-smo8800.h header file
>> static const char *const acpi_smo8800_ids[] __initconst = {
>> 	"SMO8800",
>> 	"SMO8801",
>> 	"SMO8810",
>> 	"SMO8811",
>> 	"SMO8820",
>> 	"SMO8821",
>> 	"SMO8830",
>> 	"SMO8831",
>> };
>>
>> static acpi_status __init check_acpi_smo88xx_device(acpi_handle obj_handle,
>> 					     u32 nesting_level,
>> 					     void *context,
>> 					     void **return_value)
>> {
>> 	struct acpi_device_info *info;
>> 	acpi_status status;
>> 	char *hid;
>> 	int i;
>>
>> 	status = acpi_get_object_info(obj_handle, &info);
>> 	if (ACPI_FAILURE(status))
>> 		return AE_OK;
>>
>> 	if (!(info->valid & ACPI_VALID_HID))
>> 		goto smo88xx_not_found;
>>
>> 	hid = info->hardware_id.string;
>> 	if (!hid)
>> 		goto smo88xx_not_found;
>>
>> 	i = match_string(acpi_smo8800_ids, ARRAY_SIZE(acpi_smo8800_ids), hid);
>> 	if (i < 0)
>> 		goto smo88xx_not_found;
>>
>> 	kfree(info);
>>
>> 	*return_value = NULL;
>> 	return AE_CTRL_TERMINATE;
>>
>> smo88xx_not_found:
>> 	kfree(info);
>> 	return AE_OK;
>> }
>>
>> static bool __init has_acpi_smo88xx_device(void)
>> {
>> 	void *err = ERR_PTR(-ENOENT);
>>
>> 	acpi_get_devices(NULL, check_acpi_smo88xx_device, NULL, &err);
>> 	return !IS_ERR(err);
>> }
>>
>> /*
>>  * Accelerometer's I2C address is not specified in DMI nor ACPI,
>>  * so it is needed to define mapping table based on DMI product names.
>>  */
>> static const struct dmi_system_id dell_lis3lv02d_devices[] __initconst = {
>> 	/*
>> 	 * Dell platform team told us that these Latitude devices have
>> 	 * ST microelectronics accelerometer at I2C address 0x29.
>> 	 */
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5250"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5450"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6440 ATG"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E6540"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	/*
>> 	 * Additional individual entries were added after verification.
>> 	 */
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude 5480"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Precision 3540"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro V131"),
>> 		},
>> 		.driver_data = (void *)0x1d,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 5568"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{
>> 		.matches = {
>> 			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>> 			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 7590"),
>> 		},
>> 		.driver_data = (void *)0x29,
>> 	},
>> 	{ }
>> };
>> MODULE_DEVICE_TABLE(dmi, dell_lis3lv02d_devices);
>>
>> static struct notifier_block dell_lis3lv02d_i2c_nb = {
>> 	.notifier_call = dell_lis3lv02d_i2c_bus_notify,
>> };
>>
>> static int __init dell_lis3lv02d_init(void)
>> {
>> 	const struct dmi_system_id *lis3lv02d_dmi_id;
>> 	int err;
>>
>> 	if (!has_acpi_smo88xx_device())
>> 		return -ENODEV;
>>
>> 	lis3lv02d_dmi_id = dmi_first_match(dell_lis3lv02d_devices);
>> 	if (!lis3lv02d_dmi_id)
>> 		return -ENODEV;
>>
>> 	dell_lis3lv02d_i2c_addr = (uintptr_t)lis3lv02d_dmi_id->driver_data;
>>
>> 	err = bus_register_notifier(&i2c_bus_type, &dell_lis3lv02d_i2c_nb);
>> 	if (err)
>> 		return err;
>>
>> 	INIT_WORK(&dell_lis3lv02d_i2c_work, dell_lis3lv02d_instantiate_i2c_client);
>> 	queue_work(system_long_wq, &dell_lis3lv02d_i2c_work);
>>
>> 	return 0;
>> }
>>
>> static void __exit dell_lis3lv02d_exit(void)
>> {
>> 	bus_unregister_notifier(&i2c_bus_type, &dell_lis3lv02d_i2c_nb);
>> 	cancel_work_sync(&dell_lis3lv02d_i2c_work);
>> 	if (dell_lis3lv02d_i2c_dev)
>> 		i2c_unregister_device(dell_lis3lv02d_i2c_dev);
>> }
>>
>> module_init(dell_lis3lv02d_init);
>> module_exit(dell_lis3lv02d_exit);
>>
>> MODULE_LICENSE("GPL");
>>
> 


