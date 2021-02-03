Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A151130E54D
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:57:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232489AbhBCV5X (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:57:23 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:60287 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232437AbhBCV5T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:19 -0500
Date:   Wed, 03 Feb 2021 21:56:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389396;
        bh=C1CXhYIg7zEljs/5GMK80XZju6QJkZ3iED1hMTJ9fmI=;
        h=Date:To:From:Reply-To:Subject:From;
        b=g5+H2ycq077PB8GrP0eHGN+PmK/Mbq2SJqGXe4NGHOW279BNza0WGgeaLBfHR8EaB
         d2ZS0+n/+W1ceRZumAZyDtBA2EFoVCCuuweD0X1rMeicNUVpYjY8iVBR8oYyVcS0vR
         7KQLXm2l7Cfrb+ZfVQUr24gI3g5OuOekdchFk9DE=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 21/29] platform/x86: ideapad-laptop: change 'status' debugfs file format
Message-ID: <20210203215403.290792-22-pobrn@protonmail.com>
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

Remove conservation mode reporting since it is already reported via
the appropriate device attribute, and its state can be deduced from
the value of GBMD. Add the return value of the GBMD and HALS ACPI
methods to the output. Use seq_puts() where possible.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index abb283cee47c..34e93ac83d8e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -286,40 +286,33 @@ static int debugfs_status_show(struct seq_file *s, vo=
id *data)
 =09unsigned long value;
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_MAX, &value))
-=09=09seq_printf(s, "Backlight max:\t%lu\n", value);
+=09=09seq_printf(s, "Backlight max:  %lu\n", value);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL, &value))
-=09=09seq_printf(s, "Backlight now:\t%lu\n", value);
+=09=09seq_printf(s, "Backlight now:  %lu\n", value);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BL_POWER, &value))
-=09=09seq_printf(s, "BL power value:\t%s\n", value ? "On" : "Off");
-=09seq_printf(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
+=09=09seq_printf(s, "BL power value: %s (%lu)\n", value ? "on" : "off", va=
lue);
+=09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_RF, &value))
-=09=09seq_printf(s, "Radio status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Radio status: %s (%lu)\n", value ? "on" : "off", valu=
e);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_WIFI, &value))
-=09=09seq_printf(s, "Wifi status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Wifi status:  %s (%lu)\n", value ? "on" : "off", valu=
e);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_BT, &value))
-=09=09seq_printf(s, "BT status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "BT status:    %s (%lu)\n", value ? "on" : "off", valu=
e);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_3G, &value))
-=09=09seq_printf(s, "3G status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
-=09seq_printf(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D\n");
+=09=09seq_printf(s, "3G status:    %s (%lu)\n", value ? "on" : "off", valu=
e);
+=09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_TOUCHPAD, &value))
-=09=09seq_printf(s, "Touchpad status:%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Touchpad status: %s (%lu)\n", value ? "on" : "off", v=
alue);
 =09if (!read_ec_data(priv->adev->handle, VPCCMD_R_CAMERA, &value))
-=09=09seq_printf(s, "Camera status:\t%s(%lu)\n",
-=09=09=09   value ? "On" : "Off", value);
+=09=09seq_printf(s, "Camera status:   %s (%lu)\n", value ? "on" : "off", v=
alue);
 =09seq_puts(s, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D\n");
=20
-=09if (!eval_gbmd(priv->adev->handle, &value)) {
-=09=09seq_printf(s, "Conservation mode:\t%s(%lu)\n",
-=09=09=09   test_bit(GBMD_CONSERVATION_STATE_BIT, &value) ? "On" : "Off",
-=09=09=09   value);
-=09}
+=09if (!eval_gbmd(priv->adev->handle, &value))
+=09=09seq_printf(s, "GBMD: %#010lx\n", value);
+=09if (!eval_hals(priv->adev->handle, &value))
+=09=09seq_printf(s, "HALS: %#010lx\n", value);
=20
 =09return 0;
 }
--=20
2.30.0


