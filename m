Return-Path: <platform-driver-x86+bounces-4260-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A72092C0B8
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Jul 2024 18:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB5D11C22791
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Jul 2024 16:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40F743DABEC;
	Tue,  9 Jul 2024 16:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPXdfR7P"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D413DABE7;
	Tue,  9 Jul 2024 16:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542274; cv=none; b=AhnChhVNFAguI5gzrC4XbwOZ6eJjuOLBr13YA6wUExQclvJQ1RJiRJGYauMtIxMFaf5SWJ08AiL/e61sORrETJFERatKAlnYrUtX0h+txK0kgLgS8C2Sk53gdrpnc5iYK3qKizd0diiSZz0NtbFbwYTj/jvBcO4V6RHV0wm+zD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542274; c=relaxed/simple;
	bh=OhiOPcze8Agb2oTtn+5lovfk9U2fyMJ1ikaaSme7rjE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWMNni1gW+mdbqStbS0a/xHMBoL/E9zHraf2WLM+T8R+v1FVIZrQodaX3fOxZrvHGfrgYm9NytgvGDu8WShGqrmeduT78yLPP3OePZaY+/S/wbj8qHLaS7PqbDOGaxz2hn/ABgUPcrJsBMLjqP97bBA+1ARKF+5OmE5SygmYvSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPXdfR7P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4D2C4AF0B;
	Tue,  9 Jul 2024 16:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720542273;
	bh=OhiOPcze8Agb2oTtn+5lovfk9U2fyMJ1ikaaSme7rjE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KPXdfR7PCNjMnbwnyviLg+Tw/XjrOuqi3PtfXfwDzL3mTb1P2j0U4zfpL1fjWlWSb
	 UJHm75KC2/XMAYQE9lZzV4WE3rEa7iz/v+c1hASUsBw5bSd7K6X5Tg9aDhBuIv6FwD
	 pD7LPrlQtixUwWWDkRceTeyueQvVfhcGFs3c8QTPN7zVoArwjAjQhXAle1kv79S0n2
	 ZRxTr+sVgsuzkXc9JSoFV+/holT4YGqzyuz8iGE9ehQDCIX0v0FAPTvbcX/MAj50T8
	 jeyqOTD13EEgJY3J1VB95UCwnxSkPa1tb8RKHDpDb+gKOUitw3CA/nxit6+goLFziL
	 Br+fIYRRWcpeg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chen Ni <nichen@iscas.ac.cn>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	ilpo.jarvinen@linux.intel.com,
	vadimp@nvidia.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 15/27] platform/mellanox: nvsw-sn2201: Add check for platform_device_add_resources
Date: Tue,  9 Jul 2024 12:23:29 -0400
Message-ID: <20240709162401.31946-15-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709162401.31946-1-sashal@kernel.org>
References: <20240709162401.31946-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.97
Content-Transfer-Encoding: 8bit

From: Chen Ni <nichen@iscas.ac.cn>

[ Upstream commit d56fbfbaf592a115b2e11c1044829afba34069d2 ]

Add check for the return value of platform_device_add_resources() and
return the error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
Link: https://lore.kernel.org/r/20240605032745.2916183-1-nichen@iscas.ac.cn
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 7b9c107c17ce6..f53baf7e78e74 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -1194,6 +1194,7 @@ static int nvsw_sn2201_config_pre_init(struct nvsw_sn2201 *nvsw_sn2201)
 static int nvsw_sn2201_probe(struct platform_device *pdev)
 {
 	struct nvsw_sn2201 *nvsw_sn2201;
+	int ret;
 
 	nvsw_sn2201 = devm_kzalloc(&pdev->dev, sizeof(*nvsw_sn2201), GFP_KERNEL);
 	if (!nvsw_sn2201)
@@ -1201,8 +1202,10 @@ static int nvsw_sn2201_probe(struct platform_device *pdev)
 
 	nvsw_sn2201->dev = &pdev->dev;
 	platform_set_drvdata(pdev, nvsw_sn2201);
-	platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
+	ret = platform_device_add_resources(pdev, nvsw_sn2201_lpc_io_resources,
 				      ARRAY_SIZE(nvsw_sn2201_lpc_io_resources));
+	if (ret)
+		return ret;
 
 	nvsw_sn2201->main_mux_deferred_nr = NVSW_SN2201_MAIN_MUX_DEFER_NR;
 	nvsw_sn2201->main_mux_devs = nvsw_sn2201_main_mux_brdinfo;
-- 
2.43.0


