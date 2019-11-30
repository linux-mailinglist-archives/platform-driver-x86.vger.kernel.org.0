Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E7010DD2C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725835AbfK3Ixf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:35 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40138 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfK3Ixf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:35 -0500
Received: by mail-wm1-f67.google.com with SMTP id y5so17410383wmi.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to;
        bh=3mb8ushXHaF1VxAyamLiRoQjG9YXwH7278npc0S966Y=;
        b=ZD7rpB5AOB1Y1ri/LdTDXmW80NuIhk8hP0sNY7ZeOiB2OqpFA3bQeEaMKcco1PvAqU
         RWTgTyEOemiaG64aLTD9hV8pBXKThBq5vE63UsJrHzdNFhPHfUMmJydsO4dxp8bECu0/
         aSnWfEiOo6Pqg7qTv/0QY6ak1FQoVjWRv6VDowP/aO54Io/qWaYTX50sk+WGUUKr6oms
         ohkSfj3Ieq+KVPvQlY7lH2etDyVVDK2XExOr+duaIn4iq3q0HVfriKVv9MAUeBaKqSLy
         v9D/U4f6D7H3kJ00L13eYtaQx9K9zMCI4sKInMdUvqM9Oq0nTPMzhCkT+nbcF8gZHNsx
         PM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to;
        bh=3mb8ushXHaF1VxAyamLiRoQjG9YXwH7278npc0S966Y=;
        b=Y4MIJt4xMR+4toGUz9e996EgzfqAd5RI2aJZED/K/3uBzbsTi4DZA6YZy3zusgBoqc
         REuf1CWdjoPUdMfhEfd5wvfWScOSeCEbUWGBFrbxsXIaeLhLHIY5/EkW+Ui1bGM6CeVP
         puk4o2+2efFQ+L0vWl69Wy6NIzO/q44GwIC0v+ZkTrdQJ0OCfZEmKTPaCUjFO32U+xgt
         iAMLT9Ip81dTSqcRvY3SrNonMYgurPjXKvlXO4fkYbK9FmD8zgHECIYGvTqIkidGOAMG
         FaxDN1XmQscI0uw/CsSiNpSk2mcSj++X3n/9cVpPR+Vmo7/Hb6Fq4aEFHpwLEp+UXDAU
         fCxA==
X-Gm-Message-State: APjAAAXKgn9PY0w/BQAQUlVo5fmxi6JDKCnsL1b9xJHJORDKpsdn7zH4
        Lv+eDt9EzwdFv/BUgKmi49JfXU+19g==
X-Google-Smtp-Source: APXvYqxEz1bM7jGJQMw6JmQEUyEcyam96QrFliKwgp5AktG9lqcrGu7Cw9wZfp4bkoMdXn4LPXecew==
X-Received: by 2002:a7b:cd8b:: with SMTP id y11mr11360018wmj.95.1575104012759;
        Sat, 30 Nov 2019 00:53:32 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id c9sm15669843wmb.42.2019.11.30.00.53.31
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:32 -0800 (PST)
Message-Id: <42c3dd11018c45d402a5112be2f3a3fb884baf5a.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
References: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:40:45 +0200
Subject: [PATCH V2 2/7] platform/x86: lg-laptop.c: Use a small buffer instead
 of a full page for sysfs
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

reader_mode_show() is now called from the driver itself, so only allow
a small buffer for the boolean text.

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

