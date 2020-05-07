Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 544FA1C837A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 09:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725783AbgEGHe1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 03:34:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45294 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725802AbgEGHe1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 03:34:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588836865;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/MeDJJkeZkfIUP2ENgGgo4J+mwsTymvC5FYKYaDXT88=;
        b=Bhss583/+Z1s4f2lVwHaPokqgHtzsOYURWMj9ru5TY/P5QNM2wUGaflVd9oDEQbQThT8dQ
        a8iF/GGfpjyhIfePZ/w7/qKHprjloEe0rKKeRrAxHIHNAjNIU8Uhs6Axe5vDIBx60guZJE
        FMMb6XxIrsUabg5dEtx4OB5A3JMkhDk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-sAHpvNyJNtmqOpHAhgDkpA-1; Thu, 07 May 2020 03:34:23 -0400
X-MC-Unique: sAHpvNyJNtmqOpHAhgDkpA-1
Received: by mail-wr1-f71.google.com with SMTP id f2so2890042wrm.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 00:34:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/MeDJJkeZkfIUP2ENgGgo4J+mwsTymvC5FYKYaDXT88=;
        b=ta2TI4n7Tw38jL0kWEEe/Zfz8AGrR9bghVVipgIpX1EJPXjUpk/wtGnuZjo2OhGZgG
         lOyyXwreW51uWjWFwFCtjGfTqwdXzv7ks3ADLPGK79gsktkPioQobMYbdLdRya26FTry
         S0mdQQX0pEiRusa331wvzGQq9fKCXoUaoK/NDMK8mTefw0cpY1uG+vIVzyPgIBlFfuwj
         SBD9h8tOtQqzePYC8zvYr7QSA1J8SU1q1Qqwy24HHq/aerSJQXNfcQ5jlKIqBgJyPy7L
         vP5Nt7nIbPqCmrsxfFCSBRusvhUqkCrq7w7SZjL5n3V1zZnYfIBsgFr88tGyEdKEztOm
         Feng==
X-Gm-Message-State: AGi0PuYzlaJcGgGCWHgxs/pfm/5IodcKoivySiJY0VCCh8gv7xx9GQan
        f/TfQ4md8AzPzhhEBLwHJRA703htbnH45AL6pnqhnUyzDDGJdApLN3V2q5KeZ/Rs6CdkFi9E7zL
        E5z4NqLGUWQ6Uhdk6rHG20Z4pN/S8lhQWnA==
X-Received: by 2002:adf:9447:: with SMTP id 65mr14166850wrq.331.1588836861077;
        Thu, 07 May 2020 00:34:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypKutypP8jB8f00QrCvUC8XWvQORxO6DQimEGK8PGZjeWpU4RJslALk9u9373vjaG6fFEI4ASw==
X-Received: by 2002:adf:9447:: with SMTP id 65mr14166828wrq.331.1588836860870;
        Thu, 07 May 2020 00:34:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id 17sm6437189wmo.2.2020.05.07.00.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2020 00:34:20 -0700 (PDT)
Subject: Re: 5.6 regression caused by "ACPICA: Dispatcher: always generate
 buffer objects for ASL create_field() operator"
To:     "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        "Kaneda, Erik" <erik.kaneda@intel.com>
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        "Moore, Robert" <robert.moore@intel.com>,
        Mattia Dongili <malattia@linux.it>,
        William Bader <williambader@hotmail.com>,
        Dominik Mierzejewski <dominik@greysector.net>,
        linux-acpi <linux-acpi@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <49f20a91-9362-6249-d413-1461258d56a9@redhat.com>
 <11795a75-70de-5fcc-878f-14a0381947ea@gmail.com>
 <BYAPR11MB3096868FE8523B2F94A50F9DF0A70@BYAPR11MB3096.namprd11.prod.outlook.com>
 <7fb8757c-41e7-3be0-5552-80696559bdfe@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4443e82e-6c1f-696f-1f16-12b1c0c33b13@redhat.com>
Date:   Thu, 7 May 2020 09:34:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7fb8757c-41e7-3be0-5552-80696559bdfe@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/6/20 7:21 PM, Rafael J. Wysocki wrote:
> On 5/6/2020 12:11 AM, Kaneda, Erik wrote:
>>
>>> -----Original Message-----
>>> From: linux-acpi-owner@vger.kernel.org <linux-acpi-
>>> owner@vger.kernel.org> On Behalf Of Maximilian Luz
>>> Sent: Tuesday, May 5, 2020 6:50 AM
>>> To: Hans de Goede <hdegoede@redhat.com>; Wysocki, Rafael J
>>> <rafael.j.wysocki@intel.com>; Moore, Robert <robert.moore@intel.com>;
>>> Kaneda, Erik <erik.kaneda@intel.com>; Mattia Dongili <malattia@linux.it>;
>>> William Bader <williambader@hotmail.com>; Dominik Mierzejewski
>>> <dominik@greysector.net>
>>> Cc: linux-acpi <linux-acpi@vger.kernel.org>; Darren Hart
>>> <dvhart@infradead.org>; Andy Shevchenko <andy@infradead.org>;
>>> platform-driver-x86@vger.kernel.org
>>> Subject: Re: 5.6 regression caused by "ACPICA: Dispatcher: always generate
>>> buffer objects for ASL create_field() operator"
>>>
>>> On 5/5/20 2:55 PM, Hans de Goede wrote:
>>>> Hi All,
>>>>
>>>> Commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
>>>> objects for ASL create_field() operator") has dropped the automatic
>>>> conversion of small buffers into integers.
>>>>
>>>> But some drivers relied on this automatic conversion, these drivers
>>>> have checks like this:
>>>>
>>>>           if (object->type != ACPI_TYPE_INTEGER) {
>>>>                   pr_warn("Invalid acpi_object: expected 0x%x got 0x%x\n",
>>>>                                   ACPI_TYPE_INTEGER, object->type);
>>>>                   kfree(object);
>>>>                   return -EINVAL;
>>>>           }
>>>>
>>>> This specific bit comes from the sony-laptop (platform/x86) code, the
>>>> ACPICA change has broken this code, causing systems using this driver
>>>> to hang on resume from suspend.
>>>>
>>>> We have multiple bug-reports open for this already:
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=207491
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1829096
>>>> https://bugzilla.redhat.com/show_bug.cgi?id=1830150
>>>>
>>>> Mattia Dongili, the sony-laptop driver has already submitted a fix for
>>>> this upstream, adjusting the sony-laptop driver to deal with the
>>>> returned object type now being a BUFFER.
>>>>
>>>> The goal of this email is to:
>>>>
>>>> 1. Make everyone involved aware of this breakage as we may see similar
>>>> breakage elsewhere.
>>>>
>>>> 2. Discuss if we should maybe revert the ACPICA change.
>>>>
>>>> If you are reading this then 1. has been accomplished :)
>>>>
>>>> Which leaves us with 2. I'm tending towards keeping the change, since
>>>> it seems the right thing to do and dealing with the fallout. But since
>>>> there is fallout we should also at least consider reverting the ACPICA
>>>> change.
>>>>
>>>> So ACPI maintainers what is you take on this ?
>> What a mess. Several thoughts...
>>
>> I think we should keep the internal AML interpreter behavior as is because it solves a problem.
> 
> I also would prefer to deal with the fallout rather than to revert the fix.
> 
> I think that the potential damage is limited and the affected driver code should be fixed anyway which may not happen if the change in question is reverted.

Ok, so it seems that we are all in agreement to NOT revert and to deal
with any (other) fallout instead.

Andy / Darren can you get the sony-laptop fix merged and on its way
to Linus as a fix please?

Regards,

Hans

