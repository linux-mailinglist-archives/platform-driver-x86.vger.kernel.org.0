Return-Path: <platform-driver-x86+bounces-12924-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F98AE6721
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 15:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8760A164198
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 13:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBB12BE7BC;
	Tue, 24 Jun 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="po/Sqb+0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qzGU6anv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="po/Sqb+0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="qzGU6anv"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF33729C335
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jun 2025 13:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773122; cv=none; b=NJHaTlo2dQlb0rUeodAY6n1A5RXqy2uX5g62E3/8/0cf5rjZXsIER26D/ri7lnT6SV+wM2NFgeam9mrD0RPo1azXqnzEMvt42sCLfmfJ702glhJtIjmxfrBLy5kh6pN+QR31yZWxrnAvnK+Dow0H2dFlNLM9AHifmMxV+PehDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773122; c=relaxed/simple;
	bh=gqVIo/JeKJscHGfombOe/ELrgKKb1X4pWIQRljbk5vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ll9muJkkAJMHhK47ArckRC+zyik/Pe/EkQlkIs+DMkmDZF1wg4CPLfHrjwUWhDskPbnrmIWm/dEOF1LmhrhmfjbNvZT6J395KRThI6QoCG0xdNOqsu6OrsW42gMoH6cnpwdbXQl9q0RLgxM90sEao14yghSzyCgVtVzTkzUiawk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=po/Sqb+0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qzGU6anv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=po/Sqb+0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=qzGU6anv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A44BA2118D;
	Tue, 24 Jun 2025 13:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750773113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=po/Sqb+0F8gkYhEjsOgO9QgJMAwZdn1emlcZTavP3oAHst4ToXkSC64u85s/jzjZf3poc5
	1k4OU8Hac4bwmnBC0W1wq5/RRN4LL1pNaviUBFay0vQFbepkB/UQSH40Nsxbz37Mn9flNj
	lE4jy4u+jfuZG88oG/n/TXA3lfcD90I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750773113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=qzGU6anvBQHGjrPDttXV5kfy3NUHyrWOoAtXhiPvJbQp/1seD8auZfJDeM2PpSw71QiqJ5
	byM6pd3LL+yVviDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750773113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=po/Sqb+0F8gkYhEjsOgO9QgJMAwZdn1emlcZTavP3oAHst4ToXkSC64u85s/jzjZf3poc5
	1k4OU8Hac4bwmnBC0W1wq5/RRN4LL1pNaviUBFay0vQFbepkB/UQSH40Nsxbz37Mn9flNj
	lE4jy4u+jfuZG88oG/n/TXA3lfcD90I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750773113;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=qzGU6anvBQHGjrPDttXV5kfy3NUHyrWOoAtXhiPvJbQp/1seD8auZfJDeM2PpSw71QiqJ5
	byM6pd3LL+yVviDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E697B13A96;
	Tue, 24 Jun 2025 13:51:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yGXmNnitWmjFcQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 24 Jun 2025 13:51:52 +0000
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
Subject: [PATCH v2 05/15] fbcon: Add necessary include statements and forward declarations
Date: Tue, 24 Jun 2025 15:45:45 +0200
Message-ID: <20250624134858.1736090-6-tzimmermann@suse.de>
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
X-Spam-Flag: NO
X-Spam-Score: -5.30
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

Make the header self contained for including.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/fbcon.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/fbcon.h b/include/linux/fbcon.h
index 2382dec6d6ab..81f0e698acbf 100644
--- a/include/linux/fbcon.h
+++ b/include/linux/fbcon.h
@@ -1,6 +1,13 @@
 #ifndef _LINUX_FBCON_H
 #define _LINUX_FBCON_H
 
+#include <linux/compiler_types.h>
+
+struct fb_blit_caps;
+struct fb_info;
+struct fb_var_screeninfo;
+struct fb_videomode;
+
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE
 void __init fb_console_init(void);
 void __exit fb_console_exit(void);
-- 
2.50.0


