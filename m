Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78A5254219B
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jun 2022 08:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiFHEyv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jun 2022 00:54:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbiFHEyM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 00:54:12 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6665E26C0D9;
        Tue,  7 Jun 2022 18:26:37 -0700 (PDT)
Received: from dggpemm500020.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4LHqJv1XQ4z1KH3V;
        Wed,  8 Jun 2022 09:24:47 +0800 (CST)
Received: from dggpemm500014.china.huawei.com (7.185.36.153) by
 dggpemm500020.china.huawei.com (7.185.36.49) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 09:26:35 +0800
Received: from [10.174.178.120] (10.174.178.120) by
 dggpemm500014.china.huawei.com (7.185.36.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 8 Jun 2022 09:26:33 +0800
Message-ID: <a820f287-e879-6183-a917-6a577b6160ab@huawei.com>
Date:   Wed, 8 Jun 2022 09:26:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
From:   mawupeng <mawupeng1@huawei.com>
Subject: Re: [PATCH v3 4/6] mm: Demote warning message in vmemmap_verify() to
 debug level
To:     <david@redhat.com>, <corbet@lwn.net>, <will@kernel.org>,
        <ardb@kernel.org>, <catalin.marinas@arm.com>
CC:     <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
        <dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
        <dvhart@infradead.org>, <andy@infradead.org>, <rppt@kernel.org>,
        <akpm@linux-foundation.org>, <paul.walmsley@sifive.com>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <paulmck@kernel.org>, <keescook@chromium.org>,
        <songmuchun@bytedance.com>, <rdunlap@infradead.org>,
        <damien.lemoal@opensource.wdc.com>, <swboyd@chromium.org>,
        <wei.liu@kernel.org>, <robin.murphy@arm.com>,
        <anshuman.khandual@arm.com>, <thunder.leizhen@huawei.com>,
        <wangkefeng.wang@huawei.com>, <gpiccoli@igalia.com>,
        <chenhuacai@kernel.org>, <geert@linux-m68k.org>,
        <vijayb@linux.microsoft.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-efi@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
        <linux-mm@kvack.org>, <linux-riscv@lists.infradead.org>,
        <mawupeng1@huawei.com>
References: <20220607093805.1354256-1-mawupeng1@huawei.com>
 <20220607093805.1354256-5-mawupeng1@huawei.com>
 <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
In-Reply-To: <b1975f44-2552-a03c-bb6f-1452f1fd99c0@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.120]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500014.china.huawei.com (7.185.36.153)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



在 2022/6/7 20:25, David Hildenbrand 写道:
> On 07.06.22 11:38, Wupeng Ma wrote:
>> From: Ma Wupeng <mawupeng1@huawei.com>
>>
>> For a system only have limited mirrored memory or some numa node without
>> mirrored memory, the per node vmemmap page_structs prefer to allocate
>> memory from mirrored region, which will lead to vmemmap_verify() in
>> vmemmap_populate_basepages() report lots of warning message.
>>
>> This patch demote the "potential offnode page_structs" warning messages
>> to debug level to avoid a very long print during bootup.
>>
>> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
>> ---
>>   mm/sparse-vmemmap.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
>> index f4fa61dbbee3..78debdb89eb1 100644
>> --- a/mm/sparse-vmemmap.c
>> +++ b/mm/sparse-vmemmap.c
>> @@ -528,7 +528,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>>   	int actual_node = early_pfn_to_nid(pfn);
>>   
>>   	if (node_distance(actual_node, node) > LOCAL_DISTANCE)
>> -		pr_warn("[%lx-%lx] potential offnode page_structs\n",
>> +		pr_debug("[%lx-%lx] potential offnode page_structs\n",
>>   			start, end - 1);
>>   }
>>   
> 
> This will possibly hide it in environments where this might indeed
> indicate performance issues.
> 
> What about a pr_warn_once()?
> 

Sure.

This will works. We can certainly use a pr_warn_once().
