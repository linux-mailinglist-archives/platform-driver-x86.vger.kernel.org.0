Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 165921BD0F7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Apr 2020 02:21:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgD2AVV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Apr 2020 20:21:21 -0400
Received: from sonic307-3.consmr.mail.bf2.yahoo.com ([74.6.134.42]:45428 "EHLO
        sonic307-3.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726181AbgD2AVV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Apr 2020 20:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588119679; bh=czbPP9wK60svJF75lJYdePfWz0nSqkwPwDIqm2Zhd04=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=s509FFfYgd6fXE3wloFTiT85XKSJXmaZFa2ledd5MAiTMVgk1dInKpml5s+ROJ/pW363IrTn8Rpy5NjnM/q6Sp8uKfUyWFqvZIGvIvFEKMKPPKxg6PURJrefGulq1jVkDDpq9qQqlZqtoklTARiflRFlH45LjmI9bONi0F5C4e3I8Dt/VmPeHy9exiSmxaaBY1t4JyaBxIKhsCcph4xdiy8fiJfpwtycC/V++3R9epKWHL8T0V3wIzheygygTO5mkK89bhq0bB6ShFQlnvFjPPb9kpUN5Hng3cw3R7zBAKpf91WlrexYE1nTk/VB9oEsy2fhNaRfaxI/QaIUGDYJNA==
X-YMail-OSG: 9QTfb1MVM1m0NzWBjrlHJxwU_TecbM4r9i.u1yxXFGJt9VnhdoelFdqCnd7YcBA
 s2vfL2HDLEQz8wjL8z1HdDmOtPbNE8XsyyCObYASfnwg.a4fEihdEpTXD8JIWQTXus2qNlNYinio
 30vOU7ryONv.FcJLf8IOIlgk6g.hT.9OqmjmOUzzdvZiIx8ByTOFkdkvpTbNdA3dXhTNFdMUN.po
 GzgkVCnTS5oMglHb.Wrjb5dLufXgtdsOsH6NcDd4dDax.Pq7kw13tVEliysHoi1yNkYP.9eneAc3
 GXBITTmtfs.cLAw6tLB_PdCLuz9Ruh74OJj1dG7YF5.D9JWmVSBFMkVC8huMyrz4i7mp4wBStKVd
 8wykh0Gd.N1h67p1AaXSKc.Bu4Ko2BS08ilwoFem13SZ1ye83TX3Oh.Ww9Up4j3YPwRB3esl.GSZ
 3_aZFVpUHvgmWNkKqhvNOdtI5k2aPjstp68QoielB9vHzeTItQkrfvjQeU5tQbfaXMPpMxFZWiHQ
 WQyeeJHfhMg9A3i.O_qlOOvfbANGuTP7zBT.fjbGQEBH70oRjhfrIG1rPohIyb9XRrI4Uut339jt
 cutPIU2M_fjYPdfwCjBTYWo_HHfNYYymTPl5w4nmgrz4cIIcYvFgsmGYK9g429jO9I5RYp3FanII
 CSFM2iF36R5fneOonTQlrL9KGBkZ8T0B2hrMTBQQNrATiLwDd4B0YqeAmsEk8HEhDS1DBlqSWqkh
 toub4V.0lcA.QFowaB5kSeElydu7lLIYfSeC5W9wE9c6wbsrZ2BxuHLNnAzQ6xL0FXMDox2kqWVg
 aIwrttfXO_nFZnTxgfd9bcBGUdxbsRo.tJJswlOdcaSpSpY3TfR1.Xh.JjVM6MYsWFUK4fqD8tYR
 t2Y52TPvsffcwnnmqdAwHdEt32TBO5Gu47CAP0QxIFgl.x.hTn14anfAVKemzN6WusHW_rlUcbF6
 Ft.XWo.Qax5n2bQm01wVqrhSztZ8W.GaKKKiuDCmx88GvM4I_a53LEH043vG3musK4W0zMdZLSLp
 440miidIrp1CtFtUf9oD2JytDbDZ5HFNoLnjxQTh_EK6OQGaPnsERJ5b4_F.ADwmMXn5RceT5gBi
 BjCiOXGiMWi.UlnQuL5ZqGPO9geqydUWSLlmQDikjyIMS1F2o3K_oXDGunDEAEWlsTHyO4mb.4li
 YfLB4FlaDS8PmI6u0g_N0Jnb8etZdfNKEyVnuczLrHVrYWRd4xYG7FHWjE1LBtgChMj6ztd03Mf_
 d7ImKGpzmkEyqKYoOzpetuIVn_nrg6fBXW_._LqoyCjSkuNF.3phKVqA_MiTTI6bthYdwOrjvtu_
 8YRHrhA_rTbUe.z4YlrtAqsokPYYcre_KLZGxXv8-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.bf2.yahoo.com with HTTP; Wed, 29 Apr 2020 00:21:19 +0000
Date:   Wed, 29 Apr 2020 00:20:34 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     Dario Messina <nanodario@gmail.com>, civic9 <civic9@gmail.com>
Cc:     agk@godking.net, kjslag@gmail.com, bastidoerner@gmail.com,
        ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br,
        platform-driver-x86@vger.kernel.org, sassmann@kpanic.de,
        arc@osknowledge.org
Message-ID: <1605997626.1278142.1588119634625@mail.yahoo.com>
In-Reply-To: <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com>
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org> <11041815.WYjWQN8m1R@lenovodario> <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Do you have a use case for that behavior?

The previous patch broke the /proc interface, didn't not work with the curr=
ent version of thinkfan
(but a a version with multi-fan support is in the works), and it had hard t=
o track internal mutable state.

The proposed change is clean on all these fronts.

I'm not a fan of surprising the user with unnecessarily complex behavior (b=
ut perhaps this can be added as an option in the future.)

-- Lars

On Tuesday, April 28, 2020, 2:18:42 PM PDT, civic9 <civic9@gmail.com> wrote=
:=20





pon., 27 kwi 2020 o 20:41 Dario Messina <nanodario@gmail.com> napisa=C5=82(=
a):
>
> On Thu, Apr 23, 2020 at 23:57:59 CEST, Lars <larsh@apache.org> wrote:
> > This adds dual fan control for the following models:
> > P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
> >
> > Both fans are controlled together as if they were a single fan.
> > [...]
> > Background:
> > I tested the BIOS default behavior on my X1E gen2 and both fans are alw=
ays
> > changed together. So rather than adding controls for each fan, this con=
trols
> > both fans together as the BIOS would do.
> Hi Lars, why have you chosen to control multiple fans in this way?
> I know that BIOS controls both fans together, but the EC has the capabili=
ties
> to control both fans independently, so maybe it can be convenient to expo=
se
> this feature.

+1
Previous version of the patch [1] allows to control both fans independently=
.
However some software like thinkfan is not ready to control two fans.
But I also think this feature should be at least optionally exposed.


[1]=20
https://github.com/civic9/thinkpad_acpi.2ndfan.patch/blob/master/thinkpad_a=
cpi.2ndfan.patch/thinkpad_acpi.2ndfan.patch
