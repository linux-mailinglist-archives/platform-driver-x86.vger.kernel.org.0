Return-Path: <platform-driver-x86+bounces-4096-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD399176C3
	for <lists+platform-driver-x86@lfdr.de>; Wed, 26 Jun 2024 05:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E73951C213C1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 26 Jun 2024 03:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF66D67A0D;
	Wed, 26 Jun 2024 03:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aq5WqAcd"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A36361FE8
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jun 2024 03:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719372391; cv=none; b=ITy8yqA60gY8VTzVOAH9nLX4Cti2wqWbsU4q3T1p7SfbqtUIUJSkls/MvNmdQyAF2GcH18sYE47dR6HBu/QKyOrKPScbwbT3y2s+z1cjvsC02GvVt3t8XNHw6vbx2QJNqxL9fIfcPzxLV0ecSdYju4h3ZeZweUH+u91O3DgvWOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719372391; c=relaxed/simple;
	bh=63egUJJNOzc7ULqxlyzXKuMsOAc/Yy9oVuqv19NoQ6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mRbS4OhjVKSLpl3KWoeH+MlK12aG6C1X2wY66pzYXwoxL8KaRDyaIJ75Gv+8WUwpWUTY4ZApiZ8aEJ7qMwNc7KcD4TrwbpfzuANAEeefWGnQkobfNpIAuGTeILXSPcJOkMPt+rPS4in0qeAiNJcl5zJdBgJghAf5ponUwexSBrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aq5WqAcd; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ce655ff5bso2660840e87.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Jun 2024 20:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719372388; x=1719977188; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RyN0rZQwEcI5e6F6tYsAlaLHqq1tMMcihqh2iO9zsDs=;
        b=Aq5WqAcdxE+mq5Ba1xfHDjolVuAW7Qi8LGUF1APBMYd6iw/jVsjMyXQ9ysHn95PoXu
         QmbqZvaagTFSLLkq5Q9lPSbBHizGP8CWFGccgkzT1qZ9m6Z/gfQHriUbkBqat3tYSYTa
         jUbGvORfy5Gk+FZ/llS1FWAkkCbWf5a39Ef6OzIwTz4Yll1QVOYBppPvrowcMeFFT4yb
         dUqnulBcsLKErSoZn6iYH+E19QyoPZttFa+PQ/B+3WxHh1t2nfOChBt1IrIGxPXZd4xQ
         ROZOIKKuT41/rZfxKAVjhBpjIsYD7cZVpf+IlrKu99EbOid6FR9ECuk7BwFISZN/XshW
         MNrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719372388; x=1719977188;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RyN0rZQwEcI5e6F6tYsAlaLHqq1tMMcihqh2iO9zsDs=;
        b=mVHWpnfvRvjEHPT37vH1Rj+orEuhc3K+OejFJgoI5bM1EjV3ni3umiZdJgYk0nQAqI
         n6MH67Qg+93YQJzOAkITYCr6TemXgi8WeybnACJVOWU9EDHaM39HiSCmmjwJlpcNKH+m
         c/zsKDYm56mLBifrWfp8b0bxDNFyP/xk4bJI2tlRnRWUtQdEId9PzPDji4xnBznFcpMG
         z28FauKJwD/+z2ia1i2QzAzM2Weh/qpIwzGKbiY416eklfj7yipaOJIjdseEXd5Rc1Qp
         rkBY0GIrGLhEZVulrf/GJfTwrMKyxRAeWrmI1hAiCNt4BbfAr+Gs++QYfEasi8i3/9Ai
         7Dug==
X-Gm-Message-State: AOJu0Yzx+YqiBE1QvCZJQDZ4iBx4FJ9SFHCTc7A+YRpKX4EKwMqF10Ee
	oYv6X6CgmysW9Lp6NJMeARukI0OgvO7besOukN44FRHpst2S+sdvkd8dMnzfKbB196fjCTnzWm+
	jnRA=
X-Google-Smtp-Source: AGHT+IFeKU9VOswRuPtvhmxTIl0T82P/NFnpvo6QyBNYyIaqAs8SgYtqqGJf28Wd3K7qnLeDS4YjBQ==
X-Received: by 2002:a05:6512:398f:b0:52e:6d71:e8f0 with SMTP id 2adb3069b0e04-52e6d71e974mr3183e87.8.1719372387987;
        Tue, 25 Jun 2024 20:26:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b4790sm1396626e87.30.2024.06.25.20.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 20:26:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 26 Jun 2024 06:26:26 +0300
Subject: [PATCH] platform: arm64: lenovo-yoga-c630: select AUXILIARY_BUS
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-yoga-fix-aux-v1-1-6aaf9099b18e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGGKe2YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDMyMz3cr89ETdtMwK3cTSCl1zCxOLlBRzU0PTJBMloJaColSgFNi46Nj
 aWgAHzkLsXgAAAA==
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1056;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=63egUJJNOzc7ULqxlyzXKuMsOAc/Yy9oVuqv19NoQ6c=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBme4piepMvH2YWMUsX2OVcFOLmCG+js79Pv7rGB
 3m0AhXC8cWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnuKYgAKCRCLPIo+Aiko
 1REiB/9iRUfzIzqgz7xYxNrtI0TQTkUPKn5rlZjr5sVlaXbu1xaSadQzpcA+YbsUROd9Cb2spE0
 ZXz43+J9hrksOaIH+DcciIxBrqihG+ukB/e2jw8EvKCy7VetDstbL62kcVz7RRp2gIls2kCKRob
 CnQWrE4NYUwkE4YT80EcZBkajbOIDTfNYYVbH1NDSdIkea0PJYZnpEi+E+8RTVZ/4n9AnOonwIS
 hFwlOTLpyMPkN65/yu2VIMb76CNo2Ah4lfOY8/wQXgCuwiiDAtZ6xLJy0SmVd5LNKUK48k+/Wez
 MvecntEac3RcyW6QSuvd28j+zdPxpG9riVB6PEWrgnapSGcU
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add missing selection of AUXILIARY_BUS as the driver uses aux bus to
create subdevices.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406260704.roVRkyPi-lkp@intel.com/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/platform/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index 8c103b3150d1..e612cbe06aec 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -35,6 +35,7 @@ config EC_ACER_ASPIRE1
 config EC_LENOVO_YOGA_C630
 	tristate "Lenovo Yoga C630 Embedded Controller driver"
 	depends on I2C
+	select AUXILIARY_BUS
 	help
 	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
 	  Lenovo Yoga C630, which provides battery and power adapter

---
base-commit: 62c97045b8f720c2eac807a5f38e26c9ed512371
change-id: 20240626-yoga-fix-aux-7848dd7515b4

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


