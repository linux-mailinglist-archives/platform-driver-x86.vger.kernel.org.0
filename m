Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA2334A9160
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Feb 2022 01:03:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356116AbiBDADe (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Feb 2022 19:03:34 -0500
Received: from mga01.intel.com ([192.55.52.88]:8517 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356104AbiBDADc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 19:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643933012; x=1675469012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VffKzQLRtyVZULvG4LXAW7g/t/tYRyIEC1MPKKJZ+6s=;
  b=J1LcOjT15T7nfTrEa8vD0bfRJpgFEDmzNYqpEvyu9xmdYclofRhHyzS+
   GQhAi+ax+iFanzh649iOYPYGIyWPxOaLtK0pR1UeJmWSYqicqIKF883bx
   qOtTTGG/7fQNKlJmxB5oxeeHSyUR4/MOVuGUAwPaMBWfiVliwqOxMSFBl
   aGrVn9vz9TDVYt0O/NOrx4S98uA4Dx9q3lvaDT8YrLBpdOw2j4DdOn+PV
   fXmln6c7W7PIePXBtsZvXbfLnqAfOxCDnoTI1XOyCDJgMa9Ayr2D8Jqsi
   UzGELpEivT8e0Tc5d/AeK0/7ZvhS0YxQN4B7PmAanExK181NvJZSgGIvy
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="272779959"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="272779959"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 16:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="620684679"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2022 16:03:31 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH 3/4] platform/x86/intel/uncore-freq: Display uncore current frequency
Date:   Thu,  3 Feb 2022 16:03:05 -0800
Message-Id: <20220204000306.2517447-4-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
References: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@intel.com>

Add a new sysfs attribute "current_freq_khz" to display current uncore
frequency. This value is read from MSR 0x621.

Root user permission is required to read uncore current frequency.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 .../intel/uncore-frequency/uncore-frequency.c | 71 ++++++++++++++++---
 1 file changed, 62 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 35b00608a81d..f5e980163911 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -22,6 +22,7 @@
 #include <asm/intel-family.h>
 
 #define MSR_UNCORE_RATIO_LIMIT			0x620
+#define MSR_UNCORE_PERF_STATUS			0x621
 #define UNCORE_FREQ_KHZ_MULTIPLIER		100000
 
 /**
@@ -40,6 +41,7 @@
  * @mix_freq_khz_dev_attr: Storage for device attribute min_freq_khz
  * @initial_max_freq_khz_dev_attr: Storage for device attribute initial_max_freq_khz
  * @initial_min_freq_khz_dev_attr: Storage for device attribute initial_min_freq_khz
+ * @current_freq_khz_dev_attr: Storage for device attribute current_freq_khz
  * @uncore_attrs:	Attribute storage for group creation
  *
  * This structure is used to encapsulate all data related to uncore sysfs
@@ -60,7 +62,8 @@ struct uncore_data {
 	struct device_attribute min_freq_khz_dev_attr;
 	struct device_attribute initial_max_freq_khz_dev_attr;
 	struct device_attribute initial_min_freq_khz_dev_attr;
-	struct attribute *uncore_attrs[5];
+	struct device_attribute current_freq_khz_dev_attr;
+	struct attribute *uncore_attrs[6];
 };
 
 /* Max instances for uncore data, one for each die */
@@ -131,22 +134,32 @@ static int uncore_write_ratio(struct uncore_data *data, unsigned int input,
 	return 0;
 }
 
-static ssize_t show_min_max_freq_khz(struct uncore_data *data,
-				     char *buf, int min_max)
+static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
 {
-	unsigned int min, max;
+	u64 ratio;
+	int ret;
+
+	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_PERF_STATUS, &ratio);
+	if (ret)
+		return ret;
+
+	*freq = (ratio & 0x7F) * UNCORE_FREQ_KHZ_MULTIPLIER;
+
+	return 0;
+}
+
+static ssize_t show_perf_status_freq_khz(struct uncore_data *data, char *buf)
+{
+	unsigned int freq;
 	int ret;
 
 	mutex_lock(&uncore_lock);
-	ret = uncore_read_ratio(data, &min, &max);
+	ret = uncore_read_freq(data, &freq);
 	mutex_unlock(&uncore_lock);
 	if (ret)
 		return ret;
 
-	if (min_max)
-		return sprintf(buf, "%u\n", max);
-
-	return sprintf(buf, "%u\n", min);
+	return sprintf(buf, "%u\n", freq);
 }
 
 static ssize_t store_min_max_freq_khz(struct uncore_data *data,
@@ -165,6 +178,24 @@ static ssize_t store_min_max_freq_khz(struct uncore_data *data,
 	return count;
 }
 
+static ssize_t show_min_max_freq_khz(struct uncore_data *data,
+				     char *buf, int min_max)
+{
+	unsigned int min, max;
+	int ret;
+
+	mutex_lock(&uncore_lock);
+	ret = uncore_read_ratio(data, &min, &max);
+	mutex_unlock(&uncore_lock);
+	if (ret)
+		return ret;
+
+	if (min_max)
+		return sprintf(buf, "%u\n", max);
+
+	return sprintf(buf, "%u\n", min);
+}
+
 #define store_uncore_min_max(name, min_max)				\
 	static ssize_t store_##name(struct device *dev,		\
 				    struct device_attribute *attr,	\
@@ -185,12 +216,23 @@ static ssize_t store_min_max_freq_khz(struct uncore_data *data,
 		return show_min_max_freq_khz(data, buf, min_max);	\
 	}
 
+#define show_uncore_perf_status(name)					\
+	static ssize_t show_##name(struct device *dev,		\
+				   struct device_attribute *attr, char *buf)\
+	{                                                               \
+		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
+									\
+		return show_perf_status_freq_khz(data, buf); \
+	}
+
 store_uncore_min_max(min_freq_khz, 0);
 store_uncore_min_max(max_freq_khz, 1);
 
 show_uncore_min_max(min_freq_khz, 0);
 show_uncore_min_max(max_freq_khz, 1);
 
+show_uncore_perf_status(current_freq_khz);
+
 #define show_uncore_data(member_name)					\
 	static ssize_t show_##member_name(struct device *dev,	\
 					  struct device_attribute *attr, char *buf)\
@@ -223,6 +265,15 @@ show_uncore_data(initial_max_freq_khz);
 		data->_name##_dev_attr.attr.mode = 0444;		\
 	} while (0)
 
+#define init_attribute_root_ro(_name)					\
+	do {								\
+		sysfs_attr_init(&data->_name##_dev_attr.attr);	\
+		data->_name##_dev_attr.show = show_##_name;		\
+		data->_name##_dev_attr.store = NULL;			\
+		data->_name##_dev_attr.attr.name = #_name;		\
+		data->_name##_dev_attr.attr.mode = 0400;		\
+	} while (0)
+
 static int create_attr_group(struct uncore_data *data, char *name)
 {
 	int ret, index = 0;
@@ -231,11 +282,13 @@ static int create_attr_group(struct uncore_data *data, char *name)
 	init_attribute_rw(min_freq_khz);
 	init_attribute_ro(initial_min_freq_khz);
 	init_attribute_ro(initial_max_freq_khz);
+	init_attribute_root_ro(current_freq_khz);
 
 	data->uncore_attrs[index++] = &data->max_freq_khz_dev_attr.attr;
 	data->uncore_attrs[index++] = &data->min_freq_khz_dev_attr.attr;
 	data->uncore_attrs[index++] = &data->initial_min_freq_khz_dev_attr.attr;
 	data->uncore_attrs[index++] = &data->initial_max_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->current_freq_khz_dev_attr.attr;
 	data->uncore_attrs[index] = NULL;
 
 	data->uncore_attr_group.name = name;
-- 
2.31.1

