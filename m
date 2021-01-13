Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975732F51D5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:22:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727963AbhAMSVr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:21:47 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:22598 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727851AbhAMSVr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:21:47 -0500
Date:   Wed, 13 Jan 2021 18:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562065;
        bh=MEcMsH5SPU91xLKxQanVZutXXkK5HhSF/dd5d5D2Ce0=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=UPf8fcxr/X+Otb5//dw9SthhPcWYT0PNhnrbaZmD21L2qspuelt115sExP+pWuczI
         4CTL8bEHRxOO8MoB2/9kMTQGOrf4sauGwDFsZ2nEjEUMMcgYFk0Hl2shFC+SSmWdyI
         DSnn75TtGM4b/ZAovAexuCfKuz1HcdOXFFWigD10=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 06/24] platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of hand-crafted formula
Message-ID: <20210113182016.166049-7-pobrn@protonmail.com>
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

The current code used a hand-crafted formulate to convert milliseconds to
jiffies, replace it with the msecs_to_jiffies() function.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 29e91942c756..174edbfc52dc 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -19,6 +19,7 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -190,7 +191,7 @@ static int read_ec_data(acpi_handle handle, int cmd, un=
signed long *data)
 =09if (method_vpcw(handle, 1, cmd))
 =09=09return -1;
=20
-=09for (end_jiffies =3D jiffies+(HZ)*IDEAPAD_EC_TIMEOUT/1000+1;
+=09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
 =09=09if (method_vpcr(handle, 1, &val))
@@ -216,7 +217,7 @@ static int write_ec_cmd(acpi_handle handle, int cmd, un=
signed long data)
 =09if (method_vpcw(handle, 1, cmd))
 =09=09return -1;
=20
-=09for (end_jiffies =3D jiffies+(HZ)*IDEAPAD_EC_TIMEOUT/1000+1;
+=09for (end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1=
;
 =09     time_before(jiffies, end_jiffies);) {
 =09=09schedule();
 =09=09if (method_vpcr(handle, 1, &val))
--=20
2.30.0

