Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A2E95B3DD6
	for <lists+platform-driver-x86@lfdr.de>; Fri,  9 Sep 2022 19:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbiIIRTc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 9 Sep 2022 13:19:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiIIRTa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 13:19:30 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D631925DE
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 10:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662743967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=luGaFcYkgrEnJMExrlqSW7MHqHnsJoDVCSDluXnVvFw=;
        b=b15wXmCONgcJczGEEVYmjsK2R6b0yE7JJv+0hO44P92xdqZtCQ4i8M54asPX180boUCDUs
        Tl5Qy5vZ9kWzufDOEBGZ+8UebrBwr4bgqjNvZuD4sTk51+pPSIouasv0tCeW8aLQb/bgvZ
        ZGwz6VVCZyqEX6JfK7TXMCxSdnHKfn8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-600-rdDc9V-POMa19WEwyEDuZA-1; Fri, 09 Sep 2022 13:19:23 -0400
X-MC-Unique: rdDc9V-POMa19WEwyEDuZA-1
Received: by mail-ed1-f69.google.com with SMTP id y12-20020a056402358c00b00448898f1c33so1715253edc.7
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Sep 2022 10:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=luGaFcYkgrEnJMExrlqSW7MHqHnsJoDVCSDluXnVvFw=;
        b=M+ZQBth/fSitP3/SvAK1SE78MhLuuVmIoacXbBvMbQ3NFFWc60zm5jfrdD/Z/qm8vw
         leGiUtFTD1Vu4DJbE9MXEStc6FUxHbEAtFA+9zQnDYKmoTA8uP0W0k+kHxnLE6P0UwJM
         SVY5PujndMAEkNlDr4BQUmrFHuhqEfK4rSRYceKpwGEzRjdhN10YiXJkVQZVHJZe5lRf
         xJqQBimsZpsxWOZecYUG/tCcus5+85VB+Iy4Rh021F0lzdLVD7elBNQ6Y5RHKvdOdLTs
         2/Jx0lGzEXhwCNVKA/6iFOyHdWVdTxNhP/4TlD1l5wjUlP0AC2laPJJUBXytupygW6w7
         0Daw==
X-Gm-Message-State: ACgBeo2OC7PaiensifRvd+Vu9HCYU4ASaww94/0SgkJtKxQSE4CPcXUi
        uRtx0774zx/ST6aErnL4DwS73Xb0BuZN0LgnJf6eRbWqmu6fWPQnHlX7sWODvjSPjnX4kQDivXc
        zHjXe2MmmehjajiJJG33qEmn+rmNq1W8+fg==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr10758763ejc.64.1662743962816;
        Fri, 09 Sep 2022 10:19:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR55VI8bCN21DotsbefjOD73Efl16zoZpCFL2M0AQKxQoAr97/kqzpmiIFCGYsebsvQun8+txQ==
X-Received: by 2002:a17:906:9c82:b0:6e1:2c94:1616 with SMTP id fj2-20020a1709069c8200b006e12c941616mr10758744ejc.64.1662743962564;
        Fri, 09 Sep 2022 10:19:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id b18-20020a1709063cb200b0074182109623sm543568ejh.39.2022.09.09.10.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:19:21 -0700 (PDT)
Message-ID: <48a81c9c-8b7a-71f4-359f-d8bf726a5af6@redhat.com>
Date:   Fri, 9 Sep 2022 19:19:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] platform/x86: Battery charge mode in toshiba_acpi
 (sysfs)
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     Sebastian Reichel <sre@kernel.org>,
        Azael Avalos <coproscefalo@gmail.com>
References: <20220902180037.1728546-1-lkml@vorpal.se>
 <20220902180037.1728546-3-lkml@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220902180037.1728546-3-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/2/22 20:00, Arvid Norlander wrote:
> This commit adds the ACPI battery hook which in turns adds the sysfs
> entries.
> 
> Because the Toshiba laptops only support two modes (eco or normal), which
> in testing correspond to 80% and 100% we simply round to the nearest
> possible level when set.
> 
> It is possible that Toshiba laptops other than the Z830 has different set
> points for the charging. If so, a quirk table could be introduced in the
> future for this. For now, assume that all laptops that support this feature
> work the same way.
> 
> Tested on a Toshiba Satellite Z830.
> 
> Signed-off-by: Arvid Norlander <lkml@vorpal.se>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 97 +++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index c927d5d0f8cd..fc953d6bcb93 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -44,6 +44,7 @@
>  #include <linux/rfkill.h>
>  #include <linux/iio/iio.h>
>  #include <linux/toshiba.h>
> +#include <acpi/battery.h>
>  #include <acpi/video.h>
>  
>  MODULE_AUTHOR("John Belmonte");
> @@ -2981,6 +2982,92 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>  	return 0;
>  }
>  
> +
> +/* ACPI battery hooking */
> +static ssize_t charge_control_end_threshold_show(struct device *device,
> +						 struct device_attribute *attr,
> +						 char *buf)
> +{
> +	u32 state;
> +	int status;
> +
> +	if (toshiba_acpi == NULL) {
> +		pr_err("Toshiba ACPI object invalid\n");
> +		return -ENODEV;
> +	}

These and the other (toshiba_acpi == NULL) checks are not necessary,
battery_hook_register() is only called after setting toshiba_acpi to non NULL
and battery_hook_unregister() is called before setting it NULL again,
so toshiba_acpi can never be NULL when the callbacks run.

I have removed all the NULL checks while merging this.


> +
> +	status = toshiba_battery_charge_mode_get(toshiba_acpi, &state);
> +
> +	if (status != 0)
> +		return status;
> +
> +	if (state == 1)
> +		return sprintf(buf, "80\n");
> +	else
> +		return sprintf(buf, "100\n");
> +}
> +
> +static ssize_t charge_control_end_threshold_store(struct device *dev,
> +						  struct device_attribute *attr,
> +						  const char *buf,
> +						  size_t count)
> +{
> +	u32 value;
> +	int rval;
> +
> +	if (toshiba_acpi == NULL) {
> +		pr_err("Toshiba ACPI object invalid\n");
> +		return -ENODEV;
> +	}
> +
> +	rval = kstrtou32(buf, 10, &value);
> +	if (rval)
> +		return rval;
> +
> +	if (value < 1 || value > 100)
> +		return -EINVAL;
> +	rval = toshiba_battery_charge_mode_set(toshiba_acpi,
> +					       (value < 90) ? 1 : 0);
> +	if (rval < 0)
> +		return rval;
> +	else
> +		return count;
> +}
> +
> +static DEVICE_ATTR_RW(charge_control_end_threshold);
> +
> +static struct attribute *toshiba_acpi_battery_attrs[] = {
> +	&dev_attr_charge_control_end_threshold.attr,
> +	NULL,
> +};
> +
> +ATTRIBUTE_GROUPS(toshiba_acpi_battery);
> +
> +static int toshiba_acpi_battery_add(struct power_supply *battery)
> +{
> +	if (toshiba_acpi == NULL) {
> +		pr_err("Init order issue\n");
> +		return -ENODEV;
> +	}
> +	if (!toshiba_acpi->battery_charge_mode_supported)
> +		return -ENODEV;
> +	if (device_add_groups(&battery->dev, toshiba_acpi_battery_groups))
> +		return -ENODEV;
> +	return 0;
> +}
> +
> +static int toshiba_acpi_battery_remove(struct power_supply *battery)
> +{
> +	device_remove_groups(&battery->dev, toshiba_acpi_battery_groups);
> +	return 0;
> +}
> +
> +static struct acpi_battery_hook battery_hook = {
> +	.add_battery = toshiba_acpi_battery_add,
> +	.remove_battery = toshiba_acpi_battery_remove,
> +	.name = "Toshiba Battery Extension",
> +};
> +
>  static void print_supported_features(struct toshiba_acpi_dev *dev)
>  {
>  	pr_info("Supported laptop features:");
> @@ -3063,6 +3150,9 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
>  		rfkill_destroy(dev->wwan_rfk);
>  	}
>  
> +	if (dev->battery_charge_mode_supported)
> +		battery_hook_unregister(&battery_hook);
> +

battery_hook_[un]register() call code from the acpi_battery
kernel code/module. To make sure those symbols are actually available
we need to add: "depends on ACPI_BATTERY" to config ACPI_TOSHIBA
in Kconfig. I have done this while merging this.

Regards,

Hans




>  	if (toshiba_acpi)
>  		toshiba_acpi = NULL;
>  
> @@ -3246,6 +3336,13 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>  
>  	toshiba_acpi = dev;
>  
> +	/*
> +	 * As the battery hook relies on the static variable toshiba_acpi being
> +	 * set, this must be done after toshiba_acpi is assigned.
> +	 */
> +	if (dev->battery_charge_mode_supported)
> +		battery_hook_register(&battery_hook);
> +
>  	return 0;
>  
>  error:

