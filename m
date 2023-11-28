Return-Path: <platform-driver-x86+bounces-124-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A4C7FC727
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 22:08:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340392876DA
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 21:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AFBF44C74;
	Tue, 28 Nov 2023 21:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8iJUyBN"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E118F44379;
	Tue, 28 Nov 2023 21:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D6CC4166B;
	Tue, 28 Nov 2023 21:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701205703;
	bh=zSwLFu7OtLy2Zn+0zDwtDj7975oDWp+IIFJU4t6gJi4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b8iJUyBNYVIKjKRFzJWlyGn5CDUtIx5Q/sWqWwea/4usulyZAMhswl8VFMezYSKwb
	 nKyV4E91phpQqWkkovPPQUIV+KA3W4ojRMs9/dFlSr2Qt5XZELzvqOyKZPLMYWUTSI
	 Q6c+LPw9WQR4o+zgSr4SRo8CsBSw+X/TcaEZZMTGQ4NWbEuh714YgFeyjpWrA92ZD2
	 N6rrkbOIAeVRoXxQVueMOxuKWv9MsDtHgvRo9LLj1s0Ux1Cb+bCVq15yoIjKmtnO0t
	 MUWk8GX+VdBDP/oJCsF5sNDadDYkVRGKSLRKEhsh91T+W5pSScwT5o2TskJ3EfwwuM
	 ttvQfY4aZkw1g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	kernel test robot <lkp@intel.com>,
	Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	david.e.box@linux.intel.com,
	hdegoede@redhat.com,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 17/25] platform/x86: intel_telemetry: Fix kernel doc descriptions
Date: Tue, 28 Nov 2023 16:07:33 -0500
Message-ID: <20231128210750.875945-17-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231128210750.875945-1-sashal@kernel.org>
References: <20231128210750.875945-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.64
Content-Transfer-Encoding: 8bit

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

[ Upstream commit a6584711e64d9d12ab79a450ec3628fd35e4f476 ]

LKP found issues with a kernel doc in the driver:

core.c:116: warning: Function parameter or member 'ioss_evtconfig' not described in 'telemetry_update_events'
core.c:188: warning: Function parameter or member 'ioss_evtconfig' not described in 'telemetry_get_eventconfig'

It looks like it were copy'n'paste typos when these descriptions
had been introduced. Fix the typos.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202310070743.WALmRGSY-lkp@intel.com/
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Link: https://lore.kernel.org/r/20231120150756.1661425-1-andriy.shevchenko@linux.intel.com
Reviewed-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/intel/telemetry/core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/telemetry/core.c b/drivers/platform/x86/intel/telemetry/core.c
index fdf55b5d69480..e4be40f73eebf 100644
--- a/drivers/platform/x86/intel/telemetry/core.c
+++ b/drivers/platform/x86/intel/telemetry/core.c
@@ -102,7 +102,7 @@ static const struct telemetry_core_ops telm_defpltops = {
 /**
  * telemetry_update_events() - Update telemetry Configuration
  * @pss_evtconfig: PSS related config. No change if num_evts = 0.
- * @pss_evtconfig: IOSS related config. No change if num_evts = 0.
+ * @ioss_evtconfig: IOSS related config. No change if num_evts = 0.
  *
  * This API updates the IOSS & PSS Telemetry configuration. Old config
  * is overwritten. Call telemetry_reset_events when logging is over
@@ -176,7 +176,7 @@ EXPORT_SYMBOL_GPL(telemetry_reset_events);
 /**
  * telemetry_get_eventconfig() - Returns the pss and ioss events enabled
  * @pss_evtconfig: Pointer to PSS related configuration.
- * @pss_evtconfig: Pointer to IOSS related configuration.
+ * @ioss_evtconfig: Pointer to IOSS related configuration.
  * @pss_len:	   Number of u32 elements allocated for pss_evtconfig array
  * @ioss_len:	   Number of u32 elements allocated for ioss_evtconfig array
  *
-- 
2.42.0


