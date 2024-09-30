Return-Path: <platform-driver-x86+bounces-5653-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BA898A834
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Sep 2024 17:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 230EA1F240DA
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Sep 2024 15:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5764191F9B;
	Mon, 30 Sep 2024 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVlDL3bO"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98325191F77;
	Mon, 30 Sep 2024 15:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727709062; cv=none; b=dTYYT9hBWXvXlXpMVdbfoQuZJRGxbjwY60OiSHfT4DKnzJ6j49aq2eQlrw54U/wsCmzK/Qc5ST3MU+KOqehQ68fr24o4YmVEgdQSAIrOu7rshgX0pn4JpKuq/EmdagTBEbnlnE0TMEHFKkXCwRFG+E+dD887uRqz37/iabU3zrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727709062; c=relaxed/simple;
	bh=7nlyKqMAHcJjQJIWbB87DGxZ3oxGvtYRLNBt9TH6h4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgtP63MtrQoh+XV9E78twVPPohhI6RMOL0Acmkm82Prn219yu2bF5+Qn4IfasNlV+/YwIWLirplqNBfAFhp3sGIHLdH5FNBzyU6XfQ6B7437Suy/TxbeFAgXFU0ZKxJXgEc6MRY2y1BKPXa8luGFVyih44LIpEToNeKEwe+Sly4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVlDL3bO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A4F6C4CEC7;
	Mon, 30 Sep 2024 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727709062;
	bh=7nlyKqMAHcJjQJIWbB87DGxZ3oxGvtYRLNBt9TH6h4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JVlDL3bOyRLXTUAjHSQ8Zay9NQ7KpAgNcAA/Wa+EHyV/7SaHXxy9NHkHbj5It2gEf
	 OFRG4fP3bkGWzRJH6Byf1Ls191Javy390v0AIpjPrvMrmd0VGNwMzowUxwqnZrUIm/
	 b4qDDWu/My/47DPW2JMX9dbqVWbRcfSb8TPf3+Z5osHtI4nXvMeMuoIERyNVrq6OFo
	 whk50bFLyjt7428Q7S9FLnQo3ZU7UZvVa2sFoQPnkgtH2Dcn+ME/UgqCU0ZvRi/0Rl
	 MviFfTslszLzfgLPElur7sbErfqRXi1i3IdCpMGdRxjhPx3WJfBh+BdjUzp3nGo3wI
	 NqloJFgDmzsyQ==
Message-ID: <ce953667-13f2-40ba-8e8e-10334f9ed9ad@kernel.org>
Date: Mon, 30 Sep 2024 10:11:00 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/9] platform/x86: asus-armoury: move existing tunings
 to asus-armoury module
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240930000046.51388-1-luke@ljones.dev>
 <20240930000046.51388-4-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240930000046.51388-4-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/29/2024 19:00, Luke D. Jones wrote:
> The fw_attributes_class provides a much cleaner interface to all of the
> attributes introduced to asus-wmi. This patch moves all of these extra
> attributes over to fw_attributes_class, and shifts the bulk of these
> definitions to a new kernel module to reduce the clutter of asus-wmi
> with the intention of deprecating the asus-wmi attributes in future.
> 
> The work applies only to WMI methods which don't have a clearly defined
> place within the sysfs and as a result ended up lumped together in
> /sys/devices/platform/asus-nb-wmi/ with no standard API.
> 
> Where possible the fw attrs now implement defaults, min, max, scalar,
> choices, etc. As en example dgpu_disable becomes:
> 
> /sys/class/firmware-attributes/asus-armoury/attributes/dgpu_disable/
> ├── current_value
> ├── display_name
> ├── possible_values
> └── type
> 
> as do other attributes.
> 
> The ppt_* based attributes are removed in this initial patch as the
> implementation is somewhat broken due to the WMI methods requiring a
> set of limits on the values accepted (which is not provided by WMI).
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/Kconfig               |  12 +
>   drivers/platform/x86/Makefile              |   1 +
>   drivers/platform/x86/asus-armoury.c        | 593 +++++++++++++++++++++
>   drivers/platform/x86/asus-armoury.h        | 146 +++++
>   drivers/platform/x86/asus-wmi.c            |   4 -
>   include/linux/platform_data/x86/asus-wmi.h |   3 +
>   6 files changed, 755 insertions(+), 4 deletions(-)
>   create mode 100644 drivers/platform/x86/asus-armoury.c
>   create mode 100644 drivers/platform/x86/asus-armoury.h
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 3875abba5a79..80ec8b45022d 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -265,6 +265,18 @@ config ASUS_WIRELESS
>   	  If you choose to compile this driver as a module the module will be
>   	  called asus-wireless.
>   
> +config ASUS_ARMOURY
> +	tristate "ASUS Armoury driver"
> +	depends on ASUS_WMI
> +	select FW_ATTR_CLASS
> +	help
> +	  Say Y here if you have a WMI aware Asus machine and would like to use the
> +	  firmware_attributes API to control various settings typically exposed in
> +	  the ASUS Armoury Crate application available on Windows.
> +
> +	  To compile this driver as a module, choose M here: the module will
> +	  be called asus-armoury.
> +
>   config ASUS_WMI
>   	tristate "ASUS WMI Driver"
>   	depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b142947067..fe3e7e7dede8 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
>   # ASUS
>   obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
>   obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
> +obj-$(CONFIG_ASUS_ARMOURY)	+= asus-armoury.o
>   obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
>   obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
>   obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> new file mode 100644
> index 000000000000..0085f1b112ab
> --- /dev/null
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -0,0 +1,593 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Asus Armoury (WMI) attributes driver. This driver uses the fw_attributes
> + * class to expose the various WMI functions that many gaming and some
> + * non-gaming ASUS laptops have available.
> + * These typically don't fit anywhere else in the sysfs such as under LED class,
> + * hwmon or other, and are set in Windows using the ASUS Armoury Crate tool.
> + *
> + * Copyright(C) 2010 Intel Corporation.
> + * Copyright(C) 2024-2024 Luke Jones <luke@ljones.dev>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/errno.h>
> +#include <linux/fs.h>
> +#include <linux/kernel.h>
> +#include <linux/kmod.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/platform_data/x86/asus-wmi.h>
> +#include <linux/types.h>
> +#include <linux/acpi.h>
> +
> +#include "asus-armoury.h"
> +#include "firmware_attributes_class.h"
> +
> +#define ASUS_NB_WMI_EVENT_GUID "0B3CBB35-E3C2-45ED-91C2-4C5A6D195D1C"
> +
> +#define ASUS_MINI_LED_MODE_MASK 0x03
> +/* Standard modes for devices with only on/off */
> +#define ASUS_MINI_LED_OFF 0x00
> +#define ASUS_MINI_LED_ON 0x01
> +/* Like "on" but the effect is more vibrant or brighter */
> +#define ASUS_MINI_LED_STRONG_MODE 0x02
> +/* New modes for devices with 3 mini-led mode types */
> +#define ASUS_MINI_LED_2024_WEAK 0x00
> +#define ASUS_MINI_LED_2024_STRONG 0x01
> +#define ASUS_MINI_LED_2024_OFF 0x02
> +
> +/* Default limits for tunables available on ASUS ROG laptops */
> +#define NVIDIA_BOOST_MIN 5
> +#define NVIDIA_BOOST_MAX 25
> +#define NVIDIA_TEMP_MIN 75
> +#define NVIDIA_TEMP_MAX 87
> +#define PPT_CPU_LIMIT_MIN 5
> +#define PPT_CPU_LIMIT_MAX 150
> +#define PPT_CPU_LIMIT_DEFAULT 80
> +#define PPT_PLATFORM_MIN 5
> +#define PPT_PLATFORM_MAX 100
> +#define PPT_PLATFORM_DEFAULT 80
> +
> +static const struct class *fw_attr_class;
> +
> +struct asus_armoury_priv {
> +	struct device *fw_attr_dev;
> +	struct kset *fw_attr_kset;
> +
> +	u32 mini_led_dev_id;
> +	u32 gpu_mux_dev_id;
> +
> +	struct mutex mutex;
> +};
> +
> +static struct asus_armoury_priv asus_armoury = { .mutex = __MUTEX_INITIALIZER(
> +							 asus_armoury.mutex) };
> +
> +struct fw_attrs_group {
> +	bool pending_reboot;
> +};
> +
> +static struct fw_attrs_group fw_attrs = {
> +	.pending_reboot = false,
> +};
> +
> +struct asus_attr_group {
> +	const struct attribute_group *attr_group;
> +	u32 wmi_devid;
> +};
> +
> +static bool asus_wmi_is_present(u32 dev_id)
> +{
> +	u32 retval;
> +	int status;
> +
> +	status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, &retval);
> +	pr_debug("%s called (0x%08x), retval: 0x%08x\n", __func__, dev_id, retval);
> +
> +	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
> +}
> +
> +static void asus_set_reboot_and_signal_event(void)
> +{
> +	fw_attrs.pending_reboot = true;
> +	kobject_uevent(&asus_armoury.fw_attr_dev->kobj, KOBJ_CHANGE);
> +}
> +
> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", fw_attrs.pending_reboot);
> +}
> +
> +static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> +
> +static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> +{
> +	return !strcmp(attr->attr.name, "gpu_mux_mode");
> +}
> +
> +/**
> + * attr_int_store() - Generic store function for use with most WMI functions.
> + * @kobj: Pointer to the driver object.
> + * @kobj_attribute: Pointer to the attribute calling this function.
> + * @buf: The buffer to read from, this is parsed to `int` type.
> + * @count: Required by sysfs attribute macros, pass in from the callee attr.
> + * @min: Minimum accepted value. Below this returns -EINVAL.
> + * @max: Maximum accepted value. Above this returns -EINVAL.
> + * @store_value: Pointer to where the parsed value should be stored.
> + * @wmi_dev: The WMI function ID to use.
> + *
> + * The WMI functions available on most ASUS laptops return a 1 as "success", and
> + * a 0 as failed. However some functions can return n > 1 for additional errors.
> + * The function currently treats all values which are not 1 as errors, ignoring
> + * the possible differences in WMI error returns.
> + *
> + * Returns: Either count, or an error.
> + */
> +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribute *attr, const char *buf,
> +			      size_t count, u32 min, u32 max, u32 *store_value, u32 wmi_dev)
> +{
> +	u32 result, value;
> +	int err;
> +
> +	err = kstrtouint(buf, 10, &value);
> +	if (err)
> +		return err;
> +
> +	if (value < min || value > max)
> +		return -EINVAL;
> +
> +	mutex_lock(&asus_armoury.mutex);
> +	err = asus_wmi_set_devstate(wmi_dev, value, &result);
> +	mutex_unlock(&asus_armoury.mutex);
> +	if (err) {
> +		pr_err("Failed to set %s: %d\n", attr->attr.name, err);
> +		return err;
> +	}
> +
> +	if (result != 1) {
> +		pr_err("Failed to set %s (result): 0x%x\n", attr->attr.name, result);
> +		return -EIO;
> +	}
> +
> +	if (store_value != NULL)
> +		*store_value = value;
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	if (asus_bios_requires_reboot(attr))
> +		asus_set_reboot_and_signal_event();
> +
> +	return count;
> +}
> +
> +/* Mini-LED mode **************************************************************/
> +static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
> +						struct kobj_attribute *attr, char *buf)
> +{
> +	u32 value;
> +	int err;
> +
> +	err = asus_wmi_get_devstate_dsts(asus_armoury.mini_led_dev_id, &value);
> +	if (err)
> +		return err;
> +
> +	value &= ASUS_MINI_LED_MODE_MASK;
> +
> +	/*
> +	 * Remap the mode values to match previous generation mini-LED. The last gen
> +	 * WMI 0 == off, while on this version WMI 2 == off (flipped).
> +	 */
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
> +		switch (value) {
> +		case ASUS_MINI_LED_2024_WEAK:
> +			value = ASUS_MINI_LED_ON;
> +			break;
> +		case ASUS_MINI_LED_2024_STRONG:
> +			value = ASUS_MINI_LED_STRONG_MODE;
> +			break;
> +		case ASUS_MINI_LED_2024_OFF:
> +			value = ASUS_MINI_LED_OFF;
> +			break;
> +		}
> +	}
> +
> +	return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static ssize_t mini_led_mode_current_value_store(struct kobject *kobj,
> +						 struct kobj_attribute *attr, const char *buf,
> +						 size_t count)
> +{
> +	int result, err;
> +	u32 mode;
> +
> +	err = kstrtou32(buf, 10, &mode);
> +	if (err)
> +		return err;
> +
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE &&
> +	    mode > ASUS_MINI_LED_ON)
> +		return -EINVAL;
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2 &&
> +	    mode > ASUS_MINI_LED_STRONG_MODE)
> +		return -EINVAL;
> +
> +	/*
> +	 * Remap the mode values so expected behaviour is the same as the last
> +	 * generation of mini-LED with 0 == off, 1 == on.
> +	 */
> +	if (asus_armoury.mini_led_dev_id == ASUS_WMI_DEVID_MINI_LED_MODE2) {
> +		switch (mode) {
> +		case ASUS_MINI_LED_OFF:
> +			mode = ASUS_MINI_LED_2024_OFF;
> +			break;
> +		case ASUS_MINI_LED_ON:
> +			mode = ASUS_MINI_LED_2024_WEAK;
> +			break;
> +		case ASUS_MINI_LED_STRONG_MODE:
> +			mode = ASUS_MINI_LED_2024_STRONG;
> +			break;
> +		}
> +	}
> +
> +	mutex_lock(&asus_armoury.mutex);
> +	err = asus_wmi_set_devstate(asus_armoury.mini_led_dev_id, mode, &result);
> +	mutex_unlock(&asus_armoury.mutex);
> +	if (err) {
> +		pr_warn("Failed to set mini-LED: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result != 1) {
> +		pr_warn("Failed to set mini-LED mode (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	return count;
> +}
> +
> +static ssize_t mini_led_mode_possible_values_show(struct kobject *kobj,
> +						  struct kobj_attribute *attr, char *buf)
> +{
> +	switch (asus_armoury.mini_led_dev_id) {
> +	case ASUS_WMI_DEVID_MINI_LED_MODE:
> +		return sysfs_emit(buf, "0;1\n");
> +	case ASUS_WMI_DEVID_MINI_LED_MODE2:
> +		return sysfs_emit(buf, "0;1;2\n");
> +	}
> +
> +	return sysfs_emit(buf, "0\n");
> +}
> +
> +ATTR_GROUP_ENUM_CUSTOM(mini_led_mode, "mini_led_mode", "Set the mini-LED backlight mode");
> +
> +static ssize_t gpu_mux_mode_current_value_store(struct kobject *kobj,
> +						struct kobj_attribute *attr, const char *buf,
> +						size_t count)
> +{
> +	int result, err;
> +	u32 optimus;
> +
> +	err = kstrtou32(buf, 10, &optimus);
> +	if (err)
> +		return err;
> +
> +	if (optimus > 1)
> +		return -EINVAL;
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
> +		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_DGPU, &result);
> +		if (err)
> +			return err;
> +		if (result && !optimus) {
> +			err = -ENODEV;
> +			pr_warn("Can not switch MUX to dGPU mode when dGPU is disabled: %02X %02X %d\n",
> +				result, optimus, err);
> +			return err;
> +		}
> +	}
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
> +		err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU, &result);
> +		if (err)
> +			return err;
> +		if (result && !optimus) {
> +			err = -ENODEV;
> +			pr_warn("Can not switch MUX to dGPU mode when eGPU is enabled: %d\n",
> +				err);
> +			return err;
> +		}
> +	}
> +
> +	mutex_lock(&asus_armoury.mutex);
> +	err = asus_wmi_set_devstate(asus_armoury.gpu_mux_dev_id, optimus, &result);
> +	mutex_unlock(&asus_armoury.mutex);
> +	if (err) {
> +		pr_err("Failed to set GPU MUX mode: %d\n", err);
> +		return err;
> +	}
> +	/* !1 is considered a fail by ASUS */
> +	if (result != 1) {
> +		pr_warn("Failed to set GPU MUX mode (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +	asus_set_reboot_and_signal_event();
> +
> +	return count;
> +}
> +WMI_SHOW_INT(gpu_mux_mode_current_value, "%d\n", asus_armoury.gpu_mux_dev_id);
> +ATTR_GROUP_BOOL_CUSTOM(gpu_mux_mode, "gpu_mux_mode", "Set the GPU display MUX mode");
> +
> +/*
> + * A user may be required to store the value twice, typical store first, then
> + * rescan PCI bus to activate power, then store a second time to save correctly.
> + * The reason for this is that an extra code path in the ACPI is enabled when
> + * the device and bus are powered.
> + */
> +static ssize_t dgpu_disable_current_value_store(struct kobject *kobj,
> +						struct kobj_attribute *attr, const char *buf,
> +						size_t count)
> +{
> +	int result, err;
> +	u32 disable;
> +
> +	err = kstrtou32(buf, 10, &disable);
> +	if (err)
> +		return err;
> +
> +	if (disable > 1)
> +		return -EINVAL;
> +
> +	if (asus_armoury.gpu_mux_dev_id) {
> +		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
> +		if (err)
> +			return err;
> +		if (!result && disable) {
> +			err = -ENODEV;
> +			pr_warn("Can not disable dGPU when the MUX is in dGPU mode: %d\n", err);
> +			return err;
> +		}
> +	}
> +
> +	mutex_lock(&asus_armoury.mutex);
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_DGPU, disable, &result);
> +	mutex_unlock(&asus_armoury.mutex);
> +	if (err) {
> +		pr_warn("Failed to set dGPU disable: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result != 1) {
> +		pr_warn("Failed to set dGPU disable (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	return count;
> +}
> +WMI_SHOW_INT(dgpu_disable_current_value, "%d\n", ASUS_WMI_DEVID_DGPU);
> +ATTR_GROUP_BOOL_CUSTOM(dgpu_disable, "dgpu_disable", "Disable the dGPU");
> +
> +/* The ACPI call to enable the eGPU also disables the internal dGPU */
> +static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
> +					       const char *buf, size_t count)
> +{
> +	int result, err;
> +	u32 enable;
> +
> +	err = kstrtou32(buf, 10, &enable);
> +	if (err)
> +		return err;
> +
> +	if (enable > 1)
> +		return -EINVAL;
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_EGPU_CONNECTED, &result);
> +	if (err) {
> +		pr_warn("Failed to get eGPU connection status: %d\n", err);
> +		return err;
> +	}
> +
> +	if (asus_armoury.gpu_mux_dev_id) {
> +		err = asus_wmi_get_devstate_dsts(asus_armoury.gpu_mux_dev_id, &result);
> +		if (err) {
> +			pr_warn("Failed to get GPU MUX status: %d\n", result);
> +			return result;
> +		}
> +		if (!result && enable) {
> +			err = -ENODEV;
> +			pr_warn("Can not enable eGPU when the MUX is in dGPU mode: %d\n", err);
> +			return err;
> +		}
> +	}
> +
> +	mutex_lock(&asus_armoury.mutex);
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
> +	mutex_unlock(&asus_armoury.mutex);
> +	if (err) {
> +		pr_warn("Failed to set eGPU state: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result != 1) {
> +		pr_warn("Failed to set eGPU state (retval): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +
> +	return count;
> +}
> +WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
> +ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
> +
> +/* Simple attribute creation */
> +ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
> +		       "Show the current mode of charging");
> +
> +ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SOUND,
> +		   "Set the boot POST sound");
> +ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
> +		   "Set MCU powersaving mode");
> +ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
> +		   "Set the panel refresh overdrive");
> +ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
> +		   "Show the eGPU connection status");
> +
> +/* If an attribute does not require any special case handling add it here */
> +static const struct asus_attr_group armoury_attr_groups[] = {
> +	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
> +	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
> +	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
> +
> +	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
> +	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
> +	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
> +	{ &panel_od_attr_group, ASUS_WMI_DEVID_PANEL_OD },
> +};
> +
> +static int asus_fw_attr_add(void)
> +{
> +	int err, i;
> +
> +	err = fw_attributes_class_get(&fw_attr_class);
> +	if (err)
> +		return err;
> +
> +	asus_armoury.fw_attr_dev =
> +		device_create(fw_attr_class, NULL, MKDEV(0, 0), NULL, "%s", DRIVER_NAME);
> +
> +	if (IS_ERR(asus_armoury.fw_attr_dev)) {
> +		err = PTR_ERR(asus_armoury.fw_attr_dev);
> +		goto fail_class_get;
> +	}
> +
> +	asus_armoury.fw_attr_kset =
> +		kset_create_and_add("attributes", NULL, &asus_armoury.fw_attr_dev->kobj);
> +	if (!asus_armoury.fw_attr_kset) {
> +		err = -ENOMEM;
> +		goto err_destroy_classdev;
> +	}
> +
> +	err = sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
> +	if (err) {
> +		pr_err("Failed to create sysfs level attributes\n");
> +		goto err_destroy_kset;
> +	}
> +
> +	asus_armoury.mini_led_dev_id = 0;
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
> +		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
> +		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +	}
> +	if (err) {
> +		pr_err("Failed to create sysfs-group for mini_led\n");
> +		goto err_remove_file;
> +	}
> +
> +	asus_armoury.gpu_mux_dev_id = 0;
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX)) {
> +		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX;
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO)) {
> +		asus_armoury.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX_VIVO;
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +	}
> +	if (err) {
> +		pr_err("Failed to create sysfs-group for gpu_mux\n");
> +		goto err_remove_mini_led_group;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
> +		if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
> +			continue;
> +
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +					 armoury_attr_groups[i].attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for %s\n",
> +			       armoury_attr_groups[i].attr_group->name);
> +			goto err_remove_groups;
> +		} else {
> +			pr_debug("Created sysfs-group for %s\n",
> +				 armoury_attr_groups[i].attr_group->name);
> +		}
> +	}
> +
> +	return 0;
> +
> +err_remove_groups:
> +	while (--i >= 0) {
> +		if (asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
> +			sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, armoury_attr_groups[i].attr_group);
> +	}
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +err_remove_mini_led_group:
> +	sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +err_remove_file:
> +	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
> +err_destroy_kset:
> +	kset_unregister(asus_armoury.fw_attr_kset);
> +err_destroy_classdev:
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +fail_class_get:
> +	fw_attributes_class_put();
> +	return err;
> +}
> +
> +/* Init / exit ****************************************************************/
> +
> +static int __init asus_fw_init(void)
> +{
> +	char *wmi_uid;
> +	int err;
> +
> +	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
> +	if (!wmi_uid)
> +		return -ENODEV;
> +
> +	/*
> +	 * if equal to "ASUSWMI" then it's DCTS that can't be used for this
> +	 * driver, DSTS is required.
> +	 */
> +	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
> +		return -ENODEV;
> +
> +	err = asus_fw_attr_add();
> +	if (err)
> +		return err;
> +
> +	return 0;
> +}
> +
> +static void __exit asus_fw_exit(void)
> +{
> +	mutex_lock(&asus_armoury.mutex);
> +
> +	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
> +	kset_unregister(asus_armoury.fw_attr_kset);
> +	device_destroy(fw_attr_class, MKDEV(0, 0));
> +	fw_attributes_class_put();
> +
> +	mutex_unlock(&asus_armoury.mutex);
> +}
> +
> +module_init(asus_fw_init);
> +module_exit(asus_fw_exit);
> +
> +MODULE_IMPORT_NS(ASUS_WMI);
> +MODULE_AUTHOR("Luke Jones <luke@ljones.dev>");
> +MODULE_DESCRIPTION("ASUS BIOS Configuration Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("wmi:" ASUS_NB_WMI_EVENT_GUID);
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> new file mode 100644
> index 000000000000..4d0dd34c52aa
> --- /dev/null
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -0,0 +1,146 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * Definitions for kernel modules using asus-armoury driver
> + *
> + *  Copyright (c) 2024 Luke Jones <luke@ljones.dev>
> + */
> +
> +#ifndef _ASUS_ARMOURY_H_
> +#define _ASUS_ARMOURY_H_
> +
> +#include <linux/types.h>
> +#include <linux/platform_device.h>
> +
> +#define DRIVER_NAME "asus-armoury"
> +
> +static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribute *attr,
> +			      const char *buf, size_t count, u32 min, u32 max,
> +			      u32 *store_value, u32 wmi_dev);
> +
> +static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			      char *buf)
> +{
> +	return sysfs_emit(buf, "enumeration\n");
> +}
> +
> +#define __ASUS_ATTR_RO(_func, _name)                                  \
> +	{                                                             \
> +		.attr = { .name = __stringify(_name), .mode = 0444 }, \
> +		.show = _func##_##_name##_show,                       \
> +	}
> +
> +#define __ASUS_ATTR_RO_AS(_name, _show)                               \
> +	{                                                             \
> +		.attr = { .name = __stringify(_name), .mode = 0444 }, \
> +		.show = _show,                                        \
> +	}
> +
> +#define __ASUS_ATTR_RW(_func, _name) \
> +	__ATTR(_name, 0644, _func##_##_name##_show, _func##_##_name##_store)
> +
> +#define __WMI_STORE_INT(_attr, _min, _max, _wmi)                          \
> +	static ssize_t _attr##_store(struct kobject *kobj,                \
> +				     struct kobj_attribute *attr,         \
> +				     const char *buf, size_t count)       \
> +	{                                                                 \
> +		return attr_int_store(kobj, attr, buf, count, _min, _max, \
> +				      NULL, _wmi);                        \
> +	}
> +
> +#define WMI_SHOW_INT(_attr, _fmt, _wmi)                                     \
> +	static ssize_t _attr##_show(struct kobject *kobj,                   \
> +				    struct kobj_attribute *attr, char *buf) \
> +	{                                                                   \
> +		u32 result;                                                 \
> +		int err;                                                    \
> +		err = asus_wmi_get_devstate_dsts(_wmi, &result);            \
> +		if (err)                                                    \
> +			return err;                                         \
> +		return sysfs_emit(buf, _fmt,                                \
> +				  result & ~ASUS_WMI_DSTS_PRESENCE_BIT);    \
> +	}
> +
> +/* Create functions and attributes for use in other macros or on their own */
> +
> +#define __ATTR_CURRENT_INT_RO(_attr, _wmi)                          \
> +	WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
> +	static struct kobj_attribute attr_##_attr##_current_value = \
> +		__ASUS_ATTR_RO(_attr, current_value)
> +
> +#define __ATTR_CURRENT_INT_RW(_attr, _minv, _maxv, _wmi)            \
> +	__WMI_STORE_INT(_attr##_current_value, _minv, _maxv, _wmi); \
> +	WMI_SHOW_INT(_attr##_current_value, "%d\n", _wmi);          \
> +	static struct kobj_attribute attr_##_attr##_current_value = \
> +		__ASUS_ATTR_RW(_attr, current_value)
> +
> +/* Shows a formatted static variable */
> +#define __ATTR_SHOW_FMT(_prop, _attrname, _fmt, _val)                         \
> +	static ssize_t _attrname##_##_prop##_show(                            \
> +		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +	{                                                                     \
> +		return sysfs_emit(buf, _fmt, _val);                           \
> +	}                                                                     \
> +	static struct kobj_attribute attr_##_attrname##_##_prop =             \
> +		__ASUS_ATTR_RO(_attrname, _prop)
> +
> +/* Boolean style enumeration, base macro. Requires adding show/store */
> +#define __ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)     \
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
> +	__ATTR_SHOW_FMT(possible_values, _attrname, "%s\n", _possible); \
> +	static struct kobj_attribute attr_##_attrname##_type =          \
> +		__ASUS_ATTR_RO_AS(type, enum_type_show);                \
> +	static struct attribute *_attrname##_attrs[] = {                \
> +		&attr_##_attrname##_current_value.attr,                 \
> +		&attr_##_attrname##_display_name.attr,                  \
> +		&attr_##_attrname##_possible_values.attr,               \
> +		&attr_##_attrname##_type.attr,                          \
> +		NULL                                                    \
> +	};                                                              \
> +	static const struct attribute_group _attrname##_attr_group = {  \
> +		.name = _fsname, .attrs = _attrname##_attrs             \
> +	}
> +
> +#define ATTR_GROUP_BOOL_RO(_attrname, _fsname, _wmi, _dispname) \
> +	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                 \
> +	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> +
> +#define ATTR_GROUP_BOOL_RW(_attrname, _fsname, _wmi, _dispname) \
> +	__ATTR_CURRENT_INT_RW(_attrname, 0, 1, _wmi);           \
> +	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> +
> +/*
> + * Requires <name>_current_value_show(), <name>_current_value_show()
> + */
> +#define ATTR_GROUP_BOOL_CUSTOM(_attrname, _fsname, _dispname)           \
> +	static struct kobj_attribute attr_##_attrname##_current_value = \
> +		__ASUS_ATTR_RW(_attrname, current_value);               \
> +	__ATTR_GROUP_ENUM(_attrname, _fsname, "0;1", _dispname)
> +
> +#define ATTR_GROUP_ENUM_INT_RO(_attrname, _fsname, _wmi, _possible, _dispname) \
> +	__ATTR_CURRENT_INT_RO(_attrname, _wmi);                                \
> +	__ATTR_GROUP_ENUM(_attrname, _fsname, _possible, _dispname)
> +
> +/*
> + * Requires <name>_current_value_show(), <name>_current_value_show()
> + * and <name>_possible_values_show()
> + */
> +#define ATTR_GROUP_ENUM_CUSTOM(_attrname, _fsname, _dispname)             \
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);      \
> +	static struct kobj_attribute attr_##_attrname##_current_value =   \
> +		__ASUS_ATTR_RW(_attrname, current_value);                 \
> +	static struct kobj_attribute attr_##_attrname##_possible_values = \
> +		__ASUS_ATTR_RO(_attrname, possible_values);               \
> +	static struct kobj_attribute attr_##_attrname##_type =            \
> +		__ASUS_ATTR_RO_AS(type, enum_type_show);                  \
> +	static struct attribute *_attrname##_attrs[] = {                  \
> +		&attr_##_attrname##_current_value.attr,                   \
> +		&attr_##_attrname##_display_name.attr,                    \
> +		&attr_##_attrname##_possible_values.attr,                 \
> +		&attr_##_attrname##_type.attr,                            \
> +		NULL                                                      \
> +	};                                                                \
> +	static const struct attribute_group _attrname##_attr_group = {    \
> +		.name = _fsname, .attrs = _attrname##_attrs               \
> +	}
> +
> +#endif /* _ASUS_BIOSCFG_H_ */
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 0a5221d65130..3c6d774f4453 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -55,8 +55,6 @@ module_param(fnlock_default, bool, 0444);
>   #define to_asus_wmi_driver(pdrv)					\
>   	(container_of((pdrv), struct asus_wmi_driver, platform_driver))
>   
> -#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
> -
>   #define NOTIFY_BRNUP_MIN		0x11
>   #define NOTIFY_BRNUP_MAX		0x1f
>   #define NOTIFY_BRNDOWN_MIN		0x20
> @@ -105,8 +103,6 @@ module_param(fnlock_default, bool, 0444);
>   #define USB_INTEL_XUSB2PR		0xD0
>   #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
>   
> -#define ASUS_ACPI_UID_ASUSWMI		"ASUSWMI"
> -
>   #define WMI_EVENT_MASK			0xFFFF
>   
>   #define FAN_CURVE_POINTS		8
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 6ea4dedfb85e..21313e1eb6c9 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -6,6 +6,9 @@
>   #include <linux/types.h>
>   #include <linux/dmi.h>
>   
> +#define ASUS_WMI_MGMT_GUID	"97845ED0-4E6D-11DE-8A39-0800200C9A66"
> +#define ASUS_ACPI_UID_ASUSWMI	"ASUSWMI"
> +
>   /* WMI Methods */
>   #define ASUS_WMI_METHODID_SPEC	        0x43455053 /* BIOS SPECification */
>   #define ASUS_WMI_METHODID_SFBD		0x44424653 /* Set First Boot Device */


