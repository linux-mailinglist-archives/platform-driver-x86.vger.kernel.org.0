Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 816DD6B7B6F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Mar 2023 16:04:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjCMPEK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Mar 2023 11:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbjCMPED (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Mar 2023 11:04:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344B428EB9
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 08:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678719754;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ytv42m9QWKbJ/ZLfHwR9HdA9Autu6K0kWVrGy/ImdIQ=;
        b=iOaVQVo8/GKJ2zszQETYHce6aj7YJrLCLs7oRzkWzagyHUFAtHvZU7vEKvByxbq8ox5ED4
        TDCDXFOKBeHmjVjnPsXJpLhYo/mxNuDI3SJxW/CgpgeO/o0X7shCWiugyRCpm0yvEKY3Hp
        evs3Fv+w34SxYHQU1b22D743+zvbQ3w=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-On60cdM3PaWznQ_8LgZTuA-1; Mon, 13 Mar 2023 11:02:33 -0400
X-MC-Unique: On60cdM3PaWznQ_8LgZTuA-1
Received: by mail-ed1-f72.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so5451060eda.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Mar 2023 08:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678719752;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytv42m9QWKbJ/ZLfHwR9HdA9Autu6K0kWVrGy/ImdIQ=;
        b=meLAjL9ZMwLuSdxXe6aRPjVIrZGFhoB7THF1Ve1F1PkrcPyrl9kQQNrantP97WRljV
         osItuDWQeZ91e+n+ZpGTGYsHT7yAUDy4NJRekfbXiGHyYGaZtssO2O43MbdI0CCIA35d
         EcMGqylNUp1zAY9t3kWWkRC2IFseXJammtYiyTVvfsdITIn8EAIK5mSIK1bFfs+4nvsJ
         jIahluIoe1jQ3nb4gCI10Me4yY+ha9e7HOUKwR9NvqfQi6RjJymX4wPiaLBuuzirSCLi
         hr3lVviCTtmS0LRGezaf1oUQH+NUpqbRZLd12CQ1jwad1cJdFp2XvfKwhYsSWA+aE1vv
         R6nw==
X-Gm-Message-State: AO0yUKWZB//VIoSg4rmEM+DSjOT8h+OAIrtR3j7O7noaNE3mItcAwkKg
        4r3VleL85jLNQLOrohBxXTh8QgwSSwBDWxFEXgaDbabMR+9nCfK+S+1EcpwwrRk2Izxo+lHLEBg
        0nEeF8uildKbrowvdVlXwkBcaCFwUgV3K2Q==
X-Received: by 2002:a17:907:7f0b:b0:888:7ac8:c0f4 with SMTP id qf11-20020a1709077f0b00b008887ac8c0f4mr37301383ejc.25.1678719752540;
        Mon, 13 Mar 2023 08:02:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set8An3aVV4WnNT9hxgiKWhAdv46b5RvfOThjOYw5to5Y8bLq/2UctAu/n1pVa89F4tB0bReroA==
X-Received: by 2002:a17:907:7f0b:b0:888:7ac8:c0f4 with SMTP id qf11-20020a1709077f0b00b008887ac8c0f4mr37301343ejc.25.1678719752251;
        Mon, 13 Mar 2023 08:02:32 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id xb12-20020a170907070c00b00924916f9c21sm2345305ejb.87.2023.03.13.08.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 08:02:31 -0700 (PDT)
Message-ID: <e4cbc603-ca16-41db-d08d-b5d5250d62b4@redhat.com>
Date:   Mon, 13 Mar 2023 16:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/8] platform/x86/intel/ifs: IFS cleanup
Content-Language: en-US
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, rostedt@goodmis.org,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
References: <20230214234426.344960-1-jithu.joseph@intel.com>
 <20230301015942.462799-1-jithu.joseph@intel.com>
 <20230301015942.462799-3-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230301015942.462799-3-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/1/23 02:59, Jithu Joseph wrote:
> Cleanup incorporating misc review comments
> 
>  - Remove the subdirectory intel_ifs/0 for devicenode [1]
>  - Make plat_ifs_groups non static and use it directly without using a
>     function [2]
> 
> Link: https://lore.kernel.org/lkml/Y+4kQOtrHt5pdsSO@kroah.com/ [1]
> Link: https://lore.kernel.org/lkml/Y9nyxNesVHCUXAcH@kroah.com/  [2]
> 
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Please add my Reviewed-by to this patch for the next version of
the series, so that I know which patches I have already reviewed.

Regards,

Hans

> ---
>  drivers/platform/x86/intel/ifs/ifs.h   | 2 +-
>  drivers/platform/x86/intel/ifs/core.c  | 6 +++---
>  drivers/platform/x86/intel/ifs/sysfs.c | 9 +--------
>  3 files changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index e07463c794d4..ab168ddf28f1 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -246,6 +246,6 @@ static inline struct ifs_data *ifs_get_data(struct device *dev)
>  extern bool *ifs_pkg_auth;
>  int ifs_load_firmware(struct device *dev);
>  int do_core_test(int cpu, struct device *dev);
> -const struct attribute_group **ifs_get_groups(void);
> +extern struct attribute *plat_ifs_attrs[];
>  
>  #endif
> diff --git a/drivers/platform/x86/intel/ifs/core.c b/drivers/platform/x86/intel/ifs/core.c
> index b518b661daf0..62c44dbae757 100644
> --- a/drivers/platform/x86/intel/ifs/core.c
> +++ b/drivers/platform/x86/intel/ifs/core.c
> @@ -20,6 +20,8 @@ static const struct x86_cpu_id ifs_cpu_ids[] __initconst = {
>  };
>  MODULE_DEVICE_TABLE(x86cpu, ifs_cpu_ids);
>  
> +ATTRIBUTE_GROUPS(plat_ifs);
> +
>  bool *ifs_pkg_auth;
>  
>  static struct ifs_device ifs_device = {
> @@ -29,8 +31,8 @@ static struct ifs_device ifs_device = {
>  	},
>  	.misc = {
>  		.name = "intel_ifs_0",
> -		.nodename = "intel_ifs/0",
>  		.minor = MISC_DYNAMIC_MINOR,
> +		.groups = plat_ifs_groups,
>  	},
>  };
>  
> @@ -53,8 +55,6 @@ static int __init ifs_init(void)
>  	if (rdmsrl_safe(MSR_INTEGRITY_CAPS, &msrval))
>  		return -ENODEV;
>  
> -	ifs_device.misc.groups = ifs_get_groups();
> -
>  	if (!(msrval & BIT(ifs_device.ro_data.integrity_cap_bit)))
>  		return -ENODEV;
>  
> diff --git a/drivers/platform/x86/intel/ifs/sysfs.c b/drivers/platform/x86/intel/ifs/sysfs.c
> index ee636a76b083..2007d8054f04 100644
> --- a/drivers/platform/x86/intel/ifs/sysfs.c
> +++ b/drivers/platform/x86/intel/ifs/sysfs.c
> @@ -141,7 +141,7 @@ static ssize_t image_version_show(struct device *dev,
>  static DEVICE_ATTR_RO(image_version);
>  
>  /* global scan sysfs attributes */
> -static struct attribute *plat_ifs_attrs[] = {
> +struct attribute *plat_ifs_attrs[] = {
>  	&dev_attr_details.attr,
>  	&dev_attr_status.attr,
>  	&dev_attr_run_test.attr,
> @@ -149,10 +149,3 @@ static struct attribute *plat_ifs_attrs[] = {
>  	&dev_attr_image_version.attr,
>  	NULL
>  };
> -
> -ATTRIBUTE_GROUPS(plat_ifs);
> -
> -const struct attribute_group **ifs_get_groups(void)
> -{
> -	return plat_ifs_groups;
> -}

