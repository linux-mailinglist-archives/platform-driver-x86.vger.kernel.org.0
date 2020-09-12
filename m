Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FB65267931
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Sep 2020 11:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgILJfl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 12 Sep 2020 05:35:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:23966 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725821AbgILJfk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Sep 2020 05:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599903338;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=8M4xcMbVi+ITipNtH1BBbx2fU/X6Y4zk7dozEXlysJA=;
        b=i+IoVmmVhtrGhi81cSkLEUwm2AAdZk60EGrq36IbuRlR8ASuJl6w/qbTO6CPxRfRekpdg1
        jkJu1ITsaR+RQrW3Y9cnY0akfKIFN/+H7Wy4uRh6Ent3Xc+DKOJdJMpkU2QgVOabp27a6v
        XSzMY5HILjM/gk/A8KwyA0Q1CRLoyM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-BK8SGSUTMTiUa1i3PDwAHA-1; Sat, 12 Sep 2020 05:35:36 -0400
X-MC-Unique: BK8SGSUTMTiUa1i3PDwAHA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE7141005E66;
        Sat, 12 Sep 2020 09:35:35 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-42.ams2.redhat.com [10.36.112.42])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 80F537FB9B;
        Sat, 12 Sep 2020 09:35:33 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on the HP Pavilion 11 x360
Date:   Sat, 12 Sep 2020 11:35:32 +0200
Message-Id: <20200912093532.18522-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist
SW_TABLET_MODE on the 9 / "Laptop" chasis-type") restored SW_TABLET_MODE
reporting on the HP stream x360 11 series on which it was previously broken
by commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet
mode switch on 2-in-1's").

It turns out that enabling SW_TABLET_MODE reporting on devices with a
chassis-type of 10 ("Notebook") causes SW_TABLET_MODE to always report 1
at boot on the HP Pavilion 11 x360, which causes libinput to disable the
kbd and touchpad.

The HP Pavilion 11 x360's ACPI VGBS method sets bit 4 instead of bit 6 when
NOT in tablet mode at boot. Inspecting all the DSDTs in my DSDT collection
shows only one other model, the Medion E1239T ever setting bit 4 and it
always sets this together with bit 6.

So lets treat bit 4 as a second bit which when set indicates the device not
being in tablet-mode, as we already do for bit 6.

While at it also prefix all VGBS constant defines with "VGBS_".

Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index e85d8e58320c..f443619e1e7e 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -15,9 +15,13 @@
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
 
+/* Returned when NOT in tablet mode on some HP Stream x360 11 models */
+#define VGBS_TABLET_MODE_FLAG_ALT	0x10
 /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
-#define TABLET_MODE_FLAG 0x40
-#define DOCK_MODE_FLAG   0x80
+#define VGBS_TABLET_MODE_FLAG		0x40
+#define VGBS_DOCK_MODE_FLAG		0x80
+
+#define VGBS_TABLET_MODE_FLAGS (VGBS_TABLET_MODE_FLAG | VGBS_TABLET_MODE_FLAG_ALT)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("AceLan Kao");
@@ -72,9 +76,9 @@ static void detect_tablet_mode(struct platform_device *device)
 	if (ACPI_FAILURE(status))
 		return;
 
-	m = !(vgbs & TABLET_MODE_FLAG);
+	m = !(vgbs & VGBS_TABLET_MODE_FLAGS);
 	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
-	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
+	m = (vgbs & VGBS_DOCK_MODE_FLAG) ? 1 : 0;
 	input_report_switch(priv->input_dev, SW_DOCK, m);
 }
 
-- 
2.28.0

