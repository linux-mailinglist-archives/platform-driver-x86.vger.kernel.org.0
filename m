Return-Path: <platform-driver-x86+bounces-4525-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8293F214
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jul 2024 12:03:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A22841C22000
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jul 2024 10:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D0A13FD69;
	Mon, 29 Jul 2024 10:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bQrxVE1B"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F92C84DE4
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 10:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722247388; cv=none; b=WsNGOJQGD4R8WLxVclTi3wQn+p/N0NqiHjPm326Y8FfSiN5jfSgE9DxSUr3FQmMpG+9W2rAhh9sqaVPknkGxSye/UtfKQMjm3VxSbs2tWB9/Mso5XQ3o4V1n5eFBHhy7MWqQHD+1aUvorTdP0aO/PUirN2McSB0wsGOcCkntp0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722247388; c=relaxed/simple;
	bh=pznMhmfkFIdmxqFBGr7jNdzY/njoycvNI+HOgpa6XZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBbDB/121DkvUClbxlUElISc0x/EEZ2aYIBtNRKm+bc/KRcU3M/ApWbKM2XJplSh0wSj6JGcSc2mmjlnFEgf2vtzLPw9D2Hgklk0WhUBa+aheK475BSkFgcIqr/VDpWWFq01EKkqnnpHEjKiTRxKgpATO5cXov7JbmV8KMu6DKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bQrxVE1B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722247385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+VfSwGGC4AN4fOtZQZ7pK4YQ803b3GCd+JVUAciynug=;
	b=bQrxVE1BbYqgRiQiXjrfr6cCDFzNw8altraIqR43mCVDylUWybloFClayl+c3PdM3OcrO6
	X5Jt7KHtSvKPMoYsA2M3jANE894CGMGLKTShncPVgweKc8j9nHVYaY4JoDQvHsPuAHyBvo
	2W1K4+KULchk1Pq48ZhYLSeZr0FKU3M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-wN7N58S7OMq9JIRlSmzCXg-1; Mon, 29 Jul 2024 06:03:03 -0400
X-MC-Unique: wN7N58S7OMq9JIRlSmzCXg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3687e6d7a3aso1174176f8f.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 03:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722247382; x=1722852182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+VfSwGGC4AN4fOtZQZ7pK4YQ803b3GCd+JVUAciynug=;
        b=NXCTX55+muv/V7iw/yQN9nUpMKUUcv55tVoBsIaxbjMsQaAN2oULvxPPCiA0BaDdDY
         Ku0l7YUr2Q9ELE1rZqGspDUW/twTjAsBX/Q4pxVdhwT+udx3ZV0hGySTcPQnmSOkvwgP
         lmmjeTYbMR3JkNYW3sOkt65SJbj8ie1BtmylfDCph+6j4tc3pdEpVvxWxY9pEeqTpzqS
         FHEJ/jk5bMxISDakFQ+oP6jGgwu7NfElEsATXnU3h+6D8ElaXTlDl9toUYDRPq0zHuhm
         qUwP9qRrKPIvRHVbOtrKKb2SNqqNcEuFOMfaucwmfhJz72F48Hi1D6FyUbOkVpZzk4jY
         4LnA==
X-Forwarded-Encrypted: i=1; AJvYcCW2dyUvBNrzZl+MI5Kd0GmefIhGfWgJ6LMXH0vLOjZJN3AJrr9TmBs8uKCbPJEkJ7q+1CUsnzpNKzo0+snMILd4Yw0rz4/XZa9RQnJ8Zjgw/idRkQ==
X-Gm-Message-State: AOJu0YyiTdOXIwTofTwulzVuXaD0TN/URXiqkRyuvlG8ML/LHnPqNIAI
	pm2WKMGj0bOwq8XJG5VyjopChttmHPP3/HFE2rJUgABjkc/eYCBVMb7KBuWh0lM+vsXhFkrszSd
	YFOEIxGjS0XWWoZZeHpaGZJFv0sN5+11fLu4QfAgApjTaJbokQF5OZVwFGg/kb3dIkwhBgUo=
X-Received: by 2002:a5d:554a:0:b0:368:6633:c550 with SMTP id ffacd0b85a97d-36b5d09c34bmr4219706f8f.52.1722247382067;
        Mon, 29 Jul 2024 03:03:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEMWezcmDYhCoMXVEJ6RgBqRDpRGDY1zP+ylERJvEEBvjuVCBkWoadLoTpv9/RZAGIqFQ3Ogg==
X-Received: by 2002:a5d:554a:0:b0:368:6633:c550 with SMTP id ffacd0b85a97d-36b5d09c34bmr4219681f8f.52.1722247381612;
        Mon, 29 Jul 2024 03:03:01 -0700 (PDT)
Received: from [172.18.228.53] (ip-185-104-138-47.ptr.icomera.net. [185.104.138.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b3685810csm11810241f8f.71.2024.07.29.03.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 03:03:01 -0700 (PDT)
Message-ID: <148efb2f-ef26-4759-98d3-5f6687c3cf12@redhat.com>
Date: Mon, 29 Jul 2024 12:02:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:dell-laptop: Add knobs to change battery
 charge settings
To: Andres Salomon <dilinger@queued.net>, linux-kernel@vger.kernel.org
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>,
 Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pm@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20240720012220.26d62a54@5400>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240720012220.26d62a54@5400>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 7/20/24 7:22 AM, Andres Salomon wrote:
> 
> The Dell BIOS allows you to set custom charging modes, which is useful
> in particular for extending battery life. This adds support for tweaking
> those various settings from Linux via sysfs knobs. One might, for
> example, have their laptop plugged into power at their desk the vast
> majority of the time and choose fairly aggressive battery-saving
> settings (only charging once the battery drops to 50% and only charging
> up to 80%). When leaving for a trip, they might want to switch those
> settings to charge to 100% and charge any time power is available;
> rebooting into the BIOS to change those settings is a hassle.
> 
> For the Custom charging type mode, we reuse the common
> charge_control_{start,end}_threshold sysfs power_supply entries. The
> BIOS also has a bunch of other charging modes with varying levels of
> usefulness, so this adds a new Dell-specific sysfs entry called
> 'charge_type' that's documented in sysfs-class-power-dell (and looks a
> lot like sysfs-class-power-wilco).
> 
> This work is based on a patch by Perry Yuan <perry_yuan@dell.com> and
> Limonciello Mario <Mario_Limonciello@Dell.com> submitted back in 2020:
> https://lore.kernel.org/all/20200729065424.12851-1-Perry_Yuan@Dell.com/
> Both of their email addresses bounce, so I'm assuming they're no longer
> with the company. I've reworked most of the patch to make it smaller and
> cleaner.
> 
> Signed-off-by: Andres Salomon <dilinger@queued.net>

Thank you for working on this and it is great to see the discussion
to improve the code between you and Pali going on.

One concern which I have is that work is underway for both upower
and GNOME to add support for
/sys/class/power_supply/*/charge_[start|stop]_threshold

to gnome-control-center.

But if I understand things correctly then these limits will only
be honored when the charging-type is set to custom.

So we need to do something to avoid userspace exposing those
controls when the charging-type is not custom.

I think it would be best to not have the charge_[start|stop]_threshold
attributes visible when the charging mode is not custom.

Regards,

Hans



> ---
>  .../ABI/testing/sysfs-class-power-dell        |  31 +++
>  drivers/platform/x86/dell/Kconfig             |   1 +
>  drivers/platform/x86/dell/dell-laptop.c       | 263 ++++++++++++++++++
>  drivers/platform/x86/dell/dell-smbios.h       |  17 ++
>  4 files changed, 312 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-power-dell
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-power-dell b/Documentation/ABI/testing/sysfs-class-power-dell
> new file mode 100644
> index 000000000000..ef72c5f797ce
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-power-dell
> @@ -0,0 +1,31 @@
> +What:		/sys/class/power_supply/<supply_name>/charge_type
> +Date:		July 2024
> +KernelVersion:	6.11
> +Contact:	linux-pm@vger.kernel.org
> +Description:
> +		Select the charging algorithm to use for the (primary)
> +		battery.
> +
> +		Standard:
> +			Fully charge the battery at a moderate rate.
> +		ExpressCharge™:
> +			Quickly charge the battery using fast-charge
> +			technology. This is harder on the battery than
> +			standard charging and may lower its lifespan.
> +		Primarily AC Use:
> +			Users who primarily operate the system while
> +			plugged into an external power source can extend
> +			battery life with this mode.
> +		Adaptive:
> +			Automatically optimize battery charge rate based
> +			on typical usage.
> +		Custom:
> +			Use the charge_control_* properties to determine
> +			when to start and stop charging. Advanced users
> +			can use this to drastically extend battery life.
> +
> +		Access: Read, Write
> +		Valid values:
> +			      "standard", "express", "primarily_ac",
> +			      "adaptive", "custom"
> +
> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
> index 85a78ef91182..02405793163c 100644
> --- a/drivers/platform/x86/dell/Kconfig
> +++ b/drivers/platform/x86/dell/Kconfig
> @@ -49,6 +49,7 @@ config DELL_LAPTOP
>  	default m
>  	depends on DMI
>  	depends on BACKLIGHT_CLASS_DEVICE
> +	depends on ACPI_BATTERY
>  	depends on ACPI_VIDEO || ACPI_VIDEO = n
>  	depends on RFKILL || RFKILL = n
>  	depends on DELL_WMI || DELL_WMI = n
> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
> index 6552dfe491c6..54f47b685a46 100644
> --- a/drivers/platform/x86/dell/dell-laptop.c
> +++ b/drivers/platform/x86/dell/dell-laptop.c
> @@ -22,11 +22,13 @@
>  #include <linux/io.h>
>  #include <linux/rfkill.h>
>  #include <linux/power_supply.h>
> +#include <linux/sysfs.h>
>  #include <linux/acpi.h>
>  #include <linux/mm.h>
>  #include <linux/i8042.h>
>  #include <linux/debugfs.h>
>  #include <linux/seq_file.h>
> +#include <acpi/battery.h>
>  #include <acpi/video.h>
>  #include "dell-rbtn.h"
>  #include "dell-smbios.h"
> @@ -98,6 +100,14 @@ static struct rfkill *wwan_rfkill;
>  static bool force_rfkill;
>  static bool micmute_led_registered;
>  static bool mute_led_registered;
> +static enum battery_charging_mode bat_chg_current = DELL_BAT_MODE_NONE;
> +static const char * const battery_state[DELL_BAT_MODE_MAX] = {
> +	[DELL_BAT_MODE_STANDARD] = "standard",
> +	[DELL_BAT_MODE_EXPRESS] = "express",
> +	[DELL_BAT_MODE_PRIMARILY_AC] = "primarily_ac",
> +	[DELL_BAT_MODE_ADAPTIVE] = "adaptive",
> +	[DELL_BAT_MODE_CUSTOM] = "custom",
> +};
>  
>  module_param(force_rfkill, bool, 0444);
>  MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
> @@ -2183,6 +2193,256 @@ static struct led_classdev mute_led_cdev = {
>  	.default_trigger = "audio-mute",
>  };
>  
> +static int dell_battery_read_req(const int type, int *val)
> +{
> +	struct calling_interface_buffer buffer;
> +	struct calling_interface_token *token;
> +	int err;
> +
> +	token = dell_smbios_find_token(type);
> +	if (!token)
> +		return -ENODEV;
> +
> +	dell_fill_request(&buffer, token->location, 0, 0, 0);
> +	err = dell_send_request(&buffer, CLASS_TOKEN_READ, SELECT_TOKEN_STD);
> +	if (!err)
> +		*val = buffer.output[1];
> +
> +	return err;
> +}
> +
> +static int dell_battery_write_req(const int type, int val)
> +{
> +	struct calling_interface_buffer buffer;
> +	struct calling_interface_token *token;
> +
> +	token = dell_smbios_find_token(type);
> +	if (!token)
> +		return -ENODEV;
> +
> +	dell_fill_request(&buffer, token->location, val, 0, 0);
> +	return dell_send_request(&buffer,
> +			CLASS_TOKEN_WRITE, SELECT_TOKEN_STD);
> +}
> +
> +/* The rules: the minimum start charging value is 50%. The maximum
> + * start charging value is 95%. The minimum end charging value is
> + * 55%. The maximum end charging value is 100%. And finally, there
> + * has to be at least a 5% difference between start & end values.
> + */
> +#define CHARGE_START_MIN	50
> +#define CHARGE_START_MAX	95
> +#define CHARGE_END_MIN		55
> +#define CHARGE_END_MAX		100
> +#define CHARGE_MIN_DIFF		5
> +
> +static int dell_battery_custom_set(const int type, int val)
> +{
> +	if (type == BAT_CUSTOM_CHARGE_START) {
> +		int end = CHARGE_END_MAX;
> +
> +		if (val < CHARGE_START_MIN)
> +			val = CHARGE_START_MIN;
> +		else if (val > CHARGE_START_MAX)
> +			val = CHARGE_START_MAX;
> +
> +		dell_battery_read_req(BAT_CUSTOM_CHARGE_END, &end);
> +		if ((end - val) < CHARGE_MIN_DIFF)
> +			val = end - CHARGE_MIN_DIFF;
> +	} else if (type == BAT_CUSTOM_CHARGE_END) {
> +		int start = CHARGE_START_MIN;
> +
> +		if (val < CHARGE_END_MIN)
> +			val = CHARGE_END_MIN;
> +		else if (val > CHARGE_END_MAX)
> +			val = CHARGE_END_MAX;
> +
> +		dell_battery_read_req(BAT_CUSTOM_CHARGE_START, &start);
> +		if ((val - start) < CHARGE_MIN_DIFF)
> +			val = start + CHARGE_MIN_DIFF;
> +	}
> +
> +	return dell_battery_write_req(type, val);
> +}
> +
> +static int battery_charging_mode_set(enum battery_charging_mode mode)
> +{
> +	int err;
> +
> +	switch (mode) {
> +	case DELL_BAT_MODE_STANDARD:
> +		err = dell_battery_write_req(BAT_STANDARD_MODE_TOKEN, mode);
> +		break;
> +	case DELL_BAT_MODE_EXPRESS:
> +		err = dell_battery_write_req(BAT_EXPRESS_MODE_TOKEN, mode);
> +		break;
> +	case DELL_BAT_MODE_PRIMARILY_AC:
> +		err = dell_battery_write_req(BAT_PRI_AC_MODE_TOKEN, mode);
> +		break;
> +	case DELL_BAT_MODE_ADAPTIVE:
> +		err = dell_battery_write_req(BAT_ADAPTIVE_MODE_TOKEN, mode);
> +		break;
> +	case DELL_BAT_MODE_CUSTOM:
> +		err = dell_battery_write_req(BAT_CUSTOM_MODE_TOKEN, mode);
> +		break;
> +	default:
> +		err = -EINVAL;
> +	}
> +
> +	return err;
> +}
> +
> +static ssize_t charge_type_show(struct device *dev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
> +	enum battery_charging_mode mode;
> +	ssize_t count = 0;
> +
> +	for (mode = DELL_BAT_MODE_STANDARD; mode < DELL_BAT_MODE_MAX; mode++) {
> +		if (battery_state[mode]) {
> +			count += sysfs_emit_at(buf, count,
> +				mode == bat_chg_current ? "[%s] " : "%s ",
> +				battery_state[mode]);
> +		}
> +	}
> +
> +	/* convert the last space to a newline */
> +	count--;
> +	count += sysfs_emit_at(buf, count, "\n");
> +
> +	return count;
> +}
> +
> +static ssize_t charge_type_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buf, size_t size)
> +{
> +	enum battery_charging_mode mode;
> +	const char *label;
> +	int ret = -EINVAL;
> +
> +	for (mode = DELL_BAT_MODE_STANDARD; mode < DELL_BAT_MODE_MAX; mode++) {
> +		label = battery_state[mode];
> +		if (label && sysfs_streq(label, buf))
> +			break;
> +	}
> +
> +	if (mode > DELL_BAT_MODE_NONE && mode < DELL_BAT_MODE_MAX) {
> +		ret = battery_charging_mode_set(mode);
> +		if (!ret) {
> +			bat_chg_current = mode;
> +			ret = size;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static ssize_t charge_control_start_threshold_show(struct device *dev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
> +	int ret, start;
> +
> +	ret = dell_battery_read_req(BAT_CUSTOM_CHARGE_START, &start);
> +	if (!ret)
> +		ret = sysfs_emit(buf, "%d\n", start);
> +
> +	return ret;
> +}
> +
> +static ssize_t charge_control_start_threshold_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buf, size_t size)
> +{
> +	int ret, start;
> +
> +	ret = kstrtoint(buf, 10, &start);
> +	if (!ret)
> +		ret = dell_battery_custom_set(BAT_CUSTOM_CHARGE_START, start);
> +	if (!ret)
> +		ret = size;
> +
> +	return ret;
> +}
> +
> +static ssize_t charge_control_end_threshold_show(struct device *dev,
> +		struct device_attribute *attr,
> +		char *buf)
> +{
> +	int ret, end;
> +
> +	ret = dell_battery_read_req(BAT_CUSTOM_CHARGE_END, &end);
> +	if (!ret)
> +		ret = sysfs_emit(buf, "%d\n", end);
> +
> +	return ret;
> +}
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev,
> +		struct device_attribute *attr,
> +		const char *buf, size_t size)
> +{
> +	int ret, end;
> +
> +	ret = kstrtouint(buf, 10, &end);
> +	if (!ret)
> +		ret = dell_battery_custom_set(BAT_CUSTOM_CHARGE_END, end);
> +	if (!ret)
> +		ret = size;
> +
> +	return ret;
> +}
> +
> +static DEVICE_ATTR_RW(charge_control_start_threshold);
> +static DEVICE_ATTR_RW(charge_control_end_threshold);
> +static DEVICE_ATTR_RW(charge_type);
> +
> +static struct attribute *dell_battery_attrs[] = {
> +	&dev_attr_charge_control_start_threshold.attr,
> +	&dev_attr_charge_control_end_threshold.attr,
> +	&dev_attr_charge_type.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(dell_battery);
> +
> +static int dell_battery_add(struct power_supply *battery,
> +		struct acpi_battery_hook *hook)
> +{
> +	return device_add_groups(&battery->dev, dell_battery_groups);
> +}
> +
> +static int dell_battery_remove(struct power_supply *battery,
> +		struct acpi_battery_hook *hook)
> +{
> +	device_remove_groups(&battery->dev, dell_battery_groups);
> +	return 0;
> +}
> +
> +static struct acpi_battery_hook dell_battery_hook = {
> +	.add_battery = dell_battery_add,
> +	.remove_battery = dell_battery_remove,
> +	.name = "Dell Primary Battery Extension",
> +};
> +
> +static void __init dell_battery_init(struct device *dev)
> +{
> +	enum battery_charging_mode current_mode = DELL_BAT_MODE_NONE;
> +
> +	dell_battery_read_req(BAT_CUSTOM_MODE_TOKEN, (int *) &current_mode);
> +	if (current_mode != DELL_BAT_MODE_NONE) {
> +		bat_chg_current = current_mode;
> +		battery_hook_register(&dell_battery_hook);
> +	}
> +}
> +
> +static void __exit dell_battery_exit(void)
> +{
> +	if (bat_chg_current != DELL_BAT_MODE_NONE)
> +		battery_hook_unregister(&dell_battery_hook);
> +}
> +
>  static int __init dell_init(void)
>  {
>  	struct calling_interface_token *token;
> @@ -2219,6 +2479,7 @@ static int __init dell_init(void)
>  		touchpad_led_init(&platform_device->dev);
>  
>  	kbd_led_init(&platform_device->dev);
> +	dell_battery_init(&platform_device->dev);
>  
>  	dell_laptop_dir = debugfs_create_dir("dell_laptop", NULL);
>  	debugfs_create_file("rfkill", 0444, dell_laptop_dir, NULL,
> @@ -2293,6 +2554,7 @@ static int __init dell_init(void)
>  	if (mute_led_registered)
>  		led_classdev_unregister(&mute_led_cdev);
>  fail_led:
> +	dell_battery_exit();
>  	dell_cleanup_rfkill();
>  fail_rfkill:
>  	platform_device_del(platform_device);
> @@ -2311,6 +2573,7 @@ static void __exit dell_exit(void)
>  	if (quirks && quirks->touchpad_led)
>  		touchpad_led_exit();
>  	kbd_led_exit();
> +	dell_battery_exit();
>  	backlight_device_unregister(dell_backlight_device);
>  	if (micmute_led_registered)
>  		led_classdev_unregister(&micmute_led_cdev);
> diff --git a/drivers/platform/x86/dell/dell-smbios.h b/drivers/platform/x86/dell/dell-smbios.h
> index ea0cc38642a2..f7c07b4d72e3 100644
> --- a/drivers/platform/x86/dell/dell-smbios.h
> +++ b/drivers/platform/x86/dell/dell-smbios.h
> @@ -33,11 +33,28 @@
>  #define KBD_LED_AUTO_50_TOKEN	0x02EB
>  #define KBD_LED_AUTO_75_TOKEN	0x02EC
>  #define KBD_LED_AUTO_100_TOKEN	0x02F6
> +#define BAT_PRI_AC_MODE_TOKEN	0x0341
> +#define BAT_ADAPTIVE_MODE_TOKEN	0x0342
> +#define BAT_CUSTOM_MODE_TOKEN	0x0343
> +#define BAT_STANDARD_MODE_TOKEN	0x0346
> +#define BAT_EXPRESS_MODE_TOKEN	0x0347
> +#define BAT_CUSTOM_CHARGE_START	0x0349
> +#define BAT_CUSTOM_CHARGE_END	0x034A
>  #define GLOBAL_MIC_MUTE_ENABLE	0x0364
>  #define GLOBAL_MIC_MUTE_DISABLE	0x0365
>  #define GLOBAL_MUTE_ENABLE	0x058C
>  #define GLOBAL_MUTE_DISABLE	0x058D
>  
> +enum battery_charging_mode {
> +	DELL_BAT_MODE_NONE = 0,
> +	DELL_BAT_MODE_STANDARD,
> +	DELL_BAT_MODE_EXPRESS,
> +	DELL_BAT_MODE_PRIMARILY_AC,
> +	DELL_BAT_MODE_ADAPTIVE,
> +	DELL_BAT_MODE_CUSTOM,
> +	DELL_BAT_MODE_MAX,
> +};
> +
>  struct notifier_block;
>  
>  struct calling_interface_token {


