Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A863C58340F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Jul 2022 22:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231322AbiG0U0q (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 27 Jul 2022 16:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230365AbiG0U0q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 16:26:46 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EDC7D4E86B
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658953603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e/XflQFalEBt9oxybqlqRIzrx07aHkD5HmHGEP+o3Qw=;
        b=QJvuq+8kU96k1vVUTZJ/k4twXWSxG01eNhbQWjmDnmvTrZ9Bu5VkKLfRuUOGogDn3UgipJ
        e+diomaxdHWue5m2CkSzl038OnAWMW1gJzwQ9ifIM0ur4WO+LuKh9rdJilSlDNuRvYt3EN
        ayy3vNb2BuH7aGKER/pXQ3bMjdZtWHM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-lJXPxV3yN1WdBFEGctZ2Tg-1; Wed, 27 Jul 2022 16:26:41 -0400
X-MC-Unique: lJXPxV3yN1WdBFEGctZ2Tg-1
Received: by mail-ed1-f72.google.com with SMTP id s17-20020a056402521100b0043ade613038so11412034edd.17
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:26:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=e/XflQFalEBt9oxybqlqRIzrx07aHkD5HmHGEP+o3Qw=;
        b=5dTCS1OzrMcSCqADfSvO8Tw0zoHEqXCR24/K1vtcglJl18Bofn45G79PYAQGc4MCOv
         pO7GtColmjrBNiT1HOYoSvRHGCgOkI1OqjEFb5AfhZyye6f1rQBR7Lfh3zIYp6LSF4/i
         Bidsg7tnhsj/QjHSYAGU9yOe6X0rWq2YECs0AADHlkEsRMrGKRTH0WEQJMrb2x2RSK99
         akmUYQhzq8yUfZ8XXATMe3A8M/0aUg3nbFv+un+eTbNSfb49GEAd6yk1US0DloGph0sO
         w/f56EpILVuHhfJ5S1gp6H5unbhGOxmdZVX3PvreENP9uLK2dFqqvBNQXIv+WzS2xTmv
         hO3w==
X-Gm-Message-State: AJIora/xFOpW6qWNh6NEyZK/Mtfhb6oE93dRAocx38gdWKoXlbm0CVD3
        SSYnmL8iT/IytemqrIwWUBhoMeOIauAfeyWKSxEAsbo4uCZF+9VuQZEXgItHPSCjPGgPVpXiGcB
        5jb9GzSPCUvdAea/LjkBPByAFiry6y89dlg==
X-Received: by 2002:a05:6402:3707:b0:437:61f9:57a9 with SMTP id ek7-20020a056402370700b0043761f957a9mr24419400edb.1.1658953599897;
        Wed, 27 Jul 2022 13:26:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ui2ob+7JVcMRKejy1yveC3IWe0FYtgoE/0t5oAWRVv2knj2hWOVV7ugknPSwKgbyxaHIwbxg==
X-Received: by 2002:a05:6402:3707:b0:437:61f9:57a9 with SMTP id ek7-20020a056402370700b0043761f957a9mr24419358edb.1.1658953599314;
        Wed, 27 Jul 2022 13:26:39 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id wj22-20020a170907051600b0072af2460cd6sm8038091ejb.30.2022.07.27.13.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:26:38 -0700 (PDT)
Message-ID: <50b1a1f9-5a4c-01c6-beb9-9cdc51eb6aa0@redhat.com>
Date:   Wed, 27 Jul 2022 22:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 04/15] platform/x86/amd/pmf: Add support SPS PMF
 feature
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-5-Shyam-sundar.S-k@amd.com>
 <dfcbc089-eef8-575d-a751-e8500c558960@redhat.com>
In-Reply-To: <dfcbc089-eef8-575d-a751-e8500c558960@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/27/22 21:29, Hans de Goede wrote:
> Hi,
> 
> On 7/12/22 16:58, Shyam Sundar S K wrote:
>> SPS (a.k.a. Static Power Slider) gives a feel of Windows performance
>> power slider for the Linux users, where the user selects a certain
>> mode (like "balanced", "low-power" or "performance") and the thermals
>> associated with each selected mode gets applied from the silicon
>> side via the mailboxes defined through PMFW.
>>
>> PMF driver hooks to platform_profile by reading the PMF ACPI fn9 to
>> see if the support is being advertised by ACPI interface.
>>
>> If supported, the PMF driver reacts to platform_profile selection choices
>> made by the user and adjust the system thermal behavior.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>>  drivers/platform/x86/amd/pmf/acpi.c   |  29 +++++
>>  drivers/platform/x86/amd/pmf/core.c   |  26 ++++
>>  drivers/platform/x86/amd/pmf/pmf.h    |  65 ++++++++++
>>  drivers/platform/x86/amd/pmf/sps.c    | 166 ++++++++++++++++++++++++++
>>  5 files changed, 287 insertions(+), 1 deletion(-)
>>  create mode 100644 drivers/platform/x86/amd/pmf/sps.c
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>> index 2617eba773ce..557521a80427 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -5,4 +5,4 @@
>>  #
>>  
>>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>> -amd-pmf-objs := core.o acpi.o
>> +amd-pmf-objs := core.o acpi.o sps.o
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index addcaae5675c..fd5ab7a116f0 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -54,6 +54,7 @@ static union acpi_object *apmf_if_call(struct apmf_if *apmf_if, int func, struct
>>  static void apmf_if_parse_functions(struct apmf_if_functions *func, u32 mask)
>>  {
>>  	func->system_params = mask & APMF_FUNC_GET_SYS_PARAMS;
>> +	func->static_slider_granular = mask & APMF_FUNC_STATIC_SLIDER_GRANULAR;
>>  }
>>  
>>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev, struct apmf_if *ampf_if)
>> @@ -130,6 +131,34 @@ static int apmf_get_system_params(struct apmf_if *ampf_if)
>>  	return err;
>>  }
>>  
>> +int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
>> +				    struct apmf_static_slider_granular_output *data)
>> +{
>> +	union acpi_object *info;
>> +	size_t size;
>> +	int err = 0;
>> +
>> +	info = apmf_if_call(ampf_if, APMF_FUNC_STATIC_SLIDER_GRANULAR, NULL);
>> +	if (!info)
>> +		return -EIO;
>> +
>> +	size = *(u16 *)info->buffer.pointer;
>> +
>> +	if (size < sizeof(*data)) {
>> +		pr_err("PMF: buffer too small %zu\n", size);
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	size = min(sizeof(*data), size);
>> +	memset(data, 0, sizeof(*data));
>> +	memcpy(data, info->buffer.pointer, size);
> 
> Same remarks wrt size handling as in patch 3/15. As mentioned you really need
> a helper for this. Something with a prototype like this:
> 
> int apmf_if_call_store_buffer(struct apmf_if *ampf_if, int func, void *dest, size_t dest_size);
> 
> And then this entire function becomes just:
> 
> int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
> 				    struct apmf_static_slider_granular_output *data)
> 	return apmf_if_call_store_buffer(ampf_if, APMF_FUNC_STATIC_SLIDER_GRANULAR, data, sizeof(*data));
> }
> 
> 
>> +
>> +out:
>> +	kfree(info);
>> +	return err;
>> +}
>> +
>>  static acpi_handle apmf_if_probe_handle(void)
>>  {
>>  	acpi_handle handle = NULL;
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index c5002b7bb904..b6006e8ee1a1 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/module.h>
>>  #include <linux/pci.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/power_supply.h>
>>  #include "pmf.h"
>>  
>>  /* PMF-SMU communication registers */
>> @@ -45,6 +46,14 @@
>>  #define DELAY_MIN_US	2000
>>  #define DELAY_MAX_US	3000
>>  
>> +int amd_pmf_get_power_source(void)
>> +{
>> +	if (power_supply_is_system_supplied() > 0)
>> +		return POWER_SOURCE_AC;
>> +	else
>> +		return POWER_SOURCE_DC;
>> +}
>> +>  static inline u32 amd_pmf_reg_read(struct amd_pmf_dev *dev, int reg_offset)
>>  {
>>  	return ioread32(dev->regbase + reg_offset);
>> @@ -138,6 +147,21 @@ static const struct pci_device_id pmf_pci_ids[] = {
>>  	{ }
>>  };
>>  
>> +static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>> +{
>> +	/* Enable Static Slider */
>> +	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
> 
> Just put a:
> 
> 	if (!is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
> 		return;
> 
> check at the top of amd_pmf_init_sps(dev); and then you can drop this
> entire function.

I see that in later patches you add more feature checks here. So it is
ok to keep this code as is. Please ignore my original
remark about changing this.

> 
>> +		amd_pmf_init_sps(dev);
>> +		dev_dbg(dev->dev, "SPS enabled and Platform Profiles registered\n");
>> +	}
>> +}
>> +
>> +static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>> +{
>> +	if (is_apmf_func_supported(APMF_FUNC_STATIC_SLIDER_GRANULAR))
>> +		amd_pmf_deinit_sps(dev);
> 
> Same here.

And this can be kept as is too.  Please ignore my original remark about this too.

Regards,

Hans



> 
>> +}
>> +
>>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>>  	{"AMDI0102", 0},
>>  	{ }
>> @@ -206,6 +230,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
>>  
>>  	apmf_acpi_init(dev);
>>  	platform_set_drvdata(pdev, dev);
>> +	amd_pmf_init_features(dev);
>>  
>>  	mutex_init(&dev->lock);
>>  	dev_info(dev->dev, "registered PMF device successfully\n");
>> @@ -218,6 +243,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>>  	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
>>  
>>  	mutex_destroy(&dev->lock);
>> +	amd_pmf_deinit_features(dev);
>>  	kfree(dev->buf);
>>  	return 0;
>>  }
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 40f038eb6197..a405987ae653 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -7,14 +7,17 @@
>>   *
>>   * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>   */
>> +
>>  #ifndef PMF_H
>>  #define PMF_H
>>  
>>  #include <linux/acpi.h>
>> +#include <linux/platform_profile.h>
>>  
>>  /* APMF Functions */
>>  #define APMF_FUNC_VERIFY_INTERFACE			0
>>  #define APMF_FUNC_GET_SYS_PARAMS			1
>> +#define APMF_FUNC_STATIC_SLIDER_GRANULAR	9
>>  
>>  /* Message Definitions */
>>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
>> @@ -35,9 +38,12 @@
>>  #define GET_STT_LIMIT_APU	0x20
>>  #define GET_STT_LIMIT_HS2	0x21
>>  
>> +#define ARG_NONE 0
>> +
>>  /* AMD PMF BIOS interfaces */
>>  struct apmf_if_functions {
>>  	bool system_params;
>> +	bool static_slider_granular;
>>  };
>>  
>>  struct apmf_if {
>> @@ -59,6 +65,30 @@ struct apmf_system_params {
>>  	u8 command_code;
>>  } __packed;
>>  
>> +enum amd_stt_skin_temp {
>> +	STT_TEMP_APU,
>> +	STT_TEMP_HS2,
>> +	STT_TEMP_COUNT,
>> +};
>> +
>> +enum amd_slider_op {
>> +	SLIDER_OP_GET,
>> +	SLIDER_OP_SET,
>> +};
>> +
>> +enum power_source {
>> +	POWER_SOURCE_AC,
>> +	POWER_SOURCE_DC,
>> +	POWER_SOURCE_MAX,
>> +};
>> +
>> +enum power_modes {
>> +	POWER_MODE_PERFORMANCE,
>> +	POWER_MODE_BALANCED_POWER,
>> +	POWER_MODE_POWER_SAVER,
>> +	POWER_MODE_MAX,
>> +};
>> +
>>  struct amd_pmf_dev {
>>  	void __iomem *regbase;
>>  	void __iomem *smu_virt_addr;
>> @@ -69,11 +99,46 @@ struct amd_pmf_dev {
>>  	u32 low;
>>  	struct device *dev;
>>  	struct apmf_if *apmf_if;
>> +	enum platform_profile_option current_profile;
>> +	struct platform_profile_handler pprof;
>>  	struct mutex lock; /* protects the PMF interface */
>>  };
>>  
>> +struct apmf_sps_prop_granular {
>> +	u32 fppt;
>> +	u32 sppt;
>> +	u32 sppt_apu_only;
>> +	u32 spl;
>> +	u32 stt_min;
>> +	u8 stt_skin_temp[STT_TEMP_COUNT];
>> +	u32 fan_id;
>> +} __packed;
>> +
>> +/* Static Slider */
>> +struct apmf_static_slider_granular_output {
>> +	u16 size;
>> +	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX * POWER_MODE_MAX];
>> +};
> 
> missing __packed here I presume, since this is the data returned
> by an ACPI call ?
> 
>> +
>> +struct amd_pmf_static_slider_granular {
>> +	u16 size;
>> +	struct apmf_sps_prop_granular prop[POWER_SOURCE_MAX][POWER_MODE_MAX];
>> +};
>> +
>>  /* Core Layer */
>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>> +int is_apmf_func_supported(unsigned long index);
>>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>> +int amd_pmf_get_power_source(void);
>> +
>> +/* SPS Layer */
>> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
>> +void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
>> +			   struct amd_pmf_static_slider_granular *table);
>> +int amd_pmf_init_sps(struct amd_pmf_dev *dev);
>> +void amd_pmf_deinit_sps(struct amd_pmf_dev *dev);
>> +int apmf_get_static_slider_granular(struct apmf_if *ampf_if,
>> +				    struct apmf_static_slider_granular_output *output);
>> +void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev);
>>  
>>  #endif /* PMF_H */
>> diff --git a/drivers/platform/x86/amd/pmf/sps.c b/drivers/platform/x86/amd/pmf/sps.c
>> new file mode 100644
>> index 000000000000..25289cf5608c
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/sps.c
>> @@ -0,0 +1,166 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD Platform Management Framework (PMF) Driver
>> + *
>> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + */
>> +
>> +#include "pmf.h"
>> +
>> +static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
>> +			       enum platform_profile_option *profile);
>> +static int amd_pmf_profile_set(struct platform_profile_handler *pprof,
>> +			       enum platform_profile_option profile);
>> +static struct amd_pmf_static_slider_granular config_store;
>> +
>> +void amd_pmf_load_defaults_sps(struct amd_pmf_dev *dev)
>> +{
>> +	struct apmf_static_slider_granular_output output;
>> +	int i, j, idx = 0;
>> +
>> +	memset(&config_store, 0, sizeof(config_store));
>> +
>> +	if (dev->apmf_if->func.static_slider_granular) {
>> +		apmf_get_static_slider_granular(dev->apmf_if, &output);
>> +
>> +		for (i = 0; i < POWER_SOURCE_MAX; i++) {
>> +			for (j = 0; j < POWER_MODE_MAX; j++) {
>> +				config_store.prop[i][j].spl = output.prop[idx].spl;
>> +				config_store.prop[i][j].sppt = output.prop[idx].sppt;
>> +				config_store.prop[i][j].sppt_apu_only =
>> +							output.prop[idx].sppt_apu_only;
>> +				config_store.prop[i][j].fppt = output.prop[idx].fppt;
>> +				config_store.prop[i][j].stt_min = output.prop[idx].stt_min;
>> +				config_store.prop[i][j].stt_skin_temp[STT_TEMP_APU] =
>> +						output.prop[idx].stt_skin_temp[STT_TEMP_APU];
>> +				config_store.prop[i][j].stt_skin_temp[STT_TEMP_HS2] =
>> +						output.prop[idx].stt_skin_temp[STT_TEMP_HS2];
>> +				config_store.prop[i][j].fan_id = output.prop[idx].fan_id;
>> +				idx++;
>> +			}
>> +		}
>> +	}
>> +}
>> +
>> +void amd_pmf_update_slider(struct amd_pmf_dev *dev, bool op, int idx,
>> +			   struct amd_pmf_static_slider_granular *table)
>> +{
>> +	int src = amd_pmf_get_power_source();
>> +
>> +	if (op == SLIDER_OP_SET) {
>> +		amd_pmf_send_cmd(dev, SET_SPL, false, config_store.prop[src][idx].spl, NULL);
>> +		amd_pmf_send_cmd(dev, SET_FPPT, false, config_store.prop[src][idx].fppt, NULL);
>> +		amd_pmf_send_cmd(dev, SET_SPPT, false, config_store.prop[src][idx].sppt, NULL);
>> +		amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false,
>> +				 config_store.prop[src][idx].sppt_apu_only, NULL);
>> +		amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false,
>> +				 config_store.prop[src][idx].stt_min, NULL);
>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false,
>> +				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_APU], NULL);
>> +		amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false,
>> +				 config_store.prop[src][idx].stt_skin_temp[STT_TEMP_HS2], NULL);
>> +	} else if (op == SLIDER_OP_GET) {
>> +		amd_pmf_send_cmd(dev, GET_SPL, true, ARG_NONE, &table->prop[src][idx].spl);
>> +		amd_pmf_send_cmd(dev, GET_FPPT, true, ARG_NONE, &table->prop[src][idx].fppt);
>> +		amd_pmf_send_cmd(dev, GET_SPPT, true, ARG_NONE, &table->prop[src][idx].sppt);
>> +		amd_pmf_send_cmd(dev, GET_SPPT_APU_ONLY, true, ARG_NONE,
>> +				 &table->prop[src][idx].sppt_apu_only);
>> +		amd_pmf_send_cmd(dev, GET_STT_MIN_LIMIT, true, ARG_NONE,
>> +				 &table->prop[src][idx].stt_min);
>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_APU, true, ARG_NONE,
>> +				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_APU]);
>> +		amd_pmf_send_cmd(dev, GET_STT_LIMIT_HS2, true, ARG_NONE,
>> +				 (u32 *)&table->prop[src][idx].stt_skin_temp[STT_TEMP_HS2]);
>> +	}
>> +}
>> +
>> +static int amd_pmf_profile_get(struct platform_profile_handler *pprof,
>> +			       enum platform_profile_option *profile)
>> +{
>> +	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
>> +
>> +	*profile = pmf->current_profile;
>> +	return 0;
>> +}
>> +
>> +u8 amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf)
>> +{
>> +	u8 mode;
>> +
>> +	switch (pmf->current_profile) {
>> +	case PLATFORM_PROFILE_PERFORMANCE:
>> +		mode = 0;
> 
> Please use POWER_MODE_PERFORMANCE instead of 1 here.
> 
>> +		break;
>> +	case PLATFORM_PROFILE_BALANCED:
>> +		mode = 1;
> 
> POWER_MODE_BALANCED_POWER instead of 1.
> 
>> +		break;
>> +	case PLATFORM_PROFILE_LOW_POWER:
>> +		mode = 2;
> 
> POWER_MODE_POWER_SAVER instead of 2.
> 
>> +		break;
>> +	default:
>> +		dev_err(pmf->dev, "Unknown Platform Profile.\n");
>> +		break;
>> +	}
>> +
>> +	return mode;
>> +}
>> +
>> +int amd_pmf_profile_set(struct platform_profile_handler *pprof,
>> +			enum platform_profile_option profile)
>> +{
>> +	struct amd_pmf_dev *pmf = container_of(pprof, struct amd_pmf_dev, pprof);
>> +	u8 mode;
>> +
>> +	pmf->current_profile = profile;
>> +	mode = amd_pmf_get_pprof_modes(pmf);
>> +	amd_pmf_update_slider(pmf, SLIDER_OP_SET, mode, NULL);
>> +	return 0;
>> +}
>> +
>> +static void amd_pmf_profile_refresh(struct amd_pmf_dev *dev)
>> +{
>> +	enum platform_profile_option profile;
>> +
>> +	/* Set intially to Balanced Mode */
>> +	profile = PLATFORM_PROFILE_BALANCED;
>> +
>> +	if (profile != dev->current_profile) {
>> +		dev->current_profile = profile;
>> +		platform_profile_notify();
>> +	}
>> +}
>> +
>> +int amd_pmf_init_sps(struct amd_pmf_dev *dev)
>> +{
>> +	int err = 0;
>> +
>> +	dev->pprof.profile_get = amd_pmf_profile_get;
>> +	dev->pprof.profile_set = amd_pmf_profile_set;
>> +
>> +	/* Setup supported modes */
>> +	set_bit(PLATFORM_PROFILE_LOW_POWER, dev->pprof.choices);
>> +	set_bit(PLATFORM_PROFILE_BALANCED, dev->pprof.choices);
>> +	set_bit(PLATFORM_PROFILE_PERFORMANCE, dev->pprof.choices);
>> +
>> +	/* Create platform_profile structure and register */
>> +	err = platform_profile_register(&dev->pprof);
>> +	if (err) {
>> +		dev_err(dev->dev, "Failed to register SPS support, this is most likely an SBIOS bug: %d\n",
>> +			err);
>> +		return -EEXIST;
>> +	}
>> +	/* Ensure initial values are correct */
>> +	amd_pmf_profile_refresh(dev);
> 
> Since dev->current_profile == 0 and thus  dev->current_profile != PLATFORM_PROFILE_BALANCED
> this ends up doing 2 things:
> 
> 1.	dev->current_profile = PLATFORM_PROFILE_BALANCED;
> 2.	platform_profile_notify()
> 
> Where 2 is not useful since the /sys/firmware/acpi/power_profile
> attribute does not exist before the platform_profile_register() call
> we have just done, so nothing is listening on it.
> 
> So this entire function call can be replaced with just:
> 
> 	dev->current_profile = PLATFORM_PROFILE_BALANCED;
> 
> and the badly named refresh (it is not a refresh since it does
> not fetch values from the hw) function can be dropped.
> 
>> +
>> +	amd_pmf_load_defaults_sps(dev);
>> +
>> +	return err;
>> +}
>> +
>> +void amd_pmf_deinit_sps(struct amd_pmf_dev *dev)
>> +{
>> +	platform_profile_remove();
>> +}
> 
> Regards,
> 
> Hans
> 

