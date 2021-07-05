Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D494C3BC109
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Jul 2021 17:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbhGEPiv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 5 Jul 2021 11:38:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:58400 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232591AbhGEPhK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Jul 2021 11:37:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82C3861A11;
        Mon,  5 Jul 2021 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625499136;
        bh=yDH8cV6MFLEEu2EKWdiakBTwPlzjkcvVf4r8ExwE1d8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kJn689cJDVHCjngrJ2FSnYTmgG7uRW7dJ/5kc3rOsOrBt/zR8STHmT0GjDC86nzLF
         Fd1KnYQVinsvkprFJf6BauOP6zENWp07DUOFO4S60IHb/iZThO+jBqb/Ml7fVlJetq
         tqvBarlFbO6momR1g/S6XJ/ASmzraKAmPLfiTuzyxd8lS3iq39aq5BmlEyu7VX9zcD
         RWbU/VQghxLV/Q8bx+8Row9aIZqosA2CLGLVNn0hItuSnVbXyeBWe7Jer2idWB+kT0
         odDFt9Asi/6BK9BpwkSBrXmcyI1Sq0RXAxfcAxDrNk0CQEpm33CaZlnfB8h884yDy3
         OvX36BJIfsNwQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        Abaci Robot <abaci@linux.alibaba.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 6/7] platform/x86: toshiba_acpi: Fix missing error code in toshiba_acpi_setup_keyboard()
Date:   Mon,  5 Jul 2021 11:32:06 -0400
Message-Id: <20210705153208.1522553-6-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210705153208.1522553-1-sashal@kernel.org>
References: <20210705153208.1522553-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

[ Upstream commit 28e367127718a9cb85d615a71e152f7acee41bfc ]

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'error'.

Eliminate the follow smatch warning:

drivers/platform/x86/toshiba_acpi.c:2834 toshiba_acpi_setup_keyboard()
warn: missing error code 'error'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Link: https://lore.kernel.org/r/1622628348-87035-1-git-send-email-jiapeng.chong@linux.alibaba.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/toshiba_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 1ff95b5a429d..974d4ac78d10 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2448,6 +2448,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 
 	if (!dev->info_supported && !dev->system_event_supported) {
 		pr_warn("No hotkey query interface found\n");
+		error = -EINVAL;
 		goto err_remove_filter;
 	}
 
-- 
2.30.2

