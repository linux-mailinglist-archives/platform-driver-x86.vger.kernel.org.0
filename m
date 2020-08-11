Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC9532417EF
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Aug 2020 10:04:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgHKIEj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Aug 2020 04:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728145AbgHKIEi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Aug 2020 04:04:38 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86614C061788
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2020 01:04:37 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a15so10535408wrh.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Aug 2020 01:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=m/9oajnmpulJQFFHe5rO/NKB3oM7j5qRCzsG9Pje1vw=;
        b=WVMBCCGntz9aZSNzO3YGBL6Y5SM+pfJzI1OHFfHZOeB1kaPEXXlb3htXrSjy8zDuCS
         z7DyQl9x3jpE0JH006wM6RG+o35ypzZzygWwX2toXYM3XrU2Mi9a4qg7jgyhFavERwf1
         sYs9pY8XWxvexIgINPc7Vi43PfmdCe3g4IR7jKLbp7EjHU3xGy2347U9DDlA0GoaTLUr
         jkkUhuk1Jnt64sEUosOhKzOg5X+6bXHYPOwgGymYgjxGKK0ZawwAHgPeySN2sxxvf8nK
         KOU5U/cvNuO0uh5Ywm3ndx9LBBHAVMqqvC7G9g7x31AnHgWg0LPfNi2f8C3xrs/XQECe
         F5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=m/9oajnmpulJQFFHe5rO/NKB3oM7j5qRCzsG9Pje1vw=;
        b=KRB9NOSlxm7GcbaJ2j2M3av6q66b7KWKBlgY4gUfFjEkct8zJr48YmYYDLLr3oJmrf
         bOiilGmLTwYgeSC1H1WM7ect54OozyLyWGa3u03awmoOyHFaTSrFB4WRdSXgdlwA5ndg
         wGKXtXSuzTNN0P8X1/mVJleav5PbMKsKFUBitthCHWFpbedT08ObYv597S0tb5BD0Qpm
         GNfZZDn54xpqkudhIynsRq52roiU62pl2CmBa+7a/9hbUJosgHduzU5PUcjA69LgfsKS
         9FsLrcQecxC3RoAvJtwSLXVzNSJJS/fg9PH/vwYqfAC13mISa9cPYhatlywxEwzfwSQu
         1UVA==
X-Gm-Message-State: AOAM532Z6pn3GioAABfKXb8jCBM6PV0xpg44Sk9n9ha8ECdOJVgycceM
        dpQo4jhCaElV5rS5SMyGNxO3kg==
X-Google-Smtp-Source: ABdhPJzfrOEs4jcEBk/X7yZSCi1Xor8RzKr7I+Yongyi7WT+ad48GTwwGNBes1mYrdoekHxHJbPTxg==
X-Received: by 2002:adf:f488:: with SMTP id l8mr4851884wro.123.1597133075746;
        Tue, 11 Aug 2020 01:04:35 -0700 (PDT)
Received: from dell ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id 31sm25413291wrj.94.2020.08.11.01.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 01:04:35 -0700 (PDT)
Date:   Tue, 11 Aug 2020 09:04:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com,
        alexander.h.duyck@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH V5 0/3] Intel Platform Monitoring Technology
Message-ID: <20200811080433.GI4411@dell>
References: <20200717190620.29821-1-david.e.box@linux.intel.com>
 <20200729213719.17795-1-david.e.box@linux.intel.com>
 <74c03fe9fea12f4b056bf694a0d03d5200244231.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74c03fe9fea12f4b056bf694a0d03d5200244231.camel@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 10 Aug 2020, David E. Box wrote:

> Friendly ping.

Don't do that.  Sending contentless pings is seldom helpful.

If you think your set has been dropped please just send a [RESEND].

This is probably worth doing anyway, since you've sent v2, v3, v4 and
now v5 has reply-tos of one another.  The thread has become quite
messy as a result.

Also please take the time to identify where we are with respect to the
current release cycle.  The merge-window is open presently.  Meaning
that most maintainers are busy, either sending out pull-requests or
ramping up for the next cycle (or just taking a quick breather).

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
