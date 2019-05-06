Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E975214973
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 14:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfEFMWM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 08:22:12 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40262 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfEFMWM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 08:22:12 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so6292190plr.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2019 05:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0rE2zEOna0BuglkOs0Y5vjq6lBXcDWMPN8hOKtKUZ7U=;
        b=UiREOpipIyvjHcjghwWCPE7tWJEKlCkZx9zwzJ+Lq00ykeEYcmX48U8kI4zl/kFXdc
         0Eh/TcnOituccbrFTvq/1/hrPcZaI0ANsg5kNGaPXg3YCCNkv7IJHf3wqm3Cj4HEOILu
         4q5RWh6R1LlVClu9lmXTbrBhBReqPvSIMliqG+MrI8WbydNyu3FOOT6vrnzT0+OMKZwF
         yBYBqhuk+SxGx2407cki736oOhTnchoguVEOW4TqDm1DNOvSQHp1u1egafMgYhYKFZZb
         3WsZPNfVARoIEhwT7QbWALOpeGrea8E1ELGUIkMSCOTSsAykiD++qdAmSsgp87dfkAue
         rSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0rE2zEOna0BuglkOs0Y5vjq6lBXcDWMPN8hOKtKUZ7U=;
        b=fP/+DAoOYbGx5Es4xI1fmzKoFZcnONvk4hgUSKFG1+/WjM+zwaOFyTrCgz2jDg8DF/
         eDWoFiZ/dNxTcAzj9gdcs/0ZBxhHYBNGonyYBj3yELejjfNLZo0RY1HJp21QBJhQMY8h
         DEfyPuusloYnS1jtJvMNfFlxUJS58cHAYOuPKOEpTDRqmjlh29+ZHGCmVPPIkKtYd8zu
         WkCSiWE8tCA+OJi+MlR4r1N2VbCSFqP0mvp0WafI5l8ff7wB3Q/67pBzIY5rJuhmBxBX
         z4kls55RNuIMqqXiCoELJFAEI6ca/VceCndplF/nTsyx0d1RjtDZIrJAvS1yk033B91h
         Wgjw==
X-Gm-Message-State: APjAAAV0gHguBPUYVqLqlYR2QaHD7UrLjKzEkcq9OSIzc52cJs8wkAAo
        aQREdNRCJGucOC48hL9Z1dQb0lQY+J5+UK/cpJE=
X-Google-Smtp-Source: APXvYqz7kjV/lZqM8dmhnxZFLoD+i+pgm/rlOoW9sUbxBPbzdAlkWMJ+3kcLnEPkXuqv/YZrLJQIi36dEidzX0vUnuA=
X-Received: by 2002:a17:902:7b8f:: with SMTP id w15mr31459294pll.314.1557145331776;
 Mon, 06 May 2019 05:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190318105823.2821-1-vadimp@mellanox.com> <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
 <AM6PR05MB522498F37724F8F82564BCF4A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <CAHp75Veq4Xq_faPKMkdEmOmY5JHMms=4KX51GdM20DFPH_BzTg@mail.gmail.com>
 <AM6PR05MB5224A49FD6ED666D0033BB28A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <CAHp75VdY9AD2tOirX7b57f55=RbHJPjnJS2bV3gG1xs4B8z2zA@mail.gmail.com> <AM6PR05MB52243E392EEA307176A75CCDA2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
In-Reply-To: <AM6PR05MB52243E392EEA307176A75CCDA2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 May 2019 15:22:00 +0300
Message-ID: <CAHp75VdmyEp_L16U6NHgHri4WJsfhVSx9KsVPXqSKxBz7PNQZQ@mail.gmail.com>
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

On Mon, May 6, 2019 at 3:12 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
> > On Mon, May 6, 2019 at 1:12 PM Vadim Pasternak <vadimp@mellanox.com>
> > wrote:
> >
> > > > > > I have added one patch on top, please, check if it's okay with you.
> >
> > > > http://git.infradead.org/linux-platform-drivers-
> > > > x86.git/commit/771fb643f668527985addad2e40b4dc17bac9170
> >
> > > I am not sure about this:
> > >         for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--) {
> > > -               if (mlxplat_wd_data[i])
> > > -                       platform_device_unregister(priv->pdev_wd[i]);
> > > -       }
> > > +               platform_device_unregister(priv->pdev_wd[i]);
> > >
> > > For some systems we have only one watchdog instance:
> > > mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0]; while for
> > > others two instances
> > >         for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
> > >                 mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
> > >
> > > So, in the first case we will have NULL for
> > > platform_device_unregister(priv->pdev_wd[1]);
> >
> > The following commit adds an IS_ERR() check on top for long existing NULL
> > check.
> > The latter is what you are trying to do and effectively means double check for
> > NULL.
> >
> > commit 99fef587ff98894426d9bf1f5b7336345052d4b3
> > Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Date:   Mon Dec 3 20:21:41 2018 +0200
> >
> >    driver core: platform: Respect return code of platform_device_register_full()
>
> O, yes, I see.
> So all is OK.

OK, I will fold it in.

-- 
With Best Regards,
Andy Shevchenko
