Return-Path: <platform-driver-x86+bounces-3492-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1709F8CFDAC
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 May 2024 12:04:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3608D1C20ED7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 May 2024 10:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC79713AD37;
	Mon, 27 May 2024 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B+Jlfjlt"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4BA13AA51
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716804235; cv=none; b=LGS1DeswJ1UKsNa3qlNYcGib7h6EjoxF+eIH7h+ByIx2/RbpAWWvuOTbhaEv1Omge2OehBN3wQYQG4IZa+rgdMlIKPo7/9a+oYxwQMpy3zusTyzOqynfdOhg1ZoekyuXv9TK3xfg5EL92BnnjlL35QinzCyMSH/gqTRsGOncSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716804235; c=relaxed/simple;
	bh=nFQgrbH3QhEBi6YDAm9aIZnp7fBFbY30fdBVb9mF4fM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JzGllriDIZyMEnZlYVi2NTfYHEGJv93NN7ORKGOLTKukI4SVH62Oedu9ymdCyN/4MgriNF+rAVCM8+TBaPkwI0/B3SYkFF2GRbm5rL8xstB422VeqYRh3StSDHKTIh8jT3AtFXndviKvzx/RSc6s9leBZgdnVeluyg87nGpapDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B+Jlfjlt; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e95a1d5ee2so58442021fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716804232; x=1717409032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CSKpHy++XbFAEmNXbg+79aJlTZuvwRJpJC00cOVgnto=;
        b=B+Jlfjlthy1hycbMyxyS3HFSbGc/8nt5Ngza6vgXyOk4s14mRrlXmXTR4CyX56YNk5
         SkU7Nfhds7WzUkNma9ZRaTmjvYjGnmbmzFAjNQ8gnzao/l+3Dm2FPCYg1CnB5LfIc0cs
         vjRqVvdQtOzCLHKK9t4NfITPuhq27z7yfOlPtU+vh7EzjqbtzOHnz/EQI7T4b1YqqH7+
         i3K6/9gD9IS8RQEDsP3vyYj0ghMoIyxpkGoGz9wIwTwbhbj5GK6uq+cbXkhT0XwQYv/m
         0SrW5b3IYMtoJuPiooKT88jgd2YsyHvAdr/O+x35VxXSvfYBkNQysHAscQcxQ9c4EGIg
         z3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716804232; x=1717409032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSKpHy++XbFAEmNXbg+79aJlTZuvwRJpJC00cOVgnto=;
        b=lfRv7Skv0md9CJYyBXrmDoin9vxPui1PXnMnLDcLElDn6jbx+3NnkH2i3lOL6j7g2/
         YJrBuLBelwunwEpWmf57AiuuHZJMk1RZhYXHmUWMNMAMu+yXUSZgtZu1Uq8pLEuvUof+
         sH5RnvmTcp+9CGrhVkZCSAyCDN8RdDYYZoOcPLps/FchEFPe/hI8X7y4v27kk5nPIKej
         NLpjBXkcJysV4cvui/H88JPiJ5jG1keJAclccFo+IDOjz/LW5XumqXQ3tEoeCvsoxT9J
         4OXEZ0uw618OPbo2ZYnarZJpxux/fp8bmGSD/7YPYRhxYG89eJFv8DpVZwhKhf2WYzDJ
         xXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvyq/kN1lVkOqtfZsE7brPw9NlGa4bS4lzCNmyGd3ZefPKwPj/+SAWjNDXJF8OejtyK23Ypu2KIscWX7rzt3OVED1ifMUm8XOrtOeXXujYQDnr7Q==
X-Gm-Message-State: AOJu0YyoS6vr0C5qWM9baG5UftBKEUIUeLBCz/BwVQIzbB+5VzsG02qL
	jdJy5LPC9G95Vq9p+XZtTL/4l1rBLc+k3u8TRVz4h+Xvkx9ma5hilFGei34ONC8=
X-Google-Smtp-Source: AGHT+IFM7PlHYLfqw0PfTnjK2ciewn/9zLQ6aH9da+lwVmkFVdod5r8iPjE9t2VNt9noUnon4iw0sg==
X-Received: by 2002:a2e:7808:0:b0:2e7:134d:f7ac with SMTP id 38308e7fff4ca-2e95b27b0a6mr74589281fa.44.1716804231905;
        Mon, 27 May 2024 03:03:51 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e95bcf4bdfsm18616651fa.63.2024.05.27.03.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:03:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 May 2024 13:03:46 +0300
Subject: [PATCH v3 1/6] dt-bindings: power: supply: Add Lenovo Yoga C630 EC
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-yoga-ec-driver-v3-1-327a9851dad5@linaro.org>
References: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
In-Reply-To: <20240527-yoga-ec-driver-v3-0-327a9851dad5@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2698;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ilOGTtpPgUi1eT2P4k9XDhQr7rJIZKnwnub6x2KjzsM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmVFqFbqLd9nFNYoDtTBz/cRlxSAoHSbua7oOU2
 ysEnljBH2GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlRahQAKCRCLPIo+Aiko
 1QA6B/9orNCqkDsqNW9yPepVYZfpAhRctaNSYIFTTyBdV89dUAArAEJ6MiXUE679kKIpQbi1YqT
 nNDXyQj6Tb8iMZbZ8ytiBDyn8Q8c81xF3AfCz0CpfpDby3Ql+20ugb7VJGFKPxdbJWznvrr6U4s
 cIKwPHHdC6UNOXO7hSW22HfWR1O8w4IymAFQt5lM9ITeOeAyjg8hA6rgWZ0ZssY+6xhDXM/SBko
 eXjXPKRNEu/F9MGCTUVPg8M/AHqOjWj5ENelOYkZmKTURzhr32DGGqBWLbA0Xr775kxVplKMP0m
 QLNuESo+sI5NnZmgtOTSqEgLUNWWjKhy2ghk9SeprzX15pak
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Bjorn Andersson <andersson@kernel.org>

Add binding for the Embedded Controller found in the Qualcomm
Snapdragon-based Lenovo Yoga C630.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/power/supply/lenovo,yoga-c630-ec.yaml | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml b/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml
new file mode 100644
index 000000000000..52a302850743
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/lenovo,yoga-c630-ec.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/lenovo,yoga-c630-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga C630 Embedded Controller.
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description:
+  The Qualcomm Snapdragon-based Lenovo Yoga C630 has an Embedded Controller
+  (EC) which handles things such as battery and USB Type-C. This binding
+  describes the interface, on an I2C bus, to this EC.
+
+properties:
+  compatible:
+    const: lenovo,yoga-c630-ec
+
+  reg:
+    const: 0x70
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  interrupts:
+    maxItems: 1
+
+patternProperties:
+  '^connector@[01]$':
+    $ref: /schemas/connector/usb-connector.yaml#
+
+    properties:
+      reg:
+        maxItems: 1
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c1 {
+        clock-frequency = <400000>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-c630-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 20 IRQ_TYPE_LEVEL_HIGH>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                power-role = "source";
+                data-role = "host";
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                power-role = "source";
+                data-role = "host";
+            };
+        };
+    };
+...

-- 
2.39.2


