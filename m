Return-Path: <platform-driver-x86+bounces-4325-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D1C92EAC4
	for <lists+platform-driver-x86@lfdr.de>; Thu, 11 Jul 2024 16:30:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 015D3282F76
	for <lists+platform-driver-x86@lfdr.de>; Thu, 11 Jul 2024 14:30:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA5C7E0FC;
	Thu, 11 Jul 2024 14:30:50 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF3883D
	for <platform-driver-x86@vger.kernel.org>; Thu, 11 Jul 2024 14:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720708250; cv=none; b=tfGnUBCQ+eHZlRAitsKOKVjxCde2S44QAOLHSFaigbN2mn6JacUl32s++UFsGvUS+pSzK6igSwvp2pFvrVCsN8O1gynX+7a81t2rpu6PaKN0NT8B0Kuz5jBCH0+7Eeo7w726RAOonAJ+GA4L6uKLIt0T0NqFYsy3Mjsh63IyOm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720708250; c=relaxed/simple;
	bh=ziRM1dkN+2QSRE4VkuF3v/nRtUwBx9wSxAaTo8Ou/DU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XgnUq0v8GVBdE1DhDENKO6rBPP8iUa+J2MsjvpOP09+6gxiaYsb5hE00AG1qVPka7Z78cP1Sz5VKk7sCVKPQh36ipDUlVTcO5w38gAe3gP7Jn2tGmGfqN5kc0YfYlfE1lIHpzKbUb/d+3UU0zFu6F5TEFQVHwVuJszCD7E1iYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9b6b:6da0:997b:7165])
	by laurent.telenet-ops.be with bizsmtp
	id mEWg2C00J46XLxg01EWgZ7; Thu, 11 Jul 2024 16:30:41 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRuoU-001kRA-Vm;
	Thu, 11 Jul 2024 16:30:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sRuoi-0009wF-Hs;
	Thu, 11 Jul 2024 16:30:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Nikita Travkin <nikita@trvn.ru>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] platform: arm64: EC_ACER_ASPIRE1 should depend on ARCH_QCOM
Date: Thu, 11 Jul 2024 16:30:36 +0200
Message-Id: <f5f38709c01d369ed9e375ceb2a9a12986457a1a.1720707932.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <80e17dffa8f4c1d3fdedd4d82df3a722aa4044ff.1720707932.git.geert+renesas@glider.be>
References: <80e17dffa8f4c1d3fdedd4d82df3a722aa4044ff.1720707932.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Acer Aspire 1 Embedded Controller is only present on the Qualcomm
Snapdragon-based Acer Aspire 1 laptop.  Hence add a dependency on
ARCH_QCOM, to prevent asking the user about this driver when configuring
a kernel without Qualcomm SoC support.

Fixes: 2b3efb7c515111ea ("platform: arm64: Add Acer Aspire 1 embedded controller driver")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/platform/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 8c103b3150d1d0a6..058a4baa216a83b8 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -18,6 +18,7 @@ if ARM64_PLATFORM_DEVICES
 
 config EC_ACER_ASPIRE1
 	tristate "Acer Aspire 1 Embedded Controller driver"
+	depends on ARCH_QCOM || COMPILE_TEST
 	depends on I2C
 	depends on DRM
 	depends on POWER_SUPPLY
-- 
2.34.1


