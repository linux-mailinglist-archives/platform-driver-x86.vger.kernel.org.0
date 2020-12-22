Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7B982DB886
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Dec 2020 02:40:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725730AbgLPBku (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Dec 2020 20:40:50 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:50678 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLPBku (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:50 -0500
Date:   Wed, 16 Dec 2020 01:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082794;
        bh=Yh1HSVIA/EB37Qe4kY4Tq76O6kf8AVZAoxtHldxeo54=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=ogILRoTKF2x4mdKZKKdykVN/QWKEE1CleB84/svtSuCkZNbaJdNEhxuPELuFfQxv0
         Q39yUBRNYC4gjxLKrlavgFwvc4wLUUdPdGwqBTMwRbjPs67BQLnrPgG5kRic5Nc/pp
         vOjIb0GHbbNZ6YM87cZsAHCYm1ljmrjh1Fjs1Q1I=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 11/24] platform/x86: ideapad-laptop: group and separate (un)related constants into enums
Message-ID: <20201216013857.360987-12-pobrn@protonmail.com>
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

Group and rename constants depending on which ACPI interface they
pertain to, and rename CFG_X constants to CFG_CAP_X.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index a615c42d1beb..ffe41bf5585f 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -31,14 +31,6 @@
=20
 #define IDEAPAD_RFKILL_DEV_NUM=09(3)
=20
-#define BM_CONSERVATION_BIT (5)
-#define HA_FNLOCK_BIT       (10)
-
-#define CFG_BT_BIT=09(16)
-#define CFG_3G_BIT=09(17)
-#define CFG_WIFI_BIT=09(18)
-#define CFG_CAMERA_BIT=09(19)
-
 #if IS_ENABLED(CONFIG_ACPI_WMI)
 static const char *const ideapad_wmi_fnesc_events[] =3D {
 =09"26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
@@ -47,10 +39,28 @@ static const char *const ideapad_wmi_fnesc_events[] =3D=
 {
 #endif
=20
 enum {
-=09BMCMD_CONSERVATION_ON =3D 3,
-=09BMCMD_CONSERVATION_OFF =3D 5,
-=09HACMD_FNLOCK_ON =3D 0xe,
-=09HACMD_FNLOCK_OFF =3D 0xf,
+=09CFG_CAP_BT_BIT   =3D 16,
+=09CFG_CAP_3G_BIT   =3D 17,
+=09CFG_CAP_WIFI_BIT =3D 18,
+=09CFG_CAP_CAM_BIT  =3D 19,
+};
+
+enum {
+=09GBMD_CONSERVATION_STATE_BIT =3D 5,
+};
+
+enum {
+=09SMBC_CONSERVATION_ON  =3D 3,
+=09SMBC_CONSERVATION_OFF =3D 5,
+};
+
+enum {
+=09HALS_FNLOCK_STATE_BIT =3D 10,
+};
+
+enum {
+=09SALS_FNLOCK_ON  =3D 0xe,
+=09SALS_FNLOCK_OFF =3D 0xf,
 };
=20
 enum {
@@ -276,7 +286,7 @@ static int debugfs_status_show(struct seq_file *s, void=
 *data)
=20
 =09if (!method_gbmd(priv->adev->handle, &value)) {
 =09=09seq_printf(s, "Conservation mode:\t%s(%lu)\n",
-=09=09=09   test_bit(BM_CONSERVATION_BIT, &value) ? "On" : "Off",
+=09=09=09   test_bit(GBMD_CONSERVATION_STATE_BIT, &value) ? "On" : "Off",
 =09=09=09   value);
 =09}
=20
@@ -293,13 +303,13 @@ static int debugfs_cfg_show(struct seq_file *s, void =
*data)
 =09} else {
 =09=09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
 =09=09=09   priv->cfg);
-=09=09if (test_bit(CFG_BT_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "Bluetooth ");
-=09=09if (test_bit(CFG_3G_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "3G ");
-=09=09if (test_bit(CFG_WIFI_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "Wireless ");
-=09=09if (test_bit(CFG_CAMERA_BIT, &priv->cfg))
+=09=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "Camera ");
 =09=09seq_printf(s, "\nGraphic: ");
 =09=09switch ((priv->cfg)&0x700) {
@@ -459,7 +469,7 @@ static ssize_t conservation_mode_show(struct device *de=
v,
 =09err =3D method_gbmd(priv->adev->handle, &result);
 =09if (err)
 =09=09return err;
-=09return sysfs_emit(buf, "%u\n", test_bit(BM_CONSERVATION_BIT, &result));
+=09return sysfs_emit(buf, "%u\n", test_bit(GBMD_CONSERVATION_STATE_BIT, &r=
esult));
 }
=20
 static ssize_t conservation_mode_store(struct device *dev,
@@ -475,8 +485,8 @@ static ssize_t conservation_mode_store(struct device *d=
ev,
 =09=09return ret;
=20
 =09ret =3D method_int1(priv->adev->handle, "SBMC", state ?
-=09=09=09=09=09      BMCMD_CONSERVATION_ON :
-=09=09=09=09=09      BMCMD_CONSERVATION_OFF);
+=09=09=09=09=09      SMBC_CONSERVATION_ON :
+=09=09=09=09=09      SMBC_CONSERVATION_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -497,7 +507,7 @@ static ssize_t fn_lock_show(struct device *dev,
 =09=09return fail;
=20
 =09result =3D hals;
-=09return sysfs_emit(buf, "%u\n", test_bit(HA_FNLOCK_BIT, &result));
+=09return sysfs_emit(buf, "%u\n", test_bit(HALS_FNLOCK_STATE_BIT, &result)=
);
 }
=20
 static ssize_t fn_lock_store(struct device *dev,
@@ -513,8 +523,8 @@ static ssize_t fn_lock_store(struct device *dev,
 =09=09return ret;
=20
 =09ret =3D method_int1(priv->adev->handle, "SALS", state ?
-=09=09=09  HACMD_FNLOCK_ON :
-=09=09=09  HACMD_FNLOCK_OFF);
+=09=09=09  SALS_FNLOCK_ON :
+=09=09=09  SALS_FNLOCK_OFF);
 =09if (ret)
 =09=09return ret;
 =09return count;
@@ -541,7 +551,7 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09bool supported;
=20
 =09if (attr =3D=3D &dev_attr_camera_power.attr)
-=09=09supported =3D test_bit(CFG_CAMERA_BIT, &(priv->cfg));
+=09=09supported =3D test_bit(CFG_CAP_CAM_BIT, &priv->cfg);
 =09else if (attr =3D=3D &dev_attr_fan_mode.attr) {
 =09=09unsigned long value;
 =09=09supported =3D !read_ec_data(priv->adev->handle, VPCCMD_R_FAN,
@@ -574,9 +584,9 @@ struct ideapad_rfk_data {
 };
=20
 static const struct ideapad_rfk_data ideapad_rfk_data[] =3D {
-=09{ "ideapad_wlan",    CFG_WIFI_BIT, VPCCMD_W_WIFI, RFKILL_TYPE_WLAN },
-=09{ "ideapad_bluetooth", CFG_BT_BIT, VPCCMD_W_BT, RFKILL_TYPE_BLUETOOTH }=
,
-=09{ "ideapad_3g",        CFG_3G_BIT, VPCCMD_W_3G, RFKILL_TYPE_WWAN },
+=09{ "ideapad_wlan",      CFG_CAP_WIFI_BIT, VPCCMD_W_WIFI, RFKILL_TYPE_WLA=
N },
+=09{ "ideapad_bluetooth", CFG_CAP_BT_BIT,   VPCCMD_W_BT,   RFKILL_TYPE_BLU=
ETOOTH },
+=09{ "ideapad_3g",        CFG_CAP_3G_BIT,   VPCCMD_W_3G,   RFKILL_TYPE_WWA=
N },
 };
=20
 static int ideapad_rfk_set(void *data, bool blocked)
--=20
2.29.2


