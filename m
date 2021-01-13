Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF0FF2F51CF
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:21:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbhAMSV2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:21:28 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:19520 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbhAMSV2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:21:28 -0500
Date:   Wed, 13 Jan 2021 18:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562044;
        bh=QxZoSSn4vJAFzWA8ldV4HrL5vzLpbF2pOA2Z50GPnIQ=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=karPq8lzJM/ApXmlDDSp6eeKZbLZgtCSvQQVhXfL6whuLi3NFxxhj+kBebncHwMsa
         V48Wid1d5lMCqGDnuc+qv+EdsY41N9jI7AQ1RsqIfhaXZ5bLjXphkD9g1THcdn5bP3
         ZU0dd46ZqdlYMw4l+3MKTO1BLB72e8M469HoEEI8=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 03/24] platform/x86: ideapad-laptop: sort includes lexicographically
Message-ID: <20210113182016.166049-4-pobrn@protonmail.com>
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

Managing includes is easier when they are sorted, so
sort them lexicographically.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index fbaf8d3f4792..d92d96fe4aa1 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -8,22 +8,23 @@
=20
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
=20
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/init.h>
-#include <linux/types.h>
 #include <linux/acpi.h>
-#include <linux/rfkill.h>
-#include <linux/platform_device.h>
-#include <linux/input.h>
-#include <linux/input/sparse-keymap.h>
 #include <linux/backlight.h>
-#include <linux/fb.h>
 #include <linux/debugfs.h>
-#include <linux/seq_file.h>
-#include <linux/i8042.h>
-#include <linux/dmi.h>
 #include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/fb.h>
+#include <linux/i8042.h>
+#include <linux/init.h>
+#include <linux/input.h>
+#include <linux/input/sparse-keymap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/rfkill.h>
+#include <linux/seq_file.h>
+#include <linux/types.h>
+
 #include <acpi/video.h>
=20
 #define IDEAPAD_RFKILL_DEV_NUM=09(3)
--=20
2.30.0


