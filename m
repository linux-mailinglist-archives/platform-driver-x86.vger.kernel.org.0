Return-Path: <platform-driver-x86+bounces-2971-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 042078ACEC5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Apr 2024 15:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8304B1F22069
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Apr 2024 13:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90F0150993;
	Mon, 22 Apr 2024 13:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b+lmAfQF"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C48C5028B
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713793946; cv=none; b=DvAcweTFdoYaI1hSHJNpKdrWWRN3CY+5aqgmLg+cNo4khu6432zO8AB/55C5IPfUTf1JJ8DO+1iT1GaDEiZHZfa0yXPvUkVhCXE5CFt81SHCrOZeTy2czJ9kBFB5rpxY3k509ZHGVHUSYCAuKwuFsCddAKW884xdfJ5Y4OK0xJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713793946; c=relaxed/simple;
	bh=cms6DBLLaccZAc1KXDl2woQ2MfKPe8J+fzu5EbAjeBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L3+M/aaYIQO25Ny1DNfgZPc2MPelmM4mJqg3Q2WVjFvtc1y80bbTs5jrWdgu7JMGxvijFysitDk2FcH2jeMbmDI6JGHDb7jWkCS9nH22N05Y+uoWbwr+oB/8mVXcIGeH11r1k0YVP/18WZavsMqGSN6p8pS/bIszIR/1e2qvQhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b+lmAfQF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713793943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cd+Zh4MroQQGf1fldgK7+pNaRKrw6YjpnlrJmcLKlPA=;
	b=b+lmAfQFxvAGl+lvjZIpw2QTV/UE/PNjeD8rnNNvHMGrYXjzag3/QQO1hHWzBqva7Mtvqk
	3nZRhELjIqaFETjxKMdiQ/9My+ANzI+MLsVa+gt/heZJnBxgZ/JTP0nzN7pkmpOfr8EdCU
	NO17XEB2lgdwzuRJlh5RPm7lT07l090=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-cV8Xa2L-Mea9m7Jp7tfBWw-1; Mon, 22 Apr 2024 09:52:22 -0400
X-MC-Unique: cV8Xa2L-Mea9m7Jp7tfBWw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a524b774e39so496985066b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Apr 2024 06:52:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713793941; x=1714398741;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cd+Zh4MroQQGf1fldgK7+pNaRKrw6YjpnlrJmcLKlPA=;
        b=vHcooOeI/XvMuBOjUh0y/Ej+p4p5gMebBwXbE4GDH8UpSYE1cpEQrIu3M1Bt/ZAYvo
         gEYoF3CC7bWM4t5CGVqPdbAh08c/r7wZD+sC1ANGtE5mvhsdIkjjgkfnPbTJARC4rKx4
         konBipdeVjywsNUMYl73aeGrVlIzjNuD9u02Fo6CY1uUGPwM6ae/gzITn6wEdG1WSbZp
         cHAZn5gbma9r4AyNPj3l9QQFq4mv5H3rXU4g5XUgiDYpCiW9bAUIWiprdEVSPIyDEI4o
         RoZH0ufWTIpgTWgukWtxXA5tK/ufeTVn+bGpyw3cbu8crfffp3VuOKnaANcSXDznJIy4
         Nz1g==
X-Forwarded-Encrypted: i=1; AJvYcCVMIbQbtS49wZEIIqmP0z/vEAo/z2kWdbw1fqvo/PSPN9zxMRA5Oj/97XELuwZmONySOyQ8sAE4vvlWbFcGUGMSNSeHRM6FvEhxSileOCEn/k6LLw==
X-Gm-Message-State: AOJu0YyQW8UtFE6U7XyPATosHFNQ/uf85RZ/UsQcWzBmRf9hMvB6ZAV0
	cOkjpxeBBpnzEtDF0xClPsiyI8ZU2PAm2BJNB+uZcPZCsnHZ/xMLARohEDS7SwO6qVOpfrkZdmz
	81wk6HVkiA3eLX0Cj2IAiyppX3GzmHxdr6SDjqiSnEwoRz0C+i06oST5N5EMmFnVv9Jo6h8g=
X-Received: by 2002:a17:906:2483:b0:a55:43e5:3372 with SMTP id e3-20020a170906248300b00a5543e53372mr8471706ejb.20.1713793941436;
        Mon, 22 Apr 2024 06:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiZk3mFG75ufXLKEhhDw5rc0tULPtZ+TRMneAsil91/y6Wt+Qk6NmO1XoTBW8+/jog+lS1cA==
X-Received: by 2002:a17:906:2483:b0:a55:43e5:3372 with SMTP id e3-20020a170906248300b00a5543e53372mr8471690ejb.20.1713793941000;
        Mon, 22 Apr 2024 06:52:21 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id lf17-20020a170906ae5100b00a526fd6362asm5821732ejb.117.2024.04.22.06.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 06:52:20 -0700 (PDT)
Message-ID: <929da79e-444d-4107-9cce-1fb7c2b391ce@redhat.com>
Date: Mon, 22 Apr 2024 15:52:18 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] platform/x86: Use device_show_string() helper for
 sysfs attributes
To: Lukas Wunner <lukas@wunner.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 ibm-acpi-devel@lists.sourceforge.net, Azael Avalos <coproscefalo@gmail.com>,
 Ilpo Jaervinen <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <cover.1713608122.git.lukas@wunner.de>
 <3ae8c9a73fbb291c1c863777af175c657a2a10e9.1713608122.git.lukas@wunner.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <3ae8c9a73fbb291c1c863777af175c657a2a10e9.1713608122.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/20/24 10:00 PM, Lukas Wunner wrote:
> Deduplicate sysfs ->show() callbacks which expose a string at a static
> memory location.  Use the newly introduced device_show_string() helper
> in the driver core instead by declaring those sysfs attributes with
> DEVICE_STRING_ATTR_RO().
> 
> No functional change intended.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Thanks, patch looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Feel free to upstream this though whatever git tree is convenient.

Regards,

Hans



> ---
>  drivers/platform/x86/asus-wmi.c      | 62 +++++++---------------------
>  drivers/platform/x86/thinkpad_acpi.c | 10 +----
>  drivers/platform/x86/toshiba_acpi.c  |  9 +---
>  3 files changed, 20 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 3f07bbf809ef..78d7579b2fdd 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -915,17 +915,12 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
>  }
>  static DEVICE_ATTR_WO(kbd_rgb_mode);
>  
> -static ssize_t kbd_rgb_mode_index_show(struct device *device,
> -						 struct device_attribute *attr,
> -						 char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", "cmd mode red green blue speed");
> -}
> -static DEVICE_ATTR_RO(kbd_rgb_mode_index);
> +static DEVICE_STRING_ATTR_RO(kbd_rgb_mode_index, 0444,
> +			     "cmd mode red green blue speed");
>  
>  static struct attribute *kbd_rgb_mode_attrs[] = {
>  	&dev_attr_kbd_rgb_mode.attr,
> -	&dev_attr_kbd_rgb_mode_index.attr,
> +	&dev_attr_kbd_rgb_mode_index.attr.attr,
>  	NULL,
>  };
>  
> @@ -967,17 +962,12 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
>  }
>  static DEVICE_ATTR_WO(kbd_rgb_state);
>  
> -static ssize_t kbd_rgb_state_index_show(struct device *device,
> -						 struct device_attribute *attr,
> -						 char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", "cmd boot awake sleep keyboard");
> -}
> -static DEVICE_ATTR_RO(kbd_rgb_state_index);
> +static DEVICE_STRING_ATTR_RO(kbd_rgb_state_index, 0444,
> +			     "cmd boot awake sleep keyboard");
>  
>  static struct attribute *kbd_rgb_state_attrs[] = {
>  	&dev_attr_kbd_rgb_state.attr,
> -	&dev_attr_kbd_rgb_state_index.attr,
> +	&dev_attr_kbd_rgb_state_index.attr.attr,
>  	NULL,
>  };
>  
> @@ -2493,13 +2483,6 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  	return count;
>  }
>  
> -static ssize_t fan1_label_show(struct device *dev,
> -					  struct device_attribute *attr,
> -					  char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", ASUS_FAN_DESC);
> -}
> -
>  static ssize_t asus_hwmon_temp1(struct device *dev,
>  				struct device_attribute *attr,
>  				char *buf)
> @@ -2534,13 +2517,6 @@ static ssize_t fan2_input_show(struct device *dev,
>  	return sysfs_emit(buf, "%d\n", value * 100);
>  }
>  
> -static ssize_t fan2_label_show(struct device *dev,
> -					  struct device_attribute *attr,
> -					  char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", ASUS_GPU_FAN_DESC);
> -}
> -
>  /* Middle/Center fan on modern ROG laptops */
>  static ssize_t fan3_input_show(struct device *dev,
>  					struct device_attribute *attr,
> @@ -2559,13 +2535,6 @@ static ssize_t fan3_input_show(struct device *dev,
>  	return sysfs_emit(buf, "%d\n", value * 100);
>  }
>  
> -static ssize_t fan3_label_show(struct device *dev,
> -					  struct device_attribute *attr,
> -					  char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", ASUS_MID_FAN_DESC);
> -}
> -
>  static ssize_t pwm2_enable_show(struct device *dev,
>  				struct device_attribute *attr,
>  				char *buf)
> @@ -2662,15 +2631,16 @@ static ssize_t pwm3_enable_store(struct device *dev,
>  static DEVICE_ATTR_RW(pwm1);
>  static DEVICE_ATTR_RW(pwm1_enable);
>  static DEVICE_ATTR_RO(fan1_input);
> -static DEVICE_ATTR_RO(fan1_label);
> +static DEVICE_STRING_ATTR_RO(fan1_label, 0444, ASUS_FAN_DESC);
> +
>  /* Fan2 - GPU fan */
>  static DEVICE_ATTR_RW(pwm2_enable);
>  static DEVICE_ATTR_RO(fan2_input);
> -static DEVICE_ATTR_RO(fan2_label);
> +static DEVICE_STRING_ATTR_RO(fan2_label, 0444, ASUS_GPU_FAN_DESC);
>  /* Fan3 - Middle/center fan */
>  static DEVICE_ATTR_RW(pwm3_enable);
>  static DEVICE_ATTR_RO(fan3_input);
> -static DEVICE_ATTR_RO(fan3_label);
> +static DEVICE_STRING_ATTR_RO(fan3_label, 0444, ASUS_MID_FAN_DESC);
>  
>  /* Temperature */
>  static DEVICE_ATTR(temp1_input, S_IRUGO, asus_hwmon_temp1, NULL);
> @@ -2681,11 +2651,11 @@ static struct attribute *hwmon_attributes[] = {
>  	&dev_attr_pwm2_enable.attr,
>  	&dev_attr_pwm3_enable.attr,
>  	&dev_attr_fan1_input.attr,
> -	&dev_attr_fan1_label.attr,
> +	&dev_attr_fan1_label.attr.attr,
>  	&dev_attr_fan2_input.attr,
> -	&dev_attr_fan2_label.attr,
> +	&dev_attr_fan2_label.attr.attr,
>  	&dev_attr_fan3_input.attr,
> -	&dev_attr_fan3_label.attr,
> +	&dev_attr_fan3_label.attr.attr,
>  
>  	&dev_attr_temp1_input.attr,
>  	NULL
> @@ -2702,17 +2672,17 @@ static umode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
>  		if (asus->fan_type != FAN_TYPE_AGFN)
>  			return 0;
>  	} else if (attr == &dev_attr_fan1_input.attr
> -	    || attr == &dev_attr_fan1_label.attr
> +	    || attr == &dev_attr_fan1_label.attr.attr
>  	    || attr == &dev_attr_pwm1_enable.attr) {
>  		if (asus->fan_type == FAN_TYPE_NONE)
>  			return 0;
>  	} else if (attr == &dev_attr_fan2_input.attr
> -	    || attr == &dev_attr_fan2_label.attr
> +	    || attr == &dev_attr_fan2_label.attr.attr
>  	    || attr == &dev_attr_pwm2_enable.attr) {
>  		if (asus->gpu_fan_type == FAN_TYPE_NONE)
>  			return 0;
>  	} else if (attr == &dev_attr_fan3_input.attr
> -	    || attr == &dev_attr_fan3_label.attr
> +	    || attr == &dev_attr_fan3_label.attr.attr
>  	    || attr == &dev_attr_pwm3_enable.attr) {
>  		if (asus->mid_fan_type == FAN_TYPE_NONE)
>  			return 0;
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 82429e59999d..47a64a213d14 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10991,13 +10991,7 @@ static struct ibm_struct auxmac_data = {
>  	.name = "auxmac",
>  };
>  
> -static ssize_t auxmac_show(struct device *dev,
> -			   struct device_attribute *attr,
> -			   char *buf)
> -{
> -	return sysfs_emit(buf, "%s\n", auxmac);
> -}
> -static DEVICE_ATTR_RO(auxmac);
> +static DEVICE_STRING_ATTR_RO(auxmac, 0444, auxmac);
>  
>  static umode_t auxmac_attr_is_visible(struct kobject *kobj,
>  				      struct attribute *attr, int n)
> @@ -11006,7 +11000,7 @@ static umode_t auxmac_attr_is_visible(struct kobject *kobj,
>  }
>  
>  static struct attribute *auxmac_attributes[] = {
> -	&dev_attr_auxmac.attr,
> +	&dev_attr_auxmac.attr.attr,
>  	NULL
>  };
>  
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 291f14ef6702..01cf60a015bf 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -1814,12 +1814,7 @@ static DECLARE_WORK(kbd_bl_work, toshiba_acpi_kbd_bl_work);
>  /*
>   * Sysfs files
>   */
> -static ssize_t version_show(struct device *dev,
> -			    struct device_attribute *attr, char *buf)
> -{
> -	return sprintf(buf, "%s\n", TOSHIBA_ACPI_VERSION);
> -}
> -static DEVICE_ATTR_RO(version);
> +static DEVICE_STRING_ATTR_RO(version, 0444, TOSHIBA_ACPI_VERSION);
>  
>  static ssize_t fan_store(struct device *dev,
>  			 struct device_attribute *attr,
> @@ -2428,7 +2423,7 @@ static ssize_t cooling_method_store(struct device *dev,
>  static DEVICE_ATTR_RW(cooling_method);
>  
>  static struct attribute *toshiba_attributes[] = {
> -	&dev_attr_version.attr,
> +	&dev_attr_version.attr.attr,
>  	&dev_attr_fan.attr,
>  	&dev_attr_kbd_backlight_mode.attr,
>  	&dev_attr_kbd_type.attr,


