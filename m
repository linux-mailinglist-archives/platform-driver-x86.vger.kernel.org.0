Return-Path: <platform-driver-x86+bounces-3580-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 263708D2662
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 May 2024 22:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1C47291BF9
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 May 2024 20:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6F3A181338;
	Tue, 28 May 2024 20:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bz7kVyot"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DDA17B409
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 20:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929103; cv=none; b=I9yQvn1uaor8XkCPkS6I+TX3vn0ADRH4DdSikZQUBvj0nIumH4Kz69zBg7O7hRJeyKyavi8C/4dzVFZkBd5ZvLKUipf+SZeQwjvV5fY/Ab9Z4nKZGM6t4a/nzhAGzK9wepj6Tg7hEJDL/gRivVIPacwZoZwrPG2kca2PPNL06e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929103; c=relaxed/simple;
	bh=9jn734YvtZuEkzjxMWQQ/F5cN34ZH6ms3Y1ko1ls5C4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gk+YBeaOA4PO77nJB/XfWpRtqHEf6Yy2Yeg5p5fpmqXjRKJJPs2ovasJcxkZsngU66v4KvVb6S+WDlYfDjybVCzaQft6KcgsC7zjU89+Ms23Bh/bVLErqB6CDjLgIJ2Hyjp2XJtaWOhkWjbHuPysRif0LL2pzk9PLT6GEGX7l88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bz7kVyot; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso17626101fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929098; x=1717533898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NzKziQ2mUjFv55TZqX8gJhwOKelVZbp6zvs6HKq3MPA=;
        b=Bz7kVyotJ4wu7cjZO4T2GtRHWBc+PndNsabHfoxzRd6dHHUugQBHaLxW4TcjMAljPa
         mMzYAcE2ZJWiNOyJZwKPEiVoqWUUqKRUQXISensLBBdYrceohFOkSMjyhx6fJnfrZxLj
         8EOqwNhAGqhyB7c51EUlpkg+J2hafKiS+0Hn1CI1+CGT+7Xb8PkbqEO1TAjW64wfNX6S
         ACPRgycZCOWzBuoD2RAziENzmA2dk6ZUeBQlpnJHLVLI0totybhkU00mpUrWZBGEUY6v
         DcUx780pjcNl6MDMW3VqdCpmKvHULqJo9hMhEa4mIca0wshvEQWI4mcKFmCd66tjFwEw
         Ij1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929098; x=1717533898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NzKziQ2mUjFv55TZqX8gJhwOKelVZbp6zvs6HKq3MPA=;
        b=wJP/BqewndFQdxeCCRR1FJl3t4EsKmhGJxFF0X+t7mwL1brzQhdtZxfl+DA0pCVHsK
         vsi1RMZ/I6WMV05kPpWKRu3iQt/ux04LyLXOGRweI/6QfW/oLQEhfpojPb/OTma1w4W6
         7ZoyKm8UnikNeHZXSBuUn0bc74fdJLyl9L/VCI2KIlw3Rv8Wzi2mxR/ys8+NZz0qaiY+
         TKPBT4s0Kyj7b1USTrGG8QoxKIOlhFU3wE8f3fgi8EuLO+IbNlkK69TyQY7EmZ5FeJ8i
         iEtXvJYsubgqySeGR5o1H4TMF9fD843qHaRxDpgmdTQWijoBPFS96sD1oTiySfVeitm4
         eHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoDWZR8QJ37mKodCzx1RraX1sLIQ7sGW6MS8TOa+bx+kY0yCYiNl2f6Ctv4eqGDk9cgXUPjbuUjj7hyLyS7ibpIoiM51ZcWk5IvG2ToWiDV+7T5g==
X-Gm-Message-State: AOJu0Yx1DlkD3GqmzDy8IdE5WugfVKtHuhOtcxxGIw23I/b1lUWUlf9R
	GxajgGNtgi0cd3p35Yc4XRQOiHkRD/yUcpAgeKMxWm8T1d+HW95e8hFPbMvM5xg=
X-Google-Smtp-Source: AGHT+IF2O38frlI9pjwjKVlreOCpdkc1gudpGsT7fXTtcln5A063q1o963wUHg1V8MLSCOee1YQIBg==
X-Received: by 2002:a2e:3c09:0:b0:2e9:865e:531c with SMTP id 38308e7fff4ca-2e9865e5a60mr21395721fa.26.1716929098472;
        Tue, 28 May 2024 13:44:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdcd21esm22759431fa.100.2024.05.28.13.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:44:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:44:50 +0300
Subject: [PATCH v4 5/6] arm64: dts: qcom: sdm845: describe connections of
 USB/DP port
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-yoga-ec-driver-v4-5-4fa8dfaae7b6@linaro.org>
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
In-Reply-To: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
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
 Nikita Travkin <nikita@trvn.ru>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9jn734YvtZuEkzjxMWQQ/F5cN34ZH6ms3Y1ko1ls5C4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkJFcnASXQ8B385etFaYrBnafXn1fBmsqc3oT
 r4821H0zkKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZCRQAKCRCLPIo+Aiko
 1QenB/48cAngVc+F7/8Jx4s4LYSp3b3wOKl6IOF4pxmFZETpcPLFED/bp2tPHloteFHwNDeMw50
 4YT23ZMTHem7xda70l8z61JaPPMhk+6D0Ixa6npyLpdFP68HNySS/S4HteruC7QBYMVxU7lDoQi
 j7yVFrOmkrM11ykvQIiNkO7LqruEywAKtkWckYTs37GPoTnBAqM0W1HQc29wyl6/yxdkNGoAbt4
 MryC4Y9ODV5e04qUiPQVcY0kQ6U3UT2Lq+hPjstYbxusFeSuKWr35xflwO4chH22g2lwdKF3WQ1
 9EpDtgckKJDwhKihNuNVt2jBBNjwzNSoIt/pvTumK5R/mjkY
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe links between the first USB3 host and the DisplayPort that is
routed to the same pins.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 53 +++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 26b1638c76f9..5276ab0433b6 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4030,6 +4030,35 @@ usb_1_qmpphy: phy@88e8000 {
 
 			#clock-cells = <1>;
 			#phy-cells = <1>;
+			orientation-switch;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_1_qmpphy_dp_in: endpoint {
+						remote-endpoint = <&dp_out>;
+					};
+				};
+			};
 		};
 
 		usb_2_qmpphy: phy@88eb000 {
@@ -4110,6 +4139,26 @@ usb_1_dwc3: usb@a600000 {
 				snps,dis_enblslpm_quirk;
 				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 				phy-names = "usb2-phy", "usb3-phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						usb_1_dwc3_hs: endpoint {
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						usb_1_dwc3_ss: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
+						};
+					};
+				};
 			};
 		};
 
@@ -4600,7 +4649,9 @@ dp_in: endpoint {
 
 					port@1 {
 						reg = <1>;
-						dp_out: endpoint { };
+						dp_out: endpoint {
+							remote-endpoint = <&usb_1_qmpphy_dp_in>;
+						};
 					};
 				};
 

-- 
2.39.2


