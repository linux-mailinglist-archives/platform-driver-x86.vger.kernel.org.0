Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AD4B4D8729
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Mar 2022 15:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240253AbiCNOop (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Mar 2022 10:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240211AbiCNOop (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Mar 2022 10:44:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 85D5522BC9
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 07:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1647269013;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gDC4933YD2MQFQE49RmA4SntCCmlCVRGSrxnMjk9m9k=;
        b=ggdvsdATLajcOMyVd1dDCfE8OCDDd0dIkyAxO1omT8Sm3gSaUBQ+2ZMtOybyz6rfCh0n3x
        SBw6ZPOyerePpRWc7fo+Og+jhAwXwhHPCpZ/r//PiNB8aUIL6NKnRdTvB3gGVbBFvXI51+
        q+8GdS9SszLKQuhy6xLTuiUfscAGp6Q=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-xnBhvrKdMO27ImcXATFTLg-1; Mon, 14 Mar 2022 10:43:32 -0400
X-MC-Unique: xnBhvrKdMO27ImcXATFTLg-1
Received: by mail-ej1-f72.google.com with SMTP id og24-20020a1709071dd800b006dab87bec4fso8086420ejc.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Mar 2022 07:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gDC4933YD2MQFQE49RmA4SntCCmlCVRGSrxnMjk9m9k=;
        b=QOM/O9y6QBWmEr2UdyJKxljbbGDrbX65Mm8CFx12b6ISIK2cHwvxZA/8bASx0bvcEn
         imXXXTcowv4yg+C9LYmi8lZUF+u/wicijrYXSRwcTyEWDCYn86srxzYAVCx/azCPfKzk
         3Y/NvER3s3UzLD6Kn1hotzgurG7fokOhvGd+qhIWTToXJT2itYdVD6jeFBrpyTNP5C7a
         /xPK6tcLR9tOLDq02ephdc1O0BnVuHFfnv2242uqfwyAEegddMTYlncuaLySNyMgnpip
         n22J/d/cxThF2pyen3jKLkC5xRxhwfNLVsIgeDG3NWwaIA6GU/GJOZ5zqKA3j4qXvme6
         FFAw==
X-Gm-Message-State: AOAM533JOrc8gSUvFgq3i3Z5/cfRWW5XcbPX+ir5xUYdjzLfJ8Ax5JGF
        eghgrm6fpxHlyiqnqU3WQFvLlMZf4GlO0JR2PVit0CM9bnplhyq6y+MbLqi719YMxrz45q2gbrn
        Nc4zA4oeMek4YYjEcPq6JT+GKkGT9pzmfZQ==
X-Received: by 2002:a17:906:7210:b0:6d6:7881:1483 with SMTP id m16-20020a170906721000b006d678811483mr18505411ejk.227.1647269011148;
        Mon, 14 Mar 2022 07:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaTNp/X1z3yFB46WfcBbRxur64lkmZvgnWG4EPTJ5ZkZpMl0ZceLhCEg49D2vvTzjjFbCtNg==
X-Received: by 2002:a17:906:7210:b0:6d6:7881:1483 with SMTP id m16-20020a170906721000b006d678811483mr18505389ejk.227.1647269010909;
        Mon, 14 Mar 2022 07:43:30 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id gf17-20020a170906e21100b006da960ce78dsm6866525ejb.59.2022.03.14.07.43.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Mar 2022 07:43:30 -0700 (PDT)
Message-ID: <c16ea8ba-5944-0384-4bc3-d5438fe5e1f7@redhat.com>
Date:   Mon, 14 Mar 2022 15:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [External] Re: [RFC] ACPI: platform-profile: support for AC vs DC
 modes
Content-Language: en-US
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     "rafael@kernel.org" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <markpearson@lenovo.com>
 <20220301201554.4417-1-markpearson@lenovo.com>
 <65d8cf3b-0eea-0583-fa23-e2c71287fb85@redhat.com>
 <BL1PR12MB5157CDB77675859B7F279578E2099@BL1PR12MB5157.namprd12.prod.outlook.com>
 <7b281a37-5163-6cd7-360e-1c63bde714a8@redhat.com>
 <BL1PR12MB5157125246817A70649C12F7E2099@BL1PR12MB5157.namprd12.prod.outlook.com>
 <1cd4ae24-ae92-302e-ac87-76ef15472a9f@redhat.com>
 <2180533b-c921-5ae4-e6bc-569728a4f990@lenovo.com>
 <c18abb55-6874-6e1e-bdb0-9d96d52987cd@redhat.com>
 <BL1PR12MB5157C14DE5F521D4B5C08366E20F9@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BL1PR12MB5157C14DE5F521D4B5C08366E20F9@BL1PR12MB5157.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 3/14/22 14:39, Limonciello, Mario wrote:
> [Public]
> 
>>>
>>> I cycled through a few different implementations but came down on what I
>>> proposed. I considered 6 values - but I don't think that makes sense and
>>> makes it overall more complicated than it needs to be and less flexible.
>>
>> Ah, so to be clear, my 2 scenarios above were theoretical scenarios,
>> because I'm wondering how the firmware API here actually looks like,
>> something which so far is not really clear to me.
>>
>> When you say that you considered using 6 values, then I guess that
>> the firmware API actually offers 6 values which we can write to a single slot:
>> ac-low-power,dc-lowpower,ac-balanced,dc-balanced,ac-performance,dc-
>> performance
>>
>> ?
>>
>> But that is not what the RFC patch that started this thread shows at all,
>> the API to the driver is totally unchanged and does not get passed
>> any info on ac/dc selection ?  So it seems to me that the ACPI API Linux
>> uses for this writes only 1 of 3 values to a single slot and the EC automatically
>> switches between say ac-balanced and dc-balanced internally.
>>
>> IOW there really being 2 differently tuned balance-profiles is not visible to
>> the OS at all, this is handled internally inside the EC, correct ?
>>
> 
> No - on Lenovo's platform there are 6 different profiles that can be selected
> from the kernel driver.  3 are intended for use on battery, 3 are intended for
> use on AC.

Ah, I already got that feeling from the rest of the thread, so I reread
Mark's RFC again before posting my reply today and the RFC looked like
the same 3 profiles were being set and the only functionality added
was auto profile switching when changing between AC/battery.

Thank you for clarifying this. Having 6 different stories
indeed is a very different story.

>> Otherwise I would expect the kernel internal driver API to also change and
>> to also see a matching thinkpad_acpi patch in the RFC series?
> 
> The idea I see from Mark's thread was to send out RFC change for the platform profile
> and based on the direction try to implement the thinkpad-acpi change after that.
> 
> Because of the confusion @Mark I think you should send out an RFC v2 with thinkpad acpi
> modeled on top of this the way that you want.

I fully agree and since you introduce the concept of being on AC/battery to the
drivers/acpi/platform_profile.c cpde, please change the 
profile_set and profile_get function prototypes in struct platform_profile_handler
to also take a "bool on_battery" extra argument and use that in the thinkpad
driver to select either the ac or the battery tuned low/balanced/performance 
profile.

And please also include an update to Documentation/ABI/testing/sysfs-platform_profile
in the next RFC.

Also notice how I've tried to consistently use AC/battery in my last reply,
DC really is not a good term for "on battery". AC also is sort of dubious
for "connected to an external power-supply" but its use for that is sorta
common and it is nice and short.

Sorry if this seems like bikeshedding, but using DC for "on battery" just
feels wrong to me.


>>> The biggest use case I can think of is that a user wants performance
>>> when plugged in and power-save when unplugged; and they want that to
>>> happen automatically.
>>
>> Right, so this what I have understood all along and I'm not disagreeing
>> that this is a desirable feature, but it _does not belong in the kernel_!
>>
>> Also taking Mario's remark about the EC-firmware using differently
>> tuned balanced profiles based on ac vs dc, here is how I envision this
>> working:
>>
>> 1. Laptop is connected to charger
>> 2. EC notices this and:
>> 2.1 Internally switches from balanced-dc settings to balanced-ac settings
>> 2.2 Sends out an event about the laptop now being on AC, which the kernel
>>     picks up and then sends to userspace (this already happens)
>> 3. Userspace, e.g. power-profiles-daemon, gets the event that the laptop is
>>    now an AC and in its settings sees that the user wants to switch to
>>    performance mode on AC and uses the platform_api in its current form to
>>    ask for a switch to performance mode
>> 4. The EC gets a command telling it to switch to performance mode and
>>    switches to the ac-tuned version of performance mode since the laptop is
>>    on ac.
>>
> 
> None of this happens internally on the EC.

Ack, I understand now thank you for clarifying this.


> Also there is nothing in this design
> that guarantees it needs to be EC driven profile changes.  It could be other
> mailboxes, ASL code, SMM etc.
> 
> The key point here is that thinkpad acpi has 3 AC and 3 DC profiles to choose from,
> so some level from thinkpad acpi above needs to pick among them.

Ack.

Regards,

Hans

