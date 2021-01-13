Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3A252F51D7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:22:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbhAMSWR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:22:17 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:34521 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbhAMSWR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:22:17 -0500
Date:   Wed, 13 Jan 2021 18:21:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562095;
        bh=cmL6QOuVjVjAGANZm7IFV2R6nniMbDOQF2GAOhbnkC4=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=B4bgQb/FxgO7LEYBLmLd2pmdU2zC44Q4NPmM66rWXH6xDvMBbk7kXToIztzyh8bu5
         8E17bg9jWsdbIz7xZaquHydPbcNrbdyf0bYY9WYl0fJA3GtM8BAIhn9ePtl/C048kJ
         DNwm5a9S0st7jf09QNLIpqvagTCIrY06ECH7BuX0=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 09/24] platform/x86: ideapad-laptop: always propagate error codes from device attributes' show() callback
Message-ID: <20210113182016.166049-10-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-1-pobrn@protonmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com>
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

Consumers can differentiate an error from a successful read much more
easily if the read() call fails with the appropriate errno instead of
returning a magic string like "-1".

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 9bc6c7340876..677d4e10352e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -353,9 +353,11 @@ static ssize_t show_ideapad_cam(struct device *dev,
 {
 =09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09int err;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
@@ -384,9 +386,11 @@ static ssize_t show_ideapad_fan(struct device *dev,
 {
 =09unsigned long result;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09int err;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
@@ -417,9 +421,11 @@ static ssize_t touchpad_show(struct device *dev,
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned long result;
+=09int err;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%lu\n", result);
 }
=20
@@ -450,9 +456,11 @@ static ssize_t conservation_mode_show(struct device *d=
ev,
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09unsigned long result;
+=09int err;
=20
-=09if (method_gbmd(priv->adev->handle, &result))
-=09=09return sysfs_emit(buf, "-1\n");
+=09err =3D method_gbmd(priv->adev->handle, &result);
+=09if (err)
+=09=09return err;
 =09return sysfs_emit(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
 }
=20
@@ -488,7 +496,7 @@ static ssize_t fn_lock_show(struct device *dev,
 =09int fail =3D read_method_int(priv->adev->handle, "HALS", &hals);
=20
 =09if (fail)
-=09=09return sysfs_emit(buf, "-1\n");
+=09=09return fail;
=20
 =09result =3D hals;
 =09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
--=20
2.30.0

