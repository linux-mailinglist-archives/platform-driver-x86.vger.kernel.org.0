Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14BC678759
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jul 2019 10:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbfG2I1s (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 29 Jul 2019 04:27:48 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:40745 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbfG2I1s (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Jul 2019 04:27:48 -0400
Received: by mail-pl1-f193.google.com with SMTP id a93so27168678pla.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2019 01:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GltZrVoq05lbssQbd34Qso3GlPTTsa7tLILp316Usp8=;
        b=uQjNbDaDDNm2UM5YAzPZKuJ2vjiHQKmD+RnFXVb4rc/sg/+xaGoZzqruDxgCP+HRnF
         omQRJYwToRAgU4/7rc5Mm0kZHaGJK6MOA1dPkAkGG5o9NkehuET8lXDsdPC+/D9LW5js
         llhCRHfiaYLF2uLpNJYqoyYX/EcXRaHnJEe4G4Seh2Y2iZqsZFtovdQIEUi45H484d0O
         bVytIVwOC5K4bexOUQQoV0gMDyBbbCUTMQkN3u11jb8RqVVzjQtI4Y3B3sSylTL9eARm
         y4CQkyHafK1apMHwY1h3HmuXxVNHwzfz4eJOs8e2SFL2wWe4WY3xAOcOUFyk/Bfi9lss
         ENkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GltZrVoq05lbssQbd34Qso3GlPTTsa7tLILp316Usp8=;
        b=TbvMBfhzbkHw8wi3nxlPU7Izom63cBVlml5IgYxehwmE7yBezWPNaFyBlTxErlPCX0
         mZG2g+ByTmNXbVz/zxVfx35/vlWDnZ1y1qamUpwt95qoI9/x4Twwankt7eIqWEn0blR7
         MxU/mPdvy5IpYKVgvxfwOdUL11TqL7DClU9kTBELmCiThLXZtd585hgBrq846opImwzv
         dAxebsaxbErvgHKeuAXFk/OHaQ7FZkg2PRt+jBB5b1y4BlZtxFAMT/+JBTkmhL3TsKkT
         pw/N5FmuyCIyBu/PKwOKdriOeZT2QiqMKa1OAdNMQeUuIqTo/oVci1yw3wPi+FcrRGaw
         oXRw==
X-Gm-Message-State: APjAAAUFQY6Gt/zE/GWYZOjFdgtb6ntDrZ1Evf1xjQmGblRCO26tpEFx
        Hek1eR7SDpNJz4m02/ltl/PZaw==
X-Google-Smtp-Source: APXvYqyrbOtF4FN3Lp+C0LhFlhatdABkQObOqdyiD7w5F8rrHh/DodzfgIwgypMYm9pcwctauLSvdA==
X-Received: by 2002:a17:902:381:: with SMTP id d1mr106431836pld.331.1564388868003;
        Mon, 29 Jul 2019 01:27:48 -0700 (PDT)
Received: from limbo.local (123-204-46-122.static.seed.net.tw. [123.204.46.122])
        by smtp.gmail.com with ESMTPSA id z13sm51359531pjn.32.2019.07.29.01.27.45
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 01:27:47 -0700 (PDT)
From:   Daniel Drake <drake@endlessm.com>
To:     corentin.chary@gmail.com, dvhart@infradead.org, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org, yurii.pavlovskyi@gmail.com,
        linux@endlessm.com
Subject: [PATCH v2 2/3] platform/x86: asus-wmi: add a helper for device presence
Date:   Mon, 29 Jul 2019 16:27:38 +0800
Message-Id: <20190729082739.8045-2-drake@endlessm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729082739.8045-1-drake@endlessm.com>
References: <20190729082739.8045-1-drake@endlessm.com>
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

Notes:
    v2: rediff against current review-andy branch

 drivers/platform/x86/asus-wmi.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index fc2939ac1cfe..25f1e256c442 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -358,6 +358,14 @@ static int asus_wmi_get_devstate_simple(struct asus_wmi *asus, u32 dev_id)
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
@@ -503,15 +511,6 @@ static int wlan_led_unknown_state(struct asus_wmi *asus)
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
@@ -578,15 +577,6 @@ static enum led_brightness lightbar_led_get(struct led_classdev *led_cdev)
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
@@ -637,7 +627,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (wlan_led_presence(asus) && (asus->driver->quirks->wapf > 0)) {
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_WIRELESS_LED)
+			&& (asus->driver->quirks->wapf > 0)) {
 		INIT_WORK(&asus->wlan_led_work, wlan_led_update);
 
 		asus->wlan_led.name = "asus::wlan";
@@ -654,7 +645,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
 			goto error;
 	}
 
-	if (lightbar_led_presence(asus)) {
+	if (asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_LIGHTBAR)) {
 		INIT_WORK(&asus->lightbar_led_work, lightbar_led_update);
 
 		asus->lightbar_led.name = "asus::lightbar";
-- 
2.20.1

