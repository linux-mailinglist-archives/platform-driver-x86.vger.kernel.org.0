Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06B271CC17D
	for <lists+platform-driver-x86@lfdr.de>; Sat,  9 May 2020 14:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726782AbgEIMy4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 9 May 2020 08:54:56 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:27345 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727051AbgEIMy4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 May 2020 08:54:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589028895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=wMK123CamSl6E9o/JU4tzacuh0f0gyIhBo+V+rDJHzw=;
        b=AtTHGoihywHSYfhRaCvBw+CL4D9gsoN1mIdZjm3saIcRuhV1z0TaENz2OrReCTGlB52qCL
        NdmBIIbaZdDhsWlAdTEcNI3nUHrIl9RkZL6p+QgZARa67tfQgWU8goDn4IF0RwFIZ2VBgs
        1vghyBW9nVgXnvq8dXK+uP7Mf2oh7iA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-weYRQr0oN1elv8vdnqi3bQ-1; Sat, 09 May 2020 08:54:53 -0400
X-MC-Unique: weYRQr0oN1elv8vdnqi3bQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 635BB800D24;
        Sat,  9 May 2020 12:54:52 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-112-85.ams2.redhat.com [10.36.112.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1EAA925277;
        Sat,  9 May 2020 12:54:50 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-nb-wmi: Revert "Do not load on Asus T100TA and T200TA"
Date:   Sat,  9 May 2020 14:54:49 +0200
Message-Id: <20200509125449.179412-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The WMI INIT method on for some reason turns on the camera LED on these
2-in-1s, without the WMI interface allowing further control over the LED.

To fix this commit b5f7311d3a2e ("platform/x86: asus-nb-wmi: Do not load
on Asus T100TA and T200TA") added a blacklist with these 2 models on it
since the WMI driver did not add any extra functionality to these models.

Recently I've been working on making more 2-in-1 models report their
tablet-mode (SW_TABLET_MODE) to userspace; and I've found that these 2
Asus models report this through WMI. This commit reverts the adding
of the blacklist, so that the Asus WMI driver can be used on these
models to report their tablet-mode.

Note, not calling INIT is also not an option, because then we will not
receive events when the tablet-mode changes. So the LED issue will need
to be fixed somewhere else entirely.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index c4404d9c1de4..6f12747a359a 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -515,33 +515,9 @@ static struct asus_wmi_driver asus_nb_wmi_driver = {
 	.detect_quirks = asus_nb_wmi_quirks,
 };
 
-static const struct dmi_system_id asus_nb_wmi_blacklist[] __initconst = {
-	{
-		/*
-		 * asus-nb-wm adds no functionality. The T100TA has a detachable
-		 * USB kbd, so no hotkeys and it has no WMI rfkill; and loading
-		 * asus-nb-wm causes the camera LED to turn and _stay_ on.
-		 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
-		},
-	},
-	{
-		/* The Asus T200TA has the same issue as the T100TA */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T200TA"),
-		},
-	},
-	{} /* Terminating entry */
-};
 
 static int __init asus_nb_wmi_init(void)
 {
-	if (dmi_check_system(asus_nb_wmi_blacklist))
-		return -ENODEV;
-
 	return asus_wmi_register_driver(&asus_nb_wmi_driver);
 }
 
-- 
2.26.0

