Return-Path: <platform-driver-x86+bounces-12929-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0040EAE6730
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 15:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEF2C3BAFB8
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 13:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A7DB2C15B1;
	Tue, 24 Jun 2025 13:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HyOLCHUl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A2/OReMx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HyOLCHUl";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A2/OReMx"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C729C335
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jun 2025 13:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773138; cv=none; b=RawBEVKriZ62kXURYPuDDYlgSQub0jpg+yxnUQvdI0wupDyFVShxe8EuaEvaCrqz4EOXLS8TGnJfUyJ540s6BgEz8+SAbhqd1wsCe1KNEBOEjfXNMo7nr6NUBultE8G+jefO4CVlJvi5zxsSxgl1K/Gm/4zuBe3z/3wpWbDphDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773138; c=relaxed/simple;
	bh=2pkJviPqz8NGZObsmqM98IUEeRUDtzxThystlnjaaBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tBeTgOQK2tZsNibXJyZjXMwTRrpjxqsMLJs0CzYosQndvX4qnGnP8411fLRQIv+Os4/Khlml6UIJPbHWhRvrdJmwipoVJxK4TKXsfClS1BASvXOzXS/k0Vn8/TKJnHay95F58KD9v3HJFzGLqANpBMWO1pUDJfBD1TC2ddWt7zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HyOLCHUl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A2/OReMx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HyOLCHUl; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A2/OReMx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 594DF1F444;
	Tue, 24 Jun 2025 13:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750773114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMPOvYGcRp+cu7/68oeiMBFcYHtUrY3Y+IZL5j+fdns=;
	b=HyOLCHUlpWV1Pu8KtEzJZT1BTywy4iKbuCYIXxcXHKFqogFZcCHOierGRvJ3z5C+BguCWP
	85HK9acNczZv3mCmyb1F1klIdMMoMVTqjrDoHTulXgynVlpzkFsOObS5YcD+Kbhdkv7I1k
	siJn4TmvdNjL9uiWmEefVLoRy6MRIKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750773114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMPOvYGcRp+cu7/68oeiMBFcYHtUrY3Y+IZL5j+fdns=;
	b=A2/OReMxX+fJycO81nuQ5mqDQAwZirpW/08m5DGyslS5vksxqKdG4327Dgh1arhIoVcAus
	yXGF9NJwS36J4rAA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750773114; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMPOvYGcRp+cu7/68oeiMBFcYHtUrY3Y+IZL5j+fdns=;
	b=HyOLCHUlpWV1Pu8KtEzJZT1BTywy4iKbuCYIXxcXHKFqogFZcCHOierGRvJ3z5C+BguCWP
	85HK9acNczZv3mCmyb1F1klIdMMoMVTqjrDoHTulXgynVlpzkFsOObS5YcD+Kbhdkv7I1k
	siJn4TmvdNjL9uiWmEefVLoRy6MRIKg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750773114;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMPOvYGcRp+cu7/68oeiMBFcYHtUrY3Y+IZL5j+fdns=;
	b=A2/OReMxX+fJycO81nuQ5mqDQAwZirpW/08m5DGyslS5vksxqKdG4327Dgh1arhIoVcAus
	yXGF9NJwS36J4rAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A1B5613751;
	Tue, 24 Jun 2025 13:51:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cKwSJnmtWmjFcQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 24 Jun 2025 13:51:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
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
	deller@gmx.de,
	support.opensource@diasemi.com,
	duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 06/15] backlight: Include <linux/of.h>
Date: Tue, 24 Jun 2025 15:45:46 +0200
Message-ID: <20250624134858.1736090-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250624134858.1736090-1-tzimmermann@suse.de>
References: <20250624134858.1736090-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.997];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.30

Include <linux/of.h> to avoid dependency on backlight header to
include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 9dc93c5e480b..1e9b7e85d99a 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -16,6 +16,7 @@
 #include <linux/ctype.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 
 #ifdef CONFIG_PMAC_BACKLIGHT
 #include <asm/backlight.h>
-- 
2.50.0


