Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD20543700
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jun 2022 17:16:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243523AbiFHPPT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jun 2022 11:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244340AbiFHPOa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 11:14:30 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6252B12E326
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 08:07:10 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id k19so28751157wrd.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jR5ucCRD1ctjVwCehTL8/SWrd6GdcH9zFkM7ubCwloY=;
        b=r9pPqM8xpt4wuylBRff/ucXvli/IL8AT6e5ujPXj7W0sxQShSi4vSzFvBPtleE/arT
         52P2pGJSMAtvjESFWTEk4YQzjof7UsrgznsJZmD5q8OvLGZHMpf/dv84svtTinZcmLIF
         eU86GhRZ/CuwERlgwHQiEV/5jtye/wcpYdF9kLH0JLg2mflhmrwEaj86qxueENn3Ae2Z
         uuQR+j8GxrWQnEjTiho8wBGVU6DVTd4aiRfKTM6mBh3/ZZXM2fs6faBcw0he9XDEQZkz
         LbmO6pqkZk5PwmTJX2ANZesI6XiSbfuLnrNu3klX79FWXV2/Mhx5V3LvMC65yrAux3Xk
         Wjpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jR5ucCRD1ctjVwCehTL8/SWrd6GdcH9zFkM7ubCwloY=;
        b=Kor11mQxweZ3SF08KKqmw693qhu3ZJXPjubFFD9N8C+WXhCUWXY/TbW2+JfxU0M/Mr
         zPe8WOQCg+02PmKd3CxPODzAvvcDsJKfQ+Eo1UnifCqjqmeVSTZ+95lNH8LL8RKa3AJt
         ccEUBedkqrSsL82/KZ3YEbSxys7hrue7Jt8ci377bdjg+s+Sy+7BlUsGZJvoJjCCC0FY
         4iqh/K5bZdXWmRXkQHbhCA7/3gZIRlitrhG9iK1wMERv+q4KJCDRYmmXBq5wIuTqmIPF
         5y8LZkQPBkPLp6eZsCr8+Jjfdriw3clAi2zKJLM2USxdY2xC0uGOg34mLnZgGEonbPsB
         1Tgw==
X-Gm-Message-State: AOAM533TNYI+UL3ZgwzCdTbNXUZPol3/DG56eC4eDo0dWrCaNE/DSNTf
        8P4eytNggXAAxOp8Vi8iP/UejKM1jVVarTl5
X-Google-Smtp-Source: ABdhPJzrABVEahqOXkCw0qRSD5dcC11oiJcuHfkbfmFnxlBzYOua2IJdBPwEY/KsP8iILy5/KZwxQg==
X-Received: by 2002:a5d:624e:0:b0:210:a42:f29d with SMTP id m14-20020a5d624e000000b002100a42f29dmr33145631wrv.615.1654700828851;
        Wed, 08 Jun 2022 08:07:08 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id x4-20020adfffc4000000b0021018642ff8sm21453128wrs.76.2022.06.08.08.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 08:07:08 -0700 (PDT)
Date:   Wed, 8 Jun 2022 16:07:06 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net
Subject: Re: [PATCH 4/4] platform/x86: thinkpad_acpi: Use backlight helper
Message-ID: <20220608150706.fjuaalab5kzapc47@maple.lan>
References: <20220607184635.1127913-1-steve@sk2.org>
 <20220607184635.1127913-5-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607184635.1127913-5-steve@sk2.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 07, 2022 at 08:46:35PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: ibm-acpi-devel@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
