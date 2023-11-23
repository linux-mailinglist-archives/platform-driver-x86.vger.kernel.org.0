Return-Path: <platform-driver-x86+bounces-5-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5507F571C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 05:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1B771C20C57
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 04:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9D16AD4A;
	Thu, 23 Nov 2023 04:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j3X4FbQ2"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C142112;
	Wed, 22 Nov 2023 20:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700712236; x=1732248236;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CoErI8R9kWQE4jfpj2fYDuPqAQ/RXoWzpsnmozO+rf8=;
  b=j3X4FbQ247UaiEKiuneYKc1IpENrxdAxWJ83/6WoUoIe7cM36dMr6aMf
   gYhx1o3azN68908/brbaT1CJT8zBTlC7Q868V6OZ+w/25eoZYU0VPWJ1w
   PAoBTlkteIejexluNDyN/iySB3AGIUu5Gp3O9vtMIQ4ZNbr0NEsdubMGW
   lfa6n82nwD6hejV/Kzj6PELwhxoZSj4XVeEHndNQAuF4cpFoWQDvpF0nZ
   IOOZ1Kz87i9QWSMTQcDYM0WnYIB50xKiPLZZRClDNHsnCRcA0lCVfSyEg
   Y8vYCt9TvE8RDBAufWhC6lQQbiMsuNoh5YYL6ypIMDWrVzAGK9h337Cvi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="389347940"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="389347940"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="801925644"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="801925644"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 20:03:55 -0800
Received: from debox1-desk4.lan (snpatel1-mobl.amr.corp.intel.com [10.209.89.91])
	by linux.intel.com (Postfix) with ESMTP id 62B88580CA4;
	Wed, 22 Nov 2023 20:03:55 -0800 (PST)
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	ilpo.jarvinen@linux.intel.com,
	rajvi.jingar@linux.intel.com
Subject: [PATCH V5 00/20] intel_pmc: Add telemetry API to read counters
Date: Wed, 22 Nov 2023 20:03:35 -0800
Message-Id: <20231123040355.82139-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On newer Intel silicon, more IP counters are being added in Intel Platform
Monitoring Technology (PMT) telemetry spaces hosted in MMIO.  There is a
need for the intel_pmc_core driver and other drivers to access PMT hosted
telemetry in the kernel using an API. This patchset adds driver APIs to
allow registering and reading telemetry entries. It makes changes to the
intel_pmc_core driver to use these interfaces to access the low power mode
counters that are now exclusively available from PMT.

David E. Box (15):
  platform/x86/intel/vsec: Fix xa_alloc memory leak
  platform/x86/intel/vsec: Move structures to header
  platform/x86/intel/vsec: remove platform_info from vsec device
    structure
  platform/x86/intel/vsec: Use cleanup.h
  platform/x86/intel/vsec: Assign auxdev parent by argument
  platform/x86/intel/vsec: Add base address field
  platform/x86/intel/pmt: Add header to struct intel_pmt_entry
  platform/x86/intel/pmt: telemetry: Export API to read telemetry
  platform/x86/intel/pmc: Allow pmc_core_ssram_init to fail
  asm-generic/io.h: iounmap/ioport_unmap cleanup.h support
  platform/x86/intel/pmc: Cleanup SSRAM discovery
  platform/x86/intel/pmc/mtl: Use return value from
    pmc_core_ssram_init()
  platform/x86/intel/pmc: Find and register PMC telemetry entries
  platform/x86/intel/pmc: Add debug attribute for Die C6 counter
  platform/x86/intel/pmc: Show Die C6 counter on Meteor Lake

Gayatri Kammela (1):
  platform/x86/intel/vsec: Add intel_vsec_register

Rajvi Jingar (1):
  platform/x86/intel/pmc: Display LPM requirements for multiple PMCs

Xi Pardee (3):
  platform/x86:intel/pmc: Call pmc_get_low_power_modes from platform
    init
  platform/x86/intel/pmc: Retrieve LPM information using Intel PMT
  platform/x86/intel/pmc: Read low power mode requirements for MTL-M and
    MTL-P

 drivers/platform/x86/intel/pmc/Kconfig      |   1 +
 drivers/platform/x86/intel/pmc/adl.c        |   2 +
 drivers/platform/x86/intel/pmc/cnp.c        |   2 +
 drivers/platform/x86/intel/pmc/core.c       | 190 +++++++++-----
 drivers/platform/x86/intel/pmc/core.h       |  10 +-
 drivers/platform/x86/intel/pmc/core_ssram.c | 263 +++++++++++++++++---
 drivers/platform/x86/intel/pmc/icl.c        |  10 +-
 drivers/platform/x86/intel/pmc/mtl.c        |  87 ++++++-
 drivers/platform/x86/intel/pmc/spt.c        |  10 +-
 drivers/platform/x86/intel/pmc/tgl.c        |   1 +
 drivers/platform/x86/intel/pmt/class.c      |  43 +++-
 drivers/platform/x86/intel/pmt/class.h      |  30 ++-
 drivers/platform/x86/intel/pmt/crashlog.c   |   2 +-
 drivers/platform/x86/intel/pmt/telemetry.c  | 193 +++++++++++++-
 drivers/platform/x86/intel/pmt/telemetry.h  | 126 ++++++++++
 drivers/platform/x86/intel/vsec.c           | 129 +++++-----
 drivers/platform/x86/intel/vsec.h           |  45 +++-
 include/asm-generic/io.h                    |   6 +
 18 files changed, 946 insertions(+), 204 deletions(-)
 create mode 100644 drivers/platform/x86/intel/pmt/telemetry.h


base-commit: b85ea95d086471afb4ad062012a4d73cd328fa86
-- 
2.34.1


