Return-Path: <platform-driver-x86+bounces-13383-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B7DCDB05A2A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 14:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEFEE3ACC75
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 12:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26AF92DEA6A;
	Tue, 15 Jul 2025 12:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GDxaNOaZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="A5KgqXA3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KuI8GJks";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ynBfnVH9"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA501EDA09
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 12:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582647; cv=none; b=iGc0Pr4qj26P8v8pLoDUr/HbrCY9vOVhNFHQ1YRrYkAuJR3E9MHQ362XSpb8/aOuQPC7H33NOXxRftnZTbEltYR3Jsc+ozP1YfPr9vuqEOjFwK3Vl7krMg9y/wr+T8XEANpEGKO9MMzXEZ0qQ06RZ/pVLUN2vSlcRgmg1a+8+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582647; c=relaxed/simple;
	bh=hGOHY5EqX24PHULoKaFcv7QLGg52McD4wj4R0vVCqTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oz/36nriU3JpI41s1Z37qrdhhj2VklojRt6yfnMGVl1hitwXk/VcT5JMbikPWvN3yFl7wZZOtlKth0wnZHnSVvnymzvdH4IVl6C7wm5yxI9w+e2d+LBQx3CRURXfAC9EftIkQqkw+DMSArCj9XVYXzUaIrshuFqQQgKYdHoiOuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=GDxaNOaZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=A5KgqXA3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KuI8GJks; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ynBfnVH9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0B2001F7A4;
	Tue, 15 Jul 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=GDxaNOaZqAGFlkzCJDe+JzEsaNKUmX1pxuAMWZ43n7B/3CPqoPS9VAx/bfAyIGFJ5Cae6Y
	z6AS0d1pM1y7QRtSG4NA9mgyDp1bwGwERdIx+Kq8rxU61531mdjCYT0sCmMrF2tSLxYcIO
	s85e925G7OZQpHXc7KX/InljsrZon+4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582602;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=A5KgqXA3cgstpR5H8MbCEvZ6GNzMQIqVXNge3bcbD7M020j8IzEEbB/lzhPEBqrOTae+tK
	Hf7MeBY5b6JVdFCQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=KuI8GJks;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=ynBfnVH9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=KuI8GJkspX4xamZxa5n9JtrrgRXqkzY90+Xu7R7giB75X/jWBJLrx0G1ZjbiL3uXmehWnl
	EbA1+ds6AkxrDCn/8/mxG2yNsFElwEj0TOtpKoNTqacxua9VzZK+ChBikJPbqcGNWoUbW2
	6+Pd8sKOM+MWKf5rZmen3KOVut2rVK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YkJ5sVkqytjmUz49vrqyxdNv/7YfXsI8/YNAXEBvJic=;
	b=ynBfnVH9IeVNT2PvvTiq5RfFV+Rq88Y8ejdkE9NF8WX5xS3r3MER2D41qbFmExFWcVE2dH
	5am5mjPcceZHdADg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5F6C113306;
	Tue, 15 Jul 2025 12:30:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IK7pFchJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:30:00 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/15] backlight: jornada720: Include <linux/io.h>
Date: Tue, 15 Jul 2025 14:24:47 +0200
Message-ID: <20250715122643.137027-11-tzimmermann@suse.de>
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
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim,suse.de:email];
	TAGGED_RCPT(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	R_RATELIMIT(0.00)[to(RLpx6hatunazuh7ud675imbh78),to_ip_from(RL95szse9eqfwu74ziohs8j73e)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 0B2001F7A4
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -1.51

Include <linux/io.h> to declare IOMEM(). Avoids dependency on
backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/jornada720_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/jornada720_bl.c b/drivers/video/backlight/jornada720_bl.c
index e28d2c071798..bbb65fdaddc7 100644
--- a/drivers/video/backlight/jornada720_bl.c
+++ b/drivers/video/backlight/jornada720_bl.c
@@ -7,6 +7,7 @@
 
 #include <linux/backlight.h>
 #include <linux/device.h>
+#include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.50.0


