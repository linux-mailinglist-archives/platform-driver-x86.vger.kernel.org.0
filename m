Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B0027BD82C
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Oct 2023 12:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346056AbjJIKKC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Oct 2023 06:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346067AbjJIKKB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 06:10:01 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E359C
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Oct 2023 03:10:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n/zFwzSljm0VsT6Vg1ACM53e2MONp8myyGGk8TxSksLekVWDY1R4JyrHzQptOhYyVkPFDXuinCYcXh3NInpwY4Jt8wqXYvpBJQvRsSE5uG8PwL+IevVm3nzG2Eep05Yf91gcEuOkK+iYKnFG+3FX5JNIn6k5eMlWcl8LPU6oZrsJpv8M91ZaGWP9CqhB+eBSvbHEPQMUz4dUggp03U6cUxed/jABtRfP6a/9KaLDNVeN36Jrlou58g/syWELJueLDmtt3zbPBOIuqGKg7Jk6jTpAuXcF2wUkijEj21fxJjQo52HTNoLNfBd1yc0xYhMMbGTzq7hHsf3vnetivoK4Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nd4kNcXTx4O3RGVuT41IU3Kd1YFcPX2rCrxPbJEnAQk=;
 b=HEy/eBzGHrvByD8z/x5muqnApVoPqI2JJ8iskyJVSGaDbZ7jsRAD3jV9Yp0s5ooY5/vtM5QAeS2x5Fa8fBSKteYQmXw9a+d7OgcHpqy6LbGlMa2OIYZrQhVH+ONBCJdWrrBgrXug+8izm4aBm+Ht6EuqixaMSrh4QvbXuzvyTBCnso8egHRBja/81xLyToJelWKMQ7XZns8vf/q3pxMSW1p9/YfRyJzP6BqU5BZbZY1dGtCDOJLIvJj1ZSKOVtaveoOUhP1ZPPtIIuDZ4rCE82wp6s3Ptmiyp7UdcaokVD9aKgFY+ZiI5AyEOLz7exdxPojJwoz7wMve7vnxRrvaoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nd4kNcXTx4O3RGVuT41IU3Kd1YFcPX2rCrxPbJEnAQk=;
 b=KH4wrcokRKggcL+zg+DVsTyiXwkPjE7EKIKz97wdezeUuoxKmW4V8e4u/hTSLmwRyXFu/rycup4ZrRjhBwQzqY7rm0+Ab4tBjzBcHpqUO7l44h2HMCb4X0tpidygrG8B5msrsqhI1CCmD9ETOTrLN+/yAK/9SpahD3TcT+KKUBo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SN7PR12MB7856.namprd12.prod.outlook.com (2603:10b6:806:340::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 10:09:58 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::19d3:7b27:a6fc:95c5%4]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 10:09:58 +0000
Message-ID: <422424d2-c38d-406b-b4a3-6d48027a81d5@amd.com>
Date:   Mon, 9 Oct 2023 15:39:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] platform/x86/amd/pmc: Use flex array when calling
 amd_pmc_stb_debugfs_open_v2()
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, ilpo.jarvinen@linux.intel.com,
        markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20231009094539.6746-1-Shyam-sundar.S-k@amd.com>
 <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <25062006-2eb7-e53a-6d2a-c6c2cf539633@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0224.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::19) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SN7PR12MB7856:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b9d4f9-925d-4494-5f88-08dbc8afe4ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I+MYhM+9BtBmXS3e+YA9t1kkVG9BSQqAd/zYR/3oxiDrWftkOXSY3qPh0b+aKelMkH3jirycW/rkZoa2TH9gt8l3Od/y7gl+hAvSbTL1S/SHWmfrolVuRUSzNO6mwTzI0xQv06pGg8YW6pAITmzZBACo6Aks8xOqPnv1NDVrMw4lmMrm5dnJXGKzbxYb0vkKKlz/TcS+pps2lmue73pylSjDQ2cWfIUlGg1FqyXybj6Mf4ORBcewCAuP8p+lUxAjys1FQhqV4mOZBs1/Ue2z0UXI+tfzY1RKd2duzNbPJy4WbR5DvQ9bU4uAt5dc53G63uMriT2VzTs0Z7TVpB3R+cEYZMgs1Brq6k3ruumyrkF6ojiM9x2f8UNA7x7Mo2Cnp40PBzt1LXWfWwww0f0bCcd/ZA9n7VImEntkIlAglb+9Iza+Fqf13gqvwHxiTUirUCgJU8VehQN1OayrH/xZR6Vi94HbnZt6ZL+RILpwa4VJXVzSq/7QLl0t6Xwn4svG7XM7Gc8Ko4g6BAmPWJT8W64/nmLvz6R3qsUHG/Cfy4Z0V5KdOxWGEwhDg3hbg5xFvhPXllioPThutBHBsqVNEbumxQHYKdZ0E2fzOx4BZHhEBcHAIpRZbGmbn6+CNkJYRsmcjkJiOgs5tPUwI4idzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(396003)(366004)(346002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(31686004)(36756003)(86362001)(31696002)(2616005)(6512007)(53546011)(5660300002)(2906002)(6486002)(478600001)(66476007)(66556008)(66946007)(316002)(41300700001)(6666004)(6506007)(26005)(4326008)(8676002)(8936002)(83380400001)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnYvVisvSVJFWkhGTHZ3Yi81L2QwZXd5bHZRVWVMR3JHYklxOFBGR1lVVmY4?=
 =?utf-8?B?T3JlS1ppanRTOHZtRWhJSW1aTkZHR3RCallXYTFaWFVjaVNKbXVrdHEzd2Jn?=
 =?utf-8?B?RHFxSjI5R08vZGs1WDMvSWZ1S01DZ2ZlRHZwa1hWbkR4UmJnQktrWXdQL3pL?=
 =?utf-8?B?bW5SRnpPM3Z1a1dWL2JnM3U3dVJiQ3U0YTdJM09PaTdYTGhOemQveXloM3BQ?=
 =?utf-8?B?OG9WK2NvZFpqSGJINUx5VWlQS0Q0dmhuaWwvL0NmdmJWKythTmtjSzkrc0Rv?=
 =?utf-8?B?cXg2YzNMSjVyU1lKNG9yYTNlNXR4KzdYaVhQWmlYKzZIQWVtK2xKUWhXOE1Z?=
 =?utf-8?B?WFZoUEZYZ3FBZ0w0ckxWNTNoV2FCR3VMZUw0MlF4V0htVWx2YkRBdkh0cVpx?=
 =?utf-8?B?RS9JanFSbzlpZ2FpQVlidXptOHlRUzdGUDZtcG1zemsycUxSMlErTzAxMk45?=
 =?utf-8?B?ODg2TzVlTmVtdDFEOTA2ZU5mSlhlQWl1aXFmaS9ZanVlYmxnNDU2anZIeEhN?=
 =?utf-8?B?enVQYVl0TTErakZ2T1JycmVmRmgyS2lUeHZCaXRaZE5CbXUyZGhJcEIvM2xa?=
 =?utf-8?B?RjF1SmtXM3VYVlEza1pvckVIeW00L2g0VEhDQ1p2dTBlS1BPck9wY0NCZWhh?=
 =?utf-8?B?UE9scFdCcVJOU0NTUVhEWmdIVDRUT0V1RkQ5OUpPeGZCVHovZ1NDUHBZUWt0?=
 =?utf-8?B?Wk9FaXJJRmdjSHg0N2RxUzZQeDQ5dkFaT0JnUUVuOUNTM3RUMHNRL1hIM0Zh?=
 =?utf-8?B?MHlUQkVpc0ZoaCtqem50dGQ3UGJZeXhLeXBoQUIrai9makw4M3NBRTluNzd1?=
 =?utf-8?B?enJtWWJHRlJaSDdXVU9xOXRGMnVEVys2blVlOGJmdVF1VWJYQVFlK1lDamV1?=
 =?utf-8?B?aXFIRENJajZhd2tiRXE0ek8zRnZMaUpvYlpxR05lTmxaNXMrOW5xOWprRE8y?=
 =?utf-8?B?WENKWW02WVh1V1g1WmUrajJYMW56RjVubEJlSDhqMkE5ZDE2WE9Lcmx6dFpn?=
 =?utf-8?B?NDl4T1FaV2xpRnlkdkN3VE5Cb0l1U0FJL0J1c0NvMTVDSDQrMkhKSGtwZGFq?=
 =?utf-8?B?R0p3WHdTcE1YVDhtekU2QzB6WG5NSUgzTmlCMCsxTFdZRHIzTEttQWJwY1Z4?=
 =?utf-8?B?VVVqS3ZNalAvMzJ3V3JnYk5NVHphVlNWdHlON0NGUWZuVjJPVllCVWpMS2Fj?=
 =?utf-8?B?dVZERE8rdWJFUUdLSFp1aCtsNFdlUDRoUytkL2wyaUhWMkJCMzcxc1JIY0lp?=
 =?utf-8?B?aTZVb2x0aGJnaTN2RjBtc2cvVFBrRm9KME04VmNZQTBrb1VKVzFUTWJkRzNr?=
 =?utf-8?B?bFU5amhuR0J1UGpOb3RTZmZuN3ZPcGJqSFloamRvdzNXNlBKNXNEa2o4aVhR?=
 =?utf-8?B?dmtKSWw2akExM2wvdHdkOEsrbzZFVlRUdUYvRHpFWGZsbGJRdkRxQllPdS9Y?=
 =?utf-8?B?VGxSV2F0bDRaTkdpc25XWkRhcWxkVjhhK2xnQkVyQzRmeThHQTJLRVRhbjk0?=
 =?utf-8?B?b3NqT09nL0ZMN3ZpYUF5NGV3K2ZTNmtBbHQxMjhNZGFFT3kxNmMrTlFSdUIr?=
 =?utf-8?B?dFBOR0VRczludFlXSjNPRFU4ZHhodDZFRTNUVjVKREtRRWM4VER5eDV2K1N6?=
 =?utf-8?B?dENxcDdCMVBvYmNReFo5VTVBTGN2aXp4R29yVXB6T0VsTFFEcDI1Q045aXVu?=
 =?utf-8?B?NmUvQ2IvaWxEb2xnaDFQaWZUK3krWElTZmNqMkxBMzFMUDA0cGUwODFybzZ1?=
 =?utf-8?B?eUxSQUVYK2JxekFUY2Z3R2NUNmx0YUkzSWsxcEFxQ3NaaWpHTkZCeTdEMnlo?=
 =?utf-8?B?WEVYSTF1YThFQllvY1RiQlpaYVp1WHJnUll2UXJ4cUx0NkFPR1dxTXhqMjN3?=
 =?utf-8?B?Smo4cXZHcW9XNnBKM2Rwa1M2V2hoREZ3T0NCUG43aGR3UWp3SjRCRGprUE9T?=
 =?utf-8?B?a1dnVWJtc1ZKVmJVUG1TeFBFejNVaXVpWnFWZUNaN1A0RXFjTW5Ha2wwMVk0?=
 =?utf-8?B?L3pjZzRxaUt5Y3ZRS0JhMHpGYWdMTmZCQm9PNEdjdXlZblpEbmQxTURTMmw2?=
 =?utf-8?B?TUhiQmdZQ2xzUG5Ec29rQnk5WGxRT055ZmNRZlVsL05yeGpjeGd6eGdsRGJN?=
 =?utf-8?Q?DYHEV6F5+HyHWeTryKgo/yjO/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b9d4f9-925d-4494-5f88-08dbc8afe4ad
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 10:09:58.5289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 087t7tWv1tHfe8MQzpgViwzzhGa6cCjCNVqWp+UDbpZp0u8NKmRcNI0fH56TQVWLo8Svw9IgSadgJVdsnXgIjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7856
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 10/9/2023 3:21 PM, Hans de Goede wrote:
> Hi Shyam,
> 
> On 10/9/23 11:45, Shyam Sundar S K wrote:
>> Currently in amd_pmc_stb_debugfs_open_v2() the buffer size is assumed to
>> be fixed and a second call to amd_pmc_stb_debugfs_open_v2() may race with
>> a process holding open another fd. This could change "fsize" to a
>> bigger size causing an out of bounds read.
>>
>> Instead create a struct with a flexarray to solve this.
>>
>> Suggested-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>> v5:
>>  - new patch based on comments in v4 from Hans.
>>  - based on review-ilpo branch
>>
>>  drivers/platform/x86/amd/pmc/pmc.c | 22 ++++++++++++++--------
>>  1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
>> index c92dd5077a16..e00d69801369 100644
>> --- a/drivers/platform/x86/amd/pmc/pmc.c
>> +++ b/drivers/platform/x86/amd/pmc/pmc.c
>> @@ -122,6 +122,11 @@ enum s2d_arg {
>>  	S2D_DRAM_SIZE,
>>  };
>>  
>> +struct amd_pmc_stb_v2_data {
>> +	size_t size;
>> +	u8 data[] __counted_by(size);
>> +};
>> +
>>  struct amd_pmc_bit_map {
>>  	const char *name;
>>  	u32 bit_mask;
>> @@ -239,7 +244,8 @@ static const struct file_operations amd_pmc_stb_debugfs_fops = {
>>  static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  {
>>  	struct amd_pmc_dev *dev = filp->f_inode->i_private;
>> -	u32 *buf, fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	u32 fsize, num_samples, val, stb_rdptr_offset = 0;
>> +	struct amd_pmc_stb_v2_data *flex_arr;
>>  	int ret;
>>  
>>  	/* Write dummy postcode while reading the STB buffer */
>> @@ -247,10 +253,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	if (ret)
>>  		dev_err(dev->dev, "error writing to STB: %d\n", ret);
>>  
>> -	buf = kzalloc(S2D_TELEMETRY_BYTES_MAX, GFP_KERNEL);
>> -	if (!buf)
>> -		return -ENOMEM;
>> -
>>  	/* Spill to DRAM num_samples uses separate SMU message port */
>>  	dev->msg_port = 1;
>>  
>> @@ -264,7 +266,6 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  	dev->msg_port = 0;
>>  	if (ret) {
>>  		dev_err(dev->dev, "error: S2D_NUM_SAMPLES not supported : %d\n", ret);
>> -		kfree(buf);
>>  		return ret;
>>  	}
>>  
>> @@ -277,8 +278,13 @@ static int amd_pmc_stb_debugfs_open_v2(struct inode *inode, struct file *filp)
>>  		stb_rdptr_offset = 0;
>>  	}
>>  
>> -	memcpy_fromio(buf, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> -	filp->private_data = buf;
>> +	flex_arr = kzalloc(struct_size(flex_arr, data, fsize), GFP_KERNEL);
>> +	if (!flex_arr)
>> +		return -ENOMEM;
>> +
>> +	memcpy_fromio(flex_arr->data, dev->stb_virt_addr + stb_rdptr_offset, fsize);
>> +	flex_arr->size = fsize;
>> +	filp->private_data = flex_arr->data;
>>  
>>  	return 0;
>>  }
> 
> 
> You are not adjusting amd_pmc_stb_debugfs_read_v2() to match it will still
> return S2D_TELEMETRY_BYTES_MAX, likely overflowing the array!
> 
> And it will now return the contents of the size_t prefixing the buffer to
> userspace.
> 
> So this is obviously broken, nack.

I think it was taken care in v5 4/4. Can you please take a look at it
and see if something is really missing?

        return simple_read_from_buffer(buf, size, pos, filp->private_data,
-                                       S2D_TELEMETRY_BYTES_MAX);
+                                        dev->fsize);


Thanks,
Shyam

> 
> Regards,
> 
> Hans
> 
> 
