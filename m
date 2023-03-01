Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297F16A6AD5
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 Mar 2023 11:32:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCAKcD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 1 Mar 2023 05:32:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229801AbjCAKbw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Mar 2023 05:31:52 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 354C23BD82
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Mar 2023 02:31:48 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id n8so4121880qkp.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Mar 2023 02:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtCwD0W8+uiMLoUMB8P2nIA3H3/59gsuL/1Izs/shYE=;
        b=J7dMIRVmdrXvGiD4wwY7xgoVk23SZoyj9WhBC4SbFn+YSiGhgjIIAWqM9vVW1WkSYb
         rRu87m0j7jvtqaMMO2KeLc1VRO3YLDEnjyJk7JeS2wfDrD7G4pUl1hWBqAVl58pN2b4L
         jkbTeZHDFPVf5CYpohmh1iPjj7CcExmZ2tmMFFxkZcYs9qb7Pa82UbjWzQ8FDAGKmGX5
         IVwcv7GcHLUwSKN4f/loHZRlCoapfy7SH+sgyWsQ8z23SdwtRlfciWpV77Rll+LkQHo2
         zpqD+a/QZu/khY3D9fwjrn6CrvRwv1gr78BEYd/CXtaT+V/Dltg/1tgGDETk1vidCbVC
         5m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtCwD0W8+uiMLoUMB8P2nIA3H3/59gsuL/1Izs/shYE=;
        b=RiGGv5sMTj6fULVZpoUNYKrzeNhuvfwHZiCz9n86VphupjKcYvWskMxedAm8HolDt7
         hl+ZePSLCVA3N1t2g0BemJDxvah4gBgxiM8Ki4RxPQ43HDTOChXlhff9y0ao7XBPorhL
         d+RDbZCKLp4rwinaHCzdI9xDpujVZ5xGikhsvVE50KjQWukSEWipJCRHigPbclFzLOya
         +dtASJxCjFCEHUylBNYTorC5Vga/tuowz9B61jm5gZQgBKX7BV/el04BQmU6lKYu9rqI
         2E2B8z+VsJqg/x0mh84AhlZKIdOE1IA0kt9eF1XihaM0Htd8JxscIS9PJy3vVGdBMX24
         ZlVw==
X-Gm-Message-State: AO0yUKW0akwF943ZHeDgQphkK6RX4e6N00ZAkEqddZGSCppPulf7FPzz
        As+7so9zRX4b40zebh9wa5IZD0ptQBtnx/XYZC/q1RYu8o1i2w==
X-Google-Smtp-Source: AK7set+NTDYSotKtYH7UXwLHhl7FfJLmUWjluhXDPs1t2LDLQUbtT5TZPKsvpZ2b7g/N0Qep9S5UmQzZMX0JFZWt1Eg=
X-Received: by 2002:a05:620a:21db:b0:742:c2be:3934 with SMTP id
 h27-20020a05620a21db00b00742c2be3934mr1158886qka.10.1677666707320; Wed, 01
 Mar 2023 02:31:47 -0800 (PST)
MIME-Version: 1.0
References: <20230301092331.7038-1-hdegoede@redhat.com> <20230301092331.7038-6-hdegoede@redhat.com>
In-Reply-To: <20230301092331.7038-6-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 1 Mar 2023 12:31:11 +0200
Message-ID: <CAHp75Vf2b0M2orKaixe-G1KA98ec67GQnhLb-01_U2Lj4yzyzQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/14] platform/x86: x86-android-tablets: Move shared
 power-supply fw-nodes to a separate file
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
> Move the shared power-supply fw-nodes and related files to
> a new separate shared-psy-info.c file.

...

> +#include <linux/kernel.h>

Hmm... What's for?

--=20
With Best Regards,
Andy Shevchenko
