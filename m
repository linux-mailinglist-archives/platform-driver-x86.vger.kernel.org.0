Return-Path: <platform-driver-x86+bounces-13377-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B91B05A1D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 14:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EB8EC17FA32
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 12:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FEB1EDA09;
	Tue, 15 Jul 2025 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ADZzF3WZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JcxEI/R7";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ADZzF3WZ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="JcxEI/R7"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B72E36EC
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 12:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582624; cv=none; b=FT8YF6UXYKrUfKaErv7HdZ2x8jTZp1Givnw1GLIF4sX8bKDmUN0SeNe3yGnTqm1woZGx0G04rL5Pz3Ay52BxzPUGLLIOssE+2qQ5ITuuLxnRrCZdd6QfOAUqPTDxVJMU6FZV3Yvl/qgEroBOkyXWPs5Q0HHPW6VMso8mc1/ZobE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582624; c=relaxed/simple;
	bh=gqVIo/JeKJscHGfombOe/ELrgKKb1X4pWIQRljbk5vc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IfDw+q539tmIexzpvdj4lDrY3uwAFcDv72M77c1KgpiIuYQl8ZRe6Zgzpq3LBMNzHN/vUpTqOQwsA5CSO1DtTeNmtubt5QUA04lRTeUbfhFkabhJLVomJ01Zd2rIPy3mN205RzJrCEVQPBC9BeDnmV6bMHUKNHKFUSSqiAq+WcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ADZzF3WZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JcxEI/R7; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ADZzF3WZ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=JcxEI/R7; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8E41D1F796;
	Tue, 15 Jul 2025 12:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=ADZzF3WZG/P4eaVw1KCuD7+1cl2TozDeLwnyRn5NpvA4b3sT1GHSqV2l2fsU+vQouFzy2s
	jX9r2JK8P/oVSXltF/C6YYdzB8F2yJwnmbT2NBd3ij1I/HCogBzzSdZvBb0eFua7qMnleg
	P8GzRxS8yTHLQQRWeO3xOttDOjAtweQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=JcxEI/R7c4Dy+ikUdbNnvEYqS95eX1MqgS7zagakfvaO7s4tRZ0hCU+QhueSQ7nW8J4/fF
	SaeamdUA9kZTGWBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=ADZzF3WZG/P4eaVw1KCuD7+1cl2TozDeLwnyRn5NpvA4b3sT1GHSqV2l2fsU+vQouFzy2s
	jX9r2JK8P/oVSXltF/C6YYdzB8F2yJwnmbT2NBd3ij1I/HCogBzzSdZvBb0eFua7qMnleg
	P8GzRxS8yTHLQQRWeO3xOttDOjAtweQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4dAFwS889xgp5a+lO2Fbc7+62a8bXrpFVkXhSpncq64=;
	b=JcxEI/R7c4Dy+ikUdbNnvEYqS95eX1MqgS7zagakfvaO7s4tRZ0hCU+QhueSQ7nW8J4/fF
	SaeamdUA9kZTGWBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E354813A6C;
	Tue, 15 Jul 2025 12:29:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 2IFWNsRJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:29:56 +0000
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
Subject: [PATCH v2 05/15] fbcon: Add necessary include statements and forward declarations
Date: Tue, 15 Jul 2025 14:24:42 +0200
Message-ID: <20250715122643.137027-6-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -1.30

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


