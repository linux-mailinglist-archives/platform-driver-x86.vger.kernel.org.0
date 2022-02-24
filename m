Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEBF4C2FAE
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Feb 2022 16:31:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbiBXP3x (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 24 Feb 2022 10:29:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236354AbiBXP1v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 10:27:51 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EC54832C
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 07:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645716440;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MAFlX29r2KocHOYLyVsUNd705D3xbKBcnZPFz8ETr5w=;
        b=DcP7wAJ/xWa5FQzVwbXUjzEUpm40N5SS7/SHQI2caXjXGkWsdGdQuxFMPSMIqZdYLGlg0X
        +iicDnENU/biRFkJ/nkqSe5phcmb2qLf9J0D3BVnJMXyUZWRl+9HMArABc/IIqwdz+knkG
        ZxzcE/hB2xRNJFOKrtjtMlpISJqSDsI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-142-TIUH_uSfPHK2rSaM_KzcCg-1; Thu, 24 Feb 2022 10:27:19 -0500
X-MC-Unique: TIUH_uSfPHK2rSaM_KzcCg-1
Received: by mail-ej1-f70.google.com with SMTP id sa22-20020a1709076d1600b006ce78cacb85so1384765ejc.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 07:27:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=MAFlX29r2KocHOYLyVsUNd705D3xbKBcnZPFz8ETr5w=;
        b=Wg8Y8PXyAz8Sw1DFI0fxfcZUs+A4gTMLGVPF7t+pWuLPISpP4Y4xbpFsbiVRWYQB9M
         wy0qEcqPiLJJtFBt+A8OxMzbBO0Gv+LO3reCgPPnyRbURNMl0NxhPYKQcHsxR4gN3n8O
         4PbgTYcsoHIU8h0+6bukB4q7F0kmtP+61JDYefWnlmSfZDktvz9vrjc3c4XoTKpFAOBN
         WpbaW/lTFH4bwFCKXaO+bQKeu4NPIux0WDyCSDp5uipXlxW99RUCPn/ty9OtNJ6P8svs
         byy2R0IKWFCsvK+3rtvrEeiW69Tj7czH6Q5iqsFMCCjn+w4ig9ydeSAi9l0hYuf562tI
         K5mg==
X-Gm-Message-State: AOAM530EZPwJW7gBAuB8UW8xCIYmHMUWEXXrbn4DI8q+Gz9nVxOS41aV
        k4s2ChahnJF8Gs9Bn1Aeq9eTTkIqDTvLYjVSj3XEwA2sYfgtvdN2y8iibyzzwsGsbJqs4WC1BGs
        k2b1uZsfVQperhow3mvenDxB7BbMhIIZWuw==
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id a15-20020a17090682cf00b006d003d68f27mr2673101ejy.236.1645716438209;
        Thu, 24 Feb 2022 07:27:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzwmZPM11UQ+T6MJpkRf/wgOctq2SgXxXTorPBAnahVhFkr1lHSs4O3wwVIy145b56udQuU4Q==
X-Received: by 2002:a17:906:82cf:b0:6d0:3d6:8f27 with SMTP id a15-20020a17090682cf00b006d003d68f27mr2673087ejy.236.1645716438047;
        Thu, 24 Feb 2022 07:27:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id g3sm1499354ejz.180.2022.02.24.07.27.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 07:27:17 -0800 (PST)
Message-ID: <abc99baf-dfd0-96a8-78e7-703c927eb484@redhat.com>
Date:   Thu, 24 Feb 2022 16:27:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] tools/power/x86/intel-speed-select: Remove unneeded
 semicolon
Content-Language: en-US
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>,
        srinivas.pandruvada@linux.intel.com, cgel.zte@gmail.com
References: <20220223093633.1934362-1-deng.changcheng@zte.com.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220223093633.1934362-1-deng.changcheng@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Rafael,

On 2/23/22 10:36, cgel.zte@gmail.com wrote:
> From: Changcheng Deng <deng.changcheng@zte.com.cn>
> 
> Fix the following coccicheck review:
> tools/power/x86/intel-speed-select/hfi-events.c: 147: Unneeded semicolon
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>

Can you add this to your thermal-hfi branch please?

Regards,

Hans


> ---
>  tools/power/x86/intel-speed-select/hfi-events.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/power/x86/intel-speed-select/hfi-events.c b/tools/power/x86/intel-speed-select/hfi-events.c
> index e85676711372..2f871c108236 100644
> --- a/tools/power/x86/intel-speed-select/hfi-events.c
> +++ b/tools/power/x86/intel-speed-select/hfi-events.c
> @@ -144,7 +144,7 @@ static int family_handler(struct nl_msg *msg, void *arg)
>  			continue;
>  		res->id = nla_get_u32(tb2[CTRL_ATTR_MCAST_GRP_ID]);
>  		break;
> -	};
> +	}
>  
>  	return 0;
>  }

