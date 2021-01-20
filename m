Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB9E52FD6F7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 20 Jan 2021 18:33:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727427AbhATOJe (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 20 Jan 2021 09:09:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37780 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728150AbhATMvR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jan 2021 07:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611146987;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=0Bfha2fbHfuW6W+tGSi5kKJFD6FiyXcrTmdCV77PGrk=;
        b=gbCYFLwsEjbPOWIGkxGmtSj7X3pJO1TTfXAmq4uAQBW5JXtf7Q7KmA/GhxyVG9QT8F/MV4
        kJ/qd5Xufa1HrWntqQciBTqUF7PCELz7ScEvFjKKrBt7+Ax9yg2o9i9s/HVvGwRp96JpaL
        y3RX36hk2W3yEl/N9UTANBIOatuBz6k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-38-b7NKc1P0MJucDehjzMYAnQ-1; Wed, 20 Jan 2021 07:49:45 -0500
X-MC-Unique: b7NKc1P0MJucDehjzMYAnQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3B9E839A00;
        Wed, 20 Jan 2021 12:49:44 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-1.ams2.redhat.com [10.36.114.1])
        by smtp.corp.redhat.com (Postfix) with ESMTP id DFA1E5D9C2;
        Wed, 20 Jan 2021 12:49:42 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        Elia Devito <eliadevito@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>
Subject: [PATCH] platform/x86: hp-wmi: Disable tablet-mode reporting by default
Date:   Wed, 20 Jan 2021 13:49:41 +0100
Message-Id: <20210120124941.73409-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Recently userspace has started making more use of SW_TABLET_MODE
(when an input-dev reports this).

Specifically recent GNOME3 versions will:

1.  When SW_TABLET_MODE is reported and is reporting 0:
1.1 Disable accelerometer-based screen auto-rotation
1.2 Disable automatically showing the on-screen keyboard when a
    text-input field is focussed

2.  When SW_TABLET_MODE is reported and is reporting 1:
2.1 Ignore input-events from the builtin keyboard and touchpad
    (this is for 360° hinges style 2-in-1s where the keyboard and
     touchpads are accessible on the back of the tablet when folded
     into tablet-mode)

This means that claiming to support SW_TABLET_MODE when it does not
actually work / reports correct values has bad side-effects.

The check in the hp-wmi code which is used to decide if the input-dev
should claim SW_TABLET_MODE support, only checks if the
HPWMI_HARDWARE_QUERY is supported. It does *not* check if the hardware
actually is capable of reporting SW_TABLET_MODE.

This leads to the hp-wmi input-dev claming SW_TABLET_MODE support,
while in reality it will always report 0 as SW_TABLET_MODE value.
This has been seen on a "HP ENVY x360 Convertible 15-cp0xxx" and
this likely is the case on a whole lot of other HP models.

This problem causes both auto-rotation and on-screen keyboard
support to not work on affected x360 models.

There is no easy fix for this, but since userspace expects
SW_TABLET_MODE reporting to be reliable when advertised it is
better to not claim/report SW_TABLET_MODE support at all, then
to claim to support it while it does not work.

To avoid the mentioned problems, add a new enable_tablet_mode_sw
module-parameter which defaults to false.

Note I've made this an int using the standard -1=auto, 0=off, 1=on
tripplet, with the hope that in the future we can come up with a
better way to detect SW_TABLET_MODE support. ATM the default
auto option just does the same as off.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1918255
Cc: Stefan Brüns <stefan.bruens@rwth-aachen.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/hp-wmi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 18bf8aeb5f87..ff028587cd21 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -32,6 +32,10 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
 MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 
+static int enable_tablet_mode_sw = -1;
+module_param(enable_tablet_mode_sw, int, 0444);
+MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
+
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 
@@ -654,10 +658,12 @@ static int __init hp_wmi_input_setup(void)
 	}
 
 	/* Tablet mode */
-	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
-	if (!(val < 0)) {
-		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
-		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
+	if (enable_tablet_mode_sw > 0) {
+		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
+		if (!(val < 0)) {
+			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
+			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
+		}
 	}
 
 	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
-- 
2.28.0

