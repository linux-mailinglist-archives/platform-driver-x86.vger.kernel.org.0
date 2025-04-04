Return-Path: <platform-driver-x86+bounces-10795-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA9AA7BABC
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Apr 2025 12:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04E053B76C2
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Apr 2025 10:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093B31B0434;
	Fri,  4 Apr 2025 10:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="i5JCW4J9"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from 4.mo560.mail-out.ovh.net (4.mo560.mail-out.ovh.net [87.98.172.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08659198E63
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Apr 2025 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.98.172.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762487; cv=none; b=siCSK/i+T7YIxBUu0WNEEdcW/utuPjzScYdaMxxA+ebqy6qap7/8Z5QQpwUY1l9Sk4/6dnr9z6XlaE2+JC2Ggk67JVj2SyYD8a7RGW5KZzR6RS1oTg+DWWW5U/LSwSA7HNcOXvCpxICe5Z42X+Z7KF7iU+FtfHl3Lj882KS2oUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762487; c=relaxed/simple;
	bh=H/GY9esDj3gDup9/3P2JDgWdo0W+eF1ptnptFOqgF8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IbJehgkgMha8j/ABUuC1Nk+kuqModGy4SUj1ifZ3tcIO756VxZ3CE2JMvbcMRyDBeGfR/OB691d8stuEdIb0mkLWKGIkBIsmif4JIHyeFfi5g9z40tOZW0vQMIm8iZmnFu2fP/HMM8TQxjCAG+DM56WK7PEP2MJtY5oUjFLf1dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=i5JCW4J9; arc=none smtp.client-ip=87.98.172.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director7.ghost.mail-out.ovh.net (unknown [10.109.176.32])
	by mo560.mail-out.ovh.net (Postfix) with ESMTP id 4ZTZYk0Pqjz1kJD
	for <platform-driver-x86@vger.kernel.org>; Fri,  4 Apr 2025 10:27:54 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-hwnh4 (unknown [10.110.113.80])
	by director7.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B55D51FE98;
	Fri,  4 Apr 2025 10:27:52 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-5b5ff79f4f-hwnh4 with ESMTPSA
	id MTczIii072eAdwAAFqhOfw
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 04 Apr 2025 10:27:52 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S004f829ada3-a2a5-4e9e-a0bf-ce9386a3bc96,
                    1ACEDA468B0737788FFD4D5BBF4CC5986193201C) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:89.64.23.248
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
Subject: [PATCH v6 0/1] platform/x86: Introduce dasharo-acpi platform driver
Date: Fri,  4 Apr 2025 12:27:36 +0200
Message-ID: <20250404102737.81767-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12982188879147634073
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleduudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffogggtgfesthekredtredtjeenucfhrhhomhepofhitghhrghlucfmohhpvggtuceomhhitghhrghlrdhkohhpvggtseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduledtfffgueeugfffieeivdfhfeeutdfhffeigedttdefheektedvgefgueeugfenucfkphepuddvjedrtddrtddruddpkeelrdeigedrvdefrddvgeekpdefjedrheelrddugedvrdduuddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehmihgthhgrlhdrkhhophgvtgesfehmuggvsgdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeeisehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedtmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=vUNVISq3Efy822lLWDbv3H0sXrhCZxLf9ain/izCbPE=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1743762474; v=1;
 b=i5JCW4J9sdqL12+nP9Htf2UYVXKSR8S1bjAgoHHgjXqVlOB+KJU2dFqWcEZQQYeKF9dGZcx1
 AIQblVDG96biaHfSSOAWZ+JSsrM0N5p+8oUkKCxmIxPWb/jiAlXV7Ka8PABmUJLawWZWdCNK2qI
 DlJdEGO4H4KsHhF6Bbs++Ut/kLKBvXH++al/An33OIk/ZlzZCuMa2ejoh5G+TneC9ygj+4Q3zlI
 UtuP4Sy5hgOP2BUygEUK3GlSqthOjlOHdJVaBHxn26c7FAkXIEEdwa2icMV7Nh+4dR7RuQgl2rC
 Co/kS4TtpIJfX01zJfubKsuPDnnrvHl5grj9W1l+rXssw==

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

Michał Kopeć (1):
  platform/x86: Introduce dasharo-acpi platform driver

 MAINTAINERS                         |   6 +
 drivers/platform/x86/Kconfig        |  10 +
 drivers/platform/x86/Makefile       |   3 +
 drivers/platform/x86/dasharo-acpi.c | 357 ++++++++++++++++++++++++++++
 4 files changed, 376 insertions(+)
 create mode 100644 drivers/platform/x86/dasharo-acpi.c

-- 
2.49.0


