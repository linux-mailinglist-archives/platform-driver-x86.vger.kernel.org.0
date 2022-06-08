Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79095436E6
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jun 2022 17:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242253AbiFHPPA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jun 2022 11:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243252AbiFHPOL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 11:14:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43C5B20C252
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 08:06:36 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id k19so28748826wrd.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jun 2022 08:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=PhrsnkQYF8hJROFLG3oTpTLzsaUl8ukSdrO+5KpRu9o=;
        b=oNno/0HbthPALtO1PqKOPIaz5DBcFf9pQWt8bZu0u8lxyCMFRn99MmD/7nQpyKYBjW
         9z4NkSnmwkbSBCcrMc9tNIZFPojEWX1fUE2Z4l26/61CQ/QJ3t3Dfy8iRwncY8JsrDvW
         WcGPn0EIk7FDariBsKjKiV8kWPlyVeGGAPvLRVxpqCqCZAfEAEbrUpX0WPh+qa6+hyfS
         VRibz/A2tn66MQ7M04t1ysEoJCULNws+NqbRP06JhkMEpTtjNSKaaFU7RBBx0X/X+nLR
         /RQRKZpwczAm6BSqgWxWzNEQwGM3y8g022JdnuH/9iS6cWuNwhlPUqduiSU7NQSa3nvY
         aT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PhrsnkQYF8hJROFLG3oTpTLzsaUl8ukSdrO+5KpRu9o=;
        b=QhVy0aerlou/RVqTmojKOZAmJiNfYMFShy1JoMHZMHvZdscz99k8Sr792n5KAjw4Tp
         eEiKZtiBY753Gi971vmvlrj6UqOVhqj20nDwWETqZUCM2r4ZLTU1s+ZwbKueReawG8M4
         7cMp0UEsvLUO+keL0F2WhssT3pveJH21VTX5y2CLA/pRbO7bmnQTG6IZ2aY9s1O5XVRX
         fDHTYSw1IheRy3LqTYVAruOj28SibK3BL3OT4pMr4yEnUPFWT4YNCCm5g3eTenZmNm0B
         MGNfuKcBZAJJVkaDJwHSZXjgewA9nLds9cm/kz3hrj26DmsQxCPnHut//860Q3I7K95P
         BZug==
X-Gm-Message-State: AOAM531VF9+Aa9ADwPhNmNLRvAtoNEEB+nnpOCdxJRGd1UeQJupnxqDT
        TRgblXsZMfXkqbwdEAdWTB9kNA==
X-Google-Smtp-Source: ABdhPJw2zbIWGQqQEdA8aTNGLbz3Y44qF4XhRLn2zSheJU7Rky18ZqbW4vt8p/Wq7OYg6zhHflIsxw==
X-Received: by 2002:a5d:6f1c:0:b0:213:d715:d09f with SMTP id ay28-20020a5d6f1c000000b00213d715d09fmr28589518wrb.275.1654700794698;
        Wed, 08 Jun 2022 08:06:34 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id t22-20020a05600c41d600b00397550b387bsm28672852wmh.23.2022.06.08.08.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 08:06:34 -0700 (PDT)
Date:   Wed, 8 Jun 2022 16:06:32 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] platform/x86: apple-gmux: Use backlight helper
Message-ID: <20220608150632.mnebepml2cply4px@maple.lan>
References: <20220607184635.1127913-1-steve@sk2.org>
 <20220607184635.1127913-3-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220607184635.1127913-3-steve@sk2.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 07, 2022 at 08:46:33PM +0200, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Mark Gross <markgross@kernel.org>
> Cc: platform-driver-x86@vger.kernel.org

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
