Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27BFA490579
	for <lists+platform-driver-x86@lfdr.de>; Mon, 17 Jan 2022 10:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238233AbiAQJzx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 17 Jan 2022 04:55:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41063 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235893AbiAQJzw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jan 2022 04:55:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1642413352;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+Zavah50CCFVi2Vkp9ku57YSss8cl2fM7vlj/N5ldog=;
        b=G+Tpqw6rrT3/qtmZhsQMxQ4Vx7JkP3p9EZcbRVnOAV1cfKeVz53kZMYQTvuhc6tbBjKigN
        Fuhg+beKSZAaBP1Bw2xLFqgfKcjgsoSGZS89p38gKKs1XlqjjrtrMXrr2tdzqNgNXRVckc
        6Pr5uwdYh/JpRvYsrL2mBBl7dRtMhpw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-phL_vgISMbCNobWOQ9GvGg-1; Mon, 17 Jan 2022 04:55:51 -0500
X-MC-Unique: phL_vgISMbCNobWOQ9GvGg-1
Received: by mail-ed1-f71.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso652169edc.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Jan 2022 01:55:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=+Zavah50CCFVi2Vkp9ku57YSss8cl2fM7vlj/N5ldog=;
        b=U0uruQ1CGH4InInxmuq1x/LuBnlc8+HBVE8R0b8eoOfxOl1kAOecFyT0z7CHy3qWLJ
         E2hILllr/3jPGOSVSlj+Va625F8Y7k+mr8yNGtWokCLi9hFYVpx/vfumqSVYxpsRq7Or
         uoQqlirp04Hwe6FXLG2rmWZIz9vTHVgL2WoxCoOlOscVKqIqAJaZ2Rwe+Hk4GQAQni0p
         pxUvPIqOt7bIXuurf8ECMhTFNepvYe/2w7+3slwK7V+HFXgw5ON5IeuzhXGCLkJzcQAs
         ZR8jmBe41gUshCeXnA28pDSqEuHSnZMdjZvSi15ICtGPL2gRg6Ln6Lh9KTL06DakozYq
         2YPg==
X-Gm-Message-State: AOAM530xt8+RVq4sUPzelM6nu/qiKvO/kRdB7WPuBRzea7LZI15sEFQe
        LXealbnMvavj0kaYRVwl54zn39dYZzac33IdrzwXg478cpZv8t2R6YuCwJAB+LS3vmfpTdDEW1N
        HJeTd/Sg6lbMDCs09ewuwMXVYXVa9jr5SCA==
X-Received: by 2002:a17:906:7315:: with SMTP id di21mr15727291ejc.700.1642413349658;
        Mon, 17 Jan 2022 01:55:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxhwwQ8HP6Jnulq/kXnN+vvBYk9fXpL+wB1IwApZ20yLVly4rnosnO6IvMl0Vjc0FXyV+hZGA==
X-Received: by 2002:a17:906:7315:: with SMTP id di21mr15727274ejc.700.1642413349413;
        Mon, 17 Jan 2022 01:55:49 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id a6sm801730edx.94.2022.01.17.01.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jan 2022 01:55:48 -0800 (PST)
Message-ID: <9e8d71ab-da70-71c5-9083-86cd671ea495@redhat.com>
Date:   Mon, 17 Jan 2022 10:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] Update whitelisted ThinkPad models with dual fan support
 in thinkpad_acpi
Content-Language: en-US
From:   Hans de Goede <hdegoede@redhat.com>
To:     David Dreschner <david@dreschner.net>,
        ibm-acpi-devel@lists.sourceforge.net,
        Mark Pearson <markpearson@lenovo.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <ec04aa1e-1ac3-edbc-ac08-eec15ec5c952@dreschner.net>
 <aceddce7-6c43-967c-fadd-fa307068e916@redhat.com>
In-Reply-To: <aceddce7-6c43-967c-fadd-fa307068e916@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 1/11/22 12:09, Hans de Goede wrote:
> Hi David,
> 
> On 1/4/22 04:41, David Dreschner wrote:
>> Hey guys,
>>
>> the attached patch updates the list of whitelisted ThinkPad models with dual fan support.
>>
>> The changes were tested on my ThinkPad T15g Gen 2. According to Lenovo, the BIOS version is the same for the P15 Gen 2 and the P17 Gen 2 ( https://pcsupport.lenovo.com/us/en/downloads/ds551321-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15-gen-2-p17-gen-2-t15g-gen-2 ).
>>
>> I also added the P15v Gen 2 and T15p Gen 2 to the whitelist based on the BIOS version listed on the Lenovo homepage ( https://pcsupport.lenovo.com/us/en/downloads/ds551356-bios-update-utility-bootable-cd-for-windows-10-64-bit-thinkpad-p15v-gen-2-t15p-gen-2 ). The first generation had two fans and where covered by the whitelist entry for the P15 Gen 2. As the second generation has two fans, too, I made that change for completeness.
>>
>> To apply the changes before it's merged in the mainline linux kernel, I made a little dkms patch: https://github.com/dreschner/thinkpad_acpi-dual-fan-patch
> 
> Thank you for your patch submission.
> 
> If I understand things correctly then you've only tested the addition of the:
> 
> TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* P15 / P17 / T15g (2nd gen) */
> 
> quirk, correct? In that case we really only want to add that quirk, we don't
> want to go and add untested quirks. But perhaps Mark from Lenovo can confirm
> that this quirk:
> 
> TPACPI_Q_LNV3('N', '3', '8', TPACPI_FAN_2CTL),  /* P15v / T15p (2nd gen) */
> 
> also is correct and that those models really have 2 fans, Mark ?
> 
> Mark, more in general can you perhaps talk to the firmware team and ask
> if there is a better way to detect if there are 2 fans in a thinkpad then
> maintaining a quirk table for this ?
> 
> Besides the issue of the untested quirk, unfortunately your patch is not
> submitted in the right format, so I cannot accept it as is, esp. the
> missing of a Signed-off-by is a blocker.
> 
> Kernel patches should be in git format-patch output format and
> your patch is missing a Signed-off-by line in the commit-message. I can only
> accept patches with a Signed-off-by line in the commit-message like this:
> 
> Signed-off-by: Your Real Name <email@your.domain>
> 
> By adding this line you indicate that you are the author of the code and
> are submitting it under the existing license for the file which you are
> modifying (typically GPL-2.0) or that you have permission from the author
> to submit it under this license. See:
> 
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
> 
> Given that this patch is trivial and mostly data, not code, I can turn
> it into a proper patch with myself as author, crediting you like this:
> 
> Reported-and-tested-by: David Dreschner <david@dreschner.net>
> 
> And then merge it with me as the author, or you can resubmit
> it in the proper format if you prefer.

Despite Mark's answer that he will look into this, it might very well
take quite a while before something comes out of that and it would be
good to in the mean time just extend the quirk list with your
ThinkPad T15g Gen 2 addition.

So can you please let me know how you want to proceed with this
(see above) ?

Regards,

Hans

