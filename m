Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2925D1DE3E8
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 May 2020 12:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729760AbgEVKOw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 May 2020 06:14:52 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37532 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728716AbgEVKOf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 May 2020 06:14:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590142473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FOU53/GKhFSDCFEqcsdErGmhyqCkF6RPDSEV44rw+e0=;
        b=QkH1cjmgvIDIaLekQg/us47YuSOnyd1FT/JaLVwF8qKeMqnXXAH1L+gEoaUpZoeg4FLpJV
        rrQTGZ6njpY6ae+j6LnQEtKntjlRfBjx6xkMPG3adqvVl/46BGhdhhgl9/KIJuxLqNodBq
        PMFvp+mcNkQzRaD0xWnG3SboFg1VK1c=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-195-WaGDGuZMNVmYRiOGmH4X3Q-1; Fri, 22 May 2020 06:14:32 -0400
X-MC-Unique: WaGDGuZMNVmYRiOGmH4X3Q-1
Received: by mail-ej1-f71.google.com with SMTP id lk22so4398954ejb.15
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2020 03:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FOU53/GKhFSDCFEqcsdErGmhyqCkF6RPDSEV44rw+e0=;
        b=qLairDhch3AUmHi0B8FIpg3dY45DzBqBDJmSJ25jJX6h9//nha/0n9LRq18AntrIUP
         L7AXn2rAPdz0mwJPalhXMqA3HvUVZq631SJtOESBa9UVHPtCEt7D8S627rY1JA7vBsmd
         6aRbqrY4xVznlL0o2JtyazaZw0Lr3V8uJWcUkfi+/YgD1c/y2R5jDa5fljHfiVT+OVT6
         tQcRJDw5lUSmQQu73IBOVeM0lQpE+VuLqwmqrUZea8CN0Y/F5P0/l2nx6PWwww+AM9Sd
         djEwsb92gfWArT7YZ8SapJ6KbXmqkspvQwrK9ZlSVquGQ5cIgkQjxrYIL1DJ64DDdD9B
         veLA==
X-Gm-Message-State: AOAM530sCRBxXNIpknaYJAQN4N65caNT4skrcK6Aa8e7WPnQMfMAdj/f
        6nUsdHsR57eFSk4qTneJsy0FHxqeIl1vuBJ1e9/Q4xmBTHS0AvaIDjogEukLV2ucK+humyzslv0
        IVh9182S/F352sfIRaFgW8oFanaF/MCGZNA==
X-Received: by 2002:a05:6402:6c1:: with SMTP id n1mr2369041edy.199.1590142471181;
        Fri, 22 May 2020 03:14:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfC34MCbCH6URcwA7zYGRshQKEBRWb6nEZHBKVgIxEDOg1wtlGa9fvkmr/88CXVhHVgbeeAw==
X-Received: by 2002:a05:6402:6c1:: with SMTP id n1mr2369020edy.199.1590142470804;
        Fri, 22 May 2020 03:14:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id fi9sm7342293ejb.5.2020.05.22.03.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 03:14:29 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus_wmi: Reserve more space for struct
 bias_args
To:     Chris Chiu <chiu@endlessm.com>, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org,
        gayatri.kammela@intel.com, mika.westerberg@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessm.com
References: <20200522074424.54264-1-chiu@endlessm.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <370d5f70-cb37-3ac8-7a7e-97f215b0ad8a@redhat.com>
Date:   Fri, 22 May 2020 12:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200522074424.54264-1-chiu@endlessm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/22/20 9:44 AM, Chris Chiu wrote:
> On the ASUS laptop UX325JA/UX425JA, most of the media keys are not
> working due to the ASUS WMI driver fails to be loaded. The ACPI error
> as follows leads to the failure of asus_wmi_evaluate_method.
>    ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [IIA3] at bit offset/length 96/32 exceeds size of target Buffer (96 bits) (20200326/dsopcode-203)
>    No Local Variables are initialized for Method [WMNB]
>    ACPI Error: Aborting method \_SB.ATKD.WMNB due to previous error (AE_AML_BUFFER_LIMIT) (20200326/psparse-531)
> 
> The DSDT for the WMNB part shows that 5 DWORD required for local
> variables and the 3rd variable IIA3 hit the buffer limit.
> 
> Method (WMNB, 3, Serialized)
> { ..
>      CreateDWordField (Arg2, Zero, IIA0)
>      CreateDWordField (Arg2, 0x04, IIA1)
>      CreateDWordField (Arg2, 0x08, IIA2)
>      CreateDWordField (Arg2, 0x0C, IIA3)
>      CreateDWordField (Arg2, 0x10, IIA4)
>      Local0 = (Arg1 & 0xFFFFFFFF)
>      If ((Local0 == 0x54494E49))
>    ..
> }
> 
> The limitation is determined by the input acpi_buffer size passed
> to the wmi_evaluate_method. Since the struct bios_args is the data
> structure used as input buffer by default for all ASUS WMI calls,
> the size needs to be expanded to fix the problem.
> 
> Signed-off-by: Chris Chiu <chiu@endlessm.com>

Thank you, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/asus-wmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index bb7c529d7d16..cd212ee210e2 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -116,6 +116,8 @@ struct bios_args {
>   	u32 arg0;
>   	u32 arg1;
>   	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
> +	u32 arg4;
> +	u32 arg5;
>   } __packed;
>   
>   /*
> 

