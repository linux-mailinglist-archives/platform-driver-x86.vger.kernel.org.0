Return-Path: <platform-driver-x86+bounces-13379-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E34DFB05A22
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 14:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FEE81A64476
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 12:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297AC258CEF;
	Tue, 15 Jul 2025 12:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="so8CHz7I";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="36dqbprz";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kit5ZT/f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="E3KeJSNY"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BD1386DA
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582630; cv=none; b=Dz6w/uVyKB64x0f7oX157WwQeuHFxfCzPAdkcqDp4ih2CKoCqHuwA9lY9g3b8BGE23StxwoQaJBrHBOhnF02XZGZ6N7vPZucScKQE/o62AsUgQuqjIFEkVlsoyOC9ew9z0/2iT1rHPCgNLWVx/QwungGKfMMoqXx/HqJzMIDV78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582630; c=relaxed/simple;
	bh=87g+/hi2+pSlzkG8Z4HBCKjpoC7zTkXQWdbGWhQj23M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Et4wQ/FR2lA7wMVcRpMvXw8zh2daMLbhunOEorHCetnmz9f8gvmfGD6uWUBb41JQMW5hDu6j23DCbdaIDDrIR6bZ5sytEI6Znivn/DEy+SWRrBBpwGREwrFEqGO6Rsnm7x6Qzeb+AUu0um6FojdNZmbXexS9KD8qAtMiPNhcG48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=so8CHz7I; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=36dqbprz; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kit5ZT/f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=E3KeJSNY; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE81E1F7A1;
	Tue, 15 Jul 2025 12:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582599; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8wzZXGt+85YEwlAMG5VOp8LmFtja9yulci1nGA1bZU=;
	b=so8CHz7INf9vY9Tp8wGWK0X6dZ9qBzjOeZh/G7ObNst4ZvK2TNXc0idkFFPMlws9JsTBZs
	BnJshL95TgLQzE7Jny1rbb9HQBJjC6kNIKm190OVv+WmBmgabntfioXQgy0AmPkXFoYmic
	l8DjF9DKGLT0sNWr9IUFPmm7pRLId28=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582599;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8wzZXGt+85YEwlAMG5VOp8LmFtja9yulci1nGA1bZU=;
	b=36dqbprzrKnGKzxnNlmRBA8fx2JMS5Gc5pGvnJD80O8VegAsuqn1NHLKZrnh0CZboBFlup
	UlAk1w6/7L/36sCQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8wzZXGt+85YEwlAMG5VOp8LmFtja9yulci1nGA1bZU=;
	b=kit5ZT/f8lobxGrCGdagt238busIWK7Q1l0prsQb3Zk9iRY5l0PGyzQ5xdWtIPqW7KAHGa
	8VHTdBau+Lfu6FQpmUJ/NTsLkr1WsXDk5RILSLBbH8C00iTHrP/NnuRZjelYqh9ABX5uCV
	F+Q4y0svvsNcVAkx+T/SXqdBVeRyMCs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d8wzZXGt+85YEwlAMG5VOp8LmFtja9yulci1nGA1bZU=;
	b=E3KeJSNYVPdTAZYPFKDYvGLmkaBlqyXxB7/0OFmNnSo/dZLqCJgtvW3nIIelFON9Sm/LJC
	8LYauk36hpTcRcCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4734F13A6C;
	Tue, 15 Jul 2025 12:29:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WJMJEMZJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:29:58 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	deller@gmx.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	fnkl.kernel@gmail.com,
	j@jannau.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sven@kernel.org,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	support.opensource@diasemi.com,
	duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 07/15] backlight: apple_dwi_bl: Include <linux/mod_devicetable.h>
Date: Tue, 15 Jul 2025 14:24:44 +0200
Message-ID: <20250715122643.137027-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715122643.137027-1-tzimmermann@suse.de>
References: <20250715122643.137027-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.infradead.org,suse.de,gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Include <linux/mod_devicetable.h> to declare struct of_device_id.
Avoids dependency on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/apple_dwi_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/apple_dwi_bl.c b/drivers/video/backlight/apple_dwi_bl.c
index 93bd744972d6..ed8bf13d3f51 100644
--- a/drivers/video/backlight/apple_dwi_bl.c
+++ b/drivers/video/backlight/apple_dwi_bl.c
@@ -9,6 +9,7 @@
 #include <linux/bitfield.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
-- 
2.50.0


