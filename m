Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 095C12F51DA
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:22:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbhAMSWx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:22:53 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:19163 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbhAMSWx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:22:53 -0500
Date:   Wed, 13 Jan 2021 18:22:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562130;
        bh=+Umh2lh5adR8/pbRvi/Z2y7HSwLc7Tl+ieu9qagxOA4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=lpSuHPzQy3COJ4c0LUgUphCRace739X/FRPYCqlPhkQG+OOB/KX0/+7fb3Hh1iVmV
         yqicAdW3tqRWiKTf240LMvuB5tLGyILgTiYOEwebEULORFCrB2plJt9I5kuB+mVfZh
         pzb2XfIteQV+tC0zlpTCQPeAYhRjmIZ/SZqvK2XE=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 15/24] platform/x86: ideapad-laptop: check for touchpad support in _CFG
Message-ID: <20210113182016.166049-16-pobrn@protonmail.com>
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

Bit 30 of _CFG is set if the device has a touchpad, check that in
is_visible() for the touchpad attribute. Show 'touchpad', if supported,
in the list of capabilities in the 'cfg' debugfs file.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 640a00cc3944..057426729536 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -40,10 +40,11 @@ static const char *const ideapad_wmi_fnesc_events[] =3D=
 {
 #endif
=20
 enum {
-=09CFG_CAP_BT_BIT   =3D 16,
-=09CFG_CAP_3G_BIT   =3D 17,
-=09CFG_CAP_WIFI_BIT =3D 18,
-=09CFG_CAP_CAM_BIT  =3D 19,
+=09CFG_CAP_BT_BIT       =3D 16,
+=09CFG_CAP_3G_BIT       =3D 17,
+=09CFG_CAP_WIFI_BIT     =3D 18,
+=09CFG_CAP_CAM_BIT      =3D 19,
+=09CFG_CAP_TOUCHPAD_BIT =3D 30,
 };
=20
 enum {
@@ -319,6 +320,8 @@ static int debugfs_cfg_show(struct seq_file *s, void *d=
ata)
 =09=09=09seq_printf(s, "Wireless ");
 =09=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
 =09=09=09seq_printf(s, "Camera ");
+=09=09if (test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg))
+=09=09=09seq_printf(s, "Touchpad ");
 =09=09seq_printf(s, "\nGraphic: ");
 =09=09switch ((priv->cfg)&0x700) {
 =09=09case 0x100:
@@ -559,7 +562,8 @@ static umode_t ideapad_is_visible(struct kobject *kobj,
 =09else if (attr =3D=3D &dev_attr_fan_mode.attr)
 =09=09supported =3D priv->features.fan_mode;
 =09else if (attr =3D=3D &dev_attr_touchpad.attr)
-=09=09supported =3D priv->features.touchpad_ctrl_via_ec;
+=09=09supported =3D priv->features.touchpad_ctrl_via_ec
+=09=09=09    && test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg);
 =09else if (attr =3D=3D &dev_attr_conservation_mode.attr)
 =09=09supported =3D priv->features.conservation_mode;
 =09else if (attr =3D=3D &dev_attr_fn_lock.attr)
--=20
2.30.0


