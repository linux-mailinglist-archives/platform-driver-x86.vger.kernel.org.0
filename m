Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4368669B3C2
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 21:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjBQUWH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 15:22:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjBQUWG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 15:22:06 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22ABD5FC57
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 12:22:02 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MREqy-1pElkq17gK-00N8C1; Fri, 17 Feb 2023 21:21:52 +0100
Message-ID: <8ef6e7b7-c813-eaff-f1f2-19b25174c180@metux.net>
Date:   Fri, 17 Feb 2023 21:21:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V3 1/1] platform/x86: Add BIOS Dynamic SAR driver for
 Intel M.2 Modem
Content-Language: tl
To:     Shravan S <s.shravan@intel.com>, hdegoede@redhat.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210602050149.6230-1-s.shravan@intel.com>
 <20210602050149.6230-2-s.shravan@intel.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <20210602050149.6230-2-s.shravan@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:iplRxLc6TAL0ZbRnytN3MawotXdXw/WNMFtEyCq4A1Zp6Dfxd5I
 CnR70yPxaIUoS+CACaN6yc7C0+1QJ/rB6Ez/1drqFisaQAwW33AAnx0KWZQJJ3absXPHNMs
 Q3ICUHuIbFSFZ/RNUaM/WWDpTB8eyX3ZkGX8Q+IF8E1ifnCDPP2Pz3KVV/XlghIe14qNgjD
 DyHQ6i/dhRb5tlVTV9Jhg==
UI-OutboundReport: notjunk:1;M01:P0:uZIcUIOwQ80=;4mulOX9tjcSeHANv1j2s6lFoHZg
 d0OCUmygWdbXnsf4Npg3pqAEGuem9NcIe3by/cySbutodAD7zOLK6I65ll/sCCi9vjJM4wqYh
 hVecKxK/3rYU/WH+xxttqUe2bcgeHeIEKfy6QCD6uhRH+Sl1j2ADiEhajsK9Hp5dkm9azmbMH
 Mh9Dc5mT8JstgpYWWfNGH8I76bbRnEjMsqW7/EuElZwgi2+eeKttmw9599ZYXde2hGTZaVfIc
 PzN0TDKFBeIywOiuBZ7/+XTqjHy4rEGRazkAVaCVY6eRkr3Tjxa+v92EnB1PcT3DbSQD0PHky
 Px6YA8PpSIQL/X6RPN5IiciZ8UZF9BOv3LNlIyhgGUQQCwOX97NkjKAc7buuGWOtbpCQjgQJT
 yTASFgBfQSPy5mUyZm92Fxzpn6qK8gx+7g8Bdny1g+wJls+LFjNQTCRBxrNNUeoQmy50v00fi
 sGSG4y4yzII3oSe9qVSCWBHXkWEccYFuJkZpkpGjpbbdy0OpzbAcXH/F6R0cEhdUUvIYREews
 wNP8u4+RSDQcAHc0HXxdaSzn9uZc58mrbFREL30qpf8P+V9t17/ExKcZAMgAk7+dbvuPWSFeu
 JYYwhDS4fNHSOB3lgfRLomYYwsWCAWdivekWMFt3IYbijZTfHfTCjTvDCWjtZF585aoJpsaKd
 SBNAHCJqL/LCdaEh+3yLKabS3tSi5T3lJ/qoKqFrBQ==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 02.06.21 07:01, Shravan S wrote:

.. digging out an old leftover from my queue ...

What happened to this ? Did I some following versions or had it just
faded away ? ;-)

> BIOS SAR (Specific Absorption Rate) driver for RF power regulation on Intel M.2 Modem.
> Limits the exposure of human body to RF frequencies.
> Uses ACPI to communicate to BIOS to retrieve SAR information data.

What data actually is that ? Sensor measurements ? Then it looks like it
fits IIO.

> Uses Sysfs to communicate this data to userspace via read and notify.

How's the actual protocol working ? What exactly is read and what is 
notified, and how ?

<snip>

> +Basic usage
> +===========
> +ACPI interface exposes this data from the BIOS to SAR driver. The front end
> +application in userspace ( eg: Modem Manager) will interact with SAR driver
> +to obtain information like the device mode (Example: tablets, laptops, etx),
> +Antenna index, baseband index, SAR table index and use available communication
> +like MBIM interface to enable data communication to modem for power regulation.
> +
> +Applications to carry out below required actions for establishing connection
> +with driver for data communication with the SAR driver:
> +- open the sysfs file for communication
> +- read the data to get the information
> +- get notification from sysfs if data is changed

Does that need root privileges ?

> +- write into sysfs to change regulatory mode.

Change it where exactly ? In the baseband ? Why isn't that done through
the corresponding baseband interface (MBIM ?) ?

> +Management application development
> +==================================
> +The driver and userspace interfaces are described below.
> +
> +sysfs channel for communication to userspace
> +--------------------------------------------
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_reg
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The driver exposes an sysfs entry in the kernel which is used for sending and
> +receiving regulatory information. The regulatory modes are depending on network.
> +FCC(0), CE(1), ISED(2)

Looks like an very low level and hardware specific userland abi.
Do we have to expect arbitrary changes based on bios version or hw
models ?

> +/sys/bus/platform/devices/INTC1092:00/intc_reg write()
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The regulatory modes should not exceed the allowed reguulatory worldwide.
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_reg read()
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The application can read the current regulatory mode that is set in the
> +driver.
> +
> +/sys/bus/platform/devices/INTC1092:00/intc_data
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +The driver exposes an sysfs entry in the kernel which is used for receiving
> +information sent by BIOS.

Which information exactly ? How is that encoded ?

> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 7ee369aab10d..3610ab7a12df 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_INTEL_SMARTCONNECT)		+= intel-smartconnect.o
>   obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)	+= intel_speed_select_if/
>   obj-$(CONFIG_INTEL_TURBO_MAX_3)			+= intel_turbo_max_3.o
>   obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)		+= intel-uncore-frequency.o
> +obj-$(CONFIG_INTEL_SAR)				+= intel-sar.o
>   
>   # Intel PMIC / PMC / P-Unit devices
>   obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)	+= intel_bxtwc_tmu.o
> diff --git a/drivers/platform/x86/intel-sar.c b/drivers/platform/x86/intel-sar.c
> new file mode 100644
> index 000000000000..9906eb4d79a7
> --- /dev/null
> +++ b/drivers/platform/x86/intel-sar.c
> @@ -0,0 +1,326 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Intel Corporation - ACPI for Specific Absorption Rate
> + * Copyright (c) 2021, Intel Corporation.
> + */
> +
> +#include <asm/errno.h>
> +#include <linux/acpi.h>
> +#include <linux/kobject.h>
> +#include <linux/platform_data/x86/intel-sar.h>
> +#include <linux/platform_device.h>
> +#include <linux/sysfs.h>
> +
> +/**
> + * get_int_value - Retrieve Integer values from ACPI Object
> + * Value of the integer from the object of ACPI is obtained.
> + * @obj: acpi_object pointer which has the integer value
> + * @out: output pointer will get integer value
> + * returns 0 on success
> + */
> +static int get_int_value(union acpi_object *obj, int *out)
> +{
> +	if (obj && obj->type == ACPI_TYPE_INTEGER) {
> +		*out = (int)obj->integer.value;
> +		return 0;
> +	} else {
> +		return -EFAULT;
> +	}
> +}
> +
> +/**
> + * update_sar_data - sar data is updated based on reg_value
> + * sar_data is updated based on regulatory value
> + * context->reg_value will never exceed MAX_REGULATORY
> + * @context: context pointer used for data
> + */
> +static void update_sar_data(struct wwan_sar_context *context)
> +{
> +	struct wwan_device_mode_configuration *config =
> +	&context->config_data[context->reg_value];
> +
> +	if (config->device_mode_info &&
> +	    context->sar_data.device_mode <= config->total_dev_mode) {
> +		struct wwan_device_mode_info *dev_mode =
> +		&config->device_mode_info[context->sar_data.device_mode];
> +		context->sar_data.antennatable_index = dev_mode->antennatable_index;
> +		context->sar_data.bandtable_index = dev_mode->bandtable_index;
> +		context->sar_data.sartable_index = dev_mode->sartable_index;
> +	}
> +}
> +
> +/**
> + * parse_package - parse package for SAR
> + * @context: context pointer used for data
> + * @item : acpi_object ptr
> + * returns if success or error
> + */
> +static acpi_status parse_package(struct wwan_sar_context *context, union acpi_object *item)
> +{
> +	int value = 0, itr = 0, reg = 0;
> +	union acpi_object *num;
> +	struct wwan_device_mode_configuration *data;
> +
> +	num = &item->package.elements[0];
> +	if (get_int_value(num, &value) == 0) {
> +		if (value >= 0 && value < MAX_REGULATORY)
> +			reg = value;
> +		else
> +			return AE_ERROR;
> +	}
> +	data = &context->config_data[reg];
> +	if (data->total_dev_mode > MAX_DEV_MODES)
> +		return AE_ERROR;
> +	data->device_mode_info =
> +	kmalloc_array(data->total_dev_mode, sizeof(struct wwan_device_mode_info), GFP_KERNEL);
> +	if (!data->device_mode_info) {
> +		pr_err("Cannot allocate memory in kernel\n");
> +		return AE_ERROR;
> +	}
> +	for (itr = 0; itr < data->total_dev_mode; itr++) {
> +		if (itr + 1 == item->package.count)
> +			break;
> +		num = &item->package.elements[itr + 1];
> +		if (num->type != ACPI_TYPE_PACKAGE)
> +			continue;
> +		if (num->package.count < TOTAL_DATA)
> +			break;
> +		if (get_int_value(&num->package.elements[0], &value) == 0)
> +			data->device_mode_info[itr].device_mode = value;
> +		if (get_int_value(&num->package.elements[1], &value) == 0)
> +			data->device_mode_info[itr].bandtable_index = value;
> +		if (get_int_value(&num->package.elements[2], &value) == 0)
> +			data->device_mode_info[itr].antennatable_index = value;
> +		if (get_int_value(&num->package.elements[3], &value) == 0)
> +			data->device_mode_info[itr].sartable_index = value;
> +	}
> +	return AE_OK;
> +}
> +
> +/**
> + * sar_module_probe - Extraction of information from BIOS via DSM calls

DSM calls ? Seriously ? Who invented that weird stuff ?
Why not just telling us how this silicon really works, so we can
implement some sane driver ?

> + * Retrieve all values related to device mode, SAR Table index,
> + * Antenna Table index, Band Table index
> + * @device: ACPI device for which to retrieve the data
> + * Returns AE_OK on success
> + */

Description incorrect. This function obviously probes the device,
but doesn't retrieve any measurements.

> +static acpi_status sar_module_probe(struct platform_device *device)
> +{
> +	acpi_status status = AE_OK;
> +	union acpi_object *out;
> +	u32 rev = 0;
> +	int value = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
> +
> +	pr_alert("%s Triggered\n", __func__);
> +	out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +				COMMAND_ID_DEV_MODE, NULL);
> +	if (get_int_value(out, &value) == 0) {
> +		context->sar_data.device_mode = value;
> +	} else {
> +		pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_DEV_MODE);
> +		ACPI_FREE(out);
> +		return AE_ERROR;
> +	}
> +	ACPI_FREE(out);
> +	dev_set_drvdata(&device->dev, context);
> +	sysfs_notify(context->sar_kobject, NULL, SYSFS_DATANAME);
> +	return status;
> +}
> +
> +static const struct acpi_device_id sar_device_ids[] = {
> +	{ "INTC1092", 0},
> +	{ "", 0},
> +};
> +
> +MODULE_DEVICE_TABLE(acpi, sar_device_ids);
> +
> +static const struct platform_device_id sar_device_table[] = {
> +	{"intc1092", 0},
> +	{},
> +};
> +
> +static ssize_t intc_data_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	unsigned long ret = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(dev);
> +
> +	ret = sprintf(buf, "%d %d %d %d\n", context->sar_data.device_mode,
> +		      context->sar_data.bandtable_index,
> +		      context->sar_data.antennatable_index,
> +		      context->sar_data.sartable_index);
> +	return ret;
> +}

What's the actual meaning of these values ?

> +static ssize_t intc_reg_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	unsigned long ret = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(dev);
> +
> +	ret = sprintf(buf, "%d\n", context->reg_value);
> +	return ret;
> +}

Does it really have to be user-unfriendly and secretive int values
instead of some names with actual meanings ?

> +static ssize_t intc_reg_store(struct device *dev, struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	int value = 0, read = 0;
> +	struct wwan_sar_context *context = dev_get_drvdata(dev);
> +
> +	if (!count) {
> +		pr_err("%s count = %d", __func__, (int)count);
> +		return -EFAULT;
> +	}
> +	read = sscanf(buf, "%u", &value);
> +	if (read <= 0) {
> +		pr_alert("%s Not a integer", __func__);
> +		return -EFAULT;
> +	}
> +	if (value >= 0 && value < MAX_REGULATORY) {
> +		context->reg_value = value;
> +		update_sar_data(context);
> +		dev_set_drvdata(dev, context);
> +		sysfs_notify(context->sar_kobject, NULL, SYSFS_DATANAME);
> +	}
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RO(intc_data);
> +static DEVICE_ATTR_RW(intc_reg);
> +
> +static struct attribute *intcsar_attrs[] = {
> +	&dev_attr_intc_data.attr,
> +	&dev_attr_intc_reg.attr,
> +	NULL
> +};
> +
> +static struct attribute_group intcsar_group = {
> +	.attrs = intcsar_attrs,
> +};
> +
> +static void sar_notify(acpi_handle handle, u32 event, void *data)
> +{
> +	struct platform_device *device = data;
> +
> +	if (event == SAR_EVENT) {
> +		if (sar_module_probe(device) != AE_OK)
> +			pr_err("sar_module_probe error");
> +	}
> +}
> +
> +static int sar_probe(struct platform_device *device)
> +{
> +	int result = 0;
> +	struct wwan_sar_context *context;
> +	union acpi_object *out, *item, req;
> +	acpi_status status = AE_OK;
> +	u32 rev = 0, reg = 0;
> +	int value = 0;
> +
> +	context = kmalloc(sizeof(*context), GFP_KERNEL);
> +	if (!context)
> +		return -ENOMEM;
> +	memset(context, 0, sizeof(struct wwan_sar_context));
> +	result = sysfs_create_group(&device->dev.kobj, &intcsar_group);
> +	if (result) {
> +		pr_err("sysfs creation failed\n");
> +		goto r_free;
> +	}
> +	context->sar_kobject = &device->dev.kobj;
> +	context->sar_device = device;
> +	dev_set_drvdata(&device->dev, context);
> +	if (guid_parse(SAR_DSM_UUID, &context->guid)) {
> +		pr_err("%s: UUID error\n", __func__);
> +		goto r_sys;
> +	}
> +	context->handle = ACPI_HANDLE(&device->dev);
> +	for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +		req.type = ACPI_TYPE_INTEGER;
> +		req.integer.value = reg;
> +		out = acpi_evaluate_dsm(context->handle, &context->guid, rev,
> +					COMMAND_ID_CONFIG_TABLE, &req);
> +		if (!out) {
> +			pr_err("%s: Cmd:%d Failed\n", __func__, COMMAND_ID_CONFIG_TABLE);
> +			continue;
> +		}
> +		if (out->type == ACPI_TYPE_PACKAGE && out->package.count >= 3) {
> +			item = &out->package.elements[0];
> +			if (get_int_value(item, &value) == 0)
> +				context->config_data[reg].version = value;
> +			item = &out->package.elements[1];
> +			if (get_int_value(item, &value) == 0)
> +				context->config_data[reg].total_dev_mode = value;
> +			if (context->config_data[reg].total_dev_mode <= 0 &&
> +			    context->config_data[reg].total_dev_mode >
> +				MAX_DEV_MODES) {
> +				pr_err("total_dev_mode is not within range : %d\n",
> +				       context->config_data[reg].total_dev_mode);
> +				ACPI_FREE(out);
> +				continue;
> +			}
> +			item = &out->package.elements[2];
> +			if (item->type == ACPI_TYPE_PACKAGE && item->package.count > 0)
> +				status = parse_package(context, item);
> +			else
> +				status = AE_ERROR;
> +			if (status != AE_OK) {
> +				ACPI_FREE(out);
> +				continue;
> +			}
> +		}
> +		ACPI_FREE(out);

How does the corresponding ASL code look like ?

> +	}
> +	update_sar_data(context);
> +	if (sar_module_probe(device) != AE_OK) {
> +		pr_err("Failed sar_module_probe\n");
> +		goto r_sys;
> +	}
> +	if (acpi_install_notify_handler(ACPI_HANDLE(&device->dev), ACPI_DEVICE_NOTIFY,
> +					sar_notify, (void *)device) != AE_OK) {
> +		pr_err("Failed acpi_install_notify_handler\n");
> +		goto r_sys;
> +	}
> +	return 0;
> +
> +r_sys:
> +	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
> +r_free:
> +	kfree(context);
> +	return -1;
> +}
> +
> +static int sar_remove(struct platform_device *device)
> +{
> +	struct wwan_sar_context *context = dev_get_drvdata(&device->dev);
> +	int reg = 0;
> +
> +	acpi_remove_notify_handler(ACPI_HANDLE(&device->dev),
> +				   ACPI_DEVICE_NOTIFY, sar_notify);
> +	sysfs_remove_group(&device->dev.kobj, &intcsar_group);
> +	for (reg = 0; reg < MAX_REGULATORY; reg++) {
> +		kfree(context->config_data[reg].device_mode_info);
> +		context->config_data[reg].device_mode_info = NULL;
> +	}
> +	kfree(context);
> +	return 0;
> +}
> +
> +MODULE_DEVICE_TABLE(platform, sar_device_table);
> +
> +static struct platform_driver sar_driver = {
> +	.probe = sar_probe,
> +	.remove = sar_remove,
> +	.driver = {
> +			.name = DRVNAME,
> +			.owner = THIS_MODULE,
> +			/* FOR ACPI HANDLING */
> +			.acpi_match_table = ACPI_PTR(sar_device_ids),
> +			},
> +	.id_table = sar_device_table,
> +};
> +
> +module_platform_driver(sar_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Platform device driver for INTEL MODEM BIOS SAR");
> +MODULE_AUTHOR("Shravan S <s.shravan@intel.com>");
> diff --git a/include/linux/platform_data/x86/intel-sar.h b/include/linux/platform_data/x86/intel-sar.h
> new file mode 100644
> index 000000000000..6e2ac93a3ebc
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel-sar.h
> @@ -0,0 +1,89 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Intel Corporation Header File for Specific Absorption Rate
> + * Copyright (c) 2021, Intel Corporation.
> + */
> +#ifndef INTEL_SAR_H
> +#define INTEL_SAR_H
> +
> +#define DRVNAME "intc_sar"
> +#define SYSFS_DATANAME "intc_data"
> +#define SAR_DSM_UUID "82737E72-3A33-4C45-A9C7-57C0411A5F13"
> +#define COMMAND_ID_DEV_MODE 1
> +#define COMMAND_ID_CONFIG_TABLE 2
> +#define COMMAND_TEST_SET 31
> +#define MAX_REGULATORY 3
> +#define SAR_EVENT 0x80
> +#define MAX_DEV_MODES 50
> +#define TOTAL_DATA 4
> +
> +/**
> + * Structure wwan_device_mode_info - device mode information
> + * Holds the data that needs to be passed to userspace.
> + * The data is updated from the BIOS sensor information.
> + * @device_mode: Specific mode of the device
> + * @bandtable_index: Index of RF band
> + * @antennatable_index: Index of antenna
> + * @sartable_index: Index of SAR
> + */
> +struct wwan_device_mode_info {
> +		int device_mode;
> +		int bandtable_index;
> +		int antennatable_index;
> +		int sartable_index;
> +};
> +
> +/**
> + * Structure wwan_device_mode_configuration - device configuration
> + * Holds the data that is configured and obtained on probe event.
> + * The data is updated from the BIOS sensor information.
> + * @version: Mode configuration version
> + * @total_dev_mode: Total number of device modes
> + * @device_mode_info: pointer to structure wwan_device_mode_info
> + */
> +struct wwan_device_mode_configuration {
> +		int version;
> +		int total_dev_mode;
> +		struct wwan_device_mode_info *device_mode_info;
> +};
> +
> +/**
> + * Structure wwan_supported_info - userspace datastore
> + * Holds the data that is obtained from userspace
> + * The data is updated from the userspace and send value back in the
> + * structure format that is mentioned here.
> + * @reg_mode_needed: regulatory mode set by user for tests
> + * @bios_table_revision: Version of SAR table
> + * @num_supported_modes: Total supported modes based on reg_mode
> + */
> +struct wwan_supported_info {
> +		int reg_mode_needed;
> +		int bios_table_revision;
> +		int num_supported_modes;
> +};
> +
> +/**
> + * Structure wwan_sar_context - context of SAR
> + * Holds the complete context as long as the driver is in existence
> + * The context holds instance of the data used for different cases.
> + * @guid: Group id
> + * @handle: store acpi handle
> + * @reg_value: regulatory value
> + * Regulatory 0: FCC, 1: CE, 2: ISED
> + * @sar_device: platform_device type
> + * @sar_kobject: kobject for sysfs
> + * @supported_data: wwan_supported_info struct
> + * @sar_data: wwan_device_mode_info struct
> + * @config_data: wwan_device_mode_configuration array struct
> + */
> +struct wwan_sar_context {
> +		guid_t guid;
> +		acpi_handle handle;
> +		int reg_value;
> +		struct platform_device *sar_device;
> +		struct kobject *sar_kobject;
> +		struct wwan_supported_info supported_data;
> +		struct wwan_device_mode_info sar_data;
> +		struct wwan_device_mode_configuration config_data[MAX_REGULATORY];
> +};
> +#endif /* INTEL_SAR_H */


Smells like the whole things fits best in rfkill subsys ...

Hardware specific userspace abi in general is a really bad idea.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
