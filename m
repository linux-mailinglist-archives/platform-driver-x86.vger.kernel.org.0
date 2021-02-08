Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 477E8313C80
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Feb 2021 19:08:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235110AbhBHSHP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Feb 2021 13:07:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:46596 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235168AbhBHSDj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Feb 2021 13:03:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A973A64EF0;
        Mon,  8 Feb 2021 17:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807191;
        bh=8Q3v9KXNyoY8FwManLhHl+Kzwr834mGKxWc2c2jILPo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=QtI9Oa/iiU9u3f6miUS5ZLalrAM6NiAmtZheZ25HuBz4Va18F6WBzLl+Zdn8CLSmk
         o05cRQg88l/9T0i2kMRuNxzk+vcZIA7CHTIG96mL3i4MNCldnUTgLvgu7tU34jcrKW
         wGdSOasmXxxVxQ8derHrhaagkvDxBkWzr/gSAIs28znJQ9nHdvTa3AEKB6HauEcVDq
         cYhj9kC7zlJyLNQncGA/RdYaoA4HKaJPDNcGjfD3/p7NLF/abp3qD0YloJYbP333sl
         xDdiMS0z9yK4FVkMA+td2k+9Ei4dCiO8orJ799B1R9ZenaLlhNeDUKqcaoW9d+k9y3
         DyH0zrB6Ow12g==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Stefan=20Br=C3=BCns?= <stefan.bruens@rwth-aachen.de>,
        Mark Gross <mgross@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 3/9] platform/x86: hp-wmi: Disable tablet-mode reporting by default
Date:   Mon,  8 Feb 2021 12:59:40 -0500
Message-Id: <20210208175946.2092374-3-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175946.2092374-1-sashal@kernel.org>
References: <20210208175946.2092374-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 67fbe02a5cebc3c653610f12e3c0424e58450153 ]

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

This leads to the hp-wmi input-dev claiming SW_TABLET_MODE support,
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
triplett, with the hope that in the future we can come up with a
better way to detect SW_TABLET_MODE support. ATM the default
auto option just does the same as off.

BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1918255
Cc: Stefan Brüns <stefan.bruens@rwth-aachen.de>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Mark Gross <mgross@linux.intel.com>
Link: https://lore.kernel.org/r/20210120124941.73409-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/hp-wmi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 952544ca0d84d..93fadd4abf14d 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -45,6 +45,10 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("wmi:95F24279-4D7B-4334-9387-ACCDC67EF61C");
 MODULE_ALIAS("wmi:5FB7F034-2C63-45e9-BE91-3D44E2C707E4");
 
+static int enable_tablet_mode_sw = -1;
+module_param(enable_tablet_mode_sw, int, 0444);
+MODULE_PARM_DESC(enable_tablet_mode_sw, "Enable SW_TABLET_MODE reporting (-1=auto, 0=no, 1=yes)");
+
 #define HPWMI_EVENT_GUID "95F24279-4D7B-4334-9387-ACCDC67EF61C"
 #define HPWMI_BIOS_GUID "5FB7F034-2C63-45e9-BE91-3D44E2C707E4"
 
@@ -656,10 +660,12 @@ static int __init hp_wmi_input_setup(void)
 	}
 
 	/* Tablet mode */
-	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
-	if (!(val < 0)) {
-		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
-		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
+	if (enable_tablet_mode_sw > 0) {
+		val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
+		if (val >= 0) {
+			__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
+			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
+		}
 	}
 
 	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
-- 
2.27.0

