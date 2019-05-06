Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2467147EB
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 11:58:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbfEFJ6l (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 05:58:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41417 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726362AbfEFJ62 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 05:58:28 -0400
Received: by mail-pf1-f193.google.com with SMTP id l132so1530333pfc.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2019 02:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GGez++6AUymZi4RUFnUNzhcNXxDNv93kYM0UEmIZmF4=;
        b=IKURC7izvHBxGDBcHCa25/J5raVBV6RNomhvUgeZ7qtgwfRFw7AgSev8K9ebCV6hHS
         HfPefH2boi264Sc5CaIyTMGc8Wtt6DBxliU4dW+dJGAEosKFvibC0aN1qbg00mzG9CDE
         cIdxSqkWzVr9FPYaHPTmJrL3+5HpTCdG/A1jQvosEgcLlnOmd/cqGwPmXOs+I4XI60RL
         mdcIKZ20XXBLGC0OpXh/HZ6gjaWwoDXihx2Y6aPiWUdC9GuJWouc+ZbVhaBTUhDiYmZ0
         FjJL8LgeteOo5HRNOP1sEkOvJdpDxxqWqD3lVX70eJm/jxNvdbFgxLap0U4CZzO6O0kx
         2MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GGez++6AUymZi4RUFnUNzhcNXxDNv93kYM0UEmIZmF4=;
        b=hVdH2DkFX1+HzAHQrF8kjg5BMrckHiMr4aTdSuJ2xHWOkxP4smQxFzcfcjhn2FhppE
         rnlgOjiNAPF4Hb6aaVFUbUu0+x46hufLdt22fdQY/UBXtJQLNtEhOUEelXDLbQcsjc29
         779TuulK4leRyjVQGgDagVtQ5ZCJ+1DkXQ/+j2/RF2VS35iTTITTGZ0JobHIuX+NIw49
         32Svzny3eTafOxXCnusN85em25LpR15sIJFN/dNax5CE9PMZL5pzfjcXsEfUfvwuDD9r
         XHlkpRU++/5ACpA4ZPPItEaNokX3v03XwXHymPbN2bWx6sW1oX9uo8BHEC5L5SclLh2S
         g4Ag==
X-Gm-Message-State: APjAAAV9vfbTTJpwtavSgBAUYo7423PQCf2KG2C8Ko7KbQZlqtaX3c6M
        zFpV+dhAazH8Pd3Q2WagXB5PTNq1/kx7PQexCTDVvtCdx+6SRg==
X-Google-Smtp-Source: APXvYqzOw6GMudOWT8RvpCaEPhAaNbqx/X4RopBCXqNHpJXXykMOJpxXEoSIDZQezC9W00kaj88RLvwx+6A7GtUn5Vk=
X-Received: by 2002:a63:42:: with SMTP id 63mr31043834pga.337.1557136707630;
 Mon, 06 May 2019 02:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190318105823.2821-1-vadimp@mellanox.com> <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
 <AM6PR05MB522498F37724F8F82564BCF4A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
In-Reply-To: <AM6PR05MB522498F37724F8F82564BCF4A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 May 2019 12:58:17 +0300
Message-ID: <CAHp75Veq4Xq_faPKMkdEmOmY5JHMms=4KX51GdM20DFPH_BzTg@mail.gmail.com>
Subject: Re: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new features
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "michealsh@mellanox.com" <michealsh@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 6, 2019 at 12:50 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Monday, May 06, 2019 12:36 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: Darren Hart <dvhart@infradead.org>; Platform Driver <platform-driver-
> > x86@vger.kernel.org>; michealsh@mellanox.com
> > Subject: Re: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new
> > features
> >
> > On Mon, Mar 18, 2019 at 12:58 PM Vadim Pasternak <vadimp@mellanox.com>
> > wrote:
> > >
> > > This patchset:
> > > - Adds support for tachometer speed capability register.
> > > - Adds support for Mellanox watchdog driver activation.
> > >
> >
> > Pushed to my review and testing queue, thanks!
> >
> > I have added one patch on top, please, check if it's okay with you.
>
> Hi Andy,
>
> Thanks.
>
> You mean on top of patch
> "platform/mellanox: Add TmFifo driver for Mellanox BlueField Soc" ?
>

I meant that I would like to amend your patch, see this fixup:
http://git.infradead.org/linux-platform-drivers-x86.git/commit/771fb643f668527985addad2e40b4dc17bac9170

> If yes, it's OK with me.
>
> Thanks,
> Vadim
>
> >
> > > Vadim Pasternak (2):
> > >   platform/x86: mlx-platform: Add support for tachometer speed register
> > >   platform/x86: mlx-platform: Add mlx-wdt platform driver activation
> > >
> > >  drivers/platform/x86/mlx-platform.c | 232
> > +++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 230 insertions(+), 2 deletions(-)
> > >
> > > --
> > > 2.11.0
> > >
> >
> >
> > --
> > With Best Regards,
> > Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
