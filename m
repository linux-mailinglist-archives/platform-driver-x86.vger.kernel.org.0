Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927005A9C35
	for <lists+platform-driver-x86@lfdr.de>; Thu,  1 Sep 2022 17:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbiIAPvW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 1 Sep 2022 11:51:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbiIAPvP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Sep 2022 11:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711487F269
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Sep 2022 08:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662047473;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ceLO303KUmrfBpUmDlWW6bfcpSkbAE/shqJJVjKA2W8=;
        b=SbnDKYkDQcxDIFRyc7dyLbfTgkopZT4KX/sfXAzTDNed56LCSjTbDgVDGeluzDDnhhB8wV
        fPwCUHojOdXl1BFa1nvjZTPhjlI9NRJJCZsCy8j+FtPd5poVjGN+1wsVr3vx0XRQhNrd9t
        uAIh98sE3r0h5bdZzE4gzYY4GKAGOs4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-578-8sHB9t0XOpy4BJ1FZ_FFNw-1; Thu, 01 Sep 2022 11:51:12 -0400
X-MC-Unique: 8sHB9t0XOpy4BJ1FZ_FFNw-1
Received: by mail-ed1-f71.google.com with SMTP id r11-20020a05640251cb00b004484ec7e3a4so9148498edd.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Sep 2022 08:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ceLO303KUmrfBpUmDlWW6bfcpSkbAE/shqJJVjKA2W8=;
        b=8O/EI8CLygO71dWdt/nUNrToFL1KJilWNUB97JD1GNDZ46w8Zywfefq5utwPafvRFH
         Gk1Eou1rrG22h0Wgz2w9k1b+iW0qjdWoFMBoCsehjjbynjWzozXK9YC5ae0nxQlw7jRg
         aitsVvlTM7DxNiPstp7auT/8ycJuqmnakTN1POV8QxhL2P0I3yhdWmZ2Cy6kLTfGmOKL
         Aa6oUI9FUcyeLiullceWlGW4btbdOdgl3d9zzfI3rDHZxL3FOEVKPxNfsoE81espcxw2
         hIN2fcQLAp1u/r6MWojALeaSIg7pxz/ZyftIe0myWrhUY6fRKSBXCkFVGKPWzJTrXu1q
         GufA==
X-Gm-Message-State: ACgBeo0Eo2T7v2fizGopkId24aNpoLQtJIz8gUcbHAPR0wr3/AGq3wHY
        pc9lzdVT5UuaTceC8B6d08a35sPpn8PY8wwIxHN6peIK4+lbrMioczq5ec1jAH9MM9u8FagQ3Pn
        kmX+h7C/7mUHuHg2XdCmrBv2Fz7a/tNPZyw==
X-Received: by 2002:a17:906:974b:b0:733:10e:b940 with SMTP id o11-20020a170906974b00b00733010eb940mr24299166ejy.326.1662047471324;
        Thu, 01 Sep 2022 08:51:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR53q/rSRkk/xrOhhO7q/AleiPEgKRnSsOD8nQB0CtaGMstmT1apyYCnltjwPvPvF8H99yYDqA==
X-Received: by 2002:a17:906:974b:b0:733:10e:b940 with SMTP id o11-20020a170906974b00b00733010eb940mr24299146ejy.326.1662047471079;
        Thu, 01 Sep 2022 08:51:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id eh22-20020a0564020f9600b0044792480994sm1525249edb.68.2022.09.01.08.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Sep 2022 08:51:10 -0700 (PDT)
Message-ID: <42bb615d-995a-5bcb-d481-f0d6054d4398@redhat.com>
Date:   Thu, 1 Sep 2022 17:51:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 1/1] platform/x86: p2sb: Fix UAF when caller uses
 resource name
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <markgross@kernel.org>,
        kernel test robot <oliver.sang@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20220901113406.65876-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220901113406.65876-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/1/22 13:34, Andy Shevchenko wrote:
> We have to copy only selected fields from the original resource.
> Because a PCI device will be removed immediately after getting
> its resources, we may not use any allocated data, hence we may
> not copy any pointers.
> 
> Consider the following scenario:
> 
>   1/ a caller of p2sb_bar() gets the resource;
> 
>   2/ the resource has been copied by platform_device_add_data()
>      in order to create a platform device;
> 
>   3/ the platform device creation will call for the device driver's
>      ->probe() as soon as a match found;
> 
>   4/ the ->probe() takes given resources (see 2/) and tries to
>      access one of its field, i.e. 'name', in the
>      __devm_ioremap_resource() to create a pretty looking output;
> 
>   5/ but the 'name' is a dangling pointer because p2sb_bar()
>      removed a PCI device, which 'name' had been copied to
>      the caller's memory.
> 
>   6/ UAF (Use-After-Free) as a result.
> 
> Kudos to Mika for the initial analisys of the issue.
> 
> Fixes: 9745fb07474f ("platform/x86/intel: Add Primary to Sideband (P2SB) bridge support")
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Suggested-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Link: https://lore.kernel.org/linux-i2c/YvPCbnKqDiL2XEKp@xsang-OptiPlex-9020/
> Link: https://lore.kernel.org/linux-i2c/YtjAswDKfiuDfWYs@xsang-OptiPlex-9020/
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  drivers/platform/x86/p2sb.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
> index fb2e141f3eb8..384d0962ae93 100644
> --- a/drivers/platform/x86/p2sb.c
> +++ b/drivers/platform/x86/p2sb.c
> @@ -42,10 +42,24 @@ static int p2sb_get_devfn(unsigned int *devfn)
>  	return 0;
>  }
>  
> +/* Copy resource from the first BAR of the device in question */
>  static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
>  {
> -	/* Copy resource from the first BAR of the device in question */
> -	*mem = pdev->resource[0];
> +	struct resource *bar0 = &pdev->resource[0];
> +
> +	/* Make sure we have no dangling pointers in the output */
> +	memset(mem, 0, sizeof(*mem));
> +
> +	/*
> +	 * We copy only selected fields from the original resource.
> +	 * Because a PCI device will be removed soon, we may not use
> +	 * any allocated data, hence we may not copy any pointers.
> +	 */
> +	mem->start = bar0->start;
> +	mem->end = bar0->end;
> +	mem->flags = bar0->flags;
> +	mem->desc = bar0->desc;
> +
>  	return 0;
>  }
>  

