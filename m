Return-Path: <platform-driver-x86+bounces-51-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BAF7F703C
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 10:42:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC4AB1F20F0E
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 09:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E0816432;
	Fri, 24 Nov 2023 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8gOyGZB"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD4310FF;
	Fri, 24 Nov 2023 01:42:30 -0800 (PST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-6c4d06b6ddaso1459103b3a.3;
        Fri, 24 Nov 2023 01:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700818950; x=1701423750; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r+OUSMYnGn8BFclJrDW+f+Az/ps4wVBevgRt7Fipl0c=;
        b=K8gOyGZBAVqzbaBdYLxNdBeyDW7MoyCV2nZZ0VV0mCmFrnYBWya5wKEyAv1P9YfERm
         qKI3SokyIGG0h0mMeFnFChuZuctiUpIP5ilM9fqhzUaPAhx+/AhcEqlblBRJ6bEjoh4C
         Hwf2YtXzOFO9pfZWCWgY/v7srt7DtQemiarfDM+S7vQ5yayp56QL9BkJhczJe2SYq5RQ
         3kYt0966ni1v3g/O/XlpJSLEQLKLd+K11b6C7GvkOYPeYXHi6Mlq9HFP8JuR8GsxcJbk
         B9jASHghxZbWBp470/Kxa4a2FGl6ODX0QT+mo+TL85YLNglVr99P2Z/suSgimtbFT5+z
         mBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700818950; x=1701423750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r+OUSMYnGn8BFclJrDW+f+Az/ps4wVBevgRt7Fipl0c=;
        b=RBJ78V4HMCit6qcVw2pYbLRE7pXiLF37Q+4hXi9I5RGKHqXTy5y5LzEa42O7jdEiUF
         cZGcu6l744lt3kLGgR6VHMwB3DOWNoRhRwUiglY4n1EtrhYtQKC38OTW6ZjEj++l7kL6
         L4VWQ0P0F7knaRDbqKmbdOz6OWLOvtDulXqWmBUARFd2NK2qnElMpL8LknSet40b3G2E
         Om0gkjKqPExSPBJ9nHoxYuxhV1din24DyKHmQBfW+gBiwiHrRW5gSjyjJwi3NyGda5ZL
         7c9RucWdL/ZkHSC3/p7LbSrHC6kaXWeUY29ktORPgvgDynsIpQQWQx37mu8x7Thtw7e4
         +5GA==
X-Gm-Message-State: AOJu0YzSQGBkGaUSKncgbaP9JcSbWKm+KYYZ9PuDpzyvNWNgx9sMuZ4P
	181HudXF7tEY5BiX9ZJ0GTc=
X-Google-Smtp-Source: AGHT+IHYbnI/VrcLybC+yPmw6DXE3hdkVvoRwFiWhEIlEgeeXPNKdvYABF8IOH6TMjRzuk+gO2p4zQ==
X-Received: by 2002:a05:6a00:88f:b0:6b3:f29c:dde1 with SMTP id q15-20020a056a00088f00b006b3f29cdde1mr2075925pfj.21.1700818950126;
        Fri, 24 Nov 2023 01:42:30 -0800 (PST)
Received: from localhost.localdomain ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id d10-20020aa7868a000000b006cb8c92a8acsm2489956pfo.113.2023.11.24.01.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:42:29 -0800 (PST)
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
Subject: [PATCH v4 3/3] platform/x86: acer-wmi: Fix recursive dependency for acer-wmi
Date: Fri, 24 Nov 2023 18:41:20 +0900
Message-ID: <20231124094122.100707-4-onenowy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231124094122.100707-1-onenowy@gmail.com>
References: <20231124094122.100707-1-onenowy@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"select ACPI_VIDEO" cause recursive dependency when "depends on HWMON"
is added.

---build log
drivers/hwmon/Kconfig:6:error: recursive dependency detected!
drivers/hwmon/Kconfig:6: symbol HWMON is selected by EEEPC_LAPTOP
drivers/platform/x86/Kconfig:326: symbol EEEPC_LAPTOP depends on ACPI_VIDEO
drivers/acpi/Kconfig:208: symbol ACPI_VIDEO is selected by ACER_WMI
drivers/platform/x86/Kconfig:173: symbol ACER_WMI depends on HWMON
---

It is not recommended to use "select" for visible symbol, "select" has changed
to "depends on".

This patch depends on "platform/x86: acer-wmi: add fan speed monitoring
for Predator PHN16-71"

Signed-off-by: SungHwan Jung <onenowy@gmail.com>
---
 drivers/platform/x86/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index caf3f4c6b..33ddb644e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -178,7 +178,7 @@ config ACER_WMI
 	depends on RFKILL || RFKILL = n
 	depends on ACPI_WMI
 	depends on HWMON
-	select ACPI_VIDEO
+	depends on ACPI_VIDEO
 	select INPUT_SPARSEKMAP
 	select LEDS_CLASS
 	select NEW_LEDS
-- 
2.43.0


