Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6CC22F51D2
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:22:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbhAMSVh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:21:37 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:37832 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbhAMSVh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:21:37 -0500
Date:   Wed, 13 Jan 2021 18:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562054;
        bh=yPu3zaxASDXPmW4yGer/30+Sel6k1sYSKQa4g1z9RUw=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=Kwqe7sPvN3wk+WQxJV0dH/SRxE6it3Te4RB67ScWD8KEB1YMDK8Zvd5EWo85GxqJ7
         UcQ06xifdewiViY6YV+GxxRhXS/PKx3Z4rQnVDpR9z+6IO4jyJsZe9ch+9FZtVs+VA
         4PTZYtDocYPKAZzlOj3QD4WIdGYOCRAtUD2mQA5o=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 04/24] platform/x86: ideapad-laptop: use sysfs_emit()
Message-ID: <20210113182016.166049-5-pobrn@protonmail.com>
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

sysfs_emit() has been introduced to make it less ambiguous which function
is preferred when writing to the output buffer in a device attribute's
show() callback. Convert the ideapad-laptop module to utilize this
new helper function.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index d92d96fe4aa1..61ea70602256 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/rfkill.h>
 #include <linux/seq_file.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
=20
 #include <acpi/video.h>
@@ -346,8 +347,8 @@ static ssize_t show_ideapad_cam(struct device *dev,
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
@@ -377,8 +378,8 @@ static ssize_t show_ideapad_fan(struct device *dev,
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
@@ -410,8 +411,8 @@ static ssize_t touchpad_show(struct device *dev,
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
@@ -443,8 +444,8 @@ static ssize_t conservation_mode_show(struct device *de=
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
@@ -479,10 +480,10 @@ static ssize_t fn_lock_show(struct device *dev,
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
2.30.0

