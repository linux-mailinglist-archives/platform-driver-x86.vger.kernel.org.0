Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B75D7255C8D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Aug 2020 16:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727937AbgH1OcX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Aug 2020 10:32:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgH1OcQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Aug 2020 10:32:16 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983A2C061233
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 07:32:15 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id i10so1569858ljn.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 07:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wVomXPK0U4YnUe61pOa0mrtN3m3F0A/CetmINqj4FvQ=;
        b=IXeEjsjDMU8OHqYlJ0p8rDf4WgvfOfbeZYG1fmksYO7VBPareOmDTBDBpJfLu2f4Mo
         oc5Qx/kRjst3CdFtvOjdIsdvwAPlR01NAKq2ZLg9Cf9Jcr/yk4fT6QHA2POLXvJjElqK
         4rlzpaVgAadANBaLSYZqeuj1JdC/A2vnjVb+5nOK8cQN0Sptd2OUBdZK8CHIYtGh+PWj
         aWYjoQQuUTLUwr2wTHzH8etMU6LEC6XUu414lYInENZPAWDAWJtSMHLUvvwCiBxYDI5L
         +mJHbZIhZBpuwqrxyq0MBlWEdp+B+UtBmlAR7AAdUpkOXyQTTgO5odt6FNXZhOLQMs1A
         +Xzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wVomXPK0U4YnUe61pOa0mrtN3m3F0A/CetmINqj4FvQ=;
        b=GuEywN8sen71sE/04u9VysayEL8us7GgFaZG2anN6q9bSfpkiV9TtnVTCyWSNFvH0Q
         qgbpcFcDMWIufIQfSgdlhTZwaD6LN98U9l2HgteGH8CR7LjsAe6Dksyb1ZcsU85cw1CL
         lSssPW8o+KBT5Vhi4LB5WXKfBkQKkL4CjkMsyd9S5A2gRlgbKYMmNSF4WNA1eAzibqHd
         wUt05biARSUQ5lUDiwfYHQvz7GSVSDPWKLUvjnn+BFi+HbuTbm+kCyoa+0HWhGviNB5M
         zxwdKFrX6dywGv+BcghnDUMTsHM74QH2Aq/m5u+73mJii7huvVlT96mi5YRvSuYt+zIA
         9GnQ==
X-Gm-Message-State: AOAM531hbSLsFQ1CHBM3FSCAZaJgsm+6aqhmMth77RbtByA0gQq4wHId
        OzxwWg7rb7+hOg0jZPRb8UyUyXPaKSc7hsQdWc5bCA==
X-Google-Smtp-Source: ABdhPJxyQbKAxlRRRvc2vRtyWbyMbMoH5z28IQ9c6tGUgZBDV3PTLB/tba5Nu2XqbmrEWhyYyf5fprRmxxYMiT4YEWI=
X-Received: by 2002:a2e:4e09:: with SMTP id c9mr1062954ljb.283.1598625133997;
 Fri, 28 Aug 2020 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-27-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-27-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:32:03 +0200
Message-ID: <CACRpkdZQZ+ANpMmwFUbTxQ9=EZEXZkr7Z3DLbica=Q09bmntBQ@mail.gmail.com>
Subject: Re: [PATCH v3 26/27] Input: bu21013_ts - Use local 'client->dev'
 variable in probe()
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@microchip.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Input <linux-input@vger.kernel.org>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 27, 2020 at 9:00 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> 'dev' is shorter and simpler than '&client->dev' and in few cases it
> allows to skip line wrapping. Probe function uses '&client->dev' a lot,
> so this improves readability slightly.
>
> Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
