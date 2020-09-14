Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCA5268B9F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Sep 2020 15:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgINNCD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Sep 2020 09:02:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52749 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726541AbgINNBb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Sep 2020 09:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600088469;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y/yLApSN3g3sKQ4UgKN8jqXaeihtb9JSJALhIWAXqjw=;
        b=XdINnFilYgscSSguX2CYXOqQYT+LE4luMxqGoXRO9sZd7KvsSwtbdAsu8gh1akfJfdBycB
        gjb8PsGkQhQ2FjTKQHFHHuT92Lms3xFJtaR+lv3xLdHdtXEnIL+wzZkhtsI+lOsoPN74GC
        TodB3KO4hJeFv3CWEBY4pAuoO3fneGo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-G2et1WOzO3egBZmD1HMBzg-1; Mon, 14 Sep 2020 09:01:08 -0400
X-MC-Unique: G2et1WOzO3egBZmD1HMBzg-1
Received: by mail-ej1-f72.google.com with SMTP id b17so7963354ejb.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 06:01:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=y/yLApSN3g3sKQ4UgKN8jqXaeihtb9JSJALhIWAXqjw=;
        b=glzaQU4HdfwcqyzpnFKA6z+UnZOA/6lWVO3OleDeinld1U4vfUMDmuGIS/E1EblmFz
         8itcIWD2aKfAEzKX1gG4B+BCtnfc5JqyjdRRgidLfHcz6Il9l+lA/K4d/cy6ap9xJQt8
         mpiLdhDipwGYZOwBOR6wUDSojGiGyatCzkK3qPv/8Smp0ILgxJ5C/H3MKq7UOL/7HOjj
         cTiPxIbJGyEKal0MYO2Y8c8ipAJX6G29lEmjn91sVCXRqtDu49ibD3VaQgdO7wN+gRgQ
         wADRI95p66mcDP5ZFBTvlGCOZHiRhVVPTilHcnVu+IxUuEpSjoWqUe+2eHm2CTuM59KU
         vfMA==
X-Gm-Message-State: AOAM5303xKqsvHXSI8beDei/BStLDId0cwlg3VOiW00IBe/tJzpzgwiA
        lDOC8pfBD+1C2A4qC2+1s/EfJCcuaWbW/nQKBjBnOaJY5zbyATiiMnPGz7f+8UNWUoFWIlj+8TO
        bFvIAV236OIezXwX7V/nARyHA5+sK9qscOQ==
X-Received: by 2002:a17:906:829a:: with SMTP id h26mr15067354ejx.11.1600088466502;
        Mon, 14 Sep 2020 06:01:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoc1z1xu3emqSJUH95pycELTZjXR9eA1tG/OfChcpOWyQlmI2xnWy/Rq+d6slYeYnUSyHdpw==
X-Received: by 2002:a17:906:829a:: with SMTP id h26mr15067336ejx.11.1600088466300;
        Mon, 14 Sep 2020 06:01:06 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id j8sm9179832edp.58.2020.09.14.06.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 06:01:05 -0700 (PDT)
Subject: Re: [PATCH 1/3] mfd: intel_pmt: Add OOBMSM device ID
To:     "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org,
        dvhart@infradead.org, andy@infradead.org,
        alexander.h.duyck@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-2-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3e68c73f-4984-26d1-f15e-695c4c41dcf3@redhat.com>
Date:   Mon, 14 Sep 2020 15:01:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911194549.12780-2-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/11/20 9:45 PM, David E. Box wrote:
> Add Out of Band Management Services Module device ID to Intel PMT driver.
> 
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Lee, I expect you will pick this-one up (and the next also) ?

Regards,

Hans

> ---
>   drivers/mfd/intel_pmt.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> index 0e572b105101..8f9970ab3026 100644
> --- a/drivers/mfd/intel_pmt.c
> +++ b/drivers/mfd/intel_pmt.c
> @@ -55,6 +55,8 @@ struct pmt_platform_info {
>   	unsigned long quirks;
>   };
>   
> +static const struct pmt_platform_info pmt_info;
> +
>   static const struct pmt_platform_info tgl_info = {
>   	.quirks = PMT_QUIRK_NO_WATCHER | PMT_QUIRK_NO_CRASHLOG |
>   		  PMT_QUIRK_TABLE_SHIFT,
> @@ -200,8 +202,10 @@ static void pmt_pci_remove(struct pci_dev *pdev)
>   	pm_runtime_get_sync(&pdev->dev);
>   }
>   
> +#define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
>   #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
>   static const struct pci_device_id pmt_pci_ids[] = {
> +	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
>   	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
>   	{ }
>   };
> 

