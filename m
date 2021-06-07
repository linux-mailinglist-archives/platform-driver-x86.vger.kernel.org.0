Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7742839D283
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Jun 2021 03:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhFGBQB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 6 Jun 2021 21:16:01 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3076 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhFGBQB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 6 Jun 2021 21:16:01 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4FywHz5XW1zWsFx;
        Mon,  7 Jun 2021 09:09:19 +0800 (CST)
Received: from dggema766-chm.china.huawei.com (10.1.198.208) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 7 Jun 2021 09:14:08 +0800
Received: from [10.174.177.210] (10.174.177.210) by
 dggema766-chm.china.huawei.com (10.1.198.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 7 Jun 2021 09:14:08 +0800
Subject: Re: [PATCH] platform/x86: intel_ips: remove unused val in read_mgtv
To:     Hans de Goede <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>, <yukuai3@huawei.com>
References: <20210604081414.3701730-1-yangerkun@huawei.com>
 <bf848826-b8d3-5d1f-1ae0-8d52750d2676@redhat.com>
From:   yangerkun <yangerkun@huawei.com>
Message-ID: <574f00c4-ae41-62b0-54b9-46a0ca294b3a@huawei.com>
Date:   Mon, 7 Jun 2021 09:14:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <bf848826-b8d3-5d1f-1ae0-8d52750d2676@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.210]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema766-chm.china.huawei.com (10.1.198.208)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



在 2021/6/5 3:55, Hans de Goede 写道:
> Hi,
> 
> On 6/4/21 10:14 AM, yangerkun wrote:
>> drivers/platform/x86/intel_ips.c:832:6: warning: variable â€˜retâ€™ set but
>> not used [-Wunused-but-set-variable]
>>    832 |  u16 ret;
>>        |      ^~~
>>
>> Fix it by remove the define.
>>
>> Reported-by: Hulk Robot <hulkci@huawei.com>
>> Signed-off-by: yangerkun <yangerkun@huawei.com>
>> ---
>>   drivers/platform/x86/intel_ips.c | 15 ++-------------
>>   1 file changed, 2 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
>> index bffe548187ee..d40a00ba859a 100644
>> --- a/drivers/platform/x86/intel_ips.c
>> +++ b/drivers/platform/x86/intel_ips.c
>> @@ -829,19 +829,8 @@ static u16 calc_avg_temp(struct ips_driver *ips, u16 *array)
>>   
>>   static u16 read_mgtv(struct ips_driver *ips)
>>   {
>> -	u16 ret;
>> -	u64 slope, offset;
>> -	u64 val;
>> -
>> -	val = thm_readq(THM_MGTV);
>> -	val = (val & TV_MASK) >> TV_SHIFT;
>> -
>> -	slope = offset = thm_readw(THM_MGTA);
>> -	slope = (slope & MGTA_SLOPE_MASK) >> MGTA_SLOPE_SHIFT;
>> -	offset = offset & MGTA_OFFSET_MASK;
>> -
>> -	ret = ((val * slope + 0x40) >> 7) + offset;
>> -
>> +	thm_readq(THM_MGTV);
>> +	thm_readw(THM_MGTA);
>>   	return 0; /* MCH temp reporting buggy */
>>   }
>>   
>>
> 
> 
> I believe it would be good to keep the code around to document how
> the temperature can be calculated.
> 
> Please submit a patch marking ret as __maybe_unused instead.

Thanks for your reply, will send v2.

> 
> Regards,
> 
> Hans
> 
> .
> 
