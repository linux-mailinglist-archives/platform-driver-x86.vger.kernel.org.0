Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C42A5AC6C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Jun 2019 18:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbfF2QFZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Jun 2019 12:05:25 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44410 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726837AbfF2QFZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Jun 2019 12:05:25 -0400
Received: by mail-pg1-f196.google.com with SMTP id n2so3938514pgp.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Jun 2019 09:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=iOdDxebyLm5nLTtoQ7ZLHPvBhyo6oT61HZ0uTWA/kY4=;
        b=e6/GaMKfZiosWrZNDWLaozr5/GqA9JIjt67d6LJzJzVfolkH8vEbEx3y5EZLpLw/4B
         PjejyvdyjhNhYndsgllyso7xQaA/Skg+8yXgMPoB28wUglQ9nTWLHewAha5X501Corsh
         KMZrwSOGoImsy/nNeVJOosqQUvEzbNuHMvaBJfqYbkSM4nGIqgnlrjelayfEA4cV0IoY
         HTgSVIuzz6dcaBj3GclHYvB2JNPfolijiLgUBCPXQKI6y02g2BViJ7gm696iAWb7g+ce
         h/04BvPotStS+ZgbtRLjZBymwBc5/MTeZZmNPMp7/2n+Np+6o61plPtiFLBfIthGZ0zA
         gcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=iOdDxebyLm5nLTtoQ7ZLHPvBhyo6oT61HZ0uTWA/kY4=;
        b=dT7aFdodG7fv+uGbDECa5fQZ+Wwioo7VDL/VXsajlJ3iCqjZ+JhSj1ccD1/YKWIGxR
         9d0uNYGH6dCz8qslhv9qqcts/RJHZhkDzQVu4qmhiXKd8lJ922T74B1upHPPr7ViFUfJ
         PJSs2EiQtteXUEmbjrmCHl3D/leNT+G0yhfmB6b+jyqq2xaT/z9V7N9+Cxf4GViIbymP
         H5MOD3w9sTeXD+kJriEkStKtizTfJdZ8xf141fFu4y/lUU+FNSD8tXW+Sbb+WU1NbVFB
         mI1Dz6dhELBxYAWhnBB6NNSNdAsjzoEF6inG7SOu74MZj9MnRdVDvYIZ2saKfGUWocrV
         RIYQ==
X-Gm-Message-State: APjAAAX0Li/wzdxx+8TNCoT1Q/Qu5PReeUnCuRd5llUutmEcEeVHX/XF
        GiV2CmKQgXjrh0sMLiz+Sjj8yhDPM5EGJSEMV0g=
X-Google-Smtp-Source: APXvYqw6yWKgMizhoIxWZUEdl1Alc6igiAi2a4+zJQQkR4rQIPOi/cyr5H6fODIA1tvf9832shL5unJeUfYWZddkc/w=
X-Received: by 2002:a63:c0e:: with SMTP id b14mr15136932pgl.4.1561824324862;
 Sat, 29 Jun 2019 09:05:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190623121630.17945-1-vadimp@mellanox.com> <20190623121630.17945-8-vadimp@mellanox.com>
 <CAHp75VfM59NHvKZyqKRzMwmKtM4EU4Ppv-A+UPBWybHH5OpVdg@mail.gmail.com> <AM6PR05MB5224710500839EFCA22D9908A2FF0@AM6PR05MB5224.eurprd05.prod.outlook.com>
In-Reply-To: <AM6PR05MB5224710500839EFCA22D9908A2FF0@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 Jun 2019 19:05:14 +0300
Message-ID: <CAHp75Vf-_siT3-t3r11d1uv8602jAZMuASpY8M=bOgF2VJ9CFw@mail.gmail.com>
Subject: Re: [PATCH v1 platform-next 7/7] Documentation/ABI: Fix duplicated
 attribute for mlxreg-io sysfs interfaces
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jun 29, 2019 at 6:37 PM Vadim Pasternak <vadimp@mellanox.com> wrote=
:
> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Saturday, June 29, 2019 5:20 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: Darren Hart <dvhart@infradead.org>; Platform Driver <platform-drive=
r-
> > x86@vger.kernel.org>
> > Subject: Re: [PATCH v1 platform-next 7/7] Documentation/ABI: Fix duplic=
ated
> > attribute for mlxreg-io sysfs interfaces
> >
> > On Sun, Jun 23, 2019 at 3:16 PM Vadim Pasternak <vadimp@mellanox.com>
> > wrote:
> > >
> > > Remove duplicated attribute =E2=80=98jtag_en=E2=80=99, add instead mi=
ssed attribute
> > > =E2=80=98cpld3_version=E2=80=99.
> > >
> >
> > This one doesn't apply.
>
> Hi Andy,
>
> I suppose this is because
> [PATCH] ABI: sysfs-driver-mlxreg-io: fix the what fields
> was not applied to for-next.
>
> Could it be applied before
> [PATCH v1 platform-next 7/7] Documentation/ABI: Fix duplicated attribute =
for mlxreg-io sysfs interfaces
>
> Or 7/7 just could be removed from the patchset, and I'll re-submit it
> after ' ABI: sysfs-driver-mlxreg-io: fix the what fields' will be in?

Second option sounds plausible.

--=20
With Best Regards,
Andy Shevchenko
