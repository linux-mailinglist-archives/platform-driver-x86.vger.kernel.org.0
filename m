Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AC83F897F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 26 Aug 2021 15:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242789AbhHZN6K (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 26 Aug 2021 09:58:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23128 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238124AbhHZN6D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Aug 2021 09:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629986235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SB1xZS0lLb7+YD7d9V95k8rH91VhprXycgXNPBnXe0M=;
        b=CXWwkhcvPCAHulTviKZSZ+IVulmj9Ee6YA5Pb2KryxUNhU26H6C5HYLLjs7AD3thgpUFGB
        zr4klXor2FbjZY+EidIFb66lLukCC/SQsqOcl14tBjmVt0v//BbSP9pQGPkIV/VRZEcLuN
        d5R4JnxAYgtQCvUKbwJn8JuuNqUsWXY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-lg0Q2-SRM6KOnJWVcynVTg-1; Thu, 26 Aug 2021 09:57:14 -0400
X-MC-Unique: lg0Q2-SRM6KOnJWVcynVTg-1
Received: by mail-ej1-f69.google.com with SMTP id o7-20020a170906288700b005bb05cb6e25so1213076ejd.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Aug 2021 06:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SB1xZS0lLb7+YD7d9V95k8rH91VhprXycgXNPBnXe0M=;
        b=UVhmhw+HRt5ThlVRJRJH/NpoC58awEoQcvHjwZxUXCGxY0YHKJY7clSAwmyApK4fUs
         BkTVL9DEXNa7LFZrwHVy2J68Qwf00RisLf7vHWw/YhFfFoI/2nWUkaFaes8M7un8t3b6
         0nJwBF7QjRlDT1ybHAWVvIjq2bqNy2Kh1DIR/1V0ojS3fvcg8aB+MYSp3vod0Lvg36ts
         vigSCalxkewpSA/p2+UzogosNEr+ciY8DeM7lWiyVyav7WQCxTFB3s6REetsg1v6hySC
         X2aVi1HVc05cQuNss8fZXO1A1hHWxSj8cZfLytEenwXkPEEspNQANVeg7GzO2nE+vhOm
         yUWA==
X-Gm-Message-State: AOAM532bRZHrbDC5b+1hlY0/FkkDRFrFpiPIp5cGyXNzrYf7GgkF4814
        QBsOk1n8aluT4/59AqAtv+hYmnCSEsh7tiG6VZRTSTnY3YySn00bAWqElymlY3Oxz/6zkYmerNH
        exbZvhNWyJCXA5oaeaZdqkBrJ7TEkSYDe2g==
X-Received: by 2002:a17:907:a06c:: with SMTP id ia12mr4422677ejc.377.1629986232956;
        Thu, 26 Aug 2021 06:57:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyT4NK/3oTiPEdb8osu2jmYpLf8dXmFzeAQwv52kaLJG3MjwBm9TByAVPQ8dI3x4YaffBuL6Q==
X-Received: by 2002:a17:907:a06c:: with SMTP id ia12mr4422660ejc.377.1629986232778;
        Thu, 26 Aug 2021 06:57:12 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id v1sm1544438ejd.31.2021.08.26.06.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 06:57:12 -0700 (PDT)
Subject: Re: [PATCH][RFC] platform/x86: dell-smbios-wmi: Avoid false-positive
 memcpy() warning
To:     Kees Cook <keescook@chromium.org>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        Andy Lavr <andy.lavr@gmail.com>, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20210825160749.3891090-1-keescook@chromium.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7107d06d-784e-c643-c4eb-50e9f277bd38@redhat.com>
Date:   Thu, 26 Aug 2021 15:57:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825160749.3891090-1-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/25/21 6:07 PM, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Since all the size checking has already happened, use input.pointer
> (void *) so memcpy() doesn't get confused about how much is being
> written.
> 
> Avoids this false-positive warning when run-time memcpy() strict
> bounds checking is enabled:
> 
> memcpy: detected field-spanning write (size 4096) of single field (size 36)
> WARNING: CPU: 0 PID: 357 at drivers/platform/x86/dell/dell-smbios-wmi.c:74 run_smbios_call+0x110/0x1e0 [dell_smbios]
> 
> Note: is there a missed kfree() in the marked error path?
> 
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <mgross@linux.intel.com>
> Cc: Mario Limonciello <mario.limonciello@dell.com>
> Cc: "Pali Rohár" <pali@kernel.org>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
> Cc: Dell.Client.Kernel@dell.com
> Cc: platform-driver-x86@vger.kernel.org
> Reported-by: Andy Lavr <andy.lavr@gmail.com>
> Signed-off-by: Kees Cook <keescook@chromium.org>

Thank you, I've applied the patch, minus the:

/* output.pointer memory allocation leak? */

Comment, instead I'll submit (and also apply right-away)
a patch to add the missing kfree()

Regards,

Hans


	
> ---
>  drivers/platform/x86/dell/dell-smbios-wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> index 33f823772733..c410d6d920b8 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -69,9 +69,10 @@ static int run_smbios_call(struct wmi_device *wdev)
>  		if (obj->type == ACPI_TYPE_INTEGER)
>  			dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
>  				obj->integer.value);
> +		/* output.pointer memory allocation leak? */
>  		return -EIO;
>  	}
> -	memcpy(&priv->buf->std, obj->buffer.pointer, obj->buffer.length);
> +	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
>  	dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
>  		priv->buf->std.output[0], priv->buf->std.output[1],
>  		priv->buf->std.output[2], priv->buf->std.output[3]);
> 

