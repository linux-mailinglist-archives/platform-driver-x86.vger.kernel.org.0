Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 060F06BD24F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Mar 2023 15:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbjCPO0L (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Mar 2023 10:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231145AbjCPO0J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 10:26:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D55B78A7
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678976719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=283XLpLkY/GtlkVIgN/bgnAXAkOeliF5pq/xdk1cojI=;
        b=QNxNIXxShleZxppmK7cMSvr2M24iZ1beiU6WYISOxkVdLC6ByXtLHxYroXMgX188bz9PEU
        D+w9vNaldPueDELzsI1V9mRWDS2gaycRWZ9sLHN9m6qAZMtEzMbQ/2RHxDDAgw2BskDw7t
        RQCe7EQvJS/22+MqCrmAYLyURRmM7UE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-uzQ-V71IPxeMiYh_Q5urRQ-1; Thu, 16 Mar 2023 10:25:18 -0400
X-MC-Unique: uzQ-V71IPxeMiYh_Q5urRQ-1
Received: by mail-ed1-f72.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso3257031edu.17
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:25:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678976717;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=283XLpLkY/GtlkVIgN/bgnAXAkOeliF5pq/xdk1cojI=;
        b=RekWVFrCLpAs+DjfVBzacK20kEpAvVfG4CI28UDguyaH7Ns8QAJ0xO3xememecVcLL
         B9elfiX0KUIoqG+1/2/mXagQUTFQklnrADwbhWveXLGn3XPDs/13SCfbRv9biAznLWWG
         l0Zbd4foilVtXZ+ns2sGe3WljppgTXpmh6owYrbeTJBYuzFYDXytufRWbxjoA65Nk3zQ
         HV4mkzJBU8f6qMdxYpLNravnDbf7aiEltT9wBn5WA1hBLKz5+bU06eIi4+b0rzLDvPNY
         rRmgxNkdSTuGs0mVQu8Ekc9inzAo2A1hdre4mJoclRhoA86sUn0C/mOCC6jewYkMgqDi
         VqWw==
X-Gm-Message-State: AO0yUKVPwLoWZg48dpTea0OxAT+01MRhrpWMjFnrkaXrQ2QoR20iHbSO
        VNBaCfOIfr4X0Loll/B769TggMwBqjAchAyw4szQX50kqSVoi77sn6Ic9486/zZlX6qP4uykbze
        D/YuS5glOBhZnfeL3ip/IrGWKKN/GL4m+PA==
X-Received: by 2002:a05:6402:658:b0:4fd:2155:74ef with SMTP id u24-20020a056402065800b004fd215574efmr6895465edx.19.1678976717062;
        Thu, 16 Mar 2023 07:25:17 -0700 (PDT)
X-Google-Smtp-Source: AK7set+8ohUPdNc1ewEcrGnImeeVbX9S/OYzn7ZNnFHIlHpjijoBmWkVr/rFmti45Bb/aaCqQQfYNQ==
X-Received: by 2002:a05:6402:658:b0:4fd:2155:74ef with SMTP id u24-20020a056402065800b004fd215574efmr6895438edx.19.1678976716779;
        Thu, 16 Mar 2023 07:25:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z25-20020a50cd19000000b004af73333d6esm3942089edi.53.2023.03.16.07.25.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:25:16 -0700 (PDT)
Message-ID: <dd36a2ab-d465-f857-30c6-3c0094babd31@redhat.com>
Date:   Thu, 16 Mar 2023 15:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH linux-next v2 1/3] platform/x86/intel/tpmi: Fix double
 free in tpmi_create_device()
Content-Language: en-US, nl
To:     Dongliang Mu <dzm91@hust.edu.cn>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
 <20230309040107.534716-2-dzm91@hust.edu.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309040107.534716-2-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/23 05:01, Dongliang Mu wrote:
> The previous commit 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix
> double free reported by Smatch") incorrectly handle the deallocation of
> res variable. As shown in the comment, intel_vsec_add_aux handles all
> the deallocation of res and feature_vsec_dev. Therefore, kfree(res) can
> still cause double free if intel_vsec_add_aux returns error.
> 
> Fix this by adjusting the error handling part in tpmi_create_device,
> following the function intel_vsec_add_dev.
> 
> Fixes: 6a192c0cbf38 ("platform/x86/intel/tpmi: Fix double free reported by Smatch")
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

IIRC then after this v2 was posted I still saw some comments on the original v1 which was not posted on the list. Without the v1 comments being on the list and this archived, I have lost track of what the status of these patches is.

Srinivas, can you let me know if I should merge these, or if more changes are necessary ?

From the off-list discussion of v1 I got the impression more changes are necessary, but I'm not sure.

Regards,

Hans




> ---
>  drivers/platform/x86/intel/tpmi.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/tpmi.c b/drivers/platform/x86/intel/tpmi.c
> index c999732b0f1e..882fe5e4763f 100644
> --- a/drivers/platform/x86/intel/tpmi.c
> +++ b/drivers/platform/x86/intel/tpmi.c
> @@ -215,8 +215,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  
>  	feature_vsec_dev = kzalloc(sizeof(*feature_vsec_dev), GFP_KERNEL);
>  	if (!feature_vsec_dev) {
> -		ret = -ENOMEM;
> -		goto free_res;
> +		kfree(res);
> +		return -ENOMEM;
>  	}
>  
>  	snprintf(feature_id_name, sizeof(feature_id_name), "tpmi-%s", name);
> @@ -242,17 +242,8 @@ static int tpmi_create_device(struct intel_tpmi_info *tpmi_info,
>  	 * feature_vsec_dev memory is also freed as part of device
>  	 * delete.
>  	 */
> -	ret = intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
> -				 feature_vsec_dev, feature_id_name);
> -	if (ret)
> -		goto free_res;
> -
> -	return 0;
> -
> -free_res:
> -	kfree(res);
> -
> -	return ret;
> +	return intel_vsec_add_aux(vsec_dev->pcidev, &vsec_dev->auxdev.dev,
> +				  feature_vsec_dev, feature_id_name);
>  }
>  
>  static int tpmi_create_devices(struct intel_tpmi_info *tpmi_info)

