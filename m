Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5446C21C4B2
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Jul 2020 16:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgGKOpt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Jul 2020 10:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgGKOpt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Jul 2020 10:45:49 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 782D8C08C5DD
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 07:45:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ch3so3824386pjb.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8QnAOseuRy1NoeJX3CYqz9Svz+5dmkTBd6kjlT/UXTo=;
        b=oXFu2stLJiTVB6MdZvcHDfSYnL2Uv5r28W9Rc26h/nrJSqNHIZb25Dhne/sSAhE+cd
         8sRT2epLAPMjW0FNlDLM5eEilpCU45R8eIK1NejmQ+L0IYHqJ1grVz3onIdI2IwwbvkF
         x2l25XJdNfpw6ObDLrkiaVfttDidcEyrx/XSdanuwUHf8vtl2NtPeI4Uqcwn9tEn10yX
         wOxDIrhO+v0xq0FyhRg+q0AFyO55nFhzlpgtfxhFlmjEnGOCnHO376AROh7iNMzubG7n
         XCQxOQGjJS80Pc0FXbRqxNBIlo2RWQTHanO5HpeaMeZ9hgRGO3B8/ePw0tgTREn7d2sQ
         XgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8QnAOseuRy1NoeJX3CYqz9Svz+5dmkTBd6kjlT/UXTo=;
        b=DEinbmiVbpB8t99LNC2C3C5Aj/1oRxOvau4li3gq81VLzJ1M75F5Sr3wygMz00B6R1
         pGkW7YxPigend8Po4zLPMSsA5ikJK3UK0Djoui5JIm6jUcvohazjlRmOvw6efDPYOMIy
         zIv7HHwiqOtgQ6056NUot27JIfvelD6C02XenPqAAr1b98vQj3EmGbhN4fn6i9OaP1rD
         OfeB4ORjg4i7Zrho5ZKhskaSssZsYBSphB8h1VH228k3c7gloLzBwqG8EpEuffk4+Vf0
         eDebmH1sipRONH3TrdyIiktiWAjtcIo1oVtcabO+r17yyAxTjtUMPwVcLhUl57fxtRRk
         HDtA==
X-Gm-Message-State: AOAM5318eS8g8svx/2S5Sj97XSv6LhLnzEsNvrGg3Jt9LQ3A6GOs3VWU
        TfrnYjHiTgJ5qdogE7S8FUoYpmAlirIyEaUrd+Lac3OUx30=
X-Google-Smtp-Source: ABdhPJxmPV4fU+vAsE2JJIs18K5bcoXBTiuhCKCWKk9IGheSIxcz9y0qwYjSDRJoHNGBr6XMtCcth6Q/ChoOQpLtqJQ=
X-Received: by 2002:a17:90b:1b52:: with SMTP id nv18mr11511146pjb.129.1594478748835;
 Sat, 11 Jul 2020 07:45:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200711094321.6615-1-zappel@retarded.farm> <CAHp75Veq6Upg2-b0cNWamb9b5hB0zUznVoKcLaS7GLvipC5mGQ@mail.gmail.com>
 <CAHp75VeN20fyubCYqn68sXPydm-BZ3dXGDg+EPtwyoEnX9F2OA@mail.gmail.com> <221e54918b7b156c33243714bbb8f9fb99cb571d.camel@retarded.farm>
In-Reply-To: <221e54918b7b156c33243714bbb8f9fb99cb571d.camel@retarded.farm>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 11 Jul 2020 17:45:31 +0300
Message-ID: <CAHp75VfR21E-ZOttqb6hiYd=qx09noeFjyrc_scOsscOVwkHdQ@mail.gmail.com>
Subject: Re: [PATCH v3] Added device support for the new ASUS ROG Zephyrus G14
 (GA401I) and G15 (GA502I) series.
To:     Armas Spann <zappel@retarded.farm>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jul 11, 2020 at 4:44 PM Armas Spann <zappel@retarded.farm> wrote:
> Am Samstag, den 11.07.2020, 15:21 +0300 schrieb Andy Shevchenko:

...

> many thanks for accepting it even with not well formatted description.

You can check the result in my queue [1].

> I promise
> I'll respect all of your hints and tips for the next time I submit a patch.
>
> I'm very thankful for all your kind support and tips you gave me.

You're welcome and thanks for the contribution!


[1]: http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/review-andy

-- 
With Best Regards,
Andy Shevchenko
