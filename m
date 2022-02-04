Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92E9A4A9162
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Feb 2022 01:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356112AbiBDADd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Feb 2022 19:03:33 -0500
Received: from mga01.intel.com ([192.55.52.88]:8519 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356105AbiBDADc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 19:03:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643933012; x=1675469012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XBJrLAs7KKxYfRcp9oEMbke9UiyzZW2mbdY6Qxvyhi8=;
  b=NQr8NbvsR1qzP8/yqPQXXCYIRaYh5v4n8oxDgpSQN2ta8wngTP+rnR05
   WYCbw1v5v4NFTrG2fVqmy+MXLNcmaq27yehni3NQ09iQ0jktVJNBIgWyB
   uEXzOwTmMIe/2PZoav04QSp2ZFZQZcd/BcXUpfFqnXdEZYIVUVx2okGL3
   yqroFskB+Mwp2xynVlwuaQlCcKsq/zxXmQ/DpXifGI06759cwrU6UkAA3
   ESVbOXf3nuY8gj6PGe+IpyEXrASBcup1ELnjN8Y+2Mx4PYUkWzgyKhnFg
   wIW8tMocwlLymEs1QUriHcurOxyHdF4Ns7qGEjMLcnK9lO6258rGQWwfn
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="272779962"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="272779962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 16:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="620684684"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2022 16:03:31 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH 4/4] platform/x86/intel-uncore-freq: Split common and enumeration part
Date:   Thu,  3 Feb 2022 16:03:06 -0800
Message-Id: <20220204000306.2517447-5-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
References: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@intel.com>

Split the current driver in two parts:
- Common part: All the commom function other than enumeration function.
- Enumeration/HW specific part: The current enumeration using CPU model
is left in the old module. This uses service of common driver to register
sysfs objects. Also provide callbacks for MSR access related to uncore.
- Add MODULE_DEVICE_TABLE to uncore-frequency.c

No functional changes are expected.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 .../x86/intel/uncore-frequency/Makefile       |   2 +
 .../uncore-frequency-common.c                 | 252 +++++++++++++
 .../uncore-frequency-common.h                 |  62 ++++
 .../intel/uncore-frequency/uncore-frequency.c | 332 +++---------------
 4 files changed, 365 insertions(+), 283 deletions(-)
 create mode 100644 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
 create mode 100644 drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h

diff --git a/drivers/platform/x86/intel/uncore-frequency/Makefile b/drivers/platform/x86/intel/uncore-frequency/Makefile
index e22186a480e2..e0f7968e8285 100644
--- a/drivers/platform/x86/intel/uncore-frequency/Makefile
+++ b/drivers/platform/x86/intel/uncore-frequency/Makefile
@@ -5,3 +5,5 @@
 
 obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)	+= intel-uncore-frequency.o
 intel-uncore-frequency-y		:= uncore-frequency.o
+obj-$(CONFIG_INTEL_UNCORE_FREQ_CONTROL)	+= intel-uncore-frequency-common.o
+intel-uncore-frequency-common-y		:= uncore-frequency-common.o
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
new file mode 100644
index 000000000000..e4d5a7960234
--- /dev/null
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Uncore Frequency Control: Common code implementation
+ * Copyright (c) 2022, Intel Corporation.
+ * All rights reserved.
+ *
+ */
+#include <linux/cpu.h>
+#include <linux/module.h>
+#include "uncore-frequency-common.h"
+
+/* Mutex to control all mutual exclusions */
+static DEFINE_MUTEX(uncore_lock);
+/* Root of the all uncore sysfs kobjs */
+static struct kobject *uncore_root_kobj;
+/* uncore instance count */
+static int uncore_instance_count;
+
+/* callbacks for actual HW read/write */
+static int (*uncore_read)(struct uncore_data *data, unsigned int *min, unsigned int *max);
+static int (*uncore_write)(struct uncore_data *data, unsigned int input, unsigned int min_max);
+static int (*uncore_read_freq)(struct uncore_data *data, unsigned int *freq);
+
+static ssize_t show_min_max_freq_khz(struct uncore_data *data,
+				      char *buf, int min_max)
+{
+	unsigned int min, max;
+	int ret;
+
+	mutex_lock(&uncore_lock);
+	ret = uncore_read(data, &min, &max);
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
+static ssize_t store_min_max_freq_khz(struct uncore_data *data,
+				      const char *buf, ssize_t count,
+				      int min_max)
+{
+	unsigned int input;
+
+	if (kstrtouint(buf, 10, &input))
+		return -EINVAL;
+
+	mutex_lock(&uncore_lock);
+	uncore_write(data, input, min_max);
+	mutex_unlock(&uncore_lock);
+
+	return count;
+}
+
+static ssize_t show_perf_status_freq_khz(struct uncore_data *data, char *buf)
+{
+	unsigned int freq;
+	int ret;
+
+	mutex_lock(&uncore_lock);
+	ret = uncore_read_freq(data, &freq);
+	mutex_unlock(&uncore_lock);
+	if (ret)
+		return ret;
+
+	return sprintf(buf, "%u\n", freq);
+}
+
+#define store_uncore_min_max(name, min_max)				\
+	static ssize_t store_##name(struct device *dev,		\
+				     struct device_attribute *attr,	\
+				     const char *buf, size_t count)	\
+	{								\
+		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
+									\
+		return store_min_max_freq_khz(data, buf, count,	\
+					      min_max);		\
+	}
+
+#define show_uncore_min_max(name, min_max)				\
+	static ssize_t show_##name(struct device *dev,		\
+				    struct device_attribute *attr, char *buf)\
+	{                                                               \
+		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
+									\
+		return show_min_max_freq_khz(data, buf, min_max);	\
+	}
+
+#define show_uncore_perf_status(name)					\
+	static ssize_t show_##name(struct device *dev,		\
+				   struct device_attribute *attr, char *buf)\
+	{                                                               \
+		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
+									\
+		return show_perf_status_freq_khz(data, buf); \
+	}
+
+store_uncore_min_max(min_freq_khz, 0);
+store_uncore_min_max(max_freq_khz, 1);
+
+show_uncore_min_max(min_freq_khz, 0);
+show_uncore_min_max(max_freq_khz, 1);
+
+show_uncore_perf_status(current_freq_khz);
+
+#define show_uncore_data(member_name)					\
+	static ssize_t show_##member_name(struct device *dev,	\
+					   struct device_attribute *attr, char *buf)\
+	{                                                               \
+		struct uncore_data *data = container_of(attr, struct uncore_data,\
+							  member_name##_dev_attr);\
+									\
+		return scnprintf(buf, PAGE_SIZE, "%u\n",		\
+				 data->member_name);			\
+	}								\
+
+show_uncore_data(initial_min_freq_khz);
+show_uncore_data(initial_max_freq_khz);
+
+#define init_attribute_rw(_name)					\
+	do {								\
+		sysfs_attr_init(&data->_name##_dev_attr.attr);	\
+		data->_name##_dev_attr.show = show_##_name;		\
+		data->_name##_dev_attr.store = store_##_name;		\
+		data->_name##_dev_attr.attr.name = #_name;		\
+		data->_name##_dev_attr.attr.mode = 0644;		\
+	} while (0)
+
+#define init_attribute_ro(_name)					\
+	do {								\
+		sysfs_attr_init(&data->_name##_dev_attr.attr);	\
+		data->_name##_dev_attr.show = show_##_name;		\
+		data->_name##_dev_attr.store = NULL;			\
+		data->_name##_dev_attr.attr.name = #_name;		\
+		data->_name##_dev_attr.attr.mode = 0444;		\
+	} while (0)
+
+#define init_attribute_root_ro(_name)					\
+	do {								\
+		sysfs_attr_init(&data->_name##_dev_attr.attr);	\
+		data->_name##_dev_attr.show = show_##_name;		\
+		data->_name##_dev_attr.store = NULL;			\
+		data->_name##_dev_attr.attr.name = #_name;		\
+		data->_name##_dev_attr.attr.mode = 0400;		\
+	} while (0)
+
+static int create_attr_group(struct uncore_data *data, char *name)
+{
+	int ret, index = 0;
+
+	init_attribute_rw(max_freq_khz);
+	init_attribute_rw(min_freq_khz);
+	init_attribute_ro(initial_min_freq_khz);
+	init_attribute_ro(initial_max_freq_khz);
+	init_attribute_root_ro(current_freq_khz);
+
+	data->uncore_attrs[index++] = &data->max_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->min_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->initial_min_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->initial_max_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->current_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index] = NULL;
+
+	data->uncore_attr_group.name = name;
+	data->uncore_attr_group.attrs = data->uncore_attrs;
+	ret = sysfs_create_group(uncore_root_kobj, &data->uncore_attr_group);
+
+	return ret;
+}
+
+static void delete_attr_group(struct uncore_data *data, char *name)
+{
+	sysfs_remove_group(uncore_root_kobj, &data->uncore_attr_group);
+}
+
+int uncore_freq_add_entry(struct uncore_data *data, int cpu)
+{
+	int ret = 0;
+
+	mutex_lock(&uncore_lock);
+	if (data->valid) {
+		/* control cpu changed */
+		data->control_cpu = cpu;
+		goto uncore_unlock;
+	}
+
+	sprintf(data->name, "package_%02d_die_%02d", data->package_id, data->die_id);
+
+	uncore_read(data, &data->initial_min_freq_khz, &data->initial_max_freq_khz);
+
+	ret = create_attr_group(data, data->name);
+	if (!ret) {
+		data->control_cpu = cpu;
+		data->valid = true;
+	}
+
+uncore_unlock:
+	mutex_unlock(&uncore_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(uncore_freq_add_entry, INTEL_UNCORE_FREQUENCY);
+
+void uncore_freq_remove_die_entry(struct uncore_data *data)
+{
+	mutex_lock(&uncore_lock);
+	delete_attr_group(data, data->name);
+	data->control_cpu = -1;
+	data->valid = false;
+	mutex_unlock(&uncore_lock);
+}
+EXPORT_SYMBOL_NS_GPL(uncore_freq_remove_die_entry, INTEL_UNCORE_FREQUENCY);
+
+int uncore_freq_common_init(int (*read_control_freq)(struct uncore_data *data, unsigned int *min, unsigned int *max),
+			     int (*write_control_freq)(struct uncore_data *data, unsigned int input, unsigned int set_max),
+			     int (*read_freq)(struct uncore_data *data, unsigned int *freq))
+{
+	mutex_lock(&uncore_lock);
+
+	uncore_read = read_control_freq;
+	uncore_write = write_control_freq;
+	uncore_read_freq = read_freq;
+
+	if (!uncore_root_kobj)
+		uncore_root_kobj = kobject_create_and_add("intel_uncore_frequency",
+							    &cpu_subsys.dev_root->kobj);
+	if (uncore_root_kobj)
+		++uncore_instance_count;
+	mutex_unlock(&uncore_lock);
+
+	return (!!uncore_root_kobj);
+}
+EXPORT_SYMBOL_NS_GPL(uncore_freq_common_init, INTEL_UNCORE_FREQUENCY);
+
+void uncore_freq_common_exit(void)
+{
+	mutex_lock(&uncore_lock);
+	--uncore_instance_count;
+	if (!uncore_instance_count) {
+		kobject_put(uncore_root_kobj);
+		uncore_root_kobj = NULL;
+	}
+	mutex_unlock(&uncore_lock);
+}
+EXPORT_SYMBOL_NS_GPL(uncore_freq_common_exit, INTEL_UNCORE_FREQUENCY);
+
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel Uncore Frequency Common Module");
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
new file mode 100644
index 000000000000..f5dcfa2fb285
--- /dev/null
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Intel Uncore Frequency Control: Common defines and prototypes
+ * Copyright (c) 2022, Intel Corporation.
+ * All rights reserved.
+ *
+ */
+
+#ifndef __INTEL_UNCORE_FREQ_COMMON_H
+#define __INTEL_UNCORE_FREQ_COMMON_H
+
+#include <linux/device.h>
+
+/**
+ * struct uncore_data - Encapsulate all uncore data
+ * @stored_uncore_data: Last user changed MSR 620 value, which will be restored
+ *			on system resume.
+ * @initial_min_freq_khz: Sampled minimum uncore frequency at driver init
+ * @initial_max_freq_khz: Sampled maximum uncore frequency at driver init
+ * @control_cpu:	Designated CPU for a die to read/write
+ * @valid:		Mark the data valid/invalid
+ * @package_id:	Package id for this instance
+ * @die_id:		Die id for this instance
+ * @name:		Sysfs entry name for this instance
+ * @uncore_attr_group:	Attribute group storage
+ * @max_freq_khz_dev_attr: Storage for device attribute max_freq_khz
+ * @mix_freq_khz_dev_attr: Storage for device attribute min_freq_khz
+ * @initial_max_freq_khz_dev_attr: Storage for device attribute initial_max_freq_khz
+ * @initial_min_freq_khz_dev_attr: Storage for device attribute initial_min_freq_khz
+ * @current_freq_khz_dev_attr: Storage for device attribute current_freq_khz
+ * @uncore_attrs:	Attribute storage for group creation
+ *
+ * This structure is used to encapsulate all data related to uncore sysfs
+ * settings for a die/package.
+ */
+struct uncore_data {
+	u64 stored_uncore_data;
+	u32 initial_min_freq_khz;
+	u32 initial_max_freq_khz;
+	int control_cpu;
+	bool valid;
+	int package_id;
+	int die_id;
+	char name[32];
+
+	struct attribute_group uncore_attr_group;
+	struct device_attribute max_freq_khz_dev_attr;
+	struct device_attribute min_freq_khz_dev_attr;
+	struct device_attribute initial_max_freq_khz_dev_attr;
+	struct device_attribute initial_min_freq_khz_dev_attr;
+	struct device_attribute current_freq_khz_dev_attr;
+	struct attribute *uncore_attrs[6];
+};
+
+int uncore_freq_common_init(int (*read_control_freq)(struct uncore_data *data, unsigned int *min, unsigned int *max),
+			     int (*write_control_freq)(struct uncore_data *data, unsigned int input, unsigned int min_max),
+			     int (*uncore_read_freq)(struct uncore_data *data, unsigned int *freq));
+void uncore_freq_common_exit(void);
+int uncore_freq_add_entry(struct uncore_data *data, int cpu);
+void uncore_freq_remove_die_entry(struct uncore_data *data);
+
+#endif
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index f5e980163911..791af0e287e4 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -21,67 +21,23 @@
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 
-#define MSR_UNCORE_RATIO_LIMIT			0x620
-#define MSR_UNCORE_PERF_STATUS			0x621
-#define UNCORE_FREQ_KHZ_MULTIPLIER		100000
-
-/**
- * struct uncore_data -	Encapsulate all uncore data
- * @stored_uncore_data:	Last user changed MSR 620 value, which will be restored
- *			on system resume.
- * @initial_min_freq_khz: Sampled minimum uncore frequency at driver init
- * @initial_max_freq_khz: Sampled maximum uncore frequency at driver init
- * @control_cpu:	Designated CPU for a die to read/write
- * @valid:		Mark the data valid/invalid
- * @package_id:	Package id for this instance
- * @die_id:		Die id for this instance
- * @name:		Sysfs entry name for this instance
- * @uncore_attr_group:	Attribute group storage
- * @max_freq_khz_dev_attr: Storage for device attribute max_freq_khz
- * @mix_freq_khz_dev_attr: Storage for device attribute min_freq_khz
- * @initial_max_freq_khz_dev_attr: Storage for device attribute initial_max_freq_khz
- * @initial_min_freq_khz_dev_attr: Storage for device attribute initial_min_freq_khz
- * @current_freq_khz_dev_attr: Storage for device attribute current_freq_khz
- * @uncore_attrs:	Attribute storage for group creation
- *
- * This structure is used to encapsulate all data related to uncore sysfs
- * settings for a die/package.
- */
-struct uncore_data {
-	u64 stored_uncore_data;
-	u32 initial_min_freq_khz;
-	u32 initial_max_freq_khz;
-	int control_cpu;
-	bool valid;
-	int package_id;
-	int die_id;
-	char name[32];
-
-	struct attribute_group uncore_attr_group;
-	struct device_attribute max_freq_khz_dev_attr;
-	struct device_attribute min_freq_khz_dev_attr;
-	struct device_attribute initial_max_freq_khz_dev_attr;
-	struct device_attribute initial_min_freq_khz_dev_attr;
-	struct device_attribute current_freq_khz_dev_attr;
-	struct attribute *uncore_attrs[6];
-};
+#include "uncore-frequency-common.h"
 
 /* Max instances for uncore data, one for each die */
 static int uncore_max_entries __read_mostly;
 /* Storage for uncore data for all instances */
 static struct uncore_data *uncore_instances;
-/* Root of the all uncore sysfs kobjs */
-static struct kobject *uncore_root_kobj;
 /* Stores the CPU mask of the target CPUs to use during uncore read/write */
 static cpumask_t uncore_cpu_mask;
 /* CPU online callback register instance */
 static enum cpuhp_state uncore_hp_state __read_mostly;
-/* Mutex to control all mutual exclusions */
-static DEFINE_MUTEX(uncore_lock);
 
-/* Common function to read MSR 0x620 and read min/max */
-static int uncore_read_ratio(struct uncore_data *data, unsigned int *min,
-			     unsigned int *max)
+#define MSR_UNCORE_RATIO_LIMIT	0x620
+#define MSR_UNCORE_PERF_STATUS	0x621
+#define UNCORE_FREQ_KHZ_MULTIPLIER	100000
+
+static int uncore_read_control_freq(struct uncore_data *data, unsigned int *min,
+				    unsigned int *max)
 {
 	u64 cap;
 	int ret;
@@ -99,25 +55,24 @@ static int uncore_read_ratio(struct uncore_data *data, unsigned int *min,
 	return 0;
 }
 
-/* Common function to set min/max ratios to be used by sysfs callbacks */
-static int uncore_write_ratio(struct uncore_data *data, unsigned int input,
-			      int set_max)
+static int uncore_write_control_freq(struct uncore_data *data, unsigned int input,
+				     unsigned int min_max)
 {
 	int ret;
 	u64 cap;
 
-	if (data->control_cpu < 0)
-		return -ENXIO;
-
 	input /= UNCORE_FREQ_KHZ_MULTIPLIER;
 	if (!input || input > 0x7F)
 		return -EINVAL;
 
+	if (data->control_cpu < 0)
+		return -ENXIO;
+
 	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
 	if (ret)
 		return ret;
 
-	if (set_max) {
+	if (min_max) {
 		cap &= ~0x7F;
 		cap |= input;
 	} else  {
@@ -139,6 +94,9 @@ static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
 	u64 ratio;
 	int ret;
 
+	if (data->control_cpu < 0)
+		return -ENXIO;
+
 	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_PERF_STATUS, &ratio);
 	if (ret)
 		return ret;
@@ -148,161 +106,6 @@ static int uncore_read_freq(struct uncore_data *data, unsigned int *freq)
 	return 0;
 }
 
-static ssize_t show_perf_status_freq_khz(struct uncore_data *data, char *buf)
-{
-	unsigned int freq;
-	int ret;
-
-	mutex_lock(&uncore_lock);
-	ret = uncore_read_freq(data, &freq);
-	mutex_unlock(&uncore_lock);
-	if (ret)
-		return ret;
-
-	return sprintf(buf, "%u\n", freq);
-}
-
-static ssize_t store_min_max_freq_khz(struct uncore_data *data,
-				      const char *buf, ssize_t count,
-				      int min_max)
-{
-	unsigned int input;
-
-	if (kstrtouint(buf, 10, &input))
-		return -EINVAL;
-
-	mutex_lock(&uncore_lock);
-	uncore_write_ratio(data, input, min_max);
-	mutex_unlock(&uncore_lock);
-
-	return count;
-}
-
-static ssize_t show_min_max_freq_khz(struct uncore_data *data,
-				     char *buf, int min_max)
-{
-	unsigned int min, max;
-	int ret;
-
-	mutex_lock(&uncore_lock);
-	ret = uncore_read_ratio(data, &min, &max);
-	mutex_unlock(&uncore_lock);
-	if (ret)
-		return ret;
-
-	if (min_max)
-		return sprintf(buf, "%u\n", max);
-
-	return sprintf(buf, "%u\n", min);
-}
-
-#define store_uncore_min_max(name, min_max)				\
-	static ssize_t store_##name(struct device *dev,		\
-				    struct device_attribute *attr,	\
-				    const char *buf, size_t count)	\
-	{								\
-		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
-									\
-		return store_min_max_freq_khz(data, buf, count,	\
-					      min_max);		\
-	}
-
-#define show_uncore_min_max(name, min_max)				\
-	static ssize_t show_##name(struct device *dev,		\
-				   struct device_attribute *attr, char *buf)\
-	{                                                               \
-		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
-									\
-		return show_min_max_freq_khz(data, buf, min_max);	\
-	}
-
-#define show_uncore_perf_status(name)					\
-	static ssize_t show_##name(struct device *dev,		\
-				   struct device_attribute *attr, char *buf)\
-	{                                                               \
-		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
-									\
-		return show_perf_status_freq_khz(data, buf); \
-	}
-
-store_uncore_min_max(min_freq_khz, 0);
-store_uncore_min_max(max_freq_khz, 1);
-
-show_uncore_min_max(min_freq_khz, 0);
-show_uncore_min_max(max_freq_khz, 1);
-
-show_uncore_perf_status(current_freq_khz);
-
-#define show_uncore_data(member_name)					\
-	static ssize_t show_##member_name(struct device *dev,	\
-					  struct device_attribute *attr, char *buf)\
-	{                                                               \
-		struct uncore_data *data = container_of(attr, struct uncore_data,\
-							  member_name##_dev_attr);\
-									\
-		return scnprintf(buf, PAGE_SIZE, "%u\n",		\
-				 data->member_name);			\
-	}								\
-
-show_uncore_data(initial_min_freq_khz);
-show_uncore_data(initial_max_freq_khz);
-
-#define init_attribute_rw(_name)					\
-	do {								\
-		sysfs_attr_init(&data->_name##_dev_attr.attr);	\
-		data->_name##_dev_attr.show = show_##_name;		\
-		data->_name##_dev_attr.store = store_##_name;		\
-		data->_name##_dev_attr.attr.name = #_name;		\
-		data->_name##_dev_attr.attr.mode = 0644;		\
-	} while (0)
-
-#define init_attribute_ro(_name)					\
-	do {								\
-		sysfs_attr_init(&data->_name##_dev_attr.attr);	\
-		data->_name##_dev_attr.show = show_##_name;		\
-		data->_name##_dev_attr.store = NULL;			\
-		data->_name##_dev_attr.attr.name = #_name;		\
-		data->_name##_dev_attr.attr.mode = 0444;		\
-	} while (0)
-
-#define init_attribute_root_ro(_name)					\
-	do {								\
-		sysfs_attr_init(&data->_name##_dev_attr.attr);	\
-		data->_name##_dev_attr.show = show_##_name;		\
-		data->_name##_dev_attr.store = NULL;			\
-		data->_name##_dev_attr.attr.name = #_name;		\
-		data->_name##_dev_attr.attr.mode = 0400;		\
-	} while (0)
-
-static int create_attr_group(struct uncore_data *data, char *name)
-{
-	int ret, index = 0;
-
-	init_attribute_rw(max_freq_khz);
-	init_attribute_rw(min_freq_khz);
-	init_attribute_ro(initial_min_freq_khz);
-	init_attribute_ro(initial_max_freq_khz);
-	init_attribute_root_ro(current_freq_khz);
-
-	data->uncore_attrs[index++] = &data->max_freq_khz_dev_attr.attr;
-	data->uncore_attrs[index++] = &data->min_freq_khz_dev_attr.attr;
-	data->uncore_attrs[index++] = &data->initial_min_freq_khz_dev_attr.attr;
-	data->uncore_attrs[index++] = &data->initial_max_freq_khz_dev_attr.attr;
-	data->uncore_attrs[index++] = &data->current_freq_khz_dev_attr.attr;
-	data->uncore_attrs[index] = NULL;
-
-	data->uncore_attr_group.name = name;
-	data->uncore_attr_group.attrs = data->uncore_attrs;
-	ret = sysfs_create_group(uncore_root_kobj, &data->uncore_attr_group);
-
-	return ret;
-}
-
-static void delete_attr_group(struct uncore_data *data, char *name)
-{
-	sysfs_remove_group(uncore_root_kobj, &data->uncore_attr_group);
-}
-
 /* Caller provides protection */
 static struct uncore_data *uncore_get_instance(unsigned int cpu)
 {
@@ -314,57 +117,9 @@ static struct uncore_data *uncore_get_instance(unsigned int cpu)
 	return NULL;
 }
 
-static void uncore_add_die_entry(int cpu)
-{
-	struct uncore_data *data;
-
-	mutex_lock(&uncore_lock);
-	data = uncore_get_instance(cpu);
-	if (!data) {
-		mutex_unlock(&uncore_lock);
-		return;
-	}
-
-	if (data->valid) {
-		/* control cpu changed */
-		data->control_cpu = cpu;
-	} else {
-		int ret;
-
-		memset(data, 0, sizeof(*data));
-		sprintf(data->name, "package_%02d_die_%02d",
-			topology_physical_package_id(cpu),
-			topology_die_id(cpu));
-
-		uncore_read_ratio(data, &data->initial_min_freq_khz,
-				  &data->initial_max_freq_khz);
-
-		ret = create_attr_group(data, data->name);
-		if (!ret) {
-			data->control_cpu = cpu;
-			data->valid = true;
-		}
-	}
-	mutex_unlock(&uncore_lock);
-}
-
-/* Last CPU in this die is offline, make control cpu invalid */
-static void uncore_remove_die_entry(int cpu)
-{
-	struct uncore_data *data;
-
-	mutex_lock(&uncore_lock);
-	data = uncore_get_instance(cpu);
-	if (data) {
-		delete_attr_group(data, data->name);
-		data->control_cpu = -1;
-		data->valid = false;
-	}
-	mutex_unlock(&uncore_lock);
-}
-
 static int uncore_event_cpu_online(unsigned int cpu)
 {
+	struct uncore_data *data;
 	int target;
 
 	/* Check if there is an online cpu in the package for uncore MSR */
@@ -374,15 +129,26 @@ static int uncore_event_cpu_online(unsigned int cpu)
 
 	/* Use this CPU on this die as a control CPU */
 	cpumask_set_cpu(cpu, &uncore_cpu_mask);
-	uncore_add_die_entry(cpu);
 
-	return 0;
+	data = uncore_get_instance(cpu);
+	if (!data)
+		return 0;
+
+	data->package_id = topology_physical_package_id(cpu);
+	data->die_id = topology_die_id(cpu);
+
+	return uncore_freq_add_entry(data, cpu);
 }
 
 static int uncore_event_cpu_offline(unsigned int cpu)
 {
+	struct uncore_data *data;
 	int target;
 
+	data = uncore_get_instance(cpu);
+	if (!data)
+		return 0;
+
 	/* Check if existing cpu is used for uncore MSRs */
 	if (!cpumask_test_and_clear_cpu(cpu, &uncore_cpu_mask))
 		return 0;
@@ -392,9 +158,9 @@ static int uncore_event_cpu_offline(unsigned int cpu)
 
 	if (target < nr_cpu_ids) {
 		cpumask_set_cpu(target, &uncore_cpu_mask);
-		uncore_add_die_entry(target);
+		uncore_freq_add_entry(data, target);
 	} else {
-		uncore_remove_die_entry(cpu);
+		uncore_freq_remove_die_entry(data);
 	}
 
 	return 0;
@@ -403,24 +169,20 @@ static int uncore_event_cpu_offline(unsigned int cpu)
 static int uncore_pm_notify(struct notifier_block *nb, unsigned long mode,
 			    void *_unused)
 {
-	int cpu;
+	int i;
 
 	switch (mode) {
 	case PM_POST_HIBERNATION:
 	case PM_POST_RESTORE:
 	case PM_POST_SUSPEND:
-		for_each_cpu(cpu, &uncore_cpu_mask) {
-			struct uncore_data *data;
-			int ret;
+		for (i = 0; i < uncore_max_entries; ++i) {
+			struct uncore_data *data = &uncore_instances[i];
 
-			data = uncore_get_instance(cpu);
 			if (!data || !data->valid || !data->stored_uncore_data)
-				continue;
+				return 0;
 
-			ret = wrmsrl_on_cpu(cpu, MSR_UNCORE_RATIO_LIMIT,
-					    data->stored_uncore_data);
-			if (ret)
-				return ret;
+			wrmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT,
+				      data->stored_uncore_data);
 		}
 		break;
 	default:
@@ -443,6 +205,7 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, NULL),
 	{}
 };
+MODULE_DEVICE_TABLE(x86cpu, intel_uncore_cpu_ids);
 
 static int __init intel_uncore_init(void)
 {
@@ -460,12 +223,10 @@ static int __init intel_uncore_init(void)
 	if (!uncore_instances)
 		return -ENOMEM;
 
-	uncore_root_kobj = kobject_create_and_add("intel_uncore_frequency",
-						  &cpu_subsys.dev_root->kobj);
-	if (!uncore_root_kobj) {
-		ret = -ENOMEM;
+	ret = uncore_freq_common_init(uncore_read_control_freq, uncore_write_control_freq,
+				      uncore_read_freq);
+	if (!ret)
 		goto err_free;
-	}
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/uncore-freq:online",
@@ -485,7 +246,7 @@ static int __init intel_uncore_init(void)
 err_rem_state:
 	cpuhp_remove_state(uncore_hp_state);
 err_rem_kobj:
-	kobject_put(uncore_root_kobj);
+	uncore_freq_common_exit();
 err_free:
 	kfree(uncore_instances);
 
@@ -495,12 +256,17 @@ module_init(intel_uncore_init)
 
 static void __exit intel_uncore_exit(void)
 {
+	int i;
+
 	unregister_pm_notifier(&uncore_pm_nb);
 	cpuhp_remove_state(uncore_hp_state);
-	kobject_put(uncore_root_kobj);
+	for (i = 0; i < uncore_max_entries; ++i)
+		uncore_freq_remove_die_entry(&uncore_instances[i]);
+	uncore_freq_common_exit();
 	kfree(uncore_instances);
 }
 module_exit(intel_uncore_exit)
 
+MODULE_IMPORT_NS(INTEL_UNCORE_FREQUENCY);
 MODULE_LICENSE("GPL v2");
 MODULE_DESCRIPTION("Intel Uncore Frequency Limits Driver");
-- 
2.31.1

