Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A2EA1C3614
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 May 2020 11:50:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728282AbgEDJuG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 4 May 2020 05:50:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49593 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725928AbgEDJuF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 May 2020 05:50:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588585803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HaYmUd4XEuSgafwC55WiMzv1aLTWj2AlIXJRBF8pG+o=;
        b=dDCHhx/0J2EJyBNrI5gPARWi3HsGC7u+Gwrg/Ub7Zsgf56HDQ5q4uODwr2+jdtLL7AXGkk
        qW8Ya6ri/GsJQ8Uf7DqD8VEvBVkFgaS+84FFMI+CYNbHw1hpVGidekrMfd49ybtBxGITD2
        uJ/CnI1R5dN7JiKlLjHob84SeSnLpcY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-rHDJVUNgN2iweFM8iUZ3cA-1; Mon, 04 May 2020 05:50:02 -0400
X-MC-Unique: rHDJVUNgN2iweFM8iUZ3cA-1
Received: by mail-wr1-f70.google.com with SMTP id r17so10489122wrg.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 May 2020 02:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HaYmUd4XEuSgafwC55WiMzv1aLTWj2AlIXJRBF8pG+o=;
        b=SDO/tP1DtG7QJ+GdZTcB05I2F0BRrQ0VScwkNhNwknA87lrSsPvbkh355JHPGjoSPN
         h8jbp1pQXaaD0bM/5Q0X5Y4m+tKWtc7b1A5df54R21mgHjV82D6uOMENxbr43aCzV0pa
         jCrDF6pHX7yPBWz/Ar2tz3MMuviV/mjgiKTqeXNrCLfNQab7VKXHcM9hQ4YFCOC8FMwD
         qiMJa1ZNXrvIObb+HHBrggUBH5QQ0o9UnYK/tTvMlBD8s1NfwQIZGRFS9oplJ0gq8/iZ
         nddJ9RWZZ7grsNysZzU0BsV32bgeiV0v/w6hJDu/VzoiNM3/SMmxgXbSkAZ1mMmKgTW7
         OYfQ==
X-Gm-Message-State: AGi0PuagYWeSHHo/ESEzJMMU5+4M+Z4J2A/RFhQibJuT6Tphy9WyqSGE
        sIKqyIqPlWemGNiuhZLn4/++g+BDuW7mg4LQOH51MSe82WYWwRd6XEjh1dY1G4P4R0t2tPP7IjS
        9EsD7M3koGc3xs+AATnqX5wwK2Ta52wTKDA==
X-Received: by 2002:adf:f004:: with SMTP id j4mr17918591wro.123.1588585800886;
        Mon, 04 May 2020 02:50:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypLU6n6JpygT3mf36b6a2UklvXwZI3oEiuS2GxkZIGi6MTzDLo/wYhRd2YT5E91HAeSCcwtOsg==
X-Received: by 2002:adf:f004:: with SMTP id j4mr17918567wro.123.1588585800605;
        Mon, 04 May 2020 02:50:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f83sm12471745wmf.42.2020.05.04.02.49.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 02:50:00 -0700 (PDT)
Subject: Re: [PATCH v3 04/11] iio: light: cm32181: Add support for the CM3218
To:     Jonathan Cameron <jic23@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        linux-iio@vger.kernel.org,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20200428172923.567806-1-hdegoede@redhat.com>
 <20200428172923.567806-4-hdegoede@redhat.com>
 <20200503115906.6fb86b49@archlinux>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3eae2042-209e-5944-b90e-f747da820ac9@redhat.com>
Date:   Mon, 4 May 2020 11:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200503115906.6fb86b49@archlinux>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/3/20 12:59 PM, Jonathan Cameron wrote:
> On Tue, 28 Apr 2020 19:29:16 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Add support for the CM3218 which is an older version of the
>> CM32181.
>>
>> This is based on a newer version of cm32181.c, with a copyright of:
>>
>>   * Copyright (C) 2014 Capella Microsystems Inc.
>>   * Author: Kevin Tsai <ktsai@capellamicro.com>
>>   *
>>   * This program is free software; you can redistribute it and/or modify it
>>   * under the terms of the GNU General Public License version 2, as published
>>   * by the Free Software Foundation.
>>
>> Which is floating around on the net in various places, but the changes
>> from this newer version never made it upstream.
>>
>> This was tested on an Asus T100TA and an Asus T100CHI, which both come
>> with the CM3218 variant of the light sensor.
>>
>> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> The need to also store the name for the different sensors makes
> the case for picking between 'chip_info' structures in here stronger.
> So I'd do that instead of setting multiple elements in your
> switch statement... (See inline)
> 
>> ---
>>   drivers/iio/light/cm32181.c | 48 +++++++++++++++++++++++++++----------
>>   1 file changed, 36 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/iio/light/cm32181.c b/drivers/iio/light/cm32181.c
>> index 6fc0a753c499..065bc7a11f84 100644
>> --- a/drivers/iio/light/cm32181.c
>> +++ b/drivers/iio/light/cm32181.c
>> @@ -55,15 +55,24 @@ static const u8 cm32181_reg[CM32181_CONF_REG_NUM] = {
>>   	CM32181_REG_ADDR_CMD,
>>   };
>>   
>> -static const int als_it_bits[] = {12, 8, 0, 1, 2, 3};
>> -static const int als_it_value[] = {25000, 50000, 100000, 200000, 400000,
>> -	800000};
>> +/* CM3218 Family */
>> +static const int cm3218_als_it_bits[] = { 0, 1, 2, 3 };
>> +static const int cm3218_als_it_values[] = { 100000, 200000, 400000, 800000 };
>> +
>> +/* CM32181 Family */
>> +static const int cm32181_als_it_bits[] = { 12, 8, 0, 1, 2, 3 };
>> +static const int cm32181_als_it_values[] = {
>> +	25000, 50000, 100000, 200000, 400000, 800000
>> +};
>>   
>>   struct cm32181_chip {
>>   	struct i2c_client *client;
>>   	struct mutex lock;
>>   	u16 conf_regs[CM32181_CONF_REG_NUM];
>>   	int calibscale;
>> +	int num_als_it;
>> +	const int *als_it_bits;
>> +	const int *als_it_values;
> These are constant for each type of chip and come as a set.
> Better to just have a cm32181_chip_info structure with all 3 in it
> (and the name as mentioned earlier).  That way your switch below
> just becomes a matter of setting a single pointer for each case.

Ok I will add a chip_info structure for v4 off the patch-set.


> 
>>   };
>>   
>>   /**
>> @@ -85,8 +94,21 @@ static int cm32181_reg_init(struct cm32181_chip *cm32181)
>>   		return ret;
>>   
>>   	/* check device ID */
>> -	if ((ret & 0xFF) != 0x81)
>> +	switch (ret & 0xFF) {
>> +	case 0x18: /* CM3218 */
> 
> I'd ideally like to see a sanity check that we have the part expected.
> So the compatible matches what we actually get.

Erm, so far I've only seen the CM3218 on X86 + ACPI devices which
use an ACPI id of CPLM3218 for both sensor models, so at least
on ACPI there is nothing to check.

Regards,

Hans



> 
> If it doesn't but the part is still one we support print a warning.
> 
>> +		cm32181->num_als_it = ARRAY_SIZE(cm3218_als_it_bits);
>> +		cm32181->als_it_bits = cm3218_als_it_bits;
>> +		cm32181->als_it_values = cm3218_als_it_values;
>> +		break;
>> +	case 0x81: /* CM32181 */
>> +	case 0x82: /* CM32182, fully compat. with CM32181 */
>> +		cm32181->num_als_it = ARRAY_SIZE(cm32181_als_it_bits);
>> +		cm32181->als_it_bits = cm32181_als_it_bits;
>> +		cm32181->als_it_values = cm32181_als_it_values;
>> +		break;
>> +	default:
>>   		return -ENODEV;
>> +	}
>>   
>>   	/* Default Values */
>>   	cm32181->conf_regs[CM32181_REG_ADDR_CMD] =
>> @@ -121,9 +143,9 @@ static int cm32181_read_als_it(struct cm32181_chip *cm32181, int *val2)
>>   	als_it = cm32181->conf_regs[CM32181_REG_ADDR_CMD];
>>   	als_it &= CM32181_CMD_ALS_IT_MASK;
>>   	als_it >>= CM32181_CMD_ALS_IT_SHIFT;
>> -	for (i = 0; i < ARRAY_SIZE(als_it_bits); i++) {
>> -		if (als_it == als_it_bits[i]) {
>> -			*val2 = als_it_value[i];
>> +	for (i = 0; i < cm32181->num_als_it; i++) {
>> +		if (als_it == cm32181->als_it_bits[i]) {
>> +			*val2 = cm32181->als_it_values[i];
>>   			return IIO_VAL_INT_PLUS_MICRO;
>>   		}
>>   	}
>> @@ -146,14 +168,14 @@ static int cm32181_write_als_it(struct cm32181_chip *cm32181, int val)
>>   	u16 als_it;
>>   	int ret, i, n;
>>   
>> -	n = ARRAY_SIZE(als_it_value);
>> +	n = cm32181->num_als_it;
>>   	for (i = 0; i < n; i++)
>> -		if (val <= als_it_value[i])
>> +		if (val <= cm32181->als_it_values[i])
>>   			break;
>>   	if (i >= n)
>>   		i = n - 1;
>>   
>> -	als_it = als_it_bits[i];
>> +	als_it = cm32181->als_it_bits[i];
>>   	als_it <<= CM32181_CMD_ALS_IT_SHIFT;
>>   
>>   	mutex_lock(&cm32181->lock);
>> @@ -265,11 +287,12 @@ static int cm32181_write_raw(struct iio_dev *indio_dev,
>>   static ssize_t cm32181_get_it_available(struct device *dev,
>>   			struct device_attribute *attr, char *buf)
>>   {
>> +	struct cm32181_chip *cm32181 = iio_priv(dev_to_iio_dev(dev));
>>   	int i, n, len;
>>   
>> -	n = ARRAY_SIZE(als_it_value);
>> +	n = cm32181->num_als_it;
>>   	for (i = 0, len = 0; i < n; i++)
>> -		len += sprintf(buf + len, "0.%06u ", als_it_value[i]);
>> +		len += sprintf(buf + len, "0.%06u ", cm32181->als_it_values[i]);
>>   	return len + sprintf(buf + len, "\n");
>>   }
>>   
>> @@ -345,6 +368,7 @@ static int cm32181_probe(struct i2c_client *client)
>>   }
>>   
>>   static const struct of_device_id cm32181_of_match[] = {
>> +	{ .compatible = "capella,cm3218" },
>>   	{ .compatible = "capella,cm32181" },
>>   	{ }
>>   };
> 

