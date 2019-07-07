Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CAB9614B6
	for <lists+platform-driver-x86@lfdr.de>; Sun,  7 Jul 2019 13:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725981AbfGGLaX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 7 Jul 2019 07:30:23 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:46951 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfGGLaX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 7 Jul 2019 07:30:23 -0400
Received: by mail-pg1-f193.google.com with SMTP id i8so6210215pgm.13
        for <platform-driver-x86@vger.kernel.org>; Sun, 07 Jul 2019 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=IhNmU3jLzSPg/Bx4FmaJttrL0P0XQTqjXDGjwrCnLTs=;
        b=CnHdUDTFExliqTB2qVSnjvCEp7fG1NJ4d/9G+wKTszd+ZAuYoJEjitw4b/PRyuUJea
         323PnJbqZ4qCoGuSb/x1MPaM0qdFLBLl2xpKnq9aaCu1h7i2oJ/Q8CGj8OzJ96rDNm86
         NHfSXTGJulCcg/vqivqRIFdMWj2gnRQg9m9GyKVFOPBG+BjOF3K8nv/MINlcGSPWG6aP
         F7vrrGmWNBLZHcVhzLfzyXAMSSbmj51HdFRHtK+28aS3FOzCkC4/V28BTI0NJWa7lzl7
         IELtSyzOoT8tMOqlkZ76AeTE8T2IyciAwS0lJ9Wh9sxFIl0+8kQlpKh/tJFa8oczg227
         dIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=IhNmU3jLzSPg/Bx4FmaJttrL0P0XQTqjXDGjwrCnLTs=;
        b=ZuWvosEgQ+BPcwSTfnan66d0LyrOQ9AOWOEp2Z2pYLUfCylJr07dgbc5v96YhavOa+
         HIvMkyf1yQXyFI7HLsXySflEmYPPzT6X90dIYW6wEr6bTHth7SNJPUXrpj8y4PwCaDjT
         u8Lkz51NRBKnOUOfzOGnz86O1vLI0587PI8F3OnhCwX38fThKmErCS96tya2V0cJZCqK
         ipdG2HnGxU5wT4CWreGvLGCyDrUwfGlJsw52eceHlVFSTykFefqCtFz58Y04gFOb6OU0
         YuOdNxaXhZ322bFze1v9NW59HaFwTv7ZnfUtLUmmnEEj9EvesN7+kIbYI1/DBo+3+Yh2
         Luzg==
X-Gm-Message-State: APjAAAWOpAbzPjblsN/gC4yGzF22tUaBKFhySRb83WZQ7OnrjB2fHQzs
        I6hT8tnlVInruDGtd1PKhyQ=
X-Google-Smtp-Source: APXvYqyM2wf/GYlMT2Bc1g2YDh+K3uqgT2TybzrMN1sO8j+wLGNw6kcpQuS7gdgJs3TvazKVhTrOSQ==
X-Received: by 2002:a17:90a:d80b:: with SMTP id a11mr16430587pjv.53.1562499022466;
        Sun, 07 Jul 2019 04:30:22 -0700 (PDT)
Received: from arch ([103.238.105.141])
        by smtp.gmail.com with ESMTPSA id x128sm35408946pfd.17.2019.07.07.04.30.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 07 Jul 2019 04:30:21 -0700 (PDT)
Date:   Sun, 7 Jul 2019 17:00:16 +0530
From:   Amol Surati <suratiamol@gmail.com>
To:     dilinger@queued.net, dvhart@infradead.org, andy@infradead.org
Cc:     linux-geode@lists.infradead.org,
        platform-driver-x86@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        suratiamol@gmail.com
Subject: [PATCH] cs5535: use BIT() macro for defining bit-flags
Message-ID: <20190707113016.GA30635@arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The BIT() macro is available for defining the required bit-flags.

Since it operates on an unsigned value and expands to an unsigned result,
using it, instead of an expression like (1 << x), also fixes the problem
of shifting a signed 32-bit value by 31 bits. (e.g. 1 << 31. See
CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN).

Signed-off-by: Amol Surati <suratiamol@gmail.com>
---
 include/linux/cs5535.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/linux/cs5535.h b/include/linux/cs5535.h
index 2be1120174eb..7c403855b456 100644
--- a/include/linux/cs5535.h
+++ b/include/linux/cs5535.h
@@ -91,21 +91,21 @@ static inline int cs5535_pic_unreqz_select_high(unsigned int group,
 #define CS5536_PM_GPE0_EN	0x1c
 
 /* CS5536_PM1_STS bits */
-#define CS5536_WAK_FLAG		(1 << 15)
-#define CS5536_RTC_FLAG		(1 << 10)
-#define CS5536_PWRBTN_FLAG	(1 << 8)
+#define CS5536_WAK_FLAG		BIT(15)
+#define CS5536_RTC_FLAG		BIT(10)
+#define CS5536_PWRBTN_FLAG	BIT(8)
 
 /* CS5536_PM1_EN bits */
-#define CS5536_PM_PWRBTN	(1 << 8)
-#define CS5536_PM_RTC		(1 << 10)
+#define CS5536_PM_PWRBTN	BIT(8)
+#define CS5536_PM_RTC		BIT(10)
 
 /* CS5536_PM_GPE0_STS bits */
-#define CS5536_GPIOM7_PME_FLAG	(1 << 31)
-#define CS5536_GPIOM6_PME_FLAG	(1 << 30)
+#define CS5536_GPIOM7_PME_FLAG	BIT(31)
+#define CS5536_GPIOM6_PME_FLAG	BIT(30)
 
 /* CS5536_PM_GPE0_EN bits */
-#define CS5536_GPIOM7_PME_EN	(1 << 31)
-#define CS5536_GPIOM6_PME_EN	(1 << 30)
+#define CS5536_GPIOM7_PME_EN	BIT(31)
+#define CS5536_GPIOM6_PME_EN	BIT(30)
 
 /* VSA2 magic values */
 #define VSA_VRC_INDEX		0xAC1C
@@ -197,14 +197,14 @@ void cs5535_gpio_setup_event(unsigned offset, int pair, int pme);
 #define MFGPT_REG_COUNTER	4
 #define MFGPT_REG_SETUP		6
 
-#define MFGPT_SETUP_CNTEN	(1 << 15)
-#define MFGPT_SETUP_CMP2	(1 << 14)
-#define MFGPT_SETUP_CMP1	(1 << 13)
-#define MFGPT_SETUP_SETUP	(1 << 12)
-#define MFGPT_SETUP_STOPEN	(1 << 11)
-#define MFGPT_SETUP_EXTEN	(1 << 10)
-#define MFGPT_SETUP_REVEN	(1 << 5)
-#define MFGPT_SETUP_CLKSEL	(1 << 4)
+#define MFGPT_SETUP_CNTEN	BIT(15)
+#define MFGPT_SETUP_CMP2	BIT(14)
+#define MFGPT_SETUP_CMP1	BIT(13)
+#define MFGPT_SETUP_SETUP	BIT(12)
+#define MFGPT_SETUP_STOPEN	BIT(11)
+#define MFGPT_SETUP_EXTEN	BIT(10)
+#define MFGPT_SETUP_REVEN	BIT(5)
+#define MFGPT_SETUP_CLKSEL	BIT(4)
 
 struct cs5535_mfgpt_timer;
 
-- 
2.22.0

