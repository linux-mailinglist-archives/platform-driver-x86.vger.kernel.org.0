Return-Path: <platform-driver-x86+bounces-3581-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AAD8D266D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 May 2024 22:48:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8A2D9B2A0F5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 May 2024 20:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE90E181BB5;
	Tue, 28 May 2024 20:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sFm/2U5F"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B1317BB3E
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 20:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716929104; cv=none; b=DypESA0wsw0924FcVz9sn6v+9Y3X9Rt5IouP032X0DD6sO6LDI9IT9ADguiOs7KKvZRVsuQmjMbd8jv8qfvxV4F0/OkKmrqWub1yx/YRPV1dQVgEf9jO5z8UNZn6sSTOKPSU+VDtJYzjON1O/ftqYzx3DUVwNJdOLR3D7FNVY6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716929104; c=relaxed/simple;
	bh=ifuOzS2PqA7wFoKS/p9Gsvhq+2ZZSKkp3xeuMiQID70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jkkb4sKud+9lt8fzJPtA+52HiNXSQCwGKLOUUKRT46ZEdTzcm3tU3lEUpD524erFB1v5qsvo8jL9db1mF+ekdNryQcP29kvT0Uzm7AukutEkyVnbyHI5s15lhyRXxiDWEb1amTLNK1iRpRFY1s61iIYGUhaelMUBdI15qTqj/m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sFm/2U5F; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e724bc46bfso14667351fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 13:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716929099; x=1717533899; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7LshFe6lTF9mylP7IPEJMM7yN9J/Sm3hP1XMK5GA+E=;
        b=sFm/2U5F12jnF3bUE1E7A5xksqAxCX5jEa9fGfuARgw3E3MmLwNb9bp9VerwM65qEY
         dk7h9tF7M1nyVGpEyDLwoGfOlzz+aTf5mp0fSL4jx5ROi6tfL4sho0FsJVaJOb001VoS
         S5cV7dsbdlu6ard9zF2f0sndqB2SNu6vzwmfPcz409mImoYgYxZgsLdZSTPFgGhZ0Hjy
         DSORfjHrYwc2aCdPaRM0EEgtNydkA3XK5wQHHzGGXBFJFauje42JdmEKL8CoK6RKRMcS
         yR36HKbnghiMc4ZmMVcAF32betMD1oqeAQM/S3b5yRR25FMdkLj1+wHjmN9W79q8CtTv
         rNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716929099; x=1717533899;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7LshFe6lTF9mylP7IPEJMM7yN9J/Sm3hP1XMK5GA+E=;
        b=T4MTT26tZddfsxmIliIvUuIYpVF9ws4Jq7e+a8ZZqb4SLJhjSauAce75rAQfPDnZDZ
         iDSAgteYzQ6glTaDLdtOAFxOHlO+mt4UivnDECfLRJc3Lf2YrONqvj+O2aBnqgtzqhxL
         WqDY/CknEgZTXMpFx9YHiydYvQqeClcFLQM72HZYtam7u7Deo8F2HyZhugvBr1+3S5Iz
         EoHSOGE4IYJ4+4Q4fgKQdOqaJQvWhp9ic49Ozz90Mk+ddjHeQWvV1OVhBAzUADlRtjtS
         YvuQZNEAQe7/Fbj93ti6Nzs6zrT1cQD+mBaXsQl5RYtapwLofONCF3AyLGiy/iRrS+O+
         0xZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOjEUDftTqIXFGBCiIOFRGjOZ0AUvYCvmUjSva5EOuPool5a/F/iX4+EAVYNWvozlS7c0cKfNe4ZsEvy8z9mTsd1KJ6pBafn/Nf7Lw7tsxVA4DRA==
X-Gm-Message-State: AOJu0Yw6uQzzsy1qM9rOA9W/jHmKmWfqL78mvS0IZTVX1GnOaGhOV10n
	1V67XJxNaFU4EJERZsSAvZmJ7Cs7kUapTszPjcKKR8dDDIwie6cp++IhZKZg47zwrYCbSoYsHyG
	/
X-Google-Smtp-Source: AGHT+IHC1QdKGaF6oqlqsbItVIl9QcVxl/Hpktx4FC6Q4H5mt99aJFOWrkjfQEUEaPECxGFabsnXOA==
X-Received: by 2002:a2e:b8cf:0:b0:2e2:113c:cbab with SMTP id 38308e7fff4ca-2e95b08fc7fmr88039651fa.21.1716929099394;
        Tue, 28 May 2024 13:44:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bdcd21esm22759431fa.100.2024.05.28.13.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 13:44:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 28 May 2024 23:44:51 +0300
Subject: [PATCH v4 6/6] arm64: dts: qcom: c630: Add Embedded Controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-yoga-ec-driver-v4-6-4fa8dfaae7b6@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bA1p0cRkECu7GMqmk/topvubbrncOP6kZTaonC6jN7M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVkJFAXEp9tKkxo7NknQ+tidoQZZPdzp370X0j
 rtHCxOysfeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlZCRQAKCRCLPIo+Aiko
 1c0pB/wOgOBbdwEX24H46JkHY1fliIKjJy4u9Ft75jDUuZaO00i2JLpps6f4vvnxzXgfXofjZD4
 wSdjXbcADHhq2yV9LvJU1/+4trOGe/HDzI6B8e5tUQfFoXWYrla+hU+nnCw9ov5sRZEhOTvGUNj
 3o8wdOMx3yJo6rT2tw9QrRfhyRVT5xvbnNjG6x8r/ooQakK8ID5YNiETUn02aAPVoCdyi++Y9xt
 +mQlsia4H6YaBUZ1/SJC9JKxAUChdx9WD5pMcUCxT7rgqFO66EsjhJPHL9Gy0xvilzaTNgyDBUs
 7GseHlR4WEb1e7sbT50GCRB2/iYKEAZWykFRIE8W0e3QGV5/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Bjorn Andersson <andersson@kernel.org>

The Embedded Controller in the Lenovo Yoga C630 is accessible on &i2c1
and provides battery and adapter status, as well as altmode
notifications for the second USB Type-C port.

Add a definition for the EC.

Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 47dc42f6e936..07bff1c5a7ab 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -370,6 +370,66 @@ zap-shader {
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
+
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-c630-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ec_int_state>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "host";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi0_hs_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi0_ss_in: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ucsi0_sbu: endpoint {
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "host";
+
+			/*
+			 * connected to the onboard USB hub, orientation is
+			 * handled by the controller
+			 */
+		};
+	};
 };
 
 &i2c3 {
@@ -694,6 +754,13 @@ mode_pin_active: mode-pin-state {
 
 		bias-disable;
 	};
+
+	ec_int_state: ec-int-state {
+		pins = "gpio20";
+		function = "gpio";
+
+		bias-disable;
+	};
 };
 
 &uart6 {
@@ -741,6 +808,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi0_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -761,6 +832,10 @@ &usb_1_qmpphy {
 	vdda-pll-supply = <&vdda_usb1_ss_core>;
 };
 
+&usb_1_qmpphy_out {
+	remote-endpoint = <&ucsi0_ss_in>;
+};
+
 &usb_2 {
 	status = "okay";
 };

-- 
2.39.2


