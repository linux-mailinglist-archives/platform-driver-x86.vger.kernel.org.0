Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 146D130E53F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:57:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232246AbhBCVzx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:55:53 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:14442 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhBCVzu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:50 -0500
Date:   Wed, 03 Feb 2021 21:55:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389309;
        bh=uhVsg3wUltw4ZQwVc85owA2LXpbtaeadZAEmUDAT9SE=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=ICvsH8Fxao3nm50ePKMHCwwU89cwP4SqQnjIKY6DbOY2V+0z0IDZCtpA9n8r3RTK9
         8BGDBTxTkz5fGyZPxaEFPPIkZ2C/j3x78De827EJYHQOMOkTowLe5H4Hi9LUdla0r3
         Ho+LMfx+0jPHVeZGLW9lvNcKiU/0n3V1gl96Iqb0=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 07/29] platform/x86: ideapad-laptop: use device_{add,remove}_group
Message-ID: <20210203215403.290792-8-pobrn@protonmail.com>
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
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

Use device_{add,remove}_group instead of sysfs_{add,remove}_group.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 1a91588399f5..2153688012c3 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -924,14 +924,14 @@ static void ideapad_unregister_rfkill(struct ideapad_=
private *priv, int dev)
  */
 static int ideapad_sysfs_init(struct ideapad_private *priv)
 {
-=09return sysfs_create_group(&priv->platform_device->dev.kobj,
-=09=09=09=09    &ideapad_attribute_group);
+=09return device_add_group(&priv->platform_device->dev,
+=09=09=09=09&ideapad_attribute_group);
 }
=20
 static void ideapad_sysfs_exit(struct ideapad_private *priv)
 {
-=09sysfs_remove_group(&priv->platform_device->dev.kobj,
-=09=09=09   &ideapad_attribute_group);
+=09device_remove_group(&priv->platform_device->dev,
+=09=09=09    &ideapad_attribute_group);
 }
=20
 /*
--=20
2.30.0


