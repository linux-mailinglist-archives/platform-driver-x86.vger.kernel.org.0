Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 743D357561D
	for <lists+platform-driver-x86@lfdr.de>; Thu, 14 Jul 2022 22:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbiGNUEX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 14 Jul 2022 16:04:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232113AbiGNUEX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 16:04:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1DC7F459AD
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 13:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657829061;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lTNQm0Unb1mDvpYk2yqs8Rmnm6TUjDLl4u8EBko/pVY=;
        b=B1VTykxEMfsulpbGiTxRmArDHDMzg7Lz+Aw6lcO79ghDqpL/4z/70omURsRzQRvrLF/9ra
        X4c5VrkKge72iFB78TYfXJjNTQJW0HjyLjpuNM6eGBJ/fZf6yxPvXSogRPfaWVeWDvyiG5
        e+uu378Ra5FpauEekjo5FeS+Biz/RWs=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-292-TBClNhXWMAO-nnON6GlC9w-1; Thu, 14 Jul 2022 16:04:14 -0400
X-MC-Unique: TBClNhXWMAO-nnON6GlC9w-1
Received: by mail-ed1-f70.google.com with SMTP id v19-20020a056402349300b0043b0f690cbaso2107662edc.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 13:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lTNQm0Unb1mDvpYk2yqs8Rmnm6TUjDLl4u8EBko/pVY=;
        b=HcZJzLrguf9im7XVANsVigOlNV4uLTjzJjE/C1kzl/AtsNKdH3EVfxyu0yYED7JBmR
         cmaX6ZfE78WTMLokIjUWEn59Bq7k0zyHRpk9qQRRaRILNTJz8Otvft/MFO6eJNaESjMN
         thMYFCSR9aOYsG2Y9NVKw4I092R62glKmjnNnfhBgNcP5TbBY8lj4QkOSgh4yvE7pnV3
         l1H9CPBPq1/uhtVx4Rz8X+M76aqN4Mc1cBqsz+Crh1IgHkMxL67m/SDWz8Hj3xl9lWT9
         KJHGiwoOVHTUYUSn1wlKXc89g/xi2JG99hmVcyZ7ggH9wfAKDK6WY2OREtCQMZgaXZ+w
         TUHw==
X-Gm-Message-State: AJIora++KIbT4Y7z9rLVHt3WPeWD0es2HwGqi0ENaVEWqxwEDVQVxOQp
        RmoOGA45r2K0/f/+wW7ATTVQV2+Hzu49X+YJC0wtzMhr1/1YikFKmZTikIhtJZw4Z8DxPdkKQb4
        zdUuAc+ysqXqCiGfAFCGZABtf4jRlvzvilA==
X-Received: by 2002:a17:907:7349:b0:72d:a080:f8b0 with SMTP id dq9-20020a170907734900b0072da080f8b0mr7901736ejc.389.1657829052819;
        Thu, 14 Jul 2022 13:04:12 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1voyZ9GDWI3K1aSH+NF2F4f02TwUJiJocz0PzpYfOyQYU/yF7czP2YxrN1mRvjXI7d2nqFzpg==
X-Received: by 2002:a17:907:7349:b0:72d:a080:f8b0 with SMTP id dq9-20020a170907734900b0072da080f8b0mr7901723ejc.389.1657829052638;
        Thu, 14 Jul 2022 13:04:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id u2-20020aa7db82000000b0043a253973aasm1576012edt.10.2022.07.14.13.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 13:04:11 -0700 (PDT)
Message-ID: <e120ac7c-7abb-4999-efe8-6b3b697d12d6@redhat.com>
Date:   Thu, 14 Jul 2022 22:04:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/1] platform/x86: asus-wmi: Add mic-mute LED classdev
 support
Content-Language: en-US
To:     PaddyKP_Yao <ispaddy@gmail.com>
Cc:     PaddyKP_Yao@asus.com, acpi4asus-user@lists.sourceforge.net,
        andy.shevchenko@gmail.com, corentin.chary@gmail.com,
        linux-kernel@vger.kernel.org, luke@ljones.dev,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
References: <d7e2a109-c1b7-9f8c-c2b2-b765f016a9a3@redhat.com>
 <20220711115125.2072508-1-PaddyKP_Yao@asus.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220711115125.2072508-1-PaddyKP_Yao@asus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/11/22 13:51, PaddyKP_Yao wrote:
> In some new ASUS devices, hotkey Fn+F13 is used for mic mute. If mic-mute
> LED is present by checking WMI ASUS_WMI_DEVID_MICMUTE_LED, we will add a
> mic-mute LED classdev, asus::micmute, in the asus-wmi driver to control
> it. The binding of mic-mute LED controls will be swithched with LED
> trigger.
> 
> Signed-off-by: PaddyKP_Yao <PaddyKP_Yao@asus.com>
> ---
> V1 -> V2: fix typo for 'present' and remove unnecessary pr_info() log
> V2 -> V3: resend patch again by gmail to avoid Asus legal in the mail

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
>  drivers/platform/x86/Kconfig               |  2 ++
>  drivers/platform/x86/asus-wmi.c            | 25 ++++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |  1 +
>  3 files changed, 28 insertions(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f915cf67aa26..74769050b770 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -274,6 +274,8 @@ config ASUS_WMI
>  	select INPUT_SPARSEKMAP
>  	select LEDS_CLASS
>  	select NEW_LEDS
> +	select LEDS_TRIGGERS
> +	select LEDS_TRIGGER_AUDIO
>  	select ACPI_PLATFORM_PROFILE
>  	help
>  	  Say Y here if you have a WMI aware Asus laptop (like Eee PCs or new
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index e14fb5fa7324..40c0e00a4b71 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -191,6 +191,7 @@ struct asus_wmi {
>  	int kbd_led_wk;
>  	struct led_classdev lightbar_led;
>  	int lightbar_led_wk;
> +	struct led_classdev micmute_led;
>  	struct workqueue_struct *led_workqueue;
>  	struct work_struct tpd_led_work;
>  	struct work_struct wlan_led_work;
> @@ -906,12 +907,23 @@ static enum led_brightness lightbar_led_get(struct led_classdev *led_cdev)
>  	return result & ASUS_WMI_DSTS_LIGHTBAR_MASK;
>  }
>  
> +static int micmute_led_set(struct led_classdev *led_cdev,
> +			   enum led_brightness brightness)
> +{
> +	int state = brightness != LED_OFF;
> +	int err;
> +
> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MICMUTE_LED, state, NULL);
> +	return err < 0 ? err : 0;
> +}
> +
>  static void asus_wmi_led_exit(struct asus_wmi *asus)
>  {
>  	led_classdev_unregister(&asus->kbd_led);
>  	led_classdev_unregister(&asus->tpd_led);
>  	led_classdev_unregister(&asus->wlan_led);
>  	led_classdev_unregister(&asus->lightbar_led);
> +	led_classdev_unregister(&asus->micmute_led);
>  
>  	if (asus->led_workqueue)
>  		destroy_workqueue(asus->led_workqueue);
> @@ -983,6 +995,19 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  					   &asus->lightbar_led);
>  	}
>  
> +	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MICMUTE_LED)) {
> +		asus->micmute_led.name = "asus::micmute";
> +		asus->micmute_led.max_brightness = 1;
> +		asus->micmute_led.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
> +		asus->micmute_led.brightness_set_blocking = micmute_led_set;
> +		asus->micmute_led.default_trigger = "audio-micmute";
> +
> +		rv = led_classdev_register(&asus->platform_device->dev,
> +						&asus->micmute_led);
> +		if (rv)
> +			goto error;
> +	}
> +
>  error:
>  	if (rv)
>  		asus_wmi_led_exit(asus);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 17dc5cb6f3f2..38ee75874d11 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -49,6 +49,7 @@
>  #define ASUS_WMI_DEVID_LED4		0x00020014
>  #define ASUS_WMI_DEVID_LED5		0x00020015
>  #define ASUS_WMI_DEVID_LED6		0x00020016
> +#define ASUS_WMI_DEVID_MICMUTE_LED		0x00040017
>  
>  /* Backlight and Brightness */
>  #define ASUS_WMI_DEVID_ALS_ENABLE	0x00050001 /* Ambient Light Sensor */

