Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3161E683B3
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2019 08:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbfGOGys (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Jul 2019 02:54:48 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38569 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbfGOGys (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jul 2019 02:54:48 -0400
Received: by mail-pf1-f193.google.com with SMTP id y15so6963804pfn.5
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 Jul 2019 23:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IM6Br9LwmV7TwM7Dv5wfYnH9fPYtAwKNqtfCQO/JrmA=;
        b=y/iyaibFDd8ipuYBDuBbqO4prxbQb1K/zdpSq75sgPuMnI+4ManODSKsLdo2wRV7Rg
         2GGEgKSwphdwBDuxr4YO9RDFryXmtf+Bnl1YmMOoBVaxgIsAB9UxGMYxCSnj4epzhmp4
         8kzV69cP8JfhcyjtvPhajsUCgjyl9Nzt4W92Er9KROXoM9dY3dSXskDE/AOg5D0sRRFu
         Dty3DlRY1A7wQYtOP1ARI3We6V6kVMezaVLVn+YfO1kmu78rwwrpDErDGcE8sbWJgKud
         5kmTNNxL0zW12nW61u7WPbC5ilmVrc+5AuhhJFKa8zVqEjiDR/mEonOW3/8IbLMpLlu0
         40Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IM6Br9LwmV7TwM7Dv5wfYnH9fPYtAwKNqtfCQO/JrmA=;
        b=Xzq46ZswPQhsMyhB1qzlHCzaz+8UJBgGc7ibSAJ/iUOjCh7PjvbMvxysbHOp77qqLS
         745uixAtym9D7+h7Y/uWbPQZ9J5epqoCS+b+jnWiLtsmh6TxLSnt/sD1ODJSQ54VfVRV
         WxIv8eevuub6I3jaxkYcej+K93M//vRstUozknIh9ckmb9pMld3WTipf7j40WIPhhyIH
         2oRfjaWqLJSjLaWrCiB3QRqUXU3D5RCHWWFxbEeHtNq+H/Y7AzfOo1IMy6uDe/+u/KhF
         Cif8g11uV1BSKcYfdj9vvlKFrI/1jwwfrBA9scJxIvy6kWEZwuffh4uaM+BLukI1gGX7
         7H+Q==
X-Gm-Message-State: APjAAAUChoZfVk7spbInJXL4kvyan1wq57PGdWlTbOegObTmO8ocGZ66
        um9tr862wUaxjhOh693S4n24Qw==
X-Google-Smtp-Source: APXvYqx4fjduQ11SOyGSrllFGISj9wIjx7vupiK/kgo+l+p6P23v/RVuk6nrkjO6MqkU1abAmMKlJw==
X-Received: by 2002:a63:6507:: with SMTP id z7mr24142342pgb.186.1563173687865;
        Sun, 14 Jul 2019 23:54:47 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id y22sm19183257pfo.39.2019.07.14.23.54.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 14 Jul 2019 23:54:47 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, yurii.pavlovskyi@gmail.com,
        linux@endlessm.com
Subject: [PATCH 2/3] platform/x86: asus: add a helper for device presence
Date:   Mon, 15 Jul 2019 14:54:38 +0800
Message-Id: <20190715065439.27159-2-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190715065439.27159-1-drake@endlessm.com>
References: <20190715065439.27159-1-drake@endlessm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Factor out the WLAN LED and lightbar LED presence checks into a
helper function, which will also be used by the upcoming CPU fan device
support.

Signed-off-by: Daniel Drake <drake@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 0a1410ea2250..6925b2102f94 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -372,6 +372,14 @@ static int asus_wmi_get_devstate_simple(struct asus_wmi *asus, u32 dev_id)
 					  ASUS_WMI_DSTS_STATUS_BIT);
 }
 
+static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
+{
+	u32 retval;
+	int status = asus_wmi_get_devstate(asus, dev_id, &retval);
+
+	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
+}
+
 /* LEDs ***********************************************************************/
 
 /*
@@ -517,15 +525,6 @@ static int wlan_led_unknown_state(struct asus_wmi *asus)
 	return result & ASUS_WMI_DSTS_UNKNOWN_BIT;
 }
 
-static int wlan_led_presence(struct asus_wmi *asus)
-{
-	u32 result;
-
-	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, &result);
-
-	return result & ASUS_WMI_DSTS_PRESENCE_BIT;
-}
-
 static void wlan_led_update(struct work_struct *work)
 {
 	int ctrl_param;
@@ -592,15 +591,6 @@ static enum led_brightness lightbar_led_get(struct led_classdev *led_cdev)
 	return result & ASUS_WMI_DSTS_LIGHTBAR_MASK;
 }
 
-static int lightbar_led_presence(struct asus_wmi *asus)
-{
-	u32 result;
-
-	asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_LIGHTBAR, &result);
-
-	return result & ASUS_WMI_DSTS_PRESENCE_BIT;
-}
-
 static void asus_wmi_led_exit(struct asus_wmi *asus)
 {
 	if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
@@ -651,7 +641,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (wlan_led_presence(asus) && (asus->driver->quirks->wapf > 0)) {
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
+			&& (asus->driver->quirks->wapf > 0)) {
 		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
 
 		asus->wlan_led.name = "asus::wlan";
@@ -668,7 +659,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (lightbar_led_presence(asus)) {
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_LIGHTBAR)) {
 		INIT_WORK(&asus->lightbar_led_work, lightbar_led_update);
 
 		asus->lightbar_led.name = "asus::lightbar";
-- 
2.20.1

