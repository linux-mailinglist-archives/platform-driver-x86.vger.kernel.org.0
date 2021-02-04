Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418A430E54A
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbhBCV5N (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:57:13 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:18733 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbhBCV5C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:02 -0500
Date:   Wed, 03 Feb 2021 21:56:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389379;
        bh=90KXYhlIrAp0ubHBGpGIYNKKG7QLhFD22auhWR2MdOU=;
        h=Date:To:From:Reply-To:Subject:From;
        b=AQ0EMbmap8vlRFokRpbiRTSmt5aog2VOg+bodd4kXwoefs3LyteMYK4OGzWbhTeir
         9/b1OhbbGw9gwuSuiPURpJk8L5NtiVlx3SktkHx3QkeuAiwePmDRdisv2AHl2svtcH
         nM9mz5qrzezS0HtHV64zeZmXmQv8TzeDyLIoTe48=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 19/29] platform/x86: ideapad-laptop: check for Fn-lock support in HALS
Message-ID: <20210203215403.290792-20-pobrn@protonmail.com>
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
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 77a8e19441ed..549e220ae05b 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -58,7 +58,9 @@ enum {
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
@@ -1293,8 +1295,12 @@ static void ideapad_check_features(struct ideapad_pr=
ivate *priv)
 =09if (acpi_has_method(handle, "DYTC"))
 =09=09priv->features.dytc =3D true;
=20
-=09if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "SALS"))
-=09=09priv->features.fn_lock =3D true;
+=09if (acpi_has_method(handle, "HALS") && acpi_has_method(handle, "SALS"))=
 {
+=09=09if (!eval_hals(handle, &val)) {
+=09=09=09if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
+=09=09=09=09priv->features.fn_lock =3D true;
+=09=09}
+=09}
 }
=20
 static int ideapad_acpi_add(struct platform_device *pdev)
--=20
2.30.0


