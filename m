Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F22F2562AA
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Aug 2020 23:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgH1V4B (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Aug 2020 17:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726033AbgH1V4A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Aug 2020 17:56:00 -0400
X-Greylist: delayed 377 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 28 Aug 2020 14:55:59 PDT
Received: from forward102j.mail.yandex.net (forward102j.mail.yandex.net [IPv6:2a02:6b8:0:801:2::102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0D21C061264
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Aug 2020 14:55:59 -0700 (PDT)
Received: from mxback2o.mail.yandex.net (mxback2o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1c])
        by forward102j.mail.yandex.net (Yandex) with ESMTP id 59886F20AB2;
        Sat, 29 Aug 2020 00:49:36 +0300 (MSK)
Received: from iva7-f62245f79210.qloud-c.yandex.net (iva7-f62245f79210.qloud-c.yandex.net [2a02:6b8:c0c:2e83:0:640:f622:45f7])
        by mxback2o.mail.yandex.net (mxback/Yandex) with ESMTP id PRmiJAGozt-naeKJsdi;
        Sat, 29 Aug 2020 00:49:36 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1598651376;
        bh=YE9kWp0qxT1xo04y5ZwOktEcMCMc+LcfVHmUd1rfh2o=;
        h=In-Reply-To:Subject:To:From:Message-Id:Cc:References:Date;
        b=TlMkUl2hmlAXwiqpryzROM+nsDDWgJR1jsNdmgNW3+5QoPgfYDBsY+J0rvS4RxAXT
         ZEZBCwtB6adu558DnqrwMuvODwcHDKilseWMaCwz7W/YYKf2ujirjjbiYwU+GnMJWV
         /qaPJqZJAhAOwJn63yYF+re1Vw1qGn/OM7GRj+dw=
Authentication-Results: mxback2o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva7-f62245f79210.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id wtE0T54V7Y-nZHWHqi4;
        Sat, 29 Aug 2020 00:49:35 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Vasiliy Kupriakov <rublag-ns@yandex.ru>
To:     Corentin Chary <corentin.chary@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Vasiliy Kupriakov <rublag-ns@yandex.ru>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: asus-wmi: Add new fan type check
Date:   Sat, 29 Aug 2020 00:49:31 +0300
Message-Id: <20200828214932.20866-3-rublag-ns@yandex.ru>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828214932.20866-1-rublag-ns@yandex.ru>
References: <20200828214932.20866-1-rublag-ns@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some of the new ASUS laptops like TUF Gaming FA706II do not set bit
indicating presence of method. Instead, just the fan speed is returned.

Implement ugly way to check if for the cpu fan.
It seems that in other TUF models SPEC version and SFUN are the same.
So it checks these two values, then tries to read fan speed, and last,
checks that fan speed is in adequate range.

Signed-off-by: Vasiliy Kupriakov <rublag-ns@yandex.ru>
---
 drivers/platform/x86/asus-wmi.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 71559d429ba0..82505307ec17 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1309,6 +1309,38 @@ static bool asus_wmi_has_agfn_fan(struct asus_wmi *asus)
 		 || (!asus->sfun && !(value & ASUS_WMI_DSTS_PRESENCE_BIT)));
 }
 
+/*
+ * Check for fan availability. Some of the newer laptops don't set
+ * the ASUS_WMI_DSTS_PRESENCE_BIT. This is ad hoc solution. It compares
+ * few attributes to constants found in DSDT, then tries to read fan speed
+ */
+static bool asus_wmi_has_fan(struct asus_wmi *asus, u32 dev_id)
+{
+	int status;
+	u32 value;
+
+	/*
+	 * On multiple TUF laptops with similar DSDT interface
+	 * for fans, these two values are as following.
+	 * On some older laptops, they are different.
+	 */
+	if (asus->spec != 0x80001 || !(asus->sfun & 0x400000))
+		return false;
+
+	status = asus_wmi_get_devstate(asus, dev_id, &value);
+	if (status != 0 || value == ASUS_WMI_UNSUPPORTED_METHOD)
+		return false;
+
+	/*
+	 * Check that fan RPM is in adequate range (0 <= RPM <= 10000)
+	 * Note that firmware returns RPM/100.
+	 */
+	if (value > 100)
+		return false;
+
+	return true;
+}
+
 static int asus_fan_set_auto(struct asus_wmi *asus)
 {
 	int status;
@@ -1613,6 +1645,8 @@ static int asus_wmi_fan_init(struct asus_wmi *asus)
 		asus->fan_type = FAN_TYPE_SPEC83;
 	else if (asus_wmi_has_agfn_fan(asus))
 		asus->fan_type = FAN_TYPE_AGFN;
+	else if (asus_wmi_has_fan(asus, ASUS_WMI_DEVID_CPU_FAN_CTRL))
+		asus->fan_type = FAN_TYPE_SPEC83;
 
 	if (asus->fan_type == FAN_TYPE_NONE)
 		return -ENODEV;
-- 
2.28.0

