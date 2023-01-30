Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35663681E2C
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Jan 2023 23:35:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbjA3WfV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 30 Jan 2023 17:35:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbjA3WfU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 17:35:20 -0500
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909DC279AD
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 14:35:18 -0800 (PST)
Received: by mail-yb1-xb2e.google.com with SMTP id e15so15952949ybn.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 14:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jzhzJ9t+7joWmqNqB/SOlPs9Pb0rtxD3MhXTdTmhVQ4=;
        b=CmtyRf0pqKWKE9DIPlnm6Hj2IncPz5FCyh5FKr8NZq7zc14b/NVSdexEgzVP7+DEFN
         Glf+CkDY0YhQbBerBkvjF5EF0VH4VctdYCWT32S0mTFnmBzJSmUIDXwJnopDHuTJSO3z
         +9KSje4kZ6WJZljV6na2ZTdUA8ajbComDXgAkFxGWvR/0Q5qsKMXwbK19EXxEPWxS8Xc
         wN2TLu78GUhAIcIzbdHVgArXJWdOn6ZYzA4/Zr+8wWy939Z4VHeV/jojmgPbop4EIM4A
         wpgQwNa1n/S0fEPcXogjUvDI7Uc7q+LQz7nfRfEPavST6FQduFJrhGDZLZiW1POl1eVb
         mJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzhzJ9t+7joWmqNqB/SOlPs9Pb0rtxD3MhXTdTmhVQ4=;
        b=R/Q1puGLAvsXA1yrRZnV58zACwowobblAzfsGX0u6ET9NzorFeqy19XR90MXvDHA8j
         eEtx8qRnVjOgZOlN9mMTTawCprIQ9RFa+UKHIGYtj24pJzDuffFcHCXoI5LGiHwBZKTO
         7W7/DpmzB4vIJG4TSPhXk+hs7JmBQiTyRgiJDoo/OxpRtSDv7VPsB3J9dGSfVb5eCT4b
         WB/MX9uES5i6C2ShvnhehDqc0ZxXU54wKLdGDVr55a2lyTpFW0vW1bPsAR7PRicrIRc5
         5KhfAImvMbmZW6/MO0wbdNdaLJMhN1T/QVY5mzXNzpy6FyZab8Zc9MUsfBT/gaeBIwFh
         TJsw==
X-Gm-Message-State: AO0yUKV1R7DD8mwb/cK8m5fG3Ojbvl+YOXvT9hVs1dQGOFLjCNXtApw8
        kqYor0VZZqotcak0k5BlktJH5X+QqS6fBqYIJsKqoQ==
X-Google-Smtp-Source: AK7set9IzZZuZ5y/dwHHXS+Nc2RJfj+BVuCjSnwpeGsa5/FTy1GPw5TA3/6jKefac4EQHLv3R+KeSj5OUR6HGCCtiwA=
X-Received: by 2002:a5b:c1:0:b0:80b:c9d0:c676 with SMTP id d1-20020a5b00c1000000b0080bc9d0c676mr2182645ybp.341.1675118117810;
 Mon, 30 Jan 2023 14:35:17 -0800 (PST)
MIME-Version: 1.0
References: <20230127203729.10205-1-hdegoede@redhat.com> <20230127203729.10205-2-hdegoede@redhat.com>
 <Y9eZOmDAYW8lm/By@kekkonen.localdomain> <694b482c-5c67-2e9c-603a-e79bb4d7fd9a@redhat.com>
In-Reply-To: <694b482c-5c67-2e9c-603a-e79bb4d7fd9a@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 30 Jan 2023 23:35:06 +0100
Message-ID: <CACRpkdZefaSbT0SXZAkuyRwSFuc9FzOmfQ2eMxon0Z8reaGpFQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] media: v4l2-core: Make the v4l2-core code
 enable/disable the privacy LED if present
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org, hverkuil@xs4all.nl
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

On Mon, Jan 30, 2023 at 10:00 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 1/30/23 11:17, Sakari Ailus wrote:
> > Hi Hans,
> >
> > On Fri, Jan 27, 2023 at 09:37:25PM +0100, Hans de Goede wrote:
> >> Make v4l2_async_register_subdev_sensor() try to get a privacy LED
> >> associated with the sensor and extend the call_s_stream() wrapper to
> >> enable/disable the privacy LED if found.
> >>
> >> This makes the core handle privacy LED control, rather then having to
> >> duplicate this code in all the sensor drivers.
> >>
> >> Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >
> > Please wrap the lines over 80, unless there are tangible reasons to keep
> > them as-is.
> >
> > For this patch:
> >
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> >
> > On my behalf it can be merged via another tree, I don't expect conflicts.
> > Also cc Hans Verkuil.
>
> Thanks.
>
> I've merged the entire series into my pdx86/review-hans branch now:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> (with the lines in this patch shortened to 80 chars).
>
> Once the builders have had some time to play with this branch
> (and once I've run some tests to make sure the patches still
> work as expected) I will push to platform-drivers-x86/for-next .

Excellent progress with this Hans, thanks for investing so heavily
in getting this right after my initial complaints, the result is extremely
appealing an useful.

Yours,
Linus Walleij
