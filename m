Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89D2B1DCFBC
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 May 2020 16:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727889AbgEUOaX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 21 May 2020 10:30:23 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:35899 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729509AbgEUOaW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 May 2020 10:30:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1590071420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=33n/Gf6RNU/kBg3GIK+QkAEBkWH8KP0a4EI5Qt53HYo=;
        b=DnMcE+1j1LuC77A4njkkVzXRmW6B0K7eJ4vtYHAyEKoE0b+2owjba5dWhN24GgZdZDaT+0
        C3OubmXs1QtoPsJN+n99tO5f1VW8MS2uJ9pSe0XrLSMjXMdcj84VfskYXt7SpMZq+Qygo3
        MvzHMFlb410X7BnNgAIFeMswFwaJfxk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-wAYgeKOKOrCM1hwgn5kpSQ-1; Thu, 21 May 2020 10:30:14 -0400
X-MC-Unique: wAYgeKOKOrCM1hwgn5kpSQ-1
Received: by mail-ej1-f69.google.com with SMTP id x21so2996848ejb.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2020 07:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=33n/Gf6RNU/kBg3GIK+QkAEBkWH8KP0a4EI5Qt53HYo=;
        b=UH8pRpGBoSQAQqqPu1de7+33RxDY28x+HvKno6moOmSpftafywN9IacZNUH/SHxO1J
         f4ibLURXZYTCO5s1Tn6P6A9CVLmLbaunNN1wwBmKstsrtcf03xexRc1r8rdpuq1h8ktc
         x5xOPN+BY4YbdSm8yONnLsFMynjZl0lnNlHc92ZPNQsfp3TdvW8/ZFLSAcb8KDskrRYX
         krTFZUBrdpAVe6lmlrYds4Yvxh62e9WxXKvRZUAdMkWkeVV+drRdkmKoTRvHf277f3Q8
         jcRnzjFjCbEV2SIGX0k0NC/PCmaP20mP6FmuLsdtLV0Y6ZOVISTADEI0A2phT0Y4lODX
         Kbdw==
X-Gm-Message-State: AOAM533z3UavvbMYEuSxmcbF0AH9HOfpbFn1mMDvY/htMPapgWNoXKe0
        LrDuHM9siUCudt/ykAa+RWQhnfL3tsHRfJavNBhAzuIuL3IMPWccBzZGHy2CXZ1R7fNvhasyAH3
        8CixcG2wRbEzshUB5vVAfVjmP7he+Kx0ZZw==
X-Received: by 2002:a17:906:935a:: with SMTP id p26mr3978709ejw.103.1590071412873;
        Thu, 21 May 2020 07:30:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxUKpjWioM+uuAah+uc8oforedtyBusAP9usq4CnSJAox7u/DIUUcmuufkRUnAxVNtbkatLUQ==
X-Received: by 2002:a17:906:935a:: with SMTP id p26mr3978677ejw.103.1590071412624;
        Thu, 21 May 2020 07:30:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id h18sm5259402eji.86.2020.05.21.07.30.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2020 07:30:11 -0700 (PDT)
Subject: Re: asus-wmi fails to load on new ASUS laptop UX325JA
To:     Chris Chiu <chiu@endlessm.com>, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        gregkh@linuxfoundation.org, gayatri.kammela@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>
References: <CAB4CAweJ6Zi2DqQ5qgQq-apAMzSSk3uzoohEJ443F5T=LohAAA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c8e947e-ebd4-f63f-db17-fabd2082ae66@redhat.com>
Date:   Thu, 21 May 2020 16:30:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAB4CAweJ6Zi2DqQ5qgQq-apAMzSSk3uzoohEJ443F5T=LohAAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/21/20 12:33 PM, Chris Chiu wrote:
> Hi,
>      I have the ASUS new laptop UX325JA and most of the media keys are
> not working even with the latest kernel (5.7.0-rc5+). Looking into the
> dmesg log, the ASUS WMI driver fails to load because of
> [    7.827241] asus-nb-wmi: probe of asus-nb-wmi failed with error -5.
> 
>      Before this message, the following message repeat 5 times, please
> check the full dmesg log here
> https://gist.github.com/mschiu77/9a53cd8ff17029e949210dfb3ec1213f
> [    7.825975] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field
> [IIA3] at bit offset/length 96/32 exceeds size of target Buffer (96
> bits) (20200326/dsopcode-203)
> [    7.825985] No Local Variables are initialized for Method [WMNB]
> [    7.826005] ACPI Error: Aborting method \_SB.ATKD.WMNB due to
> previous error (AE_AML_BUFFER_LIMIT) (20200326/psparse-531)
> 
>      It fails the \_SB.ATKD.WMNB because the local variable IIA3
> exceeds the buffer limit. The WMNB is the function to deal with all
> ASUS WMI functions, such as ASUS_WMI_METHODID_INIT...etc. The related
> code in DSDT is as follows. The full DSDT is here
> https://gist.github.com/mschiu77/849c6cb89a8d8cadd015fa75465882dd
> 
> Method (WMNB, 3, Serialized)
> {
>      P8XH (Zero, 0x11)
>      CreateDWordField (Arg2, Zero, IIA0)
>      CreateDWordField (Arg2, 0x04, IIA1)
>      CreateDWordField (Arg2, 0x08, IIA2)
>      CreateDWordField (Arg2, 0x0C, IIA3)
>      CreateDWordField (Arg2, 0x10, IIA4)
>      Local0 = (Arg1 & 0xFFFFFFFF)
>      If ((Local0 == 0x54494E49))
> 
>      Just as the error messages indicated,  the IIA3 is out of boundary
> for the target Buffer. The limit 96bits (12 bytes) is determined by
> the input acpi_buffer size, which refers to internally defined struct
> bios_args, in asus_wmi_evaluate_method3. Because all ASUS WMI
> evaluations will invoke  asus_wmi_evaluate_method3 at last, so all
> ASUS WMI functions fail to work. I can simply fix this by extending
> the bios_args from 3 args to 5 u32 args as follows, but I don't think
> it's generic enough and may have to change if there're more local
> variables declared in ACPI method on the future ASUS machines. Any
> suggestions for this?

I think you fix with just adding the 2 extra args is fine. Yes we
may need to extend this in the future. But we have no idea when and
with how many extra args. So for now I believe we should just move
forward with your suggested fix.

If you can turn this into a proper patch and submit it upstream
that would be great.

Regards,

Hans


> 
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -116,6 +116,8 @@ struct bios_args {
>          u32 arg0;
>          u32 arg1;
>          u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
> +       u32 arg3;
> +       u32 arg4;
>   } __packed;
> 
> 
> Chris
> 

