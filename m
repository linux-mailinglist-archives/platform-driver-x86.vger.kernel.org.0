Return-Path: <platform-driver-x86+bounces-13181-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 225BDAF6806
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Jul 2025 04:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C11291C4501A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Jul 2025 02:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37E8233712;
	Thu,  3 Jul 2025 02:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7xiuCjS"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FA822D4DE;
	Thu,  3 Jul 2025 02:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751509728; cv=none; b=f4eBzQhCwQF7M/ijiK+kPg4lKKb1wSjod4N1mlxOQNUZrCIICvcv7s69avodGoL2vVsB5FyyUcOW4TFD0UdJ3UdWJF/JN9R8/WpZZc0vEPtW2/2u0IYgUvKXVF13C1kJHI6wxihAolKFwfedZffFJnnsmv57qYmMIXT2lyOYBFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751509728; c=relaxed/simple;
	bh=IO/vpjknUxjAwaCNhZlu2YchyJQ4InyZudaub27fcsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m0yqbm7GqTdPuFmEFkAObP3FZ7YUMWdudBOm7+q+QA5o30xzLOGy+yoiC77FWStuLifLCu6J9uaVQjJ3dIUFMpknlkemrQW7+lVKoW0LV6LVnFn45EfMyBC1KCuBPo0rxIVdlMtp8rCVOC9v5dn6kJxv7wXMpxYzEashC7cPjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7xiuCjS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751509727; x=1783045727;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IO/vpjknUxjAwaCNhZlu2YchyJQ4InyZudaub27fcsI=;
  b=g7xiuCjSYwu3V7T2G7nOAvJ9SRDV/XDZuXvi/hCWMBnnffu6BD0w/B7X
   79JbI98hkDQUYHzX/3f8n/OFN/zGZj7EQEw1o/sFOh8rbueKjAz2YcWHl
   NvbSkrpFbcxaMg605Jk2cjhayJwy24D1qoy7CGfMptf9trbbzbLiVuoBJ
   rn1tURmYhxvW/QbOWeOdOJLdwgymw5rlAEVF37YZcabZYp2SgpfMbpRtA
   kyEFr0lM+vgcSoh2rMiuV71fmSc+6ZW738njnHwHdYCxNqcZ2Sz+eRwV+
   OcbhibE3ebwyLdqO/t8UabC74Fmt44OwT1L73365YAK1jO9fjzYTkfhnD
   g==;
X-CSE-ConnectionGUID: oe4L5KRKTeSNGu3aGRjJrg==
X-CSE-MsgGUID: sZ39U6icTM22pAts0jbxPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="41450247"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="41450247"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:43 -0700
X-CSE-ConnectionGUID: twdL4oSpSNO+1r+2hGD9sw==
X-CSE-MsgGUID: fHaFE8+MRO2CkjCHRmeKMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="154594059"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.124.223.28])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 19:28:42 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH V3 09/15] docs: Add ABI documentation for intel_pmt feature directories
Date: Wed,  2 Jul 2025 19:28:24 -0700
Message-ID: <20250703022832.1302928-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703022832.1302928-1-david.e.box@linux.intel.com>
References: <20250703022832.1302928-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add a new sysfs ABI documentation file describing the layout and content of
the features-<PCI BDF>/ directory used by Intel PMT (Platform Monitoring
Technology). This directory exposes telemetry and control feature details
for a given PMT PCI device.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---

Changes in v3:
  - No changes

Changes in v2:
  - Spell out RMID and add description of the feature.
  - Add a description of the watcher API
  - Update example to use snake case for pmt_sp_policy

 .../testing/sysfs-class-intel_pmt-features    | 134 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt-features

diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt-features b/Doc=
umentation/ABI/testing/sysfs-class-intel_pmt-features
new file mode 100644
index 000000000000..cddb30e5bdf6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
@@ -0,0 +1,134 @@
+What:          /sys/class/intel_pmt/features-<PCI BDF>/
+Date:          2025-04-24
+KernelVersion: 6.16
+Contact:       david.e.box@linux.intel.com
+Description:
+               The `features-<PCI BDF>/` directory represents the "feature=
s"
+               capability exposed by Intel PMT (Platform Monitoring Techno=
logy)
+               for the given PCI device.
+
+               Each directory corresponds to a PMT feature and contains
+               attributes describing the available telemetry, monitoring, =
or
+               control functionalities.
+
+Directory Structure:
+
+  /sys/class/intel_pmt/features-<PCI BDF>/
+  =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry/		# Per-accelerator te=
lemetry data
+  =E2=94=9C=E2=94=80=E2=94=80 crash_log/			# Contains system crash telemet=
ry logs
+  =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry/	# Environmen=
tal telemetry per core
+  =E2=94=9C=E2=94=80=E2=94=80 per_core_performance_telemetry/	# Performanc=
e telemetry per core
+  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry/	# Energy telemetr=
y for RMIDs
+  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_perf_telemetry/		# Performance tele=
metry for RMIDs
+  =E2=94=9C=E2=94=80=E2=94=80 tpmi_control/			# TPMI-related controls and =
telemetry
+  =E2=94=9C=E2=94=80=E2=94=80 tracing/				# PMT tracing features
+  =E2=94=94=E2=94=80=E2=94=80 uncore_telemetry/			# Uncore telemetry data
+
+Common Files (Present in all feature directories):
+
+  caps
+    - Read-only
+    - Lists available capabilities for this feature.
+
+  guids
+    - Read-only
+    - Lists GUIDs associated with this feature.
+
+Additional Attributes (Conditional Presence):
+
+  max_command_size
+    - Read-only
+    - Present if the feature supports out-of-band MCTP access.
+    - Maximum supported MCTP command size for out-of-band PMT access (byte=
s).
+
+  max_stream_size
+    - Read-only
+    - Present if the feature supports out-of-band MCTP access.
+    - Maximum supported MCTP stream size (bytes).
+
+  min_watcher_period_ms
+    - Read-only
+    - Present if the feature supports the watcher API.
+      The watcher API provides a writable control interface that allows us=
er
+      configuration of monitoring behavior, such as setting the sampling or
+      reporting interval.
+    - Minimum supported time period for the watcher interface (millisecond=
s).
+
+  num_rmids
+    - Read-only
+    - Present if the feature supports RMID (Resource Monitoring ID) teleme=
try.
+      RMIDs are identifiers used by hardware to track and report resource =
usage,
+      such as memory bandwidth or energy consumption, on a per-logical-ent=
ity
+      basis (e.g., per core, thread, or process group).
+    - Maximum number of RMIDs tracked simultaneously.
+
+Example:
+For a device with PCI BDF `0000:00:03.1`, the directory tree could look li=
ke:
+
+  /sys/class/intel_pmt/features-0000:00:03.1/
+  =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+  =E2=94=9C=E2=94=80=E2=94=80 crash_log/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 num_rmids
+  =E2=94=9C=E2=94=80=E2=94=80 tpmi_control/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=9C=E2=94=80=E2=94=80 tracing/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=9C=E2=94=80=E2=94=80 uncore_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+
+Notes:
+  - Some attributes are only present if the corresponding feature supports
+    the capability (e.g., `max_command_size` for MCTP-capable features).
+  - Features supporting RMIDs include `num_rmids`.
+  - Features supporting the watcher API include `min_watcher_period_ms`.
+  - The `caps` file provides additional information about the functionality
+    of the feature.
+
+Example 'caps' content for the 'tracing' feature:
+
+  /sys/class/intel_pmt/features-0000:00:03.1/
+  =E2=94=9C=E2=94=80=E2=94=80 tracing/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+
+	telemetry                                Available: No
+	watcher                                  Available: Yes
+	crashlog                                 Available: No
+	streaming                                Available: No
+	threashold                               Available: No
+	window                                   Available: No
+	config                                   Available: Yes
+	tracing                                  Available: No
+	inband                                   Available: Yes
+	oob                                      Available: Yes
+	secure_chan                              Available: No
+	pmt_sp                                   Available: Yes
+	pmt_sp_policy                            Available: Yes
+	mailbox                                  Available: Yes
+	bios_lock                                Available: Yes
diff --git a/MAINTAINERS b/MAINTAINERS
index b0a67f058393..dcf081547ce7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12389,6 +12389,7 @@ INTEL PMT DRIVERS
 M:	David E. Box <david.e.box@linux.intel.com>
 S:	Supported
 F:	Documentation/ABI/testing/sysfs-class-intel_pmt
+F:	Documentation/ABI/testing/sysfs-class-intel_pmt-features
 F:	drivers/platform/x86/intel/pmt/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
--=20
2.43.0


