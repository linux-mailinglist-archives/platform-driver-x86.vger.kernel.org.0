Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE676A6AAD
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 Mar 2023 11:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjCAKRo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 1 Mar 2023 05:17:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjCAKRn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:17:43 -0500
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4A243346A
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:17:40 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id bk39so3528436qkb.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OUonpYAeRoCp/BRJjLirw2zYKz0xCgbhbCd93Eycrg=;
        b=Jsdhl6ciHG2j4YBE+OdsZVNryYDCpNQ1k4NCF8NioyG0mawLR6CPRjtsbNUXPg6Wox
         WWdULWHx1pGjWtcfiJZr3qlvIH7OQwxBtkOJUoIybFu2eywkhm73b8beNkpg547eGoCF
         nfamlwwR/gNAKzzWfY4LUgIwPjZSROz+Ee1RYHTmKFi2ZGjLS/jpXQzo4pQWPkAOS5tC
         OJON3j/S1LdXjPs14NVi/zrYRD8DskEVzzdBrvAl4qUiXffTSIJV3GVTygD5Epg+g3vg
         R/1yYgNcls25sV1eOF6WINLrB9zKaY4SVXBBgEhAr8v3QTsGlqnUEz8PpNQOBEDSSXuj
         CJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OUonpYAeRoCp/BRJjLirw2zYKz0xCgbhbCd93Eycrg=;
        b=fJ7Q1fpgpRsKXRr0mxjmX5Wwr/dXgOSh0ci+8cpH0qZqnXpRTUKqDhxMUbG97YOhvJ
         4n/KjYSx1xe13qwQIvcm1bzI0Z1jiI8bBzvqJMlSq/MUSdVTB/vE7tnZmzSJBBF2ve9j
         GhuVqQKXWRRq+i56EP7qcWavspIbUfzhOZiZJsT1nH7B1zX1+luReYIoMwTLFrSYTszO
         MmBOW809Htqq3M4hGK8w3cN3CtHUX0n5uF8EiJ4rqTSN/k5n4WTixfjq6vOlfWFIEIU+
         TvHw+S8qUIp26ffS0SngaoWp3VThHg+uRsX3Rn5Xv2oekilAvAdZ3ASj9sTZWUCFw1e6
         TidQ==
X-Gm-Message-State: AO0yUKUA+BgSrRucTWUjmAhJYJb7zV3+Yhy2YHNI5pc+pH47ofxaygVM
        YCL5CKU6W2+SxAiRMd48vHRIQnae9QbIR0DPceKOWUWBRKukow==
X-Google-Smtp-Source: AK7set8JNhNidkpq6DLhJ3k/mUnsMF7FBhb7DWFH1ilLBYokdCWiBL4xj49khnUbBo+Jcmpb6sP+f4fZdQ0EG0GXJ1k=
X-Received: by 2002:a05:620a:1e9:b0:742:7e5a:4cee with SMTP id
 x9-20020a05620a01e900b007427e5a4ceemr1451514qkn.10.1677665859588; Wed, 01 Mar
 2023 02:17:39 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com> <20230301092331.7038-4-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-4-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:17:03 +0200
Message-ID: <CAHp75Ve0Mc+ZkSQsqZfgWJuFTaAeB2Y9dw0BdSrojFy+_t6C2g@mail.gmail.com>
Subject: Re: [PATCH v2 03/14] platform/x86: x86-android-tablets: Move core
 code into new core.c file
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Mar 1, 2023 at 11:23=E2=80=AFAM Hans de Goede <hdegoede@redhat.com>=
 wrote:
>
> Move the helpers to get irqs + gpios as well as the core code for

IRQs
GPIOs

> instantiating all the devices missing from ACPI into a new core.c file.

...

> +       for (i =3D 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
> +               gpiod_remove_lookup_table(gpiod_lookup_tables[i]);

Do we have an API to remove a bunch of tables at once?

...

> +       gpiod_lookup_tables =3D dev_info->gpiod_lookup_tables;
> +       for (i =3D 0; gpiod_lookup_tables && gpiod_lookup_tables[i]; i++)
> +               gpiod_add_lookup_table(gpiod_lookup_tables[i]);

This seems like open coded gpiod_add_lookup_tables().

--=20
With Best Regards,
Andy Shevchenko
