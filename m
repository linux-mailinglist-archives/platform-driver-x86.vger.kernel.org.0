Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 165CF4FBD73
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Apr 2022 15:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346591AbiDKNnT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 Apr 2022 09:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233527AbiDKNnS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Apr 2022 09:43:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19BA1FD12
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649684463;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UL4VC3xNL12j2w1KHO9njXE09mphZepoMWPC1sq8ni4=;
        b=CK8ZDhMbu9onJQpUcebu/RNCnGS8XfjHlUH221PPoQaGGQNXDRafgYlgaXyymApT/BjTaK
        OKpKU+WDBfKS2RWLp3+xnDuOiDk7ev7A+v86Yzx2PN9gKmoyx+i5dFvsN5a/Xx0a+Eqv3x
        DvIwF3CMaIXe/av7V8wMWwr7vaorycY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-EOeghtsDMkaZNZg4Zd2Vow-1; Mon, 11 Apr 2022 09:41:01 -0400
X-MC-Unique: EOeghtsDMkaZNZg4Zd2Vow-1
Received: by mail-ed1-f72.google.com with SMTP id da8-20020a056402176800b0041d79488e29so2344337edb.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Apr 2022 06:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=UL4VC3xNL12j2w1KHO9njXE09mphZepoMWPC1sq8ni4=;
        b=yxz0zO29KBVohdzb9fYnWTKDOrSfazW/DHnTkY7dJLyRxzw+dV1uzK8AUs1+f0lKQO
         9a/wRu2CYnMZq9/yA6cFXr3lcJ9lcGQZJu19Bj56/dj7pjJHj2PxpB4aoGIw6jAxY6J+
         S0pJCRykLLDqFwcnU/YvU9ZUcxeOQriwtvFQR+CQDlbGnaYzt8Dk0GKBzB8kLgs0+WLA
         2e1s2lhbosqEX+m1x+dleXJKo3CQnYoRpptGncTkGQ2QaV/6HpTmTU7bkYJ5uL2B/Obe
         uM1WFC+3cIPCVlaJnkEJKgBEgbUA7UXIVsvCKgjMUpdPLUfCYeoNssR1eBE+6cufzfdA
         g13A==
X-Gm-Message-State: AOAM5302pV0YsqBPzbp7MtiwPsPITQ9Xi1HeBEHvpjzI3eIrdESLOHYq
        1VEFylUyqNQOKWucP6Ynpe/MD2DjRvCZmY2uA4DRNHT1cTjk+hy7TiXRKMvWZ2Atjma0WAMO4BH
        CBB1YTSdJyM2+/97EfnyOrEK8xanBQeYeTw==
X-Received: by 2002:a17:906:58c9:b0:6e8:6bbb:3b7 with SMTP id e9-20020a17090658c900b006e86bbb03b7mr10796294ejs.252.1649684460329;
        Mon, 11 Apr 2022 06:41:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxOwY7W61+4P6gNnoRNEF1DoqwVewwh4An9ai4g2HZYPzMQeQ5RAmTsYwwQwPRa1V7B86d9Q==
X-Received: by 2002:a17:906:58c9:b0:6e8:6bbb:3b7 with SMTP id e9-20020a17090658c900b006e86bbb03b7mr10796272ejs.252.1649684460064;
        Mon, 11 Apr 2022 06:41:00 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id u19-20020a17090617d300b006cea86ca384sm11897209eje.40.2022.04.11.06.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 06:40:59 -0700 (PDT)
Message-ID: <e25f5599-10f5-90b7-227a-01616f722cca@redhat.com>
Date:   Mon, 11 Apr 2022 15:40:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH RESEND v6] platform: x86: Add ChromeOS ACPI device driver
Content-Language: en-US
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Len Brown <lenb@kernel.org>, Mark Gross <markgross@kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        Dmitry Torokhov <dtor@chromium.org>,
        Gwendal Grignou <gwendal@chromium.org>, vbendeb@chromium.org,
        Andy Shevchenko <andy@infradead.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        =?UTF-8?Q?Bla=c5=be_Hrastnik?= <blaz@mxxn.io>,
        Darren Hart <dvhart@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeremy Soller <jeremy@system76.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rajat Jain <rajatja@google.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Enric Balletbo i Serra <eballetbo@gmail.com>
References: <Yk7aeAcKIBrTupcq@debian-BULLSEYE-live-builder-AMD64>
 <708fb1ec-4e57-7a1d-b0a0-a3a10b3cacf3@redhat.com>
 <CAJZ5v0g2UDOR3mYsdqnPcpYgmecY706YQcTKTWMRtezkK0sfaQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0g2UDOR3mYsdqnPcpYgmecY706YQcTKTWMRtezkK0sfaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/11/22 15:37, Rafael J. Wysocki wrote:
> On Mon, Apr 11, 2022 at 3:26 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 4/7/22 14:35, Muhammad Usama Anjum wrote:
>>> From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>
>>> The x86 Chromebooks have ChromeOS ACPI device. This driver attaches to
>>> the ChromeOS ACPI device and exports the values reported by ACPI in a
>>> sysfs directory. This data isn't present in ACPI tables when read
>>> through ACPI tools, hence a driver is needed to do it. The driver gets
>>> data from firmware using ACPI component of the kernel. The ACPI values
>>> are presented in string form (numbers as decimal values) or binary
>>> blobs, and can be accessed as the contents of the appropriate read only
>>> files in the standard ACPI device's sysfs directory tree. This data is
>>> consumed by the ChromeOS user space.
>>>
>>> Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>> Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
>>
>>
>> Thanks overall this looks pretty good to me.  The only remark which
>> I have is that I would like to see the Kconfig symbol changed
>> from CONFIG_ACPI_CHROMEOS to CONFIG_CHROMEOS_ACPI to match the
>> filename.
>>
>> CONFIG_ACPI_CHROMEOS to me suggests that this is an ACPI subsystem
>> Kconfig option which, with the driver living under
>> drivers/platform/x86 it is not.
>>
>> There is no need to send a new version for this, if you agree
>> with the change let me know and I can change this while merging
>> the driver.
>>
>> Rafael, before I merge this do you have any (more) remarks
>> about this driver?
> 
> I'm not sure why it has to be an acpi_driver.
> 
> I think that the generic enumeration code creates a platform device
> for this ACPI device object, so why can't it bind to that platform
> device?
> 
> Generally speaking, IMV we should avoid adding drivers binding
> directly to ACPI device objects, because that is confusing (it is kind
> of like binding directly to an of_node) and it should be entirely
> avoidable.

Ah I missed that, good point.

Muhammad can you give turning this into a platform driver a try please?

Note this will change all the sysfs attribute paths from:

/sys/bus/acpi/devices/GGL0001:00/...

to:

/sys/bus/platform/devices/GGL0001:00/...

and the ABI documentation should be updated accordingly.

Regards,

Hans



