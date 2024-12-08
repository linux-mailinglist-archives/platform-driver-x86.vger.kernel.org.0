Return-Path: <platform-driver-x86+bounces-7600-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 066BF9E8536
	for <lists+platform-driver-x86@lfdr.de>; Sun,  8 Dec 2024 14:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A522A18822D3
	for <lists+platform-driver-x86@lfdr.de>; Sun,  8 Dec 2024 13:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95414155391;
	Sun,  8 Dec 2024 13:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="e7cWGnmE"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7891531C5;
	Sun,  8 Dec 2024 13:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733662965; cv=none; b=ZLErghnZzX7MoBoDwT6FnTuvr/exfoMXZ04mi890ppmmvcQ4N4v2Ncxona9MxsOqwqEkCNB3SM4XPEUaa8Bzh+XKiEH1VaUnInKnqxkZHCcBTLPovmTsnVJLCDBEhCxQaEnOCe48C5jSXDmtfCzq/AYMQUOaqvi/FthPGvvdj/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733662965; c=relaxed/simple;
	bh=mi0udZzZbeywpP/vrlSR3292aKI49L4o1M7uXA1k4Mk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lk4yO4jXvthXXQ0kvZND07iqRjMfwEalbKWjR0TGJZJvKTdtNWyuprcU6AWwEK+q0A91eXqj7J+M3YLD5thZ0U9UI1WkGDsOWSFzuOBRvXKhXIzWgnoKDtOy18lcET+KTymaSFYGXxYE8qFhzraCw14C47uPBZOh59K1JffDRXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=e7cWGnmE; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733662959;
	bh=mi0udZzZbeywpP/vrlSR3292aKI49L4o1M7uXA1k4Mk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e7cWGnmEXr6CdyhYDkWhQM48HNsDQMxwTDMYFlvusWG4fGdAbSII6gL54B0FJUWxf
	 qsUa5zFysI8DG+PVjL3PC0pLDI77nsfxy5qCgd4vSkSCBv3FVq/YGY7llMFtC0RdMp
	 sbmSQlWplXo/yy5/hFxkW1KXkQ5z7co+p0U3+Xio=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 08 Dec 2024 14:02:40 +0100
Subject: [PATCH 08/14] power: supply: core: use dev_to_psy()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241208-power-supply-dev_to_psy-v1-8-f95de9117558@weissschuh.net>
References: <20241208-power-supply-dev_to_psy-v1-0-f95de9117558@weissschuh.net>
In-Reply-To: <20241208-power-supply-dev_to_psy-v1-0-f95de9117558@weissschuh.net>
To: Sebastian Reichel <sre@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733662957; l=1730;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mi0udZzZbeywpP/vrlSR3292aKI49L4o1M7uXA1k4Mk=;
 b=u9hEDXkY/SamrSYZHHVvde1TzoAxrIdFpAs8oqwaeTqVOmsTN1NDrNdSnkjJqBKJFFMlgRQqC
 Rc/snHRW4V2CLGTLpo84jSWGoXCEmafK6snvxfHXqfX3TLEnYfkCzvA
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Use the new, explicit accessor to go from a 'struct device' to its
'struct power_supply'.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/power/supply/power_supply_core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/power/supply/power_supply_core.c b/drivers/power/supply/power_supply_core.c
index 0cdccfd585cb49b623027a3edaf2958777d2be8a..1db27afb7017c4428aa90372f7b9de03223671cf 100644
--- a/drivers/power/supply/power_supply_core.c
+++ b/drivers/power/supply/power_supply_core.c
@@ -123,7 +123,7 @@ struct psy_for_each_psy_cb_data {
 static int psy_for_each_psy_cb(struct device *dev, void *data)
 {
 	struct psy_for_each_psy_cb_data *cb_data = data;
-	struct power_supply *psy = dev_get_drvdata(dev);
+	struct power_supply *psy = dev_to_psy(dev);
 
 	return cb_data->fn(psy, cb_data->data);
 }
@@ -456,7 +456,7 @@ EXPORT_SYMBOL_GPL(power_supply_set_battery_charged);
 static int power_supply_match_device_by_name(struct device *dev, const void *data)
 {
 	const char *name = data;
-	struct power_supply *psy = dev_get_drvdata(dev);
+	struct power_supply *psy = dev_to_psy(dev);
 
 	return strcmp(psy->desc->name, name) == 0;
 }
@@ -479,7 +479,7 @@ struct power_supply *power_supply_get_by_name(const char *name)
 					       power_supply_match_device_by_name);
 
 	if (dev) {
-		psy = dev_get_drvdata(dev);
+		psy = dev_to_psy(dev);
 		atomic_inc(&psy->use_cnt);
 	}
 
@@ -536,7 +536,7 @@ struct power_supply *power_supply_get_by_phandle(struct device_node *np,
 	of_node_put(power_supply_np);
 
 	if (dev) {
-		psy = dev_get_drvdata(dev);
+		psy = dev_to_psy(dev);
 		atomic_inc(&psy->use_cnt);
 	}
 

-- 
2.47.1


