Return-Path: <platform-driver-x86+bounces-13382-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A265B05A28
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 14:30:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AD6A17FD0C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 12:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D35DC2DCF57;
	Tue, 15 Jul 2025 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YyKWbCWf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Cv5kWp4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YyKWbCWf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="1Cv5kWp4"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EF61EDA09
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 12:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582641; cv=none; b=O2banMegauhMOSJq/b+R+WlZSobx7neQvUfMKJ6uat8dVPXmV1H8zfF0uQE2BY+EbhNDTQECmF6g/sF8kSsKXEwxc02tUXs+5AOQXyuWH0i+hxGJD6UqrxZEp1hh8boaBgSa/1Xd5UvJ/IM89d4L3NLDLcCN4RF+m2hS4BykhV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582641; c=relaxed/simple;
	bh=QYPLN6dGC5cGmFwspvOIjLRoZStmuOFjEozWkk2g81M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kYChIaGavuNq9Sy6xherjdpm6RebnT2TT8mESSHpjyCZ8o8LqZL0q7UKOu2BwPHJn422Qyi5+A2V3OAfuFXUxrLBH/P4+NMA1s/JtYJ4u3n3emX+KflcDnz11UKqpDhTuJ1g5rm9kVKMatO6oPSmslhxpVD9kt5cHIjqgxENgVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YyKWbCWf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Cv5kWp4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YyKWbCWf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=1Cv5kWp4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B63941F7A6;
	Tue, 15 Jul 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkFnrSeeIBG8oMt/mWPBr/iI0XDo1CZlwwGPUIw+XTk=;
	b=YyKWbCWfB5I0jr7jYwVlGUG+TE3Ul5OUd6cks9obSKmExqUpqt52a9BUusxzBJAc9KqLak
	1a6PvbFzhEefhmzfO/d6Bfm4cU3yi9o+27ZrEYDWUqQN04bzWEcoOaM0nICgQydMCcPabn
	zywYvnmo72fNpfr8OhjEPxn6DyGp2Us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkFnrSeeIBG8oMt/mWPBr/iI0XDo1CZlwwGPUIw+XTk=;
	b=1Cv5kWp4gbQIo57FVKa5pDqH2/RFYq0sN2aEHh3ewgpY1hMQOl2/HHHThiXRQkzKLUzjQO
	eM3cp5pQl/z+q5BQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582601; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkFnrSeeIBG8oMt/mWPBr/iI0XDo1CZlwwGPUIw+XTk=;
	b=YyKWbCWfB5I0jr7jYwVlGUG+TE3Ul5OUd6cks9obSKmExqUpqt52a9BUusxzBJAc9KqLak
	1a6PvbFzhEefhmzfO/d6Bfm4cU3yi9o+27ZrEYDWUqQN04bzWEcoOaM0nICgQydMCcPabn
	zywYvnmo72fNpfr8OhjEPxn6DyGp2Us=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582601;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GkFnrSeeIBG8oMt/mWPBr/iI0XDo1CZlwwGPUIw+XTk=;
	b=1Cv5kWp4gbQIo57FVKa5pDqH2/RFYq0sN2aEHh3ewgpY1hMQOl2/HHHThiXRQkzKLUzjQO
	eM3cp5pQl/z+q5BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1215B13A6C;
	Tue, 15 Jul 2025 12:30:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eLb2AslJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:30:01 +0000
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
Subject: [PATCH v2 11/15] backlight: ktd2801: Include <linux/mod_devicetable.h>
Date: Tue, 15 Jul 2025 14:24:48 +0200
Message-ID: <20250715122643.137027-12-tzimmermann@suse.de>
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
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,lists.linux.dev,vger.kernel.org,lists.infradead.org,suse.de,gmail.com];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc),to(RLpx6hatunazuh7ud675imbh78)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-Spam-Flag: NO
X-Spam-Score: -1.30

Include <linux/mod_devicetable.h> to declare struct of_device_id.
Avoids dependency on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/video/backlight/ktd2801-backlight.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
index 0489b0615ceb..17eac1b3bce4 100644
--- a/drivers/video/backlight/ktd2801-backlight.c
+++ b/drivers/video/backlight/ktd2801-backlight.c
@@ -6,6 +6,7 @@
 #include <linux/backlight.h>
 #include <linux/gpio/consumer.h>
 #include <linux/leds-expresswire.h>
+#include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
-- 
2.50.0


