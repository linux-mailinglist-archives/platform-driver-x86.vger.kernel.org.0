Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52E3B38EBEF
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 May 2021 17:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234736AbhEXPIo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 May 2021 11:08:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38186 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234144AbhEXPDK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 May 2021 11:03:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5ED3E61261;
        Mon, 24 May 2021 14:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621867833;
        bh=5BAGGJiXLxcegIokpiVUMA9UTbznoTBcL431gAL3K2g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Wk/pN/EEUXnCA7eKY+HULSreck+6IfVj9t5R0nWUqpibHjZ8BqQlsPd4aAWzEYxvb
         30Uk34dlMf9x1sTclguDZMdqUZ6yscS7a/7i6KsYpFjvU4FjVKxnpYeQ7o9NacIS99
         IQ1yjyjZN265n3UGjP0PkNvJAxgZ0ikRPS45lccBKsfsPJT+yd4OrstmniJd4SuKym
         QUslY3iZeA7845iYepisVmOi79mdluNr5AA5PJ5Y6A7ar+1yQHnW3vFj/oIZh1FCcJ
         cMmMvbuI2oxUQ6gEp2eGrFgqDYQkURAqCv5/+/Qb3/p1SUajCYmmfUTP3ZwDgia9Mv
         SL07a/115ojaQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 20/25] platform/x86: hp-wireless: add AMD's hardware id to the supported list
Date:   Mon, 24 May 2021 10:50:03 -0400
Message-Id: <20210524145008.2499049-20-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524145008.2499049-1-sashal@kernel.org>
References: <20210524145008.2499049-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

[ Upstream commit f048630bdd55eb5379ef35f971639fe52fabe499 ]

Newer AMD based laptops uses AMDI0051 as the hardware id to support the
airplane mode button. Adding this to the supported list.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Link: https://lore.kernel.org/r/20210514180047.1697543-1-Shyam-sundar.S-k@amd.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/hp-wireless.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp-wireless.c b/drivers/platform/x86/hp-wireless.c
index d6ea5e998fb8..bb95bec0b110 100644
--- a/drivers/platform/x86/hp-wireless.c
+++ b/drivers/platform/x86/hp-wireless.c
@@ -30,12 +30,14 @@ MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Alex Hung");
 MODULE_ALIAS("acpi*:HPQ6001:*");
 MODULE_ALIAS("acpi*:WSTADEF:*");
+MODULE_ALIAS("acpi*:AMDI0051:*");
 
 static struct input_dev *hpwl_input_dev;
 
 static const struct acpi_device_id hpwl_ids[] = {
 	{"HPQ6001", 0},
 	{"WSTADEF", 0},
+	{"AMDI0051", 0},
 	{"", 0},
 };
 
-- 
2.30.2

