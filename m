Return-Path: <platform-driver-x86+bounces-2314-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 354E988D7F6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 08:52:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58B0C1C25DEF
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 07:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EAA58101;
	Wed, 27 Mar 2024 07:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFV3igqv"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B375675B
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 07:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711525554; cv=none; b=mMaIHWiLHH5NRWGVCMPIQgc1GVkJR5MvUX0aYuwBgUc9s58QTXhEly+F0+t+8WRe6rE52vN730bmqVd+8v0j6d5GwXvk5iiveYSDCmTOxPR3XlvU92JWvAoMSgUwhxydvvGJVQqlmw3Bww08i+Y6RwwcZe5H7F1g+HyTmFuo1Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711525554; c=relaxed/simple;
	bh=htKh4Jp4vM0zvCuX4KapTUnP1c1FqeWCRPv1BZ+Q/j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVqTScBxfBHFr4BzhhmKfxx4BQJuVLv8C9v/MLK0DvZszcuDuObGfYy/3SQA7ZcjYTBspHaLgJpSZ5gIJ1REVQQCjLkdW1nDzGtnvXeuJWdO5oWGgeJt/aBGNPiZTKZ/JN7TqdSzSPxAg3+bfTvzB3l+feRF+dOlMFWn3KQOpdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFV3igqv; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a46ea03c2a5so107807966b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 00:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711525551; x=1712130351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N7K6idk2YeGVu0lxj/Ps3L084ba7NhsvfbgHIaF82R8=;
        b=pFV3igqvMJ9HjluHp9Vf0MAhtXbNQ842Fbm5B7bFRfSuyEJNxCwy027lyxinbK1zC9
         ZmCJgklr0fKbMRe7WPKSN44dgzHg7XJjBSV3FngoSqdey2jX7ObyAXRanlG81bHyvJC9
         czDRKpp5nVwhNhaj/ZJJ8IkU+DBIWxXl+Xu8aRiz5hdIF4t2S1ILUfp3mra0uEIgvPSk
         40Abq57DGCsYzUOOGqhQB5wN5edTKBiNbfznKNZxmSA999sLsLfdaFmc1K5u5YMzioly
         BsA41ig8RRChZ86qzkDLsMP7upAELFQFRSga5bJEb4KoTNJRvNjnEqdjCTuLFArvTMda
         s0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711525551; x=1712130351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N7K6idk2YeGVu0lxj/Ps3L084ba7NhsvfbgHIaF82R8=;
        b=YdSQIc3TunXyPQ9NPLlAvmlQfuTaF9ToRYnV0RbMYCR4U0nTcKNXx9ijS2Wt8jgS65
         xc5IQGjJvcC9V4hFGdOGICwmDYlgwPUD3Cs4z79U5f17L9Xf87XAFC99dT5Jb1SMltf3
         UujZAyr7AKXifQW+snN4czKIp92tpG1zBYA4WYKtuTx5/zG9+/7sFTA9oCiEvDU63aly
         LuvIbYicA+boVsODpymvpGhl8WUFnCNC9smhhINFDazEfpHTpZYUUvW9XHpbKQyDj1ex
         8RJOM90ZSjrLswQE2V3FS9HkFpyObVLH3ZBvqWN8at19gIpvplM29GFAre5Xv+UpM8K3
         V0Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWSOw8c3p+x/xFmQBMXqRq6T9/MHzWgf+zBvRDkLwlkxeT3GBMrJptetFnZv7KDJae7HFZQsZRvSNk5SJcwGUpKBF2ZwI/NysgQLPLzsuxUbStB5Q==
X-Gm-Message-State: AOJu0YxVckbTM4114K1CXeb2Yo7HizMXmcAhpfwlp0d+3Y+3o58rOvdN
	wxnPqZG+K75lKktRjwOWSQ6MuO8pcWEDccq+hEkmqQ0Kty0jXgxlmwJpfZYSoQo=
X-Google-Smtp-Source: AGHT+IFo1SVbUJhfk2D5dISc82f8C01XAvtK/9Ua8RHBqCpkGF1uNtl0N5fMsZ3xQ2K6OiUoagNCQg==
X-Received: by 2002:a17:907:e8c:b0:a46:a3d1:679a with SMTP id ho12-20020a1709070e8c00b00a46a3d1679amr4106291ejc.14.1711525551050;
        Wed, 27 Mar 2024 00:45:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.206.205])
        by smtp.gmail.com with ESMTPSA id am11-20020a170906568b00b00a474690a946sm4671745ejc.48.2024.03.27.00.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 00:45:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 27 Mar 2024 08:44:06 +0100
Subject: [PATCH 19/19] ACPI: drop redundant owner from acpi_driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240327-b4-module-owner-acpi-v1-19-725241a2d224@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=674;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=htKh4Jp4vM0zvCuX4KapTUnP1c1FqeWCRPv1BZ+Q/j8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmA85bDmBUKGxLiw+IE8MXLih8uNdO+fOokRWlT
 TIm2uaEvyuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgPOWwAKCRDBN2bmhouD
 1z6cD/oCytA+t0QmfxlLxr4zYP8tlK64yfX5UfqshoxKOm8kP+7fJ49TPWNAJ/2WOuldx1L8JZP
 GlN8xW/4GU+WN5dsD5vqU4gbr9Fuk5sFzeGpF1Wn+LAWc7Rzm6MSPsGY32bIeJfKiv6H4mha/ps
 6iC3ilwowIllCYO/VS+7EUinaRgOc4gLWxeG5fsWst0/vaT/ppa+J0RqUaM65oxA2SVXfaGW29Z
 WfdVl9fZ4bIoKvmzM1u0QM8ugLZUVyqdYaaMqZb4oCV9JATh4I80NtpIfy6o4YaCRAmDwxiapUC
 HUHnluTQsUJdqX4wyUG5eukbNSJWoevYgQkyFge+T9YteFs9tbViIAwcMKZDN/XVEY76fDZjxCh
 V9t5i4PTRFJFOxxwQMv34S//WxQreKqDkMyo2m8nbCDEp0dHGXiYPbibrEXk286kkju9dqzQXFL
 SwWC13gJbV5ZXZoYT9ZtKUN7IgyenZ8Emo5hTx8uQQ0hP/r2vwR8uRfZZ2tbr1CEqFdpciqLfBo
 eWfMHiqnX05AtOftT8P6/W5u4JbGxibHOlzGY+SlIFixrIy9beGzWztoHO5v77lVosMNGQixCAH
 Brl8aSiMZnR5rKQUT7+dBC9lBBeAk761YLH+3wjtZoA4c8m63tKEgTknXO4Ny2XJQcxUiykSJaM
 p0b7ggN21hq0YrQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Once all .owner is removed from all acpi_driver instances, drop it from
the structure.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

This depends on all previous patches. It could go next cycle, after
things got merged.
---
 include/acpi/acpi_bus.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 7453be56f855..32aae3ee99ac 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -170,7 +170,6 @@ struct acpi_driver {
 	unsigned int flags;
 	struct acpi_device_ops ops;
 	struct device_driver drv;
-	struct module *owner;
 };
 
 /*

-- 
2.34.1


