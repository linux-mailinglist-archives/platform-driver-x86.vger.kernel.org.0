Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F440172845
	for <lists+platform-driver-x86@lfdr.de>; Thu, 27 Feb 2020 20:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729563AbgB0TBs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 27 Feb 2020 14:01:48 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:48441 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729170AbgB0TBs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Feb 2020 14:01:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582830107;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+JGruyus+zzmL4BgjL6ah3OjgOQ1bfPqt6JzzXGlf80=;
        b=Yx2iA8w7BPR2GAPrzfi+x9M2qz164VSjcFGBgGS1ErXuVOwpVKF9pLzu1W3GKr/vYgr6yG
        dz82tSxyL8S1ON0AA+mZa3nPeIhvAJvqzL40vIZ20a2fhfGAgmGHufFQ8TtgFDHW6uEdcJ
        sUppWKnPdIwdwLaLohetJC24vHyFV/I=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-0izIDIT3OK-dS5AZg3wc9g-1; Thu, 27 Feb 2020 14:01:30 -0500
X-MC-Unique: 0izIDIT3OK-dS5AZg3wc9g-1
Received: by mail-wm1-f70.google.com with SMTP id 7so82352wmf.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Feb 2020 11:01:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+JGruyus+zzmL4BgjL6ah3OjgOQ1bfPqt6JzzXGlf80=;
        b=U9YJNXLgj6tAyyGePlUHQ7LJ6ZDYOGoxkDkOTqGmmKzwRzmymDULzeAF+9/lQ4+Okh
         qZz7tUQDCMGiM5Pf5IAg/YzGtR7XE8jMNote7sq0ugSsKK5XvOVHfPEXq3IH8qDx1839
         ijyAFH0eQbGjexCzRQ5CudbNf7kr4juKxvCjnORzIHfbF3d2To+xZpB3RoRD6mQ6HAzR
         ImzakbTSEnCOTrdhFnWFYWZbBoA31WF3FW5tr1bz7egjwnPIS+0QWAj2Noku1qIPuATp
         eAfQphGTLZQH7DUSbFVzqPWgRkj6pvc5Lzt/XFnpCBv5KTNy3UavNcbkPK/YkPlQMeLl
         9OcQ==
X-Gm-Message-State: APjAAAXXG21lmEnyi9+TThXRB/k7aqkxVgXIgHPAp9wb2Ac/DqKRian0
        4lvbdYvlqNlh7YWAwzvzMtX+/ydWopDg6zngiKAfyR5ePfvUVBNEr++S+fnie+guy2CdVBFcwxg
        qOdlIS4uFvYw0abJuSIX/s/YQIHZZBO75/g==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr287928wri.95.1582830088177;
        Thu, 27 Feb 2020 11:01:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqx2rl9n2Z1Mt6ymZ4mzBXqCXk9u948IIcM8fsQq5WrgonWtq/eObeNUK776U7L3634OT1I8Vw==
X-Received: by 2002:adf:90e1:: with SMTP id i88mr287799wri.95.1582830086800;
        Thu, 27 Feb 2020 11:01:26 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-fc7e-fd47-85c1-1ab3.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:fc7e:fd47:85c1:1ab3])
        by smtp.gmail.com with ESMTPSA id l6sm9497307wrb.75.2020.02.27.11.01.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2020 11:01:26 -0800 (PST)
Subject: Re: [PATCH] platform/x86: i2c-multi-instantiate: Replace zero-length
 array with flexible-array member
To:     "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200213005525.GA11420@embeddedor.com>
 <f8281f16-b47e-41d6-f67b-1300bc5affff@embeddedor.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <582c09ec-a6aa-72fe-7566-7fb70c156c4d@redhat.com>
Date:   Thu, 27 Feb 2020 20:01:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f8281f16-b47e-41d6-f67b-1300bc5affff@embeddedor.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,


On 2/27/20 8:03 PM, Gustavo A. R. Silva wrote:
> Hi all,
> 
> Friendly ping: who can take this?

FWIW, the patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> On 2/12/20 18:55, Gustavo A. R. Silva wrote:
>> The current codebase makes use of the zero-length array language
>> extension to the C90 standard, but the preferred mechanism to declare
>> variable-length types such as these ones is a flexible array member[1][2],
>> introduced in C99:
>>
>> struct foo {
>>          int stuff;
>>          struct boo array[];
>> };
>>
>> By making use of the mechanism above, we will get a compiler warning
>> in case the flexible array does not occur last in the structure, which
>> will help us prevent some kind of undefined behavior bugs from being
>> inadvertently introduced[3] to the codebase from now on.
>>
>> Also, notice that, dynamic memory allocations won't be affected by
>> this change:
>>
>> "Flexible array members have incomplete type, and so the sizeof operator
>> may not be applied. As a quirk of the original implementation of
>> zero-length arrays, sizeof evaluates to zero."[1]
>>
>> This issue was found with the help of Coccinelle.
>>
>> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
>> [2] https://github.com/KSPP/linux/issues/21
>> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
>>
>> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
>> ---
>>   drivers/platform/x86/i2c-multi-instantiate.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
>> index ffb8d5d1eb5f..6acc8457866e 100644
>> --- a/drivers/platform/x86/i2c-multi-instantiate.c
>> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
>> @@ -28,7 +28,7 @@ struct i2c_inst_data {
>>   
>>   struct i2c_multi_inst_data {
>>   	int num_clients;
>> -	struct i2c_client *clients[0];
>> +	struct i2c_client *clients[];
>>   };
>>   
>>   static int i2c_multi_inst_count(struct acpi_resource *ares, void *data)
>>
> 

