Return-Path: <platform-driver-x86+bounces-3214-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A80008BBD26
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 May 2024 18:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F40D28259B
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 May 2024 16:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69E865820E;
	Sat,  4 May 2024 16:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LY6PN+ko"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8525A0F9
	for <platform-driver-x86@vger.kernel.org>; Sat,  4 May 2024 16:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714840888; cv=none; b=UKXBVcm1wT7OXE9Drq3iLmxbDKNqXu4GuTNcZqV+LnfA1MfWTUQ6YBDCw50neE2IB3IbhDK8XaK3bPXX3a0B0wXlAmMAc/BBZfTaS6O5m2efUIcHsIW9qqukAbcoNAYyaa+xc8ks9AibCKqjbv6R1SIhAhreuhcE5BRgwhnTrLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714840888; c=relaxed/simple;
	bh=kR3rIKjeK22V3jdldAeKhBfXLNJis6BieB8qH4tygoc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sJMEltbQUvtXWe7xGrlvUAS5H2jwwGBT59BU3k4Eg0Zpqz3ezepEq5IV/uxIR86Y0aIR4C4PwwY2SBh1gz/3R2vDhqa4KFe+7enexfGZnKy9SfoDYKtTUXsshoG1vEy28yYk4o/denwad4iGJZYv7i6HxLVkTK/KhKoemphCkmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LY6PN+ko; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714840885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gyHi4ZtAm4mEigEGa6Bg+/SYTMDTUgikGTMOzAVrwT8=;
	b=LY6PN+koYdRCqQZ0hgUJf7+DwohYI4HFp2nBdIq2surYhgUfTldmHZ1VfndcLaCtKIydOT
	Af0NuBZbikXhcwWeWAZvZfxxM5z4TZZ8dywX8ilnTEPOCdXKFyCQTER+72H/3YfieDZy9x
	ipK47uAmFg56kzkJD4p8uWtmu83rlo4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183--Px3eHryN02Bm1TR6qVJqA-1; Sat, 04 May 2024 12:41:22 -0400
X-MC-Unique: -Px3eHryN02Bm1TR6qVJqA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 033F1802E4D;
	Sat,  4 May 2024 16:41:21 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.41])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0F36EC682;
	Sat,  4 May 2024 16:41:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v9 3/7] leds: rgb: leds-ktd202x: Initialize mutex earlier
Date: Sat,  4 May 2024 18:41:01 +0200
Message-ID: <20240504164105.114017-4-hdegoede@redhat.com>
In-Reply-To: <20240504164105.114017-1-hdegoede@redhat.com>
References: <20240504164105.114017-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

The mutex must be initialized before the LED class device is registered
otherwise there is a race where it may get used before it is initialized:

 DEBUG_LOCKS_WARN_ON(lock->magic != lock)
 WARNING: CPU: 2 PID: 2045 at kernel/locking/mutex.c:587 __mutex_lock
 ...
 RIP: 0010:__mutex_lock+0x7db/0xc10
 ...
 set_brightness_delayed_set_brightness.part.0+0x17/0x60
 set_brightness_delayed+0xf1/0x100
 process_one_work+0x222/0x5a0

Move the mutex_init() call earlier to avoid this race condition and
switch to devm_mutex_init() to avoid the need to add error-exit
cleanup to probe() if probe() fails later on.

Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v9:
- Use devm_mutex_init() instead of plain mutex_init()

Changes in v8:
- New patch in v8 of this series
---
 drivers/leds/rgb/leds-ktd202x.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 60ca6ec34336..d5c442163c46 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -556,6 +556,10 @@ static int ktd202x_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ret = devm_mutex_init(dev, &chip->mutex);
+	if (ret)
+		return ret;
+
 	chip->num_leds = (unsigned long)i2c_get_match_data(client);
 
 	chip->regulators[0].supply = "vin";
@@ -584,8 +588,6 @@ static int ktd202x_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	mutex_init(&chip->mutex);
-
 	return 0;
 }
 
@@ -594,8 +596,6 @@ static void ktd202x_remove(struct i2c_client *client)
 	struct ktd202x *chip = i2c_get_clientdata(client);
 
 	ktd202x_chip_disable(chip);
-
-	mutex_destroy(&chip->mutex);
 }
 
 static void ktd202x_shutdown(struct i2c_client *client)
-- 
2.44.0


