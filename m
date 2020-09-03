Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD8BE25CB7F
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Sep 2020 22:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728397AbgICUt1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Sep 2020 16:49:27 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:36951 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727065AbgICUt1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Sep 2020 16:49:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 59FE0D1A;
        Thu,  3 Sep 2020 16:49:26 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Thu, 03 Sep 2020 16:49:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FZfKW1
        MW8Jxe1ksvpM4oDJPu8Qk1OiyehC5J6JRQgIE=; b=n0jBFVEDXaRnN4J+Y0cO5n
        ZSDqOqyXShu6iGJ3Tw5Nh7zUXhttnh6h9xYqG/2MxwTJ1m92yxmWulgzexFZkEDP
        v8QjZSXjTmOUhHd3gEHkKtNWEanDqDP3GfWhVQDGVgABxHpGO/9ZSl0WT5Wy2CMD
        ld2q4N5vKamcNoWberf7LTPHPQxp66MdffdJ/fL12HHWMybLW8uQdN7qQgaMHNPv
        DEseL6gJj8bjdlMo8edPVyiCas0GGuo2shfcS2WAgjHOw7OMwvM5nSATpffbIfsb
        TmnxQKnzG29P59k7dYxwjDyMfvzk+czBbIIFE9WKQIbdYFhWxSkqibLBr7gJx5rQ
        ==
X-ME-Sender: <xms:1VZRX1rD86uIRmue1VnYCgEm32KL6eyUtEaJEsc02KBf6X0LNqzWPw>
    <xme:1VZRX3olO6NtmHpmi5vf0ytP3OD58eK0ENmdd4RxtsBAQKD1hpwgqtVVTHGm8BxO5
    _HdBkpYi2_xBINIcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudeguddgudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
    dtredtreertdenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghm
    hiesshihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpefgudejjeehhfelje
    ehkeejffeiteehkefgffetgffgvdefveehveeuudejvefgteenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmje
    eirdgtohhm
X-ME-Proxy: <xmx:1VZRXyPpsvNwwIFNZL7gVQcwecfnVAQA9nQxrN5on4zuTs-XL6ogwA>
    <xmx:1VZRXw4iygv7XH2JY0aspbR2q9yJbdcGsv0OjnwdOsU9fK1xdjndEw>
    <xmx:1VZRX07Y1GS97hxPmWLyTMqwEzzpL1tLLDPNKricgLPwdHAYA0pBYA>
    <xmx:1VZRX5XNTGdS8pUvWjfKPCrbcC7IdDbG05pbbJkMhd8xA5sWaLsqTg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 996F9E00BD; Thu,  3 Sep 2020 16:49:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <179d3595-dda8-4c50-84e3-5f447ef5e34b@www.fastmail.com>
In-Reply-To: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
Date:   Thu, 03 Sep 2020 14:49:05 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     platform-driver-x86@vger.kernel.org
Cc:     =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
Subject: [PATCH 2/2] platform/x86: system76_acpi: Add input driver
Content-Type: text/plain
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

platform/x86: system76_acpi: Add input driver

The input driver reports KEY_SCREENLOCK when the firmware notifies the
kernel of event 0x85. This is to support hardware with a screen lock
hotkey.

Signed-off-by: Jeremy Soller <jeremy@system76.com>
Cc: platform-driver-x86@vger.kernel.org
---
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index d2f9c3dcf4b9..a8b75c1b96fb 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1159,6 +1159,7 @@ config SYSTEM76_ACPI
 	tristate "System76 ACPI Driver"
 	depends on ACPI
 	depends on HWMON
+	depends on INPUT
 	select NEW_LEDS
 	select LEDS_CLASS
 	select LEDS_TRIGGERS
diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/system76_acpi.c
index aef0ea34829d..eaff9adea504 100644
--- a/drivers/platform/x86/system76_acpi.c
+++ b/drivers/platform/x86/system76_acpi.c
@@ -13,6 +13,7 @@
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 #include <linux/init.h>
+#include <linux/input.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -29,6 +30,7 @@ struct system76_data {
 	struct device *therm;
 	union acpi_object *nfan;
 	union acpi_object *ntmp;
+	struct input_dev *input;
 };
 
 static const struct acpi_device_id device_ids[] = {
@@ -437,6 +439,15 @@ static const struct hwmon_chip_info thermal_chip_info = {
 	.info = thermal_channel_info,
 };
 
+static void input_key(struct system76_data *data, unsigned int code)
+{
+	input_report_key(data->input, code, 1);
+	input_sync(data->input);
+
+	input_report_key(data->input, code, 0);
+	input_sync(data->input);
+}
+
 // Handle ACPI notification
 static void system76_notify(struct acpi_device *acpi_dev, u32 event)
 {
@@ -459,6 +470,9 @@ static void system76_notify(struct acpi_device *acpi_dev, u32 event)
 	case 0x84:
 		kb_led_hotkey_color(data);
 		break;
+	case 0x85:
+		input_key(data, KEY_SCREENLOCK);
+		break;
 	}
 }
 
@@ -524,6 +538,21 @@ static int system76_add(struct acpi_device *acpi_dev)
 	if (IS_ERR(data->therm))
 		return PTR_ERR(data->therm);
 
+	data->input = devm_input_allocate_device(&acpi_dev->dev);
+	if (!data->input)
+		return -ENOMEM;
+	data->input->name = "System76 ACPI Hotkeys";
+	data->input->phys = "system76_acpi/input0";
+	data->input->id.bustype = BUS_HOST;
+	data->input->dev.parent = &acpi_dev->dev;
+	set_bit(EV_KEY, data->input->evbit);
+	set_bit(KEY_SCREENLOCK, data->input->keybit);
+	err = input_register_device(data->input);
+	if (err) {
+		input_free_device(data->input);
+		return err;
+	}
+
 	return 0;
 }
 
