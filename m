Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7FC5EDBE4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 28 Sep 2022 13:37:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbiI1Lhw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 28 Sep 2022 07:37:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233460AbiI1Lhu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 07:37:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D61E103F
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 04:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664365068;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0T5p0Y493/N1/pFQ05/rtmN/mCGm71H3Y3YBZL6Swqk=;
        b=Sor8W6R+emymVTY3FETChF5Zte1yrxruQI9rno5hIPmwLrKU0EmHNi1BhHQG/h59KaQM6I
        IhSa2TGosX/4Yep1HUHpidBc0WSViAoyeggiH4e9qErB8p2SL/p9xHKRmJVoWYgMJ2AZQm
        DRATE0s2GbQY8Ii66PbNSi4FC5u0cMY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-497-b8P4XwypN5OhdAPxjlCcYg-1; Wed, 28 Sep 2022 07:37:39 -0400
X-MC-Unique: b8P4XwypN5OhdAPxjlCcYg-1
Received: by mail-ed1-f69.google.com with SMTP id y14-20020a056402440e00b0044301c7ccd9so10017532eda.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 04:37:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0T5p0Y493/N1/pFQ05/rtmN/mCGm71H3Y3YBZL6Swqk=;
        b=zH1JzvzXqU2VWeEe5qWNQrlLdHnAkf+gYqiGaU/NE+mdIUGpzZZIA4qyRQiZMMVK0a
         ZAqACkvsnsnuD/R1rzSHT8nv+R+qbX4341uqk44lESAPC8UYFNxT8Mk8N4o1gtSrLQlS
         9/THbitp2ST91htddzd0A717VzIuPSs+TQrNR5+BqtZoZbip0OsAGe3boToGfKgM5Qdn
         S4ik8qwo129O70bDjvtz1v8dJt2q2hIeqE9sL6zC4b05YIVPtGxXG4BHogP8bZpTyly4
         Lx3fyfxkBdukUe5Kt1k4sSFtbdQUjf8p8ctueBxidrAzP1tM3fulqKOAvUXz4fWWud7/
         RMWg==
X-Gm-Message-State: ACrzQf0s3eIvKGTjQqLZiT5cVgOYgmtt74OHThpoZop9M3zgrCvW6CAB
        1Hc+8dFPHfaHblY9OGuqZSmngDQkJQeNGYT9jJ3E2JXwpgaK0YaXU7V8z+nKm6secek73fSvtz7
        FTIr3dpEUGwMxwTuKU7LtKOiDeid36OoOKA==
X-Received: by 2002:a05:6402:26d3:b0:451:6ca9:bc5e with SMTP id x19-20020a05640226d300b004516ca9bc5emr32273461edd.325.1664365057961;
        Wed, 28 Sep 2022 04:37:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6J5SyvliErxGF0qTfW1ornZaChW4ObCnJt1VQvxNMBQ1ccJSZzHeSK4pKYUynVHmeoQmY29A==
X-Received: by 2002:a05:6402:26d3:b0:451:6ca9:bc5e with SMTP id x19-20020a05640226d300b004516ca9bc5emr32273402edd.325.1664365057231;
        Wed, 28 Sep 2022 04:37:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id p14-20020a17090653ce00b0077f20a722dfsm2225594ejo.165.2022.09.28.04.37.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:37:36 -0700 (PDT)
Message-ID: <4e579766-5b95-d44a-c482-e629889b482b@redhat.com>
Date:   Wed, 28 Sep 2022 13:37:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 0/2] platform/x86: dell: Add new dell-wmi-ddv driver
Content-Language: en-US, nl
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org,
        rafael@kernel.org, lenb@kernel.org, hmh@hmh.eng.br,
        matan@svgalib.org, corentin.chary@gmail.com, jeremy@system76.com,
        productdev@system76.com, mario.limonciello@amd.com,
        pobrn@protonmail.com, coproscefalo@gmail.com,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927204521.601887-1-W_Armin@gmx.de>
 <8d976e9c-8fea-8a67-1331-7993705c60d9@redhat.com>
 <YzQmdwTE2XcratWr@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YzQmdwTE2XcratWr@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/28/22 12:48, Andy Shevchenko wrote:
> On Wed, Sep 28, 2022 at 11:52:51AM +0200, Hans de Goede wrote:
>> On 9/27/22 22:45, Armin Wolf wrote:
>>> This patch series adds a new driver for a WMI interface found in
>>> many newer Dell machines. This interface allows to read battery
>>> properties like temperature and the ePPID (Dell-specific), while
>>> also providing fan and thermal sensor information.
>>>
>>> The interface does support multiple batteries which are indentified
>>> by an "index", which appears to be the battery ACPI UID. Since
>>> the interface also appears to omit any bounts checking of the
>>> index, the ACPI battery hook mechanism is used to discover batteries.
>>>
>>> Since the information returned when querying fan/thermal sensor
>>> information is currently unknown, a debugfs entry is created to
>>> allow for easier reverse engineering. The interface is likely
>>> to be replaced by a proper hwmon interface in the future.
>>>
>>> Since the driver can potentially be instantiated multiple times,
>>> the ACPI battery hook mechanism had to be extended.
>>>
>>> The first patch passes a pointer to the battery hook to the
>>> hook callbacks, so that they can access instance-specific data
>>> with container_of().
>>>
>>> The second patch finally adds the new driver. It was called
>>> dell-wmi-ddv since the interface is called "DDV" by Dell software,
>>> likely meaning "Dell Data Vault".
>>>
>>> The driver was tested, together with the changes made to the
>>> ACPI battery driver, on a Dell Inspiron 3505. Other drivers
>>> already using the battery hook mechanism where changed as well,
>>> but could only be compile-tested due to missing hardware.
>>>
>>> ---
>>> Changes in v2:
>>> - Significantly lower the amount of changes being made to the
>>> acpi battery driver
>>> - drop unnecessary ABI description of the temp attribute
>>> - return 0 when a unsupported battery is found to avoid being
>>> unloaded
>>>
>>> Armin Wolf (2):
>>>   ACPI: battery: Pass battery hook pointer to hook callbacks
>>>   platform/x86: dell: Add new dell-wmi-ddv driver
>>
>> Thanks.
>>
>> The new version looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> for the series.
>>
>> Rafael, from my POV this can be merged through either your
>> tree or mine. Feel free to merge this through your tree,
>> or please give your Ack for merging through mine
>> (assuming you are ok with the changes of course).
> 
> I gave some comments, but it's up to you if they have to be addressed now or as
> a follow up.

I have answered a couple of your comments.

What remains is very small / trivial. So IMHO this can go in as
is and then a follow-up patch can be done to address your remaining
comments. Armin, can you do a follow-up patch addressing Andy's
remaining comments please?

I guess it also depends on Rafael and if Rafael is ok with taking
this for 6.1 or if this is going to be 6.2 material.

If this is going to be delayed till 6.2, then we can squash in
the follow-up patch while merging.

Regards,

Hans



