Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA7D37A60D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 May 2021 13:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231392AbhEKLvA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 May 2021 07:51:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56741 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231276AbhEKLvA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 May 2021 07:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620733794;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Whe2b92U5kVUdePQM03i2VZtj34sQh+BU4V01/Bvg3E=;
        b=VkPze8a7NurXWz0J9+8kLQhMoCl+0Ry0K05/ZLJI121IZXILcW/GkLcK2lp5giQOMGWGIn
        M0UpGRSxElOQFoD8dalCblY0+fJK00L8VCTLBPgjcrpMD+HfGGXZblt93M0KR7o0OzgJsJ
        eAMmLjClIC6GT9ZbrGn5G3MyV2jtNfY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-572-yxWhijnFPE-UdJG7uWSmVg-1; Tue, 11 May 2021 07:49:52 -0400
X-MC-Unique: yxWhijnFPE-UdJG7uWSmVg-1
Received: by mail-ej1-f69.google.com with SMTP id k9-20020a17090646c9b029039d323bd239so5822014ejs.16
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 May 2021 04:49:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Whe2b92U5kVUdePQM03i2VZtj34sQh+BU4V01/Bvg3E=;
        b=B2fTFtn2qORsCF0qHQdRIo53m1Z7f/HOwixhCDVHBI2ebvwxBJ9t3Pm4BnuiAEvaKJ
         EIPJgS32e2DDnx4bPpGXpdlc66kCcwxURp3HkfVAdSE/yrak/3sKlGEVbG4CZ/4gMQPl
         YDN5wFy2t+FdoyWUj9HImlD1TNss+KW5w5jj3jx2FgEUmUfToLzsD9vV1/J9DMyUiL7i
         rFGPWUF55H5WRhU5Qq7b4GLLWQRKqd6JThUhGPCJe8gECN9pj7vosyvE8TOa0XyFw9TD
         Osk7DjdSjqra7nuTkJkNRISBSAWPkwYJFvdabc/2Rnob++jMHb70xyVdyzNnCSoGKzXL
         v0KA==
X-Gm-Message-State: AOAM530lF/8tW/9+uuL/Y4C8hCqFJucJQnvRjZs4krdgX1Qq0RHL4mPq
        egx1EQ6wsvlvhaPA5Oh1+Yi3slRwiHp+oT9uOie0DuYWMalSGqnKD4u/9Qthj1qxbq01ffuNFvX
        8vROOLKUxkJAN+eIj7VIEghx0woz6m6mQhxuk/a4B9IKuuSBkb5qMeHD9H3TJx6YLtRLCOeJ4VZ
        D4BnoeELla2Q==
X-Received: by 2002:aa7:de9a:: with SMTP id j26mr12841052edv.269.1620733791056;
        Tue, 11 May 2021 04:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmeheoEiAUz7JXTmSswmLDu6dIzr51ECVbWaudHXxtlJjyJapE6PTe02zhoXKtSgdILGE4/g==
X-Received: by 2002:aa7:de9a:: with SMTP id j26mr12841029edv.269.1620733790810;
        Tue, 11 May 2021 04:49:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t22sm14281817edw.29.2021.05.11.04.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 May 2021 04:49:50 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: hp_accel: Avoid invoking _INI to speed up
 resume
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, mgross@linux.intel.com
Cc:     Eric Piel <eric.piel@tremplin-utc.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20210430060736.590321-1-kai.heng.feng@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <37304def-9131-c6ff-896d-1062970a0236@redhat.com>
Date:   Tue, 11 May 2021 13:49:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210430060736.590321-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/30/21 8:07 AM, Kai-Heng Feng wrote:
> hp_accel can take almost two seconds to resume on some HP laptops.
> 
> The bottleneck is on evaluating _INI, which is only needed to run once.
> 
> Resolve the issue by only invoking _INI when it's necessary. Namely, on
> probe and on hibernation restore.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Thank you I've added this to my review-hans branch.
I'll also add this to my fixes branch and include it in
a future pdx86 fixes pull-req for Linus for 5.13.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
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
>  drivers/misc/lis3lv02d/lis3lv02d.h |  1 +
>  drivers/platform/x86/hp_accel.c    | 22 +++++++++++++++++++++-
>  2 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/lis3lv02d/lis3lv02d.h b/drivers/misc/lis3lv02d/lis3lv02d.h
> index c394c0b08519a..7ac788fae1b86 100644
> --- a/drivers/misc/lis3lv02d/lis3lv02d.h
> +++ b/drivers/misc/lis3lv02d/lis3lv02d.h
> @@ -271,6 +271,7 @@ struct lis3lv02d {
>  	int			regs_size;
>  	u8                      *reg_cache;
>  	bool			regs_stored;
> +	bool			init_required;
>  	u8                      odr_mask;  /* ODR bit mask */
>  	u8			whoami;    /* indicates measurement precision */
>  	s16 (*read_data) (struct lis3lv02d *lis3, int reg);
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 799cbe2ffcf36..8c0867bda8280 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -88,6 +88,9 @@ MODULE_DEVICE_TABLE(acpi, lis3lv02d_device_ids);
>  static int lis3lv02d_acpi_init(struct lis3lv02d *lis3)
>  {
>  	struct acpi_device *dev = lis3->bus_priv;
> +	if (!lis3->init_required)
> +		return 0;
> +
>  	if (acpi_evaluate_object(dev->handle, METHOD_NAME__INI,
>  				 NULL, NULL) != AE_OK)
>  		return -EINVAL;
> @@ -356,6 +359,7 @@ static int lis3lv02d_add(struct acpi_device *device)
>  	}
>  
>  	/* call the core layer do its init */
> +	lis3_dev.init_required = true;
>  	ret = lis3lv02d_init_device(&lis3_dev);
>  	if (ret)
>  		return ret;
> @@ -403,11 +407,27 @@ static int lis3lv02d_suspend(struct device *dev)
>  
>  static int lis3lv02d_resume(struct device *dev)
>  {
> +	lis3_dev.init_required = false;
> +	lis3lv02d_poweron(&lis3_dev);
> +	return 0;
> +}
> +
> +static int lis3lv02d_restore(struct device *dev)
> +{
> +	lis3_dev.init_required = true;
>  	lis3lv02d_poweron(&lis3_dev);
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(hp_accel_pm, lis3lv02d_suspend, lis3lv02d_resume);
> +static const struct dev_pm_ops hp_accel_pm = {
> +	.suspend = lis3lv02d_suspend,
> +	.resume = lis3lv02d_resume,
> +	.freeze = lis3lv02d_suspend,
> +	.thaw = lis3lv02d_resume,
> +	.poweroff = lis3lv02d_suspend,
> +	.restore = lis3lv02d_restore,
> +};
> +
>  #define HP_ACCEL_PM (&hp_accel_pm)
>  #else
>  #define HP_ACCEL_PM NULL
> 

