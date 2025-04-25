Return-Path: <platform-driver-x86+bounces-11489-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C63A9C764
	for <lists+platform-driver-x86@lfdr.de>; Fri, 25 Apr 2025 13:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F3B81BC6546
	for <lists+platform-driver-x86@lfdr.de>; Fri, 25 Apr 2025 11:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F31A23E32D;
	Fri, 25 Apr 2025 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="T8Iaa2PJ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from 16.mo561.mail-out.ovh.net (16.mo561.mail-out.ovh.net [188.165.56.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C52241668
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 11:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.56.217
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745580143; cv=none; b=FWQ8yL8xKICG0K80H8AIW0MWXPEFW7vkmzG8DU0ruqAyRtfRxBWEeQpV+NjWsrUk2RD+kTqJ/qzc1eexUjJITIqVmk0tkWIwJ0YorQt/BJNvRzkXHk0gNd5V+V1tM594wbu9hg7bejEp66QWeMS2eOBj8cZysIUn9UJp+Jty3NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745580143; c=relaxed/simple;
	bh=1tBiExbO/dqP9Y43zSGXcf1iO42e1kbQ/zg5CeWF7Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XlymaDF6OgV+XutPut4RnndGRuDokviwF+aRidsRu9bQnbqlFParuQQ0nuoQ/OzLgBlIofUMOw/1g7+MzTfNa6HElpLBKjt7grlzpSvfF8C37LJG51zdzw4H5ScDESdLHrBt5zVP2H5tvrWUBZFUS1PvneivXpdFG2+UuukKLZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=T8Iaa2PJ; arc=none smtp.client-ip=188.165.56.217
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.140.35])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZkVmc5GLNz1WBq
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Apr 2025 11:22:08 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-tf4sx (unknown [10.110.164.115])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4E8B91FE7E;
	Fri, 25 Apr 2025 11:22:07 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-tf4sx with ESMTPSA
	id Aq1wBF9wC2jbfgAAIqE1SQ
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 25 Apr 2025 11:22:07 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R00148a07b6e-124c-464c-bd2d-5114462cf9c1,
                    189BF360F9312264DCAC3AB77C65C4FB1C0F3093) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	tomasz.pakula.oficjalny@gmail.com,
	jdelvare@suse.com,
	linux@roeck-us.net
Cc: platform-driver-x86@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	michal.kopec@3mdeb.com,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v8 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri, 25 Apr 2025 13:21:46 +0200
Message-ID: <20250425112147.69308-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8097472130927955353
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvhedvvdduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpvddufedrudelvddrjeejrddvgeelpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepmhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeiudgmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=EIesLx6eJsuvXKzvGp2e9K8hauzF2VkB0WHxEx/C4CA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1745580128; v=1;
 b=T8Iaa2PJg5vZkoFdio7iW0nt+gPmX9YKSCgpDTJ2L/B0Z4wHUtHXWF4YzgCBlSikRbbLstju
 TcSKN6Wwm+HApzYzqjNF1LhsEO1GNvqRoY92bSt7KeLI0K0q0SsAVTt2LQmMadmp+LKltxIcnPo
 mHLWVWMmEql3UF7FJEJv1ZofptzVMocGsnM9INYA7xopDsWSYNCTbNirMN84SsKVZnV1L35kf1e
 TftEiBPCvOWsO0nTEiTADxW1hSsIf7Hacv15P28EL7WD6BoL4UBMnjkfhURzmIzDI6NsgJPYsE0
 pyU7MWIl3UiG5PPu1EHonBO+L7LsOoriwkomOt/3ImkWQ==

Introduce a driver for devices running Dasharo firmware. The driver
supports thermal monitoring using a new ACPI interface in Dasharo. The
initial version supports monitoring fan speeds, fan PWM duty cycles and
system temperatures as well as determining which specific interfaces are
implemented by firmware.

It has been tested on a NovaCustom laptop running pre-release Dasharo
firmware, which implements fan and thermal monitoring for the CPU and
the discrete GPU, if present.

Changes in v2:
- Remove redundant copyright information
- Turn dasharo_fill_* functions into single dasharo_fill_feature_caps
  function
- Code style fixes
- Turn large if / else blocks into switch / case
- Fix possible positive return values in hwmon read handler
- Change while loops to for loops
- Add local variable for data->sensors[data->sensors_count] in
  dasharo_fill_feature_caps
- Replace snprintf with scnprintf per Ilpo's review
- Keep the "ok" path silent

Changes in V3:
- Simplify dasharo_read_value_by_cap_idx arguments and rename to
  dasharo_read_channel

Changes in V4:
- Remove unnecessary linebreaks
- Simplify naming of variables
- Constify zone lookup table
- Remove unneeded includes
- Switch to platform_device API
- Remove unneeded driver remove handler
- Add myself to MAINTAINERS

Changes in V5:
- Fix up the MAINTAINERS entry
- Use PTR_ERR_OR_ZERO for the hwmon pointer in the register func
- Simplify if blocks in dasharo_hwmon_read
- Use ACPI_FAILURE instead of !ACPI_SUCCESS

Changes in V6:
- Validate input parameters in dasharo_read_channel
- Add default return code in dasharo_hwmon_read
- Return error if invalid channel is requested in hwmon_read_string
- Add missing include for ARRAY_SIZE
- Align line continuations in dasharo_probe

Changes in V7:
- Use cap count for bound checking in dasharo_read_channel

Changes in V8:
- Fix line breaks over 100 chars
- Remove unneeded empty line

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 360 ++++++++++++++++++++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0


