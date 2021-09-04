Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57666400C5F
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237261AbhIDR4z (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:55 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:50580 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR4z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:55 -0400
Date:   Sat, 04 Sep 2021 17:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778150;
        bh=lREbwgd5tWBgTYiPbypGyk4DDt12HSCS8dEsEbVQOAA=;
        h=Date:To:From:Reply-To:Subject:From;
        b=G8/oZZSFcMZNcwdZqqtNwsUN+SMpB5EkpM/nqnFXGrdH4Dc9Hgioyib1CgCSomgB6
         vBBksao+1epG0sy/xCjder2aGWXJp9pKeAPIO7TOMGha0S6eMycequp1rCAffPE46+
         s9gTTPpPaR0vZHUA9VQ1cQ5jsq88MG+MszWrzNf8=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 15/30] platform/x86: wmi: make GUID block packed
Message-ID: <20210904175450.156801-16-pobrn@protonmail.com>
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

The `guid_block` struct is overlaid onto a buffer
coming from the _WDG ACPI object of the device.
For this reason mark the struct packed and add
assertions about sizes.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 28e5825cba8b..7db85a15f5f6 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -18,6 +18,7 @@

 #include <linux/acpi.h>
 #include <linux/bits.h>
+#include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -50,7 +51,10 @@ struct guid_block {
 =09};
 =09u8 instance_count;
 =09u8 flags;
-};
+} __packed;
+static_assert(sizeof(typeof_member(struct guid_block, guid)) =3D=3D 16);
+static_assert(sizeof(struct guid_block) =3D=3D 20);
+static_assert(__alignof__(struct guid_block) =3D=3D 1);

 struct wmi_block {
 =09struct wmi_device dev;
--
2.33.0


