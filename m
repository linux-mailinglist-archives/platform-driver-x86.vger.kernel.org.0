Return-Path: <platform-driver-x86+bounces-2953-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB58AC5A2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Apr 2024 09:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2C5E1F22699
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Apr 2024 07:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B894C630;
	Mon, 22 Apr 2024 07:35:10 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CF1482CA
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 07:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713771310; cv=none; b=IidIwBzZjNRDrPbXxKi2P7T9T6Ew+2mNxcT/54NcqoPfWlfPtC8jSot49x/vdyMskfQl34sMIFnzxj0oqZESMCAoR7pr5eI4cgSm8LVnPE41ak3yYqiXFvH5lBSTxi7nk4qlCMkYSjZHgHD2L0a5h8F04fd0KExMkiGCX8iOv84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713771310; c=relaxed/simple;
	bh=PgbWEJHun8Ts3a0s4MSrzmK3KsjjTkmdPjaOC8mw7eU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IST9HVAOALAgLD8ddwLyVrovtjpv9PXc3/RynZUmkMCH6iNOdD6nwPjL9syEgWMPR28ZXD/pUs+isR4PnHlOSp05pt7qU7eEwk4Jb82npxdbSgbYqXIYg8R1SjH7BNJIu90iTPGJscMO99xeNEMt0I+colaJxtoL+b0H4c1nDbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id d3ab1112-007a-11ef-a9de-005056bdf889;
	Mon, 22 Apr 2024 10:35:02 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 22 Apr 2024 10:35:00 +0300
To: Armin Wolf <W_Armin@gmx.de>
Cc: mlj@danelec.com, rafael.j.wysocki@intel.com, lenb@kernel.org,
	jdelvare@suse.com, linux@roeck-us.net, linux@weissschuh.net,
	ilpo.jarvinen@linux.intel.com, linux-acpi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH RESEND v5] ACPI: fan: Add hwmon support
Message-ID: <ZiYTJOmwDVaws3lh@surfacebook.localdomain>
References: <20240422060835.71708-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240422060835.71708-1-W_Armin@gmx.de>

Mon, Apr 22, 2024 at 08:08:35AM +0200, Armin Wolf kirjoitti:
> Currently, the driver does only support a custom sysfs
> interface to allow userspace to read the fan speed.
> Add support for the standard hwmon interface so users
> can read the fan speed with standard tools like "sensors".
> 
> Tested with a custom ACPI SSDT.

...

> +/*
> + * fan_hwmon.c - hwmon interface for the ACPI Fan driver

No file name in the file, it makes an unneeded burden if file is going to be
renamed.

> + *
> + * Copyright (C) 2024 Armin Wolf <W_Armin@gmx.de>
> + */

...

> +#include <linux/acpi.h>
> +#include <linux/hwmon.h>

Please, follow IWYU pronciple, e.g., missing err.h here.

> +#include <linux/limits.h>
> +#include <linux/units.h>

...

> +/* Returned when the ACPI fan does not support speed reporting */
> +#define FAN_SPEED_UNAVAILABLE	0xffffffff
> +#define FAN_POWER_UNAVAILABLE	0xffffffff

Shouldn't these be rather as ~0 of the respective types or _MAX (from limits.h)
or something like that?

...

> +static struct acpi_fan_fps *acpi_fan_get_current_fps(struct acpi_fan *fan, u64 control)
> +{
> +	int i;

unsigned

> +	for (i = 0; i < fan->fps_count; i++) {
> +		if (fan->fps[i].control == control)
> +			return &fan->fps[i];
> +	}
> +
> +	return NULL;
> +}

...

> +static umode_t acpi_fan_is_visible(const void *drvdata, enum hwmon_sensor_types type, u32 attr,
> +				   int channel)
> +{
> +	const struct acpi_fan *fan = drvdata;
> +	int i;

unsigned

> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_target:
> +			/* When in fine grain control mode, not every fan control value
> +			 * has an associated fan performance state.
> +			 */
> +			if (fan->fif.fine_grain_ctrl)
> +				return 0;
> +
> +			return 0444;
> +		default:

> +			break;
> +		}
> +		break;

Instead of two breaks, just return 0 from 'default' case.

> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_input:
> +			/* When in fine grain control mode, not every fan control value
> +			 * has an associated fan performance state.
> +			 */

/*
 * Use correct style for multi-line
 * comment blocks. As in this example.
 */

> +			if (fan->fif.fine_grain_ctrl)
> +				return 0;
> +
> +			/* When all fan performance states contain no valid power data,
> +			 * when the associated attribute should not be created.
> +			 */
> +			for (i = 0; i < fan->fps_count; i++) {
> +				if (fan->fps[i].power != FAN_POWER_UNAVAILABLE)
> +					return 0444;
> +			}
> +
> +			return 0;
> +		default:

> +			break;
> +		}
> +		break;

Ditto.

> +	default:
> +		break;
> +	}
> +
> +	return 0;

Return from the default.

With the above we got rid of 2 LoCs for free.

> +}

...

> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_input:
> +			if (fst.speed == FAN_SPEED_UNAVAILABLE)
> +				return -ENODATA;
> +
> +			if (fst.speed > LONG_MAX)
> +				return -EOVERFLOW;
> +
> +			*val = fst.speed;
> +			return 0;
> +		case hwmon_fan_target:
> +			fps = acpi_fan_get_current_fps(fan, fst.control);
> +			if (!fps)
> +				return -ENODATA;
> +
> +			if (fps->speed > LONG_MAX)
> +				return -EOVERFLOW;
> +
> +			*val = fps->speed;
> +			return 0;
> +		default:

> +			break;
> +		}
> +		break;

As per above.

> +	case hwmon_power:
> +		switch (attr) {
> +		case hwmon_power_input:
> +			fps = acpi_fan_get_current_fps(fan, fst.control);
> +			if (!fps)
> +				return -ENODATA;
> +
> +			if (fps->power == FAN_POWER_UNAVAILABLE)
> +				return -ENODATA;
> +
> +			if (fps->power > LONG_MAX / MICROWATT_PER_MILLIWATT)
> +				return -EOVERFLOW;
> +
> +			*val = fps->power * MICROWATT_PER_MILLIWATT;
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;

Ditto.

> +	default:
> +		break;
> +	}
> +
> +	return -EOPNOTSUPP;

Ditto.

Again, 2 LoCs less here.

> +}

...

> +int devm_acpi_fan_create_hwmon(struct acpi_device *device)
> +{
> +	struct acpi_fan *fan = acpi_driver_data(device);
> +	struct device *hdev;
> +
> +	hdev = devm_hwmon_device_register_with_info(&device->dev, "acpi_fan", fan,
> +						    &acpi_fan_chip_info, NULL);

> +

Redundant blank line.

> +	return PTR_ERR_OR_ZERO(hdev);
> +}

-- 
With Best Regards,
Andy Shevchenko



