Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3ED1C0B55
	for <lists+platform-driver-x86@lfdr.de>; Fri,  1 May 2020 02:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgEAAor (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 30 Apr 2020 20:44:47 -0400
Received: from sonic309-15.consmr.mail.bf2.yahoo.com ([74.6.129.125]:32838
        "EHLO sonic309-15.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726384AbgEAAor (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Apr 2020 20:44:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588293885; bh=wr6g5tSzUdYSDyxYn0jPKbdYG32ppRVk5x0hmGYPQk4=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=lknNC0IURoe8NHuJpBGpDYjo0XRh7AP1YQbz4EjTlNIptivk/HR2a48643czwseaXNcv3TADq6mA7szuUGj4FOZLsK/kSexBiSYpwtkrDwlLI+3d+u8+xVZmpjgU27MXwQ1FTYrC0Q10BLkaUCIMl/xTt8LKpUpPVF4YcOp8rV4ldvISx14dw2UJUxGbez3mov78BgvlUQRIAfORQLIIgpmE+p1lN8EG5eixY9zCi9R2l7c/QXIOarnb+0eGirBUtWoa+QzzejraCfuAqYjksZcSLt3iSM6ODg87Lc4qPSjNIRwPnZ+Dzhuo77JUxDJofuWR6E1XhtdAD5HODOiBAA==
X-YMail-OSG: HYrq.mEVM1lRBO9AZhEW126jfNVV6_gtNZnUUahRH.kJ5E24Kwu6Wvw5dUn_r7z
 BDSqC_5dyPWO4mGQAHZtRSWQj7qSZMJBljSJMN62CBk8mF1nk75QVFJ03UYNjiMcIrACV_s3l2Ay
 PtIu6Cv5sEUn.hxSS.oA_GVFKiOreKzK7RbiN4uiOIuAa5bmkumTuyLq5rWVB2BxtgHnG4Vmtxq.
 02IPxBWelQO1dPn8i_7Z1lsK.T9KC.uG1DxbvwsepQUC7FCyz3w_LbHKR6siDfdQwgUznLDLlrnL
 2F8iXBHdORmcETxzIJC8brYXEQXGdGKDtVoq4je_MmnUvZNcNWWOn9Mr0_jS7iRhJwIngXJSmbqq
 9g1kfwy5JHH31Gcu.8GMoPZGGamlfly6IwqVW2E_Gu.EYEQilBTPC37jZkQtUV0CVcXfat7EnYpj
 WMQcO2y37njwS58kPhQFtp1o9MXjye4muZzyBASFrjb8oxwxojK2H4Y84.CIXaFB37TxorOOutH1
 ljFmVxj95BtjH1E4jpeCo0EtoYbZjL04LzuGjkSrr0KdUNj8ylgl_gotwrKAVxb0A7WhmiQGOs4b
 AIJ1Exbky9A4zjqHjo2wfQIH2jOxD3wLVtqOkSWpeOosCmQxCoceqoFpWNC39CZbcmrRgh0mU.py
 bQ4DT5EPrPxriZvuJRqQPHVDvYy0T2JtdUIPyHF1jJtKwYwFHhoAyxssK.9l2xZAR_os.h5HkrV0
 Ooy2KvcUPrVpjAG8nANTBvrC_Z.w.hX8hv9YS63QBGV4VR5eMlVdPRdx_.RpLHKjJjltn0AcB4TR
 7woRgaaCc5grJKtfAQ_mi23nOjjydoScMijo7Wa9KXBO3UR09YrUv_VOExNR6P4XEYPG8Xusrb41
 pLYkhZUcObuqKdIFVLYSYKLdSTdP6AQwPkOk_Unjixhs.e.T6FbpriZMj02kvUXEwPdmGDGrwkGq
 ITCFFsmbt7IyJqF5AI46QuHph8KsKMqJp.RzVrfe9ie69rXjQ5XVN.rbDcrfJ.mfdQccDHSo0UjJ
 c9QJOcGrzjVL954cr24Sn20DYYAQFWycVAKxZ51drCzMZF_3zwePCl2Wx89nmVfFp1XiBjWVK55Q
 6A6FXG4Eut7g4nqRA4fPsJNkaLEj5NCXMCdWdKchZ_FiRIEuJp7X4016vmSZxS08tyiX0aQekKz8
 3CXa0axEHcQUggiiRX9wBPMKHj.OgzjLOEbdzZ75TBJzIfVxsMXJ6tSNKIDGtvrfM4KIaTgW3QZo
 ixK2qcZ8CfT2fXHVyCXjcwdPJ7d0kdVmmQFEEHzHMbM2w.5aK9Ty5YTpPWw_cDm34_BngnN5FJgs
 VLqalGbntFodX2Bl_qh9W.iNINw0STQFkHaky01d.SYY-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Fri, 1 May 2020 00:44:45 +0000
Date:   Fri, 1 May 2020 00:44:44 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     Stefan Assmann <sassmann@kpanic.de>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     Dario Messina <nanodario@gmail.com>, civic9 <civic9@gmail.com>,
        agk@godking.net, kjslag@gmail.com, bastidoerner@gmail.com,
        ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br,
        platform-driver-x86@vger.kernel.org, arc@osknowledge.org
Message-ID: <576380549.116107.1588293884555@mail.yahoo.com>
In-Reply-To: <20200430214041.GA28186@khazad-dum.debian.net>
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org> <11041815.WYjWQN8m1R@lenovodario> <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com> <1605997626.1278142.1588119634625@mail.yahoo.com> <91feeffa-1f48-347a-fb90-7bf733647476@kpanic.de> <20200430214041.GA28186@khazad-dum.debian.net>
Subject: Re: [ibm-acpi-devel] [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15820 YMailNorrin Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Thanks for looking.

Agreed.

This changes leaves /proc/acpi/ibm/fan entirely untouched (and actually beh=
ave as expected). That's by design.

> 1. Use the "hwmon" sysfs interface to expose each fan separately, and
> control them separately.
>
> 1a. it is quite acceptable to control them in group by default, and have
> a module parameter to select grouped, or separate behavior.

Agree as well. I would add, though, that that would need a more involved re=
factor,
since there would be two different ways to control the fans now.

> Also, "fail-safe" for this is to have the two fans on automatic, and to
> enable both fans.

I thought I hadn't touched that part. Lemme double check.

> [...] later improve on the patch to
> expose the second fan separately (provided safe group behavior is
> maintained, see above).

Yep.

-- Lars


On Thursday, April 30, 2020, 2:40:57 PM PDT, Henrique de Moraes Holschuh <h=
mh@hmh.eng.br> wrote:=20





On Wed, 29 Apr 2020, Stefan Assmann wrote:

> On 29.04.20 02:20, larsh@apache.org wrote:
> > Do you have a use case for that behavior?
> >=20
> > The previous patch broke the /proc interface, didn't not work with the =
current version of thinkfan
> > (but a a version with multi-fan support is in the works), and it had ha=
rd to track internal mutable state.
> >=20
> > The proposed change is clean on all these fronts.
> >=20
> > I'm not a fan of surprising the user with unnecessarily complex behavio=
r (but perhaps this can be added as an option in the future.)
>=20
> I concur to keep the patch as is. Any additional functionality could be
> added later on, if deemed necessary.


Yes, but let's avoid changing exposed APIs as much as possible...

Anyway, the correct interface *when exposing both fans* is:

1. Use the "hwmon" sysfs interface to expose each fan separately, and
control them separately.

1a. it is quite acceptable to control them in group by default, and have
a module parameter to select grouped, or separate behavior.

2. /proc/acpi/ibm/fan shall control both of them at the same time, and
report data from the first fan.=C2=A0 THIS INTERFACE IS FROZEN, LET'S NOT
MESS WITH IT.

Also, "fail-safe" for this is to have the two fans on automatic, and to
enable both fans.

All of that said, *it is very much acceptable* to merge a first set of
patches that controls both fans simultaneously and exposes the fan group
as if it were just the main fan, and later improve on the patch to
expose the second fan separately (provided safe group behavior is
maintained, see above).

--=20
=C2=A0 Henrique Holschuh

