Return-Path: <platform-driver-x86+bounces-7430-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A9F9E28E4
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Dec 2024 18:16:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C654016976A
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Dec 2024 17:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EF11FA14D;
	Tue,  3 Dec 2024 17:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A8PWijhY"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31271F7585
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Dec 2024 17:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733246194; cv=none; b=BgsR0U5GRTrR4vZU37F84GbaCmjMZrT2hY3rN00mpttQUpTqyaARhLD7Vxg0xi73Z60IIXUPvaqzRdrmEtIIWq0pTzngkqPM4nPXvUwIjwjOqlHHufctvjP7xJ1cGr5R6104ag9CVxaUAaweS2jKdErO/BXjWOhwdVxKG3S9lic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733246194; c=relaxed/simple;
	bh=utreZi1b33SQhVOLlHhBq4vUD+FaZlS1GvAZHa572Js=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pWOwv+iZuXcstDidenSgzXfHTG7ve7/NZRTzbrPRFGt2xO6nyqTKQPixLA3YT2XpQg6wuA3tDwomTimZS9ScW3ywvLF/Zb+DfIT9JSxfmqS/R2ANB1ZZM3g6WtZHkES6+Dd/wsuHb9GRc9FD9QcT99QuJgWE3h6p2M7Eo3VlSXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A8PWijhY; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-4349f160d62so49329915e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 03 Dec 2024 09:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733246189; x=1733850989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTrgr8WKLcPhzvOn+FDFgnYEEGOWa2vyza8BeIajrzQ=;
        b=A8PWijhYcKZpzav4qQscSRn7kadzSeSkIDsKVnSE4lKN++AVH9xO7YKML8H7DVoKdE
         hl9MzVef+TIPkRMCqrd7vkg50OTrWpQPAinVQiJdAKtRjYodS/9h/OwOVuVzpqcq90lT
         XK0KyA6s/Ms1RSPFQZ+r0guDxCMdV3O6001dpCkK1kDnLFm+wzlWvls/DQZzaAyUNbVt
         MJkp23/v1VmmfpIchqUiQpWc/QvlE1u7R6qmfjHqYea23BShQpXdtfQEyJWH9esln2y/
         M5F0bz3L2zcYjorwENaLzr5niAQXcgSFb0FJj1xbU02N6Op+fdBgD4lSsW6y/TWXNymn
         bgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733246189; x=1733850989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTrgr8WKLcPhzvOn+FDFgnYEEGOWa2vyza8BeIajrzQ=;
        b=oB6q+FIkgYqArl7wnbHfimgc08Ryti0S/oRwVgBpxfIr6g3XiFB5zNO1UAh8wUsZme
         xU9xpovLDDVzC3Cd4MRZ+MnS/bret5PaehtcrZyxSinrAxbbcWG0Od0JwBGXY3X8sY/L
         Hh+OxjJ3pL3s7GQLnSLzpxNiqVCgBxyYCsSGNkf5qDlrWx/ldJKEzw+MoV02p5n4Mocd
         EV7kc5FWMk5Rd3jIOvexpRzJx9PFqkuzaGXWj7rjL4YrL9qfmxyy7bAM9Arkyk4mINIU
         nOxEuPmRBp3vVmJJVaj33k5/wurX+u9ZX7WCPmTZ28bLgcR2eLcKscsXOYQFujYoKZnp
         QkTg==
X-Forwarded-Encrypted: i=1; AJvYcCXmEl9paV62HYVn3AsP87ieTSybes5ConLiMhyciHEyH4sW/RjFKIC1YsmKxeQ5Q4Hm4plNuBhJsT+IGbRw/vZG70KG@vger.kernel.org
X-Gm-Message-State: AOJu0YxzSxpkvBrQPOgu8HTsak3vhbFAyXY/Ik3eZapR+XsTkOuh0VfC
	tEcDEb7GFAcLxCOw8opWTptd4Nr4RY9lbgb0528qacSK1oFV3jVpML+ehq9+EFE=
X-Gm-Gg: ASbGnct9JTp77kBuTKTKcWKsX7iDXJQprc7icIoZtECqEfBdm7QrcOqQIhzo277uIhZ
	4WoOoDaaxF018U/e8eaSgBXaXFq9l3HZTpZV1+AgAmm7yLlhg6Wei9UTBP4/p/BuN5/pTASkkgD
	Ro5i777NCN8kcn53x4r5lFHUYmgeo2IUcFaiejeI49TXQkbZG90hy5A1SB7LI3wGuhfatByP+Xz
	uAi39ByIS/ARRVH5PZVMPLf/oIJrXL5bRVZPXIKp4doMNBg3f36UNuBLkLr9kT/WySszYAC4lQS
	w5/X
X-Google-Smtp-Source: AGHT+IHBNNcXgQgRw7F62IvU4Ow8eVgaapiiaQRLIwhVo1nEdJi+X/4C2Inm5zZCllFJXZgMO6sUXg==
X-Received: by 2002:a05:6000:1a86:b0:385:df59:1141 with SMTP id ffacd0b85a97d-385fd3c56a5mr3386631f8f.5.1733246189344;
        Tue, 03 Dec 2024 09:16:29 -0800 (PST)
Received: from localhost (p5dc6838f.dip0.t-ipconnect.de. [93.198.131.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dc6352sm196165835e9.21.2024.12.03.09.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:16:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] pwm: lpss: module namespace fixes
Date: Tue,  3 Dec 2024 18:16:13 +0100
Message-ID: <cover.1733245406.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1069; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=utreZi1b33SQhVOLlHhBq4vUD+FaZlS1GvAZHa572Js=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnTzzeDXjPql1rNZHFGiwo0b/qy/Oy+1icISNqq oFIy02MKtGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ0883gAKCRCPgPtYfRL+ TgHECACqBvfoI11+a5YRkUNVpO2axVYVseHmWPybcqjqmU65kB9likXV2k65HcXuoKZQRrt5q6s 4vao5K/rl6OM9oVUjJaypxl2iM2rsW4gSV2Ss5/25P1FdIL7/Dyq1cNleGnoHHcqTvwYDz4QBFh MzLNYjVEANLBNB1mo2cOk7VY1RjQHVLLzC65o+zTJ7AEF3UW2JZX65eSPoWDc1I53eQDUrZxc1Y vZ99jeiLDjgkW2EoCdvxemxbTw7694Y+uc/jx8nHzi876kRgrjR2GVRPXUSViCjnyKHa/lQHeZ4 oJoFfWQpTOgMHpm5Xfn0rSEEPMUDkY6oJQQrAlPPqazC0ZLR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

while working on a patch quite similar to
https://lore.kernel.org/all/20241203102124.3147478-4-masahiroy@kernel.org/
I noticed that the module name space in drivers/pwm/pwm-lpss.c isn't
used. When I fixed that (patch #2) the intel pinctrl driver was unhappy
with

	WARNING: modpost: module pinctrl-intel uses symbol devm_pwm_lpss_probe from namespace PWM_LPSS, but does not import it.

so the first patch prevents this from happening.

This conflicts with ceb8bf2ceaa77fe222fe8fe32cb7789c9099ddf1 that is
currently in Linus' tree. I'll take care about that.

Best regards
Uwe

Uwe Kleine-König (2):
  pwm: lpss: Move namespace import into a header
  pwm: lpss: Define DEFAULT_SYMBOL_NAMESPACE earlier

 drivers/pwm/pwm-lpss-pci.c                 | 2 --
 drivers/pwm/pwm-lpss-platform.c            | 2 --
 drivers/pwm/pwm-lpss.c                     | 4 ++--
 include/linux/platform_data/x86/pwm-lpss.h | 7 +++++++
 4 files changed, 9 insertions(+), 6 deletions(-)

base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
-- 
2.45.2


