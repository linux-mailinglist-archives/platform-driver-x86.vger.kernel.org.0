Return-Path: <platform-driver-x86+bounces-15102-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D5201C25EA6
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Oct 2025 16:55:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2FF7C34A485
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Oct 2025 15:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DF12EA75C;
	Fri, 31 Oct 2025 15:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b="1ahXdwRK"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40FB239E76;
	Fri, 31 Oct 2025 15:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761926109; cv=pass; b=d+FvGKuh/BdklkzZe5afKjyb07hVpVS5/Lh2jJMa0P1Vq7eiwwkTBYJM9WHAvJ1ZhWesupco9YpxO0reuk8VJoQrHrdvtGSBuhICy+l1L/f+m/TC3kl7WTSSTo6sAUIS1jrK27DM7ijm7+cMwetAEG/PlOhvfCRmGev1E4n6hoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761926109; c=relaxed/simple;
	bh=0mE4wBeNEyooEvMvVWPOayHCks1aj7H0cLRaEfRh4N0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXc5lGbZhbzkLRWQQpg8egbDHFl9RVbRicAUFUNNGv1rPuE+k4oQBco0pjPrVu0U4uBNU9mE7Hn3fdKk1CPLqoxj68Pvyeg2Y/NW8/viUeLn3tUU86CyQLOimNCTT2eBJtkdTbb801IC5F+y+aaTkLIryNHvmWQ4e52Hx7eeMpc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (1024-bit key) header.d=rong.moe header.i=i@rong.moe header.b=1ahXdwRK; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1761926082; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gRyD1ocpHvwgqG4IGO3jfCr6CZABOanxgEdZkJUWBiQGyFetMUIEpc5mDwUozUImvIfVUQxrouwX23KOItW/kP7wCC/1Tlrh83DxSAmrGOqfsYSLjV+Owl0CnILMgiEw3h3mC/KOKCabYI8AalDb9g2Un+jNDvGBlJhKqF/PqJA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761926082; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M/21GbEz7v4egDSYjxMMIl44RR028hAfA40FFq+UbOo=; 
	b=fpZaRPOmNWbACQNr0OVLTxpQk4yDAXUSIXfjUgVHPbyVOibd7cQLN5gvU7dMtu0A9Aq1w1505QliR6YCM2SQFK4yLVKnLtAXqU+n5Qc0DYmnZ5fuedjN0bexjcbpRZzk8DwZiDhd34hGjs/4T1FSvkCvQD83Bgjnhv05+6u+KTg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761926082;
	s=zmail; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=M/21GbEz7v4egDSYjxMMIl44RR028hAfA40FFq+UbOo=;
	b=1ahXdwRKrORqQhdGeoBH0QbAwDWJYxO/TKrYoFMIowsPVZKJ5iPKrKD61Pl6WELk
	/GqYtV6HTbLVBElb5959C9ZOzLz9N2/xmo5WC55+1b+8u+i4VfL0rOKCMbqwy9utZoW
	bMGcPRlgDavObwSJNoCnMh4bKUPwR81eRcNQNk1o=
Received: by mx.zohomail.com with SMTPS id 1761926080899484.2326149301499;
	Fri, 31 Oct 2025 08:54:40 -0700 (PDT)
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
Subject: [PATCH v3 5/6] platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
Date: Fri, 31 Oct 2025 23:51:55 +0800
Message-ID: <20251031155349.24693-6-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251031155349.24693-1-i@rong.moe>
References: <20251031155349.24693-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Add support for LENOVO_FAN_TEST_DATA WMI data block. Provides an
interface for querying the min/max fan speed RPM (reference data) of a
given fan ID.

Signed-off-by: Rong Zhang <i@rong.moe>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
Changes in v2:
- Reword documentation
---
 .../wmi/devices/lenovo-wmi-other.rst          |  17 +++
 drivers/platform/x86/lenovo/wmi-capdata.c     | 102 ++++++++++++++++++
 drivers/platform/x86/lenovo/wmi-capdata.h     |   8 ++
 3 files changed, 127 insertions(+)

diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index fcad595d49af..821282e07d93 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -62,6 +62,13 @@ The following firmware-attributes are implemented:
  - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
  - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
 
+LENOVO_FAN_TEST_DATA
+-------------------------
+
+WMI GUID ``B642801B-3D21-45DE-90AE-6E86F164FB21``
+
+The LENOVO_FAN_TEST_DATA interface provides reference data for self-test of
+cooling fans.
 
 WMI interface description
 =========================
@@ -115,3 +122,13 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
     [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataSize")] uint8 DefaultValue[];
   };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of Fan Test Data"), guid("{B642801B-3D21-45DE-90AE-6E86F164FB21}")]
+  class LENOVO_FAN_TEST_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+    [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
+    [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
+    [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
+    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+  };
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform/x86/lenovo/wmi-capdata.c
index e8ec30701d88..e456aace87f2 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.c
+++ b/drivers/platform/x86/lenovo/wmi-capdata.c
@@ -13,6 +13,10 @@
  * attribute has multiple pages, one for each of the thermal modes managed by
  * the Gamezone interface.
  *
+ * Fan Test Data includes the max/min fan speed RPM for each fan. This is
+ * reference data for self-test. If the fan is in good condition, it is capable
+ * to spin faster than max RPM or slower than min RPM.
+ *
  * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
  *   - Initial implementation (formerly named lenovo-wmi-capdata01)
  *
@@ -41,6 +45,7 @@
 
 #define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB300E"
 #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE018154"
+#define LENOVO_FAN_TEST_DATA_GUID "B642801B-3D21-45DE-90AE-6E86F164FB21"
 
 #define ACPI_AC_CLASS "ac_adapter"
 #define ACPI_AC_NOTIFY_STATUS 0x80
@@ -48,6 +53,7 @@
 enum lwmi_cd_type {
 	LENOVO_CAPABILITY_DATA_00,
 	LENOVO_CAPABILITY_DATA_01,
+	LENOVO_FAN_TEST_DATA,
 };
 
 #define LWMI_CD_TABLE_ITEM(_type)		\
@@ -64,6 +70,7 @@ static const struct lwmi_cd_info {
 } lwmi_cd_table[] = {
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
 	LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
+	LWMI_CD_TABLE_ITEM(LENOVO_FAN_TEST_DATA),
 };
 
 struct lwmi_cd_priv {
@@ -80,6 +87,7 @@ struct cd_list {
 	union {
 		DECLARE_FLEX_ARRAY(struct capdata00, cd00);
 		DECLARE_FLEX_ARRAY(struct capdata01, cd01);
+		DECLARE_FLEX_ARRAY(struct capdata_fan, cd_fan);
 	};
 };
 
@@ -108,6 +116,14 @@ static int lwmi_cd_component_bind(struct device *cd_dev,
 	case LENOVO_CAPABILITY_DATA_01:
 		binder->cd01_list = priv->list;
 		break;
+	case LENOVO_FAN_TEST_DATA:
+		/*
+		 * Do not expose dummy data.
+		 * See also lwmi_cd_fan_list_alloc_cache().
+		 */
+		if (priv->list->count)
+			binder->cd_fan_list = priv->list;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -152,6 +168,9 @@ EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CD");
 DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01);
 EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
 
+DEF_LWMI_CDXX_GET_DATA(cd_fan, LENOVO_FAN_TEST_DATA, struct capdata_fan);
+EXPORT_SYMBOL_NS_GPL(lwmi_cd_fan_get_data, "LENOVO_WMI_CD");
+
 /**
  * lwmi_cd_cache() - Cache all WMI data block information
  * @priv: lenovo-wmi-capdata driver data.
@@ -175,6 +194,9 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 		p = &priv->list->cd01[0];
 		size = sizeof(priv->list->cd01[0]);
 		break;
+	case LENOVO_FAN_TEST_DATA:
+		/* Done by lwmi_cd_alloc() => lwmi_cd_fan_list_alloc_cache(). */
+		return 0;
 	default:
 		return -EINVAL;
 	}
@@ -197,6 +219,78 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
 	return 0;
 }
 
+/**
+ * lwmi_cd_fan_list_alloc_cache() - Alloc and cache Fan Test Data list
+ * @priv: lenovo-wmi-capdata driver data.
+ * @listptr: Pointer to returned cd_list pointer.
+ *
+ * Return: count of fans found, or an error.
+ */
+static int lwmi_cd_fan_list_alloc_cache(struct lwmi_cd_priv *priv, struct cd_list **listptr)
+{
+	u32 count, *fan_ids, *fan_min_rpms, *fan_max_rpms;
+	union acpi_object *ret_obj __free(kfree) = NULL;
+	struct block { u32 nr; u32 data[]; } *block;
+	struct cd_list *list;
+	size_t size;
+	int idx;
+
+	ret_obj = wmidev_block_query(priv->wdev, 0);
+	if (!ret_obj)
+		return -ENODEV;
+
+	/*
+	 * This is usually caused by a dummy ACPI method. Do not return an error
+	 * as failing to probe this device will result in master driver being
+	 * unbound - this behavior aligns with lwmi_cd_cache().
+	 */
+	if (ret_obj->type != ACPI_TYPE_BUFFER) {
+		count = 0;
+		goto alloc;
+	}
+
+	size = ret_obj->buffer.length;
+	block = (struct block *)ret_obj->buffer.pointer;
+
+	count = size >= sizeof(*block) ? block->nr : 0;
+	if (size < struct_size(block, data, count * 3)) {
+		dev_warn(&priv->wdev->dev,
+			 "incomplete fan test data block: %zu < %zu, ignoring\n",
+			 size, struct_size(block, data, count * 3));
+		count = 0;
+	}
+
+	if (count == 0)
+		goto alloc;
+
+	if (count > U8_MAX) {
+		dev_warn(&priv->wdev->dev,
+			 "too many fans reported: %u > %u, truncating\n",
+			 count, U8_MAX);
+		count = U8_MAX;
+	}
+
+	fan_ids = &block->data[0];
+	fan_max_rpms = &block->data[count];
+	fan_min_rpms = &block->data[count * 2];
+
+alloc:
+	list = devm_kzalloc(&priv->wdev->dev, struct_size(list, cd_fan, count), GFP_KERNEL);
+	if (!list)
+		return -ENOMEM;
+
+	for (idx = 0; idx < count; idx++) {
+		list->cd_fan[idx] = (struct capdata_fan) {
+			.id = fan_ids[idx],
+			.min_rpm = fan_min_rpms[idx],
+			.max_rpm = fan_max_rpms[idx],
+		};
+	}
+
+	*listptr = list;
+	return count;
+}
+
 /**
  * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
  * @priv: lenovo-wmi-capdata driver data.
@@ -222,6 +316,12 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	case LENOVO_CAPABILITY_DATA_01:
 		list_size = struct_size(list, cd01, count);
 		break;
+	case LENOVO_FAN_TEST_DATA:
+		count = lwmi_cd_fan_list_alloc_cache(priv, &list);
+		if (count < 0)
+			return count;
+
+		goto got_list;
 	default:
 		return -EINVAL;
 	}
@@ -230,6 +330,7 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, enum lwmi_cd_type type)
 	if (!list)
 		return -ENOMEM;
 
+got_list:
 	ret = devm_mutex_init(&priv->wdev->dev, &list->list_mutex);
 	if (ret)
 		return ret;
@@ -368,6 +469,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
 static const struct wmi_device_id lwmi_cd_id_table[] = {
 	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
 	{ LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
+	{ LWMI_CD_WDEV_ID(LENOVO_FAN_TEST_DATA) },
 	{}
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform/x86/lenovo/wmi-capdata.h
index a6f0cb006e74..52bc215ac43d 100644
--- a/drivers/platform/x86/lenovo/wmi-capdata.h
+++ b/drivers/platform/x86/lenovo/wmi-capdata.h
@@ -26,13 +26,21 @@ struct capdata01 {
 	u32 max_value;
 };
 
+struct capdata_fan {
+	u32 id;
+	u32 min_rpm;
+	u32 max_rpm;
+};
+
 struct lwmi_cd_binder {
 	struct cd_list *cd00_list;
 	struct cd_list *cd01_list;
+	struct cd_list *cd_fan_list;
 };
 
 int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct capdata00 *output);
 int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct capdata01 *output);
+int lwmi_cd_fan_get_data(struct cd_list *list, u32 attribute_id, struct capdata_fan *output);
 void lwmi_cd_match_add_all(struct device *master, struct component_match **matchptr);
 
 #endif /* !_LENOVO_WMI_CAPDATA_H_ */
-- 
2.51.0


