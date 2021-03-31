Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12B37348B76
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 Mar 2021 09:24:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbhCYIYS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 25 Mar 2021 04:24:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58529 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229847AbhCYIXz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 25 Mar 2021 04:23:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616660635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RYiX0x7fQEzSPtx5RzR0nO5WMxQ7mszVE6ntaDRhN3o=;
        b=aEZ1pz0Zp9+lXgHarwV0qcP/QQOhdcZrNheTov4z1axOBlCM8WArvtCd7ADBQMKN2REa48
        45lmU9eC+kk1jwYLHNTaP1MLmnXaZH4wtwdXHyCPYoc8zCyzbdN16N4Upa/UF2ZGY9bzl2
        2YOe/LgnKdHOv3xON6kpwK3vOdB+/Z0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-CboCw0wHO8yNDRkD_8IZdg-1; Thu, 25 Mar 2021 04:23:53 -0400
X-MC-Unique: CboCw0wHO8yNDRkD_8IZdg-1
Received: by mail-ed1-f69.google.com with SMTP id i19so2308253edy.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 25 Mar 2021 01:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RYiX0x7fQEzSPtx5RzR0nO5WMxQ7mszVE6ntaDRhN3o=;
        b=TvN1q4HIfSbhB/p0G6zctY1AtPRfrbdjIfXIvTXakLfxHRr0LiaB81t6QaWC69k6XN
         5PhtrfNo40O14JtXh6FYmRX+vTjBce34QzfmDuJufLjBIWOl2siF5z5JiifsnrXN6ROI
         lzFGRoRMSPEqe8cIKzKAVJeM4dimO3xjJKpVJiex1CtI4nPpWiMHG22GQm5mAmsD9NdU
         HrGr21VV5UELfG/vQNwpioWJrZnhO5d8QkwrLcwO/mvGeAonNF7Tb79wkWOcpA7pkM64
         sM4V/tRdLK0nBej1JwFJoCVIwKpt4OdrnEh3cvMeFPomvV2v2k1B6hvFxcnSYRMGDU9t
         KOzw==
X-Gm-Message-State: AOAM533lQ/tzSgf09UzvIeqGCdmpbL3PhPqjPusEL+Ywh47nSz8IM6Vh
        5NvJXu0w4DKkSbXoh8m5PfArYVJiyQfuCjmazImAJCpCuiAzASVbI62LxWXqfD5JGO57SVRMVYb
        MI0yVtqA+D0lpw72zGBpea5uIxDmrfXsobg==
X-Received: by 2002:a05:6402:35c9:: with SMTP id z9mr7747114edc.94.1616660632261;
        Thu, 25 Mar 2021 01:23:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDH0fg1ePwOG2M9JA9L6BIxw9TAwkOOxCpGB3Y6hBhA86qYmvC+FvOwa/BzMPMfYaG9/TeAQ==
X-Received: by 2002:a05:6402:35c9:: with SMTP id z9mr7747099edc.94.1616660632118;
        Thu, 25 Mar 2021 01:23:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q2sm2082722eje.24.2021.03.25.01.23.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 01:23:51 -0700 (PDT)
Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To:     "Yuan, Perry" <Perry.Yuan@dell.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>
Cc:     "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>
References: <20210322093841.11840-1-Perry_Yuan@Dell.com>
 <a1fae1fc-2d4f-63e8-e0be-0f9c4c91640c@linux.intel.com>
 <c61b975a-a771-eb63-5232-2da184ca95fe@redhat.com>
 <SJ0PR19MB4528ED97AA4A5D0821A3E68584629@SJ0PR19MB4528.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5ec52d3c-3587-6bf7-bf84-b6f8f31be0e7@redhat.com>
Date:   Thu, 25 Mar 2021 09:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <SJ0PR19MB4528ED97AA4A5D0821A3E68584629@SJ0PR19MB4528.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/25/21 8:52 AM, Yuan, Perry wrote:
> Hi Hans.
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Wednesday, March 24, 2021 3:40 AM
>> To: Pierre-Louis Bossart; Yuan, Perry; pobrn@protonmail.com;
>> oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>> mgross@linux.intel.com; Limonciello, Mario
>> Cc: alsa-devel@alsa-project.org; linux-kernel@vger.kernel.org;
>> lgirdwood@gmail.com; platform-driver-x86@vger.kernel.org;
>> broonie@kernel.org
>> Subject: Re: [PATCH v5 1/2] platform/x86: dell-privacy: Add support for Dell
>> hardware privacy
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Hi,
>>
>> On 3/23/21 7:57 PM, Pierre-Louis Bossart wrote:
>>> Minor comments below.
>>
>> <snip<
>>
>>>> +int __init dell_privacy_acpi_init(void)
>>>
>>> is the __init necessary? You call this routine from another which already has
>> this qualifier.
>>
>> Yes this is necessary, all functions which are only used during module_load /
>> from the module's init function must be marked as __init so that the kernel
>> can unload them after module loading is done.
>>
>> I do wonder if this one should not be static though (I've not looked at this
>> patch in detail yet).
>>
>>>
>>>> +{
>>>> +    int err;
>>>> +    struct platform_device *pdev;
>>>> +
>>>> +    if (!wmi_has_guid(DELL_PRIVACY_GUID))
>>>> +        return -ENODEV;
>>>> +
>>>> +    privacy_acpi = kzalloc(sizeof(*privacy_acpi), GFP_KERNEL);
>>>> +    if (!privacy_acpi)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    err = platform_driver_register(&dell_privacy_platform_drv);
>>>> +    if (err)
>>>> +        goto pdrv_err;
>>>> +
>>>> +    pdev = platform_device_register_simple(
>>>> +            PRIVACY_PLATFORM_NAME, PLATFORM_DEVID_NONE, NULL, 0);
>>>> +    if (IS_ERR(pdev)) {
>>>> +        err = PTR_ERR(pdev);
>>>> +        goto pdev_err;
>>>> +    }
>>>> +
>>>> +    return 0;
>>>> +
>>>> +pdev_err:
>>>> +    platform_device_unregister(pdev);
>>>> +pdrv_err:
>>>> +    kfree(privacy_acpi);
>>>> +    return err;
>>>> +}
>>>> +
>>>> +void __exit dell_privacy_acpi_exit(void)
>>>
>>> is the __exit required here?
>>
>> Idem. Also static ?
>>
>> Regards,
>>
>> Hans
>>
> 
> If adding static to the function,  I will be worried about that the init and exit cannot be called by another file .

That is right, which is why I added the "?".

But this is no longer relevant after my detailed review of the patch,
so lets discuss things further in the detailed review email-thread.

Regards,

Hans

