Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24A1C692339
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Feb 2023 17:25:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbjBJQZz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Feb 2023 11:25:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbjBJQZz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Feb 2023 11:25:55 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2A21ADD8
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:25:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676046309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ld8jQknkBmqDQVj2zOFVhooagaMNsILXN0htn4jC07Y=;
        b=Td3gbU/rjW2f4jyqSAX3L1EUeN0vIZl508wRewHsQ0pCRtW4Do+x4LMG02fQ0LF/9PEB8o
        wkn2LszSlpLTekbyX+hcT43FmyV46nijKTeufs86QZ54f42RRqkeP+aDHBX3RVZYHwFoq3
        GW20fFQ6K3qOureo8w7Mmwn3NNwqA6k=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-428-ZW-sAC8wNg-Pyy1d1be00w-1; Fri, 10 Feb 2023 11:25:08 -0500
X-MC-Unique: ZW-sAC8wNg-Pyy1d1be00w-1
Received: by mail-ed1-f69.google.com with SMTP id o21-20020aa7dd55000000b004a245f58006so3911400edw.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Feb 2023 08:25:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ld8jQknkBmqDQVj2zOFVhooagaMNsILXN0htn4jC07Y=;
        b=lBKSUw6NpkECq8Rp6MhzuD3RpW7MquaVfijHzndzj+i6l6O7epCwSmvsc8zD2NDrys
         cNZYVBUUmCP39GAyC/hWZ0rv7nLMUyvm4tAIU4lvFOIvnAHnHekhZtRGqzTRxxwIr+7g
         68VKWWoB6R4cbHR2d23tSEtj5vp2vEXQg5VMct7/5cFTP0r4VUEZZWv5dvynCsjo/9dU
         QCa6jeIcRQ7pgWqWfMhNWnJsDloG0Dfuad2Kk8YpPtHGF4y+dDcKTf2JgDTdJxtz10j3
         8nwlnNzfldN3/LaF8aZjvPrzEy2REopCqOfb9q6ZhsMB1nebXjVHWL+WwhHAIHn9d5YS
         F28g==
X-Gm-Message-State: AO0yUKVlSIMtTxO0PCYBMC43LZmQwqkO/y7GP6E+YAmoiL6jU/oP0XfD
        QtEJekeB06gxb2YhVatCVOzMtdUa3vOCZcrvMtfy8jJMChHyHKLUgHkNsumkUzQBTlEYJVm/Gtz
        PKs17tUxWWpsG/HMLFejKrRm0+WW7Yya+tA==
X-Received: by 2002:a50:9318:0:b0:4aa:b250:16 with SMTP id m24-20020a509318000000b004aab2500016mr15791243eda.35.1676046307638;
        Fri, 10 Feb 2023 08:25:07 -0800 (PST)
X-Google-Smtp-Source: AK7set+9+I+I0IrAWfr7PnQaKpoRL9Avm+D4AQ8CcF6+ZF7O2AbAZtbk0D+JjhAMswHholy/SFWMNA==
X-Received: by 2002:a50:9318:0:b0:4aa:b250:16 with SMTP id m24-20020a509318000000b004aab2500016mr15791229eda.35.1676046307444;
        Fri, 10 Feb 2023 08:25:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v26-20020a50a45a000000b004ab0d88afe5sm2451577edb.79.2023.02.10.08.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 08:25:06 -0800 (PST)
Message-ID: <5e4f220a-92b2-c195-f660-26ed5e882aef@redhat.com>
Date:   Fri, 10 Feb 2023 17:25:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/3] platform/x86: Make kobj_type structures constant
Content-Language: en-US, nl
To:     =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Mark Gross <markgross@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Justin Ernst <justin.ernst@hpe.com>
Cc:     Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230207-kobj_type-pdx86-v1-0-8e2c4fb83105@weissschuh.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230207-kobj_type-pdx86-v1-0-8e2c4fb83105@weissschuh.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/7/23 17:40, Thomas Weißschuh wrote:
> Since commit ee6d3dd4ed48 ("driver core: make kobj_type constant.")
> the driver core allows the usage of const struct kobj_type.
> 
> Take advantage of this to constify the structure definitions to prevent
> modification at runtime.
> 
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
> Thomas Weißschuh (3):
>       platform/x86: dell-wmi-sysman: Make kobj_type structure constant
>       platform/x86: think-lmi: Make kobj_type structure constant
>       x86/platform/uv: Make kobj_type structure constant
> 
>  drivers/platform/x86/dell/dell-wmi-sysman/sysman.c | 2 +-
>  drivers/platform/x86/think-lmi.c                   | 4 ++--
>  drivers/platform/x86/uv_sysfs.c                    | 6 +++---
>  3 files changed, 6 insertions(+), 6 deletions(-)
> ---
> base-commit: d2d11f342b179f1894a901f143ec7c008caba43e
> change-id: 20230207-kobj_type-pdx86-2c60e36c63db
> 
> Best regards,

