Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5132265057D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 19 Dec 2022 00:20:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbiLRXUa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Dec 2022 18:20:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230008AbiLRXU2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Dec 2022 18:20:28 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEC1126F3
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Dec 2022 15:20:26 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-1445ca00781so9751263fac.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Dec 2022 15:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wbAsaTImJVgmrVm658lQUrdfZSlK0Ns3idroAe7BrvU=;
        b=R+JYsSCD9k6WuKbYbMKI2oxfB77KlY0RbiSomelCRtsIaQcwmGgmqDq8puiimaOOJd
         8lAFXHeEzUsYRDzASFYYQgk92+ANIviDpXGJE57dT8BGie6QzBZIE1h+rFXaZyHxtQDo
         GXD6bdFTgusGWkA9ef5fxr7eUvitjFY5pTk9MTvLjgPMEP3I0Wis4SH5Kq+Eo6BI/sM1
         QE6nwBZ1c7Lu3cCpsky8/hyWJE9cMnzgSx70CcAj4V9QxLjnNEiH9kGzv6sLTynxo9ml
         x3pcSHVXENohzrkkLaPpIlfxKjm3SSOM6nvFEd6d4FTedgHYa91PhNcWy2yU8oNHvrHx
         /OHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wbAsaTImJVgmrVm658lQUrdfZSlK0Ns3idroAe7BrvU=;
        b=fq7dm1UWepl98oFqALaU9PZO55yC3c6eQKuf+pT6LyhDCip6GsB9NTNtxFjE5DtKxV
         xjX+VhqfPEXSrU0NIliZaSA5HKmRqpZ6/rgcNPTP4P5dbc9wOj3+j1rJSkkkVZwvYpol
         C8jSaOqHmozTBkwzXlxxg5UWXLlNOWtf9NPPTG+zVdFbTj3+YK+9uUx55qXQs9gODcRV
         JRF9xIYkBlaZoFBmcg6W1WBYa1iK+PKM54DDKtNktK42mZJ0nszJ4Ka4DdFSO9Y/xNal
         ek3qJ6hJPlA0f7iMJMFkfsNXe0OVr2uh9WNfr+XdR3X2YcdsZEDeEYfiEdLSdE53yX6Y
         /omA==
X-Gm-Message-State: AFqh2kobdw1pF5/i2+EjZ4/avTBdTboLvs+Beh4xpO/VmynSO5PcRcIg
        le/G+0CbV+HyyYu5aNDswDnBoNZBqoWnAAdSRbtoIw==
X-Google-Smtp-Source: AMrXdXtwOt8c7JBdmZzDOZAuTLq2KaUwZMFGracg7VgJqYzrRgSHx9x4f6NnRV5TJCc1e6dNNS0FrYAatPDL/+sBF9A=
X-Received: by 2002:a05:6870:b96:b0:14b:c9ab:66e9 with SMTP id
 lg22-20020a0568700b9600b0014bc9ab66e9mr925663oab.42.1671405626013; Sun, 18
 Dec 2022 15:20:26 -0800 (PST)
MIME-Version: 1.0
References: <20221216113013.126881-1-hdegoede@redhat.com> <20221216113013.126881-6-hdegoede@redhat.com>
In-Reply-To: <20221216113013.126881-6-hdegoede@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Dec 2022 00:20:11 +0100
Message-ID: <CACRpkdZKcVE5jJuG4D0CqzM=W6UtuVZwxcTr-hMaiuqVOWZx5Q@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] leds: led-class: Add generic [devm_]led_get()
To:     Hans de Goede <hdegoede@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>
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
        Andy Yeh <andy.yeh@intel.com>, Yao Hao <yao.hao@intel.com>,
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

On Fri, Dec 16, 2022 at 12:30 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Add a generic [devm_]led_get() method which can be used on both devicetree
> and non devicetree platforms to get a LED classdev associated with
> a specific function on a specific device, e.g. the privacy LED associated
> with a specific camera sensor.
>
> Note unlike of_led_get() this takes a string describing the function
> rather then an index. This is done because e.g. camera sensors might
> have a privacy LED, or a flash LED, or both and using an index
> approach leaves it unclear what the function of index 0 is if there is
> only 1 LED. The existing of support is extended to also support
> getting a LED by function-name using the standard devicetree pattern
> of adding a -names string array to map names to the indexes.
>
> For non devicetree platforms a lookup-table mechanism is added to
> allow the platform code to map specific LED class_dev-s to specific
> device,function combinations this way.
>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I see you need to iron out some details but the concept is
clean cut and this is exactly what we want to do.

I think it was Bjorn Andersson who pointed out to me years
and years ago "why can't we do that, like any other
resource?" and here it is.

Yours,
Linus Walleij
