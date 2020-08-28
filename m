Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDDD2255C76
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Aug 2020 16:30:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgH1OaL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Aug 2020 10:30:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgH1O37 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Aug 2020 10:29:59 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 751A8C061233
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 07:29:58 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id g6so1516749ljn.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 07:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QhL6kVPpf//E0eP09dB94FXNl/JWUcmK3etmXLgf2zA=;
        b=a5gkz55Ly8Ww7NOlesFahUpnsLDsAtIzYfNIYdjbFDIwxHQQn93XjqkA6aaDchNV/g
         chy2qTGRhmm/RRyS5JnIZmtatijKaYve2HNKMM476P7B/SFeZWfY3CP0ykeaxrrH7IeV
         6vP3dW+4W6P72ZHX0ycMjZGMm8wVVk0k0xUvlaZmPmTNTPRWSAs6wL8jl88pCCCnzRen
         fYGztnrARiL9jvY1mDDN9E6+IpIOWuqRBB2wEx9CXkwy5Bj/m0sfRbrsFEYTj+ypnbfn
         UE14SI2cp6Z3Voi+XA6tcej3ScRJpoHZYT4jlOkb9u+ypdrUlLTPy8Wa1ACm6fVFMdGC
         Z/kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QhL6kVPpf//E0eP09dB94FXNl/JWUcmK3etmXLgf2zA=;
        b=KRxc5PxHrs2bfzosXo4UTdwKwMuDg14ir+dHx8LIJK5zxMPk/aCN2bBBfTRYAy0XGx
         HVb9ZkkaMyqBvKkWMdbWYleJ3ucF2y4E7hxYE40w384L952sh4P910M0skXp8FWr5buC
         cPNNefw+qwPn0yyJMlLwyF90vfXIDTFvpmo2pAV4DQ33MGO6pxu9FjB44PLvZ0SeBQoC
         k+KWRRVNCXcc+GsubsgJlHU71K3YVuI8r8LFImKTmSH4BY4iNzlKECNm/RT3OoZiANad
         CJFjzF0fpfWC4FJsaWg85Yp4u+/ANXBJzc/Oq4HijcEWImIrPcjs2e7UxemEPx1+xyx3
         /M1w==
X-Gm-Message-State: AOAM532Or34o9Jpqn/qWjzTOgD0J6VVTFl3zkdH2fdD5eB0GnEYHt6zo
        gmnWDRKNQFaTOVh0AtmHBOO5Ncou7qCHkbpqXj8tvg==
X-Google-Smtp-Source: ABdhPJxjSjwJMtLbZ73ue0D0jAiJz5PbaM9GY+WsI5Jf6eFad3tgUj3G3NcoClAPI011Qv/S53/oUnLmGtQnG6qHvMg=
X-Received: by 2002:a2e:558:: with SMTP id 85mr1048525ljf.293.1598624996774;
 Fri, 28 Aug 2020 07:29:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200827185829.30096-1-krzk@kernel.org> <20200827185829.30096-8-krzk@kernel.org>
In-Reply-To: <20200827185829.30096-8-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 28 Aug 2020 16:29:45 +0200
Message-ID: <CACRpkdb-AfyD-E2yT5PEBw-GsteLw9HK9JLiZajixNBJUquR3g@mail.gmail.com>
Subject: Re: [PATCH v3 07/27] Input: bu21013_ts - Simplify with dev_err_probe()
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

On Thu, Aug 27, 2020 at 8:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
