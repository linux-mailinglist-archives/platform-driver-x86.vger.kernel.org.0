Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70DD021060
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 May 2019 23:56:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbfEPV4c (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 May 2019 17:56:32 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:36791 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbfEPV4c (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 May 2019 17:56:32 -0400
Received: by mail-io1-f67.google.com with SMTP id e19so3886994iob.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 May 2019 14:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=30hVVs4KstAY1Cm8mS0N7KHumN5n7CONcXPWGn5Ws6A=;
        b=ZHdDStIn8Nh3/v0i1rIiUZbPlnHF/ZpK2u9nHuYkVHpfRygwqsqhfIeoWGjrGE6l81
         e9RuOg5/DSBpaph108jInUozc+UCRLLZcpYq9Sddfxq/7nludItMO8M1kutE5gC7iNgo
         3zGU6EgQvx17q0RPaG5GT7Y5RZnF3dxGDdbq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=30hVVs4KstAY1Cm8mS0N7KHumN5n7CONcXPWGn5Ws6A=;
        b=Jzx/TLPN0NY712Me1/dG6dcSlIueEYaiQTP/cizdcV28tJIbTCDrc+vUYZr9aiWxNC
         TLJsjZM/c5UfZzmN+5rTwI3tDgSoIl8m7SmSLLss5rnl8FFuF7ZCcSmumOs/KRbMLqb2
         rA38L1GbLdpRnu18EzqDuPuXNZujWpzx0wEWQpkvld8TJ2hCkAl4qMx7rA1uDO9vsZsH
         HB1v4TGqJy6lC6C/nXXB4uNY7Xm+TYgB6rxINmPI/ITrDzphEGAi7ByK50+pYhlO1FFk
         LyS6yZwt1OdT+1iwYPYhHd1iMa7SJBDQh7BpTW9bRDWYICLuap5dXtjTAp2ly1FtKXUm
         JYsQ==
X-Gm-Message-State: APjAAAVSR/YSrQdKu8JnFLm3X1IAbI7wFE8zxS0mjFWaydmRwyQd6dFy
        v93Kv7+xLLr/fQtPBwCILvwgBA==
X-Google-Smtp-Source: APXvYqy8uV4H/brx/EiboH8ZkZo8jxjBVfHbXkfySYBjdVZOOGXPooNYLRP97OO7C07dawOoLsTl2Q==
X-Received: by 2002:a5d:8153:: with SMTP id f19mr7148987ioo.167.1558043791537;
        Thu, 16 May 2019 14:56:31 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:2e1:1bad:9c62:dd74])
        by smtp.gmail.com with ESMTPSA id h16sm2079282ioh.35.2019.05.16.14.56.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 14:56:30 -0700 (PDT)
From:   Mathew King <mathewk@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Mathew King <mathewk@chromium.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-vbtn: Report switch events when event wakes device
Date:   Thu, 16 May 2019 15:56:15 -0600
Message-Id: <20190516215615.261258-1-mathewk@chromium.org>
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
 drivers/platform/x86/intel-vbtn.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index 06cd7e818ed5..990cc8c20872 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -76,12 +76,15 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
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
+			if (ke->type == KE_SW)
+				sparse_keymap_report_event(priv->input_dev, event, val, 0);
 			return;
 		}
 		goto out_unknown;
-- 
2.21.0.1020.gf2820cf01a-goog

