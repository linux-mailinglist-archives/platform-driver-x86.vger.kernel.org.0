Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF48030E543
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhBCV40 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:56:26 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:38261 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232324AbhBCV4U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:56:20 -0500
Date:   Wed, 03 Feb 2021 21:55:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389335;
        bh=5BojEyWqgjIwpmsO6GiMVDIqgbvxL5yh3ZgG6Fg1kdM=;
        h=Date:To:From:Reply-To:Subject:From;
        b=Ma2h6TWoKglZN2HtzzFk87CwqrPVIzGawR283Muwn7w4F6LQuS+OySDKKc62tdFfx
         cJhAx/UQZRcgP1TDEiKeMMGNbYXSmEOHqV3FYEt5YARzqGepQbo/j0kQRO2r8fTRbT
         IeReXdg81JHMeMK/R/CMlbyLXl18JJdXZMO1FGnY=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 10/29] platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of hand-crafted formula
Message-ID: <20210203215403.290792-11-pobrn@protonmail.com>
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

The current code used a hand-crafted formula to convert milliseconds to
jiffies, replace it with the msecs_to_jiffies() function. Furthermore,
use a while loop instead of for loop for shorter lines and simplicity.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 5978770bac2a..bb7eb9c1f0ec 100644
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
@@ -221,8 +222,9 @@ static int read_ec_data(acpi_handle handle, int cmd, un=
signed long *data)
 =09if (method_vpcw(handle, 1, cmd))
 =09=09return -1;
=20
-=09for (end_jiffies =3D jiffies+(HZ)*IDEAPAD_EC_TIMEOUT/1000+1;
-=09     time_before(jiffies, end_jiffies);) {
+=09end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+=09while (time_before(jiffies, end_jiffies)) {
 =09=09schedule();
 =09=09if (method_vpcr(handle, 1, &val))
 =09=09=09return -1;
@@ -247,8 +249,9 @@ static int write_ec_cmd(acpi_handle handle, int cmd, un=
signed long data)
 =09if (method_vpcw(handle, 1, cmd))
 =09=09return -1;
=20
-=09for (end_jiffies =3D jiffies+(HZ)*IDEAPAD_EC_TIMEOUT/1000+1;
-=09     time_before(jiffies, end_jiffies);) {
+=09end_jiffies =3D jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+=09while (time_before(jiffies, end_jiffies)) {
 =09=09schedule();
 =09=09if (method_vpcr(handle, 1, &val))
 =09=09=09return -1;
--=20
2.30.0


