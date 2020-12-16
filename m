Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3DF2DB87E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Dec 2020 02:40:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgLPBkH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Dec 2020 20:40:07 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:45261 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPBkH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:07 -0500
Date:   Wed, 16 Dec 2020 01:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082764;
        bh=lPtPo6QjPZZAvGFPghv331j8n043gBexnNerXfAmyPY=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=KJ+yTBG8Iu6c8qCbLcCA8ijD6ecSYdTkKgw9Z2+/oVq4Sr1qtYluelD88uJ7uq9RT
         B5qO1q7mjDzcB7jWZbqWu63tizavOnNm/cPkgrgT6RNUefG1y+H74xzd8Kwx9u4sCc
         w2y183j6VZJIj93bqKecLoq3+sVhhmkDhrzoIx6U=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 04/24] platform/x86: ideapad-laptop: use sysfs_emit()
Message-ID: <20201216013857.360987-5-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
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

sysfs_emit() has been introduced to make it less ambiguous which function
is preferred when writing to the output buffer in a device attribute's
show() callback. Convert the ideapad-laptop module to utilize this
new helper function.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index aefe83996be6..11df791d702c 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
=20
 #define IDEAPAD_RFKILL_DEV_NUM=09(3)
@@ -344,8 +345,8 @@ static ssize_t show_ideapad_cam(struct device *dev,
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%lu\n", result);
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%lu\n", result);
 }
=20
 static ssize_t store_ideapad_cam(struct device *dev,
@@ -375,8 +376,8 @@ static ssize_t show_ideapad_fan(struct device *dev,
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_FAN, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%lu\n", result);
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%lu\n", result);
 }
=20
 static ssize_t store_ideapad_fan(struct device *dev,
@@ -408,8 +409,8 @@ static ssize_t touchpad_show(struct device *dev,
 =09unsigned long result;
=20
 =09if (read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%lu\n", result);
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%lu\n", result);
 }
=20
 /* Switch to RO for now: It might be revisited in the future */
@@ -441,8 +442,8 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09unsigned long result;
=20
 =09if (method_gbmd(priv->adev->handle, &result))
-=09=09return sprintf(buf, "-1\n");
-=09return sprintf(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
+=09=09return sysfs_emit(buf, "-1\n");
+=09return sysfs_emit(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
 }
=20
 static ssize_t conservation_mode_store(struct device *dev,
@@ -477,10 +478,10 @@ static ssize_t fn_lock_show(struct device *dev,
 =09int fail =3D read_method_int(priv->adev->handle, "HALS", &hals);
=20
 =09if (fail)
-=09=09return sprintf(buf, "-1\n");
+=09=09return sysfs_emit(buf, "-1\n");
=20
 =09result =3D hals;
-=09return sprintf(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
+=09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
--=20
2.29.2


