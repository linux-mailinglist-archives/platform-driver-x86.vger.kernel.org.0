Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B42F30E535
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:55:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231868AbhBCVzZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:55:25 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:10997 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhBCVzY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:24 -0500
Date:   Wed, 03 Feb 2021 21:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389281;
        bh=T3ugBCX4TFAf26kXNuKtpVS5/dvFV1Zc5GJK+FnEgRg=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=djtSMata//yzU7U6mllcqdQ9E7wJYuOPmWnv3lNFe/OIAGt2Fa3Pao8u1GVcUoxOL
         ifNzIdhhSYieosh4Cd1XxLS8/oOj4h9KwlB+G6SF9Fa39juOcRou8QG1BeeWnEml0f
         EbRFxbweLw1/ybQIiliDOSg/7l75EKr9TswEcc5Q=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 04/29] platform/x86: ideapad-laptop: sort includes lexicographically
Message-ID: <20210203215403.290792-5-pobrn@protonmail.com>
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

Managing includes is easier when they are
sorted, so sort them lexicographically.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 6c1ed5153a37..e3016c18e88e 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -8,23 +8,24 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
+#include <linux/acpi.h>
+#include <linux/backlight.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/fb.h>
+#include <linux/i8042.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/acpi.h>
-#include <linux/rfkill.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
-#include <linux/input.h>
-#include <linux/input/sparse-keymap.h>
-#include <linux/backlight.h>
-#include <linux/fb.h>
-#include <linux/debugfs.h>
+#include <linux/rfkill.h>
 #include <linux/seq_file.h>
-#include <linux/i8042.h>
-#include <linux/dmi.h>
-#include <linux/device.h>
+#include <linux/types.h>
+
 #include <acpi/video.h>
=20
 #define IDEAPAD_RFKILL_DEV_NUM=09(3)
--=20
2.30.0


