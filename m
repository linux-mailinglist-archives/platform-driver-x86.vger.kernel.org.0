Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69241429357
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Oct 2021 17:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238971AbhJKPaY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 Oct 2021 11:30:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20370 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239755AbhJKPaG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 11:30:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633966086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KGKlgPcYJB7Gk+zG4w+C5wcCLX0yP5sTF8EO5zllrRo=;
        b=JQHTmRTaXLwuy8wqKo2S9czfl5HRXtIT3XJMqNkEyCx7cLyjIWxls+9vuELZX9e5Vw0duL
        Gkvm7V8+e2Qc1Uy7q1E5sKDhonGuRyg8qxKIzeYQefjLYeV7klEpE1cX6RArxPJcSLhA/m
        a4j1SMj7WJRNg7WE75vrJEuBgNDX3hs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-pEkBMUVeNyufhoik2aWEBQ-1; Mon, 11 Oct 2021 11:28:03 -0400
X-MC-Unique: pEkBMUVeNyufhoik2aWEBQ-1
Received: by mail-ed1-f70.google.com with SMTP id t28-20020a508d5c000000b003dad7fc5caeso16192844edt.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 08:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KGKlgPcYJB7Gk+zG4w+C5wcCLX0yP5sTF8EO5zllrRo=;
        b=8Hokv08zBnSF+bU/YGcFHc0OwCKJ6Xrf/mZYpENdfyAidEHl/HnFoViHhKs7v1RGYd
         4VezobBzhhwsqQNcJs4rxKioKIn+6xIU/Nyzoy2Zo8AQAK7dFQ7ePN71nELfaudUStHs
         syio7wsgAuIg2cl/hUcbEwZAVEFm62pWn4Dc8AkfYPyRDkSAxfJ7hmUR7lSKkkU1U3H7
         70IYuaMXIO6CBwpPD62CbVUzBD7F4kwo2TWSRd7xbFBcxpOuIZ5WYysS3XTPXo15megu
         5MBV6tzO8Vv3ztXiGY86hrdk+vQq4pMaLm7qiUdO9Pc39M+kYSbV7nxcBm/3gfu9582j
         Rapg==
X-Gm-Message-State: AOAM530FyKGfsm8tohBEJU4DiG5KgYb3yPOpCNGiUrL0siCdbje4Bn/E
        m6YqwLLd/BaegnsgidhaN9dUKha6w0AQcCucGSQJuMtvAnzCMjvebtkCdyhLloMplFGkFFlwg8Z
        L2wCcM9noA5LRxDUl8+mR7zqctN0m4N+0rw==
X-Received: by 2002:a05:6402:350b:: with SMTP id b11mr20305348edd.341.1633966081592;
        Mon, 11 Oct 2021 08:28:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzO6Nd+c2KaKwLVXBvZkWvk8SOfjw0UaN58bWT1k/XTZgMW7Sdo8xaRbtxQhUPO4FyXF22hZQ==
X-Received: by 2002:a05:6402:350b:: with SMTP id b11mr20305300edd.341.1633966081205;
        Mon, 11 Oct 2021 08:28:01 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id n24sm4430570edb.28.2021.10.11.08.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 08:28:00 -0700 (PDT)
Subject: Re: [PATCH v15] asus-wmi: Add support for custom fan curves
To:     "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc:     pobrn@protonmail.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, hadess@hadess.net
References: <20211002062157.33318-1-luke@ljones.dev>
 <20211002062157.33318-2-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5f138c01-b644-280b-1d36-94dabe48657d@redhat.com>
Date:   Mon, 11 Oct 2021 17:28:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002062157.33318-2-luke@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Luke,

On 10/2/21 8:21 AM, Luke D. Jones wrote:
> Add support for custom fan curves found on some ASUS ROG laptops.
> 
> These laptops have the ability to set a custom curve for the CPU
> and GPU fans via two ACPI methods.
> 
> This patch adds two pwm<N> attributes to the hwmon sysfs,
> pwm1 for CPU fan, pwm2 for GPU fan. Both are under the hwmon of the
> name `asus_custom_fan_curve`. There is no safety check of the set
> fan curves - this must be done in userspace.
> 
> The fans have settings [1,2,3] under pwm<N>_enable:
> 1. Enable and write settings out
> 2. Disable and use factory fan mode
> 3. Same as 2, additionally restoring default factory curve.
> 
> Use of 2 means that the curve the user has set is still stored and
> won't be erased, but the laptop will be using its default auto-fan
> mode. Re-enabling the manual mode then activates the curves again.
> 
> Notes:
> - pwm<N>_enable = 0 is an invalid setting.
> - pwm is actually a percentage and is scaled on writing to device.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Ok, so I've finally been able to make some time to review this
large patch. I've a couple remarks inline below, otherwise this looks
good.

> ---
>  drivers/platform/x86/asus-wmi.c            | 608 ++++++++++++++++++++-
>  include/linux/platform_data/x86/asus-wmi.h |   2 +
>  2 files changed, 602 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index e14fb5fa7324..8b0ed1969d86 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -106,8 +106,17 @@ module_param(fnlock_default, bool, 0444);
>  
>  #define WMI_EVENT_MASK			0xFFFF
>  
> +#define FAN_CURVE_POINTS		8
> +#define FAN_CURVE_BUF_LEN		(FAN_CURVE_POINTS * 2)
> +#define FAN_CURVE_DEV_CPU		0x00
> +#define FAN_CURVE_DEV_GPU		0x01
> +/* Mask to determine if setting temperature or percentage */
> +#define FAN_CURVE_PWM_MASK		0x04
> +
>  static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>  
> +static int throttle_thermal_policy_write(struct asus_wmi *);
> +
>  static bool ashs_present(void)
>  {
>  	int i = 0;
> @@ -122,7 +131,8 @@ struct bios_args {
>  	u32 arg0;
>  	u32 arg1;
>  	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
> -	u32 arg4;
> +	u32 arg3;
> +	u32 arg4; /* Some ROG laptops require a full 5 input args */
>  	u32 arg5;
>  } __packed;
>  
> @@ -173,6 +183,12 @@ enum fan_type {
>  	FAN_TYPE_SPEC83,	/* starting in Spec 8.3, use CPU_FAN_CTRL */
>  };
>  
> +struct fan_curve_data {
> +	bool enabled;
> +	u8 temps[FAN_CURVE_POINTS];
> +	u8 percents[FAN_CURVE_POINTS];
> +};
> +
>  struct asus_wmi {
>  	int dsts_id;
>  	int spec;
> @@ -220,6 +236,10 @@ struct asus_wmi {
>  	bool throttle_thermal_policy_available;
>  	u8 throttle_thermal_policy_mode;
>  
> +	bool cpu_fan_curve_available;
> +	bool gpu_fan_curve_available;
> +	struct fan_curve_data custom_fan_curves[2];
> +
>  	struct platform_profile_handler platform_profile_handler;
>  	bool platform_profile_support;
>  
> @@ -285,6 +305,103 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
>  }
>  EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
>  
> +static int asus_wmi_evaluate_method5(u32 method_id,
> +		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
> +{
> +	struct bios_args args = {
> +		.arg0 = arg0,
> +		.arg1 = arg1,
> +		.arg2 = arg2,
> +		.arg3 = arg3,
> +		.arg4 = arg4,
> +	};
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	union acpi_object *obj;
> +	u32 tmp = 0;
> +
> +	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID, 0, method_id,
> +				     &input, &output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = (union acpi_object *)output.pointer;
> +	if (obj && obj->type == ACPI_TYPE_INTEGER)
> +		tmp = (u32) obj->integer.value;
> +
> +	if (retval)
> +		*retval = tmp;
> +
> +	kfree(obj);
> +
> +	if (tmp == ASUS_WMI_UNSUPPORTED_METHOD)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +/*
> + * Returns as an error if the method output is not a buffer. Typically this
> + * means that the method called is unsupported.
> + */
> +static int asus_wmi_evaluate_method_buf(u32 method_id,
> +		u32 arg0, u32 arg1, u8 *ret_buffer, size_t size)
> +{
> +	struct bios_args args = {
> +		.arg0 = arg0,
> +		.arg1 = arg1,
> +		.arg2 = 0,
> +	};
> +	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +	acpi_status status;
> +	union acpi_object *obj;
> +	int err = 0;
> +
> +	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID, 0, method_id,
> +				     &input, &output);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	obj = (union acpi_object *)output.pointer;
> +
> +	switch (obj->type) {
> +	case ACPI_TYPE_BUFFER:
> +		if (obj->buffer.length > size)
> +			err = -ENOSPC;
> +		if (obj->buffer.length == 0)
> +			err = -ENODATA;
> +
> +		memcpy(ret_buffer, obj->buffer.pointer, obj->buffer.length);
> +		break;
> +	case ACPI_TYPE_INTEGER:
> +		err = (u32)obj->integer.value;
> +
> +		if (err == ASUS_WMI_UNSUPPORTED_METHOD)
> +			err = -ENODEV;
> +		/*
> +		 * At least one method returns a 0 with no buffer if no arg
> +		 * is provided, such as ASUS_WMI_DEVID_CPU_FAN_CURVE
> +		 */
> +		if (err == 0)
> +			err = -ENODATA;
> +		break;
> +	default:
> +		err = -ENODATA;
> +		break;
> +	}
> +
> +	kfree(obj);
> +
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
>  static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
>  {
>  	struct acpi_buffer input;
> @@ -1806,6 +1923,13 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  	}
>  
>  	asus->fan_pwm_mode = state;
> +
> +	/* Must set to disabled if mode is toggled */
> +	if (asus->cpu_fan_curve_available)
> +		asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled = false;
> +	if (asus->gpu_fan_curve_available)
> +		asus->custom_fan_curves[FAN_CURVE_DEV_GPU].enabled = false;
> +
>  	return count;
>  }
>  
> @@ -1953,9 +2077,9 @@ static int fan_boost_mode_check_present(struct asus_wmi *asus)
>  
>  static int fan_boost_mode_write(struct asus_wmi *asus)
>  {
> -	int err;
> -	u8 value;
>  	u32 retval;
> +	u8 value;
> +	int err;
>  
>  	value = asus->fan_boost_mode;
>  
> @@ -2013,10 +2137,10 @@ static ssize_t fan_boost_mode_store(struct device *dev,
>  				    struct device_attribute *attr,
>  				    const char *buf, size_t count)
>  {
> -	int result;
> -	u8 new_mode;
>  	struct asus_wmi *asus = dev_get_drvdata(dev);
>  	u8 mask = asus->fan_boost_mode_mask;
> +	u8 new_mode;
> +	int result;
>  
>  	result = kstrtou8(buf, 10, &new_mode);
>  	if (result < 0) {
> @@ -2043,6 +2167,462 @@ static ssize_t fan_boost_mode_store(struct device *dev,
>  // Fan boost mode: 0 - normal, 1 - overboost, 2 - silent
>  static DEVICE_ATTR_RW(fan_boost_mode);
>  
> +/* Custom fan curves *********************************************************/
> +
> +static void fan_curve_copy_from_buf(struct fan_curve_data *data, u8 *buf)
> +{
> +	int i;
> +
> +	for (i = 0; i < FAN_CURVE_POINTS; i++) {
> +		data->temps[i] = buf[i];
> +	}
> +
> +	for (i = 0; i < FAN_CURVE_POINTS; i++) {
> +		data->percents[i] =
> +			255 * buf[i + FAN_CURVE_POINTS] / 100;
> +	}
> +}
> +
> +static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
> +{
> +	struct fan_curve_data *curves;
> +	u8 buf[FAN_CURVE_BUF_LEN];
> +	int fan_idx = 0;
> +	u8 mode = 0;
> +	int err;
> +
> +	if (asus->throttle_thermal_policy_available)
> +		mode = asus->throttle_thermal_policy_mode;
> +	/* DEVID_<C/G>PU_FAN_CURVE is switched for OVERBOOST vs SILENT */
> +	if (mode == 2)
> +		mode = 1;
> +	else if (mode == 1)
> +		mode = 2;
> +
> +	if (fan_dev == ASUS_WMI_DEVID_GPU_FAN_CURVE)
> +		fan_idx = FAN_CURVE_DEV_GPU;
> +
> +	curves = &asus->custom_fan_curves[fan_idx];
> +	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
> +					   FAN_CURVE_BUF_LEN);
> +	if (err)
> +		return err;
> +
> +	fan_curve_copy_from_buf(curves, buf);
> +
> +	return 0;
> +}
> +
> +/* Check if capability exists, and populate defaults */
> +static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
> +				   u32 fan_dev)
> +{
> +	int err;
> +
> +	*available = false;
> +
> +	err = fan_curve_get_factory_default(asus, fan_dev);
> +	if (err) {
> +		if (err == -ENODEV)
> +			return 0;
> +		return err;
> +	}
> +
> +	*available = true;
> +	return 0;
> +}
> +
> +/* Determine which fan the attribute is for if SENSOR_ATTR */
> +static struct fan_curve_data *fan_curve_attr_select(struct asus_wmi *asus,
> +					      struct device_attribute *attr)
> +{
> +	int index = to_sensor_dev_attr(attr)->index;
> +
> +	return &asus->custom_fan_curves[index & FAN_CURVE_DEV_GPU];
> +}
> +
> +/* Determine which fan the attribute is for if SENSOR_ATTR_2 */
> +static struct fan_curve_data *fan_curve_attr_2_select(struct asus_wmi *asus,
> +					    struct device_attribute *attr)
> +{
> +	int nr = to_sensor_dev_attr_2(attr)->nr;
> +
> +	return &asus->custom_fan_curves[nr & FAN_CURVE_DEV_GPU];
> +}
> +
> +static ssize_t fan_curve_show(struct device *dev,
> +			      struct device_attribute *attr, char *buf)
> +{
> +	struct sensor_device_attribute_2 *dev_attr = to_sensor_dev_attr_2(attr);
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	struct fan_curve_data *data;
> +	int value, index, nr;
> +
> +	data = fan_curve_attr_2_select(asus, attr);
> +	index = dev_attr->index;
> +	nr = dev_attr->nr;
> +
> +	if (nr & FAN_CURVE_PWM_MASK)
> +		value = data->percents[index];
> +	else
> +		value = data->temps[index];
> +
> +	return sysfs_emit(buf, "%d\n", value);
> +}
> +
> +/*
> + * "fan_dev" is the related WMI method such as ASUS_WMI_DEVID_CPU_FAN_CURVE.
> + */
> +static int fan_curve_write(struct asus_wmi *asus,
> +			   struct device_attribute *attr, u32 fan_dev)
> +{
> +	struct fan_curve_data *data = fan_curve_attr_2_select(asus, attr);
> +	u32 arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0;
> +	u8 *percents = data->percents;
> +	u8 *temps = data->temps;
> +	int ret, i, shift = 0;
> +
> +	for (i = 0; i < FAN_CURVE_POINTS / 2; i++) {
> +		arg1 += (temps[i]) << shift;
> +		arg2 += (temps[i + 4]) << shift;
> +		/* Scale to percentage for device */
> +		arg3 += (100 * percents[i] / 255) << shift;
> +		arg4 += (100 * percents[i + 4] / 255) << shift;
> +		shift += 8;
> +	}
> +
> +	return asus_wmi_evaluate_method5(ASUS_WMI_METHODID_DEVS, fan_dev, arg1,
> +					 arg2, arg3, arg4, &ret);
> +}
> +
> +/*
> + * Called on curve enable/disable. This should be the only way to write out the
> + * fan curves. This avoids potential lockups on write to ACPI for every change.
> + */
> +static int fan_curve_write_data(struct asus_wmi *asus,
> +				struct device_attribute *attr)
> +{
> +	int err;
> +
> +	if (asus->cpu_fan_curve_available) {
> +		err = fan_curve_write(asus, attr, ASUS_WMI_DEVID_CPU_FAN_CURVE);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (asus->gpu_fan_curve_available) {
> +		err = fan_curve_write(asus, attr, ASUS_WMI_DEVID_GPU_FAN_CURVE);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t fan_curve_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct sensor_device_attribute_2 *dev_attr = to_sensor_dev_attr_2(attr);
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	struct fan_curve_data *data;
> +	u8 value;
> +	int err;
> +
> +	int pwm = dev_attr->nr & FAN_CURVE_PWM_MASK;
> +	int index = dev_attr->index;
> +
> +	data = fan_curve_attr_2_select(asus, attr);
> +
> +	err = kstrtou8(buf, 10, &value);
> +	if (err < 0)
> +		return err;
> +
> +	if (pwm) {
> +		data->percents[index] = value;
> +	} else {
> +		data->temps[index] = value;
> +	}
> +
> +	/*
> +	 * Mark as disabled so the user has to explicitly enable to apply a
> +	 * changed fan curve. This prevents potential lockups from writing out
> +	 * many changes as one-write-per-change.
> +	 */
> +	data->enabled = false;
> +
> +	return count;
> +}
> +
> +static ssize_t fan_curve_enable_show(struct device *dev,
> +				     struct device_attribute *attr, char *buf)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	struct fan_curve_data *data;
> +	int out = 2;
> +
> +	data = fan_curve_attr_select(asus, attr);
> +
> +	if (data->enabled)
> +		out = 1;
> +
> +	return sysfs_emit(buf, "%d\n", out);
> +}
> +
> +static int fan_curve_set_default(struct asus_wmi *asus)
> +{
> +	int err;
> +
> +	err = fan_curve_get_factory_default(
> +		asus, ASUS_WMI_DEVID_CPU_FAN_CURVE);
> +	if (err)
> +		return err;
> +
> +	err = fan_curve_get_factory_default(
> +		asus, ASUS_WMI_DEVID_GPU_FAN_CURVE);
> +	if (err)
> +		return err;
> +	return 0;
> +}
> +
> +static ssize_t fan_curve_enable_store(struct device *dev,
> +				      struct device_attribute *attr,
> +				      const char *buf, size_t count)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(dev);
> +	struct fan_curve_data *data;
> +	int value, err;
> +
> +	data = fan_curve_attr_select(asus, attr);
> +
> +	err = kstrtoint(buf, 10, &value);
> +	if (err < 0)
> +		return err;
> +
> +	switch (value) {
> +	case 1:
> +		data->enabled = true;
> +		break;
> +	case 2:
> +		data->enabled = false;
> +		break;
> +	/*
> +	 * Auto + reset the fan curve data to defaults. Make it an explicit
> +	 * option so that users don't accidentally overwrite a set fan curve.
> +	 */
> +	case 3:
> +		err = fan_curve_set_default(asus);
> +		if (err)
> +			return err;
> +		data->enabled = false;
> +		break;
> +	default:
> +		return -EINVAL;
> +	};
> +
> +	/*
> +	 * For machines with throttle this is the only way to reset fans to
> +	 * default mode of operation (does not erase curve data).
> +	 */
> +	if (asus->throttle_thermal_policy_available && !data->enabled) {
> +		err = throttle_thermal_policy_write(asus);
> +		if (err)
> +			return err;
> +	}
> +	/* Similar is true for laptops with this fan */
> +	if (asus->fan_type == FAN_TYPE_SPEC83) {

This if seems to miss a "&& !data->enabled" in its condition ?

Also assuming I have this right it might be better to refactor all
this to:

```
	if (data->enabled) {
		err = fan_curve_write_data(asus, attr);
	} else {
		if (asus->throttle_thermal_policy_available) {
			err = throttle_thermal_policy_write(asus);
		} else if (asus->fan_type == FAN_TYPE_SPEC83) {
			err = asus_fan_set_auto(asus);
		} else {
			/*
			 * Machines without either need to write their defaults back always.
			 * This is more of a safeguard against ASUS faulty ACPI tables.
			 */
			err = fan_curve_set_default(asus);
			if (err)
				return err;
			err = fan_curve_write_data(asus, attr);
		}
	}

	if (err)
		return err;
```

At least to me it seems that this more clearly expresses what you are trying
to achieve?


> +		err = asus_fan_set_auto(asus);
> +		if (err)
> +			return err;
> +	}
> +	/*
> +	 * Machines without either need to write their defaults back always.
> +	 * This is more of a safeguard against ASUS faulty ACPI tables.
> +	 */
> +	if (!asus->throttle_thermal_policy_available
> +	    && asus->fan_type != FAN_TYPE_SPEC83 && !data->enabled) {
> +		err = fan_curve_set_default(asus);
> +		if (err)
> +			return err;
> +		err = fan_curve_write_data(asus, attr);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (data->enabled) {
> +		err = fan_curve_write_data(asus, attr);
> +		if (err)
> +			return err;
> +	}
> +
> +	return count;
> +}
> +
> +/* CPU */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_enable, fan_curve_enable, FAN_CURVE_DEV_CPU);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point7_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point8_temp, fan_curve,
> +			       FAN_CURVE_DEV_CPU, 7);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point7_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point8_pwm, fan_curve,
> +			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 7);
> +
> +/* GPU */
> +static SENSOR_DEVICE_ATTR_RW(pwm2_enable, fan_curve_enable, FAN_CURVE_DEV_GPU);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point7_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point8_temp, fan_curve,
> +			       FAN_CURVE_DEV_GPU, 7);
> +
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 0);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 1);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 2);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 3);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 4);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 5);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point7_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 6);
> +static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point8_pwm, fan_curve,
> +			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 7);
> +
> +static struct attribute *asus_fan_curve_attr[] = {
> +	/* CPU */
> +	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
> +	/* GPU */
> +	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
> +	NULL
> +};
> +
> +static umode_t asus_fan_curve_is_visible(struct kobject *kobj,
> +					 struct attribute *attr, int idx)
> +{
> +	struct device *dev = container_of(kobj, struct device, kobj);
> +	struct asus_wmi *asus = dev_get_drvdata(dev->parent);
> +
> +	if (asus->cpu_fan_curve_available)
> +		return 0644;
> +
> +	if (asus->gpu_fan_curve_available)
> +		return 0644;

This seems wrong this essentially does:

	if (asus->cpu_fan_curve_available || asus->gpu_fan_curve_available)
		return 0644;

So if either is available all attributes for both curves will
always show. Shouldn't this check which curve the attribute belongs to
and then decide which _available value to use based on that ?

Since all attributes have their name start with either "pwm1" or "pwm2"
I believe that you can check on that here.

A probably better solution would be to just always use
SENSOR_DEVICE_ATTR_2_RW even for the pwmX_enabled, then you can
just cast the attr here and check nr. and as an added bonus
you can drop the fan_curve_attr_select() helper function.


> +	return 0;
> +}
> +
> +static const struct attribute_group asus_fan_curve_attr_group = {
> +	.is_visible = asus_fan_curve_is_visible,
> +	.attrs = asus_fan_curve_attr,
> +};
> +__ATTRIBUTE_GROUPS(asus_fan_curve_attr);
> +
> +/*
> + * Must be initialised after throttle_thermal_policy_check_present() as
> + * we check the status of throttle_thermal_policy_available during init.
> + */
> +static int asus_wmi_custom_fan_curve_init(struct asus_wmi *asus)
> +{
> +	struct device *dev = &asus->platform_device->dev;
> +	struct device *hwmon;
> +	int err;
> +
> +	err = fan_curve_check_present(asus, &asus->cpu_fan_curve_available,
> +				      ASUS_WMI_DEVID_CPU_FAN_CURVE);
> +	if (err)
> +		return err;
> +
> +	err = fan_curve_check_present(asus, &asus->gpu_fan_curve_available,
> +				      ASUS_WMI_DEVID_GPU_FAN_CURVE);
> +	if (err)
> +		return err;

What if neither are present, should you not do a return 0 then ?

> +
> +	hwmon = devm_hwmon_device_register_with_groups(
> +		dev, "asus_custom_fan_curve", asus, asus_fan_curve_attr_groups);
> +
> +	if (IS_ERR(hwmon)) {
> +		dev_err(dev,
> +			"Could not register asus_custom_fan_curve device\n");
> +		return PTR_ERR(hwmon);
> +	}
> +
> +	return 0;
> +}
> +
>  /* Throttle thermal policy ****************************************************/
>  
>  static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
> @@ -2053,8 +2633,8 @@ static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
>  	asus->throttle_thermal_policy_available = false;
>  
>  	err = asus_wmi_get_devstate(asus,
> -				    ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
> -				    &result);
> +		ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
> +		&result);

Unrelated change ?  Also the old indentation seems better, please drop this.

>  	if (err) {
>  		if (err == -ENODEV)
>  			return 0;
> @@ -2092,6 +2672,12 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  		return -EIO;
>  	}
>  
> +	/* Must set to disabled if mode is toggled */
> +	if (asus->cpu_fan_curve_available)
> +		asus->custom_fan_curves[FAN_CURVE_DEV_CPU].enabled = false;
> +	if (asus->gpu_fan_curve_available)
> +		asus->custom_fan_curves[FAN_CURVE_DEV_GPU].enabled = false;
> +
>  	return 0;
>  }
>  
> @@ -2901,7 +3487,7 @@ static int show_call(struct seq_file *m, void *data)
>  	if (ACPI_FAILURE(status))
>  		return -EIO;
>  
> -	obj = (union acpi_object *)output.pointer;
> +	obj = output.pointer;
>  	if (obj && obj->type == ACPI_TYPE_INTEGER)
>  		seq_printf(m, "%#x(%#x, %#x) = %#x\n", asus->debug.method_id,
>  			   asus->debug.dev_id, asus->debug.ctrl_param,

Unrelated change, please drop.

> @@ -3035,6 +3621,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_hwmon;
>  
> +	err = asus_wmi_custom_fan_curve_init(asus);
> +	if (err)
> +		goto fail_custom_fan_curve;
> +
>  	err = asus_wmi_led_init(asus);
>  	if (err)
>  		goto fail_leds;
> @@ -3106,6 +3696,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus_wmi_sysfs_exit(asus->platform_device);
>  fail_sysfs:
>  fail_throttle_thermal_policy:
> +fail_custom_fan_curve:
>  fail_platform_profile_setup:
>  	if (asus->platform_profile_support)
>  		platform_profile_remove();
> @@ -3131,6 +3722,7 @@ static int asus_wmi_remove(struct platform_device *device)
>  	asus_wmi_debugfs_exit(asus);
>  	asus_wmi_sysfs_exit(asus->platform_device);
>  	asus_fan_set_auto(asus);
> +	throttle_thermal_policy_set_default(asus);
>  	asus_wmi_battery_exit(asus);
>  
>  	if (asus->platform_profile_support)
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 17dc5cb6f3f2..a571b47ff362 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -77,6 +77,8 @@
>  #define ASUS_WMI_DEVID_THERMAL_CTRL	0x00110011
>  #define ASUS_WMI_DEVID_FAN_CTRL		0x00110012 /* deprecated */
>  #define ASUS_WMI_DEVID_CPU_FAN_CTRL	0x00110013
> +#define ASUS_WMI_DEVID_CPU_FAN_CURVE	0x00110024
> +#define ASUS_WMI_DEVID_GPU_FAN_CURVE	0x00110025
>  
>  /* Power */
>  #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
> 

Regards,

Hans

