Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C826EFB62A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:17:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727779AbfKMRRj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:17:39 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40257 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfKMRRj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:17:39 -0500
Received: by mail-wr1-f67.google.com with SMTP id i10so3290787wrs.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:to:from:date:subject;
        bh=RKHOe/VuKJG2BYY4s/Pq+VgKSC7IeWJxAphZkjtpWdY=;
        b=N+I9WcCoW9AzklHeuHduF9YRftOorWDvdB0ZKCX+QQz84VX0H7P58BmY+UsnXIxbDC
         kMeSVT56EqGQcT7v/A+Rwla4WtxccAM6U95O9GK/pZ2tFMj++/bdp8R/9EXXXDy6UWnT
         ew5pqkjqcF66yQb/Mqg5snN1p5sZ0PhDth9xs5fiLzFkyZXPpaEPW00JSjACuT9s5/j3
         oQ4fpqzDPYOrQ2mfMaj5dsMB0kpjx1ivq/UA/rgPf8DZkvW+yHxskXL2TznX/EczgLGb
         U5E8Vzb5jaonQ5yEXgNszBxGh1e0friUQZ7rox1yzclbBKkVDYCXJZGdHxz6VOM/XTvt
         5AFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:to:from:date
         :subject;
        bh=RKHOe/VuKJG2BYY4s/Pq+VgKSC7IeWJxAphZkjtpWdY=;
        b=Wj3wb6GI3ryZawYRwaoWuJPG32rTm7JnPsIIw12rDjQ9Ge3H5JxUZ3M28/O7SUuWjZ
         tiSs0Y/hHSx1moouiI+g9G5Egu+UTpwSJHYCg67KHvK8puR1qfivScAYKnKd0pRNYm5R
         DH3WcPAmu9iJMxXw8OyXok982rhkAAYag9/PNe8wxK0UrJz4hvIcOhep0euLY80QJMsy
         fv1p2spRkBANlvX3qAzmrnED2jSxSE3+z3Kss3fDSWmDjJmOSDAF/ZAVugXEI0iqDrlp
         G5owhCzNV2iwHPkZpAHV/xfF6dRimanRsPZgghIS4k383ah07Gi4+53GGYADYLt9nWWI
         08JQ==
X-Gm-Message-State: APjAAAXHYsdWRFHVLko8brhb7PcoRCuOBTiPwqOVcy5gU6zUnC3KwPq6
        67/6d8QjC2hR4x/1+xfGEf+ttwUS/A==
X-Google-Smtp-Source: APXvYqx9welhntBJX3JBg0OFhvOjpoWHPvXRZojuVcGbieplVYcL3G/BjzyXTRcqzPIt51B1ZdcX4Q==
X-Received: by 2002:adf:c641:: with SMTP id u1mr1710179wrg.361.1573665455340;
        Wed, 13 Nov 2019 09:17:35 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id x6sm3815007wrw.34.2019.11.13.09.17.34
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:17:34 -0800 (PST)
Message-Id: <13bfc53c39fcf7f38012c664ee8bcbfcbb738b3d.1573664004.git.matan@svgalib.org>
In-Reply-To: <cover.1573664004.git.matan@svgalib.org>
References: <cover.1573664004.git.matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 17:42:35 +0200
Subject: [PATCH 2/7] Use a small buffer instead of a full page for sysfs
 boolean output
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

reader_mode_show is now called also from within the driver, on a buffer 
allocated on the stack, so make sure it only uses a small buffer.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index 78d3e3d2e51a..ab79457d5ffe 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -28,6 +28,8 @@ MODULE_DESCRIPTION("LG WMI Hotkey Driver");
 MODULE_LICENSE("GPL");
 MODULE_VERSION("1.1");
 
+#define BUFFER_SIZE 16
+
 #define WMI_EVENT_GUID0	"E4FB94F9-7F2B-4173-AD1A-CD1D95086248"
 #define WMI_EVENT_GUID1	"023B133E-49D1-4E10-B313-698220140DC2"
 #define WMI_EVENT_GUID2	"37BE1AC0-C3F2-4B1F-BFBE-8FDEAF2814D6"
@@ -406,7 +408,7 @@ static ssize_t reader_mode_show(struct device *dev,
 
 	kfree(r);
 
-	return snprintf(buffer, PAGE_SIZE, "%d\n", status);
+	return snprintf(buffer, BUFFER_SIZE, "%d\n", status);
 }
 
 static ssize_t fn_lock_store(struct device *dev,
-- 
2.21.0

