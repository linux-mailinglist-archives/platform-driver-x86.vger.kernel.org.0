Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 11D186A3042
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Feb 2023 15:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbjBZOsG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Feb 2023 09:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjBZOr7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Feb 2023 09:47:59 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1036E13D79;
        Sun, 26 Feb 2023 06:47:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5ADC6B80BD9;
        Sun, 26 Feb 2023 14:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5E6C433AE;
        Sun, 26 Feb 2023 14:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677422768;
        bh=w+h52hvnhQo5lNcm23tac3TAxBW43PYXPti+xpjvico=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DIhEX2zmYuWnIIEMP+gXQzq9a2YnGD8NWpVy8tLrZCbde6G1xOeLItv4+SIQX8+FU
         PA9W6uMZPcYw0sypIhSSEywv38EAQk7Lzav4+YTwyV5kYzTdKaYxjMwCyVvqblljci
         rqY9to81u/n8qeZOajEtYdQM2kXGVCe4Y+6PnHobIUtT2U+LSdgTlblkiPM7ZvVVaT
         M0CBoRMDUc7i5QpqSvMd3RxDC9mirJ9P+sFCbXfG3whRuXnXyzRdKThiqIUusABprp
         CP7DPQtx1gpuj1Rx0SwIKcKBDkBqwRlchPtIYzjLrzwSHdQsbgK9LycJr9nKk3zUkB
         LTNfYlmkauFaA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Zhang Rui <rui.zhang@intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 34/53] tools/power/x86/intel-speed-select: Add Emerald Rapid quirk
Date:   Sun, 26 Feb 2023 09:44:26 -0500
Message-Id: <20230226144446.824580-34-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230226144446.824580-1-sashal@kernel.org>
References: <20230226144446.824580-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Zhang Rui <rui.zhang@intel.com>

[ Upstream commit 61f9fdcdcd01f9a996b6db4e7092fcdfe8414ad5 ]

Need memory frequency quirk as Sapphire Rapids in Emerald Rapids.
So add Emerald Rapids CPU model check in is_spr_platform().

Signed-off-by: Zhang Rui <rui.zhang@intel.com>
[srinivas.pandruvada@linux.intel.com: Subject, changelog and code edits]
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/power/x86/intel-speed-select/isst-config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/power/x86/intel-speed-select/isst-config.c
index a160bad291eb7..be3668d37d654 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -110,7 +110,7 @@ int is_skx_based_platform(void)
 
 int is_spr_platform(void)
 {
-	if (cpu_model == 0x8F)
+	if (cpu_model == 0x8F || cpu_model == 0xCF)
 		return 1;
 
 	return 0;
-- 
2.39.0

