Return-Path: <platform-driver-x86+bounces-4395-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C08219322D0
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Jul 2024 11:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 432F01F22E0C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Jul 2024 09:27:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F001198A28;
	Tue, 16 Jul 2024 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2djPQdt"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82280197521
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 09:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721121954; cv=none; b=ZVVrbjVWWkpNxx37vLgZ7zdnnk2RqfGvvMoiGjjubDtQ+kaD25q+/uJGxGCJlSV2HQq0e+oTvhXekF3F0Yap5vgPzin1BB9NHLfaGESf9CA4i53DGh4b18qSrLOLv69bjbGwZSvGOG6vhuI9qybR1UF+qaxn0jtDnA5ZF5alBSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721121954; c=relaxed/simple;
	bh=/cHjarMVJWCyHinQzdhSWEIkTuoiZyVhRl9J8kVKevk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWCpBL0CymWP03mhhQ/BpKWwhJC7VltzeApN725ACnTNLjKHe/u9aI+G2mIOJGdUOCOyxS1qWaJNox3hKEgpr/m+p2YmPV70pq5+hF4o0nx370bV01SkSaUeRrnlFuj5pGYpeHCGN9lyUllIqV15bECGnxZDIybR1VIZwaDDTm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=F2djPQdt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721121951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UuwsPeGLVZhxBodfkYpI3zl+Sgr1+RNbCsXjEFjIBUo=;
	b=F2djPQdt/FG4Lafs89uAWUqogFuNbKzZWWKD3T3BH9qeNMuzxRNdkl8dmZ/ahDWyJ2y1Ba
	a+dOlq8AF7HvYxWEVIc6lRB8BEEIGkg1bfE/D3A8OVhbVEgX1CJzmkh4GKn4XX1ucw+CHr
	2GgQbBsCiiw4e+ggW5yjB41vvzFJwpY=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-9o_BSgRuMIKCYnu61GAjVw-1; Tue, 16 Jul 2024 05:25:48 -0400
X-MC-Unique: 9o_BSgRuMIKCYnu61GAjVw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77c8d7b120so425872066b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 02:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721121947; x=1721726747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UuwsPeGLVZhxBodfkYpI3zl+Sgr1+RNbCsXjEFjIBUo=;
        b=MoPzeCLQ/iG3B7zUZXoxJBZgM2XSfYvpikChcl0hKmhwSIpeOqCWQ+spb8sneUkANp
         rP263ikUCOipMFiRgzX95+fsYaONNyEgdXlYNg/pNZos2EBkdaVFLqTJ2MIs5N3smwS3
         BGvhZm58nwRcJkKwGCxW65yq9nX5Nm7kf2RXw9k03Igpk0t5/bXj7xjEvOUsP/5CJcn9
         cqvflZVD+p7mjYokPCf4azLRcOX4nU33yTSU1G7z1ehANbzZUHksJBzFe917DxKlwKbK
         tyUcEhHIcpgg5ZwGydSMKOsJz2BuElo0uJPg1Z1JSguD3aG8/a2R8nfNvgfNRFCIto79
         dKZA==
X-Forwarded-Encrypted: i=1; AJvYcCXEt6Jatq6fhtmaPylymRrdiZ2UqK1w7FYqlf4eArCsSVt/NSmW+KsKd9oRB3R4lOA6r9M4AdLMss8BIe2ah4Tlvl+x4LpAoS+zwPGEXodOV4EKDA==
X-Gm-Message-State: AOJu0YzG/9jPEuSjCEgi6zSkyVz4FACQbPePc6YwK2P9/DeriR3ySini
	pg8PWwZtxn297sqgyh1p+4xqAhrjZ7EFjXjEsiX2hiv3NNEUSgRyo2MXhrxPsxNk4Noy0dZ3QiR
	1T34QtChLFtFjq2BCII3RxYwGM360aWH5apy6EOCcEju0wF0cSfIXBH5s6Q72q6gsgNO6BwTGiz
	2guno=
X-Received: by 2002:a17:906:d9cb:b0:a77:c68a:1f05 with SMTP id a640c23a62f3a-a79ea3ebb94mr84418866b.9.1721121947394;
        Tue, 16 Jul 2024 02:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYJr85rOZ0HYaQkB63NG0ZYjlMeZ56b71H8mNrn7ng3zkqL4fO97DIXiCZ3ys3ESOj69D8sQ==
X-Received: by 2002:a17:906:d9cb:b0:a77:c68a:1f05 with SMTP id a640c23a62f3a-a79ea3ebb94mr84417966b.9.1721121946987;
        Tue, 16 Jul 2024 02:25:46 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc81ddf5sm286693866b.191.2024.07.16.02.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:25:46 -0700 (PDT)
Message-ID: <078a4a2d-c8ff-4039-b84f-b014055a4368@redhat.com>
Date: Tue, 16 Jul 2024 11:25:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] platform/x86: asus-bios: add core count control
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, linux-kernel@vger.kernel.org
References: <20240716051612.64842-1-luke@ljones.dev>
 <20240716051612.64842-5-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240716051612.64842-5-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/16/24 7:16 AM, Luke D. Jones wrote:
> Implement Intel core enablement under the asus-bioscfg module using the
> fw_attributes class.
> 
> This allows users to enable or disable preformance or efficiency cores
> depending on their requirements. After change a reboot is required.

Not a full revieew, just a quick remark. You say this this
requires a reboot, but this patch does not update asus_bios_requires_reboot()

Regards,

Hans





> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-bioscfg.c        | 206 +++++++++++++++++++++
>  drivers/platform/x86/asus-bioscfg.h        |  29 +++
>  include/linux/platform_data/x86/asus-wmi.h |   4 +
>  3 files changed, 239 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-bioscfg.c b/drivers/platform/x86/asus-bioscfg.c
> index 57efe50e0d19..6d39e45591e8 100644
> --- a/drivers/platform/x86/asus-bioscfg.c
> +++ b/drivers/platform/x86/asus-bioscfg.c
> @@ -41,6 +41,18 @@ MODULE_ALIAS("wmi:"ASUS_NB_WMI_EVENT_GUID);
>  #define ASUS_MINI_LED_2024_STRONG	0x01
>  #define ASUS_MINI_LED_2024_OFF		0x02
>  
> +enum cpu_core_type {
> +	CPU_CORE_PERF = 0,
> +	CPU_CORE_POWER,
> +};
> +
> +enum cpu_core_value {
> +	CPU_CORE_DEFAULT = 0,
> +	CPU_CORE_MIN,
> +	CPU_CORE_MAX,
> +	CPU_CORE_CURRENT,
> +};
> +
>  /* Default limits for tunables available on ASUS ROG laptops */
>  #define PPT_CPU_LIMIT_MIN	5
>  #define PPT_CPU_LIMIT_MAX	150
> @@ -75,6 +87,10 @@ struct rog_tunables {
>  	u32 nv_temp_default;
>  	u32 nv_temp_max;
>  	u32 nv_temp_target;
> +
> +	u32 min_perf_cores;
> +	u32 max_perf_cores;
> +	u32 max_power_cores;
>  };
>  
>  static const struct class *fw_attr_class;
> @@ -540,6 +556,191 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj,
>  }
>  ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set the available system memory for the APU to use");
>  
> +static int asus_bios_set_max_cores(void)
> +{
> +	u32 cores;
> +	int err;
> +
> +	asus_bios.rog_tunables->min_perf_cores = 4;
> +	asus_bios.rog_tunables->max_perf_cores = 4;
> +	asus_bios.rog_tunables->max_power_cores = 8;
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
> +	if (err)
> +		return err;
> +
> +	cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
> +	asus_bios.rog_tunables->max_power_cores = (cores & 0xff00) >> 8;
> +	asus_bios.rog_tunables->max_perf_cores = cores & 0xff;
> +
> +	return 0;
> +}
> +
> +static ssize_t cores_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf,
> +					enum cpu_core_type core_type,
> +					enum cpu_core_value core_value)
> +{
> +	u32 cores;
> +	int err;
> +
> +	switch (core_value) {
> +	case CPU_CORE_DEFAULT:
> +	case CPU_CORE_MAX:
> +		if (core_type == CPU_CORE_PERF)
> +			return sysfs_emit(buf, "%d\n", asus_bios.rog_tunables->max_perf_cores);
> +		else
> +			return sysfs_emit(buf, "%d\n", asus_bios.rog_tunables->max_power_cores);
> +	case CPU_CORE_MIN:
> +		if (core_type == CPU_CORE_PERF)
> +			return sysfs_emit(buf, "%d\n", asus_bios.rog_tunables->min_perf_cores);
> +		else
> +			return sysfs_emit(buf, "%d\n", 0);
> +	default:
> +	break;
> +	}
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
> +	if (err)
> +		return err;
> +
> +	cores &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
> +	if (core_type == CPU_CORE_PERF)
> +		cores &= 0xff;
> +	else
> +		cores = (cores & 0xff00) >> 8;
> +	return sysfs_emit(buf, "%d\n", cores);
> +}
> +
> +static ssize_t cores_current_value_store(struct kobject *kobj,
> +				struct kobj_attribute *attr, const char *buf,
> +				enum cpu_core_type core_type)
> +{
> +	int result, err;
> +	u32 cores, currentv, min, max;
> +
> +	result = kstrtou32(buf, 10, &cores);
> +	if (result)
> +		return result;
> +
> +	if (core_type == CPU_CORE_PERF) {
> +		min = asus_bios.rog_tunables->min_perf_cores;
> +		max = asus_bios.rog_tunables->max_perf_cores;
> +	} else {
> +		min = 0;
> +		max = asus_bios.rog_tunables->max_power_cores;
> +	}
> +	if (cores < min || cores > max)
> +		return -EINVAL;
> +
> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &currentv);
> +	if (err)
> +		return err;
> +
> +	if (core_type == CPU_CORE_PERF)
> +		cores |= (currentv & 0xff00);
> +	else
> +		cores |= currentv & 0xff;
> +
> +	if (cores == currentv)
> +		return 0;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, cores, &result);
> +	if (err) {
> +		pr_warn("Failed to set perfromance core count: %d\n", err);
> +		return err;
> +	}
> +
> +	if (result > 1) {
> +		pr_warn("Failed to set performance core count (result): 0x%x\n", result);
> +		return -EIO;
> +	}
> +
> +	pr_info("CPU core count changed, reboot required\n");
> +	sysfs_notify(kobj, NULL, attr->attr.name);
> +	asus_set_reboot_and_signal_event();
> +
> +	return 0;
> +}
> +
> +static ssize_t cores_performance_min_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
> +}
> +
> +static ssize_t cores_performance_max_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
> +}
> +
> +static ssize_t cores_performance_default_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
> +}
> +
> +static ssize_t cores_performance_current_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
> +}
> +
> +static ssize_t cores_performance_current_value_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	int err;
> +
> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +ATTR_GROUP_CORES_RW(cores_performance, "cores_performance", ASUS_WMI_DEVID_CORES,
> +		"Set the max available performance cores");
> +
> +static ssize_t cores_efficiency_min_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
> +}
> +
> +static ssize_t cores_efficiency_max_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
> +}
> +
> +static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
> +}
> +
> +static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
> +					struct kobj_attribute *attr, char *buf)
> +{
> +	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
> +}
> +
> +static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buf, size_t count)
> +{
> +	int err;
> +
> +	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
> +	if (err)
> +		return err;
> +
> +	return count;
> +}
> +ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency", ASUS_WMI_DEVID_CORES,
> +		"Set the max available efficiency cores");
> +
>  /* Simple attribute creation */
>  ATTR_GROUP_ENUM_INT_RW(thermal_policy, "thermal_policy", ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
>  		0, 3, "0;1;2", "Set the thermal profile: 0=normal, 1=performance, 2=quiet");
> @@ -636,6 +837,11 @@ static int asus_fw_attr_add(void)
>  	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU_CONNECTED))
>  		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &egpu_connected_attr_group);
>  
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_CORES_MAX) && !asus_bios_set_max_cores()) {
> +		sysfs_create_group(&asus_bios.fw_attr_kset->kobj, &cores_performance_attr_group);
> +		sysfs_create_group(&asus_bios.fw_attr_kset->kobj, &cores_efficiency_attr_group);
> +	}
> +
>  	if (asus_wmi_is_present(ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
>  		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &thermal_policy_attr_group);
>  	if (asus_wmi_is_present(ASUS_WMI_DEVID_PPT_PL1_SPL))
> diff --git a/drivers/platform/x86/asus-bioscfg.h b/drivers/platform/x86/asus-bioscfg.h
> index 2da55a91ff0b..bae1976eda3f 100644
> --- a/drivers/platform/x86/asus-bioscfg.h
> +++ b/drivers/platform/x86/asus-bioscfg.h
> @@ -244,6 +244,35 @@ static const struct attribute_group _attrname##_attr_group = {		\
>  			.attrs = _attrname##_attrs			\
>  }
>  
> +/* CPU core attributes need a little different in setup */
> +#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)	\
> +__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
> +__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
> +static struct kobj_attribute attr_##_attrname##_current_value = \
> +	__ASUS_ATTR_RW(_attrname, current_value);		\
> +static struct kobj_attribute attr_##_attrname##_default_value = \
> +	__ASUS_ATTR_RO(_attrname, default_value);		\
> +static struct kobj_attribute attr_##_attrname##_min_value =	\
> +	__ASUS_ATTR_RO(_attrname, min_value);			\
> +static struct kobj_attribute attr_##_attrname##_max_value =	\
> +	__ASUS_ATTR_RO(_attrname, max_value);			\
> +static struct kobj_attribute attr_##_attrname##_type =		\
> +	__ASUS_ATTR_RO_AS(type, int_type_show);			\
> +static struct attribute *_attrname##_attrs[] = {		\
> +		&attr_##_attrname##_current_value.attr,		\
> +		&attr_##_attrname##_default_value.attr,		\
> +		&attr_##_attrname##_min_value.attr,		\
> +		&attr_##_attrname##_max_value.attr,		\
> +		&attr_##_attrname##_scalar_increment.attr,	\
> +		&attr_##_attrname##_display_name.attr,		\
> +		&attr_##_attrname##_type.attr,			\
> +		NULL						\
> +};								\
> +static const struct attribute_group _attrname##_attr_group = {	\
> +		.name = _fsname,				\
> +		.attrs = _attrname##_attrs			\
> +}
> +
>  /* ROG PPT attributes need a little different in setup */
>  #define ATTR_GROUP_PPT_RW(_attrname, _fsname, _wmi, _default,	\
>  			_min, _max, _incstep, _dispname)	\
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index e3d511918416..d8f713ed3ea3 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -128,6 +128,10 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
> +#define ASUS_WMI_DEVID_CORES		0x001200D2
> + /* Maximum Intel E-core and P-core availability */
> +#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
>  #define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
>  #define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
>  #define ASUS_WMI_DEVID_APU_MEM		0x000600C1


