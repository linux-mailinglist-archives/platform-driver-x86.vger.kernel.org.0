Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 070151B2003
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Apr 2020 09:40:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726716AbgDUHkX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Apr 2020 03:40:23 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:25301 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726403AbgDUHkW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Apr 2020 03:40:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587454821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+us8s3+TLsdGNnZMoTiZF6Ytfj6NBMCN4gguLEIxdtQ=;
        b=aFGdBAseniVBn7J4fh9urCMjNgN5Bs3Y7HuxqEWLyK7fO2Z3y8Wrl5Q4rSKPYzIbGs8qRA
        5xtYefpZuBwA6eItS0duJFgTs5dOBIcRqD/Y/upgFUL8EcQ4O8PFixUzRXx+YqgkCmKhxv
        htfcH/3fUhVs+Tgn2X9K0ENdigZM+hs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-BOSHsMmjOqmjNeb9vY9O_A-1; Tue, 21 Apr 2020 03:40:10 -0400
X-MC-Unique: BOSHsMmjOqmjNeb9vY9O_A-1
Received: by mail-wr1-f70.google.com with SMTP id s11so7105425wru.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Apr 2020 00:40:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+us8s3+TLsdGNnZMoTiZF6Ytfj6NBMCN4gguLEIxdtQ=;
        b=jjjw4Px28PUYZfm5c5Og0qtmkM8ao7yxZgUJsPZIHfmskx563JM0jEIavuHA6STrwO
         M7nl3mynJirzqrgUQQnq+LnmX2/IfGpeFwyGJjI83MlBD0wlR8fWnJGRaGDLh4iO9Hd8
         VfHgJ5id5/QXmKQIHjCn4hXBuQ3UqiTvQKYFx2LeLdUYGrSeyjlD/2QaMgiQi2fENNPq
         WVP/ixQNfpb5ADQ9T0NoZBoF3SXR1AGgHPF5em1Ln1IJvRxnCQSU2qfgYVXC6iFDk+12
         EwHLOFyRDr0FMhGuLqfscZwFZp17oaCTngS9gyVfF/QjhDy72xBoNRrqcdiUxDNhrHeN
         FZ7g==
X-Gm-Message-State: AGi0PuZbJnnH7ut3N1vG3vEYUjLZ333mjhPRt+HyxHGhszg9Kp53zGyG
        PKDg9zFqkkvKsHkf3x6eWI6ltSwXhMJqYU/kv2nGWo6nTU9jCmQdns96JHmsOnGEDIuO8noIidj
        AwC61YaGXYRbGQutu03rrGicp/pAHUnnPOg==
X-Received: by 2002:a5d:4b90:: with SMTP id b16mr24211691wrt.16.1587454809424;
        Tue, 21 Apr 2020 00:40:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypIscKJFG2sAbiYiJ0K2c8RaMl7hB9OOkoo2bRUwbF9yAD4GP4X7AKWvXg51YPHtGx3nroITVg==
X-Received: by 2002:a5d:4b90:: with SMTP id b16mr24211675wrt.16.1587454809210;
        Tue, 21 Apr 2020 00:40:09 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t2sm2442383wmt.15.2020.04.21.00.40.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2020 00:40:08 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: surface3_power: i2c_acpi_new_device()
 returns a PTR_ERR
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200420220421.171298-1-hdegoede@redhat.com>
 <CAHp75VfC7-saRXnGDpee1dxAqDSDcveHMoC872WN9-SL4sDH4Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b01d598f-f3ae-b092-3be8-07e178370289@redhat.com>
Date:   Tue, 21 Apr 2020 09:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfC7-saRXnGDpee1dxAqDSDcveHMoC872WN9-SL4sDH4Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/21/20 12:33 AM, Andy Shevchenko wrote:
> On Tue, Apr 21, 2020 at 1:04 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> i2c_acpi_new_device() never returns NULL, it either returns an i2c_client
>> or a PTR_ERR. Adjust the mshw0011_probe() error handling to take this
>> into account.
>>
>> Note the goto out_err will cause i2c_unregister_device() to get called
>> even though the i2c_acpi_new_device() fails, this is ok as it accepts
>> a NULL pointer argument (and treats it as a no-op).
>>
> 
> Thanks, I guess it repeats [1].
> 
> [1]: http://git.infradead.org/linux-platform-drivers-x86.git/commitdiff/4dbccb873f2b35ad1b26419ff88c80509e2d4cbb

I guess it does and Dan's solution for the error handling is
claner then mine, a direct return indeed is the proper thing
to do here.

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/surface3_power.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86/surface3_power.c
>> index 946ac2dc08ae..32e6e86e27dd 100644
>> --- a/drivers/platform/x86/surface3_power.c
>> +++ b/drivers/platform/x86/surface3_power.c
>> @@ -522,8 +522,10 @@ static int mshw0011_probe(struct i2c_client *client)
>>          strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
>>
>>          bat0 = i2c_acpi_new_device(dev, 1, &board_info);
>> -       if (!bat0)
>> -               return -ENOMEM;
>> +       if (IS_ERR(bat0)) {
>> +               error = PTR_ERR(bat0);
>> +               goto out_err;
>> +       }
>>
>>          data->bat0 = bat0;
>>          i2c_set_clientdata(bat0, data);
>> --
>> 2.26.0
>>
> 
> 

