Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F2111AE36B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Apr 2020 19:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729295AbgDQRNK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Apr 2020 13:13:10 -0400
Received: from sonic317-26.consmr.mail.bf2.yahoo.com ([74.6.129.81]:34083 "EHLO
        sonic317-26.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728534AbgDQRNJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Apr 2020 13:13:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1587143587; bh=/QtDRDh1OnsNHfwXHa8qQUHbkQZbTR7N62efz9P7cQ4=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=RfHLNUPd2/mqeI0MZyPFWZwIDbiftjM++BA+ls8nJpb0aHvQgiftVNhGCgpijzFaOyy5GjwGZjuQGX4wb9C4WDkiM7R2ELO++lz5cSaYMeyg7XJRw7If2faJimRlky+1TA6MM2Ad7kev2QP0o3ff8E98l2DCl0IF9qwI3zUlO49y8n3N5ikcSl4j0OdYhxPMsve20oSJefgXTWtHP/PWZ/a3yj0b358jfKWnmqWdbptMzDquepsUwhI3TfDCMLEusuwHzv/QtEKgSor4DtW2i+SxeDe1MScb0JD4gk9DtHi+qKdVreMgOIbmde8OmOgSEAl0+mgi5mRugoGVeg59HA==
X-YMail-OSG: CBNVvD4VM1m7QV8zRN5Io1qYipCp_NSZuTIy4XsksgMtS467TdYX0v9sLmQzq4T
 GoY.3HbIokoj2KwZrQYLyrkNyZBdClrJRrQEu.SPgOiJno.R4CGmFDg6sYrFBYirJWCpaQpbHX3b
 4xBBbVxHSoMj9sozEfDvjFxi28JCNQpAmBAuVNGNZO3UJ8Ol8rfiW5qM3qmHYsB41gmJxPrmBia0
 xtakfRuBfSOl1ZleedSxmfyt28tCgLoDxYUyRilB5Rpgw7SSZsVTcDiveJTO3o69lDzBeVplSVpa
 skGxTXXjLUnidrvfIEz5qeIx6oDbCBXPy3HrKj_7AhS3z4jVZPPSrMhZlEAmT2GPMxMlBALV.2F_
 2kOYot6d5qxiJv6nfCH67v3rZTCgBeayDp.PIUz9U8QBctM85UKW.EDZ_EZxDXu9xkXyHmLi_qSb
 R9iez0_tT__HNQk.L7xuk2joFj.cmVUQHdg2FDTMV4nBvsho7mIIM4APPL.92Hd2MjAEWdiax4aN
 iaqQR8vV06PrGxX7QDUesIWmGEwVsV1PJdgYkvN7bhtJ0YXHiuQI18btQTUILIOaKCS2srqnuFlw
 MEmF0OKeO8eqQU70.Ao9oFSWkWTIEIN8V6NeeB_XImjEZMfMOwULbDfMl1pa7L9sFe4GL.DWn.Ie
 GqzwzeDcw0Za1sOErWYhX5Y9hNBxSpV608hH665C8eSMrJnqYyPe9GvIOOSLbBkNAk8BxMSUpLlt
 r69AtATkrVoDc59ib2O0OjFgaWjXQHHg.6VP12qeekc.YFdV_Y7n6sejA_p2mgANYOsBzEE1tKS2
 5fYpsfbXybPMm4yr4Jrh2uYohf6j_1q0Eg4IzV6hJ1JW5cWn1NTDjSEV8PRfhi4qfIC23YEfIyka
 e0ubDoAsd7JZrpfzuPdS09P8ccDAXBeZjoLt5vkhBI__nVsAf45OzOhTDZ.kN5TMChbA80O0OhXA
 1DKAwkbLRGpqJNJZiOjyx_PLxT2mdIiJQ3vGrYYDjN91suV_Mgq.dlccLx5J99O3qVaafisXIIcf
 mF2xqWXFrDqEILw99VcwazAX2agargv9k5jq.swMYznzVrNLGlgSOJaPwNBu2olU9PW2t.ZIo_PJ
 G4DUulZWw8wMwRrfoiyHaYLmtJeMoz8.QvdL2AAyIF_76NA5mz3kFHAA9HEG1gm4YqsD28HBDePy
 zcrBCti4m5B.yc7nUkORQ738aYemVhDdTuBKB60QXXL9s8GWy1cwihDct1NgY2x4354h74eF0dPy
 LinU7EYrPSlkW0NWEOdfgNj2Kf1_8yJ1EsXzWhUsRduT5S8zAxvFzGeo5YLpwqbXMTmEhi_ffRRZ
 zrzpb5OYF_PwgD.V8hsK.echA
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Fri, 17 Apr 2020 17:13:07 +0000
Date:   Fri, 17 Apr 2020 17:13:03 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Message-ID: <727896505.1524992.1587143583657@mail.yahoo.com>
In-Reply-To: <CAHp75VdUtjr0kJDt0Wz05W73ZiN6nedeYdaw4RL34rbvpA_2+A@mail.gmail.com>
References: <970969929.574750.1586116726988.ref@mail.yahoo.com> <970969929.574750.1586116726988@mail.yahoo.com> <CAHp75VdUtjr0kJDt0Wz05W73ZiN6nedeYdaw4RL34rbvpA_2+A@mail.gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: Add support for dual fan control on
 select models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15651 YMailNorrin Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/81.0.4044.92 Safari/537.36
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Huh? Thanks for looking!

Just applied it to the 5.5.16 tag yesterday. Will check master and resend.

-- Lars


On Friday, April 17, 2020, 06:30:51 AM PDT, Andy Shevchenko <andy.shevchenk=
o@gmail.com> wrote:=20





On Sun, Apr 5, 2020 at 11:00 PM larsh@apache.org <larsh@apache.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen to dual fan quirks. Both fans are co=
ntrolled together.
>
> Tested on an X1 Extreme Gen2.
>
> The patch is defensive, it adds only specific supported machines, and fal=
ls back to the old behavior if both fans cannot be controlled.
> It does attempt single fan control for all previously white-listed Thinkp=
ads.
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

It doesn't apply :-(
Please, fix and resend.


> Signed-off-by: Lars Hofhansl <larsh@apache.org>
>
> ---
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index da794dcfdd92..8d46b4c2bde8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -8325,11 +8325,20 @@ static int fan_set_level(int level)
>
>=C2=A0 =C2=A0 =C2=A0 switch (fan_control_access_mode) {
>=C2=A0 =C2=A0 =C2=A0 case TPACPI_FAN_WR_ACPI_SFAN:
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (level >=3D 0 && level <=3D 7) {
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!acpi_evalf(sfan_handle, N=
ULL, NULL, "vd", level))
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((level < 0) || (level > 7)))
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> +
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tp_features.second_fan) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fan_select_fan2() ||
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !acpi_evalf(sfan=
_handle, NULL, NULL, "vd", level)) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_select_fan1(=
);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn("Couldn'=
t set 2nd fan level, disabling support\n");
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tp_features.seco=
nd_fan =3D 0;
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_select_fan1();
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!acpi_evalf(sfan_handle, NULL, NULL, "vd=
", level))
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>
>=C2=A0 =C2=A0 =C2=A0 case TPACPI_FAN_WR_ACPI_FANS:
> @@ -8346,6 +8355,16 @@ static int fan_set_level(int level)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (level & TP_EC_FAN_AUTO)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 level |=3D 4;=C2=A0 =C2=
=A0 /* safety min speed 4 */
>
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tp_features.second_fan) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!fan_select_fan2() ||
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 !acpi_ec_write(f=
an_status_offset, level)) {
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_select_fan1(=
);
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_warn("Couldn'=
t set 2nd fan level, disabling support\n");
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tp_features.seco=
nd_fan =3D 0;
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_select_fan1();
> +
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!acpi_ec_write(fan_status_offset, l=
evel))
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EIO;
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
> @@ -8772,6 +8791,9 @@ static const struct tpacpi_quirk fan_quirk_table[] =
__initconst =3D {
>=C2=A0 =C2=A0 =C2=A0 TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>=C2=A0 =C2=A0 =C2=A0 TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>=C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
> +=C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),=C2=A0 =C2=
=A0 /* P52 / P72 */
> +=C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),=C2=A0 =C2=
=A0 /* X1 Extreme (1st gen) */
> +=C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),=C2=A0 =C2=
=A0 /* X1 Extreme (2nd gen) */
>=C2=A0 };
>
>=C2=A0 static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8813,8 +8835,7 @@ static int __init fan_init(struct ibm_init_struct *=
iibm)
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fan_quirk1_=
setup();
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (quirks & TPACPI_FAN_2=
FAN) {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tp_features=
.second_fan =3D 1;
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbg_printk(TPACP=
I_DBG_INIT | TPACPI_DBG_FAN,
> -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "s=
econdary fan support enabled\n");
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_info("seconda=
ry fan support enabled\n");
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("ThinkPad ACPI EC =
access misbehaving, fan status and control unavailable\n");




--=20
With Best Regards,
Andy Shevchenko

