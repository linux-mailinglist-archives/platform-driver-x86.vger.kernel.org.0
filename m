Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 286471C6534
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 02:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgEFAq3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 20:46:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729677AbgEFAq3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 20:46:29 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DDB7C061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 17:46:29 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id mq3so31467pjb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 17:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uzSFHV3ITvKQ/7263ADRrWKbjrTa7MUrRCFnCQaTnOQ=;
        b=JSjA2jqZmq7nXCLmhIZevU1F7qgOtpNXxoBsvhvF5c8lqWzc47y3E+TaBoYeIT6ih7
         r8qJBEWnBD03wmj+4Y2kjSl5a4/8fx+wlpi4SCmC3Ha3ligDrKyuYNzk2OJoVBeQUEbz
         K096SBKocPeGValnf83yxiFIgs0RwJpeAPGBqFf2Pkqj3hr4ZnUjhlpJUR1DiAAaabvN
         XtJQOuky5bbn9gi37IL10vI8JBPcvqD32N9Dj9oajPaFtM9y7Li3kH+hz09A4SOB8MqP
         MJizCEV61fnea0eyJ1GnFvgbxO4TwbF4xOy0dtbe74ug3wjtkljFP+3jsCkdJ1j7gIzs
         8HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=uzSFHV3ITvKQ/7263ADRrWKbjrTa7MUrRCFnCQaTnOQ=;
        b=tTQfmF9BGj3dEYHs5rMnkYEw/IZll7vtDpglgVB1YVSk6ERS5S8ybDD1lWX0GZtHVk
         rkEW5eTMlN5AB+hVt4gCakotqapVlGnxtXiOATe2A8UEH13x9k5Q1Tj+B4SJEMEp7e79
         Xb+sorerLa/5hdisaEuCBvGPLCK0s+qjYiA/+66zSlr50YEisPx8lQhcofPe3T9PmCz1
         O5buJc5oGhQYt3ZHrjg8/qChYbYBt3FfNYZ3f77Lkh2a05Ew81EJWLnsloqQpISZpu61
         kdCYdzhNdPItoHjBFi1bA8Z0G9D2mm4KsImJ8kteaSPKLQQPWDu8zT5vVGL1YWzqbZ7b
         ZY0g==
X-Gm-Message-State: AGi0PuZkWNoRZlWvD10fCTM04e+jlulozqySGymsTD+Kc+vpfYUroc4M
        31FEbCeb8v2i6n58Zgk+XgHmatLhUbRlaQ==
X-Google-Smtp-Source: APiQypKM2L4X8p/mFPfsTwqGjeUvPf1l8Q9Xzk/Qq45rcWAIvp3AbaMJYUOWrF005kp6N4itmVe+gA==
X-Received: by 2002:a17:902:714d:: with SMTP id u13mr5565818plm.93.1588725988766;
        Tue, 05 May 2020 17:46:28 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id g10sm41662pfk.103.2020.05.05.17.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:46:28 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id C6973243B89; Wed,  6 May 2020 10:48:47 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: [PATCH v2 2/2] [sony-laptop] Make resuming thermal profile safer
Date:   Wed,  6 May 2020 10:48:43 +0900
Message-Id: <20200506014843.18467-3-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200506014843.18467-1-malattia@linux.it>
References: <20200506014843.18467-1-malattia@linux.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mattia Dongili <malattia@linux.it>

The thermal handle object may fail initialization when the module is
loaded in the first place. Avoid attempting to use it on resume then.

Reported-by: Dominik Mierzejewski <dominik@greysector.net>
Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=207491
Reported-by: William Bader <williambader@hotmail.com>
Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1830150
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

