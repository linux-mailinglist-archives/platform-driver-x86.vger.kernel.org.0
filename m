Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC164258A22
	for <lists+platform-driver-x86@lfdr.de>; Tue,  1 Sep 2020 10:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgIAIOB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 1 Sep 2020 04:14:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56982 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726116AbgIAIN6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Sep 2020 04:13:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598948036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DCdhbMN3+ncVJNqzPrEBi1ZOlqSnON3PYpUoSHAA0Dc=;
        b=M8UAxDXCSP1afxcNhkhRqgr/mDAgB4XcBJSoB8jkVExvpuKi/hZDafJzXR78lp/FhGYj0C
        wXZxvJM7j844272n/RJj8n5W9mGT5yua19UkSE8QZwGZEVF6KGJSbGKH73aCHqxyzwtJkJ
        eOCJFjIXoqYhZllW+lqXjCqVbygDWos=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-lcLNixIgPEWcRMfSml7-tQ-1; Tue, 01 Sep 2020 04:13:53 -0400
X-MC-Unique: lcLNixIgPEWcRMfSml7-tQ-1
Received: by mail-ej1-f69.google.com with SMTP id w17so183769eja.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Sep 2020 01:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DCdhbMN3+ncVJNqzPrEBi1ZOlqSnON3PYpUoSHAA0Dc=;
        b=dRlUsPTKBWWRng14bgYmRYk2Jc3ZqGIYcc9tNUDJBG1Cp0TW04oHq1rAuNdsjWMW+4
         qwVpHnhTm8j/0r8uIESZL8CR5s9qn+WDEX1y1RfZzB9Jt5wLB4DesgMjLSpUznygejEv
         aiB2mAlh5EbK7htjTBU+l3igTXOFTsnX8eD+3RYzBHMNYEOqJ2Jobo1fqnF1B2e1+sAY
         r5ApHThN2l+YrGXhf8dHyneiFKQWfNpqJhgUI0BL3rdT1p9py77eU5jc08c0QAKwHNuv
         G9F2Ti9Wc6f9jX4rFJCDddmpn4aNfQY5LXF0gyY8EEypYHdL0vVo8Xcw66bPoav2k/wh
         kXlg==
X-Gm-Message-State: AOAM532rmJ5K6SlQ5twGpmQ9evsF5GU6M5rMDN1kbqO9xS0R6l+g8C8l
        hz7CsuXI+TrN9OwLoBjMtlDrxUSRiVHphApoDYhSegs6DBiqRmYb77Si4bgszNtuY34BwfiDFQ/
        O1886sak9Ld2q+kXs5NKk36fBSw70g7IReQ==
X-Received: by 2002:a05:6402:138a:: with SMTP id b10mr717130edv.113.1598948032042;
        Tue, 01 Sep 2020 01:13:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7IPkwP3Zgcsr7n4Dp+A7XVzuu2MIc5649d9aub8G653CiuwNqI7X4xs8nz9A2ZO89eAxZ+A==
X-Received: by 2002:a05:6402:138a:: with SMTP id b10mr717119edv.113.1598948031875;
        Tue, 01 Sep 2020 01:13:51 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id p12sm556857ejb.42.2020.09.01.01.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 01:13:51 -0700 (PDT)
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
To:     Marius Iacob <themariusus@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
 <20200824190043.tvy3ryzr27su4bg4@archer-mini>
 <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
 <20200830211750.bmi2fpylctehqsnm@archer>
 <a7a5b70e-47bb-e4bc-76ac-82e83fd4d746@redhat.com>
 <20200831082126.wsto3d2qqkylscm4@archer>
 <183aa099-47d7-4647-1651-9134d720f71c@redhat.com>
 <20200831120220.kxhtamyakvw54xrw@archer>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <df46c69f-3670-6eea-f024-288637449b56@redhat.com>
Date:   Tue, 1 Sep 2020 10:13:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831120220.kxhtamyakvw54xrw@archer>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/31/20 2:02 PM, Marius Iacob wrote:
> On 20-08-31 12:18:27, Hans de Goede wrote:

<snip>

>>> Unfortunately the PNP check is 2 layers deeper from module_init and it's expected to return 0 for success for the rest of the init procedure to continue (so that it's not that straightforward). The module seems to be built with a full init procedure on load in mind. I've looked at the code for quite a bit and it seems that it's a bit of patch to write, and most of the places the i8042 code is used (in other modules) expects the module to be not just loaded but fully initialized. So this should be a consideration also.
>>
>> Please give the attached patch a try, I believe that this should fix the i8042 issue.
>>
>> Once you have let me know that this works I'll replace the:
>>
>> Reported-by: Marius Iacob <themariusus@gmail.com>
>>
>> By:
>>
>> Reported-and-tested-by: Marius Iacob <themariusus@gmail.com>
>>
>> And submit the patch upstream. Note the input subsys
>> maintainers seems to be a bit slow to respond lately,
>> so I'm not sure how fast we can get this reviewed / merged.
>>
>> Anyways first lets test it and see if it helps :)
> 
> The patch works as intended. I also tried it on a system that has PS/2 controller and the module works as intended on that system too.

Great, thank you for testing. I've submitted the patch upstream.

Regards,

Hans

