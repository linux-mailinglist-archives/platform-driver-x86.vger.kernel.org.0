Return-Path: <platform-driver-x86+bounces-13368-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F3B059FF
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 14:30:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED2F317B0F0
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Jul 2025 12:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC712DE71A;
	Tue, 15 Jul 2025 12:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QoKW7Yh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AkfZqHcj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QoKW7Yh6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="AkfZqHcj"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500182DE704
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Jul 2025 12:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752582598; cv=none; b=Ae1KnlaNS00wbdFjgI3SPBkKsTPuEFkn7F5FCC9NtOu5+ae7zwXAQgdBv9wNxzhysjP3g5MvulynXAU3PEMr3NQzsuGKQw6QKD4HJ+UtTN2remFZHWr7yUJVxMyc6ClnM7zfvXf/puhTAb/YRD/Oa5ZwlejZpQOSRCZq/L+24/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752582598; c=relaxed/simple;
	bh=mYbeIX46vdmeWrZPpXLw+bmodcnhebm5aCNlZ3DiVCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=r041tMBpBzem4vW/6XG3Ktx6lULAa71rZWAbhIcRK1QPMdcCIzdVC/dp5urg/At8o5pRqiDQMWGr+YL26i+dz1IhI4Miy7BkyRaRvusMLArbPN/dICjCl/VoTAy/LwNMSPNFacumu3AbyE8E4aqvDHZQUP1hwQ7fl+OCM/eD81c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QoKW7Yh6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AkfZqHcj; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QoKW7Yh6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=AkfZqHcj; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 37FCA1F38F;
	Tue, 15 Jul 2025 12:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=QoKW7Yh6porPglfWJz2OZChxEiamLvLxKaIvycNJxh3bg7LYQSgk60CjlzhWEIENjMyj1Y
	q42aI+n4ZNGdVGyAL8V1PftB8WPf2Xi1kTG2OG9CYS8agqfLmfAGndWG93mrdnPIbFKu69
	JzeBhVTqGI2vhk9xwmhVfZQzUouV/PM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=AkfZqHcjcB3keVB6qvSM3e0/bATe1ldj69gbeuALdJU7JgXK3Jo+3SZONymHV1JreOp94h
	CwLntdyDfgzpm6BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QoKW7Yh6;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AkfZqHcj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1752582594; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=QoKW7Yh6porPglfWJz2OZChxEiamLvLxKaIvycNJxh3bg7LYQSgk60CjlzhWEIENjMyj1Y
	q42aI+n4ZNGdVGyAL8V1PftB8WPf2Xi1kTG2OG9CYS8agqfLmfAGndWG93mrdnPIbFKu69
	JzeBhVTqGI2vhk9xwmhVfZQzUouV/PM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1752582594;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mjCwmxRw2oiS5uDhgBamrzilzsoTGXeob+BS+5zzIRE=;
	b=AkfZqHcjcB3keVB6qvSM3e0/bATe1ldj69gbeuALdJU7JgXK3Jo+3SZONymHV1JreOp94h
	CwLntdyDfgzpm6BQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CEB913306;
	Tue, 15 Jul 2025 12:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HyAMIcFJdmgaIwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 15 Jul 2025 12:29:53 +0000
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
Subject: [PATCH v2 00/15] backlight: Do not include <linux/fb.h> in header file
Date: Tue, 15 Jul 2025 14:24:37 +0200
Message-ID: <20250715122643.137027-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,gmx.de,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,diasemi.com,skole.hr];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 37FCA1F38F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -2.01

Remove the final dependencies on fbdev from the backlight subsystem.
This is really just the include of <linux/fb.h> in backlight, but it
has some fallout in other code.

Patches 1 to 14 fix all the implicit includes that come from fb.h
throughout the kernel. It's all trivial, but touches various drivers.
Maintainers are in CC. Patch 15 fixes the backlight header.

With the series applied the backlight subsystem should be free from
fbdev dependencies.

v2:
- add missing clean ups in jornada720, rave-sp, rt4831

Thomas Zimmermann (15):
  platform/x86: dell-uart-backlight: Use blacklight power constant
  drm/panel: panel-samsung-s6e63m0: Include <linux/of.h>
  drm/panel: panel-samsung-s6e88a0-ams427ap24: Include <linux/of.h>
  drm/panel: panel-summit: Include <linux/of.h>
  fbcon: Add necessary include statements and forward declarations
  backlight: Include <linux/of.h>
  backlight: apple_dwi_bl: Include <linux/mod_devicetable.h>
  backlight: as3711_bl: Include <linux/of.h>
  backlight: da9052_bl: Include <linux/mod_devicetable.h>
  backlight: jornada720: Include <linux/io.h>
  backlight: ktd2801: Include <linux/mod_devicetable.h>
  backlight: led_bl: Include <linux/of.h>
  backlight: rave-sp: Include <linux/of.h> and <linux/mod_devicetable.h>
  backlight: rt4831: Include <linux/mod_devicetable.h>
  backlight: Do not include <linux/fb.h> in header file

 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c            | 1 +
 drivers/gpu/drm/panel/panel-samsung-s6e88a0-ams427ap24.c | 1 +
 drivers/gpu/drm/panel/panel-summit.c                     | 1 +
 drivers/platform/x86/dell/dell-uart-backlight.c          | 2 +-
 drivers/video/backlight/apple_dwi_bl.c                   | 1 +
 drivers/video/backlight/as3711_bl.c                      | 1 +
 drivers/video/backlight/backlight.c                      | 1 +
 drivers/video/backlight/da9052_bl.c                      | 1 +
 drivers/video/backlight/jornada720_bl.c                  | 1 +
 drivers/video/backlight/ktd2801-backlight.c              | 1 +
 drivers/video/backlight/led_bl.c                         | 1 +
 drivers/video/backlight/rave-sp-backlight.c              | 2 ++
 drivers/video/backlight/rt4831-backlight.c               | 1 +
 include/linux/backlight.h                                | 1 -
 include/linux/fbcon.h                                    | 7 +++++++
 15 files changed, 21 insertions(+), 2 deletions(-)

-- 
2.50.0


