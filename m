Return-Path: <platform-driver-x86+bounces-2312-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28688D7ED
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 08:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0149F29A38D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 07:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A188756463;
	Wed, 27 Mar 2024 07:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j5urB8Cw"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03EB55E79
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525551; cv=none; b=FQsO2kcssctDfFnZMD6Mm4iz4SwdyhJXMgu3uIlTg1+ndhf/lJJ9+j9O1SZS8W1Ayi5xPY2JDS2MhUFTXCTRJiCS8o8hf+iM55J2Eg+Cno3rEmOgQlfOiuyO5YNi10AIESM9MOOrRggR0aCOfC9XLnHg8VTV27CKpn7TfgkRuOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525551; c=relaxed/simple;
	bh=dbdsTocayhpBlq6Da9S/RlY6tutliET9lQL81eDjiGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjsbkWI/UeNnsVy15nhKde5wzENjUisWI80LFRO4R9PRv+bh223nLATvKfkBtJevQzdDV9T0E/BYXiAyr6cU5A9jE3OLXq2D5E1hdmWvN/wgy7Kl56eC/vEhqJrThlGje6cxNwOfb5do8cVnFjHnja1OhGQd3YZbM5HiMHHVxEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j5urB8Cw; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-56c36c67deaso941128a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525548; x=1712130348; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eFmsV/NoaMakWZHxkvOTU5Q8ryqbz3jqq/d7yKl6aAA=;
        b=j5urB8CwkXAd6PQbgI0+/XzBwxMFVb9m1mPDMX1aI+KD8+h2wZij7eIR5xorBnrOdJ
         zs2Sg4KJq51pO5WI4oMnIrwF5+YdHpL1H2rb0nUJnL/yH0LSOMDYH3mQMgxEsm8yonJ1
         cZMCwOvNwQZCIb4q5NDY1xzFIOZDQAp0HRGzF2jGNqGlRfvdkrcg7+CEfD12EyYeC9C6
         nvdpv5A4+stJFBOZPbb0BHZhIDz+K5EGPvvXlgBwne6Leb/QgfFrgs2eTAxEjm34i2Nv
         DTg7EySM2nmvLXvAUvCnpivyF5R7jQ7XJv81oBHZz/nphlWazziFGNxWzGGWg8vBpwTa
         OvsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525548; x=1712130348;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFmsV/NoaMakWZHxkvOTU5Q8ryqbz3jqq/d7yKl6aAA=;
        b=BoCPRId/kCxzSuZHHyfdt9Sd1evMTkP4ouw67S6YeUb+g8QittZQvde/oYyVH1qc/i
         MjjhrFt6Q6xhaLgsJeGATJZ7w/ltbQuyAZDtFQTngC4tNeZMorrvenjYf6hQwu45UX8a
         TSIeY0od5RksfQxDiAbB4UGt9bfkPTTGznIZOlc6McQFIWmrJcSl+YUGh5yBHWsmuyAe
         TQjBpCKpScfPxNS19/wrREOIqC2mz+qXNVqwWUFG+XSkDTu2iFZoqjTbCaXA3C8qWs08
         853e8ndmGQ36kxIbMZraYxM4u99KkXlonWbT8z/+ueDbh43+BAC2OZM4u8kIj6U9t8oQ
         Bd2g==
X-Forwarded-Encrypted: i=1; AJvYcCXC5zuSIrF8POv0KcSdAMB3Dwqcnmx4CMo1T6++02T0oqqtT36/R+lrITkpwKBIq2tQxYOm1+1M530enfBfjbKOyX3x9oDWJEXq8rVEE4ZnTP85PA==
X-Gm-Message-State: AOJu0YwU8+3XAJvQ+AsLDHSD1AkoqUDJPyz2/F0DfIiLdKf5X9M0ra3e
	nUfMeK/ZPhK0ZM5NqlC116RlwRdraPRpnghVCpdWiIOfmxYUdZH5iDUSdx1YFr8=
X-Google-Smtp-Source: AGHT+IHHJxnrf5kwv67bTxaWL+oqxc1u6A41hpjL8iyyqDm9/qbxskIGE6/X6lBP+g2gB+DzDCVcpA==
X-Received: by 2002:a17:906:3b07:b0:a46:af60:7c72 with SMTP id g7-20020a1709063b0700b00a46af607c72mr241692ejf.54.1711525548055;
        Wed, 27 Mar 2024 00:45:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:44:05 +0100
Subject: [PATCH 18/19] virt: vmgenid: drop owner assignment
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-18-725241a2d224@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=641;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=dbdsTocayhpBlq6Da9S/RlY6tutliET9lQL81eDjiGw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85aKG0YKU0GrcDqlUGPLUrY9ex1+PR8Y9+3D
 4a8ZCYPJ1SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOWgAKCRDBN2bmhouD
 1wGDD/9dPtpxbuSt90vV7MX3thsBHfu60oGwRwnqGXmAnHryu9NwMlClq3O3jHMxLgMdWtBzvh5
 y1Cdn4uAXMPYXboaS5tJ/iG3mn0wCAWppAo9XHFQzKRMEFtjn3BAgNer4iKeIaM2fQMCdo9mLen
 /qMGZ6B455dCEybvZO0D/OL7X3F64Jr3tBi7aeOsyt/9XWPc/1xqgY9vLoBpp17Rh/ATHh+aVww
 ftJ5dHpf/sKN+p9ahIbX3BNJExjcJV3GfghNVSVGgfs8/DeBYUzJ2tFtSugRrD3jd3scAtpJhrZ
 lFwnlTx/0F+nOOPwKiaRFYauy8otamqiqeTSIGf/C9/brFOmvL+iYlbS0399a0o9bpGDM2zbQ2Y
 KUk60BhrDS4jFkrLCQ5sP0NLT3oXuF1qOMtNqynWpyAZQrQxst3xkt3kysfFA5x4WuaXXqKL5Jg
 P98ihZUYKax2E3Kr0mxYVPz7rZEZRaNOjjlf8wp/Rh04cOMG9qLesw9TJl97aw4wIPYFZDdVEoP
 5Z4MxSlzwhvE+Lhs8UkizvB51FAx4RQ6F43HLcDL0lVFX8t9fU7GE/hcfzkXmbKxcIXQseI/EB1
 OLano4LLmDOHasasYu5hIymKeao6CzeNMWKRh8l8kHvx9YouEdQrnT6E0nvS1o38e39Z5QRa/I/
 alOoYUb8Vdvabyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

ACPI bus core already sets the .owner, so driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/virt/vmgenid.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/virt/vmgenid.c b/drivers/virt/vmgenid.c
index b67a28da4702..8f6880c3a87f 100644
--- a/drivers/virt/vmgenid.c
+++ b/drivers/virt/vmgenid.c
@@ -88,7 +88,6 @@ static const struct acpi_device_id vmgenid_ids[] = {
 static struct acpi_driver vmgenid_driver = {
 	.name = "vmgenid",
 	.ids = vmgenid_ids,
-	.owner = THIS_MODULE,
 	.ops = {
 		.add = vmgenid_add,
 		.notify = vmgenid_notify

-- 
2.34.1


