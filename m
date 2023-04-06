Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06AC46D9556
	for <lists+platform-driver-x86@lfdr.de>; Thu,  6 Apr 2023 13:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237513AbjDFLdP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 6 Apr 2023 07:33:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237820AbjDFLcr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Apr 2023 07:32:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31B23A246;
        Thu,  6 Apr 2023 04:32:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 068F36466B;
        Thu,  6 Apr 2023 11:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1A3C433D2;
        Thu,  6 Apr 2023 11:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680780729;
        bh=61CpfB4NPx3Sn2ArhV0R5wLaJ+ElHuIv6dOpo25OXQE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sVf9Ii8r8btybiSHaIGPZ6LM7/XrJPpY1SDb+ShtK0wrBteDG9P/Vmv8oaD5oghB4
         2ikX5dEY2M+xl5/5T0L9XMV/m/EPW/MArZ9Ld0U6Ir6hn4EhsmP6GL9ZLT0EXTM0ZU
         kEg6r9rB4S/0p3wunJg67u1rgML53peUWXLVqzIf/TXzqv1sfKg/1x49c4m6mlUuIW
         O7ss+zf+oD2lARyCmRnAbWE4fResMeCWNG7LyQCrra6Q2RX+Fus+l+qk2rVZnKYBNf
         J4QH/I981ZorAoEVvk/n5bmkWGf3w9GiO1kwOcxE8jDBiFJv1hP8VJiJB9Q4qXsjIM
         JypYV0HnLNYxA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     weiliang1503 <weiliang1503@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, corentin.chary@gmail.com,
        markgross@kernel.org, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 16/17] platform/x86: asus-nb-wmi: Add quirk_asus_tablet_mode to other ROG Flow X13 models
Date:   Thu,  6 Apr 2023 07:31:30 -0400
Message-Id: <20230406113131.648213-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406113131.648213-1-sashal@kernel.org>
References: <20230406113131.648213-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: weiliang1503 <weiliang1503@gmail.com>

[ Upstream commit e352d685fde427a8fc9beb2ba30888f5d6f2e5e6 ]

Make quirk_asus_tablet_mode apply on other ROG Flow X13 devices,
which only affects the GV301Q model before.

Signed-off-by: weiliang1503 <weiliang1503@gmail.com>
Link: https://lore.kernel.org/r/20230330114943.15057-1-weiliang1503@gmail.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/asus-nb-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index cb15acdf14a30..e2c9a68d12df9 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -464,7 +464,8 @@ static const struct dmi_system_id asus_quirks[] = {
 		.ident = "ASUS ROG FLOW X13",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "GV301Q"),
+			/* Match GV301** */
+			DMI_MATCH(DMI_PRODUCT_NAME, "GV301"),
 		},
 		.driver_data = &quirk_asus_tablet_mode,
 	},
-- 
2.39.2

