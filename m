Return-Path: <platform-driver-x86+bounces-12933-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F20D8AE6746
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 15:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64FE8188C3F6
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 13:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914962C327F;
	Tue, 24 Jun 2025 13:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ngDQt3Cr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SGfGuamx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ngDQt3Cr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="SGfGuamx"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086E42C3265
	for <platform-driver-x86@vger.kernel.org>; Tue, 24 Jun 2025 13:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773150; cv=none; b=kqx13RxZcZZCB9iyfb4SWB24Jx+7RbgnyBunGl4T+AVDyeaaSNEvf1ZT0C8u+KZJh9KBpBMMVUJ4V/CyJLIYcGdhMsQzTc3ndHkbQ3Gcz729+rBfhDE2ceQaG8oUEWQRV/K3sGPtOz4MhhXRRrBO4qvUPrbCPWMAXEi3RS9+UDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773150; c=relaxed/simple;
	bh=BwNaO03dJQcX4JsUIVqMuToXucujWO27ZJhS6WG97mM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEga4m6wNzEWbaUrQvbel6+ayvArrB+oKqvyoizxKREWb1LEbCCt028pSWlQKDJ+w4gM1UzSoRtQRKyO2IEk04ktEoMz92xEH0qsOHKveUQwaUnc2nI/oG+6iZvSamVRz7cxGU/ne3RzHFxnLUZnYnPCSf9RfAXuOilpkhrWeYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ngDQt3Cr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SGfGuamx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ngDQt3Cr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=SGfGuamx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC78B1F461;
	Tue, 24 Jun 2025 13:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750773115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubYkbuLl3zPGri+wdEX1PNUP5gbqgcXbG6qduApp9NU=;
	b=ngDQt3Crrsy1Fu12zQYCdh1b644wgud51u3HKMven5aJm3mfrEDPw3tqeKvn9tB56OHwjr
	ekDoabCHNkDIEpxPMtp1yzs0QoZYQw2NWX3sxEeHBXRjfcqGWqBVlV0NwgMzhEiHfVLBz1
	dM5AB4KFPbWedLf/MN5LMLTaQzk68SU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750773115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubYkbuLl3zPGri+wdEX1PNUP5gbqgcXbG6qduApp9NU=;
	b=SGfGuamxzYDnXh+RR6XoRxWXazXaNO3xD8gG6UiLGmdwt7t+u8rxd9eB+QQec2+qGPjHSu
	3HGk3c8lnXWXSOBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750773115; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubYkbuLl3zPGri+wdEX1PNUP5gbqgcXbG6qduApp9NU=;
	b=ngDQt3Crrsy1Fu12zQYCdh1b644wgud51u3HKMven5aJm3mfrEDPw3tqeKvn9tB56OHwjr
	ekDoabCHNkDIEpxPMtp1yzs0QoZYQw2NWX3sxEeHBXRjfcqGWqBVlV0NwgMzhEiHfVLBz1
	dM5AB4KFPbWedLf/MN5LMLTaQzk68SU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750773115;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubYkbuLl3zPGri+wdEX1PNUP5gbqgcXbG6qduApp9NU=;
	b=SGfGuamxzYDnXh+RR6XoRxWXazXaNO3xD8gG6UiLGmdwt7t+u8rxd9eB+QQec2+qGPjHSu
	3HGk3c8lnXWXSOBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2351F13751;
	Tue, 24 Jun 2025 13:51:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id sHM0B3utWmjFcQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 24 Jun 2025 13:51:55 +0000
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
Subject: [PATCH v2 08/15] backlight: as3711_bl: Include <linux/of.h>
Date: Tue, 24 Jun 2025 15:45:48 +0200
Message-ID: <20250624134858.1736090-9-tzimmermann@suse.de>
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
	BAYES_HAM(-3.00)[99.99%];
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

Include <linux/of.h> to declare various OF helpers. Avoids dependency
on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/as3711_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
index 9f89eb19894e..753160bbc3e7 100644
--- a/drivers/video/backlight/as3711_bl.c
+++ b/drivers/video/backlight/as3711_bl.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/as3711.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-- 
2.50.0


