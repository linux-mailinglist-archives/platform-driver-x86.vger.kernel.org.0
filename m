Return-Path: <platform-driver-x86+bounces-15076-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D1FC2205C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Oct 2025 20:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A70188EEC1
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Oct 2025 19:41:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9B0313268;
	Thu, 30 Oct 2025 19:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="vrasOk0q"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F833126C5;
	Thu, 30 Oct 2025 19:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761853240; cv=pass; b=CQf6kAzco0zsIEJZFa9gTzFPq4t5PuKHrRIhSnAnZ8TP9AuWr1wvCoWvLetvEmjR3pHVOwmJEGLmFLZnd1V6B8HSfyb2NeTyyKTeiw7bE7eT5Qs5FDi2HrSJVQzANb9s+UfWQ2ISL8yHcGZOrYdyiXtqP5XvCgqNkNxy81Ig188=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761853240; c=relaxed/simple;
	bh=6rpCnxSi3VTo56evbz/swMnf5abFzS9PxMvk5BGNWTw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eo9Dc5jBOHxY55fjBWWHsJb0/dOLnCIgVSpCADEq4ryrgxSUoRAAamLHuOcEuKNBciCiqzvddDqJJVy3nX2JrWOPX5O8BVW6j/FJH7YBgzFhgHbigW+ESfLkD7sn2Ex6dVFkSBAK3Y02JyMJCXA/XzGcARlEbeCnGRKlUhpdBw0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=vrasOk0q; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1761853217; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NwzJFCw4l057JcRb1rwJzPPRiJ7ryfjuB85VQVx2v5EenMwhjOo/o8yHdRZRYbz6229cJUfhmPDUBAYj0dCEbbXL9km6yBuRyUESvYpTjG0Igqmi8o6Cd19TWz5y+/pj7Fz4S1vmGLcYgLezCE5FPB9K2TLbIRoZ62MtZCr+7IY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761853217; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U6n4F1lJ7im0nb5+E2keTRxxYloZMzmcQwhCJhwOMOs=; 
	b=jWi/1f4DxzC6vXF2oJW+vJ4R3jlTowc2kU6GRJlXa5j8TXtaqCMTk23bAbGrnx03ZFBtxnmQVCeQ4ULG1X+qsSndeSTTR/yToRja0Oo319pCPcY978c1BRmhOVlqNtKoiVaG/hxOdXCnX0Zg1JavD5eVMz9Jyl3aQR+wqiTU4/o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761853217;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=U6n4F1lJ7im0nb5+E2keTRxxYloZMzmcQwhCJhwOMOs=;
	b=vrasOk0qNEIsnMbLwwdsuKaTNaQHHyOdaL2NcwOCOmC4IU5bJL3bLApVHxVlSvSG
	wXTo4YxorrirEYMxi2OLaffP3/QOaybWwi1m1QXEuZa5WccJiKT9wMjCpGJq4fUNGJN
	K6LGelIkKIK1JngVAfE/Iaf/Nfe+LU8S5dQoJolw=
Received: by mx.zohomail.com with SMTPS id 1761853215208433.41585020643686;
	Thu, 30 Oct 2025 12:40:15 -0700 (PDT)
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
Subject: [PATCH v2 4/6] platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
Date: Fri, 31 Oct 2025 03:39:42 +0800
Message-ID: <20251030193955.107148-5-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030193955.107148-1-i@rong.moe>
References: <20251030193955.107148-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for LENOVO_CAPABILITY_DATA_00 WMI data block that comes on
"Other Mode" enabled hardware. Provides an interface for querying if a
given attribute is supported by the hardware, as well as its default
value.

Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Reword documentation (thanks Derek J. Clark)
---
 .../wmi/devices/lenovo-wmi-other.rst          | 15 ++++++++++---
 drivers/platform/x86/lenovo/wmi-capdata.c     | 21 +++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |  8 +++++++
 3 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index d7928b8dfb4b5..fcad595d49af2 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -31,13 +31,22 @@ under the following path:
 
   /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>/
 
+LENOVO_CAPABILITY_DATA_00
+-------------------------
+
+WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
+
+The LENOVO_CAPABILITY_DATA_00 interface provides various information that
+does not rely on the gamezone thermal mode.
+
 LENOVO_CAPABILITY_DATA_01
 -------------------------
 
 WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
 
-The LENOVO_CAPABILITY_DATA_01 interface provides information on various
-power limits of integrated CPU and GPU components.
+The LENOVO_CAPABILITY_DATA_01 interface provides various information that
+relies on the gamezone thermal mode, including power limits of integrated
+CPU and GPU components.
 
 Each attribute has the following properties:
  - current_value
@@ -48,7 +57,7 @@ Each attribute has the following properties:
  - scalar_increment
  - type
 
-The following attributes are implemented:
+The following firmware-attributes are implemented:
  - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
  - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
  - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index 1f7fc09b7c3f3..e8ec30701d883 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -5,6 +5,9 @@
  * Lenovo Capability Data provides information on tunable attributes used by
  * the "Other Mode" WMI interface.
  *
+ * Capability Data 00 includes if the attribute is supported by the hardware,
+ * and the default_value. All attributes are independent of thermal modes.
+ *
  * Capability Data 01 includes if the attribute is supported by the hardware,
  * and the default_value, max_value, min_value, and step increment. Each
  * attribute has multiple pages, one for each of the thermal modes managed by
@@ -36,12 +39,14 @@
 
 #include "wmi-capdata.h"
 
+#define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
 #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
 
 #define ACPI_AC_CLASS "ac_adapter"
 #define ACPI_AC_NOTIFY_STATUS 0x80
 
 enum lwmi_cd_type {
+	LENOVO_CAPABILITY_DATA_00,
 	LENOVO_CAPABILITY_DATA_01,
 };
 
@@ -57,6 +62,7 @@ static const struct lwmi_cd_info {
 	const char *name;
 	enum lwmi_cd_type type;
 } lwmi_cd_table[] = {
+	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
 };
 
@@ -72,6 +78,7 @@ struct cd_list {
 	u8 count;
 
 	union {
+		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
 		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
 	};
 };
@@ -95,6 +102,9 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	struct lwmi_cd_binder *binder = data;
 
 	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		binder->cd00_list = priv->list;
+		break;
 	case LENOVO_CAPABILITY_DATA_01:
 		binder->cd01_list = priv->list;
 		break;
@@ -136,6 +146,9 @@ static const struct component_ops lwmi_cd_component_ops = {
 		return -EINVAL;									\
 	}
 
+DEF_LWMI_CDXX_GET_DATA(cd00, LENOVO_CAPABILITY_DATA_00, struct capdata00);
+EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CD");
+
 DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
 
@@ -154,6 +167,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	void *p;
 
 	switch (priv->list->type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		p = &priv->list->cd00[0];
+		size = sizeof(priv->list->cd00[0]);
+		break;
 	case LENOVO_CAPABILITY_DATA_01:
 		p = &priv->list->cd01[0];
 		size = sizeof(priv->list->cd01[0]);
@@ -199,6 +216,9 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	count = wmidev_instance_count(priv->wdev);
 
 	switch (type) {
+	case LENOVO_CAPABILITY_DATA_00:
+		list_size = struct_size(list, cd00, count);
+		break;
 	case LENOVO_CAPABILITY_DATA_01:
 		list_size = struct_size(list, cd01, count);
 		break;
@@ -346,6 +366,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 	.context = &lwmi_cd_table[_type]
 
 static const struct wmi_device_id lwmi_cd_id_table[] = {
+	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
 	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
 	{}
 };
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index 1e5fce7836cbf..a6f0cb006e745 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -11,6 +11,12 @@ struct component_match;
 struct device;
 struct cd_list;
 
+struct capdata00 {
+	u32 id;
+	u32 supported;
+	u32 default_value;
+};
+
 struct capdata01 {
 	u32 id;
 	u32 supported;
@@ -21,9 +27,11 @@ struct capdata01 {
 };
 
 struct lwmi_cd_binder {
+	struct cd_list *cd00_list;
 	struct cd_list *cd01_list;
 };
 
+int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct capdata00 *output);
 int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
 
-- 
2.51.0


