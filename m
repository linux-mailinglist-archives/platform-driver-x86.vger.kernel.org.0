Return-Path: <platform-driver-x86+bounces-12819-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0F9ADEC81
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Jun 2025 14:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412B916A0F2
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Jun 2025 12:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C492EAB99;
	Wed, 18 Jun 2025 12:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vs7G0AdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C6gx6Dbr";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vs7G0AdC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="C6gx6Dbr"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7B12EA73B
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Jun 2025 12:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750249693; cv=none; b=OWHxNt75PhiUtjEIIRccM/erh6MTsH23tW6cKY8jk7ia1WBN85slbLBXr50Dm71nD6iAs1ndLBJILWdArIsCvYyUt3ivCcNgk5NKTvYogr3BvRD2ZiOIqayzpGLxjC21KLwqjbPgmWRjwBc9078j0/k703KBeZ+D28+KCDee9W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750249693; c=relaxed/simple;
	bh=LY6kEIIrAkcXtwuLaxZ2oD31Vxn/oMO8U7H2V8oaO3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AwDFWfzKOqpfjYXKsDIdaU8rjeCU4hUxysD7sBKG2aBNGx9MN4eSgkFgMMDvBl4wPBNnTmnPfd/+Bd3hM736zXUQCxXAu542S3pFzLHx/5MfNDGc8RVLKERAPmoOstFrK8XYHU3SKzZc6MqOQ55+vAsbiIJrExlJYqc9HnjOl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vs7G0AdC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C6gx6Dbr; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vs7G0AdC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=C6gx6Dbr; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 589AC21248;
	Wed, 18 Jun 2025 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=vs7G0AdC4LPmwUKixwGgofQg/aOEomQTHHEdn1AexiB1eoWR2gxKQtV5ZauJEJ+mYsKKkx
	L688anvAiWalbnWJ3rY+E6rfmCOVe/le9Im8OZPJlcZs1zrjQEAlcQF3P5Twb3gH1TozNi
	puX2A1ReYCGsjtKeYRPOEXxWa7FVxUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=C6gx6DbrylyWvenw5nwZIXKMOIy6uKIRWmQaKG5mz/o8Rj4MN+9XBIlpDigApJuxuk8/ab
	RhSC0/tEoInHw+Cw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249662; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=vs7G0AdC4LPmwUKixwGgofQg/aOEomQTHHEdn1AexiB1eoWR2gxKQtV5ZauJEJ+mYsKKkx
	L688anvAiWalbnWJ3rY+E6rfmCOVe/le9Im8OZPJlcZs1zrjQEAlcQF3P5Twb3gH1TozNi
	puX2A1ReYCGsjtKeYRPOEXxWa7FVxUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249662;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GiIOMO1gGExrrVj20+JkYw2jySYCBDEP7IlYuqWJInY=;
	b=C6gx6DbrylyWvenw5nwZIXKMOIy6uKIRWmQaKG5mz/o8Rj4MN+9XBIlpDigApJuxuk8/ab
	RhSC0/tEoInHw+Cw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC9F013A99;
	Wed, 18 Jun 2025 12:27:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cAHeKL2wUmg4UgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:41 +0000
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
Subject: [PATCH 11/12] backlight: led_bl: Include <linux/of.h>
Date: Wed, 18 Jun 2025 14:16:43 +0200
Message-ID: <20250618122436.379013-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122436.379013-1-tzimmermann@suse.de>
References: <20250618122436.379013-1-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Level: 

Include <linux/of.h> to declare struct of_count_phandle_with_args().
Avoids dependency on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/led_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index d2db157b2c29..44aac5fb2663 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -9,6 +9,7 @@
 #include <linux/backlight.h>
 #include <linux/leds.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 
 struct led_bl_data {
-- 
2.49.0


