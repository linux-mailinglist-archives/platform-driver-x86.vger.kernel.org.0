Return-Path: <platform-driver-x86+bounces-6955-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C529C544E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Nov 2024 11:40:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 012BE282171
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Nov 2024 10:40:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6DA217648;
	Tue, 12 Nov 2024 10:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kynl31Xd"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147F8217476;
	Tue, 12 Nov 2024 10:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731407775; cv=none; b=MkofR9d2MwJWnr8UFDIlpl6bJBAriHwEeR7k/P/FpwPG6Sm1LtCqL7z9YYHfkXmeGqPtl1tpspy5zk0BP97vzfngYVQvuwBw8RaGpRYneZQqHWuzb6UMtZsa0rVgrl7ze8PUybXTTAuH76mNpAAyWzGKwFbDzj7vM227cUoazpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731407775; c=relaxed/simple;
	bh=V2SfHRj42Qh9xvWSj4r98rg50craP88nJP0wIotBYdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fcqfFrXvViGfSWUtsnBTNKyg/L8oXM15CdM/fkaTUs3xavdL0EY9dU/4A6ZUgNPit5rViMT8IRwzkI6qHLOzsgUehTwfXDmjQlKawVEUJSBAOuLyTnbNjix1bdxlGzAIxfQWn1IP0foLNme8SeRci9tjJJ+PX4CQ0wxVD6YArCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kynl31Xd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B0FC4CECD;
	Tue, 12 Nov 2024 10:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407774;
	bh=V2SfHRj42Qh9xvWSj4r98rg50craP88nJP0wIotBYdI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kynl31XdvCOSHh+UDy1meTdGGAjw5vDiJdD31yMclIhh59SVL++UOXzPMF/qZ3uFT
	 dxtdqsMRBFZwEE2Wfwqpw+V7CHz2Yn5aDVeLZthInOS7CZUFUnj3BrZaJRXdzgLpwa
	 AnzVXxiETk+E8zUKZ/jiYWQKHiPhrK9Bjrwn25vD0U2X0IaVxQZPggmkAELo7KQogb
	 Tmj/YSOP9qRWoNi18dm4CugV/k3El3G8pSONvPsqgvL6s9UYtCJoKAimLZH2c/Dkye
	 cNz1hmByHZ/E8h0tzv99fqb0cvawnLxqw0y1ANysDL9DksjNYaD1W2hIg3LeUiDpjQ
	 dBuS19vyDGHCA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kurt Borja <kuurtb@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sasha Levin <sashal@kernel.org>,
	mjg59@srcf.ucam.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 05/16] platform/x86: dell-wmi-base: Handle META key Lock/Unlock events
Date: Tue, 12 Nov 2024 05:35:47 -0500
Message-ID: <20241112103605.1652910-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112103605.1652910-1-sashal@kernel.org>
References: <20241112103605.1652910-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.7
Content-Transfer-Encoding: 8bit

From: Kurt Borja <kuurtb@gmail.com>

[ Upstream commit ec61f0bb4feec3345626a2b93b970b6719743997 ]

Some Alienware devices have a key that locks/unlocks the Meta key. This
key triggers a WMI event that should be ignored by the kernel, as it's
handled by internally the firmware.

There is no known way of changing this default behavior. The firmware
would lock/unlock the Meta key, regardless of how the event is handled.

Tested on an Alienware x15 R1.

Signed-off-by: Kurt Borja <kuurtb@gmail.com>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Pali Rohár <pali@kernel.org>
Link: https://lore.kernel.org/r/20241031154441.6663-2-kuurtb@gmail.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/dell/dell-wmi-base.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index 24fd7ffadda95..841a5414d28a6 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -80,6 +80,12 @@ static const struct dmi_system_id dell_wmi_smbios_list[] __initconst = {
 static const struct key_entry dell_wmi_keymap_type_0000[] = {
 	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
 
+	/* Meta key lock */
+	{ KE_IGNORE, 0xe000, { KEY_RIGHTMETA } },
+
+	/* Meta key unlock */
+	{ KE_IGNORE, 0xe001, { KEY_RIGHTMETA } },
+
 	/* Key code is followed by brightness level */
 	{ KE_KEY,    0xe005, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY,    0xe006, { KEY_BRIGHTNESSUP } },
-- 
2.43.0


