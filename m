Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8014B1C7020
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 14:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgEFMQj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 May 2020 08:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728079AbgEFMQj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 May 2020 08:16:39 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44237C061A0F
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2020 05:16:39 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id t9so861863pjw.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2020 05:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OJso7JcYXu1dId7qfvL5yktCykiKyAqEkeB6wwi0AIU=;
        b=sIfDNdOxxxSt1f2bC3DPKEMnteIKmbdzTn8AGAQ6PseyHjqZUKQoH79l4rtLBl4+vA
         zrEUlkOcM4f8Jqvu8z0+9Se19EgZxqtJnX0hBT2h38FIqGDQkFur9ZIhIoi9pLWGAsPB
         BRvWjF5lEK5XX9sSfR2tvnxs3oq6mpBJWhE1x6aiJzBIy6p6MG0mRQF5qa7I4CRZsFmL
         QRh2DBeUc1X62TWw2GoHTJabC5mGY+sKXTduYBSF939vslgOWCXiE1WjKiUyJnctSUae
         GNsR3ryGty/6A0ps1b0jgBG7WdkN4ct0JZpmzmakDXvkDA4nS7Lpm/ucHaOXsNafpFaK
         qwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=OJso7JcYXu1dId7qfvL5yktCykiKyAqEkeB6wwi0AIU=;
        b=b81YNZYPDI1WpLSR0ZmD5fev14LsZhSlnzkzycNWcHqNvSmNLnLdHkITyJ+DeiGVi2
         OZQPDm/DNux3PW1rcC4AHjJxHsOkNoX66eRB9/Q6RfS0C5xHV5M58QuCl//xWWbdC1Uu
         bhbnWwxQrp4gUE227sHDJ/z44kUPqctpTj0gI5tAi35a0eBTi7YNmU39Wuv27to8+xrP
         xNi4C2NELo9eQRNrqDrpvdQdw2ZP1BXoEUTQ7B50m2srgfCH9R/DNARP9Udm2d3Na6K3
         cFBMNSx/HEjC/s3L3nhLx9gOjjfg+hotG7Hl6RJCJ/hCCPnAVhX8FYaCjSb8AMff9iHK
         XFYw==
X-Gm-Message-State: AGi0PubXtqLYDdeBahhLoB5IEkTEHcxoiK6Qz/83z70P/+kADODsbi4I
        9gKOTPAeizeEZLGJImxSQjZ3RbWKPaE=
X-Google-Smtp-Source: APiQypJRFtaz0Ya+iHYyL2vrE1S7cQqNQCy1VWdGMaqEmTXWHjUAapuJW41c2+Zm3rUbRHI9Fd8Dig==
X-Received: by 2002:a17:902:d883:: with SMTP id b3mr7427930plz.133.1588767398646;
        Wed, 06 May 2020 05:16:38 -0700 (PDT)
Received: from hilbert.taihen.jp (ae146065.dynamic.ppp.asahi-net.or.jp. [14.3.146.65])
        by smtp.gmail.com with ESMTPSA id k6sm4626748pju.44.2020.05.06.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:16:35 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id 985CF248D17; Wed,  6 May 2020 21:16:33 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>
Subject: [PATCH v3 2/2] [sony-laptop] Make resuming thermal profile safer
Date:   Wed,  6 May 2020 21:16:30 +0900
Message-Id: <20200506121630.72382-3-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200506121630.72382-1-malattia@linux.it>
References: <20200506121630.72382-1-malattia@linux.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mattia Dongili <malattia@linux.it>

The thermal handle object may fail initialization when the module is
loaded in the first place. Avoid attempting to use it on resume then.

Fixes: 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer objects for ASL create_field() operator")
Reported-by: Dominik Mierzejewski <dominik@greysector.net>
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207491
Signed-off-by: Mattia Dongili <malattia@linux.it>
---
 drivers/platform/x86/sony-laptop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index 425707e8d188..2ec115f378b2 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2278,7 +2278,12 @@ static void sony_nc_thermal_cleanup(struct platform_device *pd)
 #ifdef CONFIG_PM_SLEEP
 static void sony_nc_thermal_resume(void)
 {
-	unsigned int status = sony_nc_thermal_mode_get();
+	int status;
+
+	if (!th_handle)
+		return;
+
+	status = sony_nc_thermal_mode_get();
 
 	if (status != th_handle->mode)
 		sony_nc_thermal_mode_set(th_handle->mode);
-- 
2.25.1

