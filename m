Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9405921F282
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Jul 2020 15:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgGNN3K (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 Jul 2020 09:29:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44962 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726602AbgGNN3J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Jul 2020 09:29:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594733348;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+zcLl9caLOTqhvrKcdF/JOO8jE4h/VokVethjwU/Des=;
        b=OccylY+AJQZKiwPvhClS1nbfgg0AWIfqZVuoN0tD1A5xlI0K6FCdNkM6AIz9Xe9rsshnMq
        EoIhJD0ehrd8Wod9rrP22qwbZmJ0VsIO4LjN2YMmcXKibrDDIILjdvgtLywElRIUgQeaxP
        LsDyuvMzLLRu6UQ97YwEHuBNpy9ny2A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-pbmployVNP-8rdZ8WlpLMg-1; Tue, 14 Jul 2020 09:29:06 -0400
X-MC-Unique: pbmployVNP-8rdZ8WlpLMg-1
Received: by mail-wm1-f71.google.com with SMTP id v11so3986966wmb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2020 06:29:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+zcLl9caLOTqhvrKcdF/JOO8jE4h/VokVethjwU/Des=;
        b=nnB59TMnILRHfzdM9uM+F0jJLsf0zKXrypX4yXYMRXQlyHieCdQAfEe0ozPX2hDchW
         hAjbzWFxR1eqHTBonVebfqkCw0xjggg1KpkhIuTuLeNqGlECCjxPXs6Yno/TkvSp+qRY
         iHNctUMzCXuuH6ttaBP4o7nkshnSHCZthf8DND2pcmlW66BV+EFo4sN1zc5Z9TRvIFn0
         dqqOFTnojBo1iwNryCRs06t/dq+KdC51yoPnQBdIbgQDr9e1NR1XenRGUR5b7hjfZ+fs
         0XRao2IaMNig5z9iv0EzzijP67R5nw4KZTguRnLuCCNcm/QHL0qVRL+lxiwRQ8G2LGkp
         hu3g==
X-Gm-Message-State: AOAM530uFGKHRLKIB4zLl2/r+2TMHObfLAj/1k02vdDCTyxiZpeEb/PB
        pRObG8O78nc/qMnCiDKpiUDMEzRhwHCelw8OAtnz+BPGSNZBW/1jge4cKVy+ywiwSIH1lYmsV5s
        MBnzEgRjcUmbrhhUc8GeI/dkUukKhsSSDXA==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr4591722wmj.67.1594733345041;
        Tue, 14 Jul 2020 06:29:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJze0m4qHNxZ4AJzz6FfseQv2/O0o3MHOUE4o26oEtKnyMPK4c1AYnR1dyfxt5ndwL05F9o5TA==
X-Received: by 2002:a7b:c313:: with SMTP id k19mr4591692wmj.67.1594733344848;
        Tue, 14 Jul 2020 06:29:04 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id k4sm7385845wrp.86.2020.07.14.06.29.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2020 06:29:04 -0700 (PDT)
Subject: Re: [PATCH v1] platform/x86: thinkpad_acpi: Limit size when call
 strndup_user()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
References: <20200714104250.87970-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6920cff7-ab7c-a4ef-4f8f-83966b7bf498@redhat.com>
Date:   Tue, 14 Jul 2020 15:29:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200714104250.87970-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/14/20 12:42 PM, Andy Shevchenko wrote:
> During conversion to use strndup_user() the commit 35d13c7a0512
> ("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
> missed the fact that buffer coming thru procfs is not immediately NULL
> terminated. We have to limit size when calling strndup_user().
> 
> Fixes: 35d13c7a0512 ("platform/x86: thinkpad_acpi: Use strndup_user() in dispatch_proc_write()")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>   drivers/platform/x86/thinkpad_acpi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index f571d6254e7c..f411ad814cab 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -886,7 +886,7 @@ static ssize_t dispatch_proc_write(struct file *file,
>   	if (!ibm || !ibm->write)
>   		return -EINVAL;
>   
> -	kernbuf = strndup_user(userbuf, PAGE_SIZE);
> +	kernbuf = strndup_user(userbuf, min_t(long, count, PAGE_SIZE));
>   	if (IS_ERR(kernbuf))
>   		return PTR_ERR(kernbuf);
>   
> 

This is not going to work:

char *strndup_user(const char __user *s, long n)
{
         char *p;
         long length;

         length = strnlen_user(s, n);

         if (!length)
                 return ERR_PTR(-EFAULT);

         if (length > n)
                 return ERR_PTR(-EINVAL);


And strnlen_user is:

#ifndef __strnlen_user
#define __strnlen_user(s, n) (strnlen((s), (n)) + 1)
#endif

/*
  * Unlike strnlen, strnlen_user includes the nul terminator in
  * its returned count. Callers should check for a returned value
  * greater than N as an indication the string is too long.
  */
static inline long strnlen_user(const char __user *src, long n)
{
         if (!access_ok(src, 1))
                 return 0;
         return __strnlen_user(src, n);
}

So strnlen_user returns (n + ) for a string which is n bytes
longs, so:

         length = strnlen_user(s, n);

Will set length = n + 1, and then this check triggers:

         if (length > n)
                 return ERR_PTR(-EINVAL);

Because n + 1 > n, I also build the module with your patch
and as expected I get:

[root@x1 ~]# echo -n 0 > /proc/acpi/ibm/lcdshadow
-bash: echo: write error: Invalid argument

Note you also cannot pass count+1 because then strnlen will
return count+1 if there is no terminating 0 after count bytes
and strnlen_user will return count + 1 + 1 and we still hit
the same check (and we are trying to consume one byte too much).

Can we please just go with the revert for now?

Regards,

Hans


