Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC172F51D4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:22:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728110AbhAMSWF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:22:05 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:32265 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728117AbhAMSWF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:22:05 -0500
Date:   Wed, 13 Jan 2021 18:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562080;
        bh=eJJIwzlS0il/1ITNvxntXc58+a8umAqjQ5OzcNCbq9w=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=oTeVD+ABFh76VdxexrH+Ldl6ImdyDAn2q1cqet+28lecvsv6JYqeS+uRS+/hnpP0P
         eTx5NOL3vC9A+bG5Zm5n1q7bXF5w77Gj1Ef19huAB/1zybtpQEQhTfbuJFizDUQ48s
         qXtfcApqKSQ9rvQ8IZNG5+RsHpHfzRbt6iJhtFcY=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 08/24] platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in case of failure
Message-ID: <20210113182016.166049-9-pobrn@protonmail.com>
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

ACPI helpers returned -1 in case of failure. Convert these functions to
return appropriate error codes, and convert their users to propagate
these error codes accordingly.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index b0d8e332b48a..9bc6c7340876 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -117,7 +117,7 @@ static int read_method_int(acpi_handle handle, const ch=
ar *method, int *val)
 =09status =3D acpi_evaluate_integer(handle, (char *)method, NULL, &result)=
;
 =09if (ACPI_FAILURE(status)) {
 =09=09*val =3D -1;
-=09=09return -1;
+=09=09return -EIO;
 =09}
 =09*val =3D result;
 =09return 0;
@@ -138,7 +138,7 @@ static int method_int1(acpi_handle handle, char *method=
, int cmd)
 =09acpi_status status;
=20
 =09status =3D acpi_execute_simple_method(handle, method, cmd);
-=09return ACPI_FAILURE(status) ? -1 : 0;
+=09return ACPI_FAILURE(status) ? -EIO : 0;
 }
=20
 static int method_vpcr(acpi_handle handle, int cmd, int *ret)
@@ -157,7 +157,7 @@ static int method_vpcr(acpi_handle handle, int cmd, int=
 *ret)
=20
 =09if (ACPI_FAILURE(status)) {
 =09=09*ret =3D -1;
-=09=09return -1;
+=09=09return -EIO;
 =09}
 =09*ret =3D result;
 =09return 0;
@@ -179,54 +179,60 @@ static int method_vpcw(acpi_handle handle, int cmd, i=
nt data)
=20
 =09status =3D acpi_evaluate_object(handle, "VPCW", &params, NULL);
 =09if (status !=3D AE_OK)
-=09=09return -1;
+=09=09return -EIO;
 =09return 0;
 }
=20
 static int read_ec_data(acpi_handle handle, int cmd, unsigned long *data)
 {
-=09int val;
+=09int val, err;
 =09unsigned long int end_jiffies;
=20
-=09if (method_vpcw(handle, 1, cmd))
-=09=09return -1;
+=09err =3D method_vpcw(handle, 1, cmd);
+=09if (err)
+=09=09return err;
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
-=09=09if (method_vpcr(handle, 1, &val))
-=09=09=09return -1;
+=09=09err =3D method_vpcr(handle, 1, &val);
+=09=09if (err)
+=09=09=09return err;
 =09=09if (val =3D=3D 0) {
-=09=09=09if (method_vpcr(handle, 0, &val))
-=09=09=09=09return -1;
+=09=09=09err =3D method_vpcr(handle, 0, &val);
+=09=09=09if (err)
+=09=09=09=09return err;
 =09=09=09*data =3D val;
 =09=09=09return 0;
 =09=09}
 =09}
 =09acpi_handle_err(handle, "timeout in %s\n", __func__);
-=09return -1;
+=09return -ETIMEDOUT;
 }
=20
 static int write_ec_cmd(acpi_handle handle, int cmd, unsigned long data)
 {
-=09int val;
+=09int val, err;
 =09unsigned long int end_jiffies;
=20
-=09if (method_vpcw(handle, 0, data))
-=09=09return -1;
-=09if (method_vpcw(handle, 1, cmd))
-=09=09return -1;
+=09err =3D method_vpcw(handle, 0, data);
+=09if (err)
+=09=09return err;
+=09err =3D method_vpcw(handle, 1, cmd);
+=09if (err)
+=09=09return err;
=20
 =09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
-=09=09if (method_vpcr(handle, 1, &val))
-=09=09=09return -1;
+=09=09err =3D method_vpcr(handle, 1, &val);
+=09=09if (err)
+=09=09=09return err;
 =09=09if (val =3D=3D 0)
 =09=09=09return 0;
 =09}
 =09acpi_handle_err(handle, "timeout in %s\n", __func__);
-=09return -1;
+=09return -ETIMEDOUT;
 }
=20
 /*
@@ -365,8 +371,8 @@ static ssize_t store_ideapad_cam(struct device *dev,
 =09if (sscanf(buf, "%i", &state) !=3D 1)
 =09=09return -EINVAL;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -398,8 +404,8 @@ static ssize_t store_ideapad_fan(struct device *dev,
 =09if (state < 0 || state > 4 || state =3D=3D 3)
 =09=09return -EINVAL;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -431,8 +437,8 @@ static ssize_t __maybe_unused touchpad_store(struct dev=
ice *dev,
 =09=09return ret;
=20
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_TOUCHPAD, state);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -465,8 +471,8 @@ static ssize_t conservation_mode_store(struct device *d=
ev,
 =09ret =3D method_int1(priv->adev->handle, "SBMC", state ?
 =09=09=09=09=09      BMCMD_CONSERVATION_ON :
 =09=09=09=09=09      BMCMD_CONSERVATION_OFF);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -503,8 +509,8 @@ static ssize_t fn_lock_store(struct device *dev,
 =09ret =3D method_int1(priv->adev->handle, "SALS", state ?
 =09=09=09  HACMD_FNLOCK_ON :
 =09=09=09  HACMD_FNLOCK_OFF);
-=09if (ret < 0)
-=09=09return -EIO;
+=09if (ret)
+=09=09return ret;
 =09return count;
 }
=20
@@ -744,7 +750,8 @@ static void ideapad_check_special_buttons(struct ideapa=
d_private *priv)
 {
 =09unsigned long bit, value;
=20
-=09read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value);
+=09if (read_ec_data(priv->adev->handle, VPCCMD_R_SPECIAL_BUTTONS, &value))
+=09=09return;
=20
 =09for_each_set_bit(bit, &value, 16) {
 =09=09switch (bit) {
@@ -772,28 +779,33 @@ static int ideapad_backlight_get_brightness(struct ba=
cklight_device *blightdev)
 {
 =09struct ideapad_private *priv =3D bl_get_data(blightdev);
 =09unsigned long now;
+=09int err;
=20
 =09if (!priv)
 =09=09return -EINVAL;
=20
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now))
-=09=09return -EIO;
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
+=09if (err)
+=09=09return err;
 =09return now;
 }
=20
 static int ideapad_backlight_update_status(struct backlight_device *blight=
dev)
 {
 =09struct ideapad_private *priv =3D bl_get_data(blightdev);
+=09int err;
=20
 =09if (!priv)
 =09=09return -EINVAL;
=20
-=09if (write_ec_cmd(priv->adev->handle, VPCCMD_W_BL,
-=09=09=09 blightdev->props.brightness))
-=09=09return -EIO;
-=09if (write_ec_cmd(priv->adev->handle, VPCCMD_W_BL_POWER,
-=09=09=09 blightdev->props.power =3D=3D FB_BLANK_POWERDOWN ? 0 : 1))
-=09=09return -EIO;
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_BL,
+=09=09=09   blightdev->props.brightness);
+=09if (err)
+=09=09return err;
+=09err =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_BL_POWER,
+=09=09=09   blightdev->props.power !=3D FB_BLANK_POWERDOWN);
+=09if (err)
+=09=09return err;
=20
 =09return 0;
 }
@@ -808,13 +820,17 @@ static int ideapad_backlight_init(struct ideapad_priv=
ate *priv)
 =09struct backlight_device *blightdev;
 =09struct backlight_properties props;
 =09unsigned long max, now, power;
-
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &max))
-=09=09return -EIO;
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now))
-=09=09return -EIO;
-=09if (read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power))
-=09=09return -EIO;
+=09int err;
+
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &max);
+=09if (err)
+=09=09return err;
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL, &now);
+=09if (err)
+=09=09return err;
+=09err =3D read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &power);
+=09if (err)
+=09=09return err;
=20
 =09memset(&props, 0, sizeof(struct backlight_properties));
 =09props.max_brightness =3D max;
--=20
2.30.0

