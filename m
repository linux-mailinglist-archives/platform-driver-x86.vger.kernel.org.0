Return-Path: <platform-driver-x86+bounces-11591-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44475A9F6D4
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Apr 2025 19:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC10C3B914E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 28 Apr 2025 17:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F73E28E607;
	Mon, 28 Apr 2025 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWIqOTNg"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91C28C5BF;
	Mon, 28 Apr 2025 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745859816; cv=none; b=iQiBCIsgC3kX8RzJWkuS1agiTNMXp8KpuUCQJZEN6Q4a5Zalz99/xeQ3PYpvXq4dFq7ZzYxiMmC2nGZKwXakChM5cKFQYy9uR537z+lhuwtlt15/7bHX0qZfckjq3y0e1BMeSXLVIDNwJkEQjJt+GxWVZWioyPmadrsF06QHYv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745859816; c=relaxed/simple;
	bh=1pl9+CGY4PWXX/vYMa14QE2EbutCvqqw26e0pxcEfIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGhEGWvW1BZi7V7yRKaNf8AeFYBkdfU+rc/2aCUjx341M2YHb4rXwMC47nxtaSg3K/WVUyTYgZaUKTSy0ZKbM9Gz6BoiftdDQyT6dPywNPZP++9Xx0Ul7xIp52QA2H/ei9fks7AsLTD7OTfa4jwvtxSTg3uPSxtBI9jWXXK8iec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWIqOTNg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745859814; x=1777395814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1pl9+CGY4PWXX/vYMa14QE2EbutCvqqw26e0pxcEfIc=;
  b=fWIqOTNgm7hq/M6+fbY/+lgkyEzrlxajoXUtN7kBUgQ7K+19Xe2ATNE6
   nLJkuACLOWt9joE1ulitkQUrs8xrGznFlGrfyv7/HQEsMQsWahphIyySX
   9mxlwJK4u26xPxSNKBUXRtsH3iljxYapltAHPsK2aacNG/yTEw8Zkwe5L
   K1A4TzfFUQrmFpGZqYLO1cYJjA3ntNgOvusPRTGQoWQAiZVfhoCfJw9Fp
   ZBGAZb4Dd/L4Fjm2HbpRSxJTOJ02e7J1T70JyiO7wQJ7OkdDjpkyOjQml
   sBUi9hSZj9fCUPTjDz1HBlS+2N3h07tcsoba80n9+LVdHCBx3CmPuOkXE
   A==;
X-CSE-ConnectionGUID: S5EwlksdTWKB8ZeiZaDRKg==
X-CSE-MsgGUID: pQQBrBjrSdCUSzz8eJW3jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="58111440"
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="58111440"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 10:03:26 -0700
X-CSE-ConnectionGUID: j/p9cFrOQpOSu518hUV+0A==
X-CSE-MsgGUID: 7D7+GaeMSsqtmfQ/C/8B5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,246,1739865600"; 
   d="scan'208";a="133309598"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa009.jf.intel.com with ESMTP; 28 Apr 2025 10:03:25 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH v2 2/5] Documentation: admin-guide: pm: Add documentation for agent_types
Date: Mon, 28 Apr 2025 10:03:13 -0700
Message-ID: <20250428170316.231353-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add documentation to describe agent_types attribute.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
v2:
No change

 .../admin-guide/pm/intel_uncore_frequency_scaling.rst        | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index 5151ec312dc0..84608dad84bd 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -97,6 +97,11 @@ Attributes in each directory:
 ``package_id``
 	This attribute is used to get the package id of this instance.
 
+``agent_types``
+	This attribute displays all the hardware agents present within the
+	domain. Each agent has the capability to control one or more hardware
+	subsystems, which include: core, cache, memory, and I/O.
+
 The other attributes are same as presented at package_*_die_* level.
 
 In most of current use cases, the "max_freq_khz" and "min_freq_khz"
-- 
2.48.1


