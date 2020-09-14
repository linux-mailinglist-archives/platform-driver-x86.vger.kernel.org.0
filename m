Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40CB52688CD
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Sep 2020 11:53:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgINJx0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Sep 2020 05:53:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54310 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726123AbgINJxX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Sep 2020 05:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600077201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Oj17EjhcdC1dLgIQUMv6H6xqafNT2mozvuM9vDiQWQY=;
        b=ixGA8vxwL5jKFcdomjuQ+lOOQ2N6MrkyV1rkfwg0ZiErFKbPTEVhb7Jvn6Sh7KJ9yJYQMv
        il0XmAZOXw5lzZZHYDPfGKflCKiXi5C1fkbUz6ZaOhiW5jY0hF668h09ULUuCuzMTmTIoB
        IumblYcMmmBx7MyuNTlQFCD6kK1z/us=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-nyBcpbRhMa2aF8Ar346xqw-1; Mon, 14 Sep 2020 05:53:20 -0400
X-MC-Unique: nyBcpbRhMa2aF8Ar346xqw-1
Received: by mail-ed1-f69.google.com with SMTP id y21so8964908edu.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 02:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Oj17EjhcdC1dLgIQUMv6H6xqafNT2mozvuM9vDiQWQY=;
        b=Z8PX0S0CzM2K6my25XCOkLvkk+7NQ+BHeKoVlNDm+rMWMAGB0+nKbiOg5qoKqw5oay
         yeea+nZgy7IycQ6Y2Y6tvYOPAmdbJHgUZfOI3tM38w9unnQxmdSqdTdrGw+EYtNuMeOD
         cC6NpzIhyRoOtDXpqB/HZmCKkFilz73xX+1RjvEdLwLssWHl5AW//WD1Z2L1wJ6W5QPk
         mz7YE2nstzkH9VnqmDN1805SI+VdUC05PJxNFhZgNQ2YLob3fNq7i6T7qHFIbLjNm7aw
         Cyg60EMlLqZJn6rNGWj9TgdsEPf7yZGB05s1JjHm1+DsIh4nKaer58JIKXn/j7zlkbIQ
         Pc1A==
X-Gm-Message-State: AOAM532UnVFFqyxJAuVfO113nnyNWdcRkmhWLyf+MVA1fqPrGxP6Y+UB
        pFRsu7PY87dFglAPBB+UotwSS2FxdKxNkSiS75Ri73yuSGjbrScn1gU5jmQsv7YjApWP724GwGd
        QGsqI3xQPgOYe3Jejytjn3EqTkZA9j5OlNA==
X-Received: by 2002:a17:906:17c6:: with SMTP id u6mr14097485eje.95.1600077199080;
        Mon, 14 Sep 2020 02:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwT5iEZUZ5nIK9bwAsDT0My596j/tVJnOiLMNEBAQYJwhIl66Elc9Dk5L+kF1YWBqKOeeATMQ==
X-Received: by 2002:a17:906:17c6:: with SMTP id u6mr14097472eje.95.1600077198900;
        Mon, 14 Sep 2020 02:53:18 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id a18sm7326291ejy.71.2020.09.14.02.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 02:53:18 -0700 (PDT)
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Divya Bharathi <divya27392@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <9b0e8473-1582-eb02-70f4-0f25d09c720c@redhat.com>
 <CAHp75Vfxgf4ttL931M08WqiWVELtZQotHvikDbmrTGkOyd=ZtQ@mail.gmail.com>
 <DM6PR19MB2636225813D7359A210D8DCCFA2C0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <71aebcf6-ecc5-72ce-e230-8bd25a294de8@redhat.com>
Date:   Mon, 14 Sep 2020 11:53:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB2636225813D7359A210D8DCCFA2C0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/3/20 4:27 PM, Limonciello, Mario wrote:

<snip>

>>>> +     /* look up if user set a password for the requests */
>>>> +     current_password = get_current_password("Admin");
>>>> +     if (!current_password)
>>>> +             return -ENODEV;
>>>
>>> Can we instead of passing "Admin" and "System" to this function
>>> just have 2 separate get_current_admin_password and
>> get_current_system_password
>>> helpers and then drop the error handling ?
> 
> The error handling for -ENODEV is actually important in case a WMI driver
> was unbound.

I see and checking for that is good, but then please make it
explicit, rather then hiding it like this. As is the code suggests
to someone reading the code that the problem is a missing password not
the driver being unbound.

As I mentioned before, since the code clearly assume that
only 1 instance of each WMI GUID is present, it should move to
storing all its data into a shared global struct. Protected
by a single shared global mutex.

And then functions exposed through sysfs attributes can do:

	mutex_lock(&dell_wmi_bios_attr_mutex);

	if (!dell_wmi_bios_attr_data.bios_attr_wdev ||
	    !dell_wmi_bios_attr_data.password_attr_wdev) {
		mutex_unlock(&call_mutex);
		return -ENODEV;
	}

And the password data can simply be directly read from
dell_wmi_bios_attr_data without needing a helper for it at all.

>>>> +
>>>> +     /* password is set */
>>>> +     if (strlen(current_password) > 0)
>>>> +             security_area_size = (sizeof(u32) * 2) +
>> strlen(current_password) +
>>>> +                                     strlen(current_password) % 2;
>>>> +     /* password not set */
>>>> +     else
>>>> +             security_area_size = sizeof(u32) * 2;
>>>
>>> Since you are using more then 1 line here please use {} around the state-
>> ments,
>>> also please put the /* password not set */ after the else:
>>>
>>>                  ...
>>>          } else { /* password not set */
>>>                  ...
>>>
>>>> +     string_area_size = (strlen(a_name) + strlen(a_value))*2;
>>>> +     buffer_size = security_area_size + string_area_size + sizeof(u16) *
>> 2;
>>>> +
>>>> +     buffer = kzalloc(buffer_size, GFP_KERNEL);
>>
>> Actually above looks like home grown kasprintf() implementation.
> 
> I don't think so, sprintf isn't used at all here.  It's a calculation to determine
> the size of the buffer to use.

Ack, this is different because it concats a UTF16 string together with some
other data into the new buf.

Regards,

Hans

