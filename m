Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 054CF5F95CD
	for <lists+platform-driver-x86@lfdr.de>; Mon, 10 Oct 2022 02:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbiJJAZk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 9 Oct 2022 20:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232904AbiJJAXw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Oct 2022 20:23:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C54002529F;
        Sun,  9 Oct 2022 16:57:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6F8C8B80DEA;
        Sun,  9 Oct 2022 23:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5153CC43145;
        Sun,  9 Oct 2022 23:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665359853;
        bh=nlsFU6+qAFHENonUxtCRXgN1MbdHlXKsPAZ0zCns0UI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qt9zisu8CU3mIFy0A3g5BaUHXKWfUSH+3NiOgZlnWbNM0kS109RgSwpi5DRvMQUXd
         /CPxviVihspERazb7IAG4j6wTyUV6pb4ssOWjkzFr8Obs1/Cf4LnatnC8Jl+opEdTP
         TUbNjlQD1qg+R6GvdOhqrwJ4JRE5Q/sB+Vbxr2jZ9Y8aUzRLAETnM5d6bi3v6EfIqx
         5UB1tJbe6Z/yvN4sUxaaux4sZkuEtkG2UGM1yY9zD1FcTYT1WSp5aItnD2Jgy3kP6K
         nz0+STtfIjLZMKZ0GLBNNTzQigiLSNsn8VEJJzeL8biGT3n5y52WYQAC4U/TTvfIDM
         8xd98YqwxMQqQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, jlee@suse.com,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 10/14] platform/x86: msi-laptop: Change DMI match / alias strings to fix module autoloading
Date:   Sun,  9 Oct 2022 19:57:06 -0400
Message-Id: <20221009235710.1231937-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235710.1231937-1-sashal@kernel.org>
References: <20221009235710.1231937-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 2a2565272a3628e45d61625e36ef17af7af4e3de ]

On a MSI S270 with Fedora 37 x86_64 / systemd-251.4 the module does not
properly autoload.

This is likely caused by issues with how systemd-udevd handles the single
quote char (') which is part of the sys_vendor / chassis_vendor strings
on this laptop. As a workaround remove the single quote char + everything
behind it from the sys_vendor + chassis_vendor matches. This fixes
the module not autoloading.

Link: https://github.com/systemd/systemd/issues/24715
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20220917210407.647432-1-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/msi-laptop.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/msi-laptop.c b/drivers/platform/x86/msi-laptop.c
index 24ffc8e2d2d1..d8a94968aedc 100644
--- a/drivers/platform/x86/msi-laptop.c
+++ b/drivers/platform/x86/msi-laptop.c
@@ -596,11 +596,10 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
 	{
 		.ident = "MSI S270",
 		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT'L CO.,LTD"),
+			DMI_MATCH(DMI_SYS_VENDOR, "MICRO-STAR INT"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "MS-1013"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "0131"),
-			DMI_MATCH(DMI_CHASSIS_VENDOR,
-				  "MICRO-STAR INT'L CO.,LTD")
+			DMI_MATCH(DMI_CHASSIS_VENDOR, "MICRO-STAR INT")
 		},
 		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
@@ -633,8 +632,7 @@ static const struct dmi_system_id msi_dmi_table[] __initconst = {
 			DMI_MATCH(DMI_SYS_VENDOR, "NOTEBOOK"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "SAM2000"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "0131"),
-			DMI_MATCH(DMI_CHASSIS_VENDOR,
-				  "MICRO-STAR INT'L CO.,LTD")
+			DMI_MATCH(DMI_CHASSIS_VENDOR, "MICRO-STAR INT")
 		},
 		.driver_data = &quirk_old_ec_model,
 		.callback = dmi_check_cb
-- 
2.35.1

