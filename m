Return-Path: <platform-driver-x86+bounces-280-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E671280412A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Dec 2023 22:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A152B281234
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Dec 2023 21:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6547839FEC;
	Mon,  4 Dec 2023 21:52:42 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51655101
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Dec 2023 13:52:39 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAGrU-0008Eo-Az; Mon, 04 Dec 2023 22:52:20 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAGrS-00DbUW-A0; Mon, 04 Dec 2023 22:52:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rAGrS-00ELqA-0a; Mon, 04 Dec 2023 22:52:18 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Corentin Chary <corentin.chary@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Rishit Bansal <rishitbansal0@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Jonathan Singer <jes965@nyu.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	SungHwan Jung <onenowy@gmail.com>
Cc: acpi4asus-user@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: [PATCH 0/2] platform/x86: Convert to platform remove callback returning void (part II)
Date: Mon,  4 Dec 2023 22:52:10 +0100
Message-ID: <cover.1701726190.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=6W4Bw07YmZ6dkRE+41Ub7UADhfL9BCnI8ALg6x7UF8Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlbkoJcpDBEGP0JgHKk5sypRFcSUGnzXAlParZZ 73nOCMLA0iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZW5KCQAKCRCPgPtYfRL+ TmbYB/0b3tfXZOBeVu7TTQCRZ/WPfsoPs7nYYFhBUrs2Cqcy5SmE2AJbCEN7mo20ubCfR2m3fsw ZeSWk7wrlKxfe8QKYx/eucJ3DtLUf9rniY2x1CciZ8Vo9xMDzu9zUWph8plJrkcdTIo24W7Monb IJ4ozFsT9bDrA0jdjxzffov5S6UbYsVvFAjpz/sNpo9aanCb225Nvlut8Y6lCo39aGgyg8B92fw vVX+GNIof32fGx4ZDBOZ1hr51vr8EHSFulhhrQYnt8MaL0NI9i4D278wRLpj1cDx11hzp/tt+a1 Dxmy8+EaWdH0PafAiNtOd/c6MArKh2oKNdzpsEkuAYDyeQI9
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org

Hello,

back when I sent a series to convert all platform drivers below
drivers/platform to use .remove_new()[1] I missed the two drivers
converted here.

The two patches have no dependency, so each can be picked individually
if needed by the driver maintainers. (But I won't say no if Hans picks
up both patches together :-)

See commit 5c5a7680e67b ("platform: Provide a remove callback that
returns no value") for an extended explanation and the eventual goal.

Best regards
Uwe

[1] https://lore.kernel.org/r/20230927081040.2198742-1-u.kleine-koenig@pengutronix.de


Uwe Kleine-König (2):
  platform/x86: asus-wmi: Convert to platform remove callback returning
    void
  platform/x86: hp-wmi: Convert to platform remove callback returning
    void

 drivers/platform/x86/asus-wmi.c  | 5 ++---
 drivers/platform/x86/hp/hp-wmi.c | 6 ++----
 2 files changed, 4 insertions(+), 7 deletions(-)

base-commit: 629a3b49f3f957e975253c54846090b8d5ed2e9b
-- 
2.42.0


