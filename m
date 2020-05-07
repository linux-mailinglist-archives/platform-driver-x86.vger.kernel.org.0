Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26D091C805E
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 05:12:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgEGDMO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 May 2020 23:12:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727967AbgEGDMN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 May 2020 23:12:13 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6219DC061A10
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2020 20:12:12 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id p25so2236260pfn.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2020 20:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-org-tw.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovatWTT2IkfeCN2gxUv+nyGPUFRj4YSKgWlcEr5L7I4=;
        b=VG5toFufhGCTMPP6ZxTZyCQD6W5mfLNWbOdFbl93egQ7hHDMGsN7YV6fAcl5sjsixG
         JfD+T7nU7uTXtK6WONMl/8YeR2ZjGaep9ZbWAYTP/DfZ6P58X/7Q03M9Nytn1dNF1gNf
         uWeQB2GtsvcO6Ali2G2YIl23Z6+X0Xfm9pduhu+DsCB7tnFim6LR/2ZyX04Vx5sISmN0
         VFxotFqATPRp4y3bPvYsNHj2zJK0Yf5M5M3j5REvP87X8DU9jDnSmZmLlCSmFS7NB9Y0
         IekeFloyBhDuk8GfPAcvTq2rtBfQsGFZxM4dOgjdRkd5r5tclok4/rOvwMAwiWkibskG
         wU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ovatWTT2IkfeCN2gxUv+nyGPUFRj4YSKgWlcEr5L7I4=;
        b=Gi2fXRYsYzW7LVzdgswZqTrtBXH53tcF19wVGOzOxw2ZGd1you0Igk63Rd3e/9caUf
         UD7ID0WNkntwU3MyaD7YiwuogIk6hOWKllcqLB6PfSXLW5jXXY55Eo1MR+gf4iB9zOQy
         uKAV+5apqnLi6TdTFuEN3oEAg7xgAQnh7jhwhX4woAsZ4OZpGlO4NhaP60yLQNYHRvNp
         t3iJ8/STQmggsImK+diSYiQhG4yGDp3jbZ/ZhPKH333SNYnmBKfDeeQv++XPwxR9NSHc
         2DoTbiziJnUFw3PZijJXTYgI8dq3ZkpDyh2obN5TP4C9yMR7lkb3pZX3z+FBg6HH0RHe
         By+A==
X-Gm-Message-State: AGi0PuYNoGS1O2ZGVSch2x0Khh2ZGZhYymSLHifdX8F3m1fnDN+mWNZv
        oNotaFRQwEFdiYnphu00JCwNjsqexxEF2XWG
X-Google-Smtp-Source: APiQypLs4kCydRSxIeN2W2YVGDn5j3r5vbVuUKqEmVMNTDvaExJjsTb6QQ+rRhvWelNvZ/rfLZMjpw==
X-Received: by 2002:aa7:9ac9:: with SMTP id x9mr11147730pfp.304.1588821131588;
        Wed, 06 May 2020 20:12:11 -0700 (PDT)
Received: from ws.cwhuang.info (114-34-107-28.HINET-IP.hinet.net. [114.34.107.28])
        by smtp.gmail.com with ESMTPSA id c15sm123724pfp.34.2020.05.06.20.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 20:12:11 -0700 (PDT)
From:   Chih-Wei Huang <cwhuang@linux.org.tw>
To:     platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Borislav Petkov <bp@suse.de>,
        Chih-Wei Huang <cwhuang@linux.org.tw>,
        =?UTF-8?q?Peter=20K=C3=A4stle?= <peter@piie.net>
Subject: [PATCH] platform/x86: acerhdf: replace space by * in modalias
Date:   Thu,  7 May 2020 11:12:01 +0800
Message-Id: <20200507031201.20460-1-cwhuang@linux.org.tw>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Using space in module alias makes it harder to parse modules.alias.
Replace it by a star(*).

Reviewed-by: Peter Kästle <peter@piie.net>
Signed-off-by: Chih-Wei Huang <cwhuang@linux.org.tw>
---
 drivers/platform/x86/acerhdf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 505224225378..306ea92d5b10 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -837,7 +837,7 @@ MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTMU*:");
 MODULE_ALIAS("dmi:*:*Packard*Bell*:pnENBFT*:");
 MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTMA*:");
 MODULE_ALIAS("dmi:*:*Packard*Bell*:pnDOTVR46*:");
-MODULE_ALIAS("dmi:*:*Acer*:pnExtensa 5420*:");
+MODULE_ALIAS("dmi:*:*Acer*:pnExtensa*5420*:");
 
 module_init(acerhdf_init);
 module_exit(acerhdf_exit);
-- 
2.21.1

