Return-Path: <platform-driver-x86+bounces-14713-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F11FBE02CB
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Oct 2025 20:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5DF644E063E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Oct 2025 18:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA66610E0;
	Wed, 15 Oct 2025 18:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b="LqMjDloJ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from e3i86.smtp2go.com (e3i86.smtp2go.com [158.120.84.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45883254AE
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 18:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.86
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552901; cv=none; b=ZIlHaeeiciaORaVM4GVY+VlUHrmpr6agwHcosbNnGpmxretfD4BVdB71lGNhjrREb77Ohc2wMdn1Ri2WMJ0Ls1xLuEZf11jOWaPVERSwj97ZJIh+rEf3fNxpVs5WJ9oZf9+hQdxWXYYdy3Vsys9d0ojX+I/EmP06WZxJt/5WnAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552901; c=relaxed/simple;
	bh=ffOfwsHr+yAGHRJuSai5LUwd6+m1hseyRwIcKaquC2w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqM/mGnXr7wyYUMW4Tk2o0qsbBaGDj2o8Wf81gA6Pv3Xam6QjyKFiIl+JVs4QAA87HXXISxFW0TDUJORc++XnUq/3IjEmjWo5LKBRB3BCUxH/t77Jmnv+fBzePFpkdukRoIf//gd5F57zDsv3hnynnKfbQ5zrZWWvlbUAEoRpbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev; spf=pass smtp.mailfrom=em1255854.medip.dev; dkim=pass (2048-bit key) header.d=medip.dev header.i=@medip.dev header.b=LqMjDloJ; arc=none smtp.client-ip=158.120.84.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=medip.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1255854.medip.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=medip.dev;
 i=@medip.dev; q=dns/txt; s=s1255854; t=1760551990; h=from : subject :
 to : message-id : date;
 bh=anCQPHVE/XUDRso2Re9zB1kDzN+VIwg3s3BKvkkml14=;
 b=LqMjDloJIBNZ/HNQ8YIm6cyty35Z7GIr3uJMt8kEwVnPUqoguQl3SrBVH5CVs8RWkMwds
 G+VQEV6Nyd9jXxjSVw5PfPQ8dP2d8WMLxa9d17FJdDkPTfIgJdEl0+J9cR9hKoG1vctGIvH
 c3qlR3i1r/k+wN27141MOGej2dj9K0JHcpnoEgRkICKbNb4c+pf7YFBpSd6qjouRnBmxfIK
 P0UeD3Jxjc+Y1fDfs2rVaYPkL+muE3WRrgD7FmK2NL2XmGj/inWPMKAk0IcdU/vBiZtxesF
 C2TTlLLInAB+F8JAeVN6AJwxEbXNps1smt+ZI4w1NCa5lvSRxNPonFZ3g99w==
Received: from [10.152.250.198] (helo=vilez)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.1-S2G)
	(envelope-from <edip@medip.dev>)
	id 1v95zl-4o5NDgrjPI1-gXZW;
	Wed, 15 Oct 2025 18:13:05 +0000
From: edip@medip.dev
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	kuba@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Edip Hazuri <edip@medip.dev>
Subject: [PATCH] platform/x86: hp-wmi: mark Victus 16-r0 and 16-s0 for victus_s fan and thermal profile support
Date: Wed, 15 Oct 2025 21:10:44 +0300
Message-ID: <20251015181042.23961-3-edip@medip.dev>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1255854m:1255854ay30w_v:1255854sY5Hk5a1oa
X-smtpcorp-track: 19N_3cixKbOi.TO0SsZCNzHoL.zeVN5QaS9CY

From: Edip Hazuri <edip@medip.dev>

This patch adds Victus 16-r0 (8bbe) and Victus 16-s0(8bd4, 8bd5) laptop
DMI board name into existing list

Signed-off-by: Edip Hazuri <edip@medip.dev>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 8b3533d6ba0..a84343bf96b 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -92,9 +92,9 @@ static const char * const victus_thermal_profile_boards[] = {
 	"8A25"
 };
 
-/* DMI Board names of Victus 16-r1000 and Victus 16-s1000 laptops */
+/* DMI Board names of Victus 16-r and Victus 16-s laptops */
 static const char * const victus_s_thermal_profile_boards[] = {
-	"8C99", "8C9C"
+	"8BBE", "8BD4", "8BD5", "8C99", "8C9C"
 };
 
 enum hp_wmi_radio {
-- 
2.51.0


