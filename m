Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315F22F51DD
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:23:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728073AbhAMSXH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:23:07 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:22149 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727896AbhAMSXH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:07 -0500
Date:   Wed, 13 Jan 2021 18:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562145;
        bh=K2o8TvzMdYiUQqqneSHCCAo3Araw2IxZIDIwcE1UEbE=;
        h=Date:To:From:Reply-To:Subject:From;
        b=vwiDx2n+9YZ6zXdu5k/VvowV7UkbdcAg3et5TrxtubCGbvIiNBvCEAjgZVxP4uqzf
         W8e3qODhca34le2t+Z/jO2ImskHAWsKIgiYbJC79TvDo+Dcxt73k10/prjWRHohhr4
         oBJkWCDxEwjQV0fCRDHS6PdcVVWFy+Pvtqwl/26M=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 17/24] platform/x86: ideapad-laptop: change 'cfg' debugfs file format
Message-ID: <20210113182016.166049-18-pobrn@protonmail.com>
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

Return -ENODATA when the driver-specific data is not available.
Minor formatting changes. Use seq_puts() where possible.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index c72e967e9ac2..cd4dc4048d71 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -300,41 +300,44 @@ static int debugfs_cfg_show(struct seq_file *s, void =
*data)
 {
 =09struct ideapad_private *priv =3D s->private;
=20
-=09if (!priv) {
-=09=09seq_printf(s, "cfg: N/A\n");
-=09} else {
-=09=09seq_printf(s, "cfg: 0x%.8lX\n\nCapability: ",
-=09=09=09   priv->cfg);
-=09=09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Bluetooth ");
-=09=09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "3G ");
-=09=09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Wireless ");
-=09=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Camera ");
-=09=09if (test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg))
-=09=09=09seq_printf(s, "Touchpad ");
-=09=09seq_printf(s, "\nGraphic: ");
-=09=09switch ((priv->cfg)&0x700) {
-=09=09case 0x100:
-=09=09=09seq_printf(s, "Intel");
-=09=09=09break;
-=09=09case 0x200:
-=09=09=09seq_printf(s, "ATI");
-=09=09=09break;
-=09=09case 0x300:
-=09=09=09seq_printf(s, "Nvidia");
-=09=09=09break;
-=09=09case 0x400:
-=09=09=09seq_printf(s, "Intel and ATI");
-=09=09=09break;
-=09=09case 0x500:
-=09=09=09seq_printf(s, "Intel and Nvidia");
-=09=09=09break;
-=09=09}
-=09=09seq_printf(s, "\n");
+=09if (!priv)
+=09=09return -ENODATA;
+
+=09seq_printf(s, "_CFG: %#010lx\n\n", priv->cfg);
+
+=09seq_puts(s, "Capabilities:");
+=09if (test_bit(CFG_CAP_BT_BIT, &priv->cfg))
+=09=09seq_puts(s, " bluetooth");
+=09if (test_bit(CFG_CAP_3G_BIT, &priv->cfg))
+=09=09seq_puts(s, " 3G");
+=09if (test_bit(CFG_CAP_WIFI_BIT, &priv->cfg))
+=09=09seq_puts(s, " wifi");
+=09if (test_bit(CFG_CAP_CAM_BIT, &priv->cfg))
+=09=09seq_puts(s, " camera");
+=09if (test_bit(CFG_CAP_TOUCHPAD_BIT, &priv->cfg))
+=09=09seq_puts(s, " touchpad");
+=09seq_puts(s, "\n");
+
+=09seq_puts(s, "Graphics:");
+=09switch (priv->cfg & 0x700) {
+=09case 0x100:
+=09=09seq_puts(s, "Intel");
+=09=09break;
+=09case 0x200:
+=09=09seq_puts(s, "ATI");
+=09=09break;
+=09case 0x300:
+=09=09seq_puts(s, "Nvidia");
+=09=09break;
+=09case 0x400:
+=09=09seq_puts(s, "Intel and ATI");
+=09=09break;
+=09case 0x500:
+=09=09seq_puts(s, "Intel and Nvidia");
+=09=09break;
 =09}
+=09seq_puts(s, "\n");
+
 =09return 0;
 }
 DEFINE_SHOW_ATTRIBUTE(debugfs_cfg);
--=20
2.30.0

