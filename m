Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC9944D460
	for <lists+platform-driver-x86@lfdr.de>; Thu, 11 Nov 2021 10:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbhKKJw4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 11 Nov 2021 04:52:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58660 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229668AbhKKJw4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 04:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636624207;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JafLzISzwmOzPN4jHok3ZWFkvUmYVSwTaJ2FlEhdEi4=;
        b=QbWg1OzrgDRamDTh2vPijm76Myrs1GB/Jpj44ft2UYYW4NIbVnFOnnHha16GnVnAZwycVz
        VFgj+9101C9mB5dUNWWZkuw4D1fH3KwNV531pMX3i7GyhO+kszymBHHLJ8hp7iztv9f6TS
        zqk1d+khUPZISld3uLoYaL3V5B0LqC0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-sbN7LJ1hMRCQyej2aTWynQ-1; Thu, 11 Nov 2021 04:50:05 -0500
X-MC-Unique: sbN7LJ1hMRCQyej2aTWynQ-1
Received: by mail-ed1-f69.google.com with SMTP id z1-20020a05640235c100b003e28c89743bso4896348edc.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 01:50:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JafLzISzwmOzPN4jHok3ZWFkvUmYVSwTaJ2FlEhdEi4=;
        b=5AxVoS7OZSBR+zR/ldbprRCJvTeEX2t6+W+QU/u+NicMQLltofzubNAqgdiPpWE2Qp
         Q8W5fUh+dW+jFvDxmnJpddWT3Zh3odhaOFeMJgtXqFXhqLDMJDhH4eKqYRfS3nSxu0Pt
         h7QwybGZjNgrE3/fed8omSM3iZeZtEFypK641SljfYzSDMRhUUU1Nam2f+t19XMkg7a2
         HOGgGpAkjp3CLzH7gaiGLRkL9Yz87tXM1pgkvD2s9SMSxhbdPCtm52O5rpoIUUyTpEEV
         ZihUgvvMIGoVIfyW5swQf4BFCjXKrbH1WriFDsbJi6kHK5vgdRH8uONpyuWWrOKOf/uy
         IR9A==
X-Gm-Message-State: AOAM531srtoQrMy0/WV2cxO1e3MxhvjaLGYzjXCNaYtCizU1/wIHfS8s
        TlSr5F2MoiA31liFwD+MiVjyBrxt3SisbuBBGrHbrv/9WZb/7pH+YHcqy+91vAnZDBwzBwtl5t8
        FM73mOVwXVRhd8qx+3LR66QBKKc7k1crR8Q==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr8276772edd.215.1636624204510;
        Thu, 11 Nov 2021 01:50:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQXQipOHgu56fK0wp8NB2xtImtn2zLX3VXCyWkmAAt4eX3rhUs8DnfV/kJZx6jHnPTnieDzg==
X-Received: by 2002:a05:6402:510b:: with SMTP id m11mr8276733edd.215.1636624204285;
        Thu, 11 Nov 2021 01:50:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ee7sm1252316edb.1.2021.11.11.01.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Nov 2021 01:50:04 -0800 (PST)
Message-ID: <c6130e0a-8c26-f6c8-acf1-351b41e8a2bc@redhat.com>
Date:   Thu, 11 Nov 2021 10:50:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] platform/x86: hp_accel: Fix an error handling path in
 'lis3lv02d_probe()'
Content-Language: en-US
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        eric.piel@tremplin-utc.net, markgross@kernel.org,
        dmitry.torokhov@gmail.com, giedriuswork@gmail.com,
        dvhart@linux.intel.com, akpm@linux-foundation.org, pavel@suse.cz
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <5a4f218f8f16d2e3a7906b7ca3654ffa946895f8.1636314074.git.christophe.jaillet@wanadoo.fr>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5a4f218f8f16d2e3a7906b7ca3654ffa946895f8.1636314074.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/21 20:57, Christophe JAILLET wrote:
> If 'led_classdev_register()' fails, some additional resources should be
> released.
> 
> Add the missing 'i8042_remove_filter()' and 'lis3lv02d_remove_fs()' calls
> that are already in the remove function but are missing here.
> 
> Fixes: a4c724d0723b ("platform: hp_accel: add a i8042 filter to remove HPQ6000 data from kb bus stream")
> Fixes: 9e0c79782143 ("lis3lv02d: merge with leds hp disk")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I will add this fix to my tree once 5.16-rc1 is out and
I will include this fix in my first pdx86 fixes pull-req
for 5.16.

Regards,

Hans

> ---
>  drivers/platform/x86/hp_accel.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index b183967ecfb7..435a91fe2568 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -331,9 +331,11 @@ static int lis3lv02d_probe(struct platform_device *device)
>  	INIT_WORK(&hpled_led.work, delayed_set_status_worker);
>  	ret = led_classdev_register(NULL, &hpled_led.led_classdev);
>  	if (ret) {
> +		i8042_remove_filter(hp_accel_i8042_filter);
>  		lis3lv02d_joystick_disable(&lis3_dev);
>  		lis3lv02d_poweroff(&lis3_dev);
>  		flush_work(&hpled_led.work);
> +		lis3lv02d_remove_fs(&lis3_dev);
>  		return ret;
>  	}
>  
> 

