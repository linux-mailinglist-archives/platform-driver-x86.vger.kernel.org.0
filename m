Return-Path: <platform-driver-x86+bounces-5638-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 677E89896F1
	for <lists+platform-driver-x86@lfdr.de>; Sun, 29 Sep 2024 20:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AA991C2082E
	for <lists+platform-driver-x86@lfdr.de>; Sun, 29 Sep 2024 18:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A088C55E48;
	Sun, 29 Sep 2024 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bhtyj2i2"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7442A3A1B5;
	Sun, 29 Sep 2024 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727636346; cv=none; b=qXYdz7TgNv5IaXJjit6/HlDEsTPfbfwo14HKIl4Xy5cNAAfC2Wf6+692mZrxM+YyeMVEBSaONbEG9MJpfQivtDIh4akFxDVfyg8nOLRiCVINNZ3+oY4zPxjfhLvc4asSwOoLNrYbCxkkDjfi1GtIuScGOYnNIlevSXJh4tYNLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727636346; c=relaxed/simple;
	bh=kR5ZVNPzgt22nrP2N5SuM9ev0rLCcrgOa8jRau1nvDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ewqn55y44QQPRU79olxzaViXEEmPyKaEMMqsPgKZftkJMB/ACuSXzmRkOB5BUtK7s+lKq7C1/SNTy4C4AC9y8ws7HIKcteHcSaxJkT9pIJuBg2MWOBqzeB4bQFJKkoPQl9xAa31WZefyaODRbZ6Z4L1XDkYSddHl9IjGavbFdNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bhtyj2i2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF29C4CEC5;
	Sun, 29 Sep 2024 18:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727636345;
	bh=kR5ZVNPzgt22nrP2N5SuM9ev0rLCcrgOa8jRau1nvDw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Bhtyj2i2ysGITF2G9VAYrwbmXzNj+10UvjcuxNcZl/L3aS/Ai6Eaauqvfg+YwAe/n
	 00ZpXMFUJMb5sS/I+argbAFN+Z1B4kwSX3BwBUq8aiwignoSkViv1wy5MpLArLLSqO
	 hY7K/fpkXlotilbfmcs7GP6/nufhWUDNpm238yvrMKaK49lWEWM9n94p7l/6VobqzT
	 UwEo23lIPwIt/X0SCLWfdgySbqVFFlTASSw8OaAIbTSwXdqfWA8o0x6D55d49NbkCo
	 VMUTL3zXrHAyoqWDr9Fi3O/2lQR7ZJyspiHaP9N/tsYLW4PMYF0YOdu8DTowaE4/ZY
	 KlqFHsfpvkteg==
Message-ID: <59b08c39-6f9b-49a8-8bcd-d0813741a247@kernel.org>
Date: Sun, 29 Sep 2024 13:59:03 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] platform/x86: asus-armoury: add the ppt_* and nv_*
 tuning knobs
To: "Luke D. Jones" <luke@ljones.dev>, linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org, jikos@kernel.org,
 platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, corentin.chary@gmail.com
References: <20240929090813.7888-1-luke@ljones.dev>
 <20240929090813.7888-6-luke@ljones.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20240929090813.7888-6-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/29/24 04:08, Luke D. Jones wrote:
> Adds the ppt_* and nv_* tuning knobs that are available via WMI methods
> and adds proper min/max levels plus defaults.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/platform/x86/asus-armoury.c | 134 ++++++++++++++++++++++++++++
>   drivers/platform/x86/asus-armoury.h |  65 ++++++++++++++
>   2 files changed, 199 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index c885b433c39d..aadeb2a41ca6 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -52,12 +52,40 @@
>   #define PPT_PLATFORM_MAX 100
>   #define PPT_PLATFORM_DEFAULT 80
>   
> +/* Tunables provided by ASUS for gaming laptops */
> +struct rog_tunables {
> +	u32 cpu_default;
> +	u32 cpu_min;
> +	u32 cpu_max;
> +
> +	u32 platform_default;
> +	u32 platform_min;
> +	u32 platform_max;
> +
> +	u32 ppt_pl1_spl; // cpu
> +	u32 ppt_pl2_sppt; // cpu
> +	u32 ppt_apu_sppt; // plat
> +	u32 ppt_platform_sppt; // plat
> +	u32 ppt_fppt; // cpu
> +
> +	u32 nv_boost_default;
> +	u32 nv_boost_min;
> +	u32 nv_boost_max;
> +	u32 nv_dynamic_boost;
> +
> +	u32 nv_temp_default;
> +	u32 nv_temp_min;
> +	u32 nv_temp_max;
> +	u32 nv_temp_target;
> +};
> +
>   static const struct class *fw_attr_class;
>   
>   struct asus_armoury_priv {
>   	struct device *fw_attr_dev;
>   	struct kset *fw_attr_kset;
>   
> +	struct rog_tunables *rog_tunables;
>   	u32 mini_led_dev_id;
>   	u32 gpu_mux_dev_id;
>   
> @@ -431,6 +459,25 @@ WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
>   ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
>   
>   /* Simple attribute creation */
> +ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, "ppt_pl1_spl", ASUS_WMI_DEVID_PPT_PL1_SPL, cpu_default,
> +		       cpu_min, cpu_max, 1, "Set the CPU slow package limit");
> +ATTR_GROUP_ROG_TUNABLE(ppt_pl2_sppt, "ppt_pl2_sppt", ASUS_WMI_DEVID_PPT_PL2_SPPT, cpu_default,
> +		       cpu_min, cpu_max, 1, "Set the CPU fast package limit");
> +ATTR_GROUP_ROG_TUNABLE(ppt_apu_sppt, "ppt_apu_sppt", ASUS_WMI_DEVID_PPT_APU_SPPT,
> +		       platform_default, platform_min, platform_max, 1,
> +		       "Set the CPU slow package limit");
> +ATTR_GROUP_ROG_TUNABLE(ppt_platform_sppt, "ppt_platform_sppt", ASUS_WMI_DEVID_PPT_PLAT_SPPT,
> +		       platform_default, platform_min, platform_max, 1,
> +		       "Set the CPU slow package limit");
> +ATTR_GROUP_ROG_TUNABLE(ppt_fppt, "ppt_fppt", ASUS_WMI_DEVID_PPT_FPPT, cpu_default, cpu_min,
> +		       cpu_max, 1, "Set the CPU slow package limit");
> +ATTR_GROUP_ROG_TUNABLE(nv_dynamic_boost, "nv_dynamic_boost", ASUS_WMI_DEVID_NV_DYN_BOOST,
> +		       nv_boost_default, nv_boost_min, nv_boost_max, 1,
> +		       "Set the Nvidia dynamic boost limit");
> +ATTR_GROUP_ROG_TUNABLE(nv_temp_target, "nv_temp_target", ASUS_WMI_DEVID_NV_THERM_TARGET,
> +		       nv_temp_default, nv_boost_min, nv_temp_max, 1,
> +		       "Set the Nvidia max thermal limit");
> +
>   ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
>   		       "Show the current mode of charging");
>   
> @@ -451,6 +498,14 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>   	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>   	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>   
> +	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
> +	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
> +	{ &ppt_apu_sppt_attr_group, ASUS_WMI_DEVID_PPT_APU_SPPT },
> +	{ &ppt_platform_sppt_attr_group, ASUS_WMI_DEVID_PPT_PLAT_SPPT },
> +	{ &ppt_fppt_attr_group, ASUS_WMI_DEVID_PPT_FPPT },
> +	{ &nv_dynamic_boost_attr_group, ASUS_WMI_DEVID_NV_DYN_BOOST },
> +	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
> +
>   	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>   	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>   	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
> @@ -547,6 +602,79 @@ static int asus_fw_attr_add(void)
>   
>   /* Init / exit ****************************************************************/
>   
> +/* Set up the min/max and defaults for ROG tunables */
> +static void init_rog_tunables(struct rog_tunables *rog)
> +{
> +	u32 platform_default = PPT_PLATFORM_DEFAULT;
> +	u32 cpu_default = PPT_CPU_LIMIT_DEFAULT;
> +	u32 platform_max = PPT_PLATFORM_MAX;
> +	u32 max_boost = NVIDIA_BOOST_MAX;
> +	u32 cpu_max = PPT_CPU_LIMIT_MAX;
> +	const char *product;
> +
> +	/*
> +	 * ASUS product_name contains everything required, e.g,
> +	 * "ROG Flow X16 GV601VV_GV601VV_00185149B".
> +	 * The bulk of these defaults are gained from users reporting what
> +	 * ASUS Armoury Crate in Windows provides them.
> +	 */
> +	product = dmi_get_system_info(DMI_PRODUCT_NAME);
> +
> +	if (strstr(product, "GA402R")) {
> +		cpu_default = 125;
> +	} else if (strstr(product, "13QY")) {
> +		cpu_max = 250;
> +	} else if (strstr(product, "X13")) {
> +		cpu_max = 75;
> +		cpu_default = 50;
> +	} else if (strstr(product, "RC71") || strstr(product, "RC72")) {
> +		cpu_max = 50;
> +		cpu_default = 30;
> +	} else if (strstr(product, "G814") || strstr(product, "G614") ||
> +		   strstr(product, "G834") || strstr(product, "G634")) {
> +		cpu_max = 175;
> +	} else if (strstr(product, "GA402X") || strstr(product, "GA403") ||
> +		   strstr(product, "FA507N") || strstr(product, "FA507X") ||
> +		   strstr(product, "FA707N") || strstr(product, "FA707X")) {
> +		cpu_max = 90;
> +	} else {
> +		pr_notice("Using default CPU limits. Please report if these are not correct.\n");
> +	}
> +
> +	if (strstr(product, "GZ301ZE"))
> +		max_boost = 5;
> +	else if (strstr(product, "FX507ZC4"))
> +		max_boost = 15;
> +	else if (strstr(product, "GU605"))
> +		max_boost = 20;
> +
> +	/* ensure defaults for tunables */
> +	rog->cpu_default = cpu_default;
> +	rog->cpu_min = PPT_CPU_LIMIT_MIN;
> +	rog->cpu_max = cpu_max;
> +
> +	rog->platform_default = platform_default;
> +	rog->platform_max = PPT_PLATFORM_MIN;
> +	rog->platform_max = platform_max;
> +
> +	rog->ppt_pl1_spl = cpu_default;
> +	rog->ppt_pl2_sppt = cpu_default;
> +	rog->ppt_apu_sppt = cpu_default;
> +
> +	rog->ppt_platform_sppt = platform_default;
> +	rog->ppt_fppt = cpu_default;
> +
> +	rog->nv_boost_default = NVIDIA_BOOST_MAX;
> +	rog->nv_boost_max = NVIDIA_BOOST_MIN;
> +	rog->nv_boost_max = max_boost;
> +	rog->nv_dynamic_boost = NVIDIA_BOOST_MIN;
> +
> +	rog->nv_temp_default = NVIDIA_TEMP_MAX;
> +	rog->nv_temp_max = NVIDIA_TEMP_MIN;
> +	rog->nv_temp_max = NVIDIA_TEMP_MAX;
> +	rog->nv_temp_target = NVIDIA_TEMP_MIN;
> +}
> +
>   static int __init asus_fw_init(void)
>   {
>   	char *wmi_uid;
> @@ -563,6 +691,12 @@ static int __init asus_fw_init(void)
>   	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
>   		return -ENODEV;
>   
> +	asus_armoury.rog_tunables = kzalloc(sizeof(struct rog_tunables), GFP_KERNEL);
> +	if (!asus_armoury.rog_tunables)
> +		return -ENOMEM;
> +
> +	init_rog_tunables(asus_armoury.rog_tunables);
> +
>   	err = asus_fw_attr_add();
>   	if (err)
>   		return err;
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 4d0dd34c52aa..ca570ed9c8ef 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -17,6 +17,12 @@ static ssize_t attr_int_store(struct kobject *kobj, struct kobj_attribute *attr,
>   			      const char *buf, size_t count, u32 min, u32 max,
>   			      u32 *store_value, u32 wmi_dev);
>   
> +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
> +			     char *buf)
> +{
> +	return sysfs_emit(buf, "integer\n");
> +}
> +
>   static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>   			      char *buf)
>   {
> @@ -143,4 +149,63 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>   		.name = _fsname, .attrs = _attrname##_attrs               \
>   	}
>   
> +/*
> + * ROG PPT attributes need a little different in setup as they
> + * require rog_tunables members.
> + */
> +
> +#define __ROG_TUNABLE_RW(_attr, _min, _max, _wmi)                             \
> +	static ssize_t _attr##_current_value_store(                           \
> +		struct kobject *kobj, struct kobj_attribute *attr,            \
> +		const char *buf, size_t count)                                \
> +	{                                                                     \
> +		return attr_int_store(kobj, attr, buf, count,                 \
> +				      asus_armoury.rog_tunables->_min,        \
> +				      asus_armoury.rog_tunables->_max,        \
> +				      &asus_armoury.rog_tunables->_attr,      \
> +				      _wmi);                                  \
> +	}                                                                     \
> +	static ssize_t _attr##_current_value_show(                            \
> +		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +	{                                                                     \
> +		return sysfs_emit(buf, "%u\n",                                \
> +				  asus_armoury.rog_tunables->_attr);          \
> +	}                                                                     \
> +	static struct kobj_attribute attr_##_attr##_current_value =           \
> +		__ASUS_ATTR_RW(_attr, current_value)
> +
> +#define __ROG_TUNABLE_SHOW(_prop, _attrname, _val)                            \
> +	static ssize_t _attrname##_##_prop##_show(                            \
> +		struct kobject *kobj, struct kobj_attribute *attr, char *buf) \
> +	{                                                                     \
> +		return sysfs_emit(buf, "%d\n",                                \
> +				  asus_armoury.rog_tunables->_val);           \
> +	}                                                                     \
> +	static struct kobj_attribute attr_##_attrname##_##_prop =             \
> +		__ASUS_ATTR_RO(_attrname, _prop)
> +
> +#define ATTR_GROUP_ROG_TUNABLE(_attrname, _fsname, _wmi, _default, _min, _max, \
> +			       _incstep, _dispname)                            \
> +	__ROG_TUNABLE_SHOW(default_value, _attrname, _default);                \
> +	__ROG_TUNABLE_RW(_attrname, _min, _max, _wmi);                         \
> +	__ROG_TUNABLE_SHOW(min_value, _attrname, _min);                        \
> +	__ROG_TUNABLE_SHOW(max_value, _attrname, _max);                        \
> +	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", _incstep);        \
> +	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);           \
> +	static struct kobj_attribute attr_##_attrname##_type =                 \
> +		__ASUS_ATTR_RO_AS(type, int_type_show);                        \
> +	static struct attribute *_attrname##_attrs[] = {                       \
> +		&attr_##_attrname##_current_value.attr,                        \
> +		&attr_##_attrname##_default_value.attr,                        \
> +		&attr_##_attrname##_min_value.attr,                            \
> +		&attr_##_attrname##_max_value.attr,                            \
> +		&attr_##_attrname##_scalar_increment.attr,                     \
> +		&attr_##_attrname##_display_name.attr,                         \
> +		&attr_##_attrname##_type.attr,                                 \
> +		NULL                                                           \
> +	};                                                                     \
> +	static const struct attribute_group _attrname##_attr_group = {         \
> +		.name = _fsname, .attrs = _attrname##_attrs                    \
> +	}
> +
>   #endif /* _ASUS_BIOSCFG_H_ */


