Return-Path: <platform-driver-x86+bounces-14822-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1D9BEECC4
	for <lists+platform-driver-x86@lfdr.de>; Sun, 19 Oct 2025 23:05:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802523A182A
	for <lists+platform-driver-x86@lfdr.de>; Sun, 19 Oct 2025 21:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823C4238C07;
	Sun, 19 Oct 2025 21:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="fmJAP9XO"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B58212F98;
	Sun, 19 Oct 2025 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760907927; cv=pass; b=e5b3JSMlmw4zaYeb5H5+hMXCFv0Q3XJRsFaZOC0accW+h/mXvegu62LaMYZy+ZMSjkFImYvqLQyUe3OI40+sq5tWpFYbXlQBIdJ8O/cFPZNPlftpzjxLNR7LqX9KjDAP8ehccVPEDszEvCCe6vv2SlbJ8998aSeJnWh7pVJo65Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760907927; c=relaxed/simple;
	bh=k7bo9PRwCOQ2W+etc1f8ScUXVKe1VsbZKoGxR9jR+0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f80TObFw5CKEQtRK5pKGbm8ElPhAyAEocPqwYBbSmB5ZNDp6J+na0D7ZOyPcexJiViKHpqKNugZDT+EUOLxYPDuY52z256UB1DVM85riY6rBi7xD4x8aXej0DgVTaUZN++7e/uuIqPlb2O5uBEDVHD1yxa7zS+HU9oY2nG3NGgE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=fmJAP9XO; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1760907904; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bYcIhvc/u3SFdlyHCouMeWBtAZgOKXKFGCUVGY2e2Sizdieu6clceZeEIX2VLC+3iWfoSo1pGTX9hJN3lCFbLUb4CcDrs+y3JSm+aRL6LbLV11YEnSA+ohxHFrs3Q8FjeVSRXf0XVNZ45DJ5uWsmpIYpm6oEFcNFcCmDvJn74sA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1760907904; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IJV5Js/TF9mqK83N3M6zAR9IOwC90FeMRWvvLTB+umA=; 
	b=Iv8WZfqpSJPzEwmnOFgFJEpLOo/hELAjI/susqF6HVEG8r3fjUO5JdO28w3X+xhoeDTvMFTGrhs818kA6PG+Q5cMNkxA5dEXKT0YfjtMAZWUnpctGAadnuhu5WR/DkNdtcfJC6QeucPUbqltpSxzRwGqHuWfLjhrJ2pSd6i1L5A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1760907904;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=IJV5Js/TF9mqK83N3M6zAR9IOwC90FeMRWvvLTB+umA=;
	b=fmJAP9XOAOWlHb6nFhau5VqUReti3e77hf8G4H6iyPRs4Alb/n8itYveEWdZaUTl
	FKxj8sHcBTPAjfxuwUf0WC0rN8IDJwKPdymEM+Q9hEVHZpX7l6tbS8du4ZcDPpc6nVw
	PtefEGgpzcOidaOrhelLDk8yR4KvTBs+AI+XW3H4=
Received: by mx.zohomail.com with SMTPS id 1760907901158161.83146022522897;
	Sun, 19 Oct 2025 14:05:01 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Rong Zhang <i@rong.moe>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 1/6] platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
Date: Mon, 20 Oct 2025 05:04:44 +0800
Message-ID: <20251019210450.88830-2-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251019210450.88830-1-i@rong.moe>
References: <20251019210450.88830-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Prepare for the upcoming changes to make it suitable to retrieve
and provide other Capability Data as well.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/Kconfig           |   4 +-
 drivers/platform/x86/lenovo/Makefile          |   2 +-
 .../lenovo/{wmi-capdata01.c => wmi-capdata.c} | 124 +++++++++---------
 .../lenovo/{wmi-capdata01.h => wmi-capdata.h} |  10 +-
 drivers/platform/x86/lenovo/wmi-other.c       |  11 +-
 5 files changed, 78 insertions(+), 73 deletions(-)
 rename drivers/platform/x86/lenovo/{wmi-capdata01.c => wmi-capdata.c} (60%)
 rename drivers/platform/x86/lenovo/{wmi-capdata01.h => wmi-capdata.h} (60%)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index d22b774e0236f..fb96a0f908f03 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -233,7 +233,7 @@ config YT2_1380
 	  To compile this driver as a module, choose M here: the module will
 	  be called lenovo-yogabook.
 
-config LENOVO_WMI_DATA01
+config LENOVO_WMI_DATA
 	tristate
 	depends on ACPI_WMI
 
@@ -264,7 +264,7 @@ config LENOVO_WMI_TUNING
 	tristate "Lenovo Other Mode WMI Driver"
 	depends on ACPI_WMI
 	select FW_ATTR_CLASS
-	select LENOVO_WMI_DATA01
+	select LENOVO_WMI_DATA
 	select LENOVO_WMI_EVENTS
 	select LENOVO_WMI_HELPERS
 	help
diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
index 7b2128e3a2142..29014d8c1376d 100644
--- a/drivers/platform/x86/lenovo/Makefile
+++ b/drivers/platform/x86/lenovo/Makefile
@@ -12,7 +12,7 @@ lenovo-target-$(CONFIG_LENOVO_YMC)	+= ymc.o
 lenovo-target-$(CONFIG_YOGABOOK)	+= yogabook.o
 lenovo-target-$(CONFIG_YT2_1380)	+= yoga-tab2-pro-1380-fastcharger.o
 lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)	+= wmi-camera.o
-lenovo-target-$(CONFIG_LENOVO_WMI_DATA01)	+= wmi-capdata01.o
+lenovo-target-$(CONFIG_LENOVO_WMI_DATA)		+= wmi-capdata.o
 lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)	+= wmi-events.o
 lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)	+= wmi-helpers.o
 lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)	+= wmi-gamezone.o
diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.c b/drivers/platform/x86/lenovo/wmi-capdata.c
similarity index 60%
rename from drivers/platform/x86/lenovo/wmi-capdata01.c
rename to drivers/platform/x86/lenovo/wmi-capdata.c
index fc7e3454e71dc..c5e74b2bfeb36 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata01.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -1,14 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Lenovo Capability Data 01 WMI Data Block driver.
+ * Lenovo Capability Data WMI Data Block driver.
  *
- * Lenovo Capability Data 01 provides information on tunable attributes used by
- * the "Other Mode" WMI interface. The data includes if the attribute is
- * supported by the hardware, the default_value, max_value, min_value, and step
- * increment. Each attribute has multiple pages, one for each of the thermal
- * modes managed by the Gamezone interface.
+ * Lenovo Capability Data provides information on tunable attributes used by
+ * the "Other Mode" WMI interface.
+ *
+ * Capability Data 01 includes if the attribute is supported by the hardware,
+ * and the default_value, max_value, min_value, and step increment. Each
+ * attribute has multiple pages, one for each of the thermal modes managed by
+ * the Gamezone interface.
  *
  * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
+ *   - Initial implementation (formerly named lenovo-wmi-capdata01)
  */
 
 #include <linux/acpi.h>
@@ -26,55 +29,55 @@
 #include <linux/types.h>
 #include <linux/wmi.h>
 
-#include "wmi-capdata01.h"
+#include "wmi-capdata.h"
 
 #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
 
 #define ACPI_AC_CLASS "ac_adapter"
 #define ACPI_AC_NOTIFY_STATUS 0x80
 
-struct lwmi_cd01_priv {
+struct lwmi_cd_priv {
 	struct notifier_block acpi_nb; /* ACPI events */
 	struct wmi_device *wdev;
-	struct cd01_list *list;
+	struct cd_list *list;
 };
 
-struct cd01_list {
+struct cd_list {
 	struct mutex list_mutex; /* list R/W mutex */
 	u8 count;
 	struct capdata01 data[];
 };
 
 /**
- * lwmi_cd01_component_bind() - Bind component to master device.
- * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent device.
+ * lwmi_cd_component_bind() - Bind component to master device.
+ * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
  * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
- * @data: capdata01_list object pointer used to return the capability data.
+ * @data: cd_list object pointer used to return the capability data.
  *
- * On lenovo-wmi-other's master bind, provide a pointer to the local capdata01
- * list. This is used to call lwmi_cd01_get_data to look up attribute data
+ * On lenovo-wmi-other's master bind, provide a pointer to the local capdata
+ * list. This is used to call lwmi_cd*_get_data to look up attribute data
  * from the lenovo-wmi-other driver.
  *
  * Return: 0
  */
-static int lwmi_cd01_component_bind(struct device *cd01_dev,
-				    struct device *om_dev, void *data)
+static int lwmi_cd_component_bind(struct device *cd_dev,
+				  struct device *om_dev, void *data)
 {
-	struct lwmi_cd01_priv *priv = dev_get_drvdata(cd01_dev);
-	struct cd01_list **cd01_list = data;
+	struct lwmi_cd_priv *priv = dev_get_drvdata(cd_dev);
+	struct cd_list **cd_list = data;
 
-	*cd01_list = priv->list;
+	*cd_list = priv->list;
 
 	return 0;
 }
 
-static const struct component_ops lwmi_cd01_component_ops = {
-	.bind = lwmi_cd01_component_bind,
+static const struct component_ops lwmi_cd_component_ops = {
+	.bind = lwmi_cd_component_bind,
 };
 
 /**
  * lwmi_cd01_get_data - Get the data of the specified attribute
- * @list: The lenovo-wmi-capdata01 pointer to its cd01_list struct.
+ * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
  * @attribute_id: The capdata attribute ID to be found.
  * @output: Pointer to a capdata01 struct to return the data.
  *
@@ -83,7 +86,7 @@ static const struct component_ops lwmi_cd01_component_ops = {
  *
  * Return: 0 on success, or -EINVAL.
  */
-int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct capdata01 *output)
+int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output)
 {
 	u8 idx;
 
@@ -97,17 +100,17 @@ int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct capdata0
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD01");
+EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
 
 /**
- * lwmi_cd01_cache() - Cache all WMI data block information
- * @priv: lenovo-wmi-capdata01 driver data.
+ * lwmi_cd_cache() - Cache all WMI data block information
+ * @priv: lenovo-wmi-capdata driver data.
  *
  * Loop through each WMI data block and cache the data.
  *
  * Return: 0 on success, or an error.
  */
-static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
+static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 {
 	int idx;
 
@@ -131,17 +134,17 @@ static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
 }
 
 /**
- * lwmi_cd01_alloc() - Allocate a cd01_list struct in drvdata
- * @priv: lenovo-wmi-capdata01 driver data.
+ * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
+ * @priv: lenovo-wmi-capdata driver data.
  *
- * Allocate a cd01_list struct large enough to contain data from all WMI data
+ * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface.
  *
  * Return: 0 on success, or an error.
  */
-static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
+static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
 {
-	struct cd01_list *list;
+	struct cd_list *list;
 	size_t list_size;
 	int count, ret;
 
@@ -163,28 +166,28 @@ static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
 }
 
 /**
- * lwmi_cd01_setup() - Cache all WMI data block information
- * @priv: lenovo-wmi-capdata01 driver data.
+ * lwmi_cd_setup() - Cache all WMI data block information
+ * @priv: lenovo-wmi-capdata driver data.
  *
- * Allocate a cd01_list struct large enough to contain data from all WMI data
+ * Allocate a cd_list struct large enough to contain data from all WMI data
  * blocks provided by the interface. Then loop through each data block and
  * cache the data.
  *
  * Return: 0 on success, or an error code.
  */
-static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
+static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
 {
 	int ret;
 
-	ret = lwmi_cd01_alloc(priv);
+	ret = lwmi_cd_alloc(priv);
 	if (ret)
 		return ret;
 
-	return lwmi_cd01_cache(priv);
+	return lwmi_cd_cache(priv);
 }
 
 /**
- * lwmi_cd01_notifier_call() - Call method for lenovo-wmi-capdata01 driver notifier.
+ * lwmi_cd01_notifier_call() - Call method for cd01 notifier.
  * block call chain.
  * @nb: The notifier_block registered to lenovo-wmi-events driver.
  * @action: Unused.
@@ -199,17 +202,17 @@ static int lwmi_cd01_notifier_call(struct notifier_block *nb, unsigned long acti
 				   void *data)
 {
 	struct acpi_bus_event *event = data;
-	struct lwmi_cd01_priv *priv;
+	struct lwmi_cd_priv *priv;
 	int ret;
 
 	if (strcmp(event->device_class, ACPI_AC_CLASS) != 0)
 		return NOTIFY_DONE;
 
-	priv = container_of(nb, struct lwmi_cd01_priv, acpi_nb);
+	priv = container_of(nb, struct lwmi_cd_priv, acpi_nb);
 
 	switch (event->type) {
 	case ACPI_AC_NOTIFY_STATUS:
-		ret = lwmi_cd01_cache(priv);
+		ret = lwmi_cd_cache(priv);
 		if (ret)
 			return NOTIFY_BAD;
 
@@ -230,10 +233,9 @@ static void lwmi_cd01_unregister(void *data)
 	unregister_acpi_notifier(acpi_nb);
 }
 
-static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context)
-
+static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
 {
-	struct lwmi_cd01_priv *priv;
+	struct lwmi_cd_priv *priv;
 	int ret;
 
 	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
@@ -243,7 +245,7 @@ static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context)
 	priv->wdev = wdev;
 	dev_set_drvdata(&wdev->dev, priv);
 
-	ret = lwmi_cd01_setup(priv);
+	ret = lwmi_cd_setup(priv);
 	if (ret)
 		return ret;
 
@@ -257,27 +259,27 @@ static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context)
 	if (ret)
 		return ret;
 
-	return component_add(&wdev->dev, &lwmi_cd01_component_ops);
+	return component_add(&wdev->dev, &lwmi_cd_component_ops);
 }
 
-static void lwmi_cd01_remove(struct wmi_device *wdev)
+static void lwmi_cd_remove(struct wmi_device *wdev)
 {
-	component_del(&wdev->dev, &lwmi_cd01_component_ops);
+	component_del(&wdev->dev, &lwmi_cd_component_ops);
 }
 
-static const struct wmi_device_id lwmi_cd01_id_table[] = {
+static const struct wmi_device_id lwmi_cd_id_table[] = {
 	{ LENOVO_CAPABILITY_DATA_01_GUID, NULL },
 	{}
 };
 
-static struct wmi_driver lwmi_cd01_driver = {
+static struct wmi_driver lwmi_cd_driver = {
 	.driver = {
-		.name = "lenovo_wmi_cd01",
+		.name = "lenovo_wmi_cd",
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
-	.id_table = lwmi_cd01_id_table,
-	.probe = lwmi_cd01_probe,
-	.remove = lwmi_cd01_remove,
+	.id_table = lwmi_cd_id_table,
+	.probe = lwmi_cd_probe,
+	.remove = lwmi_cd_remove,
 	.no_singleton = true,
 };
 
@@ -290,13 +292,13 @@ static struct wmi_driver lwmi_cd01_driver = {
  */
 int lwmi_cd01_match(struct device *dev, void *data)
 {
-	return dev->driver == &lwmi_cd01_driver.driver;
+	return dev->driver == &lwmi_cd_driver.driver;
 }
-EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
+EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD");
 
-module_wmi_driver(lwmi_cd01_driver);
+module_wmi_driver(lwmi_cd_driver);
 
-MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
+MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
-MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
+MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.h b/drivers/platform/x86/lenovo/wmi-capdata.h
similarity index 60%
rename from drivers/platform/x86/lenovo/wmi-capdata01.h
rename to drivers/platform/x86/lenovo/wmi-capdata.h
index bd06c5751f68b..2a4746e38ad43 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata01.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -2,13 +2,13 @@
 
 /* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
 
-#ifndef _LENOVO_WMI_CAPDATA01_H_
-#define _LENOVO_WMI_CAPDATA01_H_
+#ifndef _LENOVO_WMI_CAPDATA_H_
+#define _LENOVO_WMI_CAPDATA_H_
 
 #include <linux/types.h>
 
 struct device;
-struct cd01_list;
+struct cd_list;
 
 struct capdata01 {
 	u32 id;
@@ -19,7 +19,7 @@ struct capdata01 {
 	u32 max_value;
 };
 
-int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct capdata01 *output);
+int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
 int lwmi_cd01_match(struct device *dev, void *data);
 
-#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
+#endif /* !_LENOVO_WMI_CAPDATA_H_ */
diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index 2a960b278f117..c6dc1b4cff841 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -34,7 +34,7 @@
 #include <linux/types.h>
 #include <linux/wmi.h>
 
-#include "wmi-capdata01.h"
+#include "wmi-capdata.h"
 #include "wmi-events.h"
 #include "wmi-gamezone.h"
 #include "wmi-helpers.h"
@@ -74,7 +74,10 @@ enum attribute_property {
 
 struct lwmi_om_priv {
 	struct component_master_ops *ops;
-	struct cd01_list *cd01_list; /* only valid after capdata01 bind */
+
+	/* only valid after capdata bind */
+	struct cd_list *cd01_list;
+
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 	struct notifier_block nb;
@@ -576,7 +579,7 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_priv *priv)
 static int lwmi_om_master_bind(struct device *dev)
 {
 	struct lwmi_om_priv *priv = dev_get_drvdata(dev);
-	struct cd01_list *tmp_list;
+	struct cd_list *tmp_list;
 	int ret;
 
 	ret = component_bind_all(dev, &tmp_list);
@@ -657,7 +660,7 @@ static struct wmi_driver lwmi_other_driver = {
 
 module_wmi_driver(lwmi_other_driver);
 
-MODULE_IMPORT_NS("LENOVO_WMI_CD01");
+MODULE_IMPORT_NS("LENOVO_WMI_CD");
 MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
 MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
 MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
-- 
2.51.0


