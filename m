Return-Path: <platform-driver-x86+bounces-2913-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27148AA955
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Apr 2024 09:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9E3C284534
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Apr 2024 07:38:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D78547F5F;
	Fri, 19 Apr 2024 07:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BE6cdGDa"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0D14314E
	for <platform-driver-x86@vger.kernel.org>; Fri, 19 Apr 2024 07:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713512286; cv=none; b=jkYaAFzL3pZlITbqRr8jKKUJ9mVjFrquMmHEIUYao4/CbpdVbdFwio78VFPixWQjXTdIMQrLu5ITxu0+MT0rKLQc1L/j2el5ZuFglyc1XYmDAoUFpOr6JsB3gaE9vQyIH6N78oWkOGTrip7E69wp7cbajVS9lJAirnUaWG1eMcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713512286; c=relaxed/simple;
	bh=7fD3EoRJQ+AUypWDyDAJC5MK5RRDCn3H14XrG+wYpa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ch9mavWngjG/aYgzSPbgcQHUDrvZ868aKNVtctBFsW6JksGMvAZ92/S2/c2b4e/BivkflbgOvtEHq0GPQXm4mJDviufOGfP/WnnktAYbgZeDeeUSrBR1OgZQnGY9uN99WFcuDHm4yz84ZHKh6uBz+VW/tGvuhEzHxzhyuxk9qn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BE6cdGDa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713512283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzs0BM/PIa8R3H5Lga0McIN+1+rjmLVBUvUNByupKeI=;
	b=BE6cdGDajTafTnLxuMk31NYIubs1aJhxlGgGetcGAXz8lCiKWn6gtZBEpf7fv8V/VamVC8
	oPoUILzD8wf1h/EmVetGWK42Aw2JiMQOuU1smYdHcy3/eS2xi8sTunA8+X//r0W5QTYhc+
	pXwF7ySMShRVBtNXvK84Zc+UQAn40EM=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-ZZm24fsdMZKmKwpEbeT59Q-1; Fri, 19 Apr 2024 03:38:00 -0400
X-MC-Unique: ZZm24fsdMZKmKwpEbeT59Q-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-51978c8a4f6so1254556e87.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Apr 2024 00:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713512278; x=1714117078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yzs0BM/PIa8R3H5Lga0McIN+1+rjmLVBUvUNByupKeI=;
        b=VfHA+wZdhSidUD7WvVH1E8/yj8W8bajvvaqqB+nGUxKiA2kZp78N/33RxAD5uDV3Cy
         Pivvn1DvxVED+tLJPd1CFNB2f1GIcIMgnElIv5SXHYenmo3eDgrxQhA2Kyq8yTsWb6H1
         qh3ktKW6FgO6kjO67ksI1p36lR4QQA0dOJA64gcI2BCn1EDyaBmvLTOIq86gWGZ4xOVF
         mLIhpzsr1bQ7AGblrz+enrGklWx6ignmX8HIvuQfLFtcv9BQMdkcW2SfxbyIGXELnrAb
         W6x0Yd1VTHPXNjHLBEl7NynOyj01jxh7PSibBS3CVlopXOMK2/R2zQ3zKkjNnz+/o4Gp
         xGow==
X-Forwarded-Encrypted: i=1; AJvYcCWzvfyDHITawAmeACzNAokXbGZeYDeJ+U8UmyfcOeQOSG65GTmjQ7aNgIbVyGrhRMM7mByVMXGMnwDiW3LvSv9fW8QduyUrmz+pA15k8uWtpNTdcQ==
X-Gm-Message-State: AOJu0Ywl0JHBnqiiejii5Dpta3LuO+k5EEGDYrCOD/CDVUeL+QjLy9tD
	gX9nRaGPsjep0dKU3pWH50kkOCL6Gmy6T5PmQfU9xDrNt93adOw+Cldvxwa94NXwBUNfqnIxlST
	EYrsUVePC3wpqL++bS9bdIkIVZvedjcJtadmgB6xT3YUqdSx4cyL+f6m/2sZXcya/Ex7nH0LuwN
	4dRyg=
X-Received: by 2002:a05:6512:208b:b0:51a:bebb:68ee with SMTP id t11-20020a056512208b00b0051abebb68eemr518550lfr.7.1713512278413;
        Fri, 19 Apr 2024 00:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYaJsY3Z9ostW7+zfwJkHmwfLB1aQfF+0QG/D/UiRd4w+fbLU/zSdzyB1oiHAHWrvcnsRnUw==
X-Received: by 2002:a05:6512:208b:b0:51a:bebb:68ee with SMTP id t11-20020a056512208b00b0051abebb68eemr518536lfr.7.1713512277863;
        Fri, 19 Apr 2024 00:37:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id x1-20020a056402414100b00571bc3bb70csm1631426eda.87.2024.04.19.00.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 00:37:57 -0700 (PDT)
Message-ID: <a9e8759e-4d30-4923-bcfd-4cd133fe950d@redhat.com>
Date: Fri, 19 Apr 2024 09:37:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/5] power: supply: power-supply-leds: Add
 charging_orange_full_green trigger for RGB LED
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kate Hsuan <hpa@redhat.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 linux-pm@vger.kernel.org
References: <20240416053909.256319-1-hpa@redhat.com>
 <20240416053909.256319-5-hpa@redhat.com>
 <sjhe7jvzvrlthf42lipnsnooh3z7vczdcruupsbstmpiujprze@jxwc3lquzvki>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <sjhe7jvzvrlthf42lipnsnooh3z7vczdcruupsbstmpiujprze@jxwc3lquzvki>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/18/24 2:34 PM, Sebastian Reichel wrote:
> Hi,
> 
> On Tue, Apr 16, 2024 at 01:39:08PM +0800, Kate Hsuan wrote:
>> Add a charging_orange_full_green LED trigger and the trigger is based on
>> led_mc_trigger_event() which can set an RGB LED when the trigger is
>> triggered. The LED will show orange when the battery status is charging.
>> The LED will show green when the battery status is full.
>>
>> Link: https://lore.kernel.org/linux-leds/f40a0b1a-ceac-e269-c2dd-0158c5b4a1ad@gmail.com/
>>
>> Signed-off-by: Kate Hsuan <hpa@redhat.com>
>> ---
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

Thanks. Does this mean your ok with routing this change through the LED tree
together with the 2 LED core patches adding the new led_mc_trigger_event()
function this uses ?

Regards,

Hans




> -- Sebastian
> 
>>  drivers/power/supply/power_supply_leds.c | 26 ++++++++++++++++++++++++
>>  include/linux/power_supply.h             |  2 ++
>>  2 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/power/supply/power_supply_leds.c b/drivers/power/supply/power_supply_leds.c
>> index c7db29d5fcb8..8dd99199c65b 100644
>> --- a/drivers/power/supply/power_supply_leds.c
>> +++ b/drivers/power/supply/power_supply_leds.c
>> @@ -22,6 +22,9 @@
>>  static void power_supply_update_bat_leds(struct power_supply *psy)
>>  {
>>  	union power_supply_propval status;
>> +	unsigned int intensity_green[3] = {255, 0, 0};
>> +	unsigned int intensity_orange[3] = {128, 0, 255};
>> +	unsigned int intensity_red[3] = {0, 0, 255};
>>  
>>  	if (power_supply_get_property(psy, POWER_SUPPLY_PROP_STATUS, &status))
>>  		return;
>> @@ -36,12 +39,20 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
>>  		/* Going from blink to LED on requires a LED_OFF event to stop blink */
>>  		led_trigger_event(psy->charging_blink_full_solid_trig, LED_OFF);
>>  		led_trigger_event(psy->charging_blink_full_solid_trig, LED_FULL);
>> +		led_mc_trigger_event(psy->charging_orange_full_green_trig,
>> +				     intensity_green,
>> +				     ARRAY_SIZE(intensity_green),
>> +				     LED_FULL);
>>  		break;
>>  	case POWER_SUPPLY_STATUS_CHARGING:
>>  		led_trigger_event(psy->charging_full_trig, LED_FULL);
>>  		led_trigger_event(psy->charging_trig, LED_FULL);
>>  		led_trigger_event(psy->full_trig, LED_OFF);
>>  		led_trigger_blink(psy->charging_blink_full_solid_trig, 0, 0);
>> +		led_mc_trigger_event(psy->charging_orange_full_green_trig,
>> +				     intensity_orange,
>> +				     ARRAY_SIZE(intensity_orange),
>> +				     LED_FULL);
>>  		break;
>>  	default:
>>  		led_trigger_event(psy->charging_full_trig, LED_OFF);
>> @@ -49,6 +60,10 @@ static void power_supply_update_bat_leds(struct power_supply *psy)
>>  		led_trigger_event(psy->full_trig, LED_OFF);
>>  		led_trigger_event(psy->charging_blink_full_solid_trig,
>>  			LED_OFF);
>> +		led_mc_trigger_event(psy->charging_orange_full_green_trig,
>> +				     intensity_red,
>> +				     ARRAY_SIZE(intensity_red),
>> +				     LED_OFF);
>>  		break;
>>  	}
>>  }
>> @@ -74,6 +89,11 @@ static int power_supply_create_bat_triggers(struct power_supply *psy)
>>  	if (!psy->charging_blink_full_solid_trig_name)
>>  		goto charging_blink_full_solid_failed;
>>  
>> +	psy->charging_orange_full_green_trig_name = kasprintf(GFP_KERNEL,
>> +		"%s-charging-orange-full-green", psy->desc->name);
>> +	if (!psy->charging_orange_full_green_trig_name)
>> +		goto charging_red_full_green_failed;
>> +
>>  	led_trigger_register_simple(psy->charging_full_trig_name,
>>  				    &psy->charging_full_trig);
>>  	led_trigger_register_simple(psy->charging_trig_name,
>> @@ -82,9 +102,13 @@ static int power_supply_create_bat_triggers(struct power_supply *psy)
>>  				    &psy->full_trig);
>>  	led_trigger_register_simple(psy->charging_blink_full_solid_trig_name,
>>  				    &psy->charging_blink_full_solid_trig);
>> +	led_trigger_register_simple(psy->charging_orange_full_green_trig_name,
>> +				    &psy->charging_orange_full_green_trig);
>>  
>>  	return 0;
>>  
>> +charging_red_full_green_failed:
>> +	kfree(psy->charging_blink_full_solid_trig_name);
>>  charging_blink_full_solid_failed:
>>  	kfree(psy->full_trig_name);
>>  full_failed:
>> @@ -101,10 +125,12 @@ static void power_supply_remove_bat_triggers(struct power_supply *psy)
>>  	led_trigger_unregister_simple(psy->charging_trig);
>>  	led_trigger_unregister_simple(psy->full_trig);
>>  	led_trigger_unregister_simple(psy->charging_blink_full_solid_trig);
>> +	led_trigger_unregister_simple(psy->charging_orange_full_green_trig);
>>  	kfree(psy->charging_blink_full_solid_trig_name);
>>  	kfree(psy->full_trig_name);
>>  	kfree(psy->charging_trig_name);
>>  	kfree(psy->charging_full_trig_name);
>> +	kfree(psy->charging_orange_full_green_trig_name);
>>  }
>>  
>>  /* Generated power specific LEDs triggers. */
>> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
>> index c0992a77feea..9b6898085224 100644
>> --- a/include/linux/power_supply.h
>> +++ b/include/linux/power_supply.h
>> @@ -318,6 +318,8 @@ struct power_supply {
>>  	char *online_trig_name;
>>  	struct led_trigger *charging_blink_full_solid_trig;
>>  	char *charging_blink_full_solid_trig_name;
>> +	struct led_trigger *charging_orange_full_green_trig;
>> +	char *charging_orange_full_green_trig_name;
>>  #endif
>>  };
>>  
>> -- 
>> 2.44.0
>>
>>


