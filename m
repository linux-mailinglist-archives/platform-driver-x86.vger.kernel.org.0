Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7752B1B610E
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Apr 2020 18:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgDWQfS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Apr 2020 12:35:18 -0400
Received: from sonic306-2.consmr.mail.bf2.yahoo.com ([74.6.132.41]:42526 "EHLO
        sonic306-2.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729407AbgDWQfS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Apr 2020 12:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1587659716; bh=CbrlAp3pfMr9PwfKmZN15uLMgUYv/lRxnAkwEFGZVRM=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=l1vaAD0BxABeQMAwR16F2lEXPnI2MD4Fq7NxSR5YWsOPc61sKEsrdKWQhrp/u0Aa4T8EhsVTjxqOS+z4qXwyoYohUk65++A3wm9wk/Oj/i7cbBEj7q6tUIIFInfJmSoQ56XkhdlXSloPDKy3iCnUImh2MsLGHlJXQxjjEEMBDCy7+0KN84CC2Zp1cqzsYkUFge3xD0CAGodKlmh/K7TlsLeL0g7zuXZvhFTscyYucV0qhJG3cJddQ1s0YSEMCa9NiedPzFW18gt8knb/edRHz7PfjqAGnFi9faqkQv72VtS8vnZdu9WgTSSvGK0PCF2SfUEHuGkLORMFlMTzjN+1Kw==
X-YMail-OSG: mQ7qVDAVM1kmaDouYzq0.dHLwrhQnghNH82pIndBzhC575V4xBfAPmZtJoYvBmU
 T.w.syasAj1tPj3UBS5PbW0UtUQpnxKsem19x.xof7qm_ZucrrzPdmM7u02EhoRR48Gm_Np9EnAm
 z8mx3ag3J4p5f1BrGgvW4tFatWBbuOI03zzzTxXIEdSWCt0L6M7_9gUR83ueldGcCJTSgoV3Iokg
 0S7Y3afngUpsMXkrvOY.YHuQwwJF4tzQLEI5ddkX8Oj.jTPg2oDYTyMGL.RpXXrJBG8dxBSA9oz1
 mZdGVeyx.VaO6gGNas3UpkRyUcShDKrq1NoN296bLedj0135Cw2i.7C0FY.dCkzUfgW69h_lDO7d
 VQGpqsILHxEbH_rG6yhlVR5iQPnP2mbb_jSCKcDHF9qrmgNcfulxZ_AmqVyevKBWxBYeDbAjPtGa
 BgjdxY3ltv4_wT5M8V08by7nXRJwjZuOG9Dp2qV1PHF2TiRz4zODmdXOYdlY.hKMg9kQUCdX9_zX
 v4twdCgOpRxDwAf3W8tPtaEbYGhWAjo8GVQZN5IcEYBV4m_Ang0ulZ6rQJ_zMmZxVAshDvhKyTPU
 VQEd9J0t.SrQ7zTWPgTVeZZa8CUbRDnwFOvPKzptOvHSFXwEZVFKnKBxSduYRP_vr3WfsoDsaAMB
 e7Wf59SE8WXfQHHaukIb70XuHV1iISIvtJioNwauDHRfIsOzmbBv1033Zn1DpwliF8FV.__kPSEG
 BYHWlAp3qSDx93vh11KXUdVDfZsbkNfGYVUTZLqEGn0fpKaWfYHgg_TiqGA0NuG5IrjAnfWZ3kof
 4cTRMsZ2_86p8.4zJjiBchOjV39J4qIvXvQ9hI2tAhuLtGs3Ou0yBcu.lK4cI2MFghcJIBPtd3ne
 RQHDU.AOK22TBHE2oUT4wsoscu6hW4RWSbwHXNcrjrGdf_XSZ5x2m_lusCuqMPm377d32l.NoYc1
 kubBP2WK0JX85ijtEIvv9MafAH_qJwpTtkkXidnWdwfaJHyZOYpnc4r3ebKPR9vlYPQh3ECm8Rd9
 VQ.S2pB5EtAc4LSe1QlOyVogKBupFoIUI7NSqsNrhE1X4wzq3htsXg5lBmtobgNaZuL2zkIdA8tf
 _6hZPfqVcWL9YkA.rtThMcz7Wt.7ZCpjdHIRrhWmTMYrUSU0eXKtjdMgdAL8.VJ0ds57dAxW6j8F
 KtqDHB0lf2JBir.2wfahu1ThpsL2P93koykgST0V67SXxROITg6RAEnMZ2Nri9yXNaJgajq1Ge7u
 VJ.k9GF6QtLDtLTqQJZyGRKKXtpUsUeY2pfsdljTi7sOIjhmjaujrYN9Pq_Q8qyxXw6nIdG572yR
 VK9iwxSy48aMmJhQOViyJCLrUMAYjcjnryHBAaON9GkeDLgsy
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Thu, 23 Apr 2020 16:35:16 +0000
Date:   Thu, 23 Apr 2020 16:35:15 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     Kevin Slagle <kjslag@gmail.com>,
        =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner@gmail.com>,
        Dario Messina <nanodario@gmail.com>,
        Stefan Assmann <sassmann@kpanic.de>,
        Alexander Kappner <agk@godking.net>,
        Marc Burkhardt <marc@osknowledge.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Message-ID: <681855269.281189.1587659715513@mail.yahoo.com>
In-Reply-To: <CAHp75VexAMt3yM+p7HeXdyO51BfB5FOuoEjq9xTUi+tR-jj4JA@mail.gmail.com>
References: <20200417201426.24033-1-larsh@apache.org> <CAHp75VexAMt3yM+p7HeXdyO51BfB5FOuoEjq9xTUi+tR-jj4JA@mail.gmail.com>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for dual fan control on
 select models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The double call is needed because in the case that the call is not supporte=
d dual fan support is disabled (tp_features.second_fan =3D 0;),
which in turn makes fan_select_fan1(); a no-op. That is why resetting to fa=
n1 needs to be before disabling second fan support.

I will post a new version that does not need that any longer, because I'm s=
eparating fan query support from fan control support.

On Wednesday, April 22, 2020, 6:50:28 AM PDT, Andy Shevchenko <andy.shevche=
nko@gmail.com> wrote:=20





+Cc: people who lately involved in 2nd fan discussions here and there

Lars, also one question regarding the code below.

On Fri, Apr 17, 2020 at 11:15 PM Lars <larsh@apache.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks. Both fans are c=
ontrolled together.
>
> Tested on an X1 Extreme Gen2.
>
> The patch is defensive, it adds only specific supported machines, and fal=
ls back to the old behavior if both fans cannot be controlled.
> However, it does attempt single fan control for all previously white-list=
ed Thinkpads.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are alway=
s changed together.
> So rather than adding controls for each fan, this controls both fans toge=
ther as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan to=
ol (https://github.com/vmatare/thinkfan/issues/58).
> (Thanks to Github users voidworker, and civic9.)
>
> The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id is=
 verified on my machine.
>
> (In the first version my mail client botched the white-spacing - my apolo=
gies, this is my first Kernel patch. Used git send-email and gmail this tim=
e.)
>
> Signed-off-by: Lars <larsh@apache.org>
> ---
>=C2=A0 drivers/platform/x86/thinkpad_acpi.c | 33 +++++++++++++++++++++++--=
---
>=C2=A0 1 file changed, 27 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index 8eaadbaf8ffa..cbc0e85d89d2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8324,11 +8324,20 @@ static int fan_set_level(int level)
>
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (fan_control_access_mode) {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TPACPI_FAN_WR_ACPI_SFAN:
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (level >=3D 0 && lev=
el <=3D 7) {
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", level))
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((level < 0) || (le=
vel > 7)))
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EINVAL;
> +
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tp_features.second_=
fan) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (!fan_select_fan2() ||
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_select_fan1();
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn("Couldn't set 2nd fan level, dis=
abling support\n");
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tp_features.second_fan =3D 0;
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fan_select_fan1();
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!acpi_evalf(sfan_ha=
ndle, NULL, NULL, "vd", level))
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return -EIO;
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8345,6 +8354,16 @@ static int fan_set_level(int level)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (level & T=
P_EC_FAN_AUTO)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 level |=3D 4;=C2=A0 =C2=A0 /* safety min speed 4 */
>
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tp_features.second_=
fan) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (!fan_select_fan2() ||
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 !acpi_ec_write(fan_status_offset, level)) {

> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_select_fan1();

(1)

> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn("Couldn't set 2nd fan level, dis=
abling support\n");
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tp_features.second_fan =3D 0;
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }

> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 fan_select_fan1();

(2)

I'm not sure I got a logic behind this. Why do you need to call it twice?


> +
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!acpi_ec_write=
(fan_status_offset, level))
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return -EIO;
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> @@ -8771,6 +8790,9 @@ static const struct tpacpi_quirk fan_quirk_table[] =
__initconst =3D {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +=C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),=C2=
=A0 /* P52 / P72 */
> +=C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),=C2=
=A0 /* X1 Extreme (1st gen) */
> +=C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),=C2=
=A0 /* X1 Extreme (2nd gen) */
>=C2=A0 };
>
>=C2=A0 static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8812,8 +8834,7 @@ static int __init fan_init(struct ibm_init_struct *=
iibm)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_quirk1_setup();
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (quirks & TPACPI_FAN_2FAN) {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tp_features.second_fan =3D 1;
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_=
FAN,
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "secondary f=
an support enabled\n");
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("secondary fan support enabled\n=
");
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 }
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 pr_err("ThinkPad ACPI EC access misbehaving, fan status and cont=
rol unavailable\n");
> --
> 2.25.2

>
--
With Best Regards,
Andy Shevchenko

