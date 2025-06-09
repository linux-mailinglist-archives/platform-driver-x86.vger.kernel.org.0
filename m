Return-Path: <platform-driver-x86+bounces-12599-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD477AD2727
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Jun 2025 22:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A9EA17A74A8
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Jun 2025 20:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE642206B3;
	Mon,  9 Jun 2025 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Flvd0MCk"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75441F3BB0;
	Mon,  9 Jun 2025 20:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749499526; cv=none; b=BNDRIwTLSuQVvvs8tj0opSmrolfIcWh0RjF2QMOSxkL8AMRp4zUk9AxuA791oEMduM0SFuqCLJ1Kcr3D1EBASLnbtx15tiitA3xwQLn7eIp1xYftHSD36krBFJ3GZLZSsA4oXxJuQYnTcXrzT1YnSIT3Ebbxt/Pwi9EKdEdSqjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749499526; c=relaxed/simple;
	bh=K1VwXTUztkatZ1a//3npskpLt0l90xtkJZUgIPEdnGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sXimMwed0wC/MdRiN7bdoN9CS1lnBxe1GkRp1/FV3Pib2zRIwai9FkEx7F3rTVdT9T/GtDWPQzOC4zenslX3Id6Jzv4I6aaGaWW2D8CFw2mcJLZtlWme/WGvgO/JZz1mrDO3j4+Ldki7AhiyiHR74nUgEfM2kvxd3xCa3PJ7uzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Flvd0MCk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D03BDC4CEEF;
	Mon,  9 Jun 2025 20:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749499526;
	bh=K1VwXTUztkatZ1a//3npskpLt0l90xtkJZUgIPEdnGE=;
	h=From:To:Cc:Subject:Date:From;
	b=Flvd0MCklqqmksqeMaI334ngLSuiw8gJ0v8n+8w6JxbDpnhJfZZqBJI/sm5HLtd5Y
	 MO/LduBuL+mczBidY0sG3TaPExawf/ee00BoLJgH4OCdIBCbxxWRCKQKyn0xS0M8N1
	 kCJSHnwNFUtt7E3EVbbiPyTMBM5PTuYx6xFWFgLtySjrR3b/+kh54NwrBFvYRhI7FG
	 2n9PdRRLr1a/E1cJNmHlsSk2gsnpi9/Dfe1kvujEeXHj8cS8lKKH3c8vi8lbQYMdoL
	 diCffKaQt1aVVWNr7gEm7wCpPznxBgY46SoG5kgpGf50ULvvBuPdoW5nkNnmiG7NIn
	 KVMvFtU5THwjA==
From: Mario Limonciello <superm1@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
	Perry Yuan <perry.yuan@amd.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Huang Rui <ray.huang@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	platform-driver-x86@vger.kernel.org (open list:AMD HETERO CORE HARDWARE FEEDBACK DRIVER),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-pm@vger.kernel.org (open list:AMD PSTATE DRIVER)
Subject: [PATCH v11 00/13] Add support for AMD hardware feedback interface
Date: Mon,  9 Jun 2025 15:05:05 -0500
Message-ID: <20250609200518.3616080-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

The AMD Heterogeneous core design and Hardware Feedback Interface (HFI)
provide behavioral classification of tasks.

Threads are classified during runtime into enumerated classes.
Currently, the driver supports 3 classes (0 through 2). These classes
represent thread performance/power characteristics that may benefit from
special scheduling behaviors. The real-time thread classification is
consumed by the operating system and is intended to be used to inform the scheduler
of where the thread should be placed for optimal performance or energy efficiency.

The thread classification can be used to helps to select CPU from a ranking table
that describes an efficiency and performance ranking for each classification from
two dimensions. This is not currently done in this series, but is intended for future
follow ups after the plumbing is laid down.

The ranking data provided by the ranking table are numbers ranging from 0 to 255,
where a higher performance value indicates higher performance capability and a higher
efficiency value indicates greater efficiency. All the CPU cores are ranked into
different class IDs. Within each class ranking, the cores may have different ranking
values. Therefore, picking from each classification ID will later allow the scheduler
to select the best core while threads are classified into the specified workload class.

This series was originally submitted by Perry Yuan [1] but he is now doing a different
role and he asked me to take over.

Link: https://lore.kernel.org/all/cover.1724748733.git.perry.yuan@amd.com/

v10->v11:
 * rebase on v6.16-rc1
 * Adjust for Randy's and Ingo's feedback

Mario Limonciello (5):
  MAINTAINERS: Add maintainer entry for AMD Hardware Feedback Driver
  cpufreq/amd-pstate: Disable preferred cores on designs with workload
    classification
  platform/x86/amd: hfi: Set ITMT priority from ranking data
  platform/x86/amd: hfi: Add debugfs support
  x86/itmt: Add debugfs file to show core priorities

Perry Yuan (8):
  Documentation: x86: Add AMD Hardware Feedback Interface documentation
  x86/msr-index: define AMD heterogeneous CPU related MSR
  platform/x86: hfi: Introduce AMD Hardware Feedback Interface Driver
  platform/x86: hfi: parse CPU core ranking data from shared memory
  platform/x86: hfi: init per-cpu scores for each class
  platform/x86: hfi: add online and offline callback support
  platform/x86: hfi: add power management callback
  x86/process: Clear hardware feedback history for AMD processors

 Documentation/arch/x86/amd-hfi.rst    | 133 +++++++
 Documentation/arch/x86/index.rst      |   1 +
 MAINTAINERS                           |   9 +
 arch/x86/include/asm/msr-index.h      |   5 +
 arch/x86/kernel/itmt.c                |  23 ++
 arch/x86/kernel/process_64.c          |   4 +
 drivers/cpufreq/amd-pstate.c          |   6 +
 drivers/platform/x86/amd/Kconfig      |   1 +
 drivers/platform/x86/amd/Makefile     |   1 +
 drivers/platform/x86/amd/hfi/Kconfig  |  18 +
 drivers/platform/x86/amd/hfi/Makefile |   7 +
 drivers/platform/x86/amd/hfi/hfi.c    | 551 ++++++++++++++++++++++++++
 12 files changed, 759 insertions(+)
 create mode 100644 Documentation/arch/x86/amd-hfi.rst
 create mode 100644 drivers/platform/x86/amd/hfi/Kconfig
 create mode 100644 drivers/platform/x86/amd/hfi/Makefile
 create mode 100644 drivers/platform/x86/amd/hfi/hfi.c

-- 
2.43.0


