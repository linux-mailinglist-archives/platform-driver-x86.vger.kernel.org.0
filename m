Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1A8575B29A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 20 Jul 2023 17:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230366AbjGTPap (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 20 Jul 2023 11:30:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjGTPao (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jul 2023 11:30:44 -0400
Received: from pop36.abv.bg (pop36.abv.bg [194.153.145.227])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE03513E
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jul 2023 08:30:18 -0700 (PDT)
Received: from smtp.abv.bg (localhost [127.0.0.1])
        by pop36.abv.bg (Postfix) with ESMTP id 73CC91805D2F;
        Thu, 20 Jul 2023 18:29:57 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=abv.bg; s=smtp-out;
        t=1689866997; bh=D/1wzZK+6FHt5YLqg4iQGLtXh3TyizXfYbDLc9gPtN4=;
        h=Date:From:To:Cc:Subject:From;
        b=YF4LCZNMg1XJsDyPka+A38KUKqh60R4KO7MCnUZDXSNaXm1FZmh+oza1URNcQ9i4e
         CuYjzaADaodIZZl/BktrdfsjMsp58LaJ8RmRIsG2mE7560c4HchgkZaRA7asadquXg
         xD5lLb5XklXJ7GnQzjz7Gigc3qlMJe63k6zz61rs=
X-HELO: wyvern.localdomain
Authentication-Results: smtp.abv.bg; auth=pass (login) smtp.auth=kristiana2000@abv.bg
Received: from 77-85-214-96.ip.btc-net.bg (HELO wyvern.localdomain) (77.85.214.96)
 by smtp.abv.bg (qpsmtpd/0.96) with ESMTPSA (ECDHE-RSA-AES256-GCM-SHA384 encrypted); Thu, 20 Jul 2023 18:29:57 +0300
Date:   Thu, 20 Jul 2023 18:29:50 +0300
From:   Kristian Angelov <kristiana2000@abv.bg>
To:     luke@ljones.dev
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH V3] platform/x86: asus-wmi: Fix setting RGB mode on some TUF
 laptops
Message-ID: <ZLlS7o6UdTUBkyqa@wyvern.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch fixes setting the cmd values to 0xb3 and 0xb4.
This is necessary on some TUF laptops in order to set the RGB mode.

Closes: https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg
Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
---
 V1 -> V2. Make setting 0xb3 and 0xb4 the default logic
 V2 -> V3. Defualt to -EINVAL to match the rest of asus-wmi.

 drivers/platform/x86/asus-wmi.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 1038dfdcdd32..8bef66a2f0ce 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -738,13 +738,23 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
 				 struct device_attribute *attr,
 				 const char *buf, size_t count)
 {
-	u32 cmd, mode, r, g,  b,  speed;
+	u32 cmd, mode, r, g, b, speed;
 	int err;
 
 	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, &speed) != 6)
 		return -EINVAL;
 
-	cmd = !!cmd;
+	/* B3 is set and B4 is save to BIOS */
+	switch (cmd) {
+	case 0:
+		cmd = 0xb3;
+		break;
+	case 1:
+		cmd = 0xb4;
+		break;
+	default:
+		return -EINVAL;
+	}
 
 	/* These are the known usable modes across all TUF/ROG */
 	if (mode >= 12 || mode == 9)
-- 
2.40.0

