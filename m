Return-Path: <platform-driver-x86+bounces-3601-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 061728D31B1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2024 10:40:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 396AFB2CF24
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2024 08:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FED1169AC5;
	Wed, 29 May 2024 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HrhWza8o"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6585168C08
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2024 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716971164; cv=none; b=XUHM8M/9DivxkVZKN4Dko2Xq8u7RiGN3JNYUEQzqf85Gz3F4+HrLjjHtS1BgEqKCHoX8zmES0oyLjRIyk4N4kNpm00dIJ+A7FfD5FpOzMMUKqx/URoZqJldfubtLz7ccTt81zz95igy+FartbTR9+EyLo/nsVJohwEyrVOqvBDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716971164; c=relaxed/simple;
	bh=maqqJ321vS1Q/HzZGir5yobPXJZr7lA1Ng4amFP7X28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qm4db9dYYOJQY57Ruf+t2MBgd1MDrNEYv/MCZ8bg7pToQS+UOOuKM1x7/yitVaWLC7v755Ih+ann9wWNjKrkURQO9eJ2EmrR+iKOSJumUQ5/lmK5//2nzsIGDovAXSfnwpeubGgf4obC5lMIsrIt/0Jq1d+eQnXxg8D2fw14ivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HrhWza8o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716971161;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ex0wo237twTGf99DJGjL3pk6hkyV15tqf0p0Zq/CWKs=;
	b=HrhWza8oiCrb/x7fTcmNd5dkAIk//xuXMnglHIvgiL6DUoUNa7sTiZrmc6hAxGKdDZE28O
	b3+DqkJlo2GSV5KXbv6du9tLgd90PRCDk5hYIgj9lIKmiRr1dLgbpjTZCl6nO92rR1zfU9
	KMLdymOTea0KCReUmDH/OLMwNo6aOV0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-xx6RbmwLNaW6EO-fTAnI9A-1; Wed, 29 May 2024 04:26:00 -0400
X-MC-Unique: xx6RbmwLNaW6EO-fTAnI9A-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-578617a8335so785630a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2024 01:25:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716971158; x=1717575958;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ex0wo237twTGf99DJGjL3pk6hkyV15tqf0p0Zq/CWKs=;
        b=Tb78ZHqp23U0WnlaxhObhVBNXt/HJotDGqE2360CcL/XQFaA8/rPKYN567FzsiO+me
         6jkpj+rnv1T2YBSqaN80WxhSRppwneOD4iADRCTq5+7SjNmVA6nA9o1tOOImc3G+G+3A
         7tMDMsHsidgsYOM3q0mFAVjNH0s0HlAcikyy1wt2CwTji1sy1p9hdn+l3WJrxv2rVUtS
         cZfA8RVaei1kNyk+6g3qWeCmj8jOUSzxkBZ7mMy8KGNfwAiloUCCSMdocDig0xxM4I8W
         rMfegfDeH1Xm4y46TpTxGf1IkZpMuJhUo/EbVmsHNu2vzHIobAa2RA4yxZEOkbGv/fqj
         2lwg==
X-Forwarded-Encrypted: i=1; AJvYcCUbUR57U7L181EuCG+X9Ig78APzY4gzt7QqU6rAefrOe3inDfWieOdiSSvFkVnnSxzOAmCaz4LgRVmuSUVlsjDaXopdL2f6HUi+TUu2lqJrr8KOxA==
X-Gm-Message-State: AOJu0YyLoChpbmBdJpUHX8iYpjcCe58w9alFKxglVh8IxAhH7GvaGPrd
	0Yr4+SUGPUNrbbkllqrwU8ow4u+NUdWpNe3P+dRRXx4RAhVnU97RoYbhSAoDF3qtsoBZsYgsuwt
	oRENsTsDwD0Zp1P5C6S4D7cicL9292RNq4CgcCvtGSDqR4jmpeDfnkItuW1tvP0LKBuV5mSc0Xl
	8Aub4=
X-Received: by 2002:a50:bac3:0:b0:57a:349:85aa with SMTP id 4fb4d7f45d1cf-57a034986b1mr825035a12.24.1716971158801;
        Wed, 29 May 2024 01:25:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8T3RZXlC0XcAUFvXZ+bT26E3eEFOogyg9JpO9HOElMq6THGLh4RzzidPLFJ/iyXVMXKgKfg==
X-Received: by 2002:a50:bac3:0:b0:57a:349:85aa with SMTP id 4fb4d7f45d1cf-57a034986b1mr825010a12.24.1716971158277;
        Wed, 29 May 2024 01:25:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-579c3bbee4asm5197051a12.76.2024.05.29.01.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 May 2024 01:25:57 -0700 (PDT)
Message-ID: <ea85df16-53b4-4e25-b7c7-3f74486cdcf9@redhat.com>
Date: Wed, 29 May 2024 10:25:57 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] hid-asus: change the report_id used for HID LED
 control
To: "Luke D. Jones" <luke@ljones.dev>, jikos@kernel.org
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, bentiss@kernel.org
References: <20240529012827.146005-1-luke@ljones.dev>
 <20240529012827.146005-3-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240529012827.146005-3-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/29/24 3:28 AM, Luke D. Jones wrote:
> On some laptops the report_id used for LED brightness control must be
> 0x5D instead of 0x5A.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  drivers/hid/hid-asus.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 4cba8e143031..ec3556cc4eef 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -94,6 +94,8 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  
>  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>  
> +static const char * const use_alt_led_report_id[] = { "GU605", "GA403" };
> +
>  struct asus_kbd_leds {
>  	struct led_classdev cdev;
>  	struct hid_device *hdev;
> @@ -101,6 +103,7 @@ struct asus_kbd_leds {
>  	unsigned int brightness;
>  	spinlock_t lock;
>  	bool removed;
> +	int report_id;
>  };
>  
>  struct asus_touchpad_info {
> @@ -473,7 +476,7 @@ static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
>  static void asus_kbd_backlight_work(struct work_struct *work)
>  {
>  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> -	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
> +	u8 buf[] = { led->report_id, 0xba, 0xc5, 0xc4, 0x00 };
>  	int ret;
>  	unsigned long flags;
>  
> @@ -513,6 +516,23 @@ static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
>  	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
>  }
>  
> +static bool asus_kbd_is_input_led(void)
> +{
> +	const char *product;
> +	int i;
> +
> +	product = dmi_get_system_info(DMI_PRODUCT_NAME);
> +	if (!product)
> +		return false;
> +
> +	for (i = 0; i < ARRAY_SIZE(use_alt_led_report_id); i++) {
> +		if (strstr(product, use_alt_led_report_id[i]))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +


This again feels like you are re-inventing dmi_check_system() please
change use_alt_led_report_id to a dmi_system_id array and drop this
function (you can directly call dmi_check_system(use_alt_led_report_id)
instead).


>  static int asus_kbd_register_leds(struct hid_device *hdev)
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> @@ -555,6 +575,10 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!drvdata->kbd_backlight)
>  		return -ENOMEM;
>  
> +	drvdata->kbd_backlight->report_id = FEATURE_KBD_REPORT_ID;
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && asus_kbd_is_input_led())
> +		drvdata->kbd_backlight->report_id = FEATURE_KBD_LED_REPORT_ID1;
> +
>  	drvdata->kbd_backlight->removed = false;
>  	drvdata->kbd_backlight->brightness = 0;
>  	drvdata->kbd_backlight->hdev = hdev;

Regards,

Hans



