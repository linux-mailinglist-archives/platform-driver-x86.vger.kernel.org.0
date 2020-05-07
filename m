Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF4221C97C5
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 19:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgEGR3I (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 13:29:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727904AbgEGR3H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 13:29:07 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9625AC05BD0A
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 10:29:07 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id 19so1319729ioz.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 10:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dowhile0-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cP718RVg7L+b48OY8HXdXUf2TciQmTVFFfxyH6ExEMw=;
        b=v3eS0aDK/Kak3SSpVNSZLNGCqXfJdtyMP0f03t1qdm77HiEC1S/42kAkWcI7WYOB4c
         MsdDs41+ZMoJvut9IAF/Ggz7tr8RzxBmElLFqx7npn1U6SU9+LoX3okTLzsb+YHb+Gfh
         3OQb9QCHeE0HeJrEqqMwpSSy3m95Wv1uYt8wPRIUxHoG7AkU0jB6MSBK15j+4yxfdvx+
         HTlPUjoIUSdK5JToJwh/7yH8nWbCOzS09BCwjl97k0etzVpxSHuR4jfhbZSbyqoNeYDE
         KWDvjrcDuXxleWUwLAQrRnQBo3/dZ9TSE6CLTD38yaau16ia41kknpxsyG/A1sA07JCO
         TMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cP718RVg7L+b48OY8HXdXUf2TciQmTVFFfxyH6ExEMw=;
        b=P03Crd+0GZwe18Rc0GWkz7pfCbXOTRo0TVEaWiysTXMBS9T6kzTvUamoCk5AuHV3mn
         g8KlHDABsc09wXqjIa+JearHVgQnaqRGYI3b4jy2vAV4Z8x2/1pt5017zSsYM0z/Tgp2
         iXkWjY2PboznLGyqOzM1819kottuQWuFG2euO6vnLlQ38nwW0sNVTsAjdxe/x858CQX2
         lTr2zIUwdfDkeWzZoY8LgNFW2ciTjedDrpoihP2f3mLGdCpiuoWUGiK8qGZPCMc92cc3
         ozVv6+gjdOTenb7kFoT8G/2LEeH3F4G4EUQsEJghNggo4CujmV2KxCjmGARaf/WU07Og
         3kog==
X-Gm-Message-State: AGi0PuZBiE/+ozWdxe+ggaKTIyzomyxiYft6aL+YzFCwMO9T0xmtFmC1
        /5Tp3v+V/c1aVpDL1tN0+FrKPyxtKEhhPyDlpIl0vA==
X-Google-Smtp-Source: APiQypJ6rH0TMifwwCjf030A68itXswdJuSWMjE36qthX9IBLI8dVl5bssoqsQ3xPKmIB1c32pwweubYnpQ/SB0o30s=
X-Received: by 2002:a02:c98b:: with SMTP id b11mr14791550jap.117.1588872546853;
 Thu, 07 May 2020 10:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <18e48255d68a1408b3e3152780f0e789df540059.camel@gmail.com>
 <CABxcv=kTL_grDUL00c_e2jyPD4hTtFS8Jze6pQBEz_arR6TPVA@mail.gmail.com> <CAHp75VfuKJXz1QO45gDcu1YL_jJy2oz4==zVgsT+2GoLkkm7zQ@mail.gmail.com>
In-Reply-To: <CAHp75VfuKJXz1QO45gDcu1YL_jJy2oz4==zVgsT+2GoLkkm7zQ@mail.gmail.com>
From:   Javier Martinez Canillas <javier@dowhile0.org>
Date:   Thu, 7 May 2020 19:28:55 +0200
Message-ID: <CABxcv=mz560QHEKMtf8PYH2pstScSm=5tZZg-9FOuDB5=CuXuw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Export LPC attributes for the system SPI chip
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Richard Hughes <hughsient@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, May 7, 2020 at 7:22 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, May 7, 2020 at 8:06 PM Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
> > On Wed, May 6, 2020 at 5:52 PM Richard Hughes <hughsient@gmail.com> wrote:
>
> > I wonder if these new entries should be documented in
> > Documentation/ABI/. Or maybe that's not a requirement for securityfs?
>
> ABI must be documented. There is no exceptions.
>

Thanks for the clarification. That's what I thought but wasn't sure.

Best regards,
Javier
