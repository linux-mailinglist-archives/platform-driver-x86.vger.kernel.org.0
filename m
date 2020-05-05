Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFB561C5176
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 11:01:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgEEJBf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 05:01:35 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:51155 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728220AbgEEJBf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 05:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588669293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IPhCYjiTeLLHCTtCaxs/pLqAuH9T1e39OMm2M2JFXk8=;
        b=BgV+Do1QgXn/AfLh4K9sC8GP+o5LWg5+ydaEpPSl17bSnTziaF2CKcCfpLX7ttyMAkfU46
        j9Ti8Et4Sqks6HUhjuvq04TigCKqRhNE9CPc/j0PTP/vTTNGrsBOnYLfmNNdhtxonIJuRJ
        CDAHl8kTG1igaB3GuE7gmpRv6sQGFps=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18--N59iPhYNcaDOde38Kf1xg-1; Tue, 05 May 2020 05:01:32 -0400
X-MC-Unique: -N59iPhYNcaDOde38Kf1xg-1
Received: by mail-wr1-f72.google.com with SMTP id u4so890046wrm.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 02:01:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IPhCYjiTeLLHCTtCaxs/pLqAuH9T1e39OMm2M2JFXk8=;
        b=Otglht0jDe2mYB2CNBi9fe8KwlQf/i1BEP39BmliOj/E7YFdIL6PU3iknTOcv3kSGe
         KETUi3x+P6WUBC8Qw8s6STopYv7A7cokWrt+IHjENI9F6r3LCljGpeQiaH8zwo96Oyct
         wQhbUk2BmXjqIMqxaAMTpKyhnlQZTjVBGS8SrLLJABRT1DU84GtpbthYKQY9R1mA0sYj
         mg0liaZzC93LyuTQHO6POsogvhhyAIZQp4afzSZyTquPcICbkxkXwVIt9FGu37mxrbkz
         jRHzaDvCJOU+Xph1bqhc2fdhs4WjnGl1SSrqnS7oGHnI4aDU65mJYrLmCIn8670b0mY8
         mVUA==
X-Gm-Message-State: AGi0Pua9ZkEhirQlGoCzTt22zebKYejfx6QQ7kmYL2lcReRy1tuxns6q
        QbmYZmF6E/ngac7oDxSZ5Fhzy+WF4MrECugcTcKgLv094kycc1CJqLt7vF/WL0aaqsuoUQegPXp
        6fRHDc6EMBI0HRdc7QDWs23oSsiB1eHtckg==
X-Received: by 2002:a1c:b757:: with SMTP id h84mr2126099wmf.188.1588669290190;
        Tue, 05 May 2020 02:01:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ0INk+InK9oVb+xfbvS9taXyigMNvZ3z550//uQsEFsFbakL6B8y+lyoZkcehjy9V66+kaaQ==
X-Received: by 2002:a1c:b757:: with SMTP id h84mr2126081wmf.188.1588669289992;
        Tue, 05 May 2020 02:01:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id q8sm2262727wrp.58.2020.05.05.02.01.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 02:01:28 -0700 (PDT)
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
To:     Randy Dunlap <rdunlap@infradead.org>, Andrew Dunai <a@dun.ai>,
        linux-kernel@vger.kernel.org,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
References: <20200504164514.18641-1-a@dun.ai>
 <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f4aeeb2c-32c4-e2a8-193e-2b4d892da4db@redhat.com>
Date:   Tue, 5 May 2020 11:01:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <72bd44ab-98a8-0cdc-b7e6-104a69ca3643@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/4/20 8:20 PM, Randy Dunlap wrote:
> Hi,
> 
> Usually you need to send patches to a maintainer who could then
> merge/apply them.

 From a code point-of-view this looks good to me.

Andrew, if you can resend this to the proper folks (including me)
with a proper Signed-off-by (*), then this should be ready for merging.

Regards,

Hans


*) that might have already been there, but it wasn't present in
the part quoted by Randy



> On 5/4/20 9:45 AM, Andrew Dunai wrote:
>> ---
>>   drivers/platform/x86/touchscreen_dmi.c | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>
>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
>> index 93177e6e5..a3ab19ab0 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -640,6 +640,20 @@ static const struct ts_dmi_data trekstor_surftab_wintron70_data = {
>>   	.properties	= trekstor_surftab_wintron70_props,
>>   };
>>   
>> +static const struct property_entry vinga_twizzle_j116_props[] = {
>> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1920),
>> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1280),
>> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-vinga-twizzle_j116.fw"),
>> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>> +	PROPERTY_ENTRY_BOOL("silead,home-button"),
>> +	{ }
>> +};
>> +
>> +static const struct ts_dmi_data vinga_twizzle_j116_data = {
>> +	.acpi_name	= "MSSL1680:00",
>> +	.properties	= vinga_twizzle_j116_props,
>> +};
>> +
>>   /* NOTE: Please keep this table sorted alphabetically */
>>   static const struct dmi_system_id touchscreen_dmi_table[] = {
>>   	{
>> @@ -1054,6 +1068,13 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>>   			DMI_MATCH(DMI_PRODUCT_NAME, "Y8W81"),
>>   		},
>>   	},
>> +	{
>> +		/* Vinga Twizzle J116 */
>> +		.driver_data = (void *)&vinga_twizzle_j116_data,
>> +		.matches = {
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "VINGA Twizzle J116"),
>> +		},
>> +	},
>>   	{ },
>>   };
>>   
>>
> 
> thanks.
> 

