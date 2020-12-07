Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3AEF2D16D9
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Dec 2020 17:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726311AbgLGQxC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Dec 2020 11:53:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45723 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725832AbgLGQxC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 11:53:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607359895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=MZNQEcW63rGx3RKhm2wdWiBZGySqyRjrXxJEfWFy4js=;
        b=HYtJNBVNqAscn7pM3nysZN45lVCnbr5PbH7uZcqj7psMVq5SLsXUgvzAj727yMM4ymf4Wi
        w/5GUBNVlmQ+2nPseSPaCEhtSkUdm97nDzLMk27h6cjFMlr3QlUylyyTTPbMW3egipHvdI
        wKmdU1koD65FslwC+bPJKU46m/dpFEw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-RYzYoTkJPaSYfil9mBs9Wg-1; Mon, 07 Dec 2020 11:51:32 -0500
X-MC-Unique: RYzYoTkJPaSYfil9mBs9Wg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26E10100C602;
        Mon,  7 Dec 2020 16:51:31 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-114.ams2.redhat.com [10.36.112.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 12AD65B4A1;
        Mon,  7 Dec 2020 16:51:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Elia Devito <eliadevito@gmail.com>
Subject: [PATCH] platform/x86: intel-hid: Do not create SW_TABLET_MODE input-dev when a KIOX010A ACPI dev is present
Date:   Mon,  7 Dec 2020 17:51:29 +0100
Message-Id: <20201207165129.396298-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some 360 degree hinges (yoga) style 2-in-1 devices use 2 accelerometers
to allow the OS to determine the angle between the display and the base
of the device. On Windows these are read by a special HingeAngleService
process which calls an ACPI DSM (Device Specific Method) on the
ACPI KIOX010A device node for the sensor in the display, to let the
firmware know if the 2-in-1 is in tablet- or laptop-mode so that it can
disable the kbd and touchpad to avoid spurious input in tablet-mode.

The linux kxcjk1013 driver calls the DSM for this once at probe time
to ensure that the builtin kbd and touchpad work. On some devices this
causes a "spurious" 0xcd event on the intel-hid ACPI dev. In this case
there is not a functional tablet-mode switch, so we should not register
the tablet-mode switch device.

Cc: Elia Devito <eliadevito@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-hid.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 66ccdc17a64d..4a396ef54d2e 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -441,8 +441,23 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	 * Some convertible have unreliable VGBS return which could cause incorrect
 	 * SW_TABLET_MODE report, in these cases we enable support when receiving
 	 * the first event instead of during driver setup.
+	 *
+	 * Some 360 degree hinges (yoga) style 2-in-1 devices use 2 accelerometers
+	 * to allow the OS to determine the angle between the display and the base
+	 * of the device. On Windows these are read by a special HingeAngleService
+	 * process which calls an ACPI DSM (Device Specific Method) on the
+	 * ACPI KIOX010A device node for the sensor in the display, to let the
+	 * firmware know if the 2-in-1 is in tablet- or laptop-mode so that it can
+	 * disable the kbd and touchpad to avoid spurious input in tablet-mode.
+	 *
+	 * The linux kxcjk1013 driver calls the DSM for this once at probe time
+	 * to ensure that the builtin kbd and touchpad work. On some devices this
+	 * causes a "spurious" 0xcd event on the intel-hid ACPI dev. In this case
+	 * there is not a functional tablet-mode switch, so we should not register
+	 * the tablet-mode switch device.
 	 */
-	if (!priv->switches && (event == 0xcc || event == 0xcd)) {
+	if (!priv->switches && (event == 0xcc || event == 0xcd) &&
+	    !acpi_dev_present("KIOX010A", NULL, -1)) {
 		dev_info(&device->dev, "switch event received, enable switches supports\n");
 		err = intel_hid_switches_setup(device);
 		if (err)
-- 
2.28.0

