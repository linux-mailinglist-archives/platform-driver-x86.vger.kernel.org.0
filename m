Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B955856CFFD
	for <lists+platform-driver-x86@lfdr.de>; Sun, 10 Jul 2022 18:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiGJQMv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 10 Jul 2022 12:12:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiGJQMu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 12:12:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 83FBDD11C
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657469568;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=McAT/YphQvjQKcIL1D/TK6lPUjqbpgRF2U01+fVzCQ8=;
        b=OZwbNUIfKIx95Sr40OX7VXU+eykO1QxKiJD6fnv9HO6H6UzeR8snOq7idK6lKKyrOa8VM/
        5BZmQDcqw/Ibfbv24cT431Gg8aHWRehAs+KUL5Y+JePh7kQLoO2ZSyWmLiERejGlYmCruL
        HX5lYAy0If8qFlJrpe2vdlqtpnlex/o=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-257-YWDYS7ZhMmmL-9J2QlZHKw-1; Sun, 10 Jul 2022 12:12:47 -0400
X-MC-Unique: YWDYS7ZhMmmL-9J2QlZHKw-1
Received: by mail-ed1-f71.google.com with SMTP id r12-20020a05640251cc00b00435afb01d7fso2708849edd.18
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 09:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=McAT/YphQvjQKcIL1D/TK6lPUjqbpgRF2U01+fVzCQ8=;
        b=WQuDwOIrwWEI1MzAopx2VniqkSNkZecQ4XjmCOsWtV0L+DcJGzCfNb4wTpje913+TR
         YY49OQYg7IhTVr9K7Ztl6zMM5Vfyvdqr43OanHe4L4/3nqfFe47sH/56KjxUux/KzHow
         wusCUn+f6LqZcOCmVfqAS1vjmJ9AsrEc69FR7PDxgvqdgQsjm3ux5eGC84B4BlzLhf1N
         f/c4O1VLGcy4numez4wWtr6ddelgZ2hyGAOqksku5cB9MtRFXu0u1y2t5hKxg9TZia4w
         m6en4umB2FClJNgrDdKKluAdK313Wfd1eIIItgYK+wQ0XKSmBMHnulBDFVpcHDoJnN3N
         YXEQ==
X-Gm-Message-State: AJIora8kEj1LARBRS7cHmAoQYkSrC5aX2dt9MDVzO/USJH/sJ3zMsfR0
        hCUl4A2rB+tWmpsucEoE2PZ5OaRu4fwquQi1HdzKs1xaWE1hhSoIr9zR3gKozD2V+LL5CzfDcs0
        Rv1jOnsqfgpftTImCgbuNVZhX+USbrPyqnw==
X-Received: by 2002:a17:906:b01a:b0:718:cc50:4c6 with SMTP id v26-20020a170906b01a00b00718cc5004c6mr13880539ejy.630.1657469566112;
        Sun, 10 Jul 2022 09:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1toJg+IHT6bHhi9ScDSesQlF2KTxPQl1AyCar5g69tizCV/ZswDM5ftZ1qOWZHAzNf8k478hg==
X-Received: by 2002:a17:906:b01a:b0:718:cc50:4c6 with SMTP id v26-20020a170906b01a00b00718cc5004c6mr13880520ejy.630.1657469565877;
        Sun, 10 Jul 2022 09:12:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id g19-20020aa7c853000000b0043a1bc2ebbcsm2951548edt.3.2022.07.10.09.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 09:12:44 -0700 (PDT)
Message-ID: <535ccbeb-b6e5-b7ef-47b4-894af24c00b0@redhat.com>
Date:   Sun, 10 Jul 2022 18:12:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] platform/x86/intel/ifs: Allow non-default names for
 IFS image
Content-Language: en-US
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     ashok.raj@intel.com, tony.luck@intel.com,
        gregkh@linuxfoundation.org, ravi.v.shankar@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev
References: <20220710160011.995800-1-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220710160011.995800-1-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/10/22 18:00, Jithu Joseph wrote:
> Existing implementation limits IFS images to be loaded only from
> a default file-name /lib/firmware/intel/ifs/ff-mm-ss.scan.
> 
> But there are situations where there may be multiple scan files
> that can be run on a particular system stored in /lib/firmware/intel/ifs
> 
> E.g.
> 1. Because test contents are larger than the memory reserved for IFS by BIOS
> 2. To provide increased test coverage
> 3. Custom test files to debug certain specific issues in the field
> 
> Renaming each of these to ff-mm-ss.scan and then loading might be
> possible in some environments. But on systems where /lib is read-only
> this is not a practical solution.
> 
> Modify the semantics of the driver file
> /sys/devices/virtual/misc/intel_ifs_0/reload such that,
> it interprets the input as the filename to be loaded.

Much better, but I do wonder about the behavior of still loading
the default filename at module-init?   If there can be multiple
different "test-patterns" then does it not make more sense to
let the user always load the desired pattern before testing first?

Not doing the initial load at module-load time will also speed-up
the module initialization and thus booting the system. Especially
on many-core servers this might make a measurable difference
in module-init time.

Regards,

Hans



> 
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>
> ---
> Changes in v2
> - drop treating "1" specially, i.e treat everything as a file-name
> 
>  drivers/platform/x86/intel/ifs/ifs.h          | 11 ++++----
>  drivers/platform/x86/intel/ifs/core.c         |  2 +-
>  drivers/platform/x86/intel/ifs/load.c         | 25 +++++++++++++------
>  drivers/platform/x86/intel/ifs/sysfs.c        | 13 +++-------
>  .../ABI/testing/sysfs-platform-intel-ifs      |  3 +--
>  5 files changed, 29 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index 73c8e91cf144..577cee7db86a 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -34,12 +34,13 @@
>   * socket in a two step process using writes to MSRs to first load the
>   * SHA hashes for the test. Then the tests themselves. Status MSRs provide
>   * feedback on the success/failure of these steps. When a new test file
> - * is installed it can be loaded by writing to the driver reload file::
> + * is installed it can be loaded by writing the filename to the driver reload file::
>   *
> - *   # echo 1 > /sys/devices/virtual/misc/intel_ifs_0/reload
> + *   # echo mytest > /sys/devices/virtual/misc/intel_ifs_0/reload
>   *
> - * Similar to microcode, the current version of the scan tests is stored
> - * in a fixed location: /lib/firmware/intel/ifs.0/family-model-stepping.scan
> + * The file will be loaded from /lib/firmware/intel/ifs/mytest
> + * The default file /lib/firmware/intel/ifs/family-model-stepping.scan
> + * will be loaded during module insertion.
>   *
>   * Running tests
>   * -------------
> @@ -225,7 +226,7 @@ static inline struct ifs_data *ifs_get_data(struct device *dev)
>  	return &d->data;
>  }
>  
> -void ifs_load_firmware(struct device *dev);
> +int ifs_load_firmware(struct device *dev, const char *file_name);
>  int do_core_test(int cpu, struct device *dev);
>  const struct attribute_group **ifs_get_groups(void);
>  
> diff --git a/drivers/platform/x86/intel/ifs/core.c b/drivers/platform/x86/intel/ifs/core.c
> index 27204e3d674d..9c319ada62d8 100644
> --- a/drivers/platform/x86/intel/ifs/core.c
> +++ b/drivers/platform/x86/intel/ifs/core.c
> @@ -53,7 +53,7 @@ static int __init ifs_init(void)
>  	if ((msrval & BIT(ifs_device.data.integrity_cap_bit)) &&
>  	    !misc_register(&ifs_device.misc)) {
>  		down(&ifs_sem);
> -		ifs_load_firmware(ifs_device.misc.this_device);
> +		ifs_load_firmware(ifs_device.misc.this_device, NULL);
>  		up(&ifs_sem);
>  		return 0;
>  	}
> diff --git a/drivers/platform/x86/intel/ifs/load.c b/drivers/platform/x86/intel/ifs/load.c
> index d056617ddc85..89d76bd8b40a 100644
> --- a/drivers/platform/x86/intel/ifs/load.c
> +++ b/drivers/platform/x86/intel/ifs/load.c
> @@ -232,17 +232,27 @@ static bool ifs_image_sanity_check(struct device *dev, const struct microcode_he
>  
>  /*
>   * Load ifs image. Before loading ifs module, the ifs image must be located
> - * in /lib/firmware/intel/ifs and named as {family/model/stepping}.{testname}.
> + * in the folder /lib/firmware/intel/ifs/
>   */
> -void ifs_load_firmware(struct device *dev)
> +int ifs_load_firmware(struct device *dev, const char *file_name)
>  {
>  	struct ifs_data *ifsd = ifs_get_data(dev);
>  	const struct firmware *fw;
> -	char scan_path[32];
> -	int ret;
> -
> -	snprintf(scan_path, sizeof(scan_path), "intel/ifs/%02x-%02x-%02x.scan",
> -		 boot_cpu_data.x86, boot_cpu_data.x86_model, boot_cpu_data.x86_stepping);
> +	char scan_path[64];
> +	int ret = -EINVAL;
> +	int file_name_len;
> +
> +	if (!file_name) {
> +		snprintf(scan_path, sizeof(scan_path), "intel/ifs/%02x-%02x-%02x.scan",
> +			 boot_cpu_data.x86, boot_cpu_data.x86_model, boot_cpu_data.x86_stepping);
> +	} else {
> +		if (strchr(file_name, '/'))
> +			goto done;
> +		file_name_len = strchrnul(file_name, '\n') - file_name;
> +		if (snprintf(scan_path, sizeof(scan_path), "intel/ifs/%.*s",
> +			     file_name_len, file_name) >= sizeof(scan_path))
> +			goto done;
> +	}
>  
>  	ret = request_firmware_direct(&fw, scan_path, dev);
>  	if (ret) {
> @@ -263,4 +273,5 @@ void ifs_load_firmware(struct device *dev)
>  	release_firmware(fw);
>  done:
>  	ifsd->loaded = (ret == 0);
> +	return ret;
>  }
> diff --git a/drivers/platform/x86/intel/ifs/sysfs.c b/drivers/platform/x86/intel/ifs/sysfs.c
> index 37d8380d6fa8..b4716b7d36aa 100644
> --- a/drivers/platform/x86/intel/ifs/sysfs.c
> +++ b/drivers/platform/x86/intel/ifs/sysfs.c
> @@ -94,23 +94,16 @@ static ssize_t reload_store(struct device *dev,
>  			    struct device_attribute *attr,
>  			    const char *buf, size_t count)
>  {
> -	struct ifs_data *ifsd = ifs_get_data(dev);
> -	bool res;
> -
> -
> -	if (kstrtobool(buf, &res))
> -		return -EINVAL;
> -	if (!res)
> -		return count;
> +	int ret;
>  
>  	if (down_interruptible(&ifs_sem))
>  		return -EINTR;
>  
> -	ifs_load_firmware(dev);
> +	ret = ifs_load_firmware(dev, buf);
>  
>  	up(&ifs_sem);
>  
> -	return ifsd->loaded ? count : -ENODEV;
> +	return ret  ? ret : count;
>  }
>  
>  static DEVICE_ATTR_WO(reload);
> diff --git a/Documentation/ABI/testing/sysfs-platform-intel-ifs b/Documentation/ABI/testing/sysfs-platform-intel-ifs
> index 486d6d2ff8a0..0b373f73a2b6 100644
> --- a/Documentation/ABI/testing/sysfs-platform-intel-ifs
> +++ b/Documentation/ABI/testing/sysfs-platform-intel-ifs
> @@ -35,5 +35,4 @@ What:		/sys/devices/virtual/misc/intel_ifs_<N>/reload
>  Date:		April 21 2022
>  KernelVersion:	5.19
>  Contact:	"Jithu Joseph" <jithu.joseph@intel.com>
> -Description:	Write "1" (or "y" or "Y") to reload the IFS image from
> -		/lib/firmware/intel/ifs/ff-mm-ss.scan.
> +Description:	Write <file_name> to reload the IFS image from /lib/firmware/intel/<file_name>.
> 
> base-commit: 88084a3df1672e131ddc1b4e39eeacfd39864acf

