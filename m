Return-Path: <platform-driver-x86+bounces-9175-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D53A6A2602E
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Feb 2025 17:33:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E168018814D6
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Feb 2025 16:33:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3083720B1E4;
	Mon,  3 Feb 2025 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=proton.me header.i=@proton.me header.b="GBT17cpy"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-0301.mail-europe.com (mail-0301.mail-europe.com [188.165.51.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9153420B1E2
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Feb 2025 16:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.51.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738600412; cv=none; b=MjO9XhCVt7eknQVhhe+QPjutHkomFRAx2We4R8R7dReLb/WJSr45s0t4UX7DTjUrC3xGM6WDIxukfwtS39p+lOmjA7KBrN3erOfHdzMgw/i5NkCgWDPB/B302ElHPtbAJxvmpngzLZ1mxaYXMwyUUmyaAelPL3ma3I/edgU9e7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738600412; c=relaxed/simple;
	bh=4FxZf6PO+HZtWwc5YXEjBWvdgHDvOD9yZAGRbpAR2J4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dbPYcPnYFzRy5sVD/t2NYo9nV6uafzJntjKtlmYDhPGMQ2uHD7m01DtS7XKxgdMGmUEjVv+kpY4KBszt6la4XT9SnxoXTbSPHvMYIX1HmNXcpIuPwHWGfCAPqZ+sv2nUiy7ZylPPwZGxw7E2G3Wx7Opw5Ra/huWCxZRAYwbTluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=GBT17cpy; arc=none smtp.client-ip=188.165.51.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1738600399; x=1738859599;
	bh=AJTsKlsqdY6CdLAM6+LsVciIKFmhX3Tnbrvy9w0xnSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GBT17cpyznJZMgFQBzpqcugIw62LUd7LF28OH6igsCmB2Xfd4QgmBnHEQ1VBztbc2
	 IK7AtCTBrnno7V3BY94gCMadvAqtkm3ZYsUIswQA9bRm1iP8LOIW97PxMwe3y/8hPW
	 G1r09qc7SREohzKQ9RIayfpNwC7zm+7g0sJfhPZNLj2wXcevOhnQPGp/0VtVBatttR
	 zGnbIu5/Swk8yHsT8cFZ/IvYG/rlqubBTc6TWA1yenQsVffbudll51kgXsaCT7lwJx
	 2smiOCVwGlpQTOCfuczV3QlsFJgIUV1OX3xtbkYT8N4AEMpjBhwr7LncM7Z2GzY0nR
	 OrmkxQvp6SviQ==
Date: Mon, 03 Feb 2025 16:33:15 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Sybil Isabel Dorsett <sybdorsett@proton.me>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: thinkpad_acpi: Fix invalid fan speed on ThinkPad X120e
Message-ID: <20250203163255.5525-1-sybdorsett@proton.me>
In-Reply-To: <cc7c8e94-4340-3d1e-03b4-2f738067d24f@linux.intel.com>
References: <20250131203854.6608-1-sybdorsett@proton.me> <69e279a3-7fd5-9dc3-680d-7415022dc5e4@linux.intel.com> <20250203130232.3481-1-sybdorsett@proton.me> <d20f933c-8041-bc8d-13c2-98d89ccfa524@linux.intel.com> <cc7c8e94-4340-3d1e-03b4-2f738067d24f@linux.intel.com>
Feedback-ID: 131381098:user:proton
X-Pm-Message-ID: bce36cd16a7c78ee9a96a99d3f3ce52c7f07d628
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On ThinkPad X120e, fan speed is reported in ticks per revolution
rather than RPM.

Recalculate the fan speed value reported for ThinkPad X120e
to RPM based on a 22.5 kHz clock.

Based on the information on
https://www.thinkwiki.org/wiki/How_to_control_fan_speed,
the same problem is highly likely to be relevant to at least Edge11,
but Edge11 is not addressed in this patch.

Signed-off-by: Sybil Isabel Dorsett <sybdorsett@proton.me>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
---

Notes:
    v3: changed the commit message (no changes in the code) to address
        further comments from Ilpo.
    v2: addressed review comments from Ilpo
        - name of the new variable is changed
          from "fan_speed_requires_conversion" to "fan_speed_in_tpr";
        - rephrased the commit message;
        - "KHz" is respelled as "kHz".

 drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 1fcb0f996..e7778ea41 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -7885,6 +7885,7 @@ static struct ibm_struct volume_driver_data =3D {
=20
 #define FAN_NS_CTRL_STATUS=09BIT(2)=09=09/* Bit which determines control i=
s enabled or not */
 #define FAN_NS_CTRL=09=09BIT(4)=09=09/* Bit which determines control is by=
 host or EC */
+#define FAN_CLOCK_TPM=09=09(22500*60)=09/* Ticks per minute for a 22.5 kHz=
 clock */
=20
 enum {=09=09=09=09=09/* Fan control constants */
 =09fan_status_offset =3D 0x2f,=09/* EC register 0x2f */
@@ -7940,6 +7941,7 @@ static int fan_watchdog_maxinterval;
=20
 static bool fan_with_ns_addr;
 static bool ecfw_with_fan_dec_rpm;
+static bool fan_speed_in_tpr;
=20
 static struct mutex fan_mutex;
=20
@@ -8142,8 +8144,11 @@ static int fan_get_speed(unsigned int *speed)
 =09=09=09     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
 =09=09=09return -EIO;
=20
-=09=09if (likely(speed))
+=09=09if (likely(speed)) {
 =09=09=09*speed =3D (hi << 8) | lo;
+=09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
+=09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
+=09=09}
 =09=09break;
 =09case TPACPI_FAN_RD_TPEC_NS:
 =09=09if (!acpi_ec_read(fan_rpm_status_ns, &lo))
@@ -8176,8 +8181,11 @@ static int fan2_get_speed(unsigned int *speed)
 =09=09if (rc)
 =09=09=09return -EIO;
=20
-=09=09if (likely(speed))
+=09=09if (likely(speed)) {
 =09=09=09*speed =3D (hi << 8) | lo;
+=09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
+=09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
+=09=09}
 =09=09break;
=20
 =09case TPACPI_FAN_RD_TPEC_NS:
@@ -8788,6 +8796,7 @@ static const struct attribute_group fan_driver_attr_g=
roup =3D {
 #define TPACPI_FAN_NOFAN=090x0008=09=09/* no fan available */
 #define TPACPI_FAN_NS=09=090x0010=09=09/* For EC with non-Standard registe=
r addresses */
 #define TPACPI_FAN_DECRPM=090x0020=09=09/* For ECFW's with RPM in register=
 as decimal */
+#define TPACPI_FAN_TPR=09=090x0040=09=09/* Fan speed is in Ticks Per Revol=
ution */
=20
 static const struct tpacpi_quirk fan_quirk_table[] __initconst =3D {
 =09TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
@@ -8817,6 +8826,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __=
initconst =3D {
 =09TPACPI_Q_LNV3('R', '0', 'V', TPACPI_FAN_NS),=09/* 11e Gen5 KL-Y */
 =09TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),=09/* X1 Tablet (2nd gen=
) */
 =09TPACPI_Q_LNV3('R', '0', 'Q', TPACPI_FAN_DECRPM),/* L480 */
+=09TPACPI_Q_LNV('8', 'F', TPACPI_FAN_TPR),=09=09/* ThinkPad x120e */
 };
=20
 static int __init fan_init(struct ibm_init_struct *iibm)
@@ -8887,6 +8897,8 @@ static int __init fan_init(struct ibm_init_struct *ii=
bm)
=20
 =09=09=09if (quirks & TPACPI_FAN_Q1)
 =09=09=09=09fan_quirk1_setup();
+=09=09=09if (quirks & TPACPI_FAN_TPR)
+=09=09=09=09fan_speed_in_tpr =3D true;
 =09=09=09/* Try and probe the 2nd fan */
 =09=09=09tp_features.second_fan =3D 1; /* needed for get_speed to work */
 =09=09=09res =3D fan2_get_speed(&speed);
--=20
2.39.5



