Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39F5B6B2BBE
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Mar 2023 18:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjCIRMf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Mar 2023 12:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbjCIRLx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 12:11:53 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 640D940EF
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 09:09:15 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so4110689wms.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 09:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678381754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o5wND0fd1Z3rtFlrd7Cp/13ujKlgxha1tgzRC1bLZd4=;
        b=uGmFYUzHnNV3C5TNGAUoIaJQkGsd+hWv3ltwc5E3iMzQxTOyaZIwafzulKKhGhg/Bs
         qmslhKXYxaCciZUC8wbskC/jJ3sU1kRiHuO3GJmQlMDaOtS367exmWToQEq9dqpA8um0
         tB+9/0v2yXHBgej67DrmtQqX2S5Yb/e1XYMNmBu986bX7DNDrrwb2pO0J8kHpU3UT3d+
         70jACtOeLfxuu+Njr7RPLEep8Wie+pZYjexDyOa14kcsG2mf2eX1cgppsY3MeVfN4o0Q
         CE56MNmtF6uKzuf8Jbmn8zPQIgyRVHRx0E9vX1r+c6tRmZatSQCqvAff5gs+6HWi8kX3
         JgQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678381754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5wND0fd1Z3rtFlrd7Cp/13ujKlgxha1tgzRC1bLZd4=;
        b=d6Oi+3Mo09SLysrX1xQ7FHk97k+eHj+nsKjuGHPrnnE9prGdOh5Xz3OIOL4QyfgL9O
         18wQyR79QueywGjjOGMD8sCWwjqY06nj52/HWNks6KFgetu0Fa6LGV8aSs0eR+ghkJt0
         heRpkwmkOCE3doXFpXgbXSaLsajFYIB0kpfMcpzIx4skJWR6RIwWldNSzuIZ8rSMsCr6
         CELEpr7w/sI/taEjs/CUsMts7QCwCMScdDJNOzEZtCR2IHcYbi1Wyv1LkHEZ5NG861SS
         RrLHcQ1okQRD1z1stWP91sQoFln9t+hnOp6d27Hx+AetStPNhZDmWhTdzhnfhYBNyMLz
         JwNQ==
X-Gm-Message-State: AO0yUKVTJa1jkReGosWhFTPZNdVm1zLAHmr8tV7YcKSwSYTNTRMWYUEl
        MaU5mrnwb66DxBjLZwN9DZ5IAw==
X-Google-Smtp-Source: AK7set8MMBZWwqPrZ6maUN532SudklucvR9ks2z0HcQ0YATPkl1I3mXhCbwZmTdnQxXEaG1Fv/9dyA==
X-Received: by 2002:a05:600c:3c87:b0:3eb:39e2:9157 with SMTP id bg7-20020a05600c3c8700b003eb39e29157mr21582110wmb.22.1678381753784;
        Thu, 09 Mar 2023 09:09:13 -0800 (PST)
Received: from aspen.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id n5-20020a05600c294500b003e2232d0960sm403152wmd.23.2023.03.09.09.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 09:09:13 -0800 (PST)
Date:   Thu, 9 Mar 2023 17:09:11 +0000
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Lee Jones <lee@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Aditya Garg <gargaditya08@live.com>,
        platform-driver-x86@vger.kernel.org,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] backlight: apple_bl: Use acpi_video_get_backlight_type()
Message-ID: <20230309170911.GC96419@aspen.lan>
References: <20230307120540.389920-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307120540.389920-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Mar 07, 2023 at 01:05:40PM +0100, Hans de Goede wrote:
> On some MacBooks both the apple_bl and the apple-gmux backlight drivers
> may be able to export a /sys/class/backlight device.
>
> To avoid having 2 backlight devices for one LCD panel until now
> the apple-gmux driver has been calling apple_bl_unregister() to move
> the apple_bl backlight device out of the way when it loads.
>
> Similar problems exist on other x86 laptops and all backlight drivers
> which may be used on x86 laptops have moved to using
> acpi_video_get_backlight_type() to determine whether they should load
> or not.
>
> Switch apple_bl to this model too, so that it is consistent with all
> the other x86 backlight drivers.
> [snip]
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

but...

> ---
> A note to the backlight class / subsystem maintainers, this change
> applies on top of a similar patch for drivers/platform/x86/apple-gmux.c
> which makes that driver use acpi_video_get_backlight_type(). See:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>
> I believe it is easiest to also merge this patch through
> the platform-drivers-x86 tree, may I please have your Ack for this ?
> ---

... please don't treat above as an ack. Lee Jones will hopefully be
along shortly to discuss that!


Daniel.
