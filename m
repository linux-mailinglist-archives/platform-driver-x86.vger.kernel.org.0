Return-Path: <platform-driver-x86+bounces-3867-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C96AB904FCC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jun 2024 11:59:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30B11B25AC2
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jun 2024 09:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD2916E888;
	Wed, 12 Jun 2024 09:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mpn2SCHB"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151316DECB
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jun 2024 09:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718186379; cv=none; b=oHrOZcnOkHuxRNU/HxLn3vtS2uYzK4oNco44wyF9r3RJirA71t+bZ9rL5/0xyAePJkT/uq+zShQ+9eca0DGKA7kBqmP2OhusVtSWh0LqCkBAk5g8/M6wuLTNImwGyceYoo/LwsSElIBkuw6TlGkuuLhRdS7kmSyXmtDmh9Ham8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718186379; c=relaxed/simple;
	bh=eMuODGP7W4LxxOLv4JBF6KdKVN5A3gRCCuaax4uO73I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=esfX/R7Fn5hS3Kcm2SMLt2Y69IkVkDGVFl8hgg6ZvpRePPlemy/N0M6lou7ZgvIMyJ/wxBb4zaNHtRC0zzzH756Ct7TikSwqK0Ycs+KLooFzQ5S+VnksaLY061455iOECWrViGEPn69D4TAY32YiqgT0OzJhXVvPrr604iilsPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mpn2SCHB; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c4b92c09bso2737494e87.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jun 2024 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718186375; x=1718791175; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xts/ri4+0emIXdmkFUBZxsB2Gm19lNPTdXZ/kDOdF3c=;
        b=Mpn2SCHBu2qZuM7Ors2YnwSE3MlK5K012AuiDNrUPZCERHjcpC2+z/x+W/WW/Gij7N
         s5R6wK+kTw8DIdHdjWgzHo0DKhO8GiXMNOrzb0jMao4bm/sIo3/TTAqOpFKkAkMGuVOR
         8VBuXOb92y1f9OlAYxyiRq+3NatHYUM08//D3P4DWjD3P9sESwZN6gOd6KK6qEapszHt
         blYvDyeIbfOawwa7YwgspgQx5It3zo9vZcEhJghFOU29UaO4UOkJzvzpFPcLSEgyFrq2
         5iSlJ7bl313vwnlPIiUGY2oGqiLvvP2FMfwUO5+2jbxG43nOcrdaH02kVddJq58YD6nz
         lUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718186375; x=1718791175;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xts/ri4+0emIXdmkFUBZxsB2Gm19lNPTdXZ/kDOdF3c=;
        b=kdfa6jn4hUXPim/xxL/11HvoKcXbBR1wbmi5BmGEQKkXFWNQzKh5JSwPoj8TlQmnOA
         sSBDhOkAhLxvFI4t98UjtbVBftgFo585eWBoSJjl5ctqVFBmjqvGrpVP8A1jqDuGNWQO
         a1kTHtYANxF9BJJ5NtZHf4QX+KIp1xOOI4+dEJlpsZW+wA5Fa30gnsizL+j3HTuMZG2w
         faH5fSD6n4eU7l0msFVqC4HUsIj3ytNWuCCjkv2c5ST5dnYQGWW1xb0sZ8k18tyOHirv
         6Fy7s+0zkXEdJ++R4r5v5CpN+uQbM5I3nq8L+jh5tWq0Oxeiks5VH2R6ezkn+OgimYI2
         SJ/A==
X-Forwarded-Encrypted: i=1; AJvYcCW6elzuD0Ti0Ri8Mn8g6IkHiLTy5hR68Dvh93tXjFp+Y5rkLohgevs6QIau4TpeeTPYIeEpPSeIZluxEmdu3xUWzkEdD9y533AZxmkIY606axjAvQ==
X-Gm-Message-State: AOJu0Yw8m3ojU1tPN28SBOHIg8j5aYgzoI8rUO2+fy2za/xvNZCmrAFt
	LDCIcUvDIESOCO2doGT+6GEoIXcB7PgL7CYGWHnnSE+SoWRsGcCbO+BQXvdf+AI=
X-Google-Smtp-Source: AGHT+IHCMWtdj1tPlQQ0Sr0DDMO1hg1ot8AGKkRV4GaB2yRvMXl7ylZpYCJpJPIeeQY4+5t45YW90w==
X-Received: by 2002:ac2:5582:0:b0:52c:9052:db7f with SMTP id 2adb3069b0e04-52c9a40520emr924558e87.56.1718186374895;
        Wed, 12 Jun 2024 02:59:34 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c8907dae9sm1408095e87.129.2024.06.12.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 02:59:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 0/6] power: supply: Lenovo Yoga C630 EC
Date: Wed, 12 Jun 2024 12:59:31 +0300
Message-Id: <20240612-yoga-ec-driver-v6-0-8e76ba060439@linaro.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIRxaWYC/3XOzUrEMBSG4VsZsjYl/0ldeR/i4rRJ2qDTyEkJl
 qH3bjogjhSX3+J5z7mREjCFQp4vN4KhppLy0oZ5upBxhmUKNPm2iWBCMS0s3fIENIzUY6oBqTX
 R26i9h+BIQ58YYvq6B1/f2o6Yr3SdMcBPRjLBNNfCsb4TQkolDeXUX9OKWzcAbmV+z/XlIy2Au
 cs4Hdk5lTXjdn+zyiP+70dVUkalsNA7zT14/Zg6Xqrq0buTV82rCM5HgGAHc/L61xt2vq+b5zD
 2HNigpPjr933/BnF1r7B0AQAA
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4716;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eMuODGP7W4LxxOLv4JBF6KdKVN5A3gRCCuaax4uO73I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmaXGFNd/hzHoo56I1fjpVq1NuqLinKlwZUa/wl
 uU33Ubc6YyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmlxhQAKCRCLPIo+Aiko
 1WNsB/4puhimqcLUNR+1HNqt4pmQ1iKV+joscGjEBnKJaGRAPGnQTTgkVJi6fKLgA3CZ9ax94KI
 Pm5Fn7wrEcRUaauMkHB+va4KHZrJMZSoWycgfgvWzYBLLlYjhEevElD+4soJIKxK3B6QcZcFJHz
 eYKJX876lXUIkTlu2oOyOteSq0Ujn1P1lkBlZI+pQoptZUV5o8qG1TJpizHuSVDXUw1LoaodsjY
 meZbqIAhkznUIaAy1v+25dobPUl0xYzieqNkX4Dy1h1qk06DuJsql04MWGvquOc+Oju/VQ8YQTt
 WmAyEkSSMjmNqHbKFOp2+n3kI3HVU6cO7CpWy5lHaNcX40p5
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

This adds binding, driver and the DT support for the Lenovo Yoga C630
Embedded Controller, to provide battery information.

Support for this EC was implemented by Bjorn, who later could not work
on this driver. I've picked this patchset up and updated it following
the pending review comments.

DisplayPort support is still not a part of this patchset. It uses EC
messages to provide AltMode information rather than implementing
corresponding UCSI commands. However to have a cleaner uAPI story, the
AltMode should be handled via the same Type-C port.

Merge strategy: the driver bits depend on the platform/arm64 patch,
which adds interface for the subdrivers. I'd either ask to get that
patch merged to the immutable branch, which then can be picked up by
power/supply and USB trees or, to make life simpler, ack merging all
driver bits e.g. through USB subsystem (I'm biased here since I plan to
send more cleanups for the UCSI subsystem, which would otherwise result
in cross-subsystem conflicts).

---
Changes in v6:
- Use guard() instead of scoped_guard() (Ilpo)
- Add a define for UCSI version register (Ilpo)
- Added a check to prevent overflowing the address in reg16 read (Ilpo)
- Link to v5: https://lore.kernel.org/r/20240607-yoga-ec-driver-v5-0-1ac91a0b4326@linaro.org

Changes in v5:
- Added missing article in the commit message (Bryan)
- Changed yoga_c630_ec_ucsi_get_version() to explicitly set the register
  instead of just incrementing it (Bryan)
- Dropped spurious debugging pr_info (Bryan)
- Added missing includes all over the place (Ilpo)
- Switched to scoped_guard() where it's suitable (Ilpo)
- Defined register bits (Ilpo, Bryan)
- Whitespace cleanup (Ilpo, Bryan)
- Reworked yoga_c630_ucsi_notify() to use switch-case (Bryan)
- Use ternary operators instead of if()s (Ilpo)
- Switched power supply driver to use fwnode (Sebastian)
- Fixed handling of the adapter's type vs usb_type (Sebastian)
- Added SCOPE property to the battery (Sebastian)
- Link to v4: https://lore.kernel.org/r/20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org

Changes in v4:
- Moved bindings to platform/ to follow example of other Acer Aspire1 EC
  (Nikita Travkin)
- Fixed dt validation for EC interrupt pin (Rob Herring)
- Dropped separate 'scale' property (Oliver Neukum)
- Link to v3: https://lore.kernel.org/r/20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org

Changes in v3:
- Split the driver into core and power supply drivers,
- Added UCSI driver part, handling USB connections,
- Fixed Bjorn's address in DT bindings (Brian Masney)
- Changed power-role for both ports to be "dual" per UCSI
- Link to v2: https://lore.kernel.org/linux-arm-msm/20230205152809.2233436-1-dmitry.baryshkov@linaro.org/

Changes in v2:
- Dropped DP support for now, as the bindings are in process of being
  discussed separately,
- Merged dt patch into the same patchseries,
- Removed the fixed serial number battery property,
- Fixed indentation of dt bindings example,
- Added property: reg and unevaluatedProperties to the connector
  bindings.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20220810035424.2796777-1-bjorn.andersson@linaro.org/

---
Bjorn Andersson (2):
      dt-bindings: platform: Add Lenovo Yoga C630 EC
      arm64: dts: qcom: c630: Add Embedded Controller node

Dmitry Baryshkov (4):
      platform: arm64: add Lenovo Yoga C630 WOS EC driver
      usb: typec: ucsi: add Lenovo Yoga C630 glue driver
      power: supply: lenovo_yoga_c630_battery: add Lenovo C630 driver
      arm64: dts: qcom: sdm845: describe connections of USB/DP port

 .../bindings/platform/lenovo,yoga-c630-ec.yaml     |  83 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  53 ++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  75 ++++
 drivers/platform/arm64/Kconfig                     |  14 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/lenovo-yoga-c630.c          | 290 ++++++++++++
 drivers/power/supply/Kconfig                       |   9 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/lenovo_yoga_c630_battery.c    | 500 +++++++++++++++++++++
 drivers/usb/typec/ucsi/Kconfig                     |   9 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c            | 202 +++++++++
 include/linux/platform_data/lenovo-yoga-c630.h     |  44 ++
 13 files changed, 1281 insertions(+), 1 deletion(-)
---
base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6
change-id: 20240527-yoga-ec-driver-76fd7f5ddae8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


