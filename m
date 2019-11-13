Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB1A7FB62B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:17:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbfKMRRr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:17:47 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:34702 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727756AbfKMRRr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:17:47 -0500
Received: by mail-wm1-f68.google.com with SMTP id j18so5415171wmk.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:to:from:date:subject;
        bh=pHR8j30RGSHWnU9NGLGFnE70dEFM6TiWC5ia7jEWtHU=;
        b=Ynh96sXGEcNK72TNGdrebIV5MN+Qq6UJxD6EqHh5GBkA22vDQojHC1jLdE5frRrPXA
         D1vuRPQJo5X5J1ZmycR6GEiUy28ZuhmjHQvxCw+k3BfpjnyXzHWpngaVymwJ/hKfx4XE
         S6QqRv8FZwT6gY3RgRI90cS7kylo0AyDjH808G5AJzzJ+OOM4GiGnv8OvfTJjH60jxBa
         y44HkTt5lH7URjO+e8JfajdS0HZk3f4kE48ZA/LxEZu8z/cXbbVq+TTf9YYlZQxL7WMj
         aGAboyqwflEPwW0dQu/6dQAy6Iew9GANtkpuc9LQsyXNl37xFPMLHongJfkPKXuwvIuY
         rIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:to:from:date
         :subject;
        bh=pHR8j30RGSHWnU9NGLGFnE70dEFM6TiWC5ia7jEWtHU=;
        b=JLX0/fOLdhWz+EdJdz8MImN3qy55yYkdDQ4r3AM3lO6HELLjhxQlrasDYCUsQwZQIF
         0BNFj7/7NFUcWMpGeIkZNpsbqDwA9gT6m/gVq+mGmMoWckF7MspFV1myBLyBlYRVOBLl
         b63inudRAHK0pY4f/2U293J5pCmPga/v23h5CKP/8U5jdpYe6DHo0oRsYbtDi0qrutl/
         KVR8qyQQcpcPiaoMbmfEBUHwJgppr7rB3peoACXy+Cd+HtQFbHXR2NVULRsIUm6JepNI
         IYUzxd85goI+/CPnXo8v9VLX19GX5AGWzDg1TAutahbKrDLJE5mPwPKL6GWu5zSYNoQ3
         +48g==
X-Gm-Message-State: APjAAAWr2uC0huSM+HmsD1rMmfpFrcM1eyYJoEDItnjTDBygqG8sbek2
        Wywme0norfFMto9g7TeAXqclmiquSg==
X-Google-Smtp-Source: APXvYqxIydW8Pba/eg+eH0YJs621XHxmwqm+HO/Rk8M8nJAZwOX3S0fSS8Ex9noUe+KOt2tK3GUj0g==
X-Received: by 2002:a1c:113:: with SMTP id 19mr4028694wmb.42.1573665464877;
        Wed, 13 Nov 2019 09:17:44 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id m3sm3413550wrw.20.2019.11.13.09.17.44
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:17:44 -0800 (PST)
Message-Id: <5ea6e01f40532de9920da64dcfd915f23d9323b8.1573664004.git.matan@svgalib.org>
In-Reply-To: <cover.1573664004.git.matan@svgalib.org>
References: <cover.1573664004.git.matan@svgalib.org>
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 17:43:34 +0200
Subject: [PATCH 3/7] Fix bug in writing fan mode value
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The new writing method is simpler, and appears to work in all cases.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index ab79457d5ffe..467143394ca9 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -298,9 +298,8 @@ static ssize_t fan_mode_store(struct device *dev,
 
 	m = r->integer.value;
 	kfree(r);
-	r = lg_wmab(WM_FAN_MODE, WM_SET, (m & 0xffffff0f) | (value << 4));
-	kfree(r);
-	r = lg_wmab(WM_FAN_MODE, WM_SET, (m & 0xfffffff0) | value);
+	r = lg_wmab(WM_FAN_MODE, WM_SET, (m & 0xffffff0f) | (value << 4) |
+		value);
 	kfree(r);
 
 	return count;
-- 
2.21.0

