Return-Path: <platform-driver-x86+bounces-3491-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8408B8CFDAB
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 May 2024 12:04:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03F7CB220CA
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 May 2024 10:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A6813AD0E;
	Mon, 27 May 2024 10:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="INQiLfoX"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D209413AA42
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804234; cv=none; b=PInVOKkoNQ1Kwum0DgJQ/IB0jS9o46CyjFcDEJW6n0UzzUmWjxAi9GbgyXIDTsBZ3dConTypsqhw2pNVfpcM5zhnLQz0rHWOP6Jc9ZgPzrT0iELkVfjXTU/5LoQXfoo7mI7g5EGneHnclYKqGO4iQJ++5NsPkBZGtsAQOTXdkgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804234; c=relaxed/simple;
	bh=GoSjFgsW9XX4FxaGRuMnHzKdzXrzwD3jV+ewrTpDXy4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T1SlZDKdBUy9U8IRe5RrM40v4wJZLPQqoxL7y3eosMF7i2y42ErgHM0ieFWo/Z2YEugBHerIcwK6jKrC/dRoqixyjrpVer6AtxYey62+O66rUAg6pygqzs9l+Y1jG32Zxh1eQQmv8xqbzgj7SpMmYrtT0ydFIS+CiHXhxE6Fy5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=INQiLfoX; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e3efa18e6aso49920581fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716804231; x=1717409031; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CWCAY9nfV/09IvUrExbRVdiOxpHB98rxD+Vvq8u/+7U=;
        b=INQiLfoXxaQ/sMCpvGupAvjvU5FoewH9ZZUnbquXh6DDPQYYJX3+y586bnL6E+q8ka
         DWbvQaSX+/si03p75zVEjkBI9G4Ooh76F6DzHdCTPYbxyqhfymzLZaBWQSYDu8ICVG1R
         OgBPI2FMyq7LZ/jnniKxn1sVeXtmqcoZOr+IkVEN74mSOxdDPYsWpjEWkPntaWgV3FOP
         8rwSkbF8oJJNjZi9PqTlMfyi+5h2sStSl6kIoX/ABPqYHyeBOiRElIVXP7DoMizT18dS
         Y56ofQ0tl+O6FQbWWaRCTyRsqqn2OVOJJy92ajN7rM9OanQ4FO21joaDcTl914E4Qd7p
         msfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716804231; x=1717409031;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CWCAY9nfV/09IvUrExbRVdiOxpHB98rxD+Vvq8u/+7U=;
        b=qD8aqir5TEr3SHKn3L8Tnq/z3/biTP5E42pOSOoY5AcMGwHSWLCmjYxDTG+Oh54m0k
         1S2FfoKAjOKrVMngSTYowOxviDUqNYVW4ekRV5VHSiShasFe8r5d8xT1Jth3dfnJlmqJ
         wg7Gk2QDKOG1q5uOzS6EYrIHhI8pb4TZlGX8oNV4C58UYls4WcelZtf5q0gIYLQFri+N
         JmLUCgqbk365fkwkyn5XH837978cGaiZsyFFJHIWeH0KZr5EV3mU8j5YO0KI1WZeD6LS
         Sqcslyn8+3bXf/ye2r5WIVWpuDDEWdi5WNVblLntZeA798R6zChniSnQ8QPLVYxIMsDz
         Hk7w==
X-Forwarded-Encrypted: i=1; AJvYcCXX0e+cuuzJyAhWmfSk0kKGw2fW9/OyjseeFN0AaYcu4A6XM9q4lwghh397UAEt+AEaT0cGTQtt2bj6E8avaHY26/vdyvJjl06CG/tIiK/JeTcsXw==
X-Gm-Message-State: AOJu0Yy5a+wz0+Vgift11F8iGwVSgI7Cx2aw3UX1BxyJnkORjJmrGDLt
	7ZQVwL2DwGCzi6fyGL2VVfPlhSJNzlGju68XV92Tou9VsyN5bRnbnMGrU50V6x8=
X-Google-Smtp-Source: AGHT+IGJQXRl3GfjDf3dBE4UULEOHF+XIHegN8FJMnDhvaQYCJoS+XwFyHg80n7Nc/+jQJjuok/cPg==
X-Received: by 2002:a05:651c:225:b0:2e9:7f96:3d56 with SMTP id 38308e7fff4ca-2e97f963e0cmr2563301fa.3.1716804231022;
        Mon, 27 May 2024 03:03:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4bdfsm18616651fa.63.2024.05.27.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:03:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/6] power: supply: Lenovo Yoga C630 EC
Date: Mon, 27 May 2024 13:03:45 +0300
Message-Id: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIFaVGYC/zXMQQ6CMBBA0auQrh1SphTQlfcwLiqdwkShZkqIh
 HB3GxOXb/H/rhIJU1KXYldCKyeOc4Y5Faof3TwQsM9WqLHWFlvY4uCAevDCKwm0TfBtsN476lS
 O3kKBP7/h7Z4dJE6wjELuvzEata0sdvpcIhpTmwYq8BMvspUPJ1san3G9vnh2EssogzqOL8J4/
 +ynAAAA
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3322;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GoSjFgsW9XX4FxaGRuMnHzKdzXrzwD3jV+ewrTpDXy4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVFqFvp6V4hHV2nnKC3YNZLzd1Ddlzs+LtsBu7
 UmzJ01oxjiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlRahQAKCRCLPIo+Aiko
 1Sy8CACBSZckQ6oU+Va4j+dnglLrIAn4vFRyp8pFD2wCU1xaSTMq/PskHFza/MHghdFpzrhYQuT
 zfIJKS+xTbM53mmXfxl96xxvkx3nIxyC121PLgj15UX+AHxbGk2ZfhmPDSStKop7m6ltScRsasU
 r0jDPuzNqohlE00ipD9bGEb9Q9QYNnO0QJ91mR1IvqDQHnY7nFH9rhIxxrtTqt2tPyxbJeEBtjx
 tlc+9fk/iqkzNna/kE/j+M5kh7Ugta0+fWQJxWDQBoBwEAzyniBUauvaDjOvkdLYkz8eEKa1Z0E
 BgIKLDQfY3s4K8VrLdV1g1T+l4EVJDDHgsYAT2dxgxy9L0hr
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
      dt-bindings: power: supply: Add Lenovo Yoga C630 EC
      arm64: dts: qcom: c630: Add Embedded Controller node

Dmitry Baryshkov (4):
      platform: arm64: add Lenovo Yoga C630 WOS EC driver
      usb: typec: ucsi: add Lenovo Yoga C630 glue driver
      power: supply: lenovo_yoga_c630_battery: add Lenovo C630 driver
      arm64: dts: qcom: sdm845: describe connections of USB/DP port

 .../bindings/power/supply/lenovo,yoga-c630-ec.yaml |  83 ++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  53 ++-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  76 ++++
 drivers/platform/arm64/Kconfig                     |  14 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/lenovo-yoga-c630.c          | 279 ++++++++++++
 drivers/power/supply/Kconfig                       |   9 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/lenovo_yoga_c630_battery.c    | 476 +++++++++++++++++++++
 drivers/usb/typec/ucsi/Kconfig                     |   9 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c            | 189 ++++++++
 include/linux/platform_data/lenovo-yoga-c630.h     |  42 ++
 13 files changed, 1232 insertions(+), 1 deletion(-)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240527-yoga-ec-driver-76fd7f5ddae8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


