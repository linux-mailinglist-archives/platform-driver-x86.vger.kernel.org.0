Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFA81C9F7B
	for <lists+platform-driver-x86@lfdr.de>; Fri,  8 May 2020 02:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgEHAOP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 20:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgEHAOP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 20:14:15 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E929AC05BD09
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 17:14:14 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id fu13so3397011pjb.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 17:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JZEQgmBF3/NfHvLhdKeS48E7iP3zrDaH5NoG2w+hpd4=;
        b=WATeIJfJ6MRsD4EKtQiVDUkzbCMxrHPPE86amIrJC0OBHAdGzRW59a+f8KBCl+HfUl
         xRuDCQK3bDeoOGvf+MRUgiHhM2Fgbc/StZkg44CS1qqpqyjp/brqsJfeKT50F3caa5h7
         6b9GIDc/knQmQ2OIv8Ohj6ZzGdSh716hcgXlh66K4Wb7QeJTY+MkR9WDUiJkzbJiHAq6
         iD/VO6sN+MA/78v8D7h6uD0PJfA73/sWCuUgrxXMcxEKrgerLgFDsrfDPL2kDZM3OPWY
         L/yBFPGwihfVB2cNG1QDpBTxs6PjemIuBKkP+aTv3hg3cWsDLvaCVYojm+sfcv8tfIn1
         T2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=JZEQgmBF3/NfHvLhdKeS48E7iP3zrDaH5NoG2w+hpd4=;
        b=EUa+HBj+Kba4UIXSWcc/D+LmYmYpoFLwhwuOr8wcWBSU2nadPiVTEQKFnUGKiGd14J
         CgJK2nt23msXVCIWn7PmY98P5pqxlk5RwVULgElOKeZ9mb0RkpvCe9DIuU7W8FN7dW/7
         N8K7tDDa9we4FRZkdVIipFQK59VG5RI14nxwrkBOTJwiRTP6gX1POZHoDVcMNgHcvfd5
         cXAs003fYy2WgyEoMzrcNHPe0ZCKy+HZxITPGw2j6nAEl7oE1mBYY5NB8fqUPzVdC/jX
         r5PUuW3pRt1Hua0TYJvIyDunkaozL78np4jqJRTT6lSXwS336P/1jYHUK0TM+lNo+wvh
         O4nw==
X-Gm-Message-State: AGi0PuYkzcqWmTh446RXogzJuwNbBtZYYGR06GW+48+OekG9IKXKJb9t
        Ru3imQBCDar+5gbWV12LWGw=
X-Google-Smtp-Source: APiQypLtq0C2fyYjody9y9G59vGFqvQQUhB/A4vzppXCN8uT9umDa+YmVXRUfBtgjgAMji5CGYs0JQ==
X-Received: by 2002:a17:90a:20ee:: with SMTP id f101mr2938663pjg.197.1588896854404;
        Thu, 07 May 2020 17:14:14 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id g61sm801039pjg.55.2020.05.07.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 17:14:13 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id A8A1F243BF4; Fri,  8 May 2020 09:14:08 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>
Subject: [PATCH v4 2/2] platform/x86: sony-laptop: Make resuming thermal profile safer
Date:   Fri,  8 May 2020 09:14:05 +0900
Message-Id: <20200508001405.71176-3-malattia@linux.it>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200508001405.71176-1-malattia@linux.it>
References: <20200508001405.71176-1-malattia@linux.it>
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
index 6932cd11e660..e5a1b5533408 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -2288,7 +2288,12 @@ static void sony_nc_thermal_cleanup(struct platform_device *pd)
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
2.26.2

