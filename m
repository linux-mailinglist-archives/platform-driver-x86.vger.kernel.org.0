Return-Path: <platform-driver-x86+bounces-3880-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D051A907FBF
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Jun 2024 01:44:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63DA028476E
	for <lists+platform-driver-x86@lfdr.de>; Thu, 13 Jun 2024 23:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52709156F43;
	Thu, 13 Jun 2024 23:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kJOboF/J"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD64156668
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jun 2024 23:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322231; cv=none; b=o5yF3WOVU0ZYwjwDfOv7QTqc6JjGCx19hhTB5FNPmhgmM+TRbsOMhiRliczropYzDRKN5hHjmOFDrD6k1Ujoz4uwkRI0a64SfV/qPmuKFBglCa482oZ/74c3316x97PW7v7K8pB0B+JnQQaQ2b/dNPeCOM7yPsJfJUt44D8zx+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322231; c=relaxed/simple;
	bh=D7uOWa4uDmtjSwf30b3ABIP8kdvr21SmZRUP7Dp4FOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CVBS7HO0L6VWU+9h/zuMGMbKYfprEo7VeJ6qKMY9wHsh+ywGVEIiEHMyjZF+xzf8ZBGMig9pcNmXWtIcFiqyJ21+1i1r6jhU5xnG7lHwag35MeOUc0KbBAKDLIHdSvxs/nAW43hN60b6b9L7dJVerw8w8wJFjtOEHCY6SrhVFZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kJOboF/J; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c8c0d73d3so1830605e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jun 2024 16:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718322227; x=1718927027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pbxciSj28k5Q0p0UZvIK+bmv47cyvDnbr4Z/LAPTdSA=;
        b=kJOboF/Jo1KXv3Er0UN3tKAxAzSlGF3JcCyu8nGQ7jkNflpM5W4qA/ZefzLOOXF6A/
         M9ujqNfAexHQw2YacTP6WHSfYCbmQ4jXIQUBrPseifDXRYqD43ZijafeGrRXrtjz9V6S
         J8UewYyV8D0zr0vrEOgfLnth+YGHT2rirqRpd+xWIWCVj/BFqsbc+WsicCSHZzDb7E9J
         kalrztMxTK3TKYyWnIx53XyEOLUwDfoxFD5TVB1okHVfrVf2ZilUOqnnalLfY5ECTsec
         IDJrt+pEc2hFtNyFq+mT+l6GoNt6DGZqiSNfXmtk7JW/M8Lcxkt4FMRYcVRu34thEEyR
         3NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322227; x=1718927027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbxciSj28k5Q0p0UZvIK+bmv47cyvDnbr4Z/LAPTdSA=;
        b=CI42h5uqHvZIg0Ftu4PScQsvKjvzG2fKznyNHPY0F7w0ERM6T2ghNaL8ZO/bkOXxiV
         q7Fy5jPJcbI2QFtORmhgQvyJq4W1dxoonkxVjybsOalE1gTpi1Xn8LQyek97PeigATI8
         2yIlEEiXEFQt8/zePmK48K44RW05BBjQi38CpBoaH3pQhMFMHg+AaQSqalb4i9+fUiH9
         tMGVevhr2ISp8JFuSqPpCDHkNVbVf6S0EaeMyVDdK98qKIGMffdEooUhv2/05Qu3gpBE
         HbWAJQkjr8Y6JwDcRpu3JerOO7x0h1+M8LmxpKE/hsIzvQiJbEvJkKY6ylgR98/c50i/
         AhtA==
X-Forwarded-Encrypted: i=1; AJvYcCUKSPyxPhuOGAbN1odWc7Eo/Ogqlbc6clJjt6zKmkIWkRk59ACwmItlwg60c1SfqdGicP41trLoeQcwbeTWsmOBqhenASkt5dWtS/jbWN5AKQa7ow==
X-Gm-Message-State: AOJu0Yymd+yHUi8g9pZAgj5Oz8fLRvSRWUAMTha8S37X//qjqJCQ7AQC
	INI7CtRAxpf8ZWw3WjC+pMkqqn7PrI8cQtaColMy5Xd1oiyqKfOSyshi7jSKbQg=
X-Google-Smtp-Source: AGHT+IEIvNP1AYCIS3YAoDedOb3SQu8BUCF1ppKDd3ggdAevE1PhE/1Jyzv/nWCVFMVpDfdQp+jwmg==
X-Received: by 2002:ac2:4181:0:b0:52c:a5e6:989e with SMTP id 2adb3069b0e04-52ca6e656d3mr687391e87.16.1718322227081;
        Thu, 13 Jun 2024 16:43:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872260sm359298e87.142.2024.06.13.16.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:43:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 02:43:42 +0300
Subject: [PATCH v7 5/6] arm64: dts: qcom: sdm845: describe connections of
 USB/DP port
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-yoga-ec-driver-v7-5-9f0b9b40ae76@linaro.org>
References: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
In-Reply-To: <20240614-yoga-ec-driver-v7-0-9f0b9b40ae76@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1967;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=D7uOWa4uDmtjSwf30b3ABIP8kdvr21SmZRUP7Dp4FOI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma4QtS9c23oobH3Osgxei4nKXPlzRTfxpgr/6J
 tMnrLZQaN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmuELQAKCRCLPIo+Aiko
 1VqAB/9Ik8/AMjHqe/zQVWgzuirjGUc0+cBF3whGem3NRMVi35ITi86KWpd88RusMQnJ1Hojfte
 FmTGtS9XoUHKMKDtw4RQ96Mljo6sAwC4ZQszaJZYDjgOeukavcowrk3b1MxEwf9Mw1b9GGiUif1
 UeTm3SN/pVhfWlT+LIDlwIioNNHxcuibG9w/A/iI7mURPmOE1a8c6A5hSja/neOvOwRgCL4yRtA
 IhgAflXUOxx6qxnaw9rakKGU+Gf6Nb8Yxcw4akvPrvQF4eDqOSKB0w18Sn3sYdv/GOp4e+fOXyZ
 rq3NUim55Q/Qw8YID1amX5DhjXo9qiPeiil4OzCmaDR/kZcd
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe links between the first USB3 host and the DisplayPort that is
routed to the same pins.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 53 +++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index a0125f3d92b2..23b101bb3842 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4031,6 +4031,35 @@ usb_1_qmpphy: phy@88e8000 {
 
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
@@ -4111,6 +4140,26 @@ usb_1_dwc3: usb@a600000 {
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
 
@@ -4601,7 +4650,9 @@ dp_in: endpoint {
 
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


