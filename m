Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1472314952
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 14:07:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFMHJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 08:07:09 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:32960 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfEFMHJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 08:07:09 -0400
Received: by mail-pf1-f196.google.com with SMTP id z28so6676733pfk.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2019 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=waxNHG1SbCkpZi4RlYtjyh1ffU1x2LY/7//9WagFlhY=;
        b=QO2aRTVYFFCzPSqW/NBkzztsMfm66EDftrT5ulwR4ReLcOK3khtwpPJOnBNK9rQERz
         Z5tLlcCL4Oc30D0anHA2KAXUm+DBpB4aDzp/GtD+bW964p/b1c2FGPtekVecAAiBEdZM
         wJIwVxfZQl14nNPzrrAv8iLN6Lg1yHwxINPxBMHbkVEkhMe/YguCZveJiDcUtDF9ystU
         PLmi7/OUrq0YvSSPmcpcxTLcFYsNwuQdk3KRBC80m9AE2hdeaVAEcI1SIoSX/n+oiuhU
         zP77V4jnIPvTvBIwTR4tn8t0SozAQO1HW4CGGNJh1N4JUa+3guiug4AqD6+nwLISXMR4
         96NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=waxNHG1SbCkpZi4RlYtjyh1ffU1x2LY/7//9WagFlhY=;
        b=rPM+QInZRMmWBEbAka5QS1Vb56nknwxO48FKm3V+DOe2QKoe16jwvX6CrLLiRBnC7A
         5o9ombsDT+an2TokNgMa81Cpea0V0gDdgHyPvtRiT7ttanypY65CE53k6rLW5z0kaM+b
         8IkY15NNQsvwgeMWid35FnUxDAhXlXpVf69cH+IVxJrnzqqubZJSazmorbjil1C+H13M
         SbW5dQw8cIGikt85DLqQsNVIiwom5gKwS/jLv2oRzNo2cTWDxfbaoI9kkTjnq/0r+JlX
         1Q+Zi6e3CzfZYeUM0p4F2nRbtINQZaG/2EhIo2nydYBQzIZV27VZ0R5Pngx/XwVaMVMu
         Iptg==
X-Gm-Message-State: APjAAAXquMRRp21ZuXjUCm9TTInxq1s0Gp/oGsMpPN42v9jRh3ifROXt
        siwCnhcB9zLmWDtE8DGae6SaNAIsW3tv9CyRoYkesOANePF9mA==
X-Google-Smtp-Source: APXvYqxrKBocXzYhCpu8xMRIuGP3Uihuc4HJDXPPAyvTCm4qbsTKRW2jcIuevl0jH5k+cQQK0OdH9vAuebDXwoR7CTg=
X-Received: by 2002:a63:dd58:: with SMTP id g24mr31155816pgj.161.1557144428458;
 Mon, 06 May 2019 05:07:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190318105823.2821-1-vadimp@mellanox.com> <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
 <AM6PR05MB522498F37724F8F82564BCF4A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <CAHp75Veq4Xq_faPKMkdEmOmY5JHMms=4KX51GdM20DFPH_BzTg@mail.gmail.com> <AM6PR05MB5224A49FD6ED666D0033BB28A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
In-Reply-To: <AM6PR05MB5224A49FD6ED666D0033BB28A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 May 2019 15:06:57 +0300
Message-ID: <CAHp75VdY9AD2tOirX7b57f55=RbHJPjnJS2bV3gG1xs4B8z2zA@mail.gmail.com>
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

On Mon, May 6, 2019 at 1:12 PM Vadim Pasternak <vadimp@mellanox.com> wrote:

> > > > I have added one patch on top, please, check if it's okay with you.

> > http://git.infradead.org/linux-platform-drivers-
> > x86.git/commit/771fb643f668527985addad2e40b4dc17bac9170

> I am not sure about this:
>         for (i = MLXPLAT_CPLD_WD_MAX_DEVS - 1; i >= 0 ; i--) {
> -               if (mlxplat_wd_data[i])
> -                       platform_device_unregister(priv->pdev_wd[i]);
> -       }
> +               platform_device_unregister(priv->pdev_wd[i]);
>
> For some systems we have only one watchdog instance:
> mlxplat_wd_data[0] = &mlxplat_mlxcpld_wd_set_type1[0];
> while for others two instances
>         for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
>                 mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
>
> So, in the first case we will have NULL for
> platform_device_unregister(priv->pdev_wd[1]);

The following commit adds an IS_ERR() check on top for long existing NULL check.
The latter is what you are trying to do and effectively means double
check for NULL.

commit 99fef587ff98894426d9bf1f5b7336345052d4b3
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Mon Dec 3 20:21:41 2018 +0200

   driver core: platform: Respect return code of platform_device_register_full()

-- 
With Best Regards,
Andy Shevchenko
