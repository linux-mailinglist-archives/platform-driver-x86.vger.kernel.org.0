Return-Path: <platform-driver-x86+bounces-2304-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A3988D7BE
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 08:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 047771F29EEA
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 07:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AF74D9EC;
	Wed, 27 Mar 2024 07:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W4UH5QRx"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CE3481DC
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 07:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525522; cv=none; b=YS+7waCnSbp9Fs7dP264kgsGQ11S1z1bGGbdmCChX7urgzEIF3S7GfLI64SwDm2+zuuruTFO27hjuYGdtohXxmS3/MSbW1wKeiLg94Gie8TxcgVT7iiOnKOXAJv/7XfAIV+s0j9Ratg2ZdJhxOQ6OgxwmBTAHUBLpyS1v1Pt/WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525522; c=relaxed/simple;
	bh=1PHM2e0wsxA3Uj1VkzIBPCTuFK6Jh8lVYsMYYTUFi6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OZaV0v0iWLgNL+2rPyflkz82tTrAxepGhXWUgPp7u0UjhHEv15iuGkCKQY1NkvgVz3pXeiVbUiw0mFJQL1cWb+hR/SUdqun243/FSeMpPj2NNj9RqRLfcjWXknYIBTximHJ88YOakQ+2mdEiJOAC7JvKDBoD5rfj5eYrX0s2UP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W4UH5QRx; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a46d0a8399aso95652366b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525519; x=1712130319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9x5KXrMkGCI5XWmP7phpN2hPRBytXrTYldJCysrdH4M=;
        b=W4UH5QRxcqKVfl/LyXtSedkERojChomXvWPSUrI06BTz718YSczlOzRJ5BJAyzDNE7
         +jKpgFxU0J39aFYSJwMVU01yRBYH17Pte9wj3IQKyMWPXaQ6pc48d92vEfq5QI/njjzD
         pgdknRV65Gh2P3f2EUdBcjapO1EAiFEp3acVYFnVfDZFaIQuLwOEC/wwK9hCSECmKG5e
         wDvJPaBeenEnffIv0Rr+DD1GXbtrtQfF+aalxgQ6VOcfWPN9LHij6Dxz6cNaUfXTU3f1
         nB8tAKmvf9yXyK/c30eMlw1/qTFk+ZkVz8TWVNVXuaKlvS4u+A4I4jBGaBFB4fKeZUaj
         ZYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525519; x=1712130319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9x5KXrMkGCI5XWmP7phpN2hPRBytXrTYldJCysrdH4M=;
        b=ZjBH097j4kkEYnFU4/etoAyDW8vgVcymSrLFG/E+UXi8VGNZGinSZogffz2tSCFStL
         x/pNR2vsNGnx0+J3LAb/TvgilbdpVZPym6nhcc7n2y3JMBXx+HN2iL2uj36v13r9s39W
         ninUwpYd4reK3qu9TCcVwHD6TPGP+REPkZsoYqOHQZSBkwYsD9fte48fqVF5x7liDw/7
         ghu/yuMi/2PiEsjmXlBMiaXQP92AG4UMtnqjj7aPjutuVEPdDzuQLPpg67HG8KGQkmL4
         VqUZxS2NSfIKITZoqW/yf4VpJ3ln1xta+ubjwNfeyLlWk4nAwORmv7ChUqhmB7Rc4Wau
         yjcA==
X-Forwarded-Encrypted: i=1; AJvYcCWw5UHtuEWhLB59L58doOjqqF7wEbuQ9BsxbyZB6q6qBbhj4pXJnFxoUGa6Fd+ZflqoH2OdB9ZTBwedYJQCxVeAYHoHXcAjO9DrNNYwr72HUk/OXA==
X-Gm-Message-State: AOJu0Yz27uCA1aaggMSGlurd/pQLzUwDMrDZP67Rw1magByrnqFGFtMF
	hn1lzG17915hhxjnHQ3KhPBjd2iZVTFrI5MZU6bEky4UHmYFlnaRX3K6psO5Ttg=
X-Google-Smtp-Source: AGHT+IGUZVId15l2V8zrqWjVp2OSJJdjnfqpmVblzlabr906yKn6uZlea2HCTefmgDYcMw27xN5Bnw==
X-Received: by 2002:a17:907:9716:b0:a4d:f635:b7db with SMTP id jg22-20020a170907971600b00a4df635b7dbmr3744939ejc.24.1711525519373;
        Wed, 27 Mar 2024 00:45:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:43:56 +0100
Subject: [PATCH 09/19] platform/x86/intel/rst: drop owner assignment
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-9-725241a2d224@linaro.org>
References: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
In-Reply-To: <20240327-b4-module-owner-acpi-v1-0-725241a2d224@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
 Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>, 
 Daniel Oliveira Nascimento <don@syst.com.br>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Matan Ziv-Av <matan@svgalib.org>, Mattia Dongili <malattia@linux.it>, 
 Azael Avalos <coproscefalo@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, Jeff Sipek <jsipek@vmware.com>, 
 Ajay Kaher <akaher@vmware.com>, Alexey Makhalov <amakhalov@vmware.com>, 
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, linux-input@vger.kernel.org, 
 netdev@vger.kernel.org, chrome-platform@lists.linux.dev, 
 platform-driver-x86@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=670;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=1PHM2e0wsxA3Uj1VkzIBPCTuFK6Jh8lVYsMYYTUFi6w=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85SfelodN5WDCpPu7IQ/MSd2bqFhtOMIk1dX
 Ppxe2ScpSGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOUgAKCRDBN2bmhouD
 1w+VD/93clNn+/kXjdiiABV4GEk35rFvm1cQ+jqPu1K55WJH6DLOZjQhRCFpus0DAbgq/VF4JGD
 D5269FIJpD3FwKPFYxgHxClK9t1tfuFI3okWjfO0z/PxhzVybHByZ1UIJGguKaVi4Sxwl/dTTWH
 gAIuW0+qYsqWSuD2gXOcAKb/ET0fITW/EYGnkV4uEvo3H55cPfH+oH4sEeF8hMOEe/WflpH1/Ar
 NbE0oFBu3JL0/VWu/kZAMAxcganCGuaHoiwS7BDj32xJDV/L7ZSehdOplVIwEOxAia4wnazTzG7
 fglnEQClU6RSPIvG/Ejvq/i/9kg3Ckq1cSUkOTE3w3sd+x+Zsy0sXk30H4IDwzLmkd33OCmoinK
 Vex0cIQDM089YXzD1uvkATAhfLwzF0A3BXtif+guBs2Uc2laTuV8mmKmHZto00y/Li/Upn/VFlA
 0gKekbP3xy2uR2uFuHBcJWR8joHYMJcW+Dck9P8KDcR889NamSJYN3iYD05V/j4y1lygog9N9wN
 C27ES+xZ2le2hI8lMBetXbyfuHe7oAXFix5traHwIwNVH8OcOFRJRB/19TtDlOU7U0kkTuu+GQv
 cdlbKEStsTOg6U9y6p5BpQ+88DLzBtqv03u5PqWdMPPoLNWZtCUtAJg9IM88DawehV6cJXezaiK
 sczoxDt0xaJO2+w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/intel/rst.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel/rst.c b/drivers/platform/x86/intel/rst.c
index 35814a7707af..6bc9c4a603e0 100644
--- a/drivers/platform/x86/intel/rst.c
+++ b/drivers/platform/x86/intel/rst.c
@@ -125,7 +125,6 @@ static const struct acpi_device_id irst_ids[] = {
 };
 
 static struct acpi_driver irst_driver = {
-	.owner = THIS_MODULE,
 	.name = "intel_rapid_start",
 	.class = "intel_rapid_start",
 	.ids = irst_ids,

-- 
2.34.1


