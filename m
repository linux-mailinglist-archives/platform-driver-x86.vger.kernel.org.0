Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E4FC5641546
	for <lists+platform-driver-x86@lfdr.de>; Sat,  3 Dec 2022 10:32:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229491AbiLCJcZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 3 Dec 2022 04:32:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiLCJcZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 3 Dec 2022 04:32:25 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93D3560B55
        for <platform-driver-x86@vger.kernel.org>; Sat,  3 Dec 2022 01:32:24 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id y135so4217898yby.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 03 Dec 2022 01:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CFoQXYNeS9wF4oT5nBeIPMKXaVwzG/ED82y/xu+vnsw=;
        b=slo28opSp0nQmljzjNo3fzzcUrBR+AdtseXASuvVfVPgZDivhU7myF7Kyi1nqecl1C
         diet7NyumZZ7pezYVZr62kNbt+pQ22V1wl6sYdRphNUVY1fisBmz0VireNnulY0kmZ/i
         wht22c79lxHlhLU6FsT624hXH6UMJo3Wpn9HvExBNkUgO9SOnAojRM0Q7QTY3NnQq0HR
         eSLdnmjb3PnElxQ4SzGTZ3Sel1b0l3rCj1C+50AfKDiXH/9cI1Ti7qYiM130HT6eHxIF
         U/jjLNwu87laD2WEeamsd/+pM/qrBvsHUT2xTS+EPS8IDCZT4I/3ML7HMul7A0bsW8ZK
         fziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFoQXYNeS9wF4oT5nBeIPMKXaVwzG/ED82y/xu+vnsw=;
        b=By4f6swROirfUbe4o36MBoXc4vmVjWN8fHmqZQHsWIHcasFxdf9qc1v6hiiyQEJter
         Xne4Qu47flaHoVJtJ/d3sRWfGtOFx/J8Ixos8JDQEjZKvgU64Yn1e+4Wdef0vUt1hndu
         avpVH5iRvtChX3JPF1aYSRa5ZY/jUtk5PcM21S3Ubvd7CT8N/6lHrO4E495cT5p1o/1/
         GHI1WaBfhhZSlPIQSdpQam0U0zh81do6N5XKvRUh70EPDuZlS4onJOQS8KaWAhnC/lTL
         j2gdKtztNxu94SKJEMtWaOOllYky5auh1Hh6IE1u4BCP80erWpCaGOM4kPPnRWadASb3
         6scw==
X-Gm-Message-State: ANoB5plJ57/18nhTVkg9ls9KcL+x9/w5PSPinhXEaCoNC1WGYBQ9eh7E
        Ql1jju++Ilc2CZhsnjyi++0JCLWeiJwMbLWfnizQYQ==
X-Google-Smtp-Source: AA0mqf4CMp8P8c2WiNAHtuEug5+RAJadVJ/AFCF0WGJxrLlJjlOiAQyO4Y18qvMGHqy0PrKxndMyKB+D3p6DE7Re5OE=
X-Received: by 2002:a25:c485:0:b0:6be:8e8d:639f with SMTP id
 u127-20020a25c485000000b006be8e8d639fmr67403156ybf.506.1670059943733; Sat, 03
 Dec 2022 01:32:23 -0800 (PST)
MIME-Version: 1.0
References: <20221128214408.165726-1-hdegoede@redhat.com>
In-Reply-To: <20221128214408.165726-1-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 3 Dec 2022 10:32:12 +0100
Message-ID: <CACRpkda+3e6jLq4WkyiCFcvL_rO1tAf_TvO5B9kikkii+6vSnA@mail.gmail.com>
Subject: Re: [PATCH 0/5] gpio/media/int3472: Add support for tps68470
 privacy-LED output
To:     Hans de Goede <hdegoede@redhat.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Nov 28, 2022 at 10:44 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Patches 1-2: 2 small bugfixes to the gpio-tps68470 code

Good, please merge this.

> Patch3:      Add support for the indicator LED outputs on the tps68470 as GPIOs
> Patch4:      Add support for a privacy LED to the ov8865 sensor driver
> Patch5:      Add gpio-lookup table entry for the privacy LED.

OK so I have to call out the hippo in the room:

these "gpios" are not called "gpios" anywhere else than in this
patch. General purpose input/output, remember. These are special
purpose LED control registers.

So can you provide a good explanation why these registers aren't
handled in the drivers/led subsystem instead?

IIUC the leds subsystem has gained support for leds as resources.

I don't mind a LED driver inside of the GPIO driver if that is what
it takes as a compromise, just that it should be handled by the right
subsystem.

Given that flash leds which are used by cameras are already in
drivers/leds/flash this should be no different and there will be more
cameras with these privacy leds.

Yours,
Linus Walleij
