Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20433E4FE6
	for <lists+platform-driver-x86@lfdr.de>; Fri, 25 Oct 2019 17:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440601AbfJYPPD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 25 Oct 2019 11:15:03 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:34786 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440582AbfJYPPD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Oct 2019 11:15:03 -0400
Received: by mail-pl1-f196.google.com with SMTP id k7so1402402pll.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2019 08:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OvjkcFtfCEdqWQrcnruJzj2UwHg1E7XfB3n76sw/AQU=;
        b=qobRyMKxgMCHYqZLMbHZGmo+SxOBYKXhrDvtx8GRQV0uZdolYKPJalarOcPO0o0U/y
         tNsv44Zg/gduL627ELf9QCPSOTnBd04ZmC3SUFFI4oIf22q8RNna1GFegTNNyO+b4HSw
         ywt/waYvRDL8dzMMdCyn5VFCajTROjTZCjtwHaxFTVDeVedPiqqERfowxu7a8Pexr4VI
         H387yU49zHdcIHGHKt3jh5V5P6n5lOQwDhT84IUiA+FxizsucfpIIBAMYchxSPb0w+xq
         J0l3Tg/TU3GROPQRc5T9l8FKxom8PXYaQU9AGio+twt+O9Bni04iOoXg4UXcn51eMIhG
         /qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OvjkcFtfCEdqWQrcnruJzj2UwHg1E7XfB3n76sw/AQU=;
        b=WUHGmPELkn11j9dbeunODUjjyxqFZRnAJgnpxHtnpERXmVERUc9BKdaav7BlWrutVk
         PQ5cQs70xp/BgoigIDNxAJalFKxAvN4XGmUimgtAv0NgQjpyWE9K841HXcB0X2yGS/KY
         x76k0nSWz6+xQEHecsGTXBMJ/yFhk1fC7xjVMpi/kpTRHAD36bJb3Ac8Cf88YqLv/bbZ
         zv3JZKYFOf2b/KLyTawUvsXIUAUKjZunipqmux1hjZFCUMNI9mvtB2q0FPvQSQVGnO0o
         LkwHmFy/Ax98XyU8KUQO4C6SP7G5c7a09TbfxTDaKmtHPcUQpWFjhcO3YwDZVjowSm8J
         THSw==
X-Gm-Message-State: APjAAAVxqblXdPmSz6xZqlkn1Q1Ih1T37T2JKc21MwSU5E1pVXdY6/f9
        dj93gJairEFIXWMGZ4ShxgQh/gmcmdpXAOkm13Y=
X-Google-Smtp-Source: APXvYqwN1sDnM3ZUS7iRp0nT577+Aefwp3GaT7MX7n40vKz4c+vNWEjkf5r9p5FHsAWhs8nJPfh6peSoGH9oVI3YuBE=
X-Received: by 2002:a17:902:b90c:: with SMTP id bf12mr4367234plb.262.1572016502423;
 Fri, 25 Oct 2019 08:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75VdMZMxGJpmi6wQMa8FJdzpkPq7nA=kFf4pUSrskrTtFeA@mail.gmail.com>
 <20190822114833.29885-1-alex@alexanderweb.de> <20191025113330.6wmi5lcm7mzlkl5a@pali>
In-Reply-To: <20191025113330.6wmi5lcm7mzlkl5a@pali>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 25 Oct 2019 18:14:51 +0300
Message-ID: <CAHp75VeTQ_nxTH14k8DDO+_STK-JTq=O1dhrNr4pURCgw0nQNA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.
To:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc:     Alexander Schremmer <alex@alexanderweb.de>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Oct 25, 2019 at 2:33 PM Pali Roh=C3=A1r <pali.rohar@gmail.com> wrot=
e:
> On Thursday 22 August 2019 13:48:33 Alexander Schremmer wrote:
> > This feature is found optionally in T480s, T490, T490s.
> >
> > The feature is called lcdshadow and visible via
> > /proc/acpi/ibm/lcdshadow.
> >
> > The ACPI methods \_SB.PCI0.LPCB.EC.HKEY.{GSSS,SSSS,TSSS,CSSS} are
> > available in these machines. They get, set, toggle or change the state
> > apparently.
> >
> > The patch was tested on a 5.0 series kernel on a T480s.

> > +     echo '0' >/proc/acpi/ibm/lcdshadow
> > +     echo '1' >/proc/acpi/ibm/lcdshadow

> Hello! Is not the whole /proc/apci/ibm API for new things obsoleted or de=
precated?
> And should not rather it use platform driver in /sys/ (class?) namespace?

There is an ongoing discussion about API to this kind of devices
somewhere in GPU mailing lists.
This interface is custom and probably shall never have been appeared.
However no-one prevented this from happening.

--=20
With Best Regards,
Andy Shevchenko
