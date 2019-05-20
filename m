Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 17C8424388
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 May 2019 00:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfETWlu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 May 2019 18:41:50 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:55433 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfETWlu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 May 2019 18:41:50 -0400
Received: by mail-it1-f196.google.com with SMTP id g24so1725576iti.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 May 2019 15:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OgNyxFvb9RrLEsgdaGamQ5DEgQMLWE8KdIG6aRKa58s=;
        b=i/YC3/Co3VAF6FaJLBBFr7LBsJyYYf4pjBoVIP3+MO3sAM/660FZ5qCQYTqHwNGLyA
         IXOF63sCfKLdqiznD/9Lm+y9ZCzqL9pdjWD9diNQOYuHwtl874AKBO8WaqU9Ii3PsPdk
         EestsRtqDzLEivR7dGSMWRF+h1oli32x9Xu7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OgNyxFvb9RrLEsgdaGamQ5DEgQMLWE8KdIG6aRKa58s=;
        b=paKJyJZgu2Ak83XErmYu6H7sGAusnFkro3QvAcWmgwSiFEbYFCs4HNlouIhv37c5XS
         DsldMueffpASFwyeS0QszOhDLYH23rekXZUlfrmLuarnF9ysLqu0e7x5xPoU+7+wO3s2
         bibSNbCqG5RmOHuTEpdcBFCeDmTiri1Nya5bNK0fc/dNahG16SMoafLY6fugteFP6sa4
         55ej6B0q1pUxMf1XwaUYsBackCyE63HOWeMEaynF8TBTXahfe+uxtMYqMH87Wh3D18re
         FKhl4pW980oEOi9lLXWb41lcs6C4+Ol06bMI6aFxP04mTzsWyR61yq3CNrnwkhmuHqkI
         MKWg==
X-Gm-Message-State: APjAAAWujtYT138iOna5SIhuCd2PU6o8pB/AcKR40ytzne2PXPTl5TKz
        0A4qCBoyZcP3u+00BD4C1RBImg==
X-Google-Smtp-Source: APXvYqzQiHm/KtijsWrYrWTLrhAWxHc3Zcx9ti23WinzlAtlDyVMJNn8b9TDiTMQx0akc3FONYbanA==
X-Received: by 2002:a02:c8da:: with SMTP id q26mr50625560jao.0.1558392109730;
        Mon, 20 May 2019 15:41:49 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:2e1:1bad:9c62:dd74])
        by smtp.gmail.com with ESMTPSA id c4sm516823itd.12.2019.05.20.15.41.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 May 2019 15:41:48 -0700 (PDT)
From:   Mathew King <mathewk@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mathew King <mathewk@chromium.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Jett Rink <jettrink@chromium.org>, Mario.Limonciello@dell.com
Subject: [PATCH v2] platform/x86: intel-vbtn: Report switch events when event wakes device
Date:   Mon, 20 May 2019 16:41:24 -0600
Message-Id: <20190520224124.153005-1-mathewk@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When a switch event, such as tablet mode/laptop mode or docked/undocked,
wakes a device make sure that the value of the swich is reported.
Without when a device is put in tablet mode from laptop mode when it is
suspended or vice versa the device will wake up but mode will be
incorrect.

Tested by suspending a device in laptop mode and putting it in tablet
mode, the device resumes and is in tablet mode. When suspending the
device in tablet mode and putting it in laptop mode the device resumes
and is in laptop mode.

Signed-off-by: Mathew King <mathewk@chromium.org>

---
Changes in v2:
  - Added comment explaining why switch events are reported
  - Format so that checkpatch is happy
---
 drivers/platform/x86/intel-vbtn.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 06cd7e818ed5..a0d0cecff55f 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -76,12 +76,24 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	struct platform_device *device = context;
 	struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
 	unsigned int val = !(event & 1); /* Even=press, Odd=release */
-	const struct key_entry *ke_rel;
+	const struct key_entry *ke, *ke_rel;
 	bool autorelease;
 
 	if (priv->wakeup_mode) {
-		if (sparse_keymap_entry_from_scancode(priv->input_dev, event)) {
+		ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
+		if (ke) {
 			pm_wakeup_hard_event(&device->dev);
+
+			/*
+			 * Switch events like tablet mode will wake the device
+			 * and report the new switch position to the input
+			 * subsystem.
+			 */
+			if (ke->type == KE_SW)
+				sparse_keymap_report_event(priv->input_dev,
+							   event,
+							   val,
+							   0);
 			return;
 		}
 		goto out_unknown;
-- 
2.21.0.1020.gf2820cf01a-goog

