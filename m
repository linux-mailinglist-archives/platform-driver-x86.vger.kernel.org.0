Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E986BCF5A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Mar 2023 13:25:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbjCPMZX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Mar 2023 08:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjCPMZW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 08:25:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8437CB4F73
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678969476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UtEGr4Rvg0bEC4nbqE2r93Q3GexaD+ubvmKMlTN9TvQ=;
        b=erYy1GbIiw7MrJVe3r/sbAMtI/7hRYphJdiuHbYV2Y94O6Or+P/JD/yzXcVw/dul/hSV1l
        2QuVQXisP1+C6ypt4DTGmL4VFGIlnefdZuuuwLYM7eNKdHmexRvq/zdiW0FitGn06W/axf
        wGd8FYmAKXX1jti/Xf415xoVX+9tOBc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-udi-NlIaNrSnHi6oILlHXg-1; Thu, 16 Mar 2023 08:24:35 -0400
X-MC-Unique: udi-NlIaNrSnHi6oILlHXg-1
Received: by mail-ed1-f71.google.com with SMTP id w6-20020a05640234c600b004fc0e5b4433so2755442edc.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678969474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UtEGr4Rvg0bEC4nbqE2r93Q3GexaD+ubvmKMlTN9TvQ=;
        b=tpo8gCLuWitPq6N+uRZboOY7Vkbg8xhUZdVcF1s9XC95HYG2FuvY692v0F7oPqHydG
         0bXPaXWyhIVmRR9uzumROtdf2w2LOvRQtOZQuUtXlwqvs4dsNSuz8VyqaUPc72AAVZ+b
         0QhPRd7rNXK7y+saP3U20kZ8qYLlR7BFmyzNLsymGihvlueuxrlCOrVChXmc8Ph4lfTr
         5zawUS1rnjnBs1ewwJByq1SX2LbkpnYMkYjWuvFF5E2sLOeHlGGn/Ih3GJ3FneEzkEzd
         LuetjAX+nZJvZ24qsROdQsjFR3+L06y6nIux0J1JdfY0A/DAgeE765gybxa9WHnhFdgx
         qpTw==
X-Gm-Message-State: AO0yUKVoLsGRNhDmBTdSB0gOAB6rKxFDvQn798HklbjLoG3ADV86w3eg
        Pn4wvzgSczTM0c3og2xl1yb+Ypri85FHm8d2/YbHHCQCK7ZO6Wzaz4hHbclNqNjHLdYDERCthD6
        PIDTtXUg2gTiCXcFK+n4ygvuHSV+kTLrUiQ==
X-Received: by 2002:aa7:cc94:0:b0:4fd:21a6:a649 with SMTP id p20-20020aa7cc94000000b004fd21a6a649mr5834407edt.40.1678969474414;
        Thu, 16 Mar 2023 05:24:34 -0700 (PDT)
X-Google-Smtp-Source: AK7set+WSRrCcr4bhPevwESZvKp7mYRo9xb3YCiMBm28uvFHEvtfafm5xMQQkMOSDAEjaTIY5YVHog==
X-Received: by 2002:aa7:cc94:0:b0:4fd:21a6:a649 with SMTP id p20-20020aa7cc94000000b004fd21a6a649mr5834393edt.40.1678969474168;
        Thu, 16 Mar 2023 05:24:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v1-20020a50c401000000b004acbda55f6bsm3776310edf.27.2023.03.16.05.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 05:24:33 -0700 (PDT)
Message-ID: <33889d76-ec46-6154-106f-d3603960adc9@redhat.com>
Date:   Thu, 16 Mar 2023 13:24:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/1] apple-gmux: Update apple_gmux_detect documentation
Content-Language: en-US, nl
To:     Orlando Chamberlain <orlandoch.dev@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20230309104353.10905-1-orlandoch.dev@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309104353.10905-1-orlandoch.dev@gmail.com>
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

On 3/9/23 11:43, Orlando Chamberlain wrote:
> Commit fc83fbc80e1a ("platform/x86: apple-gmux: refactor gmux types")
> neglected to update the documentation of apple_gmux_detect's arguments.
> Update the documentation to reflect that commit's changes.
> 
> include/linux/apple-gmux.h:99: warning:
> 	Function parameter or member 'type_ret' not described in 'apple_gmux_detect'
> include/linux/apple-gmux.h:99: warning:
> 	Excess function parameter 'indexed_ret' description in 'apple_gmux_detect'
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Link: https://lore.kernel.org/lkml/20230309122822.77435e33@canb.auug.org.au/
> Fixes: fc83fbc80e1a ("platform/x86: apple-gmux: refactor gmux types")
> Signed-off-by: Orlando Chamberlain <orlandoch.dev@gmail.com>

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
>  include/linux/apple-gmux.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
> index 272f63f8fd7c..a7a7d430024b 100644
> --- a/include/linux/apple-gmux.h
> +++ b/include/linux/apple-gmux.h
> @@ -86,7 +86,7 @@ static inline bool apple_gmux_is_mmio(unsigned long iostart)
>   * apple_gmux_detect() - detect if gmux is built into the machine
>   *
>   * @pnp_dev:     Device to probe or NULL to use the first matching device
> - * @indexed_ret: Returns (by reference) if the gmux is indexed or not
> + * @type_ret: Returns (by reference) the apple_gmux_type of the device
>   *
>   * Detect if a supported gmux device is present by actually probing it.
>   * This avoids the false positives returned on some models by

