Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A16EA73D843
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Jun 2023 09:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjFZHOG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 26 Jun 2023 03:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229488AbjFZHOF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Jun 2023 03:14:05 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDCD1AB
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Jun 2023 00:14:04 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-40097b0a124so16353111cf.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Jun 2023 00:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687763643; x=1690355643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RUSGWbCXntBTkO9sHXbN7XbI0NcyxewHoKY9x8+FCk8=;
        b=JQ3i5hlcNNawUt+qj1ljvA9FJ0Im+H88QY9lY05bsjAfE2q4m3iA7PEHWrmPaE1svp
         eIXan4f1hjUYaqBfHrgo4b/wXDBjcNxZTM3uFou/50/XKrjQc6Inmjw1nzFW4EZ6eR9n
         jIvNa++eL6AecOt5OvPJxesVDzGww348vywSvZ5jMMLFg3LzAERssj6kgf4VTV+L2dhm
         onXiThYPyPJdNNVINgulXcAniCGeB1+R7105zc2ZzfXRKs5635n/aiRQSWXIUMd8Bs6f
         GIbHcXqO1TFlvRR/aA9hjo/J1DsELauFYWTF2zKiEJqFJYAZEoTkC+TuZi9LAq/Axly0
         ccPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687763643; x=1690355643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RUSGWbCXntBTkO9sHXbN7XbI0NcyxewHoKY9x8+FCk8=;
        b=HK5AQlO1iS5oBNF4KvvwJGVlOZzhX6kt2kEBorP1vi/ip79VzUJU5UDSn3cuRc6ref
         HSY2MYKkKHz4RB4k7XCqdz8A86bRH8Dn0VSEMu0bj784981fME7dxfpj/BQRIkplRf1l
         cfJuu82HUatTSHgnH+vyltzdTJwMmZ1ukDj4lJN9MQWGDZLLmKsm5bz6nuX1AvD9EwXX
         cCruRJYbEgopG3fFXoFZWk39UUvKl/0uY1f+zIgF0WkYt2lsEbAOQ1JJuDmviNPUpShe
         TEaf8W85h56T/7FNSSxsuhCJd+z8oypkWqnqBj9VM3yB6xYBw/x3j5PZjxzolRxZfUiC
         gLgw==
X-Gm-Message-State: AC+VfDy11lrVtsCdgJ3Ati4uQQI1TbIS2c0B1WpStbg6DFP/hln0PcKz
        af61dtakrWNlELaeCoHaJlU4vd3Gn8QWezW18KO/Fw==
X-Google-Smtp-Source: ACHHUZ4kyVjT45z1qW52OYC5r21iJ5DWdiLHWlP21TQ+BkuBeujtoRUUWblnmXCOaleIiMVQenOTn9I5XN2vy1AbFm0=
X-Received: by 2002:a05:622a:104c:b0:3f0:b4ee:6f4c with SMTP id
 f12-20020a05622a104c00b003f0b4ee6f4cmr35747340qte.41.1687763643515; Mon, 26
 Jun 2023 00:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230625162817.100397-1-krzysztof.kozlowski@linaro.org> <20230625162817.100397-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230625162817.100397-2-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 26 Jun 2023 09:13:51 +0200
Message-ID: <CACRpkdZ5U4XA40j4MoMpp11mcrPf-NU+c35TPmk064w0xdk7Dw@mail.gmail.com>
Subject: Re: [PATCH v4 01/24] Input: gpio_keys_polled - Simplify with dev_err_probe()
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Bastien Nocera <hadess@hadess.net>,
        Sangwon Jee <jeesw@melfas.com>,
        Eugen Hristev <eugen.hristev@collabora.com>,
        =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jun 25, 2023 at 6:28=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
