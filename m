Return-Path: <platform-driver-x86+bounces-10340-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91EE7A69788
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 Mar 2025 19:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67DCF1B61AD6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 Mar 2025 18:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63391208970;
	Wed, 19 Mar 2025 18:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="JBrXex2z"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F001F099A;
	Wed, 19 Mar 2025 18:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742407883; cv=none; b=AxWpvRwieCm/7Mvap8NhJWv3IV6iTWqLg+vQDG6CKQGMVxR5RRmCSy+su3qgMLAKHcCxHM2K1WAesMq1tTay+3tefyOM0b6EMchkmEm2Ny9+ByqO9iQWiDqK3gEOOtOxp4fmAI6xpxFs4BhCTZnCy5UMkd77kw0VFdNVeiqlJSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742407883; c=relaxed/simple;
	bh=tdiUN/gA808UkpN6g6l5ag5+wM4qUAmQudO57SdnzHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k5MBCxdLRZu9ekX28dXjT3Pb80ZhyqVr2ucFmhe6WCKJvb4xcsGdc/VV7kRx6POgy6f0zKSln/tv5BXF2pHmW2a/pD+eny1tZxoGYjSSLNPAdZH611TA+QeAiBP6MyhQ+hDJhJlCUdctM/Eq3IvwTbOJeZqG7mom7BLNF2h2yGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=JBrXex2z; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a05:f6c2:511b:0:cbc0:999f:73ad:33bd])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id C9C682E09252;
	Wed, 19 Mar 2025 20:11:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1742407879;
	bh=ZipG212NCF1KOV9rJuhRvhXErr3HGLMwbPUXCMDhaTs=; h=From:To:Subject;
	b=JBrXex2z4NuzRJAxWRdJfZ8/8T1fv6zoQcEkhgyY3Oy3Ntd5lx8LiYNbc0u8pmTlJ
	 LqE+aBaSNUSYtHll6MJrGGrN9PonqZEB7KQfkRf7z/s64fqp4ZsIpMjv3P+W/8iMvl
	 HLxUC7k9JIKXxlYJ0Ghp51ZGdZSSN8IQXzBRWEIU=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a05:f6c2:511b:0:cbc0:999f:73ad:33bd) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Joaquin Ignacio Aramendia <samsagax@gmail.com>,
	Derek J Clark <derekjohn.clark@gmail.com>,
	Kevin Greenberg <kdgreenberg234@protonmail.com>,
	Joshua Tam <csinaction@pm.me>,
	Parth Menon <parthasarathymenon@gmail.com>,
	Eileen <eileen@one-netbook.com>,
	linux-kernel@vger.kernel.org,
	sre@kernel.org,
	linux@weissschuh.net,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	mario.limonciello@amd.com,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v7 01/14] hwmon: (oxp-sensors) Distinguish the X1 variants
Date: Wed, 19 Mar 2025 19:10:28 +0100
Message-ID: <20250319181044.392235-2-lkml@antheas.dev>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250319181044.392235-1-lkml@antheas.dev>
References: <20250319181044.392235-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174240786947.2028.14386461469592547833@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

Currently, the oxp-sensors driver fuzzy matches the X1 variants. Luckily,
X1 and X1 mini share most hardware features so this works. However, they
are completely different product lines, and there is an expectation that
OneXPlayer will release more devices in the X1 line that may have
differences.

Therefore, distinguish the 3 devices that currently exist in the market.
These are the OneXPlayer X1 AMD and Intel variants, and the X1 mini which
only has an AMD variant. As far as registers go, all three support the
current driver functionality.

Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Acked-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/hwmon/oxp-sensors.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/oxp-sensors.c b/drivers/hwmon/oxp-sensors.c
index 83730d9318240..5a4230ad3757e 100644
--- a/drivers/hwmon/oxp-sensors.c
+++ b/drivers/hwmon/oxp-sensors.c
@@ -205,7 +205,28 @@ static const struct dmi_system_id dmi_table[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
-			DMI_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 A"),
+		},
+		.driver_data = (void *)oxp_x1,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 i"),
+		},
+		.driver_data = (void *)oxp_x1,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1 mini"),
+		},
+		.driver_data = (void *)oxp_x1,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X1Pro"),
 		},
 		.driver_data = (void *)oxp_x1,
 	},
-- 
2.48.1


