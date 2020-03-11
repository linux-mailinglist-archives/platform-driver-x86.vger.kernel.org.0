Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B5E18140F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Mar 2020 10:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbgCKJHn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 11 Mar 2020 05:07:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:40842 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728245AbgCKJHn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Mar 2020 05:07:43 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 82DA9B1A6;
        Wed, 11 Mar 2020 09:07:41 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Mattia Dongili <malattia@linux.it>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: sony-laptop: Use scnprintf() for avoiding potential buffer overflow
Date:   Wed, 11 Mar 2020 10:07:39 +0100
Message-Id: <20200311090739.20543-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Since snprintf() returns the would-be-output size instead of the
actual output size, the succeeding calls may go beyond the given
buffer limit.  Fix it by replacing with scnprintf().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/sony-laptop.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
index fb088dd8529e..51309f7ceede 100644
--- a/drivers/platform/x86/sony-laptop.c
+++ b/drivers/platform/x86/sony-laptop.c
@@ -827,10 +827,10 @@ static ssize_t sony_nc_handles_show(struct device *dev,
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(handles->cap); i++) {
-		len += snprintf(buffer + len, PAGE_SIZE - len, "0x%.4x ",
+		len += scnprintf(buffer + len, PAGE_SIZE - len, "0x%.4x ",
 				handles->cap[i]);
 	}
-	len += snprintf(buffer + len, PAGE_SIZE - len, "\n");
+	len += scnprintf(buffer + len, PAGE_SIZE - len, "\n");
 
 	return len;
 }
@@ -2187,10 +2187,10 @@ static ssize_t sony_nc_thermal_profiles_show(struct device *dev,
 
 	for (cnt = 0; cnt < THM_PROFILE_MAX; cnt++) {
 		if (!cnt || (th_handle->profiles & cnt))
-			idx += snprintf(buffer + idx, PAGE_SIZE - idx, "%s ",
+			idx += scnprintf(buffer + idx, PAGE_SIZE - idx, "%s ",
 					snc_thermal_profiles[cnt]);
 	}
-	idx += snprintf(buffer + idx, PAGE_SIZE - idx, "\n");
+	idx += scnprintf(buffer + idx, PAGE_SIZE - idx, "\n");
 
 	return idx;
 }
-- 
2.16.4

