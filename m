Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68C88746FB9
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Jul 2023 13:19:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjGDLTh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Jul 2023 07:19:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjGDLTg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Jul 2023 07:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49E910D3
        for <platform-driver-x86@vger.kernel.org>; Tue,  4 Jul 2023 04:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688469405;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=579u74/n50LxRe/EUX1QN56hzduU1yIaTqid7Yezzh8=;
        b=Or83zuYPRfmrXY40KY5AjRbw83AIWj0aerPOMM4nDOe18P2vo2IbHem5LXBE+4BLEGfd+9
        h5jYLed8DGs4cFDJxV1g6G19Ze6+THgdm5ec62RP7uCQjT5QV8HXNhmWoIvxZxTxAzqLTd
        wpZ3R4PXC+J4Vi5LPTw5J1eOJuvEZ64=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-vh0siyrcNA2pCehTbGbGsQ-1; Tue, 04 Jul 2023 07:16:44 -0400
X-MC-Unique: vh0siyrcNA2pCehTbGbGsQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2b6cf671d94so37888851fa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 04 Jul 2023 04:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688469403; x=1691061403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=579u74/n50LxRe/EUX1QN56hzduU1yIaTqid7Yezzh8=;
        b=LH6c2i6JabP7eTxsDDk6Fpw6z1U7XNT6la9PObWoEB4vXCs+bpWNXOA8ARHclgG3/0
         28YEgdcfoaebL3fIDAcxgglrbxpU80D+0wOn9LuiwCsyAjWAbQ3Vtj/1TGdK77VtlB0x
         YHG2+JJI58GxUfFquZGlLl8e3IkHhJpThNd2hjNyPA/2qj91L1Z0lVtRWzQD/wFtSGOa
         mUUyrz8Au0nn9SYPNIS1gKNKE5Ddr5m97SPbEqYHDwVWF9QFePAkvgK43I/3JGo3EyGC
         iKQfM/u8nDCp3CiGpomde/P1Qgy0vn6TVAOQByH61xyTeEZ8qVd/5TsHUB122oW2qgtR
         NF1w==
X-Gm-Message-State: ABy/qLb3cGTpd9ncWX35hL9G19cujvVnb21pBsSw5KarAPyG37dsjERZ
        jTAXVgXF7UrC3AdMwjSG0Bww3LiC7aviVLP7dj0Kp5j7NotWmmZ/SGUqLjUbHf40uug7xqR/Hwy
        vkdke8nsvoWtkdY7WWaq9XFxKyXlrPv/4cg==
X-Received: by 2002:a2e:9159:0:b0:2b6:a3b0:f4d3 with SMTP id q25-20020a2e9159000000b002b6a3b0f4d3mr10279234ljg.26.1688469402805;
        Tue, 04 Jul 2023 04:16:42 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFxVuYr4Lsv3k/Ylm6oCnyx0dsiv49hhs7GCElvoMHQXjQT0I+UDc0jn2FW9CEnEqHkOn0Vsg==
X-Received: by 2002:a2e:9159:0:b0:2b6:a3b0:f4d3 with SMTP id q25-20020a2e9159000000b002b6a3b0f4d3mr10279213ljg.26.1688469402409;
        Tue, 04 Jul 2023 04:16:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a11-20020a170906468b00b0099364d9f0e6sm3087361ejr.117.2023.07.04.04.16.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 04:16:41 -0700 (PDT)
Message-ID: <974093b4-5dac-dc29-8f86-304eb5c6c19b@redhat.com>
Date:   Tue, 4 Jul 2023 13:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/1] platform/x86: asus-wmi: add support for ASUS
 screenpad
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630041743.911303-1-luke@ljones.dev>
 <20230630041743.911303-2-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630041743.911303-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Luke,

On 6/30/23 06:17, Luke D. Jones wrote:
> Add support for the WMI methods used to turn off and adjust the
> brightness of the secondary "screenpad" device found on some high-end
> ASUS laptops like the GX650P series and others.
> 
> These methods are utilised in a new backlight device named asus_screenpad.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thank you for your work on this. I have one small change request
and then v5 should be ready for merging, see me inline comment
below.

> ---
>  drivers/platform/x86/asus-wmi.c            | 128 +++++++++++++++++++++
>  drivers/platform/x86/asus-wmi.h            |   1 +
>  include/linux/platform_data/x86/asus-wmi.h |   4 +
>  3 files changed, 133 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 62cee13f5576..967c92ceb041 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -25,6 +25,7 @@
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/kernel.h>
>  #include <linux/leds.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pci_hotplug.h>
> @@ -212,6 +213,7 @@ struct asus_wmi {
>  
>  	struct input_dev *inputdev;
>  	struct backlight_device *backlight_device;
> +	struct backlight_device *screenpad_backlight_device;
>  	struct platform_device *platform_device;
>  
>  	struct led_classdev wlan_led;
> @@ -3839,6 +3841,123 @@ static int is_display_toggle(int code)
>  	return 0;
>  }
>  
> +/* Screenpad backlight *******************************************************/
> +
> +static int read_screenpad_backlight_power(struct asus_wmi *asus)
> +{
> +	int ret;
> +
> +	ret = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
> +	if (ret < 0)
> +		return ret;
> +	/* 1 == powered */
> +	return ret ? FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> +}
> +
> +static int read_screenpad_brightness(struct backlight_device *bd)
> +{
> +	struct asus_wmi *asus = bl_get_data(bd);
> +	u32 retval;
> +	int err;
> +
> +	err = read_screenpad_backlight_power(asus);
> +	if (err < 0)
> +		return err;
> +	/* The device brightness can only be read if powered, so return stored */
> +	if (err == FB_BLANK_POWERDOWN)
> +		return asus->driver->screenpad_brightness;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &retval);
> +	if (err < 0)
> +		return err;
> +
> +	return retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK;
> +}
> +
> +static int update_screenpad_bl_status(struct backlight_device *bd)
> +{
> +	struct asus_wmi *asus = bl_get_data(bd);
> +	int power, err = 0;
> +	u32 ctrl_param;
> +
> +	power = read_screenpad_backlight_power(asus);
> +	if (power < 0)
> +		return power;
> +
> +	if (bd->props.power != power) {
> +		if (power != FB_BLANK_UNBLANK) {
> +			/* Only brightness > 0 can power it back on */
> +			ctrl_param = max(1, asus->driver->screenpad_brightness);
> +			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
> +						    ctrl_param, NULL);
> +		} else {
> +			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
> +		}
> +	} else if (power == FB_BLANK_UNBLANK) {
> +		/* Only set brightness if powered on or we get invalid/unsync state */
> +		ctrl_param = bd->props.brightness;
> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
> +	}
> +
> +	/* Ensure brightness is stored to turn back on with */
> +	asus->driver->screenpad_brightness = bd->props.brightness;
> +
> +	return err;
> +}
> +
> +static const struct backlight_ops asus_screenpad_bl_ops = {
> +	.get_brightness = read_screenpad_brightness,
> +	.update_status = update_screenpad_bl_status,
> +	.options = BL_CORE_SUSPENDRESUME,
> +};
> +
> +static int asus_screenpad_init(struct asus_wmi *asus)
> +{
> +	struct backlight_device *bd;
> +	struct backlight_properties props;
> +	int err, power;
> +	int brightness = 0;
> +
> +	power = read_screenpad_backlight_power(asus);
> +	if (power < 0)
> +		return power;
> +
> +	if (power != FB_BLANK_POWERDOWN) {
> +		err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
> +		if (err < 0)
> +			return err;
> +	}
> +	/* default to an acceptable min brightness on boot if too low */
> +	if (brightness < 60)
> +		brightness = 60;

If settings below 60 are no good, then the correct way to handle
this is to limit the range to 0 - (255-60) and add / substract
60 when setting / getting the brightness.

E.g. do something like this:

#define SCREENPAD_MIN_BRIGHTNESS	60
#define SCREENPAD_MAX_BRIGHTNESS	255

	props.max_brightness = SCREENPAD_MAX_BRIGHTNESS - SCREENPAD_MIN_BRIGHTNESS;

And in update_screenpad_bl_status() do:

	ctrl_param = bd->props.brightness + SCREENPAD_MIN_BRIGHTNESS;

And when reading the brightness substract SCREENPAD_MIN_BRIGHTNESS,
clamping to a minimum value of 0.

This avoids a dead-zone in the brightness range between 0-60 .

Regards,

Hans






> +
> +	memset(&props, 0, sizeof(struct backlight_properties));
> +	props.type = BACKLIGHT_RAW; /* ensure this bd is last to be picked */
> +	props.max_brightness = 255;
> +	bd = backlight_device_register("asus_screenpad",
> +				       &asus->platform_device->dev, asus,
> +				       &asus_screenpad_bl_ops, &props);
> +	if (IS_ERR(bd)) {
> +		pr_err("Could not register backlight device\n");
> +		return PTR_ERR(bd);
> +	}
> +
> +	asus->screenpad_backlight_device = bd;
> +	asus->driver->screenpad_brightness = brightness;
> +	bd->props.brightness = brightness;
> +	bd->props.power = power;
> +	backlight_update_status(bd);
> +
> +	return 0;
> +}
> +
> +static void asus_screenpad_exit(struct asus_wmi *asus)
> +{
> +	backlight_device_unregister(asus->screenpad_backlight_device);
> +
> +	asus->screenpad_backlight_device = NULL;
> +}
> +
>  /* Fn-lock ********************************************************************/
>  
>  static bool asus_wmi_has_fnlock_key(struct asus_wmi *asus)
> @@ -4504,6 +4623,12 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	} else if (asus->driver->quirks->wmi_backlight_set_devstate)
>  		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
>  
> +	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT)) {
> +		err = asus_screenpad_init(asus);
> +		if (err && err != -ENODEV)
> +			goto fail_screenpad;
> +	}
> +
>  	if (asus_wmi_has_fnlock_key(asus)) {
>  		asus->fnlock_locked = fnlock_default;
>  		asus_wmi_fnlock_update(asus);
> @@ -4527,6 +4652,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	asus_wmi_backlight_exit(asus);
>  fail_backlight:
>  	asus_wmi_rfkill_exit(asus);
> +fail_screenpad:
> +	asus_screenpad_exit(asus);
>  fail_rfkill:
>  	asus_wmi_led_exit(asus);
>  fail_leds:
> @@ -4553,6 +4680,7 @@ static int asus_wmi_remove(struct platform_device *device)
>  	asus = platform_get_drvdata(device);
>  	wmi_remove_notify_handler(asus->driver->event_guid);
>  	asus_wmi_backlight_exit(asus);
> +	asus_screenpad_exit(asus);
>  	asus_wmi_input_exit(asus);
>  	asus_wmi_led_exit(asus);
>  	asus_wmi_rfkill_exit(asus);
> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
> index a478ebfd34df..5fbdd0eafa02 100644
> --- a/drivers/platform/x86/asus-wmi.h
> +++ b/drivers/platform/x86/asus-wmi.h
> @@ -57,6 +57,7 @@ struct quirk_entry {
>  struct asus_wmi_driver {
>  	int			brightness;
>  	int			panel_power;
> +	int			screenpad_brightness;
>  	int			wlan_ctrl_by_user;
>  
>  	const char		*name;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index d17ae2eb0f8d..61ba70b32846 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -58,6 +58,10 @@
>  #define ASUS_WMI_DEVID_KBD_BACKLIGHT	0x00050021
>  #define ASUS_WMI_DEVID_LIGHT_SENSOR	0x00050022 /* ?? */
>  #define ASUS_WMI_DEVID_LIGHTBAR		0x00050025
> +/* This can only be used to disable the screen, not re-enable */
> +#define ASUS_WMI_DEVID_SCREENPAD_POWER	0x00050031
> +/* Writing a brightness re-enables the screen if disabled */
> +#define ASUS_WMI_DEVID_SCREENPAD_LIGHT	0x00050032
>  #define ASUS_WMI_DEVID_FAN_BOOST_MODE	0x00110018
>  #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY 0x00120075
>  

