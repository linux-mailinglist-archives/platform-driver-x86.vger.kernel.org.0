Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2889D3EFE3D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Aug 2021 09:52:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbhHRHwt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 Aug 2021 03:52:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41304 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239196AbhHRHwq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 03:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629273129;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pOMN6Z2zh1UW6EVvLFcoYXZV9eRu7KQDPh2XJGIt4dg=;
        b=S672gC09KNru327l2R5MmSYoXROUu2zVuatZBp32PBQ/elfJRQqRwRzQj+5fRDjXuktaIz
        vfQeF6f6Zr07DZW6dqgW/RKSw/927oL3TqkDeak1Kmyr42KOmynCE/weKLspTJmliUTDgi
        Xz67vtJUP9N8vfQ2Qi+b/RJDQwWvHVk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-dJCdAPidN4iJncXwn_FTkA-1; Wed, 18 Aug 2021 03:52:08 -0400
X-MC-Unique: dJCdAPidN4iJncXwn_FTkA-1
Received: by mail-ej1-f70.google.com with SMTP id u23-20020a1709064ad700b005bb12df6cb9so543985ejt.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Aug 2021 00:52:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pOMN6Z2zh1UW6EVvLFcoYXZV9eRu7KQDPh2XJGIt4dg=;
        b=YzPLz9pQlQVtqTkjosGlt06QS5eZvDfIYQRcHS6vK+UaW34gDkMNAEfMoG6nYQQmhw
         JxFCmVNJo1V0RBVTELRchbiZ/nyYltAqWMrS2HFIzwXjQ5FhGLCShjJyqLlP9ds3Kk+E
         aQ+sV4ucOHgjuHBWZZMINTwpFfas50LAAUZuwKlscUl3T40eF4ceNwK7+P6sT3oBZ0Cq
         DiVEqUx/slvWLdg3h6MlofplM5rYs2oVpspGRsk1RD83gMenHckbTHisJwcGZjkpL/11
         skcSahWz9fQ6UpY/aHKou+wThFHSBjCZFrwknjK3nrUp2cMN8I5XmPHpI6ZapUuKJnC6
         JyeQ==
X-Gm-Message-State: AOAM530bwJTEHKUhsZGbA97PxP773rWobyIQuH7TllFxyPLbRZxs3kYF
        SSh3pXvDUbO8rL2BZOpC5qbmPkbwzCeFlBJy1kZBIMlub6PQCkHFiTDg5yYpTB77ZPojFiCPYcv
        UZ0/NcR2bKUQ3QaJaw1eqiphH5Ko+7bdL1g==
X-Received: by 2002:a17:906:c4c:: with SMTP id t12mr8490876ejf.217.1629273126666;
        Wed, 18 Aug 2021 00:52:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKuoN0LMbLlnRfvMbXfG+NS0pWGRAO2j3+oB/zXa5n9J84AZ01fPrOVlJL4FGyr+YINw9iTQ==
X-Received: by 2002:a17:906:c4c:: with SMTP id t12mr8490869ejf.217.1629273126477;
        Wed, 18 Aug 2021 00:52:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id a25sm1642557ejv.91.2021.08.18.00.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 00:52:06 -0700 (PDT)
Subject: Re: [PATCH v2 4/5] platform/x86: intel_pmt_telemetry: Ignore zero
 sized entries
To:     "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org,
        mgross@linux.intel.com, bhelgaas@google.com,
        srinivas.pandruvada@intel.com, andy.shevchenko@gmail.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20210817224018.1013192-1-david.e.box@linux.intel.com>
 <20210817224018.1013192-5-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c1a8e066-ef99-911c-1b82-6e8da62e935a@redhat.com>
Date:   Wed, 18 Aug 2021 09:52:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210817224018.1013192-5-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/21 12:40 AM, David E. Box wrote:
> Some devices may expose non-functioning entries that are reserved for
> future use. These entries have zero size. Ignore them during probe.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

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
> 
> V2:	New patch
> 
>  drivers/platform/x86/intel/pmt/telemetry.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/pmt/telemetry.c b/drivers/platform/x86/intel/pmt/telemetry.c
> index 3559f6e7b388..d93d02672679 100644
> --- a/drivers/platform/x86/intel/pmt/telemetry.c
> +++ b/drivers/platform/x86/intel/pmt/telemetry.c
> @@ -61,6 +61,14 @@ static int pmt_telem_header_decode(struct intel_pmt_entry *entry,
>  	/* Size is measured in DWORDS, but accessor returns bytes */
>  	header->size = TELEM_SIZE(readl(disc_table));
>  
> +	/*
> +	 * Some devices may expose non-functioning entries that are
> +	 * reserved for future use. They have zero size. Do not fail
> +	 * probe for these. Just ignore them.
> +	 */
> +	if (header->size == 0)
> +		return 1;
> +
>  	return 0;
>  }
>  
> 

