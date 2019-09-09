Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE61ADE0A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Sep 2019 19:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbfIIRb7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Sep 2019 13:31:59 -0400
Received: from mail.klausen.dk ([174.138.9.187]:46364 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726931AbfIIRb7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Sep 2019 13:31:59 -0400
From:   Kristian Klausen <kristian@klausen.dk>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1568050317;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=KoWxgivWUm0wOw5GSeUvE0C7d7G/7awxMjgdpEbmUIs=;
        b=VMfbfI4WsGaDxYfRJsDPjC306p8mLhpnn2lEplUlTh8bSzCcYPhhiUmtu7V8CYLIzGLua6
        NyXIldadIne7nuMzwD/idG1w9Tcxd+Z85OYHlx4/xPGsGdjOReqPz3wO7dm6rp794SYJad
        JRYiHZCDO0O8t/PYAEPAblGfkatSxnM=
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Daniel Drake <drake@endlessm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kristian Klausen <kristian@klausen.dk>
Subject: [PATCH 1/3] platform/x86: asus-wmi: Reorder ASUS_WMI_CHARGE_THRESHOLD
Date:   Mon,  9 Sep 2019 19:31:26 +0200
Message-Id: <20190909173128.1670-1-kristian@klausen.dk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

At the same time add a comment explaining what it is used for.

Signed-off-by: Kristian Klausen <kristian@klausen.dk>
---
 include/linux/platform_data/x86/asus-wmi.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 53934ef38d98..21f0426c8272 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -61,7 +61,6 @@
 
 /* Misc */
 #define ASUS_WMI_DEVID_CAMERA		0x00060013
-#define ASUS_WMI_CHARGE_THRESHOLD	0x00120057
 
 /* Storage */
 #define ASUS_WMI_DEVID_CARDREADER	0x00080013
@@ -82,6 +81,9 @@
 /* Deep S3 / Resume on LID open */
 #define ASUS_WMI_DEVID_LID_RESUME	0x00120031
 
+/* Maximum charging percentage */
+#define ASUS_WMI_CHARGE_THRESHOLD	0x00120057
+
 /* DSTS masks */
 #define ASUS_WMI_DSTS_STATUS_BIT	0x00000001
 #define ASUS_WMI_DSTS_UNKNOWN_BIT	0x00000002
-- 
2.23.0

