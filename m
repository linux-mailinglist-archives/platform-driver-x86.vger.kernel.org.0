Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26524674E11
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Jan 2023 08:26:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjATH0k (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Jan 2023 02:26:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbjATH0k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Jan 2023 02:26:40 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1638E79E9F
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:26:37 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id 129so1651430ybb.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Jan 2023 23:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKJaxvtTjPfAUQKjyv0Dh0FxjLU7AllNMH1ZL3QINOE=;
        b=zt+C0oJLcX3SV8Rzd3+u8PY6Jabgt7zWTxw2fLWm6XkgfByCqP8gK0r5F6Hdfsfr96
         Xp2kTy0jsoo5nyrpahlVMLW/mXtHhCl/1vVq1fjTS/o29JFIjhl98njIB+Obkp8xXmYx
         s89i/TG+Wl08fxuu9btg0Aozzjyr0qIOBUqWgSuG0ReNKgiDPbSXmu7ZWYrm40IQtVrq
         F+/qTdId/bUwjMHvlVhMjDW2zaA19/bSj65g4CLj4/nizqmYfyzDx15l/KQP2eaOGJ5p
         JttgCmYdt+UXcuiWJT1qdgM6qFO1TvU2PiUedCRLL4Xgun/cPWml3PbPKU0fSxf58g1K
         gWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKJaxvtTjPfAUQKjyv0Dh0FxjLU7AllNMH1ZL3QINOE=;
        b=Cz+KvFUyeo9T69kQoBIw2sg3yEU4AixoRAWw9BIALbjd+COxORZyrpyGBn8fwDQnvV
         YimKFYtfeD70E6OR4NZfE/76k8kf1OCsy42ULJjsh4yLyV+u9n0bz9VLs3rE2U/UaQre
         Ipmbm0fHVaA/pNW72rgE9KvlKleleahf9Fz19hTEDS48CGLEdzEotG3WRPGX4f9kwxYT
         voHwDLRodem3ZVSMBFDixoqk736IFJtGBDUZxqlFLA2txWQWpzUu4eADwpHVGZ1J2xRB
         RpodP8t9bMSsaTGJqRsnhKqcbdWLPe9L6XJs3BbglMXPGw5vkfnaiMALDYa9yT+iByBf
         dbRg==
X-Gm-Message-State: AFqh2kr+/CSc/1/xT5VAl6a5oS/LczqQTZWEVDbMR/MDChtc9SfNrZox
        Uz43PzspC/RwXXX+6ePN2mVXJ7KWv4zbB34MuQ2Nfw==
X-Google-Smtp-Source: AMrXdXsWUZf61zZ3Sje4n0ZzWNDGzvcGmcZnQOre7zbrltwQCWC1do2h7sTf4nsI9gGQYrBhv76ro084wfzi+RAyynU=
X-Received: by 2002:a25:8746:0:b0:70b:87d5:4a73 with SMTP id
 e6-20020a258746000000b0070b87d54a73mr1225459ybn.584.1674199596316; Thu, 19
 Jan 2023 23:26:36 -0800 (PST)
MIME-Version: 1.0
References: <20230119130053.111344-1-hdegoede@redhat.com> <20230119130053.111344-5-hdegoede@redhat.com>
In-Reply-To: <20230119130053.111344-5-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 20 Jan 2023 08:26:25 +0100
Message-ID: <CACRpkdYuHmAwYR24xEz01ub1_mMhqYN65WuoLHCS=094b6AM2w@mail.gmail.com>
Subject: Re: [PATCH v4 04/11] leds: led-class: Add generic [devm_]led_get()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Lee Jones <lee@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jan 19, 2023 at 2:01 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Add a generic [devm_]led_get() method which can be used on both devicetree
> and non devicetree platforms to get a LED classdev associated with
> a specific function on a specific device, e.g. the privacy LED associated
> with a specific camera sensor.
>
> Note unlike of_led_get() this takes a string describing the function
> rather then an index. This is done because e.g. camera sensors might
> have a privacy LED, or a flash LED, or both and using an index
> approach leaves it unclear what the function of index 0 is if there is
> only 1 LED.
>
> This uses a lookup-table mechanism for non devicetree platforms.
> This allows the platform code to map specific LED class_dev-s to a specific
> device,function combinations this way.
>
> For devicetree platforms getting the LED by function-name could be made
> to work using the standard devicetree pattern of adding a -names string
> array to map names to the indexes.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v4:
> - Split out support for led_get() devicetree name-based lookup support
>   into a separate RFC patch as there currently are no user for this
> - Use kstrdup_const() / kfree_const() for the led_name

This is how I would implement it so:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
