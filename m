Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2677109A1
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 May 2023 12:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240842AbjEYKOz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 25 May 2023 06:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240877AbjEYKOs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 May 2023 06:14:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D6F410C3
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 03:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685009603;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3qUwZavWeot6BxoSwWB1BeOsQSAKpT3nzUsF0j/xmbk=;
        b=D01RmVjjS45Yojiu6A8v/yGbvGoQDaLjR+ajL6/xlMPKIIWvK/iHzC93Dvd/UMki/rjxnc
        OSGo6xwikcPtNXwBQBAaLEvmhQubmg+7VX/OFTafFzDs381JJQ4SRl+Cjorl7hIrjcV1ou
        2r3ONulB19T3ffvrR/JHUKtYbngjo4g=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-WS-kA7BAPCOlOab26Lnmyg-1; Thu, 25 May 2023 06:13:20 -0400
X-MC-Unique: WS-kA7BAPCOlOab26Lnmyg-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-513fd7d56c8so2477595a12.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 May 2023 03:13:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685009596; x=1687601596;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qUwZavWeot6BxoSwWB1BeOsQSAKpT3nzUsF0j/xmbk=;
        b=daZAgKjm7XRDaZnPrKDFMbke2LStANgS/4v5+ojYnsZ6P9FugiTYrlsKK8NPUl9fmn
         pVt65rWNmzcDA78QTT5Pc4Cm6eqGuu9YWKVCenVFMlalCZPjy8ABK4rRLrUfDeNBfkaX
         Fmj7wdPPVfm8FbW0pvdNBEOunn/aAcENVf+qWh9MI2w7joiFjX8VXqaq/qCETNuWsLid
         0ZJjOzTlyqr/HjZyfnxe31AmdL6czBol6a5DJA3l1ya9MCXnsxwb3wI4kUpzuTOAyRrE
         MAl0Vgdox4aLypJZYZEMvW73hn0+XVVebSbLi4YLDmwJ0f4Iz9EaNvt75/bL01qjCNnX
         823w==
X-Gm-Message-State: AC+VfDyO+LOJApXW/Td9NxLdtun/nSzOyvzGb8oijfWf7vJvwpWfVQJQ
        0yLzOOp2k1jeU42min9qS3nDq+4RBXq+0IWmIARG2Y21u6yo5rzkKwjuK5uKwYPWxnC4tdzIADx
        geVh2OvqyC/rf6LrLk2XPr36BJZfgDtBKYQ==
X-Received: by 2002:a17:907:720f:b0:972:aa30:203e with SMTP id dr15-20020a170907720f00b00972aa30203emr1112324ejc.34.1685009596735;
        Thu, 25 May 2023 03:13:16 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4UVuOdKtAJmTw+9/lxOTaN96LepZ+KFwgazTOkVRaQ7goTvLQZICLYaLw7QL++QbWevUCWkA==
X-Received: by 2002:a17:907:720f:b0:972:aa30:203e with SMTP id dr15-20020a170907720f00b00972aa30203emr1112304ejc.34.1685009596436;
        Thu, 25 May 2023 03:13:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kq10-20020a170906abca00b00960005e09a3sm648261ejb.61.2023.05.25.03.13.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 03:13:15 -0700 (PDT)
Message-ID: <dcdb3d12-e0af-5e4d-119e-d4fbe9a9495b@redhat.com>
Date:   Thu, 25 May 2023 12:13:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/4] platform/x86/amd: pmc: Use pm_pr_dbg() for suspend
 related messages
Content-Language: en-US, nl
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc:     "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>,
        "Natikar, Basavaraj" <Basavaraj.Natikar@amd.com>
References: <20230522200033.2605-1-mario.limonciello@amd.com>
 <20230522200033.2605-4-mario.limonciello@amd.com>
 <e9eb526d-84fe-b814-67a3-6f7977aa0078@redhat.com>
 <MN0PR12MB6101AF7606A3547EC5AA42A7E2409@MN0PR12MB6101.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <MN0PR12MB6101AF7606A3547EC5AA42A7E2409@MN0PR12MB6101.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 5/23/23 18:21, Limonciello, Mario wrote:
> [AMD Official Use Only - General]
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Tuesday, May 23, 2023 6:08 AM
>> To: Limonciello, Mario <Mario.Limonciello@amd.com>; rafael@kernel.org;
>> linus.walleij@linaro.org
>> Cc: linux-acpi@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> gpio@vger.kernel.org; platform-driver-x86@vger.kernel.org; linux-
>> pm@vger.kernel.org; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>;
>> Natikar, Basavaraj <Basavaraj.Natikar@amd.com>
>> Subject: Re: [PATCH v2 4/4] platform/x86/amd: pmc: Use pm_pr_dbg() for
>> suspend related messages
>>
>> Hi Mario,
>>
>> On 5/22/23 22:00, Mario Limonciello wrote:
>>> Using pm_pr_dbg() allows users to toggle
>> `/sys/power/pm_debug_messages`
>>> as a single knob to turn on messages that amd-pmc can emit to aid in
>>> any s2idle debugging.
>>>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> ---
>>>  drivers/platform/x86/amd/pmc.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmc.c
>> b/drivers/platform/x86/amd/pmc.c
>>> index 427905714f79..1304cd6f13f6 100644
>>> --- a/drivers/platform/x86/amd/pmc.c
>>> +++ b/drivers/platform/x86/amd/pmc.c
>>> @@ -543,7 +543,7 @@ static int amd_pmc_idlemask_read(struct
>> amd_pmc_dev *pdev, struct device *dev,
>>>     }
>>>
>>>     if (dev)
>>> -           dev_dbg(pdev->dev, "SMU idlemask s0i3: 0x%x\n", val);
>>> +           pm_pr_dbg("SMU idlemask s0i3: 0x%x\n", val);
>>>
>>>     if (s)
>>>             seq_printf(s, "SMU idlemask : 0x%x\n", val);
>>
>> This does not compile, amd/pmc.c may be build as an amd-pmc.ko module
>> and currently the pm_debug_messages_on flag used by pm_pr_dbg()
>> is not exported to modules:
>>
>>   CC [M]  drivers/platform/x86/amd/pmc.o
>>   LD [M]  drivers/platform/x86/amd/amd-pmc.o
>>   MODPOST Module.symvers
>> ERROR: modpost: "pm_debug_messages_on"
>> [drivers/platform/x86/amd/amd-pmc.ko] undefined!
>> make[1]: *** [scripts/Makefile.modpost:136: Module.symvers] Error 1
>> make: *** [Makefile:1978: modpost] Error 2
>>
>> Regards,
>>
>> Hans
>>
> 
> My apologies, yes I was compiling in when testing.  Let me ask if this
> series makes sense and is "generally" agreeable though.

I have no objections against this series, otherwise I don't really
have a strong opinion on this series.

If this makes sense and if exporting pm_debug_messages_on is ok
is Rafael's call to make IMHO.

Rafael ?

Regards,

Hans




