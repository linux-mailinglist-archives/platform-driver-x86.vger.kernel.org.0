Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47844268BA6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Sep 2020 15:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgINNDY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Sep 2020 09:03:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30373 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726557AbgINNBn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Sep 2020 09:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600088490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v3K12X8HJ+ECYw5CnAH7ONBajCRX6qc8Qgfrbmuplgg=;
        b=Q0CB0BdZ21MugMxxeZqsjHitP3ojsMQAtKOO1om8Paawy4DcGrW8yODsSNUAvG6MpoT4Oo
        Pg12XO2ejkqmFq0kEQb3pfCt/V/Hvulp9lEGM94XEz06rEjtYWJs1nW5VxA3TQWx712W1d
        PBoje4FY33fezaui7oObZLhjw6XP37Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-UtNAbN6BOeavJqKSwJH99A-1; Mon, 14 Sep 2020 09:01:22 -0400
X-MC-Unique: UtNAbN6BOeavJqKSwJH99A-1
Received: by mail-ed1-f69.google.com with SMTP id y1so9218392edw.16
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 06:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v3K12X8HJ+ECYw5CnAH7ONBajCRX6qc8Qgfrbmuplgg=;
        b=pXWEny2AhE9G5En4J8NULJQSfQFXznyCUh1XdJJJNSuI/dVo9aa+AGX6nuLc4MvV4/
         CBK/YjHVFXcLsg/lbd4uqzX2WstIB/gY84yb1dXll20m80oqwDKoIBPsjAdT1me3aMnQ
         O45r8MWSNAer/Qwg3IRhT9+2jR4BvllCGohGqezrgNjrx8NOB/D74ocbe+9Y6a0dCzZ/
         keltZpxEQad0qbZjKpl1xO7UYUE5gEd30JeXmLVjcBqp1+vbPHPXVi10cUFPGH/D+OKE
         jlyPIsHjPrpHTkajr443I9U6+XxAIItH1mS2Xkh+J6erEKcpFJdBXijL9/s/Tx5EjmTB
         ywGA==
X-Gm-Message-State: AOAM531QnBnz1Xp4hP7kN9786ua0xQawWEQRb/meMWGEsthURyaEnwjg
        ztRPkSnjvzWHjkoafW3tYGO3q+iUTYQWjK3Dgrjd3r2WbC/dFYY7xu0TISKC5nK5vdqIvOau7T3
        xCcScIcWwCmnsdveRkI0T1nBUwpCa4TDnKg==
X-Received: by 2002:a17:906:4b41:: with SMTP id j1mr14363834ejv.1.1600088480714;
        Mon, 14 Sep 2020 06:01:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxV61kmAn2Fj03CIxOncqAlwBEjPLAmkENAOhI6NrFuoJOLuor8JVJCagDvxtA9dbBAB0Ko2Q==
X-Received: by 2002:a17:906:4b41:: with SMTP id j1mr14363810ejv.1.1600088480513;
        Mon, 14 Sep 2020 06:01:20 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id j5sm7728407ejt.52.2020.09.14.06.01.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 06:01:19 -0700 (PDT)
Subject: Re: [PATCH 2/3] mfd: intel_pmt: Add Alder Lake (ADL) support
To:     "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org,
        dvhart@infradead.org, andy@infradead.org,
        alexander.h.duyck@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-3-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <8b88768f-9ddd-0e14-b788-98eb791c6aa3@redhat.com>
Date:   Mon, 14 Sep 2020 15:01:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911194549.12780-3-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/11/20 9:45 PM, David E. Box wrote:
> Add PMT support for Alder Lake (ADL). Use same quirks as Tiger Lake since
> the design is the same, meaning no support for Watcher or Crashlog.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Lee, I expect you will pick this-one up (and the next also) ?

Regards,

Hans



> ---
>   drivers/mfd/intel_pmt.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/mfd/intel_pmt.c b/drivers/mfd/intel_pmt.c
> index 8f9970ab3026..1b57a970a9d7 100644
> --- a/drivers/mfd/intel_pmt.c
> +++ b/drivers/mfd/intel_pmt.c
> @@ -202,9 +202,11 @@ static void pmt_pci_remove(struct pci_dev *pdev)
>   	pm_runtime_get_sync(&pdev->dev);
>   }
>   
> +#define PCI_DEVICE_ID_INTEL_PMT_ADL	0x467d
>   #define PCI_DEVICE_ID_INTEL_PMT_OOBMSM	0x09a7
>   #define PCI_DEVICE_ID_INTEL_PMT_TGL	0x9a0d
>   static const struct pci_device_id pmt_pci_ids[] = {
> +	{ PCI_DEVICE_DATA(INTEL, PMT_ADL, &tgl_info) },
>   	{ PCI_DEVICE_DATA(INTEL, PMT_OOBMSM, &pmt_info) },
>   	{ PCI_DEVICE_DATA(INTEL, PMT_TGL, &tgl_info) },
>   	{ }
> 

