Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F5BD643AB
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Jul 2019 10:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfGJIj6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 10 Jul 2019 04:39:58 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:39823 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726580AbfGJIj6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 10 Jul 2019 04:39:58 -0400
Received: by mail-pl1-f194.google.com with SMTP id b7so866459pls.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jul 2019 01:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HB+mkVr1ZXOzFsD+N0O5kx8Ym7/brnZhhba0CIpRJQY=;
        b=cHkgSDmtuV+rYlSoj/QaG5RoHYRYZjWDZs9it/01tjPsVI3AtH5ghg/2v9V/9XJNeW
         K+7/pKAYN2SAY+DFuFcdy75V9hYLTd+MKhD2YY66eBqZaxX73CjJBURHQ3RQ9NrzeEtu
         Ku0PAhVXGuj1XgFDC/Iz7IUsfqeV61yWwkZYzpmIEpXI8Kekx8uNJonYD3u5mgIWHG5X
         kRTNqNhdlVjVUi+ofobqrIYQakXQDtdwPqxCrsW20XE3AMBtvVoWrTBKFMkcsbpvnNpu
         sI3jmkApqeGkZUF06MbCxLKZpnwlAvh9GsthThyFfuH1Dzth6QEL/ULr/V6R5MvjIoRT
         7w2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HB+mkVr1ZXOzFsD+N0O5kx8Ym7/brnZhhba0CIpRJQY=;
        b=hB9+OqcyiLHajpMQeNtfynQUo7k1DRuk1qXC/qmlw/wdezq6/wY7sXBajauY6y3LRh
         VMDTaCbe2fMWulzBfMONq1OrCcRWR3uXfZMY8FypcDM+RRdEXfoQ/zBSEOPGhvLrumm+
         CIldOXgZnYt3kzji9BxpcMVzB6rfOUqM0ecoWSBnTxxUXBSO4RtuIj5U7dx5LIp2syp2
         u9qH2w+glbTTV/lbyDhsvCpU3It9mgf7ubFNrI8sk/1c3bIN76AQwNSFQY8kosJrFjA4
         KBZAiAEmDXb0YPQHa7S59bzWjT3PLzFXuwTK+2giBBsBuyYHn2qvJ6cpMlovwukjxD6q
         9zUw==
X-Gm-Message-State: APjAAAXpmjtTz3SdIBqXK2ZrPSOv334vIOdJh36FHlPmrw+yW8W1fD5S
        uI3/HSPyvHvoDARf5569zYY=
X-Google-Smtp-Source: APXvYqyEob1tet/iRfEnAfQiFb0v+nMU7vYWc08VWNoP5Bnj3WSh15gUTQW2LBSzXaRNV1YOTdmeeA==
X-Received: by 2002:a17:902:7c05:: with SMTP id x5mr15876311pll.321.1562747997676;
        Wed, 10 Jul 2019 01:39:57 -0700 (PDT)
Received: from arch ([103.249.233.109])
        by smtp.gmail.com with ESMTPSA id a12sm4385986pje.3.2019.07.10.01.39.54
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 10 Jul 2019 01:39:56 -0700 (PDT)
Date:   Wed, 10 Jul 2019 14:09:52 +0530
From:   Amol Surati <suratiamol@gmail.com>
To:     dilinger@queued.net, dvhart@infradead.org, andy@infradead.org
Cc:     linux-geode@lists.infradead.org,
        platform-driver-x86@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        suratiamol@gmail.com
Subject: [PATCH v2] cs5535: use BIT() macro for defining bit-flags
Message-ID: <20190710083952.GA23299@arch>
References: <20190707113016.GA30635@arch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190707113016.GA30635@arch>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Inside cs5535.h, there are two definitions -
CS5536_GPIOM7_PME_FLAG and CS5536_GPIOM7_PME_EN
- which are defined as equal to (1 << 31), where 1 is expected to be of
width at least 32-bits. But, since 1 is also treated as signed, its width
reduces to 31-bits, a situation which invokes the undefined
behaviour (***).

These definitions aren't a problem for gcc; it allows them to be defined
and used safely. But other compilers may not, for instance, if such
definitions are pulled in, as part of public APIs, into code the
compilation of which may be carried out by a variety of compilers with
differing compliance levels.

The BIT() macro changes the type of integer 1 to unsigned, thus allowing
its shift by width-1.

Use the macro, to make the two definitions standards-compliant, and to
maintain consistency.

*** About bitwise shift operators, from the C standard:
"If the value of the right operand is negative or is greater than or
equal to the width of the promoted left operand, the behavior is
undefined".

Signed-off-by: Amol Surati <suratiamol@gmail.com>
---
v2: As suggested by Andy Shevchenko,
       - include <linux/bits.h>,
       - describe the problem in detail.
 
 include/linux/cs5535.h | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/include/linux/cs5535.h b/include/linux/cs5535.h
index 2be1120174eb..d6d062686dbf 100644
--- a/include/linux/cs5535.h
+++ b/include/linux/cs5535.h
@@ -8,6 +8,7 @@
 #ifndef _CS5535_H
 #define _CS5535_H
 
+#include <linux/bits.h>
 #include <asm/msr.h>
 
 /* MSRs */
@@ -91,21 +92,21 @@ static inline int cs5535_pic_unreqz_select_high(unsigned int group,
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
@@ -197,14 +198,14 @@ void cs5535_gpio_setup_event(unsigned offset, int pair, int pme);
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

