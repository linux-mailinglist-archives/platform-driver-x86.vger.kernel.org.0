Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F2A813EBEF
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Jan 2020 18:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406003AbgAPRoz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Jan 2020 12:44:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:36114 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405999AbgAPRoy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Jan 2020 12:44:54 -0500
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9821B24778;
        Thu, 16 Jan 2020 17:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579196693;
        bh=S02Uqx2cIoVViNdU7fmqXP8bsKrc4BJN5nZqkKpoG+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZeGx8m+jCQTH80o0SBFkISNcSo1+E1WdA0u9w+qb4aCdsxNC4e9M+zEOBb/yBEIih
         66dsp5rNKqiEaInI+dPvdZDdQnPGjP3nACxucORPZVRpGPXSzyBogAJ8rYYPhMp/jj
         izXlcnGp9qeniC+vd63syUDnDVwYkl8vzvEtukyk=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 088/174] platform/x86: alienware-wmi: printing the wrong error code
Date:   Thu, 16 Jan 2020 12:41:25 -0500
Message-Id: <20200116174251.24326-88-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>

[ Upstream commit 6d1f8b3d75419a8659ac916a1e9543bb3513a882 ]

The "out_data" variable is uninitialized at the point.  Originally, this
used to print "status" instead and that seems like the correct thing to
print.

Fixes: bc2ef884320b ("alienware-wmi: For WMAX HDMI method, introduce a way to query HDMI cable status")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/alienware-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
index 3df47c1b04ec..f5585740a765 100644
--- a/drivers/platform/x86/alienware-wmi.c
+++ b/drivers/platform/x86/alienware-wmi.c
@@ -511,7 +511,7 @@ static ssize_t show_hdmi_source(struct device *dev,
 			return scnprintf(buf, PAGE_SIZE,
 					 "input [gpu] unknown\n");
 	}
-	pr_err("alienware-wmi: unknown HDMI source status: %d\n", out_data);
+	pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
 	return scnprintf(buf, PAGE_SIZE, "input gpu [unknown]\n");
 }
 
-- 
2.20.1

