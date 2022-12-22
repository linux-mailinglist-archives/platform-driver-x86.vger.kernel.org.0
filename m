Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D5DA653E67
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 Dec 2022 11:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234894AbiLVKie (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 22 Dec 2022 05:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbiLVKia (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Dec 2022 05:38:30 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Dec 2022 02:38:28 PST
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F04A62E7
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Dec 2022 02:38:28 -0800 (PST)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20221222103724ddb65ae99c6a688373
        for <platform-driver-x86@vger.kernel.org>;
        Thu, 22 Dec 2022 11:37:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=henning.schild@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=/5c+5ug9GWGitUxuQCC3c3hqagy8mvlYMuajEDXSXBo=;
 b=CGcm6YNZUb8c0OtX5H8VXgGXM7optGI+YjMlFqeQdLRokCvargx9JeZacAlbEjEfc1dUJi
 tCi+aANTTduEtazupwkyQ9mfnzrhN5TZ7Up41gsei72+JnCln5w/L6ubE5MPFyA3iBe7+f/K
 doo+hXrq4a5mBOok9aE3jQycKQKzw=;
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH 1/2] platform/x86: simatic-ipc: correct name of a model
Date:   Thu, 22 Dec 2022 11:37:19 +0100
Message-Id: <20221222103720.8546-2-henning.schild@siemens.com>
In-Reply-To: <20221222103720.8546-1-henning.schild@siemens.com>
References: <20221222103720.8546-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-52304:519-21489:flowmailer
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

What we called IPC427G should be renamed to BX-39A to be more in line
with the actual product name.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
---
 drivers/platform/x86/simatic-ipc.c            | 2 +-
 include/linux/platform_data/x86/simatic-ipc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
index ca76076fc706..2ab1f8da32b0 100644
--- a/drivers/platform/x86/simatic-ipc.c
+++ b/drivers/platform/x86/simatic-ipc.c
@@ -46,7 +46,7 @@ static struct {
 	{SIMATIC_IPC_IPC427D, SIMATIC_IPC_DEVICE_427E, SIMATIC_IPC_DEVICE_NONE},
 	{SIMATIC_IPC_IPC427E, SIMATIC_IPC_DEVICE_427E, SIMATIC_IPC_DEVICE_427E},
 	{SIMATIC_IPC_IPC477E, SIMATIC_IPC_DEVICE_NONE, SIMATIC_IPC_DEVICE_427E},
-	{SIMATIC_IPC_IPC427G, SIMATIC_IPC_DEVICE_227G, SIMATIC_IPC_DEVICE_227G},
+	{SIMATIC_IPC_IPCBX_39A, SIMATIC_IPC_DEVICE_227G, SIMATIC_IPC_DEVICE_227G},
 };
 
 static int register_platform_devices(u32 station_id)
diff --git a/include/linux/platform_data/x86/simatic-ipc.h b/include/linux/platform_data/x86/simatic-ipc.h
index 632320ec8f08..a4a6cba412cb 100644
--- a/include/linux/platform_data/x86/simatic-ipc.h
+++ b/include/linux/platform_data/x86/simatic-ipc.h
@@ -32,7 +32,7 @@ enum simatic_ipc_station_ids {
 	SIMATIC_IPC_IPC477E = 0x00000A02,
 	SIMATIC_IPC_IPC127E = 0x00000D01,
 	SIMATIC_IPC_IPC227G = 0x00000F01,
-	SIMATIC_IPC_IPC427G = 0x00001001,
+	SIMATIC_IPC_IPCBX_39A = 0x00001001,
 };
 
 static inline u32 simatic_ipc_get_station_id(u8 *data, int max_len)
-- 
2.38.2

