Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD964587B5C
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Aug 2022 13:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236811AbiHBLJm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Aug 2022 07:09:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236752AbiHBLJl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 07:09:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 89C0348E8A
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 04:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659438579;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6BifT43D9freggl3HgwGtguwbmiNbluqDwwULzzJtpQ=;
        b=IzYz6VSSBCnWfYgCSj0BmhcDoFHmb5RPYLModdgsyH0u9PFBqfkXA4h/jVNAv6U5Hl5I3o
        7EwnJBlP5HS3VeDA7zjPgbNV/+M909tR4Y0F7V1AuP1MuGKPk4QQ5OH1H1ZPipThGEYZ6H
        8hb0GsI7wWUjQ816lxYJAQJQqW4hSZQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-573-7NTbRAFiPImVo1nT6LZ_Cw-1; Tue, 02 Aug 2022 07:09:38 -0400
X-MC-Unique: 7NTbRAFiPImVo1nT6LZ_Cw-1
Received: by mail-ed1-f71.google.com with SMTP id o2-20020a056402438200b0043d552deb2aso5149412edc.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 04:09:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=6BifT43D9freggl3HgwGtguwbmiNbluqDwwULzzJtpQ=;
        b=1bvF3x/o9ZFXwLh5u/Td2Vs8aj2GHVs+F541q5cQLRzRXGfc63R+Wb14fkAJDH6h/i
         X8FX92MNOiwNroPsAB+/dlOak5MkA3IHOkNCw4LElL3VNz/TxOigQitopRzt9H+BST6G
         8bMsFt2w8QlLjEwjfuOrIYvlVJMUMiJc3kzqdH+zDhYIgXde/xegL3q4V2uF/h0gCHuL
         kwg7eyuvrLX4DFZPHwWo6K0yBiUuEe7pJ9zqaFcC26hSWIaylHxjQ3z7NX2hDj2gLpY/
         4nT5nueOmMCQh5n+PNhLtEYqX8YR+8SE/MMJQkv8SpdH9AFVy5B4DU0f9bqXw/WJyPYb
         0XAg==
X-Gm-Message-State: AJIora/rCHDvgkqJR29Opm1ow134GTcvKrTjTuTn4s+oPxaY9TAvmkhd
        hXb+k583haZmZLyRS+CV4li9rjcSa/lu2J9CED+e25TpUxD1UFV01jH9txmDszbHvXNYZI9hUZg
        HMVAv7ztuvXfHVY+ZrlVz8fYPe0SSoZQdXA==
X-Received: by 2002:a17:906:7482:b0:722:edf9:e72f with SMTP id e2-20020a170906748200b00722edf9e72fmr15625726ejl.92.1659438577254;
        Tue, 02 Aug 2022 04:09:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uq2ekdaNit9efw2ckO/parj6gVLp//Nsu4D/ZPzj6dYKWh7G3lCW04SG2a2ByGFq4LcDNNNA==
X-Received: by 2002:a17:906:7482:b0:722:edf9:e72f with SMTP id e2-20020a170906748200b00722edf9e72fmr15625713ejl.92.1659438577031;
        Tue, 02 Aug 2022 04:09:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k19-20020aa7c393000000b0043bbcd94ee4sm8071099edq.51.2022.08.02.04.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 04:09:36 -0700 (PDT)
Message-ID: <e6c0ca61-97d3-328b-f50e-7cdac50eb083@redhat.com>
Date:   Tue, 2 Aug 2022 13:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] asus-wmi: Add support for TUF laptop keyboard RGB
Content-Language: en-US
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, markgross@kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20220802045942.1565559-1-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802045942.1565559-1-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Luke,

On 8/2/22 06:59, Luke D. Jones wrote:
> Adds support for TUF laptop RGB control. This creates two sysfs
> paths to add control of basic keyboard LEDs, and power states.
> 
> /sys/devices/platform/asus-nb-wmi/tuf_krgb_mode has the following
> as input options via U8 "n n n n n n":
> - Save or set, if set, then settings revert on cold boot
> - Mode, 0-8 for regular modes (if supported), 10-12 for "warning" styles
> - Red, 0-255
> - Green, 0-255
> - Blue, 0-255
> - Speed, 0 = Slow, 1 = Medium, 2 = Fast
> 
> /sys/devices/platform/asus-nb-wmi/tuf_krgb_state has the following
> as input options via boolean "b b b b b":
> - Save or set, if set, then settings revert on cold boot
> - Boot, if true, the keyboard displays animation on boot
> - Awake, if true, the keyboard LED's are on while device is awake
> - Sleep, if true, the keyboard shows animation while device is suspended
> - Keybaord, appears to have no effect

Typo in Keybaord here.

Thank you for your patch. I really appreciate your continued
efforts to make Asus laptops work well with Linux.

For keyboard backlight support Linux has standardized on
using the /sys/class/leds API. So I'm afraid that this patch
will need to be rewritten to use the standard LED API
and then specifically the somewhat new multicolor LED API
at least for setting the RGB values (within the current mode)

Any extra functionality can then be added as extra sysfs
attributes under the /sys/class/leds/asus::kbd_backlight
device, see e.g. the use of kbd_led_groups in:
drivers/platform/x86/dell/dell-laptop.c

Note the kbd_backlight part of the name is important this
will allow upower to recognize this as a keyboard backlight
and will then enable desktop-environments which use
upower for kbd backlight control to at least control
the overall brightness of the kbd-backlight.

I realize that this means that you need to redo a whole
bunch of work here; and I presume also in your
asusctl userspace utility, sorry about that. But it
really is important that standard userspace APIs are
used for things like this where ever possible.

Regards,

Hans




> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 168 +++++++++++++++++++++
>  include/linux/platform_data/x86/asus-wmi.h |   6 +
>  2 files changed, 174 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 62ce198a3463..09277bd98249 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -234,6 +234,9 @@ struct asus_wmi {
>  	bool dgpu_disable_available;
>  	bool dgpu_disable;
>  
> +	bool tuf_kb_rgb_mode_available;
> +	bool tuf_kb_rgb_state_available;
> +
>  	bool throttle_thermal_policy_available;
>  	u8 throttle_thermal_policy_mode;
>  
> @@ -734,6 +737,153 @@ static ssize_t egpu_enable_store(struct device *dev,
>  
>  static DEVICE_ATTR_RW(egpu_enable);
>  
> +/* TUF Laptop Keyboard RGB Modes **********************************************/
> +static int tuf_kb_rgb_mode_check_present(struct asus_wmi *asus)
> +{
> +	u32 result;
> +	int err;
> +
> +	asus->tuf_kb_rgb_mode_available = false;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_TUF_RGB_MODE, &result);
> +	if (err) {
> +		if (err == -ENODEV)
> +			return 0;
> +		return err;
> +	}
> +
> +	if (result & ASUS_WMI_DSTS_PRESENCE_BIT)
> +		asus->tuf_kb_rgb_mode_available = true;
> +
> +	return 0;
> +}
> +
> +static ssize_t tuf_kb_rgb_mode_store(struct device *dev,
> +				 struct device_attribute *attr,
> +				 const char *buf, size_t count)
> +{
> +	int err;
> +	u32 ret;
> +	u8 res, tmp, arg_num;
> +	char *data, *part, *end;
> +	u8 cmd, mode, r, g,  b,  speed;
> +
> +	data = end = kstrdup(buf, GFP_KERNEL);
> +	cmd = mode = r = g = b = speed = arg_num = 0;
> +
> +	while ((part = strsep(&end, " ")) != NULL) {
> +		if (part == NULL)
> +			return -1;
> +
> +		res = kstrtou8(part, 10, &tmp);
> +		if (res)
> +			return -1;
> +
> +		if (arg_num == 0)
> +			// apply : set
> +			cmd = tmp == 1 ? 0xb5 : 0xb4;
> +		else if (arg_num == 1)
> +			// From 0-8 are valid modes with 10-12 being "warning"
> +			// style modes. All models have "pulse" mode 10.
> +			mode = (tmp <= 12 && tmp != 9) ? tmp : 10;
> +		else if (arg_num == 2)
> +			r = tmp;
> +		else if (arg_num == 3)
> +			g = tmp;
> +		else if (arg_num == 4)
> +			b = tmp;
> +		else if (arg_num == 5) {
> +			if (tmp == 0)
> +				speed = 0xe1;
> +			else if (tmp == 1)
> +				speed = 0xeb;
> +			else if (tmp == 2)
> +				speed = 0xf5;
> +		}
> +
> +		arg_num += 1;
> +	}
> +
> +	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS, ASUS_WMI_DEVID_TUF_RGB_MODE,
> +			cmd | (mode << 8) | (r << 16) | (g << 24), (b) | (speed << 8), &ret);
> +	if (err)
> +		return err;
> +
> +	kfree(data);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_WO(tuf_kb_rgb_mode);
> +
> +/* TUF Laptop Keyboard RGB States *********************************************/
> +static int tuf_kb_rgb_state_check_present(struct asus_wmi *asus)
> +{
> +	u32 result;
> +	int err;
> +
> +	asus->tuf_kb_rgb_state_available = false;
> +
> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_TUF_RGB_STATE, &result);
> +	if (err) {
> +		if (err == -ENODEV)
> +			return 0;
> +		return err;
> +	}
> +
> +	if (result & ASUS_WMI_DSTS_PRESENCE_BIT)
> +		asus->tuf_kb_rgb_state_available = true;
> +
> +	return 0;
> +}
> +
> +static ssize_t tuf_kb_rgb_state_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	int err;
> +	u32 ret;
> +	bool tmp;
> +	char *data, *part, *end;
> +	u8 save, flags, res, arg_num;
> +
> +	save = flags = arg_num = 0;
> +	data = end = kstrdup(buf, GFP_KERNEL);
> +
> +	while ((part = strsep(&end, " ")) != NULL) {
> +		if (part == NULL)
> +			return -1;
> +
> +		res = kstrtobool(part, &tmp);
> +		if (res)
> +			return -1;
> +
> +		if (tmp) {
> +			if (arg_num == 0) // save  :  set
> +				save = tmp == 0 ? 0x0100 : 0x0000;
> +			else if (arg_num == 1)
> +				flags |= 0x02; // boot
> +			else if (arg_num == 2)
> +				flags |= 0x08; // awake
> +			else if (arg_num == 3)
> +				flags |= 0x20; // sleep
> +			else if (arg_num == 4)
> +				flags |= 0x80; // keyboard
> +		}
> +
> +		arg_num += 1;
> +	}
> +
> +	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> +			ASUS_WMI_DEVID_TUF_RGB_STATE, 0xBD | save | (flags << 16), 0, &ret);
> +	if (err)
> +		return err;
> +
> +	kfree(data);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_WO(tuf_kb_rgb_state);
> +
>  /* Battery ********************************************************************/
>  
>  /* The battery maximum charging percentage */
> @@ -3258,6 +3408,8 @@ static struct attribute *platform_attributes[] = {
>  	&dev_attr_touchpad.attr,
>  	&dev_attr_egpu_enable.attr,
>  	&dev_attr_dgpu_disable.attr,
> +	&dev_attr_tuf_kb_rgb_mode.attr,
> +	&dev_attr_tuf_kb_rgb_state.attr,
>  	&dev_attr_lid_resume.attr,
>  	&dev_attr_als_enable.attr,
>  	&dev_attr_fan_boost_mode.attr,
> @@ -3286,6 +3438,12 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>  		devid = ASUS_WMI_DEVID_ALS_ENABLE;
>  	else if (attr == &dev_attr_egpu_enable.attr)
>  		ok = asus->egpu_enable_available;
> +	else if (attr == &dev_attr_tuf_kb_rgb_mode.attr)
> +		ok = asus->tuf_kb_rgb_mode_available;
> +	else if (attr == &dev_attr_tuf_kb_rgb_state.attr)
> +		ok = asus->tuf_kb_rgb_state_available;
> +	else if (attr == &dev_attr_dgpu_disable.attr)
> +		ok = asus->dgpu_disable_available;
>  	else if (attr == &dev_attr_dgpu_disable.attr)
>  		ok = asus->dgpu_disable_available;
>  	else if (attr == &dev_attr_fan_boost_mode.attr)
> @@ -3557,6 +3715,14 @@ static int asus_wmi_add(struct platform_device *pdev)
>  	if (err)
>  		goto fail_dgpu_disable;
>  
> +	err = tuf_kb_rgb_mode_check_present(asus);
> +	if (err)
> +		goto fail_tuf_kb_rgb_mode;
> +
> +	err = tuf_kb_rgb_state_check_present(asus);
> +	if (err)
> +		goto fail_tuf_kb_rgb_state;
> +
>  	err = fan_boost_mode_check_present(asus);
>  	if (err)
>  		goto fail_fan_boost_mode;
> @@ -3671,6 +3837,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>  fail_fan_boost_mode:
>  fail_egpu_enable:
>  fail_dgpu_disable:
> +fail_tuf_kb_rgb_mode:
> +fail_tuf_kb_rgb_state:
>  fail_platform:
>  fail_panel_od:
>  	kfree(asus);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index a571b47ff362..af4191fb0508 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -98,6 +98,12 @@
>  /* dgpu on/off */
>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>  
> +/* TUF laptop RGB modes/colours */
> +#define ASUS_WMI_DEVID_TUF_RGB_MODE	0x00100056
> +
> +/* TUF laptop RGB power/state */
> +#define ASUS_WMI_DEVID_TUF_RGB_STATE	0x00100057
> +
>  /* DSTS masks */
>  #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
>  #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002

