Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1EA127E95A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 30 Sep 2020 15:19:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbgI3NT0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 30 Sep 2020 09:19:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39949 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730196AbgI3NTZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 30 Sep 2020 09:19:25 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1601471964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=RIocyIH5TM1CquW+XeAA7U4cDzR9OkO33qtNeVVGrc4=;
        b=RhNWfdjEvZi1JnBvFVulZaHB4ojtQckqV1FjtM9aJdS0YP5A/4cww/AKalXGXGYI8XtuUx
        31HGWw6rL4vqMm/JvF/jt50y2Vu350929bdq5AjfV7/UL6MyNNKpD178CeP9Dhl5dPiEgS
        T8mJBU6VwAwvGGv3fiozx5PyE1W1FVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-gcN09XdaMdCXmDeJOAutEw-1; Wed, 30 Sep 2020 09:19:09 -0400
X-MC-Unique: gcN09XdaMdCXmDeJOAutEw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47EE68015F5;
        Wed, 30 Sep 2020 13:19:08 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-230.ams2.redhat.com [10.36.114.230])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B2F8019D61;
        Wed, 30 Sep 2020 13:19:06 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        platform-driver-x86@vger.kernel.org,
        Barnab1s PY1cze <pobrn@protonmail.com>,
        Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] platform/x86: intel-vbtn: Switch to an allow-list for SW_TABLET_MODE reporting
Date:   Wed, 30 Sep 2020 15:19:05 +0200
Message-Id: <20200930131905.48924-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2 recent commits:
cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE
on the 9 / "Laptop" chasis-type")
1fac39fd0316 ("platform/x86: intel-vbtn: Also handle tablet-mode switch on
"Detachable" and "Portable" chassis-types")

Enabled reporting of SW_TABLET_MODE on more devices since the vbtn ACPI
interface is used by the firmware on some of those devices to report this.

Testing has shown that unconditionally enabling SW_TABLET_MODE reporting
on all devices with a chassis type of 8 ("Portable") or 10 ("Notebook")
which support the VGBS method is a very bad idea.

Many of these devices are normal laptops (non 2-in-1) models with a VGBS
which always returns 0, which we translate to SW_TABLET_MODE=1. This in
turn causes userspace (libinput) to suppress events from the builtin
keyboard and touchpad, making the laptop essentially unusable.

Since the problem of wrongly reporting SW_TABLET_MODE=1 in combination
with libinput, leads to a non-usable system. Where as OTOH many people will
not even notice when SW_TABLET_MODE is not being reported, this commit
changes intel_vbtn_has_switches() to use a DMI based allow-list.

The new DMI based allow-list matches on the 31 ("Convertible") and
32 ("Detachable") chassis-types, as these clearly are 2-in-1s and
so far if they support the intel-vbtn ACPI interface they all have
properly working SW_TABLET_MODE reporting.

Besides these 2 generic matches, it also contains model specific matches
for 2-in-1 models which use a different chassis-type and which are known
to have properly working SW_TABLET_MODE reporting.

This has been tested on the following 2-in-1 devices:

Dell Venue 11 Pro 7130 vPro
HP Pavilion X2 10-p002nd
HP Stream x360 Convertible PC 11
Medion E1239T

Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type")
BugLink: https://forum.manjaro.org/t/keyboard-and-touchpad-only-work-on-kernel-5-6/22668
BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1175599
Cc: Barnab1s PY1cze <pobrn@protonmail.com>
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 52 +++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index e85d8e58320c..f5901b0b07cd 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -167,20 +167,54 @@ static bool intel_vbtn_has_buttons(acpi_handle handle)
 	return ACPI_SUCCESS(status);
 }
 
+/*
+ * There are several laptops (non 2-in-1) models out there which support VGBS,
+ * but simply always return 0, which we translate to SW_TABLET_MODE=1. This in
+ * turn causes userspace (libinput) to suppress events from the builtin
+ * keyboard and touchpad, making the laptop essentially unusable.
+ *
+ * Since the problem of wrongly reporting SW_TABLET_MODE=1 in combination
+ * with libinput, leads to a non-usable system. Where as OTOH many people will
+ * not even notice when SW_TABLET_MODE is not being reported, a DMI based allow
+ * list is used here. This list mainly matches on the chassis-type of 2-in-1s.
+ *
+ * There are also some 2-in-1s which use the intel-vbtn ACPI interface to report
+ * SW_TABLET_MODE with a chassis-type of 8 ("Portable") or 10 ("Notebook"),
+ * these are matched on a per model basis, since many normal laptops with a
+ * possible broken VGBS ACPI-method also use these chassis-types.
+ */
+static const struct dmi_system_id dmi_switches_allow_list[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "31" /* Convertible */),
+		},
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_CHASSIS_TYPE, "32" /* Detachable */),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Venue 11 Pro 7130"),
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Stream x360 Convertible PC 11"),
+		},
+	},
+	{} /* Array terminator */
+};
+
 static bool intel_vbtn_has_switches(acpi_handle handle)
 {
-	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
 	unsigned long long vgbs;
 	acpi_status status;
 
-	/*
-	 * Some normal laptops have a VGBS method despite being non-convertible
-	 * and their VGBS method always returns 0, causing detect_tablet_mode()
-	 * to report SW_TABLET_MODE=1 to userspace, which causes issues.
-	 * These laptops have a DMI chassis_type of 9 ("Laptop"), do not report
-	 * switches on any devices with a DMI chassis_type of 9.
-	 */
-	if (chassis_type && strcmp(chassis_type, "9") == 0)
+	if (!dmi_check_system(dmi_switches_allow_list))
 		return false;
 
 	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
-- 
2.28.0

