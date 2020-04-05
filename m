Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9685019EDC5
	for <lists+platform-driver-x86@lfdr.de>; Sun,  5 Apr 2020 21:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgDET6t (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 5 Apr 2020 15:58:49 -0400
Received: from sonic310-14.consmr.mail.bf2.yahoo.com ([74.6.135.124]:33236
        "EHLO sonic310-14.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726678AbgDET6t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 5 Apr 2020 15:58:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1586116727; bh=rlCNfbSK3obcC2sPUMDiX98whU0f+1oa/G9JoaL7nqQ=; h=Date:From:To:Cc:Subject:References:From:Subject; b=Y52eNq6t/km7sw5J5aT0hlHmqnfqdbpO4Vx6FdTbsR1JP9rMnUIplU+12gRJU8NXYFa/on+Pj6g/ZEh7pHg1rUbC8wIZnvDAmSM11LQVImqG/saBk4SCzdrdmW+0a4ia2kIRNmUFzf8cjb8k+TIYUVKDk8esMKOGKDB/kU5Ne9vP7Y6q91adfoh1UUaPCC1opawUIXhmyzO+7Bdzj4XYK4uLaPLOPOW1rHYsJMWRTxgwo8+G+yLidA74Ij/LVwRCQDa0iw2mUlSvwI1WMGj6jvBLhIziyRXfkQAOboLXTL7opY7o6LsAq+rahJKSGovI80c7FdZs8WtCxv3w0jFZNQ==
X-YMail-OSG: lBaBEcMVM1lTUgT.EtdBXfVpK4iwucDPhn_qa8EEhVPa3QIq2dVpjg3F6LdspAz
 OFG125KCUttXK6xVzfLsWhyjm2hMrun.vuvAsiH19RwYCTdNAVQrv9aL52LoBA90nwWnnKOv_y7e
 x2IaA7VKEbzTLX_cGy2hQjeFbnJgHrFbT43wwBWjRABZFURK7t7fgI6eAKX_eTBFi6OMhWfA_x0g
 YhBh01O5XakYXmMRjXMnY47OCaYaRhkEs4R4ixu8npFtTEx4MLBqSo9MlYz3pMaS0h5nsvoOMuiE
 3PLkZzzrSI6dfrMCP2kEBAmT91i7sLdEiLF75EjspYWY2Y4GozB83v0oWxxfWLiG2x6hq38f5Ids
 SH0N4XqLF7YQT6U0zPPHWccqMLTo3XUCqLSRc2jGRk3LCDXH7jKEULuw2fUhQrLQ_6LoLFok2sRx
 _RvgHOh4CaAoRq8T5nCOcfJ0zfSCq2OaCHImPrila9IPuvGZZBR4_79pi8KzjJjmlln6OIvG9zqO
 U8kcqeNvQcjil8SlyLaB7.UtqemgxbJXTq5FKVeevSmk6mNr19I2jsi9bRnh.NmMQJjJDnxBfUdq
 ADIdDpuyT7vFqp7b.GSRAl6exQmedMh5bbGiKlAoTA6cM6mc0QsZgx6MWG6Pjr847URNNma0Ey6w
 GRmx6YGt6B8_NiGBCa53JWbriaozTRFuQQ69hacgdzu8CajGaCIIm08pdshbpbxdV7j.xhgi1vvG
 37TruZyaHvbjJCqo_WOTm1EXL6mXXtlr6E8Prw_e6T9lgvXnfypwrZlFTyNUkkPP6dcQXlLYRbqe
 PHCQ3R5xAQ_gi3zaLCKvvKN1PrZEtTZovJyr0xGHTjNaluTYaJYKpPt.BHV7BRm1oa7Vw1zunpQE
 u_MY40hhbWb7SE.3ni6147Lo30pS6XoyKPsIxJdz0d.1D1dbzv7s13_zBw_.w2.sV9.S3Lwxdp2F
 m3RLPw8a9srWXfz7skeO_1a7XEI46R72aUTOcV0hXGXdOxPRk_JR50qZ9YmGt.yvwmR3c90wKH1n
 kBxKGYOkYZPjE9zV0GkS4tsENFvwSIwm7iy1cyCpPGB.K80VrUPEkBDtuSkeIy2lZ9EyPQ1yNChn
 Tqq.750cDDGkBCdQIOx2EGGFsBBZNmEB.Ps1e335baUkeptgbC1A8LBgeylK9JyOscUThVpg2CdS
 a1bgegHqPJaEULae.rJfwgZb7rRuqSSqZEga7b1KWbaPNof8ei8VfW5B_nBevfjlFz5SUHN9CH50
 F9JzN880gJFBh.Zhsyl_kdTVTLeHnzaYcb_oSolS73L7.hPH_fVNPru9eBHTqHQnSn_a5N0t1TMH
 N8dkL383tV12auI2UScNWQzWzEwuzRgK26Iwfub68
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Sun, 5 Apr 2020 19:58:47 +0000
Date:   Sun, 5 Apr 2020 19:58:46 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>
Cc:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        platform-driver-x86@vger.kernel.org
Message-ID: <970969929.574750.1586116726988@mail.yahoo.com>
Subject: [PATCH] thinkpad_acpi: Add support for dual fan control on select
 models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <970969929.574750.1586116726988.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15620 YMailNorrin Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch allows controlling multiple fans as if they were a single fan.

This adds P52, P72, X1E, and X1E gen to dual fan quirks. Both fans are cont=
rolled together.

Tested on an X1 Extreme Gen2.

The patch is defensive, it adds only specific supported machines, and falls=
 back to the old behavior if both fans cannot be controlled.
It does attempt single fan control for all previously white-listed Thinkpad=
s.

Background:
I tested the BIOS default behavior on my X1E gen2 and both fans are always =
changed together.
So rather than adding controls for each fan, this controls both fans togeth=
er as the BIOS would do.

This was inspired by a discussion on dual fan support for the thinkfan tool=
 (https://github.com/vmatare/thinkfan/issues/58).
(Thanks to Github users voidworker, and civic9.)

The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id is v=
erified on my machine.

Signed-off-by: Lars Hofhansl <larsh@apache.org>

---

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index da794dcfdd92..8d46b4c2bde8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8325,11 +8325,20 @@ static int fan_set_level(int level)
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0switch (fan_control_access_mode) {
=C2=A0=C2=A0=C2=A0 =C2=A0case TPACPI_FAN_WR_ACPI_SFAN:
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (level >=3D 0 && level <=3D 7) {
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (!acpi_evalf(s=
fan_handle, NULL, NULL, "vd", level))
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0return -EIO;
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0} else
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (((level < 0) || (level > 7)))
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return -EINV=
AL;
+
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (tp_features.second_fan) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (!fan_select_f=
an2() ||
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 !acpi_evalf(sfan_handle, NULL, NULL, "vd", level)) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0fan_select_fan1();
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0pr_warn("Couldn't set 2nd fan level, disabling support\n");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0tp_features.second_fan =3D 0;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0fan_select_fan1()=
;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (!acpi_evalf(sfan_handle, NULL, N=
ULL, "vd", level))
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return -EIO;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0break;
=C2=A0
=C2=A0=C2=A0=C2=A0 =C2=A0case TPACPI_FAN_WR_ACPI_FANS:
@@ -8346,6 +8355,16 @@ static int fan_set_level(int level)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0else if (level & TP_EC_FAN_AUTO=
)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0level |=3D 4=
;=C2=A0=C2=A0 =C2=A0/* safety min speed 4 */
=C2=A0
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (tp_features.second_fan) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (!fan_select_f=
an2() ||
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=C2=
=A0 !acpi_ec_write(fan_status_offset, level)) {
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0fan_select_fan1();
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0pr_warn("Couldn't set 2nd fan level, disabling support\n");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0tp_features.second_fan =3D 0;
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0fan_select_fan1()=
;
+
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (!acpi_ec_write(fan_status_o=
ffset, level))
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0return -EIO;
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0else
@@ -8772,6 +8791,9 @@ static const struct tpacpi_quirk fan_quirk_table[] __=
initconst =3D {
=C2=A0=C2=A0=C2=A0 =C2=A0TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
=C2=A0=C2=A0=C2=A0 =C2=A0TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
=C2=A0=C2=A0=C2=A0 =C2=A0TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
+=C2=A0=C2=A0 =C2=A0TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),=C2=A0=C2=
=A0 =C2=A0/* P52 / P72 */
+=C2=A0=C2=A0 =C2=A0TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),=C2=A0=C2=
=A0 =C2=A0/* X1 Extreme (1st gen) */
+=C2=A0=C2=A0 =C2=A0TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),=C2=A0=C2=
=A0 =C2=A0/* X1 Extreme (2nd gen) */
=C2=A0};
=C2=A0
=C2=A0static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8813,8 +8835,7 @@ static int __init fan_init(struct ibm_init_struct *ii=
bm)
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0fan_quirk1_setup();
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0if (quirks &=
 TPACPI_FAN_2FAN) {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0=
 =C2=A0tp_features.second_fan =3D 1;
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0dbg_printk(TPACPI_DBG_INIT | TPACPI_DBG_FAN,
-=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0=C2=A0=C2=A0 =C2=A0"secondary fan support enabled\n");
+=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=
=A0pr_info("secondary fan support enabled\n");
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0}
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0} else {
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0pr_err("Thin=
kPad ACPI EC access misbehaving, fan status and control unavailable\n");
