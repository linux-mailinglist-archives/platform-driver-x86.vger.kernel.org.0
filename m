Return-Path: <platform-driver-x86+bounces-2309-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4466F88D7DC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 08:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 750A2B21196
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 07:50:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96126524A7;
	Wed, 27 Mar 2024 07:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zY+fv0SA"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52A054794
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525541; cv=none; b=LrNVor0nUNP5j+9P0GhulFSyPU7VSkuOKbCk3DMribN5soKrffWrA6iuxHOyyZ6zQlNJW0kYqJ4aHt+Fib7l7HyfT4O7XiqI+H7CUNcHJPIhXI2jVXkoPURWhUP4jdIdEXG3RlLP3/7LEHcc0nWC2u/GqEGr7h8spObYKoZOK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525541; c=relaxed/simple;
	bh=cGSp+fb1ErfInvkEky9HOblWqKybxO6FtAW/nqZqTPA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1SlK3oKZJnpUR/u94hsokd4aAJ5vLr2VakPcgRZ75eqW/HpU6POwB27Sp13LESVpPBOZ5NrhSS0tSANocTZaaIFTCe2wRH7gkajsFLWhtJbH8hNNWb0fuwRzwKvoyUTWzwCD84Y8ENBG9StZmzSonTw3U5AUoOqDQAXwwfmafI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zY+fv0SA; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a468004667aso860663766b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 00:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525538; x=1712130338; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p6Ko+mvEiic//1+t5pHsQPa2YJj1QeKHXB8/eXKeda4=;
        b=zY+fv0SA3n/5ZapEc+D7Y7sP7FLA/QlqSI0Ydfn3VBUZXi+/YCZ3zw13UkYaZV8bjB
         3QqQ7NCr7g0yvC8YxZAPRxCoC8wupSvcFHvR3lFbbtUGd94ArqDrvzw2QWXAK+KDzdoU
         pExJsuuBwvqioTYToOMPTpRhOR8Eg+jFmja/+mp10Ms5IqZXc6Nn5Sid/zY/2d1kcW6S
         WlOrV2EcBQyqFzVt8pH+FjjsgFPL5gYIzuxGAH/J4kG2lOGArq30AnuR4IhMxDXGCx0Y
         cneY0DFh1Rxn2g5D0OpTe6yGLVeVz0u5N26bNHWwzXdjF2Cehcd4GMYCjisAR44wO3tT
         sClw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525538; x=1712130338;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6Ko+mvEiic//1+t5pHsQPa2YJj1QeKHXB8/eXKeda4=;
        b=jgmXeLc92NC5S258nkR4toCqW1vmplv3yD9QD4o0VT9HSiVzxCNjupEUVLQz84iVNw
         Ofse8j0HQccsw4UIJjnxEN8EpMe1w242WEOFJE7V1CoSivyuvY6UmzyQgQizVInjTLjt
         EcUlAWhLRbmpoC9dyWrhP5EsOLbnA2IIPVKq4YhaQM5ttTKuicH2eQ44f2CDyI3XXHFG
         /WGWC53KWVKCkcQCGc7sSDElBRpeTRCEBhXMyvKo1Z2wvyY7m5nT6/AKl5nJGb1wZ/5i
         UC+qSbibpftMCVeNS/d9sSg/zfpxrcoGfRMlEw/qo4+BJa7F+CKGFodN+3psiWrfPeoH
         A1sw==
X-Forwarded-Encrypted: i=1; AJvYcCWH8zri3K05cEUW7tqooum6LkYHG8b2verlvr2PBaVOYC5W6Y8MlGRBHy2/yaSVGYYG1DDP99C/vB1kDQkFupgPH8zvP436hPkQH7B0y65jyrG2cw==
X-Gm-Message-State: AOJu0YxQXrLXJPvuFfgqrdrRCd6XQB7jV0kOpPlQnFHbW8UAIcxzNg9r
	vnstSUc/RIw+Xrr8qPE57I/mVL1H1GLwHgiJc7FRhKwhFyUluifwQ0rb85Fm4OI=
X-Google-Smtp-Source: AGHT+IFP9PjmkC/ReO4fhh7Wk6QWIfHhR+s+O4TJibicmXptZOuKBwxrb2kaPAqyyszLdHU6QYeFXw==
X-Received: by 2002:a17:907:3da7:b0:a47:36e5:5514 with SMTP id he39-20020a1709073da700b00a4736e55514mr3369099ejc.14.1711525538271;
        Wed, 27 Mar 2024 00:45:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:44:02 +0100
Subject: [PATCH 15/19] platform/x86/toshiba_haps: drop owner assignment
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-15-725241a2d224@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=706;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=cGSp+fb1ErfInvkEky9HOblWqKybxO6FtAW/nqZqTPA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85XQe8+JnP4ipRqIRlXJVk1550v5vg15GQA5
 O1H6+zpaFmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOVwAKCRDBN2bmhouD
 162jD/4/MAqwe/Vp1fMQL62/M1tNmAD7uN0667fERhx/uUjdhgzO+Lv2QcRNB3/YWcbq1EHPZQj
 KxKs/vir+taR5jjf9xQEMiy0ggPCM8tAZXEVQVDiDJFV6keMAaJi46MJi36smUaUYSL8pX2hDc5
 Loot8EOO0okpMNuZkBTzasqcLISuVYQNL563xMSJmouEnjdWU+202EMEyz2pA93nkDUrQTkEy+J
 9ZSj7jiTcBLTIwR5LN0zhWXLpUYXvTZmDvvY+lFa5qfUEsGvOhDQXT3FBynJUeGsPAdNVjDMv2G
 3b4PtpbQmZ2FhQ+LYxEdE2MW1IapDoQcSQ7OooqscuhQIda0znQCe3RicygZD4kKlLm/G8Ls9S7
 afolnq13cWoxkCFliwLwPsOdL6EeTRvVFcZq21bfZzNXsWVzTTvbhmePHkqUhYeOgNwjUJiLf91
 //QYaOmYqbBQzZ3aR+FUXfdSlou0/om2aOXgDXMm/OolYBS/Ldidd9alV4y7kr0xeQewal5o+SY
 XxUVZC+2lrEb0BWKXo5pLUXxDKXMJW/5e8jdO3MjgNDtyXAqvuTCmdQ2iIBkhqE5qR761UAWISD
 HBJ76Q8OMe3abHpRayAkQ5soHeZdHgi+mcclWXJhvcDERgVhoCMe42RSvV0Gbf8Ay4P2YhHnM0V
 52DT0rduVUOnn6w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/platform/x86/toshiba_haps.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_haps.c b/drivers/platform/x86/toshiba_haps.c
index 8c9f76286b08..03dfddeee0c0 100644
--- a/drivers/platform/x86/toshiba_haps.c
+++ b/drivers/platform/x86/toshiba_haps.c
@@ -251,7 +251,6 @@ MODULE_DEVICE_TABLE(acpi, haps_device_ids);
 
 static struct acpi_driver toshiba_haps_driver = {
 	.name = "Toshiba HAPS",
-	.owner = THIS_MODULE,
 	.ids = haps_device_ids,
 	.flags = ACPI_DRIVER_ALL_NOTIFY_EVENTS,
 	.ops = {

-- 
2.34.1


