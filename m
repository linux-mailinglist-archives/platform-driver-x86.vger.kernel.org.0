Return-Path: <platform-driver-x86+bounces-6394-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 533A79B2E0F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Oct 2024 12:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0754B22E5B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Oct 2024 11:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3D5202626;
	Mon, 28 Oct 2024 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dj3m275c"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0715D2022FD;
	Mon, 28 Oct 2024 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112803; cv=none; b=Vj90s/z+RCiz+wZB3LrMHYsF4ShFq95DyqgyK4CKsFOChqFmRCEEz3Vy8Esuhb6qELKMli17vr6cWQix7g+OGHiVu7N5vnzfDApZYakV0e5sYZWpKfMRsoxoN5byf4FDVsTGGeBXEJZlr48yyy3qgz6CYZClgv9zvXThUiORZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112803; c=relaxed/simple;
	bh=VYqLdh0SrCfBhnzcPJjG59pEAxcMxbvyfIIXODPpQHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRX2H7sciSmmh9lBwqJJ96VYTpmI6JG603vOVrQwLKbn5M1EOJZKeENAPgHRBeRCiMmqoBrOmHZT38nzytMEkIC0tTiTYhvwI9fmvz0cJ43gxdh4EoTUuPnQwVkXJ/TTKGnmHmLAu6sQtgeuhbMF/6NrqW/Y8eZy0x6Eax40NFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dj3m275c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE44C4CEC3;
	Mon, 28 Oct 2024 10:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112802;
	bh=VYqLdh0SrCfBhnzcPJjG59pEAxcMxbvyfIIXODPpQHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dj3m275c1A5aqf37Be0R8DdGD8XJcOaYv6wM016H9gkba7BXBjxOFdo9KMz8KUFNc
	 LcK+m5CQfMAzzYggylDSubZFKsoT8WibOo2DwAf5TH2B8la1IY3mZ6D61HWQSlvmMR
	 mZ3lkv5sOCCCy1ShIbMiVqY4pJ03ShCK865rWQ8KkdsAhsK/Y0fa1nJkBoXHUHIyVy
	 LwJH1y42Ze3C2WTSUTl3IgwgU+WgGdz52Qy7q65n+WN6JnpFAvtwrtAqquiNqtDQ+v
	 WMgV3PXjWtaRYUUHj4ge+v0KBRvMMpV9beW0kztzk33W7X4/+lP91ws1tVw90qBQ7D
	 Z6uA08miZTznw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>,
	siddharth.manthan@gmail.com,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	mjg59@srcf.ucam.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 6/7] platform/x86: dell-wmi: Ignore suspend notifications
Date: Mon, 28 Oct 2024 06:53:08 -0400
Message-ID: <20241028105311.3560419-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105311.3560419-1-sashal@kernel.org>
References: <20241028105311.3560419-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.169
Content-Transfer-Encoding: 8bit

From: Armin Wolf <W_Armin@gmx.de>

[ Upstream commit a7990957fa53326fe9b47f0349373ed99bb69aaa ]

Some machines like the Dell G15 5155 emit WMI events when
suspending/resuming. Ignore those WMI events.

Tested-by: siddharth.manthan@gmail.com
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Acked-by: Pali Rohár <pali@kernel.org>
Link: https://lore.kernel.org/r/20241014220529.397390-1-W_Armin@gmx.de
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/dell/dell-wmi-base.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index b83d6fa6e39b3..b12e6ebd10dd6 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -263,6 +263,15 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
 	/*Speaker Mute*/
 	{ KE_KEY, 0x109, { KEY_MUTE} },
 
+	/* S2Idle screen off */
+	{ KE_IGNORE, 0x120, { KEY_RESERVED }},
+
+	/* Leaving S4 or S2Idle suspend */
+	{ KE_IGNORE, 0x130, { KEY_RESERVED }},
+
+	/* Entering S2Idle suspend */
+	{ KE_IGNORE, 0x140, { KEY_RESERVED }},
+
 	/* Mic mute */
 	{ KE_KEY, 0x150, { KEY_MICMUTE } },
 
-- 
2.43.0


