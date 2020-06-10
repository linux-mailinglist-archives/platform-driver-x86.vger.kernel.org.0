Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5059F1F5AB4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Jun 2020 19:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgFJRlR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 10 Jun 2020 13:41:17 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:46892 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726254AbgFJRlO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Jun 2020 13:41:14 -0400
Received: from mail-pl1-f197.google.com ([209.85.214.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <alex.hung@canonical.com>)
        id 1jj4is-0000hj-Eu
        for platform-driver-x86@vger.kernel.org; Wed, 10 Jun 2020 17:41:10 +0000
Received: by mail-pl1-f197.google.com with SMTP id o1so1923526plk.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2020 10:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nuT88j+Mklv7GLmEhalqmxpxwoOBOcrzhFFLKY+heTQ=;
        b=rBwRGn3kZodONu0UOcXQrOhJH793HziObhahJ/ZGUdzFBQ0xhMCr5not3R6VJo0s6g
         7Bnin38NLg9ROlI4LHvZlgEV1t7DzoZSD0MyzNHR3KUx36LIMGee36V3zcT5LWpBbJJ/
         22tUP//WyHgvUBUHeUPrSPX44TW47Y9kA9+A0heR/39BXUzwhYOkdttPb3s3aV89U4Ac
         d8CPfwAAm5iIJ2HROHX7qniub9XgLT9BbYCVXU1V9bTcuVngXhNP5Bt0mDXVQaFIXVKd
         n61RzVF9bMFSkjIIiXSC4g+MM8rLyR4GwLanhZ8NrGmUJFmmC7KBEXtuVII4fMz+t4hB
         UldQ==
X-Gm-Message-State: AOAM532Do4W0bRDV7fCCRO7qt5hmSG367OIlD3JjkgqFbRjf6ZqZT8Zx
        fpt8BE2erF87Lvh5e3fs3SFCMwnSLg1S6zULy24K1szW6WqiV884Wp98KrG7rxgXskkwkd54YtG
        iMwkjIUL55y+emCQdXuOauggF10oxYvtOLHArxYFITwHWZfvnReE=
X-Received: by 2002:a62:2545:: with SMTP id l66mr3606247pfl.12.1591810869131;
        Wed, 10 Jun 2020 10:41:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmMMfRw6JstLTtGTJmFoegbukw+1UJuJOa7bAjjumQCZGx+8xA+8diqIe7hIyigUaS2SBcGA==
X-Received: by 2002:a62:2545:: with SMTP id l66mr3606226pfl.12.1591810868767;
        Wed, 10 Jun 2020 10:41:08 -0700 (PDT)
Received: from [192.168.0.119] (d66-222-144-129.abhsia.telus.net. [66.222.144.129])
        by smtp.gmail.com with ESMTPSA id p16sm400985pgj.53.2020.06.10.10.41.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 10:41:07 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on HP
 platforms
To:     kai.heng.feng@canonical.com
Cc:     Mario.Limonciello@dell.com, dvhart@infradead.org,
        andy@infradead.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200610153747.27040-1-kai.heng.feng@canonical.com>
 <4d0714fe5e2548b6b638ea447ad19490@AUSX13MPC105.AMER.DELL.COM>
From:   Alex Hung <alex.hung@canonical.com>
Message-ID: <0affa00e-8a52-9e29-56d4-39dff952d736@canonical.com>
Date:   Wed, 10 Jun 2020 11:41:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <4d0714fe5e2548b6b638ea447ad19490@AUSX13MPC105.AMER.DELL.COM>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2020-06-10 9:49 a.m., Mario.Limonciello@dell.com wrote:
>> -----Original Message-----
>> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
>> owner@vger.kernel.org> On Behalf Of Kai-Heng Feng
>> Sent: Wednesday, June 10, 2020 10:38 AM
>> To: alex.hung@canonical.com
>> Cc: Kai-Heng Feng; Darren Hart; Andy Shevchenko; open list:INTEL HID EVENT
>> DRIVER; open list
>> Subject: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on HP
>> platforms
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Wireless hotkey on HP platforms can trigger two events, if both
>> hp-wireless and intel-hid are supported. Two events at the same time
>> renders wireless hotkey useless.
>>
>> HP confirmed that hp-wireless (HPQ6001) should always be the canonical
>> source of wireless hotkey event, so skip registering rfkill hotkey if
>> HPQ6001 is present.
>>
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>>  drivers/platform/x86/intel-hid.c | 31 ++++++++++++++++++++++++++++++-
>>  1 file changed, 30 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-
>> hid.c
>> index 9ee79b74311c..31091c8faf70 100644
>> --- a/drivers/platform/x86/intel-hid.c
>> +++ b/drivers/platform/x86/intel-hid.c
>> @@ -25,6 +25,8 @@ static const struct acpi_device_id intel_hid_ids[] = {
>>  };
>>  MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
>>
>> +static bool hp_wireless_present;
>> +
>>  /* In theory, these are HID usages. */
>>  static const struct key_entry intel_hid_keymap[] = {
>>  	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
>> @@ -49,6 +51,29 @@ static const struct key_entry intel_hid_keymap[] = {
>>  	{ KE_END },
>>  };
>>
>> +static const struct key_entry intel_hid_no_rfkill_keymap[] = {
>> +	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
>> +	/* 2: Toggle SW_ROTATE_LOCK -- easy to implement if seen in wild */
>> +	{ KE_KEY, 3, { KEY_NUMLOCK } },
>> +	{ KE_KEY, 4, { KEY_HOME } },
>> +	{ KE_KEY, 5, { KEY_END } },
>> +	{ KE_KEY, 6, { KEY_PAGEUP } },
>> +	{ KE_KEY, 7, { KEY_PAGEDOWN } },
>> +	/* 8: rfkill -- use hp-wireless instead */
>> +	{ KE_KEY, 9, { KEY_POWER } },
>> +	{ KE_KEY, 11, { KEY_SLEEP } },
>> +	/* 13 has two different meanings in the spec -- ignore it. */
>> +	{ KE_KEY, 14, { KEY_STOPCD } },
>> +	{ KE_KEY, 15, { KEY_PLAYPAUSE } },
>> +	{ KE_KEY, 16, { KEY_MUTE } },
>> +	{ KE_KEY, 17, { KEY_VOLUMEUP } },
>> +	{ KE_KEY, 18, { KEY_VOLUMEDOWN } },
>> +	{ KE_KEY, 19, { KEY_BRIGHTNESSUP } },
>> +	{ KE_KEY, 20, { KEY_BRIGHTNESSDOWN } },
>> +	/* 27: wake -- needs special handling */
>> +	{ KE_END },
>> +};
>> +
>>  /* 5 button array notification value. */
>>  static const struct key_entry intel_array_keymap[] = {
>>  	{ KE_KEY,    0xC2, { KEY_LEFTMETA } },                /* Press */
>> @@ -317,7 +342,8 @@ static int intel_hid_input_setup(struct platform_device
>> *device)
>>  	if (!priv->input_dev)
>>  		return -ENOMEM;
>>
>> -	ret = sparse_keymap_setup(priv->input_dev, intel_hid_keymap, NULL);
>> +	ret = sparse_keymap_setup(priv->input_dev, hp_wireless_present ?
>> +			intel_hid_no_rfkill_keymap : intel_hid_keymap, NULL);
>>  	if (ret)
>>  		return ret;
>>
>> @@ -575,6 +601,9 @@ check_acpi_dev(acpi_handle handle, u32 lvl, void
>> *context, void **rv)
>>  			dev_info(&dev->dev,
>>  				 "intel-hid: created platform device\n");
>>
>> +	if (!strcmp(acpi_device_hid(dev), "HPQ6001"))
>> +		hp_wireless_present = true;

(Resend with format removed)

This can impact all HP systems that do not have this problem. How about
a DMI quirk that is limited to this particular system?


> 
> Just having the ACPI device present doesn't actually mean that the user
> has a kernel compiled with hp-wireless or that it has finished initializing.
> 
> I would think this needs a better handshake in case hp-wireless was unloaded
> or not present so the event could still come through intel-hid in this
> circumstance.
> 
>> +
>>  	return AE_OK;
>>  }
>>
>> --
>> 2.17.1
> 


-- 
Cheers,
Alex Hung
