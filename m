Return-Path: <platform-driver-x86+bounces-3695-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA7B8D7462
	for <lists+platform-driver-x86@lfdr.de>; Sun,  2 Jun 2024 11:03:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AC84281D5D
	for <lists+platform-driver-x86@lfdr.de>; Sun,  2 Jun 2024 09:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BCA381B8;
	Sun,  2 Jun 2024 09:02:56 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3962D61B
	for <platform-driver-x86@vger.kernel.org>; Sun,  2 Jun 2024 09:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717318976; cv=none; b=CW3iyupOXi580vPm5iJY+Y1kGJWT+mqMMGktoS30zxA+93dbnQG1JzFaCwFQ57Vt4G8g02zS3tBB8cAq0GaCIsPSBmM8mGkZZehVdD94Kvv1rkM4RmzCSDnO65Ak8Kt651GjTLEri7PitvO2ETVsYYyPrzlyZWxYOG2g6tiaKuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717318976; c=relaxed/simple;
	bh=Zev7O1OaJPuWxSkFHl6udbLp67nkr4VjyCzglGcW7E0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DU8/z8x4M5BavxWSI7MgONG22z9QSMiW+I7Yu0Pctknvu1+m0ZE4dTUhsPmZY7KGERbRj3Bw1x/l+ik6Xjb3RFGw1CaPmwtrnIUHZQrGkuX455Ml5n7EJHFaRsZMy1CSghY6aTnE99M8bGYTd7AU+QBhQzFr12mHUplJkbTIQsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id e4aa8b06-20be-11ef-ab01-005056bdd08f;
	Sun, 02 Jun 2024 12:02:52 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Jorge Lopez <jorge.lopez2@hp.com>,
	Li Zetao <lizetao1@huawei.com>,
	Simon Trimmer <simont@opensource.cirrus.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-input@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D. Jones" <luke@ljones.dev>,
	Mark Pearson <markpearson@lenovo.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH v1 4/7] platform/x86: serial-multi-instantiate: Use 2-argument strscpy()
Date: Sun,  2 Jun 2024 11:57:57 +0300
Message-ID: <20240602090244.1666360-5-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
References: <20240602090244.1666360-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use 2-argument strscpy(), which is not only shorter but also provides
an additional check that destination buffer is an array.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/platform/x86/serial-multi-instantiate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
index 97b9c6392230..3be016cfe601 100644
--- a/drivers/platform/x86/serial-multi-instantiate.c
+++ b/drivers/platform/x86/serial-multi-instantiate.c
@@ -131,7 +131,7 @@ static int smi_spi_probe(struct platform_device *pdev, struct smi *smi,
 
 		ctlr = spi_dev->controller;
 
-		strscpy(spi_dev->modalias, inst_array[i].type, sizeof(spi_dev->modalias));
+		strscpy(spi_dev->modalias, inst_array[i].type);
 
 		ret = smi_get_irq(pdev, adev, &inst_array[i]);
 		if (ret < 0) {
@@ -205,7 +205,7 @@ static int smi_i2c_probe(struct platform_device *pdev, struct smi *smi,
 
 	for (i = 0; i < count && inst_array[i].type; i++) {
 		memset(&board_info, 0, sizeof(board_info));
-		strscpy(board_info.type, inst_array[i].type, I2C_NAME_SIZE);
+		strscpy(board_info.type, inst_array[i].type);
 		snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev), inst_array[i].type, i);
 		board_info.dev_name = name;
 
-- 
2.45.1


