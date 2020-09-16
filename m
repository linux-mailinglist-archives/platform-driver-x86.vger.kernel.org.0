Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2631E26C373
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 16:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgIPN6d (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 09:58:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30834 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726571AbgIPNlj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 09:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600263669;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jbpnGsrryfJjvSMFpK2cXIxAuXNXYWakh1vBLXakKh4=;
        b=SIcYPnkyIOLJ/FiY4+Jmy9SNEv89RqvAJHd6Jz5Vef3PLrnfCA4vQg0HF8VPuMEKh1cZbe
        mJHXL0ttbQLKgi7MJ2/6MvBAl8qhLYGrGqCO3KvIDg+yLW9Y2DdliJo3diJIEbf+dKp3e2
        qtqtF7bDYhipU9pvJg3SS6KEeEgO0Ms=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-gnxGiCuoOJaKDLY2_IzzFA-1; Wed, 16 Sep 2020 09:04:54 -0400
X-MC-Unique: gnxGiCuoOJaKDLY2_IzzFA-1
Received: by mail-ed1-f69.google.com with SMTP id y1so2423626edw.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 06:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jbpnGsrryfJjvSMFpK2cXIxAuXNXYWakh1vBLXakKh4=;
        b=cY+EN1b2tGBQrnrHSTlEiKffLZJZZgvCPgSmX/Ub1CHpEfOOxMIPbz5M/ZD5ghCjwl
         k2qZP3gMb3y2lKXTTEwxmCMvfx4g5Rj790Jfyy5pPSxuMl/rYWoD/dpS4SzTiMXA5oZt
         EYdPbt74em5AzXvCTDX/ZfxtU+t5A3dxt13roSK8QRgmx/Gy+N/IvaWyQGVtCFw1i15j
         Zu5st5gsXG0B32oWoAYfJ/C+8dAQG/I56Q1CCqcLzYukLuGs6vgA2CMwmmw0+LjvR+hS
         rC8Rz/VhBWQID20sRxdpyUWHAKAxYtt3zoPUBPV0nQ4RTBougv+IJtI0GAJm4DUN/nvF
         RAbQ==
X-Gm-Message-State: AOAM530rqdVujRNaRxxgn/zuyP/xHQCuJR37FH0gxFAqBOXztfLdaBet
        sNys40l5jTF6zqbGCnDdGGrvPHBzusBlvtZ7s0SvUVW6Bhg478YJ9ooi5VXoBjb23k4Rxj+8JRh
        pFOJT5/VydidlbQ84T9USBurzvPJSFuouJQ==
X-Received: by 2002:a50:a418:: with SMTP id u24mr27860308edb.103.1600261492636;
        Wed, 16 Sep 2020 06:04:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX+3Wfk5zLxJ/27Z6xsMElE+54tfp0JngxVovVXOOLReHZoXUgqgXtshDWRc+ZkBZ9xYvklQ==
X-Received: by 2002:a50:a418:: with SMTP id u24mr27860279edb.103.1600261492341;
        Wed, 16 Sep 2020 06:04:52 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id dm22sm14287309edb.49.2020.09.16.06.04.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 06:04:51 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always
 reporting 1 on the Asus UX360CA
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>
References: <20200911132618.187297-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8035726f-536e-4e62-2ef3-b27e43e15759@redhat.com>
Date:   Wed, 16 Sep 2020 15:04:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911132618.187297-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/11/20 3:26 PM, Hans de Goede wrote:
> On the Asus UX360CA the ASUS_WMI_DEVID_KBD_DOCK devstate always reports 0,
> which we translate to SW_TABLET_MODE=1. Which causes libinput to disable
> the keyboard and touchpad even if the 360 degree hinges style 2-in-1 is
> in laptop mode.
> 
> Samuel found out that this model has another WMI "object" with an devid of
> 0x00060062 which correctly reports laptop vs tablet-mode on the
> Asus UX360CA.
> 
> All the models on which the SW_TABLET_MODE code was previously tested do
> not have this new devid 0x00060062 object.
> 
> This commit adds support for the new devid 0x00060062 object and prefers it
> over the older 0x00120063 object when present, fixing SW_TABLET_MODE always
> being reported as 1 on these models.
> 
> Reported-and-tested-by: Samuel Čavoj <samuel@cavoj.net>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Self NACK, preferring the newer ASUS WMI device-id for the switch when present
does not fix this everywhere.

Recently there have been more bug-reports about this and at least the Asus E200HA
laptop does not have the newer ASUS WMI device-id in its DSDT:

   https://bugzilla.redhat.com/show_bug.cgi?id=1875339
   https://bugzilla.redhat.com/show_bug.cgi?id=1875828
   https://bugzilla.redhat.com/show_bug.cgi?id=1876997

So I'm preparing a new patch which uses a DMI based whitelist for the SW_TABLET_MODE
functionality, Using the existing DMI quirks mechanism in asus-nb-wmi.c .

Regards,

Hans


> ---
>   drivers/platform/x86/asus-wmi.c            | 32 ++++++++++++++++++----
>   include/linux/platform_data/x86/asus-wmi.h |  1 +
>   2 files changed, 28 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 8f4acdc06b13..c8689da0323b 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -63,6 +63,7 @@ MODULE_LICENSE("GPL");
>   #define NOTIFY_KBD_BRTTOGGLE		0xc7
>   #define NOTIFY_KBD_FBM			0x99
>   #define NOTIFY_KBD_TTP			0xae
> +#define NOTIFY_FLIP_TABLET_MODE_CHANGE	0xfa
>   
>   #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>   
> @@ -173,6 +174,7 @@ struct asus_wmi {
>   	int spec;
>   	int sfun;
>   	bool wmi_event_queue;
> +	bool use_flip_tablet_mode;
>   
>   	struct input_dev *inputdev;
>   	struct backlight_device *backlight_device;
> @@ -365,12 +367,22 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>   	if (err)
>   		goto err_free_dev;
>   
> -	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
> +	result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_FLIP_TABLET_MODE);
>   	if (result >= 0) {
> +		asus->use_flip_tablet_mode = true;
>   		input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> -		input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
> -	} else if (result != -ENODEV) {
> -		pr_err("Error checking for keyboard-dock: %d\n", result);
> +		input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> +	} else {
> +		if (result != -ENODEV)
> +			pr_err("Error checking for flip-tablet-mode: %d\n", result);
> +
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
> +		if (result >= 0) {
> +			input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
> +			input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
> +		} else if (result != -ENODEV) {
> +			pr_err("Error checking for keyboard-dock: %d\n", result);
> +		}
>   	}
>   
>   	err = input_register_device(asus->inputdev);
> @@ -2114,7 +2126,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>   		return;
>   	}
>   
> -	if (code == NOTIFY_KBD_DOCK_CHANGE) {
> +	if (!asus->use_flip_tablet_mode && code == NOTIFY_KBD_DOCK_CHANGE) {
>   		result = asus_wmi_get_devstate_simple(asus,
>   						      ASUS_WMI_DEVID_KBD_DOCK);
>   		if (result >= 0) {
> @@ -2125,6 +2137,16 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>   		return;
>   	}
>   
> +	if (asus->use_flip_tablet_mode && code == NOTIFY_FLIP_TABLET_MODE_CHANGE) {
> +		result = asus_wmi_get_devstate_simple(asus,
> +						      ASUS_WMI_DEVID_FLIP_TABLET_MODE);
> +		if (result >= 0) {
> +			input_report_switch(asus->inputdev, SW_TABLET_MODE, result);
> +			input_sync(asus->inputdev);
> +		}
> +		return;
> +	}
> +
>   	if (asus->fan_boost_mode_available && code == NOTIFY_KBD_FBM) {
>   		fan_boost_mode_switch_next(asus);
>   		return;
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 897b8332a39f..1897b4683562 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -62,6 +62,7 @@
>   
>   /* Misc */
>   #define ASUS_WMI_DEVID_CAMERA		0x00060013
> +#define ASUS_WMI_DEVID_FLIP_TABLET_MODE	0x00060062
>   
>   /* Storage */
>   #define ASUS_WMI_DEVID_CARDREADER	0x00080013
> 

