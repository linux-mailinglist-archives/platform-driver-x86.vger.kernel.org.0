Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96AF569B981
	for <lists+platform-driver-x86@lfdr.de>; Sat, 18 Feb 2023 11:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229916AbjBRKum (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 18 Feb 2023 05:50:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjBRKum (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Feb 2023 05:50:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10F46211D4
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Feb 2023 02:49:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676717397;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mhV9Rm9Yor6F6H/Z0Cs8WfMo7dXK4eYKdPWtQKRW3yU=;
        b=ZwuXl8MCiJjfoofNRIEeC/5zNQTIBFP4wEZyz2b+EsQlCuC52fCEdNWTfKjU6Rse13N9OX
        dLdUYUe4Rz0NBJfkLupDs+7l+h+wot4o5giW80XfRsI9OYXIoh3dZmrdRPjInlralN0TIX
        zGNLcsypWtda0HZwLcXpp62ZEme0sc8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-LG5eWU8NPjCR5g1jeMIVGA-1; Sat, 18 Feb 2023 05:49:55 -0500
X-MC-Unique: LG5eWU8NPjCR5g1jeMIVGA-1
Received: by mail-ed1-f70.google.com with SMTP id en8-20020a056402528800b004a26cc7f6cbso708805edb.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Feb 2023 02:49:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mhV9Rm9Yor6F6H/Z0Cs8WfMo7dXK4eYKdPWtQKRW3yU=;
        b=YZ3baq8sTUetFPy5EEcemXlwsHdvbSQi7ZuTGH45Gn4gsCYquMzGu3N7cfnchhrvYZ
         vpDgdxnwnjLXEFDZWC+kCnkwJLPWVcBSgX2v0Cgp7w/vdw1Hx3PjwI70dB0rj7YfUs/W
         RgZ/RtrL20p4+kGKqlXUnjJzChSH9Shbg10110AEe4F6uC73NK/Xh+OfkuTQh8i+6foZ
         JQNVc1X9sFrfu4LH8TguqOwxZ//f2414cFc8Buk4kWSB2ZmAODoLL4N2Yqnv9kFZTc50
         v7k+/cb43sDSI0c5DhhuISxFmKU0Ufw2e1lnjpmNIkilFsa+8mCcSdMoeRUCDLDQIhAu
         75sw==
X-Gm-Message-State: AO0yUKU1Kke47XnBwLh1rDo099AUaF8gqdiGNRUJPFaZqzgYzhfb9uf8
        pSJRr2t6xZOxCFRVuKG9qI4gGQDYtUnTrXFRK8DZFAua0igT44T0VzvTbSaq2YoVft8SB4iyJ6X
        COV8E2C/68RPcSkgeiqC1Vva6/Sxj+P5GN28l3g4=
X-Received: by 2002:a17:907:d87:b0:8bf:2458:a82a with SMTP id go7-20020a1709070d8700b008bf2458a82amr1589432ejc.75.1676717394164;
        Sat, 18 Feb 2023 02:49:54 -0800 (PST)
X-Google-Smtp-Source: AK7set8Iws+bUDN2YP4Z+rBv6i7xQGTZ7sxku1gq2v8ELQLwekn8r0a+m1GHgBFIMTRHaixOECf/EA==
X-Received: by 2002:a17:907:d87:b0:8bf:2458:a82a with SMTP id go7-20020a1709070d8700b008bf2458a82amr1589418ejc.75.1676717393906;
        Sat, 18 Feb 2023 02:49:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id y17-20020a1709064b1100b008b7a9ff7dfdsm1289839eju.162.2023.02.18.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:49:53 -0800 (PST)
Message-ID: <9be4b45a-83cb-b671-e7df-c4c8812b5506@redhat.com>
Date:   Sat, 18 Feb 2023 11:49:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/5] apple-gmux: support MMIO gmux on T2 Macs
Content-Language: en-US, nl
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lukas Wunner <lukas@wunner.de>,
        Seth Forshee <sforshee@kernel.org>,
        Aditya Garg <gargaditya08@live.com>,
        Aun-Ali Zaidi <admin@kodeit.net>,
        Kerem Karabay <kekrby@gmail.com>
References: <20230216122342.5918-1-orlandoch.dev@gmail.com>
 <20230216122342.5918-5-orlandoch.dev@gmail.com>
 <cd6beabe-3026-d84e-63fd-3833948ecc1f@redhat.com>
 <20230217110531.6d3c07a1@redecorated-mbp>
 <20230217230246.53e3d013@redecorated-mbp>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230217230246.53e3d013@redecorated-mbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/17/23 13:02, Orlando Chamberlain wrote:
> On Fri, 17 Feb 2023 11:05:31 +1100
> Orlando Chamberlain <orlandoch.dev@gmail.com> wrote:
>>>
>>> Question are we not worried about MacBooks with an "APP000B"
>>> ACPI device (with a value IORSOURCE_MEM entry) but which do not
>>> actually have a gmux, because they are iGPU only ?  
>>
>> It looks like iMac20,1, iMac20,2, and iMacPro1,1 have APP000B:
>>
>> apple_gmux: Failed to find gmux I/O resource
>>
>> iMac20,2: https://linux-hardware.org/?probe=ec2af584b3&log=dmesg
>> iMac20,1: https://linux-hardware.org/?probe=fee7644b9c&log=dmesg
>> iMacPro1,1: https://linux-hardware.org/?probe=6c26c9ff8c&log=dmesg
>>
>> But I'm not sure if they actually have it or not. I'll see if I can
>> get people with those models to test if it's a real gmux. There does
>> seem to be a pattern in that those three all have AMD GPU's.
> 
> Kerem Karabay managed to find the acpi tables and macOS's ioreg from and
> iMacPro1,1:
> 
> https://github.com/khronokernel/DarwinDumped/blob/master/iMacPro/iMacPro1%2C1/Darwin%20Dumper/DarwinDumper_3.0.4_30.12_15.30.40_iMacPro1%2C1_Apple_X64_High%20Sierra_17C2120_apple/ACPI%20Tables/DSL/DSDT.dsl#L10423
> https://github.com/khronokernel/DarwinDumped/blob/master/iMacPro/iMacPro1%2C1/Darwin%20Dumper/DarwinDumper_3.0.4_30.12_15.30.40_iMacPro1%2C1_Apple_X64_High%20Sierra_17C2120_apple/IORegistry/IOReg.txt#L5096
> 
> The DSDT table has the same APP000B device as MacBooks with actual gmux,
> while the ioreg has no mention of Apple's driver AppleMuxControl2 being
> used for that device.
> 
> I think that confirms Apple has not fixed the issue of putting
> APP000B's where they don't need to.
> 
> Solutions to this I can think of are:
> 
> - Use DMI matching to ignore product_names "iMacPro1,1" "iMac20,1",
>   "iMac20,2"
> - Maybe check if the MMIO region for gmux is filled with 0xff*
> 
> *I don't know if this would work or not as I don't have a machine to
> check with. On my machine everything surrounding the 16 bytes used for
> gmux is 0xff:
> 
> # hexdump -n48 -C -s 0xfe0b01f0 /dev/mem
> fe0b01f0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> fe0b0200  00 00 3e 4f 00 00 00 00  00 00 00 00 00 00 14 00  |..>O............|
> fe0b0210  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
> 
> so maybe on the iMacPro and iMac's, this would all be 0xff.

Yes checking for a regular ioread32 returning 0xffffffff sounds
like it should work. Can you add a check for that in the next version
please ?  Note this means we still need to do an iomap + unmap as
you pointed out in another email, but I see no way around that.

Regards,

Hans




> 
>>
>> I've looked at dmesg or at least lsmod on all the models with the T2
>> chip and there wasn't evidence of any other models having that error
>> or having apple-gmux loaded on any models that shouldn't have a gmux,
>> other than the three mentioned above. Of course I don't know if its
>> possible for there to be firmware versions where this isn't the case.
>>
>>>
>>> I have learned the hard way (through backlight control regressions
>>> in 6.1) that at least some older model MacBooks with an IO resource
>>> have an APP000B ACPI device without them actually having a gmux,
>>> these get caught by the version check and then do not pass the
>>> indexed check so that apple_gmux_detect() properly returns false.
>>>
>>> Maybe make gmux_mmio_read32() a static inline inside
>>> include/linux/apple-gmux.h and try to read the version here ?  
>>
>> For that would we need to ioremap() and iounmap()?
>>>
>>> Has this been tested on iGPU only T2 Macs?  
>>
>> I don't think so. 
>>
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>   
>>
> 

