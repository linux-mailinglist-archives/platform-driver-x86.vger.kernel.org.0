Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF30400C5B
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237282AbhIDR4i (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:38 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:34873 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237315AbhIDR4h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:37 -0400
Date:   Sat, 04 Sep 2021 17:55:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778134;
        bh=V3MUI41oPSiBTR7vqp7YpLb51SSbdHKCP40u45ED/Xg=;
        h=Date:To:From:Reply-To:Subject:From;
        b=MUlbNCW23WhzIGU6qJ9Etw70qiYrB9Sw3YxKyFMx0PGwMtUMaTp4uptRZruw7fLYg
         CX+VvbwsB4iFwXkbDTJN27+kIwTdZdHUXFwiBLpDVcYr+Fz2BCp0KVcyCkHoOkrY/w
         sbfmvTLhW5YBix+z7VKXfsxB5CplSndZyYlI7mCw=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 11/30] platform/x86: wmi: use BIT() macro
Message-ID: <20210904175450.156801-12-pobrn@protonmail.com>
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

Instead of manually creating the bit masks,
use the `BIT()` macro to do it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 46ebc4e421b4..029278775ebc 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -17,6 +17,7 @@
 #define pr_fmt(fmt)=09KBUILD_MODNAME ": " fmt

 #include <linux/acpi.h>
+#include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -70,10 +71,10 @@ struct wmi_block {
  * If the GUID data block is marked as expensive, we must enable and
  * explicitily disable data collection.
  */
-#define ACPI_WMI_EXPENSIVE   0x1
-#define ACPI_WMI_METHOD      0x2=09/* GUID is a method */
-#define ACPI_WMI_STRING      0x4=09/* GUID takes & returns a string */
-#define ACPI_WMI_EVENT       0x8=09/* GUID is an event */
+#define ACPI_WMI_EXPENSIVE   BIT(0)
+#define ACPI_WMI_METHOD      BIT(1)=09/* GUID is a method */
+#define ACPI_WMI_STRING      BIT(2)=09/* GUID takes & returns a string */
+#define ACPI_WMI_EVENT       BIT(3)=09/* GUID is an event */

 static bool debug_event;
 module_param(debug_event, bool, 0444);
--
2.33.0


