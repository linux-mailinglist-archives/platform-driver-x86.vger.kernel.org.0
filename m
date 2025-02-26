Return-Path: <platform-driver-x86+bounces-9751-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F98A450E5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 26 Feb 2025 00:23:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D30319C26B8
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Feb 2025 23:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D4F23642E;
	Tue, 25 Feb 2025 23:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pdlBGxT6"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7E215164
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Feb 2025 23:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740525789; cv=none; b=WqGOQZ8uLr6pux+YFnakfX3gVV7elAQAh5eWjnwEzSbNVQNvZM8X+9nXvwVVKVU0ixzXWEP0yABJoN96F+zwb/5UkYhUx8G5++bLVHtcm86/94LLeEvkSku0uhCC5Br7qyi/1r/mjI3XcvB1EYzRyuO/IEP6vpJqJX9AFLqTyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740525789; c=relaxed/simple;
	bh=mxZ57YkNbCfp54jOV+CL/NY8/+u4t8f7OvBf9XoCCOk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QugPsZtxp8G20k/VUlkThqs6ClERT7wmzfcej4aKa6M6FT/ZyXBBTTH1nkPtk+hUNe3p9qaYXR6rLcTC425nwY0hAlfSJsIE5iWdR3nPmEOOpOmACrsWiaN1YSnN5avOBLrG8w3Uauv+XNqW0EVbQ+REOAyHtJKVRN+Hy25oOmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pdlBGxT6; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740525772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jaXGOZM0LeUEjM/H/R0xIzoZ7rWhUuiTQPH1cr3JMps=;
	b=pdlBGxT6LKS2tJvdmt4iINIdGHalfJAVUGZTX8eUwQIE42LrRjfqi3nZXnvtahoUyT+Vy8
	D5WCsuJ3bL21QbsXZSBGkf+6E7YMev2dhooc4Mt+RGvO+XPZsTXyJh3DB8bXEphayMRKSF
	utL1dlrm7xpjbaGcjZufoKuYFtpizro=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-hardening@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: hp-bioscfg: Replace deprecated strncpy() with strscpy()
Date: Wed, 26 Feb 2025 00:21:27 +0100
Message-ID: <20250225232126.356274-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Since kstrtol() requires a NUL-terminated string as input and strncpy()
is deprecated for NUL-terminated destination buffers, use strscpy()
instead.

Compile-tested only.

Link: https://github.com/KSPP/linux/issues/90
Cc: linux-hardening@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 0b277b7e37dd..889332ddd5ce 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -448,7 +448,7 @@ int hp_convert_hexstr_to_str(const char *input, u32 input_len, char **str, int *
 		return -ENOMEM;
 
 	for (i = 0; i < input_len; i += 5) {
-		strncpy(tmp, input + i, strlen(tmp));
+		strscpy(tmp, input + i);
 		if (kstrtol(tmp, 16, &ch) == 0) {
 			// escape char
 			if (ch == '\\' ||
-- 
2.48.1


