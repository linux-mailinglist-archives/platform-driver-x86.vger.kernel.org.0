Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A499B45B013
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Nov 2021 00:27:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbhKWXaZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 23 Nov 2021 18:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240237AbhKWXaU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Nov 2021 18:30:20 -0500
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60E6C061574;
        Tue, 23 Nov 2021 15:27:11 -0800 (PST)
From:   =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1637710028;
        bh=SZYLz9pODZYhp1MPf438WzgYeqxIh6cyZNNo+eLNyiI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hWN8rkyGx/czcemUfLKEY/DftrxEJYrMHZqBUsVqt91Ak4lgZ6b33Dg99Va0FwvId
         5anYDVmzroeWtQeN8C2gkXn3faA6P8N7JWnykqxOc5n33wifVz0d+ujVTiv9LEV2XP
         PUZWr7qcm8ZAOk59SUxd0d+d7rrjQLfMYU4WSovM=
To:     linux-pm@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org, linrunner@gmx.net, bberg@redhat.com,
        hadess@hadess.net, markpearson@lenovo.com,
        nicolopiazzalunga@gmail.com, njoshi1@lenovo.com, smclt30p@gmail.com
Subject: [PATCH v2 1/4] power: supply: add charge_behaviour attributes
Date:   Wed, 24 Nov 2021 00:27:01 +0100
Message-Id: <20211123232704.25394-2-linux@weissschuh.net>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211123232704.25394-1-linux@weissschuh.net>
References: <20211123232704.25394-1-linux@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637710019; l=2492; s=20211113; h=from:subject; bh=SZYLz9pODZYhp1MPf438WzgYeqxIh6cyZNNo+eLNyiI=; b=wEL2amfTqT1FYd22a4d7WEiSv3LHb/lYYaZ7ZkQQhWQcBIuUWr92Dru0OR29hjho/e3lJMWFXUQR p6TSb02cDo2UtQok+PIrNP2zesS2ITVHAJU1u3lqwBsslWPDjf8O
X-Developer-Key: i=linux@weissschuh.net; a=ed25519; pk=9LP6KM4vD/8CwHW7nouRBhWLyQLcK1MkP6aTZbzUlj4=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This a revised version of
"[RFC] add standardized attributes for force_discharge and inhibit_charge" [0],
incorporating discussion results.

The biggest change is the switch from two boolean attributes to a single
enum attribute.

[0] https://lore.kernel.org/platform-driver-x86/21569a89-8303-8573-05fb-c2fec29983d1@gmail.com/

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 Documentation/ABI/testing/sysfs-class-power | 14 ++++++++++++++
 include/linux/power_supply.h                |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
index f7904efc4cfa..cece094764f8 100644
--- a/Documentation/ABI/testing/sysfs-class-power
+++ b/Documentation/ABI/testing/sysfs-class-power
@@ -455,6 +455,20 @@ Description:
 			      "Unknown", "Charging", "Discharging",
 			      "Not charging", "Full"
 
+What:		/sys/class/power_supply/<supply_name>/charge_behaviour
+Date:		November 2021
+Contact:	linux-pm@vger.kernel.org
+Description:
+		Represents the charging behaviour.
+
+		Access: Read, Write
+
+		Valid values:
+			================ ====================================
+			auto:            Charge normally, respect thresholds
+			inhibit-charge:  Do not charge while AC is attached
+			force-discharge: Force discharge while AC is attached
+
 What:		/sys/class/power_supply/<supply_name>/technology
 Date:		May 2007
 Contact:	linux-pm@vger.kernel.org
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index 9ca1f120a211..70c333e86293 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -132,6 +132,7 @@ enum power_supply_property {
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD, /* in percents! */
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD, /* in percents! */
+	POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
 	POWER_SUPPLY_PROP_INPUT_CURRENT_LIMIT,
 	POWER_SUPPLY_PROP_INPUT_VOLTAGE_LIMIT,
 	POWER_SUPPLY_PROP_INPUT_POWER_LIMIT,
@@ -202,6 +203,12 @@ enum power_supply_usb_type {
 	POWER_SUPPLY_USB_TYPE_APPLE_BRICK_ID,	/* Apple Charging Method */
 };
 
+enum power_supply_charge_behaviour {
+	POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO = 0,
+	POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE,
+	POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE,
+};
+
 enum power_supply_notifier_events {
 	PSY_EVENT_PROP_CHANGED,
 };
-- 
2.34.0

