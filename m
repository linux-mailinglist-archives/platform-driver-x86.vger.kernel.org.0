Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1EE5E68DA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 Sep 2022 18:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbiIVQya (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 22 Sep 2022 12:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbiIVQy3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 12:54:29 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2040.outbound.protection.outlook.com [40.107.220.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07456EB13E
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 09:54:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UJC5zLQHG7hYk7DWBl6vdsoJXShmTE6XB5CyRr9omIdCH1WM2Oixh+BftckUAj6jwsBz336O816a1mhiJ0YUDh0aEO1wGNytWGWeOCbH7yLaLYWu1tlX/89bjpxr/YDsiY6G2v1jIoEKbLo/PkfvVKV9q2whNSsyjZb+EPWOfS6aoH/sP0EIcuOVZUuojpMdNH/H3UKVjBDNJWQdfala4izUGA1sTHUULt+1/RdiZzswChNfukicBO00cCEevYjgO2iCpqPsdtAR5eyLRThhu2obVlaDs0Tzs790BjLgjr0OVtU72qH4D0fX+8b5fbKZEfPGmpro3HS1/5bP4O1itA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3tGH0f/NjG1872H1oGImbEvDr+8PBJXiXPc43CtAkIg=;
 b=kgmo9BbtjTBkcYFILQjYTQvjgSriHBMhV+BAAJDUej+XFsupxhdPHh5anL2GupVcrMQpCnIFyBXf8rbF19vmRyQ8Z0n440VXkkOanHM0m4OYRPeVmog5oZILo/Z5PRI1UYL6CkYusuqAA0E6MgoXFJzrnok6UgXizULSFLirIAH6Gop5UudGkJZ7TOmj559lqiUEIgqGc1kk54EVFEcDTVXoqOEDEg6aWyghqjXJUGzY1q+xQSjW0C4xEXjfzD/RiVAimTxX+GyvMsB8pOnj1jXV57Rb6qnP+BXROouSKcL8wyZwcKzmiV1Aief+JLi1cj0kKtVB0DUxQb3hIlmFYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3tGH0f/NjG1872H1oGImbEvDr+8PBJXiXPc43CtAkIg=;
 b=lpxvzZMhuoy9CkXGJAag8TKNE0MOHhfTG3zAgBluYxg6xYhI54aAZ6Oor66vw7aEVB3tz+qMhWcalDrvC9zOIoVcqYBza+msyHrGWKWQK1wyFVuYyPRPIMH9pHBb1IDFYdnE0tmdyJHxED670tnsNSneOF+unGH28kqCB7wH43Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5184.namprd12.prod.outlook.com (2603:10b6:5:397::18)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.18; Thu, 22 Sep
 2022 16:53:23 +0000
Received: from DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::54d2:cd8:1f74:644d]) by DM4PR12MB5184.namprd12.prod.outlook.com
 ([fe80::54d2:cd8:1f74:644d%7]) with mapi id 15.20.5654.018; Thu, 22 Sep 2022
 16:53:23 +0000
Message-ID: <31a6098a-305d-a6a9-c44e-dee52194f275@amd.com>
Date:   Thu, 22 Sep 2022 22:23:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 1/3] platform/x86/amd/pmf: Add support for CnQF
To:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220922131202.56529-1-Shyam-sundar.S-k@amd.com>
 <20220922131202.56529-2-Shyam-sundar.S-k@amd.com>
 <15b819cb-ae2a-e6fa-242c-5debf335676c@redhat.com>
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <15b819cb-ae2a-e6fa-242c-5debf335676c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::8) To DM4PR12MB5184.namprd12.prod.outlook.com
 (2603:10b6:5:397::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5184:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 5313d4f0-7a17-4e7f-cb11-08da9cbaf604
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JzTMn7VToa7ytr+gShj0s2ofG6gkbeNKTpy8kXTxU0kEDQbNEhF8eySRHvJ0LjeWlIOg5bt/zRLk4ytS7hwbqqH40LOlBEIzGYiOju19ZooOKhKuJ74nsKpSOt4l3INL4hRjnshS9XKG4Z9sJ0KHb5oheXvXWfPTii9Oy30us7jJ9YXelCiWl+WMUSqL8s7OcWtNDWLr1EaqsjPeFBHtgqpM9DEM5ejMVRXshbr1NIBK6HmWg/+RzzRZhVcjLTCbFGCYRVzKW1M4bRW+GyMKaX3PJKC5rUGGeqtXcInD8Mt8KdYJnj8o0zbsgGXcc2Ck+Fm1+S8JRatJvJkF2K220zlMLrwJ0Okx1LKwFHilyqegs49JylrY3BqaiVtacVzaRqasXoA81ZVkXDjs1BLCXtyGF6zCbroBxCtuJpqtKrcp05TE+tTgt83OyHOfF/IWOPSr4l29ckXNp/JiWhF1IO9193PP349rwj8QHcE90+lL85FSsXx5tFhgLrG0tgR0ICq/VzBboDERHBpMzkbZjWKxLk0wvnwVi8LLK5IyCYSlcmVUttAo2BKDbeuvqI3KsIt+T1QD5bW4ugZPwkg8BBrrCTRr9CzssU4zlnK//PJEgG4FLY9F+owXj5KLEfZsKeLkSGoS4lJwKX4RmhEFV/8CyEawo4kYAwK9ppBqOOrSFlS2I/gCnEOYOH632fYzCd4YB8VZ86Zy1QjATMxoaP6TGvrryDGPKoIa+h4FqTWuKkNDVEKrfiRoc+nLHm1v282leqwQZtSxmFJ10JOM/JuqjjTVht3pvmvnFfXznQDDmgAhRogtuGOoadjU4554l+Knuu6D3cLbt/Gs+rDOZQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB5184.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(39860400002)(396003)(136003)(376002)(451199015)(2616005)(53546011)(186003)(31686004)(66556008)(5660300002)(316002)(478600001)(6636002)(31696002)(966005)(6486002)(86362001)(38100700002)(41300700001)(36756003)(66476007)(6506007)(26005)(83380400001)(6512007)(45080400002)(4326008)(8936002)(6666004)(30864003)(66946007)(8676002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2xYV3gybmtJTW85ZFhiWTNOUW1tekNaVDdFNGFSYzhGRDhiSFFHNWx6d3JM?=
 =?utf-8?B?VmJaMUN1WW54ZHBYUjIxM201TEdTb0xGV3NOaTkrSmtacnRVbFdKL3VkSk5t?=
 =?utf-8?B?RnR3WHdqU1FnM24vbStLcmFzRmtYdjhDOXMwTXh6NEdqWUhONUR5M0FaRUU0?=
 =?utf-8?B?OWFuV2FuVnJxQkUwZFFVSlNRaWNITUowd29xRVdZR1ZSUlZ1QlVLV2NWU2h2?=
 =?utf-8?B?NEk3QkRjUkE0OXRpcU5qT2tTNFZuL3lXNnNKRHkrUFhpR21hT1l4aTNhU2ow?=
 =?utf-8?B?VklmZHpXd1NTWnBscXF3OGNicTdBZ1U3YkxPdFJWRUoyMVJvTmpvZ2xYMG5J?=
 =?utf-8?B?NjE3ZUpxUno4L3ZBYzFPdjNiYVdwQmRPdC9PQlEzd1I5MDVEaVFjbTJGdWhJ?=
 =?utf-8?B?aklHUEtvNW01cFRDeWhva01nNlJjdXVuZ1ZCUTY4c3ZmSmthYUhZb1ZpanNz?=
 =?utf-8?B?dGppbWxsTWZReG1FYUY4b3pHMyt4UXhHVVhQQXo0VjR4cVlHbUpZd2ptbnRX?=
 =?utf-8?B?SXpWSUZINEpRcWFFd0NuY0dvd21odjl2M0tDbUpwRGRrNlFQcjNUWndzUWNC?=
 =?utf-8?B?K3JTNmtXVDRpKytheW9MUHpGc0gxREhxckhNckVTL0NVQUpPalpPeVM4a3U4?=
 =?utf-8?B?ZXp1U0VsRURabzBYTXJJWmlNaU9FRjBCQnh4L0tEcyt3U0lrNVNuL1hWeEtm?=
 =?utf-8?B?TzNOTmhyL0M3aUloTTBLLzQ3M2VsTHhnV2FSSDFacEdSSUJrSHdIV2pQYXVr?=
 =?utf-8?B?SGhHNWYyUE1tdXVLYmIzcDNmZTQxcGhubkJsckN4ZllmYTNRQTY5U2hmZ3hH?=
 =?utf-8?B?RmV6VzY0K0NiaW4zTHp1MDZEV2hQMjhsS2dCZHlZdklFYVZqbllwZXJQRjNU?=
 =?utf-8?B?akpXWVpVellTc2FMQzU2R3hiUStrMXk0OGdVdDlra3ZZY1B6MlFOYTNVcVUx?=
 =?utf-8?B?cDRmOEJUejlrN2xIeU5qZUUxSlF3Y1YzWkplM2xua3ZaVnVpeEc2QzdaV0E0?=
 =?utf-8?B?OVZHdmlVK0w2U093c0NZSlJZZ3M1eXptZWpnSXhkaXJ1UXNxeFVPaHB4QzRw?=
 =?utf-8?B?a2JMbU0rM1BmV2ZxVHpYU3FaeEpJZnlkYS9lcGxJVU0yUHJYM2JHQ2l5VHE2?=
 =?utf-8?B?SmgxNVZIVjJvaUJDa0l3RlM0TEliQ01ZNkhvS1BqV0wyd1IzeENsQmsvMVdl?=
 =?utf-8?B?eVZEa0hxbld4MzRwSkxXK3JtK0o2eThvTVE0WmF1eWFzMnZxS0NPWmtMZXFS?=
 =?utf-8?B?VUtoL0xUZHJKcWFVcXpuYjhRNE9IOUQ2QzBDbnhWVTRlOE9lY3ZKTWV1aVgr?=
 =?utf-8?B?V0NoMkd1QVhXZ0ZDZlYxbGhzRjcxNnJQZTVwR21TYlpBcWhXK3JsNGludzND?=
 =?utf-8?B?bUlaQ2FTM294bEd6Q3BtSkpHL1I5YTBKaXVsb1NIRkhleDVScEkrbVY5ME5R?=
 =?utf-8?B?TzhScHlacUVoanN3SWFVZE4vY2FRRm83SXRUMllnUVBiTVhLL21sNVl2RTNJ?=
 =?utf-8?B?clNCdGQweEIvVUFBcmlvZVJJcG9JWndvaEV3R3lsdzFHL2RzbExxZThKTXdO?=
 =?utf-8?B?aXRjU3hpKzc3cnI3NHRuc3V3MWZrb0dmRDMrOHlHOTNaaW00U3Zwd3NTdHky?=
 =?utf-8?B?VUszZjIzdEZRRkh4ZGZRUWpDWlpqa3ZDSjg3Mk5zOVdQMEgxejY2M3FWbmFs?=
 =?utf-8?B?bWlzcStsSm1uMkw2Ny9CL0RtVnRGTnNqY2NRRkhpRGJEcTBMMXNOVGlnNjlm?=
 =?utf-8?B?bk5veFY1QkxOTzFiK2VhZ3AzTDdRSElRTTlUalIxdFgwa0tuaVBUYzVGamNh?=
 =?utf-8?B?bER0MlJudllrWUdiTk1BNEJiUDg2NDZqbGVvODduR1Vwd2ZaWHdnQU5VMklz?=
 =?utf-8?B?ditXY3o2OWtDVWtMcTNHc0VrV0w0eUcvQnczYUJEUThqRDVjVTlLNnBobmNx?=
 =?utf-8?B?QzYvZ3R5Q01xTkpaL1AreitRbURudFYreTdIbUFQZDRpQjJkWVVDMloyUWxQ?=
 =?utf-8?B?U0lQN3FRWGtaSWNXbWprK1A5bGpmTVRVUnpkcDZxV05sMUtxcmNCRFpBSjJM?=
 =?utf-8?B?YXA4S0ZscEc1KytwdFNqcE8zOHBkci90OXlDZHdCVzhHczZ2SFJZZTJIMHgy?=
 =?utf-8?Q?h1L5N7Oo76GSMcfkWu/4qPJzU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5313d4f0-7a17-4e7f-cb11-08da9cbaf604
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5184.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 16:53:23.5298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BiA+TtSYP/yjql1mi82xquXLYRZGe0siExo5ZzPTJMiOfarNNGD6cbKPxOLh4zi/BmTDPExnE0j7QJIFt5Spkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On 9/22/2022 8:54 PM, Hans de Goede wrote:
> Hi,
> 
> On 9/22/22 15:12, Shyam Sundar S K wrote:
>> CnQF (a.k.a Cool and Quiet Framework) extends the static slider concept.
>> PMF dynamically manages system power limits and fan policy based on system
>> power trends which is representative of workload trend.
>>
>> Static slider and CnQF controls are mutually exclusive for system power
>> budget adjustments. CnQF supports configurable number of modes which can
>> be unique for AC and DC. Every mode is representative of a system state
>> characterized by unique steady state and boost behavior.
>>
>> OEMs can configure the different modes/system states and how the
>> transition to a mode happens. Whether to have CnQF manage system power
>> budget dynamically in AC or DC or both is also configurable. Mode changes
>> due to CnQF don't result in slider position change.
>>
>> The default OEM values are obtained after evaluating the PMF ACPI function
>> idx 11 & 12 for AC and DC respectively. Whether to turn ON/OFF by default
>> is guided by a "flag" passed by the OEM BIOS.
>>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> ---
>>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>>  drivers/platform/x86/amd/pmf/acpi.c   |  10 +
>>  drivers/platform/x86/amd/pmf/cnqf.c   | 335 ++++++++++++++++++++++++++
>>  drivers/platform/x86/amd/pmf/core.c   |  19 +-
>>  drivers/platform/x86/amd/pmf/pmf.h    |  99 ++++++++
>>  5 files changed, 463 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c
>>
>> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
>> index ef2b08c9174d..fdededf54392 100644
>> --- a/drivers/platform/x86/amd/pmf/Makefile
>> +++ b/drivers/platform/x86/amd/pmf/Makefile
>> @@ -6,4 +6,4 @@
>>  
>>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>>  amd-pmf-objs := core.o acpi.o sps.o \
>> -		auto-mode.o
>> +		auto-mode.o cnqf.o
>> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
>> index cb46a7252414..05a2b8a056fc 100644
>> --- a/drivers/platform/x86/amd/pmf/acpi.c
>> +++ b/drivers/platform/x86/amd/pmf/acpi.c
>> @@ -233,6 +233,16 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
>>  	return 0;
>>  }
>>  
>> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
>> +{
>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_AC, data, sizeof(*data));
>> +}
>> +
>> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
>> +{
>> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
>> +}
>> +
>>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>>  {
>>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
>> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
>> new file mode 100644
>> index 000000000000..ab002b15f59c
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
>> @@ -0,0 +1,335 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD Platform Management Framework Driver
>> + *
>> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
>> + * All Rights Reserved.
>> + *
>> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> + */
>> +
>> +#include <linux/workqueue.h>
>> +#include "pmf.h"
>> +
>> +static struct cnqf_config config_store;
>> +
>> +static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
>> +			    struct cnqf_config *table)
>> +{
>> +	struct power_table_control *pc;
>> +
>> +	pc = &config_store.mode_set[src][idx].power_control;
>> +
>> +	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
>> +	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
>> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, pc->stt_skin_temp[STT_TEMP_APU],
>> +			 NULL);
>> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, pc->stt_skin_temp[STT_TEMP_HS2],
>> +			 NULL);
>> +
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
>> +		apmf_update_fan_idx(dev,
>> +				    config_store.mode_set[src][idx].fan_control.manual,
>> +				    config_store.mode_set[src][idx].fan_control.fan_id);
>> +
>> +	return 0;
>> +}
>> +
>> +static void amd_pmf_update_power_threshold(void)
>> +{
>> +	struct cnqf_mode_settings *ts;
>> +	struct cnqf_tran_params *tp;
>> +	int i;
>> +
>> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> 
> Since as discussed it is possible that only
> APMF_FUNC_DYN_SLIDER_AC or APMF_FUNC_DYN_SLIDER_DC is supported,
> you need to check that the DYN_SLIDER matching the POWER_SOURCE
> which i represents is supported. 
> 
> But since this is only called from amd_pmf_load_defaults_cnqf()
> it is easier to just:
> 
> -drop the for loop here
> -add an "int src" function argument here
> -replace [i] with [src]
> 
> I have made this change while merging this. Please check the result in:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Flog%2F%3Fh%3Dreview-hans&amp;data=05%7C01%7Cshyam-sundar.s-k%40amd.com%7C84db329837a445997e1b08da9cae9d47%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994571050898640%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=uP0K4u8VaNRpIkoHllPSUh5TpJS5%2BIgKQ2aAjxNyM5A%3D&amp;reserved=0
> 
> Somewhat related note. It seems that tp->power_delta never gets set anywhere?
> and also that the whole struct cnqf_power_delta in the config_store is not
> used at all ?  Please either fix this or send a follow up patch to remove these.

Thank you. This is a good catch. We initially had thought to have
"power_delta" that OEMs can specify as a mode transition paramater (to
keep it similar like what we do in auto-mode).

But in the recent revisions of the PMF ACPI documentation, this has been
removed. So, the entire cnqf_power_delta structure is of no use.

I have sent a patch to remove all these instances.

> 
>> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_QUIET];
>> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
>> +		tp->power_threshold = ts->power_floor - tp->power_delta;
>> +
>> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_TURBO];
>> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
>> +		tp->power_threshold = ts->power_floor - tp->power_delta;
>> +
>> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
>> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
>> +		tp->power_threshold = ts->power_floor - tp->power_delta;
>> +
>> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
>> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
>> +		tp->power_threshold = ts->power_floor - tp->power_delta;
>> +
>> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
>> +		ts = &config_store.mode_set[i][CNQF_MODE_QUIET];
>> +		tp->power_threshold = ts->power_floor - tp->power_delta;
>> +
>> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
>> +		ts = &config_store.mode_set[i][CNQF_MODE_TURBO];
>> +		tp->power_threshold = ts->power_floor - tp->power_delta;
>> +	}
>> +}
>> +
>> +static const char *state_as_str(unsigned int state)
>> +{
>> +	switch (state) {
>> +	case CNQF_MODE_QUIET:
>> +		return "QUIET";
>> +	case CNQF_MODE_BALANCE:
>> +		return "BALANCED";
>> +	case CNQF_MODE_TURBO:
>> +		return "TURBO";
>> +	case CNQF_MODE_PERFORMANCE:
>> +		return "PERFORMANCE";
>> +	default:
>> +		return "Unknown CnQF mode";
>> +	}
>> +}
>> +
>> +static int amd_pmf_cnqf_get_power_source(struct amd_pmf_dev *dev)
>> +{
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) &&
>> +	    is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC))
>> +		return amd_pmf_get_power_source();
>> +	else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC))
>> +		return POWER_SOURCE_DC;
>> +	else
>> +		return POWER_SOURCE_AC;
>> +}
>> +
>> +int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
>> +{
>> +	struct cnqf_tran_params *tp;
>> +	int src, i, j;
>> +	u32 avg_power = 0;
>> +
>> +	src = amd_pmf_cnqf_get_power_source(dev);
>> +
>> +	if (dev->current_profile == PLATFORM_PROFILE_BALANCED) {
>> +		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
>> +	} else {
>> +		/*
>> +		 * Return from here if the platform_profile is not balanced
>> +		 * so that preference is given to user mode selection, rather
>> +		 * than enforcing CnQF to run all the time (if enabled)
>> +		 */
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
>> +		config_store.trans_param[src][i].timer += time_lapsed_ms;
>> +		config_store.trans_param[src][i].total_power += socket_power;
>> +		config_store.trans_param[src][i].count++;
>> +
>> +		tp = &config_store.trans_param[src][i];
>> +		if (tp->timer >= tp->time_constant && tp->count) {
>> +			avg_power = tp->total_power / tp->count;
>> +
>> +			/* Reset the indices */
>> +			tp->timer = 0;
>> +			tp->total_power = 0;
>> +			tp->count = 0;
>> +
>> +			if ((tp->shifting_up && avg_power >= tp->power_threshold) ||
>> +			    (!tp->shifting_up && avg_power <= tp->power_threshold)) {
>> +				tp->priority = true;
>> +			} else {
>> +				tp->priority = false;
>> +			}
>> +		}
>> +	}
>> +
>> +	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
>> +		avg_power, socket_power, state_as_str(config_store.current_mode));
>> +
>> +	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
>> +		/* apply the highest priority */
>> +		if (config_store.trans_param[src][j].priority) {
>> +			if (config_store.current_mode !=
>> +			    config_store.trans_param[src][j].target_mode) {
>> +				config_store.current_mode =
>> +						config_store.trans_param[src][j].target_mode;
>> +				dev_dbg(dev->dev, "Moving to Mode :%s\n",
>> +					state_as_str(config_store.current_mode));
>> +				amd_pmf_set_cnqf(dev, src,
>> +						 config_store.current_mode, NULL);
>> +			}
>> +			break;
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +
>> +static void amd_pmf_update_trans_data(int idx, struct apmf_dyn_slider_output out)
>> +{
>> +	struct cnqf_tran_params *tp;
>> +
>> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_QUIET];
>> +	tp->time_constant = out.t_balanced_to_quiet;
>> +	tp->target_mode = CNQF_MODE_QUIET;
>> +	tp->shifting_up = false;
>> +
>> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
>> +	tp->time_constant = out.t_balanced_to_perf;
>> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
>> +	tp->shifting_up = true;
>> +
>> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
>> +	tp->time_constant = out.t_quiet_to_balanced;
>> +	tp->target_mode = CNQF_MODE_BALANCE;
>> +	tp->shifting_up = true;
>> +
>> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
>> +	tp->time_constant = out.t_perf_to_balanced;
>> +	tp->target_mode = CNQF_MODE_BALANCE;
>> +	tp->shifting_up = false;
>> +
>> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
>> +	tp->time_constant = out.t_turbo_to_perf;
>> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
>> +	tp->shifting_up = false;
>> +
>> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_TURBO];
>> +	tp->time_constant = out.t_perf_to_turbo;
>> +	tp->target_mode = CNQF_MODE_TURBO;
>> +	tp->shifting_up = true;
>> +}
>> +
>> +static void amd_pmf_update_mode_set(int idx, struct apmf_dyn_slider_output out)
>> +{
>> +	struct cnqf_mode_settings *ms;
>> +
>> +	/* Quiet Mode */
>> +	ms = &config_store.mode_set[idx][CNQF_MODE_QUIET];
>> +	ms->power_floor = out.ps[APMF_CNQF_QUIET].pfloor;
>> +	ms->power_control.fppt = out.ps[APMF_CNQF_QUIET].fppt;
>> +	ms->power_control.sppt = out.ps[APMF_CNQF_QUIET].sppt;
>> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_QUIET].sppt_apu_only;
>> +	ms->power_control.spl = out.ps[APMF_CNQF_QUIET].spl;
>> +	ms->power_control.stt_min = out.ps[APMF_CNQF_QUIET].stt_min_limit;
>> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
>> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_APU];
>> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
>> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_HS2];
>> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_QUIET].fan_id;
>> +
>> +	/* Balance Mode */
>> +	ms = &config_store.mode_set[idx][CNQF_MODE_BALANCE];
>> +	ms->power_floor = out.ps[APMF_CNQF_BALANCE].pfloor;
>> +	ms->power_control.fppt = out.ps[APMF_CNQF_BALANCE].fppt;
>> +	ms->power_control.sppt = out.ps[APMF_CNQF_BALANCE].sppt;
>> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_BALANCE].sppt_apu_only;
>> +	ms->power_control.spl = out.ps[APMF_CNQF_BALANCE].spl;
>> +	ms->power_control.stt_min = out.ps[APMF_CNQF_BALANCE].stt_min_limit;
>> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
>> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_APU];
>> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
>> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_HS2];
>> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_BALANCE].fan_id;
>> +
>> +	/* Performance Mode */
>> +	ms = &config_store.mode_set[idx][CNQF_MODE_PERFORMANCE];
>> +	ms->power_floor = out.ps[APMF_CNQF_PERFORMANCE].pfloor;
>> +	ms->power_control.fppt = out.ps[APMF_CNQF_PERFORMANCE].fppt;
>> +	ms->power_control.sppt = out.ps[APMF_CNQF_PERFORMANCE].sppt;
>> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_PERFORMANCE].sppt_apu_only;
>> +	ms->power_control.spl = out.ps[APMF_CNQF_PERFORMANCE].spl;
>> +	ms->power_control.stt_min = out.ps[APMF_CNQF_PERFORMANCE].stt_min_limit;
>> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
>> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_APU];
>> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
>> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_HS2];
>> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_PERFORMANCE].fan_id;
>> +
>> +	/* Turbo Mode */
>> +	ms = &config_store.mode_set[idx][CNQF_MODE_TURBO];
>> +	ms->power_floor = out.ps[APMF_CNQF_TURBO].pfloor;
>> +	ms->power_control.fppt = out.ps[APMF_CNQF_TURBO].fppt;
>> +	ms->power_control.sppt = out.ps[APMF_CNQF_TURBO].sppt;
>> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_TURBO].sppt_apu_only;
>> +	ms->power_control.spl = out.ps[APMF_CNQF_TURBO].spl;
>> +	ms->power_control.stt_min = out.ps[APMF_CNQF_TURBO].stt_min_limit;
>> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
>> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_APU];
>> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
>> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_HS2];
>> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_TURBO].fan_id;
>> +}
>> +
>> +static int amd_pmf_check_flags(struct amd_pmf_dev *dev)
>> +{
>> +	struct apmf_dyn_slider_output out = {};
>> +
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC))
>> +		apmf_get_dyn_slider_def_ac(dev, &out);
>> +	else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC))
>> +		apmf_get_dyn_slider_def_dc(dev, &out);
>> +
>> +	return out.flags;
>> +}
>> +
>> +static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
>> +{
>> +	struct apmf_dyn_slider_output out;
>> +	int i, j, ret;
>> +
>> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> 
> Since as discussed it is possible that only
> APMF_FUNC_DYN_SLIDER_AC or APMF_FUNC_DYN_SLIDER_DC is supported,
> you need to check for that here before, I have added the following
> check while merging this:
> 
> 		if (!is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC + i))
> 			continue;
> 
> Please check and *test* the resulting code, which can be found here:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Flog%2F%3Fh%3Dreview-hans&amp;data=05%7C01%7Cshyam-sundar.s-k%40amd.com%7C84db329837a445997e1b08da9cae9d47%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637994571050898640%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=uP0K4u8VaNRpIkoHllPSUh5TpJS5%2BIgKQ2aAjxNyM5A%3D&amp;reserved=0

Thank you for making these changes while merging. I have tested it along
with the removal of cnqf_power_delta structure and all the changes in
"review-hans" branch works!

Thanks,
Shyam


> 
>> +		if (i == POWER_SOURCE_AC)
>> +			ret = apmf_get_dyn_slider_def_ac(dev, &out);
>> +		else
>> +			ret = apmf_get_dyn_slider_def_dc(dev, &out);
>> +		if (ret) {
>> +			dev_err(dev->dev, "APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
>> +			return ret;
>> +		}
>> +
>> +		amd_pmf_update_mode_set(i, out);
>> +		amd_pmf_update_trans_data(i, out);
>> +
>> +		for (j = 0; j < CNQF_MODE_MAX; j++) {
>> +			if (config_store.mode_set[i][j].fan_control.fan_id == FAN_INDEX_AUTO)
>> +				config_store.mode_set[i][j].fan_control.manual = false;
>> +			else
>> +				config_store.mode_set[i][j].fan_control.manual = true;
>> +		}
>> +	}
>> +	amd_pmf_update_power_threshold();
>> +	/* set to initial default values */
>> +	config_store.current_mode = CNQF_MODE_BALANCE;
>> +
>> +	return 0;
>> +}
>> +
>> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
>> +{
>> +	cancel_delayed_work_sync(&dev->work_buffer);
>> +}
>> +
>> +int amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
>> +{
>> +	int ret, src;
>> +
>> +	/*
>> +	 * Note the caller of this function has already checked that both
>> +	 * APMF_FUNC_DYN_SLIDER_AC and APMF_FUNC_DYN_SLIDER_DC are supported.
>> +	 */
>> +
>> +	ret = amd_pmf_load_defaults_cnqf(dev);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	amd_pmf_init_metrics_table(dev);
>> +
>> +	dev->cnqf_supported = true;
>> +	dev->cnqf_enabled = amd_pmf_check_flags(dev);
>> +
>> +	/* update the thermal for CnQF */
>> +	if (dev->cnqf_enabled && dev->current_profile == PLATFORM_PROFILE_BALANCED) {
>> +		src = amd_pmf_cnqf_get_power_source(dev);
>> +		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
>> +		dev->cnqf_enabled = true;
> 
> We only enter the if-block code if cnqf_enabled is true, so this is a no-op
> I've dropped this line while merging this.
> 
> Regards,
> 
> Hans
> 
>> +	}
>> +
>> +	return 0;
>> +}
>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>> index a675ca969331..99be1e6d57d3 100644
>> --- a/drivers/platform/x86/amd/pmf/core.c
>> +++ b/drivers/platform/x86/amd/pmf/core.c
>> @@ -123,6 +123,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>>  		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>>  	}
>>  
>> +	if (dev->cnqf_enabled) {
>> +		/* Apply the CnQF transition */
>> +		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
>> +	}
>> +
>>  	dev->start_time = ktime_to_ms(ktime_get());
>>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
>>  	mutex_unlock(&dev->update_mutex);
>> @@ -252,6 +257,8 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>  
>>  static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>  {
>> +	int ret;
>> +
>>  	/* Enable Static Slider */
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>>  		amd_pmf_init_sps(dev);
>> @@ -262,6 +269,12 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>>  		amd_pmf_init_auto_mode(dev);
>>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
>> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
>> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
>> +		/* Enable Cool n Quiet Framework (CnQF) */
>> +		ret = amd_pmf_init_cnqf(dev);
>> +		if (ret)
>> +			dev_warn(dev->dev, "CnQF Init failed\n");
>>  	}
>>  }
>>  
>> @@ -270,8 +283,12 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>>  		amd_pmf_deinit_sps(dev);
>>  
>> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE))
>> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>>  		amd_pmf_deinit_auto_mode(dev);
>> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
>> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
>> +		amd_pmf_deinit_cnqf(dev);
>> +	}
>>  }
>>  
>>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
>> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
>> index 0a72a395c2ef..24dd6fbff24c 100644
>> --- a/drivers/platform/x86/amd/pmf/pmf.h
>> +++ b/drivers/platform/x86/amd/pmf/pmf.h
>> @@ -22,6 +22,8 @@
>>  #define APMF_FUNC_AUTO_MODE					5
>>  #define APMF_FUNC_SET_FAN_IDX				7
>>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>> +#define APMF_FUNC_DYN_SLIDER_AC				11
>> +#define APMF_FUNC_DYN_SLIDER_DC				12
>>  
>>  /* Message Definitions */
>>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
>> @@ -165,6 +167,8 @@ struct amd_pmf_dev {
>>  	int socket_power_history_idx;
>>  	bool amt_enabled;
>>  	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
>> +	bool cnqf_enabled;
>> +	bool cnqf_supported;
>>  };
>>  
>>  struct apmf_sps_prop_granular {
>> @@ -294,6 +298,93 @@ struct apmf_auto_mode {
>>  	u32 fan_id_quiet;
>>  } __packed;
>>  
>> +/* CnQF Layer */
>> +enum cnqf_trans_priority {
>> +	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
>> +	CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE, /* quiet/balance to Performance Mode */
>> +	CNQF_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
>> +	CNQF_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
>> +	CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance/Turbo to Balance Mode */
>> +	CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE, /* Turbo mode to Performance Mode */
>> +	CNQF_TRANSITION_MAX,
>> +};
>> +
>> +enum cnqf_mode {
>> +	CNQF_MODE_QUIET,
>> +	CNQF_MODE_BALANCE,
>> +	CNQF_MODE_PERFORMANCE,
>> +	CNQF_MODE_TURBO,
>> +	CNQF_MODE_MAX,
>> +};
>> +
>> +enum apmf_cnqf_pos {
>> +	APMF_CNQF_TURBO,
>> +	APMF_CNQF_PERFORMANCE,
>> +	APMF_CNQF_BALANCE,
>> +	APMF_CNQF_QUIET,
>> +	APMF_CNQF_MAX,
>> +};
>> +
>> +struct cnqf_mode_settings {
>> +	struct power_table_control power_control;
>> +	struct fan_table_control fan_control;
>> +	u32 power_floor;
>> +};
>> +
>> +struct cnqf_tran_params {
>> +	u32 time_constant; /* minimum time required to switch to next mode */
>> +	u32 power_delta; /* minimum power required to switch to next mode */
>> +	u32 power_threshold;
>> +	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
>> +	u32 total_power;
>> +	u32 count;
>> +	bool priority;
>> +	bool shifting_up;
>> +	enum cnqf_mode target_mode;
>> +};
>> +
>> +struct cnqf_power_delta {
>> +	u32 to_turbo;
>> +	u32 balance_to_perf;
>> +	u32 quiet_to_balance;
>> +	u32 to_quiet;
>> +	u32 perf_to_balance;
>> +	u32 turbo_to_perf;
>> +};
>> +
>> +struct cnqf_config {
>> +	struct cnqf_tran_params trans_param[POWER_SOURCE_MAX][CNQF_TRANSITION_MAX];
>> +	struct cnqf_mode_settings mode_set[POWER_SOURCE_MAX][CNQF_MODE_MAX];
>> +	struct power_table_control defaults;
>> +	enum cnqf_mode current_mode;
>> +	struct cnqf_power_delta power_delta[POWER_SOURCE_MAX];
>> +	u32 power_src;
>> +	u32 avg_power;
>> +};
>> +
>> +struct apmf_cnqf_power_set {
>> +	u32 pfloor;
>> +	u32 fppt;
>> +	u32 sppt;
>> +	u32 sppt_apu_only;
>> +	u32 spl;
>> +	u32 stt_min_limit;
>> +	u8 stt_skintemp[STT_TEMP_COUNT];
>> +	u32 fan_id;
>> +} __packed;
>> +
>> +struct apmf_dyn_slider_output {
>> +	u16 size;
>> +	u16 flags;
>> +	u32 t_perf_to_turbo;
>> +	u32 t_balanced_to_perf;
>> +	u32 t_quiet_to_balanced;
>> +	u32 t_balanced_to_quiet;
>> +	u32 t_perf_to_balanced;
>> +	u32 t_turbo_to_perf;
>> +	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
>> +} __packed;
>> +
>>  /* Core Layer */
>>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>> @@ -324,4 +415,12 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>>  void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
>>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
>>  void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
>> +
>> +/* CnQF Layer */
>> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
>> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
>> +int amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
>> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
>> +int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
>> +
>>  #endif /* PMF_H */
> 
