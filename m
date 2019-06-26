Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7BC056597
	for <lists+platform-driver-x86@lfdr.de>; Wed, 26 Jun 2019 11:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbfFZJV2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 26 Jun 2019 05:21:28 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44576 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726042AbfFZJV2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jun 2019 05:21:28 -0400
Received: by mail-lf1-f66.google.com with SMTP id r15so1053447lfm.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2019 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VH7oTYHmSKHUcoWXP6UAO65cW8j0fNZN/krPrH7uTzw=;
        b=PZMTkcInq+vHJgj0adZMZp1wjoAebcE9IFNwOiBoVEMC6pUz1aiL1+d3iu/YagqB1/
         JgO9HV1VLMDyOQ1BlWQpxmFkUfhBKlEUpWZiDDfr0YdmyMxlBd/CP1uA/qSl3SC99wME
         tgMY2lHiQSIDXUG4dqdLJkSlfHv8NPczFlgtq7pSBmc9Nn20Ruv1LQKfcDdpJEhGWdes
         SPsmTUc3VbPN2ABO+JH7ZY0J2NYjLZ3HgqziucPXydA11s9sIek0B9vfRqrkAvCAgme0
         Gkj5Z77IxVtc1+uDvpgsHKDzf3eoAJbGcxxJBZWVe7B9Rp5LjzLZ6AkwEn82Zst1TyWX
         lldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VH7oTYHmSKHUcoWXP6UAO65cW8j0fNZN/krPrH7uTzw=;
        b=SxnEItj+C+LwT260664wi4CND6kL7Oz9yWMmS0M7q0+vTsbgzynqubs2o32mFJItsM
         fIRiQ0AWrfstL4wVzwSZgPEcR4hG8mgKa7Hb0tue7cBGc5XoNlJeUT/m9m4EblG4MAWt
         yypdHbF1Y0VS9rBM8weFFm3yxpsyXUJmBPabzHBubrb+tGgIF0dbe54EcBql4Y8KrYnn
         pim3tqOyqeOGP0i1LMNEaN5YwTPVSgbETDl1lvAkbWnjdaNvm1dZkMKu+JrwI7ROqETE
         7So8UDUoeSHbarsaQ7Cj2grm/J6QhAyzzIcMrFpgfWBqIRCY0MH2eNDUzglpKi+rqNf1
         z9PQ==
X-Gm-Message-State: APjAAAXSytiRueFRjuJtKGUfuWhZHn9x2TnbbhfxfRS354j+yyA0jyXy
        a3wDszf047MR6O3AViMzS/HcQg==
X-Google-Smtp-Source: APXvYqx4nNsucGWlVwflOOFUyu0fHQG1a47CpotZlPdhTw9fQDFNEjmc4eqUc3ZIPNJqMJQID7pKMA==
X-Received: by 2002:ac2:47fa:: with SMTP id b26mr2094845lfp.82.1561540886416;
        Wed, 26 Jun 2019 02:21:26 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m28sm2705394ljb.68.2019.06.26.02.21.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 26 Jun 2019 02:21:25 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     x86@kernel.org
Cc:     linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Andres Salomon <dilinger@queued.net>,
        linux-geode@lists.infradead.org,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] x86: platform/geode: Drop <linux/gpio.h> includes
Date:   Wed, 26 Jun 2019 11:21:19 +0200
Message-Id: <20190626092119.3172-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

These board files only use gpio_keys not gpio in general.
This include is just surplus, delete it.

Cc: Andres Salomon <dilinger@queued.net>
Cc: linux-geode@lists.infradead.org
Cc: Andy Shevchenko <andy@infradead.org>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Cc: x86@kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/x86/platform/geode/alix.c    | 1 -
 arch/x86/platform/geode/geos.c    | 1 -
 arch/x86/platform/geode/net5501.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/x86/platform/geode/alix.c b/arch/x86/platform/geode/alix.c
index 1865c196f136..abcf27077bac 100644
--- a/arch/x86/platform/geode/alix.c
+++ b/arch/x86/platform/geode/alix.c
@@ -24,7 +24,6 @@
 #include <linux/moduleparam.h>
 #include <linux/leds.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
 #include <linux/dmi.h>
diff --git a/arch/x86/platform/geode/geos.c b/arch/x86/platform/geode/geos.c
index 4fcdb91318a0..529ad847d496 100644
--- a/arch/x86/platform/geode/geos.c
+++ b/arch/x86/platform/geode/geos.c
@@ -21,7 +21,6 @@
 #include <linux/string.h>
 #include <linux/leds.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
 #include <linux/dmi.h>
diff --git a/arch/x86/platform/geode/net5501.c b/arch/x86/platform/geode/net5501.c
index a2f6b982a729..30cb3377ecc7 100644
--- a/arch/x86/platform/geode/net5501.c
+++ b/arch/x86/platform/geode/net5501.c
@@ -22,7 +22,6 @@
 #include <linux/string.h>
 #include <linux/leds.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
 
-- 
2.20.1

