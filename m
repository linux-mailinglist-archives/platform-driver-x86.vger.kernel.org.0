Return-Path: <platform-driver-x86+bounces-206-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C55800203
	for <lists+platform-driver-x86@lfdr.de>; Fri,  1 Dec 2023 04:21:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6B1F1C20BF9
	for <lists+platform-driver-x86@lfdr.de>; Fri,  1 Dec 2023 03:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A54F717CF;
	Fri,  1 Dec 2023 03:21:13 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3B912F;
	Thu, 30 Nov 2023 19:21:05 -0800 (PST)
X-UUID: 0adcf1ec53004f2896f8db19fa4848f2-20231201
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:f3aa08ed-1cd4-4848-915f-291d33eb3c0e,IP:15,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-INFO: VERSION:1.1.33,REQID:f3aa08ed-1cd4-4848-915f-291d33eb3c0e,IP:15,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:2fb44773-1bd3-4f48-b671-ada88705968c,B
	ulkID:231130174330NINYOUVY,BulkQuantity:9,Recheck:0,SF:24|17|19|44|64|66|3
	8|102,TC:nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:n
	il,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSI,TF_CID_SPAM_ULN,TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,
	TF_CID_SPAM_FSD
X-UUID: 0adcf1ec53004f2896f8db19fa4848f2-20231201
X-User: chentao@kylinos.cn
Received: from [172.20.15.254] [(116.128.244.169)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 444723567; Fri, 01 Dec 2023 11:20:49 +0800
Message-ID: <b189a64f-2b0b-4089-8f70-4577aa0608dc@kylinos.cn>
Date: Fri, 1 Dec 2023 11:20:48 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/mellanox: Add a null pointer check in
 mlxbf_pmc_create_groups
To: Vadim Pasternak <vadimp@nvidia.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 David Thompson <davthompson@nvidia.com>
Cc: Hans de Goede <hdegoede@redhat.com>, "jiri@resnulli.us"
 <jiri@resnulli.us>, Shravan Ramani <shravankr@nvidia.com>,
 "kunwu.chan@hotmail.com" <kunwu.chan@hotmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20231127063433.1549064-1-chentao@kylinos.cn>
 <1701224213463629.329.seg@mailgw>
 <bf29c39f-8d9f-465a-bbc2-45bdb77711b8@kylinos.cn>
 <55c5987b-c991-aa8-a226-c5b1638b474@linux.intel.com>
 <BN9PR12MB5381030454E0A19315002F2DAF82A@BN9PR12MB5381.namprd12.prod.outlook.com>
From: Kunwu Chan <chentao@kylinos.cn>
In-Reply-To: <BN9PR12MB5381030454E0A19315002F2DAF82A@BN9PR12MB5381.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Vadim,
Thanks for your reply.

I will follw your suggestions and add some ‘fixes’ label in v2 patch.

Thanks again,
Kunwu


On 2023/12/1 00:01, Vadim Pasternak wrote:
> Hi Ilpo!
> 
>> -----Original Message-----
>> From: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Sent: Thursday, 30 November 2023 17:26
>> To: Kunwu Chan <chentao@kylinos.cn>; Vadim Pasternak
>> <vadimp@nvidia.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>; jiri@resnulli.us; Shravan
>> Ramani <shravankr@nvidia.com>; kunwu.chan@hotmail.com; platform-
>> driver-x86@vger.kernel.org; LKML <linux-kernel@vger.kernel.org>
>> Subject: Re: [PATCH] platform/mellanox: Add a null pointer check in
>> mlxbf_pmc_create_groups
>>
>> Hi Vadim,
>>
>> Could you please take a look at this and give advice to Kunwu so we can get all
>> of them squashed in one go.
> 
> It seems there are six calls devm_kasprintf(), which requires checking pointer.
> 
> I guess, it is correct to return '-ENOMEM' for any failure.
> 
> I see there is another problem in mlxbf_pmc_probe() - it lacks error flow for:
> 	pmc->hwmon_dev = devm_hwmon_device_register_with_groups(
> 		dev, "bfperf", pmc, pmc->groups);
> 	
> Need to add:
> 	if (IS_ERR(pmc->hwmon_dev))
> 		return PTR_ERR(pmc->hwmon_dev);
> 
> Sharvan, David,
> Could you, please, have look?
> 
>>
>> On Thu, 30 Nov 2023, Kunwu Chan wrote:
>>
>>> Thanks for your reply.
>>>
>>> Cause i don't know how to deal with in some scenario，such as in
>>> 'mlxbf_pmc_init_perftype_counter', when 'attr->dev_attr.attr.name' is
>>> null, should return '-ENOMEM' or 'continue' the loop?
>>
>> I'd have thought returning -ENOMEM would be safe because it just ends up
>> failing probe()? ...And it's not that likely to occur in the first place.
>>
>> --
>>   i.
>>
>>>
>>> So I'm going to solve it one by one.
>>>
>>> Thanks again,
>>> Kunwu
>>>
>>> On 2023/11/28 17:51, Ilpo Järvinen wrote:
>>>> On Mon, 27 Nov 2023, Kunwu Chan wrote:
>>>>
>>>>> devm_kasprintf() returns a pointer to dynamically allocated memory
>>>>> which can be NULL upon failure.
>>>>>
>>>>> Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox
>>>>> BlueField PMC driver")
>>>>> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
>>>>> ---
>>>>>    drivers/platform/mellanox/mlxbf-pmc.c | 2 ++
>>>>>    1 file changed, 2 insertions(+)
>>>>>
>>>>> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c
>>>>> b/drivers/platform/mellanox/mlxbf-pmc.c
>>>>> index 0b427fc24a96..59bbe5e13f6b 100644
>>>>> --- a/drivers/platform/mellanox/mlxbf-pmc.c
>>>>> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
>>>>> @@ -1882,6 +1882,8 @@ static int mlxbf_pmc_create_groups(struct
>>>>> device *dev, int blk_num)
>>>>>    	pmc->block[blk_num].block_attr_grp.attrs =
>>>>> pmc->block[blk_num].block_attr;
>>>>>    	pmc->block[blk_num].block_attr_grp.name = devm_kasprintf(
>>>>>    		dev, GFP_KERNEL, pmc->block_name[blk_num]);
>>>>> +	if (!pmc->block[blk_num].block_attr_grp.name)
>>>>> +		return -ENOMEM;
>>>>>    	pmc->groups[pmc->group_num] = &pmc-
>>> block[blk_num].block_attr_grp;
>>>>>    	pmc->group_num++;
>>>>
>>>> I'm totally lost, why did you fix only one devm_kasprintf() location?
>>>> Don't all of them need this check?
>>>>
>>>

