Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80F8AADE0B
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Sep 2019 19:32:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729610AbfIIRcE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Sep 2019 13:32:04 -0400
Received: from mail.klausen.dk ([174.138.9.187]:46380 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729547AbfIIRcE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Sep 2019 13:32:04 -0400
From:   Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1568050322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ib3fkW6/va5TKK4jyvyiLY+Csn2wBC+7BpzEgGx/Tn4=;
        b=ka8EHC1/NT7sxQ9lKnDc+iSIOp87YpUc2UlqXe8gS2SVj+8Q4DdxzOgJ2D6eLuHFL5o05I
        kwu6+uQOI4S/UQPbdVXHLRgHyKdwJxnH6CXz1L77yz94u28dHdogYqGp6xSqEi33kP/8ac
        Bc9zPxA4Bp2Lw+Adjclw3XH4wTfVL/s=
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Daniel Drake <drake@endlessm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH 2/3] platform/x86: asus-wmi: Rename CHARGE_THRESHOLD to RSOC
Date:   Mon,  9 Sep 2019 19:31:27 +0200
Message-Id: <20190909173128.1670-2-kristian@klausen.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909173128.1670-1-kristian@klausen.dk>
References: <20190909173128.1670-1-kristian@klausen.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The device is officially called "Relative state of charge" (RSOC).
At the same time add the missing DEVID from the name.

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
 drivers/platform/x86/asus-wmi.c            | 6 +++---
 include/linux/platform_data/x86/asus-wmi.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 848b23764fc3..92c149dc2e6e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2067,7 +2067,7 @@ static ssize_t charge_threshold_store(struct device *dev,
 	if (value < 0 || value > 100)
 		return -EINVAL;
 
-	ret = asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, value, &rv);
+	ret = asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, value, &rv);
 	if (ret)
 		return ret;
 
@@ -2124,7 +2124,7 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 	else if (attr == &dev_attr_fan_boost_mode.attr)
 		ok = asus->fan_boost_mode_available;
 	else if (attr == &dev_attr_charge_threshold.attr)
-		devid = ASUS_WMI_CHARGE_THRESHOLD;
+		devid = ASUS_WMI_DEVID_RSOC;
 
 	if (devid != -1)
 		ok = !(asus_wmi_get_devstate_simple(asus, devid) < 0);
@@ -2455,7 +2455,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	 * and we can't get the current threshold so let set it to 100% on
 	 * module load.
 	 */
-	asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, 100, NULL);
+	asus_wmi_set_devstate(ASUS_WMI_DEVID_RSOC, 100, NULL);
 	asus->charge_threshold = 100;
 
 	return 0;
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 21f0426c8272..60249e22e844 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -82,7 +82,7 @@
 #define ASUS_WMI_DEVID_LID_RESUME	0x00120031
 
 /* Maximum charging percentage */
-#define ASUS_WMI_CHARGE_THRESHOLD	0x00120057
+#define ASUS_WMI_DEVID_RSOC		0x00120057
 
 /* DSTS masks */
 #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
-- 
2.23.0

