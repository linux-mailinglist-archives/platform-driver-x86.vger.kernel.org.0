Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3927F10DD2E
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfK3Ixh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:37 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45402 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfK3Ixh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:37 -0500
Received: by mail-wr1-f67.google.com with SMTP id j42so11931417wrj.12
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:in-reply-to:references:from:date:subject:to;
        bh=t1nJSsBLj/NZWq86kzyhY+eHkbTwpmSgcF/y4rVv7mk=;
        b=VsF0H4Ku1gYvdDM4g4D1lssOEV3j5A0K8Icah1e/CEy3vLEHDP2I/2xtf4+flW2gRI
         fQd4Xj4ljntter7ICEFOaxJgeqo/B9HqD6lrx2mfIT1HVGUdk+/wW9S/9v6gYFRtkibh
         fwArbST0w4T3PSH0BJOKqtzqg4erUuLp9TIiWemvmxQRF/DBm5RjxUHkchJiMwPNTqY2
         Vdo8YuLu4ct30S/du5IbIFGmUaUny3Mqt2nR84zlEFWLz6lSLilsokJuzh2LTAIsQ0kV
         gnbSfI2Bupj/3APFoB9pHwCJQyef3KQbW0/eEOO2evRlchX7CgRuXWYcPCvEU3kqRRjr
         8nOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:in-reply-to:references:from:date
         :subject:to;
        bh=t1nJSsBLj/NZWq86kzyhY+eHkbTwpmSgcF/y4rVv7mk=;
        b=uG5JjZXzG/tdNwilUTbXoWH5cI/1w8ONqm6O02lZCY8wcox+jkyTSMnAlxtuP3Pxvf
         Yxu4vwAa5zKnuz4HRt5EFsM9QjqCaS6VUDvrXiqgAvwidaoetlg2ijNoG1aCeu2gECk8
         MYayTA+3USqLEFI3V9TjR6WthrTMINmdUGRsWswu0NoquZxjn4SygRb2NG1udQ2J3VJn
         eNMJK1c6zYj+jknin5ob4II+JBU5C1whxZirZHwbPMxVoetBX/Mopya4z7aLNchfk4HQ
         YWe/J3ZxyqKPKpLaabACh9/0aZXd8+axTykH1qYR9LnqhbMBVfsCaySw18Lr92vl8onC
         P+DA==
X-Gm-Message-State: APjAAAVwc3LNDUqWtQFA/P6gFtcN9cx1/G5wdOTwzhjfxMdqrhIY5T2v
        8dppuO7nqrkafJ51QI/5aoQBgOMhSg==
X-Google-Smtp-Source: APXvYqz7/GsXFIW2E4XyJxhXA7MhIm39nQuZVh9ORVM3Db7A5JGShQBeymgxKgv9Bt2LJumyqLlIDQ==
X-Received: by 2002:adf:dc06:: with SMTP id t6mr60547520wri.378.1575104015036;
        Sat, 30 Nov 2019 00:53:35 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id m13sm16456749wmc.41.2019.11.30.00.53.34
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:34 -0800 (PST)
Message-Id: <d92d9a30ce01b450857cee065317e6de0fb571d3.1575103866.git.matan@svgalib.org>
In-Reply-To: <cover.1575103866.git.matan@svgalib.org>
References: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:41:39 +0200
Subject: [PATCH V2 3/7] platform/x86: lg-laptop.c: Fix a bug in writing fan
 mode value
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Simply write the desired value to the register. This seems to work,
unlike the previous complex method.

Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
---
 drivers/platform/x86/lg-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
index ab79457d5ffe..2f0ce69d8e31 100644
--- a/drivers/platform/x86/lg-laptop.c
+++ b/drivers/platform/x86/lg-laptop.c
@@ -298,9 +298,8 @@ static ssize_t fan_mode_store(struct device *dev,
 
 	m = r->integer.value;
 	kfree(r);
-	r = lg_wmab(WM_FAN_MODE, WM_SET, (m & 0xffffff0f) | (value << 4));
-	kfree(r);
-	r = lg_wmab(WM_FAN_MODE, WM_SET, (m & 0xfffffff0) | value);
+	r = lg_wmab(WM_FAN_MODE, WM_SET, (m & 0xffffff0f) |
+		    (value << 4) | value);
 	kfree(r);
 
 	return count;
-- 
2.21.0

