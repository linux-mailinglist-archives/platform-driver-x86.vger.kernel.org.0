Return-Path: <platform-driver-x86+bounces-13856-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD7B379BE
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Aug 2025 07:25:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6592C3A426E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Aug 2025 05:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 877C230F93D;
	Wed, 27 Aug 2025 05:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NzV0BBzM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="agDB9rje";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NzV0BBzM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="agDB9rje"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F392749F0
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Aug 2025 05:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756272295; cv=none; b=FibE0R2LCEUu7o9qckYlnaBMeAy6F8YKBdErrfg00eTPQDaaLDz2eSyCEgW+bjwhO+Qx49BjBJc+0zuR3a5sj+pKQHkJDfkZiS09GD/xelParvz/+BC0d6Cdcejf3iqB1VHHI2oKpAaSnA95BNjJBJApJ3bApt/UJ5iR7rR3YDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756272295; c=relaxed/simple;
	bh=ddlFw/qlOGkmq6rrOarImW8+DPpQrMpmV1aUJHh34pk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M2K5r1cSwYapndEQDHhfbz5GTCSUjG75GsogU8e8ZPHueu9bpf7ZndfQk1Zz7QBhjjlJeARmAEleepeUYB7KGH+83dLPFjJQwuKqY8hAccA9qglu1B1IbfBP0b2E2i6VPrqwIvWgnOzKupkWNHO3PPyI8/B4qSv3mspRSqqAcsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NzV0BBzM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=agDB9rje; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NzV0BBzM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=agDB9rje; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1758621D59;
	Wed, 27 Aug 2025 05:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756272291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BGshCphT136+Q4sfRRF7efgjNpZ2QZ9axcWbncoYV3s=;
	b=NzV0BBzMqa3OvXYNbbwD42dfIV3HVuTImlhzT5BD3xB1XX0j2M5XLE3AT8U4HaiCMANmmg
	cFqtqksaRGscdlXHalAhvqNpxZkjRjRpt7L3zza16aCt2iaI5C9gp/Wx+iCgzMCZwLmO+g
	oV+SbRQD/+U4c7Ba1Vx4lyZjF/kiGrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756272291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BGshCphT136+Q4sfRRF7efgjNpZ2QZ9axcWbncoYV3s=;
	b=agDB9rjePOx8HNNHSEf/jOLd0rLH0AbSU74gJKfOiYtsScs04cUBPTJAL+zLEsWrLYzoCl
	/5M2lNdtKzdDpRAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=NzV0BBzM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=agDB9rje
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756272291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BGshCphT136+Q4sfRRF7efgjNpZ2QZ9axcWbncoYV3s=;
	b=NzV0BBzMqa3OvXYNbbwD42dfIV3HVuTImlhzT5BD3xB1XX0j2M5XLE3AT8U4HaiCMANmmg
	cFqtqksaRGscdlXHalAhvqNpxZkjRjRpt7L3zza16aCt2iaI5C9gp/Wx+iCgzMCZwLmO+g
	oV+SbRQD/+U4c7Ba1Vx4lyZjF/kiGrM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756272291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=BGshCphT136+Q4sfRRF7efgjNpZ2QZ9axcWbncoYV3s=;
	b=agDB9rjePOx8HNNHSEf/jOLd0rLH0AbSU74gJKfOiYtsScs04cUBPTJAL+zLEsWrLYzoCl
	/5M2lNdtKzdDpRAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C984F13867;
	Wed, 27 Aug 2025 05:24:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZL+AL6KWrmgXRwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 27 Aug 2025 05:24:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: "Luke D . Jones" <luke@ljones.dev>
Cc: Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Fix racy registrations
Date: Wed, 27 Aug 2025 07:24:33 +0200
Message-ID: <20250827052441.23382-1-tiwai@suse.de>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 1758621D59
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
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
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linux.intel.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Score: -1.51

asus_wmi_register_driver() may be called from multiple drivers
concurrently, which can lead to the racy list operations, eventually
corrupting the memory and hitting Oops on some ASUS machines.
Also, the error handling is missing, and it forgot to unregister ACPI
lps0 dev ops in the error case.

This patch covers those issues by introducing a simple mutex at
acpi_wmi_register_driver() & *_unregister_driver, and adding the
proper call of asus_s2idle_check_unregister() in the error path.

Fixes: feea7bd6b02d ("platform/x86: asus-wmi: Refactor Ally suspend/resume")
Link: https://bugzilla.suse.com/show_bug.cgi?id=1246924
Link: https://lore.kernel.org/07815053-0e31-4e8e-8049-b652c929323b@kernel.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/platform/x86/asus-wmi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f7191fdded14..e72a2b5d158e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5088,16 +5088,22 @@ static int asus_wmi_probe(struct platform_device *pdev)
 
 	asus_s2idle_check_register();
 
-	return asus_wmi_add(pdev);
+	ret = asus_wmi_add(pdev);
+	if (ret)
+		asus_s2idle_check_unregister();
+
+	return ret;
 }
 
 static bool used;
+static DEFINE_MUTEX(register_mutex);
 
 int __init_or_module asus_wmi_register_driver(struct asus_wmi_driver *driver)
 {
 	struct platform_driver *platform_driver;
 	struct platform_device *platform_device;
 
+	guard(mutex)(&register_mutex);
 	if (used)
 		return -EBUSY;
 
@@ -5120,6 +5126,7 @@ EXPORT_SYMBOL_GPL(asus_wmi_register_driver);
 
 void asus_wmi_unregister_driver(struct asus_wmi_driver *driver)
 {
+	guard(mutex)(&register_mutex);
 	asus_s2idle_check_unregister();
 
 	platform_device_unregister(driver->platform_device);
-- 
2.50.1


