Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE0382A83BD
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Nov 2020 17:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731196AbgKEQn0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Nov 2020 11:43:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731120AbgKEQnX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Nov 2020 11:43:23 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 457B6C0613CF
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Nov 2020 08:43:23 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id w11so1039474pll.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Nov 2020 08:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nXosHPqdPbZPHIIKRHgm1ADUi75AFHTRe1ZO7Acczhc=;
        b=hh7nuNW1Ek56PZMxufO8jOyxGO83x0E9fCZu0aVCx02BRiX2d1tZpi1/vpfqQajOLH
         Ulpz4riPd/HZGETPmZjIy0tjUzMsrlsFTyXb6fl0tLHWAH6U4toY0kINsHq+IrYX+wsP
         MquaScnumhLkwog0VoB9insN8rwS457Por5Kg/CsAEuO6Ekz8xiwOTQ7C3U4zqWtdzn/
         InP4qgMFAHT8/tcLFqaIuQJ2D7+1Sb3OD34eq+k0NV098GKc2jmNZ/YbZIwg7SW9GOi6
         5NgF+I4e0Ce+RbPsuVS0jfNoaaSeoOvl8sKAHxJqcqJUqhZeEZuy25QgjtYmDR5kMzou
         bO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nXosHPqdPbZPHIIKRHgm1ADUi75AFHTRe1ZO7Acczhc=;
        b=cZms/pTO38GcCxkt1vrdVBx/gsfFhvgb8cEibts8VAgRcepzkU/9QYZtwmAF4ydNuE
         kIBamB6TOKnQcJti8z7Ps2TV5wPdT9TIXgVicmfUH7ywkRC6KppSHrlFR3gifYYS75/S
         ShGFjzHj70ZtuTH3ewfQFyCy8biGSmXUY0gDWZhxSpTINKwg5RfUzQDLkrKvjzMgefw9
         OPhG+SpQxGhxsU2sYh5a3EMcgE0PN+NAIIjfS69KpVZqjq3KA99NIZKMkvpRE7AGtgmi
         ojjWhQrimjjsZaB15F+5J/qJtPgPfkUro88+nGkV9mvKlWShPH7ZEBwyEbZGQPcQFNfc
         9wWA==
X-Gm-Message-State: AOAM530421/azrH0nPCTBA//s5agD6f/ZXsmOP8jH9k+kfapDK9R8s8V
        r/E5GSdL/o2xu3d35V0tqkh+ODZy6LNFyReDg5Y=
X-Google-Smtp-Source: ABdhPJzMmAGzgpcqlPItW5/p/6eZiMR1wrGkrIkUEyt66BQOE9bPeHajd/VzumOuujam1YxdEoe5/LcHUOhly46zi/4=
X-Received: by 2002:a17:90b:1107:: with SMTP id gi7mr3180834pjb.181.1604594602731;
 Thu, 05 Nov 2020 08:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20170904082110.30925-1-corentin.chary@gmail.com> <20171021064102.15166-1-corentin.chary@gmail.com>
In-Reply-To: <20171021064102.15166-1-corentin.chary@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Nov 2020 18:44:11 +0200
Message-ID: <CAHp75VeJyXHZZ=ZeYQtbica1QC-=xZEaqWFv1KSvnJ=1UXTvGg@mail.gmail.com>
Subject: Re: [PATCH] drivers/x86: add thinkpad-wmi
To:     Corentin Chary <corentin.chary@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Just a heads up. Hans and Mark took maintenance for PDx86 and they may
look at this contribution.

It seems full discussion is available [1] on lore. So, I removed the
rest of the message.

[1]: https://lore.kernel.org/lkml/20170904082110.30925-1-corentin.chary@gmail.com/

On Sat, Oct 21, 2017 at 9:41 AM Corentin Chary <corentin.chary@gmail.com> wrote:
>
> This driver has been available on
> https://github.com/iksaif/thinkpad-wmi for
> a few year and is already deployed on large
> fleets of thinkpad laptops.
>
> The WMI interface is documented here:
> http://download.lenovo.com/ibmdl/pub/pc/pccbbs/thinkcentre_pdf/hrdeploy_en.pdf
>
> It mostly focused on changing BIOS/Firmware settings.

-- 
With Best Regards,
Andy Shevchenko
