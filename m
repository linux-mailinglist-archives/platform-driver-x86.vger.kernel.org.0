Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3602222EF3A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 16:14:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730568AbgG0OOi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 10:14:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729966AbgG0OOg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 10:14:36 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08158C0619D2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 07:14:36 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id k71so9430206pje.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 07:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nEcpWo9HPad9T8EgJDHM389ZFLJuqif8fu3LxNUGsOI=;
        b=N4EXh97kQMwK0v3Uk8/Oy4+EP31pjbIO6H2je6Nenpf5owbbx2Z/NYgr8/XYZ38FWs
         3mtkYzi0yzJkHWEDNSn1rrdS696nRy8DJY+ya5JFV+LUSLhPJNbw03DwgS+hPFGX0ave
         Cvp7CbhZ05mSVSdX239sP4KvH2IlLlr2DZNMYRjtxMGIVDAPZhsya00Ga8Mz4EDzdPsG
         b31CH8pAdTgm/wiT4WZb6rCAHEd69DUJvWlr1z1YHXiMDLIMa+ySxFwlLMU8DCQIWyp4
         Hz89sho6Syg3ef7tTTiBIoVb5RnOUILk9mqyKl/b4ajcnKIxMSB16MazJJgS/MBUaTdq
         +1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nEcpWo9HPad9T8EgJDHM389ZFLJuqif8fu3LxNUGsOI=;
        b=dAQYRmQmtWKjRA/Xkb5VuBBOgF7bfA/enuicRspXsO3r5QeODNidjKAcgLTFO0aVy7
         ddUBtUEJd/ogkd9WRDvum8qje/ZHuwYZxCq+Xd08m1sxpApsyAoRd0LNlpuRJdR5zQdT
         18hP2lIsqastDhXf0s9Nx/85zdgxjXykCHoELWXvcW8mfjdS1NuXi0qYlJPD3wihJB5X
         RRGMwd0/IrdayvT3465188zB1eG4516QwYalPOnkbvRYsL2IxgyaBCkora8cTrFbXoSl
         OOB5pUcGjFFm+ePL9mKJaFnU3BGNZYJ6cNJgsX2Iy2/2LxZQbOAhTL5b0/DZ750ISMd4
         9tJA==
X-Gm-Message-State: AOAM530Hht8S8gcF0wC9JVdW9W/Ev11nAFsdvcOb8LAtuzLiThKPVHVW
        rR9nPz+EKeYUN/kIeFuDnorZ7ku1/131qiijWfE=
X-Google-Smtp-Source: ABdhPJxWhA2sxHLNMUnmffu4diC1g8C+DJNS+p0g/w6+lUIGmk+eJnAVtex5A7gui49Z8rt2SNq+8UuTTRxabFoN3hc=
X-Received: by 2002:a17:90a:8985:: with SMTP id v5mr3468586pjn.181.1595859275612;
 Mon, 27 Jul 2020 07:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com>
 <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com>
 <CY28tpMZZdjz8B1hhBfutTgVSOQ_3WTvF2sXScGvbYxBsQI3ozKDDIzW6WFYoXoYljn0rXMqmjibx_8r_Zc4gzuZYqUVpfeHDHnmTQ6GeMA=@protonmail.com>
 <CAHp75VeZ4hEeHUe3E_UnYPLBCqF-PJwBVK3+2CG2J9qSJ4S0Ug@mail.gmail.com>
 <2FArDtricC8jlFcoJHfc05TW-HOn4s1wbI9nphTyia2_cUtV2bs3Qw0nC_DfM16GzZu6ulgKQdiNC1l_XEVa5q6PawEcxLWJWBX8aUkMwy0=@protonmail.com>
 <CAHp75VdKC_s05wK5Km1taYz4bnmbvaXN7RQx1Pb=ZLpVDxs7oA@mail.gmail.com> <mTeuxZuZTffYeTFv_zEQQVbAfRh80v9kYOiQNZ-VJapOJ5Abb4e4BPO2ge3JPwyGKZ4_ZFMNNpK0QQbDJvCTSRltVxA21lOB4gsPwvs4f8Y=@protonmail.com>
In-Reply-To: <mTeuxZuZTffYeTFv_zEQQVbAfRh80v9kYOiQNZ-VJapOJ5Abb4e4BPO2ge3JPwyGKZ4_ZFMNNpK0QQbDJvCTSRltVxA21lOB4gsPwvs4f8Y=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 17:14:20 +0300
Message-ID: <CAHp75VeOH-4DEp7uR+tY4kg5B6+B7HGvau=6DpTM8D6djWpwCQ@mail.gmail.com>
Subject: Re: platform/x86: status of thinkpad_acpi patch from January
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 27, 2020 at 4:49 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
> 2020. j=C3=BAlius 27., h=C3=A9tf=C5=91 12:41 keltez=C3=A9ssel, Andy Shevc=
henko =C3=ADrta:
> > On Sun, Jul 26, 2020 at 10:31 PM Barnab=C3=A1s P=C5=91cze wrote:

...

> > JFYI, I applied that series to my review and testing queue in ahope
> > that documentation will follow soon (from anybody, I don't care who).
> > It does not mean I'll propagate this w/o documentation to upstream.
> >
>
> That is entirely understandable. Thank you. I have written a section abou=
t these attributes in the mentioned file. What do you think the best way to=
 submit it would be? Should I submit is as a completely separate new patch =
or is it possible to "append" that it to the original?

Send as an independent patch. I will attach to the series.

--=20
With Best Regards,
Andy Shevchenko
