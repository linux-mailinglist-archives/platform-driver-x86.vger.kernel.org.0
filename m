Return-Path: <platform-driver-x86+bounces-5216-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F14396A8B8
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Sep 2024 22:44:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8C3283FFA
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Sep 2024 20:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FDA1D9D70;
	Tue,  3 Sep 2024 20:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h30ueAHp"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A23D1D9D67;
	Tue,  3 Sep 2024 20:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725396149; cv=none; b=bZx7V1mY4pb9szc7hEPWKDfMgB7eXbMgZ760Wcej+YuD5Wk/atStCpvv1XBOOft70WwwxHcRq/OoLoTiQQrX0zxgxLBWSBTUO4znUnZ1Nr4k+vzkFkBEOZNoPkWjBz0Qop8NkyTTJHtT2WkPkJH8ewyXD1ngLaGqqk+PEUargGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725396149; c=relaxed/simple;
	bh=CtCA0uwRORtPUyZYafTWXbMddVqjBZiXThBiZEU2tPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hi9PHHk6Y3yIqbiwCr/Cx4abLMZeSFUAqNcyzrFV4omSa4bVXbVKe6Mio9GRQFEig3GcMwudzTEafd252Cz4IicccojXyppoNucTMXoQQyr+8yOHk8krlK2Z324BZep9u7vDpRfKYolm0mgMPsWMEih66U7oBPb0W+YerZ/l/co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h30ueAHp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E1AC4CEC5;
	Tue,  3 Sep 2024 20:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725396148;
	bh=CtCA0uwRORtPUyZYafTWXbMddVqjBZiXThBiZEU2tPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h30ueAHpatPcR2a7LoVE62wdhXRsWkEbvTmSNz86xE5y1d7HNXXyXpUHFjfkfvm7v
	 XIxL+mvdK4x4qS204dNrlW7+DsNrrqRFhegGt/Q4sgh/SGqAnU3cE/EIJe6aVq7HBp
	 uquJTsomH1zOALXSEGnGFgg0k7oujsYqtHgwmpOSMVfbjGkEzL1VKR9IUOKmvCohxU
	 VabME49B88sb0E9kIZMom540N6XNuKe1MOfdrs0kYANeOzbzc5MIyarpywmIHA3Awm
	 dEObpSSxgU3Zdsz/NXJFrIs8BX3nPo9Uvg6Csp1lkKOF3D8IxnUyPYiV3nvKEgGOTK
	 tU45z0MDTnWwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.10 12/22] platform/x86: x86-android-tablets: Make Lenovo Yoga Tab 3 X90F DMI match less strict
Date: Tue,  3 Sep 2024 15:21:59 -0400
Message-ID: <20240903192243.1107016-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240903192243.1107016-1-sashal@kernel.org>
References: <20240903192243.1107016-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.7
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit a3379eca24a7da5118a7d090da6f8eb8611acac8 ]

There are 2G and 4G RAM versions of the Lenovo Yoga Tab 3 X90F and it
turns out that the 2G version has a DMI product name of
"CHERRYVIEW D1 PLATFORM" where as the 4G version has
"CHERRYVIEW C0 PLATFORM". The sys-vendor + product-version check are
unique enough that the product-name check is not necessary.

Drop the product-name check so that the existing DMI match for the 4G
RAM version also matches the 2G RAM version.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20240825132415.8307-1-hdegoede@redhat.com
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/x86-android-tablets/dmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/dmi.c b/drivers/platform/x86/x86-android-tablets/dmi.c
index 141a2d25e83be..387dd092c4dd0 100644
--- a/drivers/platform/x86/x86-android-tablets/dmi.c
+++ b/drivers/platform/x86/x86-android-tablets/dmi.c
@@ -140,7 +140,6 @@ const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
 		/* Lenovo Yoga Tab 3 Pro YT3-X90F */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corporation"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "CHERRYVIEW D1 PLATFORM"),
 			DMI_MATCH(DMI_PRODUCT_VERSION, "Blade3-10A-001"),
 		},
 		.driver_data = (void *)&lenovo_yt3_info,
-- 
2.43.0


