Return-Path: <platform-driver-x86+bounces-3882-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251D907FCE
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Jun 2024 01:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D14285D2C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 13 Jun 2024 23:45:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A236E157A7D;
	Thu, 13 Jun 2024 23:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dp46Bn0G"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8476156C49
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jun 2024 23:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322232; cv=none; b=kV2m1nYRZRPo5KxkLQB9yeXWqkno8vID6EgGo61fTfXZavrwMAhXYrOh14lLD0Dt5rBVjmzQPtIHaSlFNCqYBvK44ZfjgZsUzCvY6cokni6feDYVWLX810yiiuggN+oogSy554jrz2Sp9j7yyfFr7nvirA7i92H9kRvo/ogs/rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322232; c=relaxed/simple;
	bh=ohK2sslGjClxr9kCmY/gW62DMEkgvC5Tz6xsCMKB8Kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMgHRVbr4xsDw+9wh3/wRIhFMzshivIJ6q4aOAjh8auLA5RMWlPUGlPv5Z1BLylNRQ+Mj/+FnaJZhrmXI/KpFdUMmE3peZyAr4MO/hgEuzj2cUOhr63ZYrMi0n5oOc2lISCMFF1O7KBSSZJfGNY/ZpHZRdzCs2KDu89shRPNypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dp46Bn0G; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52bbf73f334so1854879e87.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Jun 2024 16:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718322228; x=1718927028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o+nA/cIlT4hl2if/i6DmrZViDpHELl0xAbf5HX+dSsg=;
        b=dp46Bn0GgSBfaWpeBKeewld29XmOtyYVJjL/olH1FKcKt1zZ+GrCHw4YhcsgIoqUao
         A2cGDav457pA7O4DCrkSy7JD4Aa+DXcnIvi9+VAPk4gCmiwhGwrwwCYGNuy68KQ9hQLE
         XboJx73PAxIhuBfsNTqStEqRohA5A4nx0C1moYhGTexToHmTaPfGyjJ7JnGY5OCuVERn
         nT2As/h4Yp2c/ppHjmBjr0xSGkhd/wqQLqC+6F9y7bo3y65xZiLqFM6NaMo1ruKPdkaj
         sOQkL4HoB0gGxWK3RNVWCCs4894GlJ3DXSGG36I/JNiJp47ZfGWzJ7uuHTDVRm+XresH
         nlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322228; x=1718927028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+nA/cIlT4hl2if/i6DmrZViDpHELl0xAbf5HX+dSsg=;
        b=u3fPJsH0VTG4Tq62CqqC7ULlkl9vacrB/zCdfNOtvVez9oyc1LWraoe4BgsK4D8ZAA
         LVgIscyPykFZp3yi6MjTorfZAqtB48xc1J/XI/b+rZGz3VdQIZZPKHIjcjq0WNOvjOWg
         BXqf9OhmH/xbBccgeSWWwYdHSGrB5Uugg5P7mw0nKYWdqB/0txTSCERWZH1YXJtNnSuE
         U4YtJRzCzovGs0f8xs2NZv2Ll2emDLyDAlvlLf32FF1LAbRFWBj8S8u4zU0qJl+K3qcF
         n0JiKI2Zjf7Q8QX1eGe7/5ZxWMqIFMzz8pedk1z+mjuy5tix+HKmavLiNLOWSb3ab4C6
         Yvcg==
X-Forwarded-Encrypted: i=1; AJvYcCVJBZK7eYaAYR760f6vprK71DuL+jDfAzoDt6JlikJgJclwyTugeuVNuqb0ljIFCb3xqZYsLpuAC97dTolf4pGRPfl22fIa+3ya11z0b6yG602xKg==
X-Gm-Message-State: AOJu0YwHd99wBVqlfwLOj5TD6Oyn51+Ir9pDaZt8cjkwF2zwBu703vsy
	qiS8eKj/Uz3RpaMWTyCzO30ZMOzbn4lxpvXp9yDTcydzwsTwX9cZ75r4om/WT2s=
X-Google-Smtp-Source: AGHT+IHn9zw8xwyxQcW/uwpUzGyv04x7qilrax9K0Qt1WPvstQMVz2u90LOnpn/z3s9upTTwu35Puw==
X-Received: by 2002:a05:6512:3113:b0:52b:c089:4579 with SMTP id 2adb3069b0e04-52ca6e91501mr727321e87.49.1718322227777;
        Thu, 13 Jun 2024 16:43:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2872260sm359298e87.142.2024.06.13.16.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 16:43:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Jun 2024 02:43:43 +0300
Subject: [PATCH v7 6/6] arm64: dts: qcom: c630: Add Embedded Controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240614-yoga-ec-driver-v7-6-9f0b9b40ae76@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2519;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ve9c78TTAFS5VXzgVyLUhE7e1KCToRb1yljm5NLcL8s=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1p2i67K8xUVD5MfTU5ja95T8upt7CHTU3bpZoc5d5vO4
 ugTkmvrZDRmYWDkYpAVU2TxKWiZGrMpOezDjqn1MINYmUCmMHBxCsBEHO9zMKzVDe1X83jL1lbT
 3WHXZyQa21am8YUpzpxdf9s6/zL1p3VL7x7fJJrW477ojoibwYuXv65pe38tmnzno4FAkkLxpbA
 7f0MDstq/JkhdnFryxJ7F/soJjsqppxcr8C/WXSS3Yfl3F3a3KaomHNFvvmgcWMdbl97DeVYv5/
 qbnl8bA9cyC4k+3LvMoKpWT32zbE0ic56bZe00UfWXE+TbbF4FL55Tr63Uf+2zUPXJ33sqVHWyf
 bK2GV7rvd3k/eXPmpczJOddSeq1PbNfmS+mQ/5K36oF8rly95RbmNZ8DledeUrDdFYzB8MhZ80q
 5vPJXlHBP2RcOPgKFlf+6mW1ULr0lWHaKg+Rr58nf10DAA==
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
index 8402ea2d93a7..f18050848cd8 100644
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
@@ -695,6 +755,13 @@ mode_pin_active: mode-pin-state {
 
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
@@ -742,6 +809,10 @@ &usb_1_dwc3 {
 	dr_mode = "host";
 };
 
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi0_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -762,6 +833,10 @@ &usb_1_qmpphy {
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


