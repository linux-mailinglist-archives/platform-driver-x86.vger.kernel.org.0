Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A4D6751038
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jul 2023 20:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjGLSFY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Jul 2023 14:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229584AbjGLSFX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 14:05:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F08719BC
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 11:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689185078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XrM8V2nTqEKoD6tNOcsWUWtJVg/lAOl6/KUsLXpFaTQ=;
        b=HV+eClFXiygA+/SSqqhswonirKdqVDxgqXG3MqVtZSHNwU74NSGKUPy032KK1kcGxWvsze
        uS22talny29c+D4OxrI/ycO1ZWAg+LjQBNdTC20Z1NNL8w8Qb0NKk7LAbkPdm4CkAHmWob
        EvPYgmqFTU6MVam2Ew7a7l8r2utMBXo=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-1ypi_OX7OlmqBF4Zk-PW6w-1; Wed, 12 Jul 2023 14:04:37 -0400
X-MC-Unique: 1ypi_OX7OlmqBF4Zk-PW6w-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-518676b6d09so4240172a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 11:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185075; x=1691777075;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XrM8V2nTqEKoD6tNOcsWUWtJVg/lAOl6/KUsLXpFaTQ=;
        b=a5GYhJkdRkev9rXuPVeyIxTvhh/N4Zn0AVbInndEQJvBVNk8YYSgbfIsPmKmA4ue+j
         NrmbULR3UGcW8umXBmCA5QxK0PTvIUtWyppGrMeesTsS7eJw6WxClbnB7tUhwbJQoTmA
         YkoGztovSAe5ONO/xdkT55vGtJIGqAqRejsik9Ra1YI434F78c8NzDV/4JgIy9xwcARb
         ZGPzqdBnyQaVrg2KMtdjhKTlAOm2FToS6hyTrfPhkXMAhpslz2iwdbXphOVRn8IYXooF
         GWTxb2csuPJAgAsvhPVn4+ydOga49cMP5pVBYWtH2CWJfrmeYyThw5J5e3FWaxGoka6Y
         I3ZQ==
X-Gm-Message-State: ABy/qLbHMQqLSEYzbSIvC4r1z/iXfsg5YRwMTTL8x3ApH8IEaMgSj5Hy
        NjrzAioozV4c9gEvB6jFRcZoMWBEzgTUiPnO3V1M1OvLNQLup0FbtbNekBffQh/A5KwRrhFtBDk
        CkmyUrV4U84T9F0jVN2aBRF4l6MALjCzDQw==
X-Received: by 2002:aa7:cd92:0:b0:516:81d3:2627 with SMTP id x18-20020aa7cd92000000b0051681d32627mr21568186edv.0.1689185075745;
        Wed, 12 Jul 2023 11:04:35 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGQF8tan2ib1k2jPJBqdtHWvgv0LI1Z32eqJ1oayADi/wz/Opnd5CDBNCARwyVPRrNGl7rTmQ==
X-Received: by 2002:aa7:cd92:0:b0:516:81d3:2627 with SMTP id x18-20020aa7cd92000000b0051681d32627mr21568171edv.0.1689185075427;
        Wed, 12 Jul 2023 11:04:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y19-20020aa7ccd3000000b0051dd4daf13fsm3096616edt.30.2023.07.12.11.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 11:04:34 -0700 (PDT)
Message-ID: <262060af-2c66-05c0-fbe4-cb452d807638@redhat.com>
Date:   Wed, 12 Jul 2023 20:04:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] platform/x86: simatic-ipc: add auto-loading of hwmon
 modules
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tobias Schaffner <tobias.schaffner@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>
References: <20230711120842.30044-1-henning.schild@siemens.com>
 <20230711120842.30044-3-henning.schild@siemens.com>
 <20230712092147.061009b2@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230712092147.061009b2@md1za8fc.ad001.siemens.net>
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

Hi,

On 7/12/23 09:21, Henning Schild wrote:
> Am Tue, 11 Jul 2023 14:08:42 +0200
> schrieb Henning Schild <henning.schild@siemens.com>:
> 
>> In order to know which hwmon modules to load one would have to usually
>> first probe from user-land i.e. with sensors-detect and create a
>> config for each machine. But here we know exactly what machines we
>> are dealing with, so we can request those howmon modules without
>> user-mode detection and config files.
>>
>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
>> ---
>>  drivers/platform/x86/simatic-ipc.c | 17 +++++++++++++++++
>>  1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/platform/x86/simatic-ipc.c
>> b/drivers/platform/x86/simatic-ipc.c index 71487216d33f..403dc231bef7
>> 100644 --- a/drivers/platform/x86/simatic-ipc.c
>> +++ b/drivers/platform/x86/simatic-ipc.c
>> @@ -153,6 +153,21 @@ static int register_platform_devices(u32
>> station_id) return 0;
>>  }
>>  
>> +static void request_additional_modules(u32 station_id)
>> +{
>> +	switch (station_id) {
>> +	case SIMATIC_IPC_IPC227G:
>> +	case SIMATIC_IPC_IPC277G:
>> +	case SIMATIC_IPC_IPCBX_39A:
>> +	case SIMATIC_IPC_IPCPX_39A:
>> +		request_module("nct6775");
>> +		break;
>> +	default:
>> +		request_module("emc1403");
>> +		break;
> 
> This one will be hard to maintain since every new model would choose
> the default path. Requesting emc1403 on a device where that would not
> do anything is not a problem, but still. And people might forget to
> even look at this and maybe name a module that should be used instead.
> 
> I will send a v2 where an array of module names will become part of
> device_modes. The array would hold all additional modules which do not
> autoload. Then the module w83627hf_wdt used for some models can also be
> part of that and no longer be modeled with wdtmode.
> 
> Should anyone have objections on the whole idea of requesting additional
> modules, please already speak up.

This sounds like a good plan to me, no objections from my side.

Regards,

Hans




>> +	}
>> +}
>> +
>>  static int __init simatic_ipc_init_module(void)
>>  {
>>  	const struct dmi_system_id *match;
>> @@ -170,6 +185,8 @@ static int __init simatic_ipc_init_module(void)
>>  		return 0;
>>  	}
>>  
>> +	request_additional_modules(station_id);
>> +
>>  	return register_platform_devices(station_id);
>>  }
>>  
> 

