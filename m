Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A56162DB88A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Dec 2020 02:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725807AbgLPBky (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Dec 2020 20:40:54 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:18249 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLPBky (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:54 -0500
Date:   Wed, 16 Dec 2020 01:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082812;
        bh=VGnTaoqqXPsWZ7vNkWluSX6di+Y75ngcVsLsqd6s/oI=;
        h=Date:To:From:Reply-To:Subject:From;
        b=crKeBoHjN7WcGJzcCL0QsKMKxblJMfq58aljY7W/MuqzEH3WFP4LZeN8VP3ZF6ZrZ
         HCaIyVa6Z7UeGggN+zs4KSFhb8HNJDAohCPLnjFR3zyeruK9Z83Shdw8e0mHI2TpRe
         30zq4CSeXryJ9P7py3O2ArqEUk2YzqR867Rociks=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 14/24] platform/x86: ideapad-laptop: check for Fn-lock support in HALS
Message-ID: <20201216013857.360987-15-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Bit 9 in the return value of the HALS ACPI method is set if
Fn-lock is supported. Change ideapad_check_features() to check it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index d61710ad8803..8a654ac0546c 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -55,7 +55,9 @@ enum {
 };
=20
 enum {
-=09HALS_FNLOCK_STATE_BIT =3D 10,
+=09HALS_FNLOCK_SUPPORT_BIT  =3D 9,
+=09HALS_FNLOCK_STATE_BIT    =3D 10,
+=09HALS_HOTKEYS_PRIMARY_BIT =3D 11,
 };
=20
 enum {
@@ -1013,8 +1015,11 @@ static void ideapad_check_features(struct ideapad_pr=
ivate *priv)
 =09if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"))
 =09=09priv->features.conservation_mode =3D true;
=20
-=09if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "SALS"))
-=09=09priv->features.fn_lock =3D true;
+=09if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "SALS"))=
 {
+=09=09if (!eval_hals(handle, &val))
+=09=09=09if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
+=09=09=09=09priv->features.fn_lock =3D true;
+=09}
 }
=20
 static int ideapad_acpi_add(struct platform_device *pdev)
--=20
2.29.2


