Return-Path: <platform-driver-x86+bounces-48-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C027F7032
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 10:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13CA31C20942
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 09:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7FD16420;
	Fri, 24 Nov 2023 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P357l5yn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD051712;
	Fri, 24 Nov 2023 01:42:08 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6be1bc5aa1cso1663138b3a.3;
        Fri, 24 Nov 2023 01:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700818928; x=1701423728; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q75oNcuLFNnfSIrXcmUAYp+ENVQig3VLLjgl9QtpDcc=;
        b=P357l5ynX0XJHJUlZKh5o/MVWE9WOjVKs5s/3ho91wqg0Tl/Hn9qB4igEOg9aSOOLr
         CArpTXU/vekDsgFJW8tFKqzDMfC6WoZEQwuHisiTPCxRN4XNLowq5/grHQenXxa7kFIK
         Fw9oFH1EFv24Es8Ph1EJXG70d1vvW3hSX/Hgd/inY97cfUaTvowemJSanSQ5Y2fQbNQt
         YoeapW/HeJPTd3Oz4Q+GQuoiAwNPoyrvqw4PKhAz+dpMNSj+wgYc8jIjlvcsSDGS2eNq
         XDXfkYaBqu51JADJmX6TAcvfGHFxtbdjfJ0wdpj+WSFdeo/C66myUN5B11GPLBIVORfS
         Oqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818928; x=1701423728;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q75oNcuLFNnfSIrXcmUAYp+ENVQig3VLLjgl9QtpDcc=;
        b=GAO/VVHCOlcxk9/cYZP76l/+RS2VND8pXybT5egQ5KHtVcK9b4yRT8Lo16pMFqaEiw
         FDNKMBShJPK7RtV0p8EbVMdo3W5/KHEVwvWZt53tasn7tygbjqR3WiiGh2HvdhR23gI8
         IDE81gsps0f5u896Gb2gJYtAiWTfNGaO+NZcuG7JjnW6Plkzpy+w/zDk41fIL4T0vJzT
         yQiGH7xfgGjyzNNBuPlPQoT6dL83NBngw/Lcob2wpeJyIKXYJ7vd9IhdybgtguH1FBMu
         jGiZ1KwiyGL7/HtwrPoYQ7vS9PdtjEUEkzSXhqxlue+zd133tuLdT2R5hDbLGD1J6Cut
         YDvg==
X-Gm-Message-State: AOJu0YzRDt+EM1mcNOoartRdPDEc5JInkIF/nYQln1zHQ37ofLxUrSNF
	R2T+C5T4M5rgfrNNOYzzS98=
X-Google-Smtp-Source: AGHT+IFdtykDtXUU9dHx3YbgxukS+XO86VbM7xhKqbe2vg7vmbkk6XXBjm1H9UgzgQTfOOsgHBIQNQ==
X-Received: by 2002:a05:6a00:3909:b0:6be:130a:22a0 with SMTP id fh9-20020a056a00390900b006be130a22a0mr2194245pfb.14.1700818928237;
        Fri, 24 Nov 2023 01:42:08 -0800 (PST)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7868a000000b006cb8c92a8acsm2489956pfo.113.2023.11.24.01.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:42:07 -0800 (PST)
From: SungHwan Jung <onenowy@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Lee, Chun-Yi" <jlee@suse.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: SungHwan Jung <onenowy@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for Acer Predator PHN16-71
Date: Fri, 24 Nov 2023 18:41:17 +0900
Message-ID: <20231124094122.100707-1-onenowy@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series of patches adds support for Acer Predator PHN16-71 in acer-wmi
including platform profile, (thermal) mode key and fan speed monitoring.

The acer-wmi driver already includes fan control and turbo mode support
for gaming laptops that use predator sense app (version 3), but PHN16-71
operates in different way with new predator sense (version 4).
To distinguish from implementation for previous model, new implementation
for this device is marked with "v4".

Changes in v4:
- add new patch for "ACPI_VIDEO" in Kconfig
- use GENMASK and FIELD_GET to read fan speed
- clean up code

Changes in v3:
- change dependencies in Kconfig

Changes in v2:
- fix typo
- remove redundant "if" statement

SungHwan Jung (3):
  platform/x86: acer-wmi: Add platform profile and mode key support for
    Predator PHN16-71
  platform/x86: acer-wmi: add fan speed monitoring for Predator 
    PHN16-71
  platform/x86: acer-wmi: Fix recursive dependency for acer-wmi

 drivers/platform/x86/Kconfig    |   3 +-
 drivers/platform/x86/acer-wmi.c | 368 +++++++++++++++++++++++++++++++-
 2 files changed, 369 insertions(+), 2 deletions(-)

-- 
2.43.0


