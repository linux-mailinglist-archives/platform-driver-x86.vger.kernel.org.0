Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 520AA436A72
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Oct 2021 20:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbhJUSUy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 21 Oct 2021 14:20:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21790 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230184AbhJUSUx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Oct 2021 14:20:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634840317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4RpUn6cYgu8cISKY/uglyQh/unX6c+SSLOJqKnpLMP4=;
        b=XWKQ0FVwHyNYjUXuvMO2oyP/xmL5R+6ykW+UsPfi2xF4ibT/n8RqP5UdVuKYQ/844dvBZR
        MrnpDkjMKGvmqiUsUb58I7usTK/SNB56rXgj9vSGaUFKU5H2kdxxCLsjYGwiymKwtdr/nb
        XqlrCKBHkO4rstrb8p7KKG4p++mCQq4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-DvsFtyqBMPWu-vbpmqK3CQ-1; Thu, 21 Oct 2021 14:18:36 -0400
X-MC-Unique: DvsFtyqBMPWu-vbpmqK3CQ-1
Received: by mail-ed1-f70.google.com with SMTP id g28-20020a50d0dc000000b003dae69dfe3aso1232833edf.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Oct 2021 11:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4RpUn6cYgu8cISKY/uglyQh/unX6c+SSLOJqKnpLMP4=;
        b=SjkdX47JLRmJnPdtJpSkUEalY42WRtV39RBoK/WdCRcRLrbeNODGhbT4pMf0WRr+90
         9V7DpPDBdTZs97YkSDOxuBWCkkLGNxwjxAzAq6yM8EudUmVxD8cZgZQPhQC5U1Lonono
         qMNOs9BkPHW6FGFkvkkkk8RFtxgXfvm1VWOoqu6BUgrgXkptx2tlI+sPGkpig4jF5Tiw
         iaPju5/o/Px/O/MZxVc+Ig521rxD/m4xTIx9TCOpb678Ns2J0o5K/RzhXd9yNrJ8gK0U
         8DHqRtqBl8EmJy2lg5mUGu4VkULqaDNeK4YVMBfB99GWPjbENfZDlprCiJy4BQu/LDKp
         3+UQ==
X-Gm-Message-State: AOAM530ig9Qyu1aYeaW1ErSGdHZSLdnBAU9BcAHLTnooqhVDxaH98P+5
        irzl/0d3uScTnSWC7l1aVuO/5xmPtBR8/1R77ct0hxpQb0PYZJpQGMbEY9R0S6NvufxZiLMHTpo
        pdiKK2pNdGwBRWB3cOr5Xc7w1/hrDcoQFog==
X-Received: by 2002:a17:906:6a2a:: with SMTP id qw42mr9041048ejc.313.1634840314878;
        Thu, 21 Oct 2021 11:18:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxq3JaVpgudA3LEa/AETJnANbrKR4WRMFwyz5bCVzBY6kDX3Ttts2W1A1g/UriPqlAIU1iSGg==
X-Received: by 2002:a17:906:6a2a:: with SMTP id qw42mr9041033ejc.313.1634840314732;
        Thu, 21 Oct 2021 11:18:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id n24sm3307748edb.28.2021.10.21.11.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 11:18:34 -0700 (PDT)
Message-ID: <f903b9d5-0477-1618-6596-b6039b56a5af@redhat.com>
Date:   Thu, 21 Oct 2021 20:18:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] platform/x86: amd-pmc: Store the pci_dev instance
 inside struct amd_pmc_dev
Content-Language: en-US
To:     Sanket Goswami <Sanket.Goswami@amd.com>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211021092938.196933-1-Sanket.Goswami@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211021092938.196933-1-Sanket.Goswami@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/21/21 11:29, Sanket Goswami wrote:
> Store the root port information in amd_pmc_probe() so that the
> information can be used across multiple routines.
> 
> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> ---
> Changes in v2:
> - Store the rdev info in amd_pmc_probe() as suggested by Hans.

Thank you, but there are still some issues, see below.


>  drivers/platform/x86/amd-pmc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 55f14bdfdbfd..502f37eaba1f 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -119,6 +119,7 @@ struct amd_pmc_dev {
>  	u16 minor;
>  	u16 rev;
>  	struct device *dev;
> +	struct pci_dev *rdev;
>  	struct mutex lock; /* generic mutex lock */
>  #if IS_ENABLED(CONFIG_DEBUG_FS)
>  	struct dentry *dbgfs_dir;
> @@ -482,6 +483,7 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	dev->rdev = rdev;
>  	dev->cpu_id = rdev->device;
>  	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
>  	if (err) {
> @@ -512,7 +514,6 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  	}
>  
>  	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
> -	pci_dev_put(dev->rdev);

The current code here actually reads:

	pci_dev_put(rdev);

Note (rdev) not (dev->rdev). I don't know what you based this on, this is weird.

Also there are a bunch of error-exits from amd_pmc_probe() which not all
need a "pci_dev_put(rdev)" added to them before there "return ERROR;"
statement.

It would be best to add:

err_pci_dev_put:
	pci_dev_put(rdev);
	return err;

Add the end off the function (after the return 0;) and replace all
"return FOO" error-exits with:

		err = <FOO>;
		goto err_pci_dev_put;
	}



Regards,

Hans




>  	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
>  
>  	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
> @@ -546,6 +547,7 @@ static int amd_pmc_remove(struct platform_device *pdev)
>  	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
>  
>  	amd_pmc_dbgfs_unregister(dev);
> +	pci_dev_put(dev->rdev);
>  	mutex_destroy(&dev->lock);
>  	return 0;
>  }
> 

