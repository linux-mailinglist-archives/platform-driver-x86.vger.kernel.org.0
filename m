Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBF964A3529
	for <lists+platform-driver-x86@lfdr.de>; Sun, 30 Jan 2022 09:37:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346800AbiA3IhD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 Jan 2022 03:37:03 -0500
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:58316 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239065AbiA3IhC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Jan 2022 03:37:02 -0500
Received: from pop-os.home ([90.126.236.122])
        by smtp.orange.fr with ESMTPA
        id E5hjnTVltuCn2E5hkn1lig; Sun, 30 Jan 2022 09:37:01 +0100
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 30 Jan 2022 09:37:01 +0100
X-ME-IP: 90.126.236.122
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] surface: surface3-wmi: Simplify resource management
Date:   Sun, 30 Jan 2022 09:36:54 +0100
Message-Id: <8b1a6d05036d5d9527241b2345482b369331ce5c.1643531799.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

's3_wmi.input' is a managed resource, so there should be no need to free it
explicitly.

Moreover, 's3_wmi' is a global variable. 's3_wmi.input' should be NULL
when this error handling path is executed, because it has not been
assigned yet.

All this is puzzling. So simplify it and remove a few lines of code to have
it be more straightforward.

Fixes: 3dda3b3798f9 ("platform/x86: Add custom surface3 platform device for controlling LID")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only
---
 drivers/platform/surface/surface3-wmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/surface/surface3-wmi.c b/drivers/platform/surface/surface3-wmi.c
index 09ac9cfc40d8..b9a4b2d81f4b 100644
--- a/drivers/platform/surface/surface3-wmi.c
+++ b/drivers/platform/surface/surface3-wmi.c
@@ -190,14 +190,11 @@ static int s3_wmi_create_and_register_input(struct platform_device *pdev)
 
 	error = input_register_device(input);
 	if (error)
-		goto out_err;
+		return error;
 
 	s3_wmi.input = input;
 
 	return 0;
- out_err:
-	input_free_device(s3_wmi.input);
-	return error;
 }
 
 static int __init s3_wmi_probe(struct platform_device *pdev)
-- 
2.32.0

