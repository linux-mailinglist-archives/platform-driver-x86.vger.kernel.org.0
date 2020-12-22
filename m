Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652122DD94B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Dec 2020 20:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725930AbgLQTZu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 17 Dec 2020 14:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbgLQTZu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Dec 2020 14:25:50 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A41C0617B0
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Dec 2020 11:25:09 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id a6so9753wmc.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Dec 2020 11:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ixCzYST95/yuaNiK81DgJI4fw2sfz4OqTewDrmBzQzY=;
        b=EE+bWjgmZYCmpkp12HoUS6LRCELP4LBsnaGbo3WreVLVH6a7QL6p876NZS8ZSye4Ma
         WtkGyc7+Ob0anX1aYMKBJKK+EQa0XetFVboNh6N7jqE1WDPt7HsY4knHMJkcPq/divRV
         IaAktzpprw+PU+JCfHrhscGAONoimtngMISAsSm4PgqJvhHxFaVnGYdpwuNYGQs/LJhH
         kViPrO6HFKJZeaPe++7ALd+p/ndKwUw7fBwoLE76iLfvUOjt8yKDpWAGR9hcJ7L2p2Qb
         9RsLbcxE+A+31aCocEeS8JQ92oNO8Su6WdIpigin26ooyBzBJ0cnAIFPGxeMuT04n6dW
         zdZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ixCzYST95/yuaNiK81DgJI4fw2sfz4OqTewDrmBzQzY=;
        b=GLKxHC6Ju0ep+cUkUajtNjvVnrGpJEP4EKPDU6cFb8WeVztSIMgV/wETvBL9ay6P6E
         7VJqXd5+zZtJpeycTyztxtJFPJmMZwpx4vMGKgYEWHVYT+xRYcY25qWBM873tDKZ1Y+5
         AQ8B/pIk8v4Zi5Us96jx1rlEXGRGUgzEqPIPzB2n+8IHY5uZmVxOnz3M8PP+zDjgahtM
         FWoGpYpKAZtRLJjirPkeDOTVFYOqzdYnEBMUiBFQVZHJISJ2MCqzvlwzTs+z+s6aBypa
         p7nT/ymFqrK8X0xTeHe8Mp8beLEtB+mF5H3o0Jl/KgcGHV8x2tHb9OKEYiJtbQJN8qFc
         3PIg==
X-Gm-Message-State: AOAM533lz+5ZkE9Ki/QcxNponLtlecf7nqmPnBfCr+0Nk5qMrTKRdHeu
        KCeDyQ+YCwWq0kwyeuf2St8bwQ==
X-Google-Smtp-Source: ABdhPJyOFeWBCrILNXkRsgkNImAd+vZ6FQGRL5WGzeKgDFg68HIioj2nft7cI62Tfx/kLzdFJSzRZQ==
X-Received: by 2002:a1c:7dd8:: with SMTP id y207mr784655wmc.181.1608233108453;
        Thu, 17 Dec 2020 11:25:08 -0800 (PST)
Received: from ?IPv6:2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead? ([2a01:e34:ed2f:f020:ccb6:ce78:2bcd:4ead])
        by smtp.googlemail.com with ESMTPSA id r1sm10811356wrl.95.2020.12.17.11.25.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Dec 2020 11:25:07 -0800 (PST)
Subject: Re: [PATCH v2 3/3] thermal/core: Remove ms based delay fields
To:     Hans de Goede <hdegoede@redhat.com>, rui.zhang@intel.com
Cc:     amitk@kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Peter Kaestle <peter@piie.net>,
        Mark Gross <mgross@linux.intel.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        "open list:ACER ASPIRE ONE TEMPERATURE AND FAN DRIVER" 
        <platform-driver-x86@vger.kernel.org>,
        "open list:TI BANDGAP AND THERMAL DRIVER" 
        <linux-omap@vger.kernel.org>
References: <20201216220337.839878-1-daniel.lezcano@linaro.org>
 <20201216220337.839878-3-daniel.lezcano@linaro.org>
 <c575c7bc-cf53-bfdf-ea42-e8661d714699@redhat.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <01f5ee86-a1c2-97da-a55d-8c5ab0e21154@linaro.org>
Date:   Thu, 17 Dec 2020 20:25:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c575c7bc-cf53-bfdf-ea42-e8661d714699@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 17/12/2020 19:32, Hans de Goede wrote:
> Hi Daniel,
> 
> On 12/16/20 11:03 PM, Daniel Lezcano wrote:
>> The code does no longer use the ms unit based fields to set the
>> delays as they are replaced by the jiffies.
>>
>> Remove them and replace their user to use the jiffies version instead.
>>
>> Cc: Thara Gopinath <thara.gopinath@linaro.org>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
> 
> I assume that you will merge this through the thermal tree,
> here is my ack for doing so for the pdx86 bits:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Thanks!


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
