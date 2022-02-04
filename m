Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD7B4A9166
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Feb 2022 01:04:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356107AbiBDADc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Feb 2022 19:03:32 -0500
Received: from mga01.intel.com ([192.55.52.88]:8519 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1356102AbiBDADb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 19:03:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643933011; x=1675469011;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UTYky6/Tq2+UP56UrmX4lZezRVFrc80BK0981MS1BeE=;
  b=F+YOD5CMCsDJVEKUNJB2pbQefeL/pjIXsNjgG3/2p1rJn/5/PnCg6XV0
   mihdJvtPH3HET3VF2F35g196JzpIL4uRiiqmbkI/vtfYPiDXoI6+1fZHQ
   9wecfUROd/iNs3tSBGC7/JkcLpQgFQVPOj50C3/Y1xkP4K1bQiIO8iBIP
   J6GNSgX7hc1Vtk0ZRqtInVggO46PvYXVfvmLZuGM2Uo0WalAhmC0X7eX1
   fQswoCT7jOL8UVmQRvoiwseG++jpbioJS48KukFm3r+qUwyNVnweeQcY+
   DjkEBmmh6ROo7RqXBJjEkBFuzjzw4Qme51AtpU/2BVQasR/fmXoruwVdu
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="272779958"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="272779958"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 16:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="620684674"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2022 16:03:30 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH 2/4] platform/x86/intel/uncore-freq: Use sysfs API to create attributes
Date:   Thu,  3 Feb 2022 16:03:04 -0800
Message-Id: <20220204000306.2517447-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
References: <20220204000306.2517447-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Srinivas Pandruvada <srinivas.pandruvada@intel.com>

Use of sysfs API is always preferable over using kobject calls to create
attributes. Remove usage of kobject_init_and_add() and use
sysfs_create_group(). To create relationship between sysfs attribute
and uncore instance use device_attribute*, which is defined per
uncore instance.

To create uniform locking for both read and write attributes take
lock in the sysfs callbacks, not in the actual functions where
the MSRs are read or updated.

No functional changes are expected.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 .../intel/uncore-frequency/uncore-frequency.c | 225 +++++++++---------
 1 file changed, 113 insertions(+), 112 deletions(-)

diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 4cd8254f2e40..35b00608a81d 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Intel Uncore Frequency Setting
- * Copyright (c) 2019, Intel Corporation.
+ * Copyright (c) 2022, Intel Corporation.
  * All rights reserved.
  *
  * Provide interface to set MSR 620 at a granularity of per die. On CPU online,
@@ -32,22 +32,37 @@
  * @initial_max_freq_khz: Sampled maximum uncore frequency at driver init
  * @control_cpu:	Designated CPU for a die to read/write
  * @valid:		Mark the data valid/invalid
+ * @package_id:	Package id for this instance
+ * @die_id:		Die id for this instance
+ * @name:		Sysfs entry name for this instance
+ * @uncore_attr_group:	Attribute group storage
+ * @max_freq_khz_dev_attr: Storage for device attribute max_freq_khz
+ * @mix_freq_khz_dev_attr: Storage for device attribute min_freq_khz
+ * @initial_max_freq_khz_dev_attr: Storage for device attribute initial_max_freq_khz
+ * @initial_min_freq_khz_dev_attr: Storage for device attribute initial_min_freq_khz
+ * @uncore_attrs:	Attribute storage for group creation
  *
  * This structure is used to encapsulate all data related to uncore sysfs
  * settings for a die/package.
  */
 struct uncore_data {
-	struct kobject kobj;
-	struct completion kobj_unregister;
 	u64 stored_uncore_data;
 	u32 initial_min_freq_khz;
 	u32 initial_max_freq_khz;
 	int control_cpu;
 	bool valid;
+	int package_id;
+	int die_id;
+	char name[32];
+
+	struct attribute_group uncore_attr_group;
+	struct device_attribute max_freq_khz_dev_attr;
+	struct device_attribute min_freq_khz_dev_attr;
+	struct device_attribute initial_max_freq_khz_dev_attr;
+	struct device_attribute initial_min_freq_khz_dev_attr;
+	struct attribute *uncore_attrs[5];
 };
 
-#define to_uncore_data(a) container_of(a, struct uncore_data, kobj)
-
 /* Max instances for uncore data, one for each die */
 static int uncore_max_entries __read_mostly;
 /* Storage for uncore data for all instances */
@@ -61,36 +76,6 @@ static enum cpuhp_state uncore_hp_state __read_mostly;
 /* Mutex to control all mutual exclusions */
 static DEFINE_MUTEX(uncore_lock);
 
-struct uncore_attr {
-	struct attribute attr;
-	ssize_t (*show)(struct kobject *kobj,
-			struct attribute *attr, char *buf);
-	ssize_t (*store)(struct kobject *kobj,
-			 struct attribute *attr, const char *c, ssize_t count);
-};
-
-#define define_one_uncore_ro(_name) \
-static struct uncore_attr _name = \
-__ATTR(_name, 0444, show_##_name, NULL)
-
-#define define_one_uncore_rw(_name) \
-static struct uncore_attr _name = \
-__ATTR(_name, 0644, show_##_name, store_##_name)
-
-#define show_uncore_data(member_name)					\
-	static ssize_t show_##member_name(struct kobject *kobj,         \
-					  struct attribute *attr,	\
-					  char *buf)			\
-	{                                                               \
-		struct uncore_data *data = to_uncore_data(kobj);	\
-		return scnprintf(buf, PAGE_SIZE, "%u\n",		\
-				 data->member_name);			\
-	}								\
-	define_one_uncore_ro(member_name)
-
-show_uncore_data(initial_min_freq_khz);
-show_uncore_data(initial_max_freq_khz);
-
 /* Common function to read MSR 0x620 and read min/max */
 static int uncore_read_ratio(struct uncore_data *data, unsigned int *min,
 			     unsigned int *max)
@@ -118,22 +103,16 @@ static int uncore_write_ratio(struct uncore_data *data, unsigned int input,
 	int ret;
 	u64 cap;
 
-	mutex_lock(&uncore_lock);
-
-	if (data->control_cpu < 0) {
-		ret = -ENXIO;
-		goto finish_write;
-	}
+	if (data->control_cpu < 0)
+		return -ENXIO;
 
 	input /= UNCORE_FREQ_KHZ_MULTIPLIER;
-	if (!input || input > 0x7F) {
-		ret = -EINVAL;
-		goto finish_write;
-	}
+	if (!input || input > 0x7F)
+		return -EINVAL;
 
 	ret = rdmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, &cap);
 	if (ret)
-		goto finish_write;
+		return ret;
 
 	if (set_max) {
 		cap &= ~0x7F;
@@ -145,37 +124,16 @@ static int uncore_write_ratio(struct uncore_data *data, unsigned int input,
 
 	ret = wrmsrl_on_cpu(data->control_cpu, MSR_UNCORE_RATIO_LIMIT, cap);
 	if (ret)
-		goto finish_write;
+		return ret;
 
 	data->stored_uncore_data = cap;
 
-finish_write:
-	mutex_unlock(&uncore_lock);
-
-	return ret;
-}
-
-static ssize_t store_min_max_freq_khz(struct kobject *kobj,
-				      struct attribute *attr,
-				      const char *buf, ssize_t count,
-				      int min_max)
-{
-	struct uncore_data *data = to_uncore_data(kobj);
-	unsigned int input;
-
-	if (kstrtouint(buf, 10, &input))
-		return -EINVAL;
-
-	uncore_write_ratio(data, input, min_max);
-
-	return count;
+	return 0;
 }
 
-static ssize_t show_min_max_freq_khz(struct kobject *kobj,
-				     struct attribute *attr,
+static ssize_t show_min_max_freq_khz(struct uncore_data *data,
 				     char *buf, int min_max)
 {
-	struct uncore_data *data = to_uncore_data(kobj);
 	unsigned int min, max;
 	int ret;
 
@@ -191,22 +149,40 @@ static ssize_t show_min_max_freq_khz(struct kobject *kobj,
 	return sprintf(buf, "%u\n", min);
 }
 
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
+	uncore_write_ratio(data, input, min_max);
+	mutex_unlock(&uncore_lock);
+
+	return count;
+}
+
 #define store_uncore_min_max(name, min_max)				\
-	static ssize_t store_##name(struct kobject *kobj,		\
-				    struct attribute *attr,		\
-				    const char *buf, ssize_t count)	\
-	{                                                               \
+	static ssize_t store_##name(struct device *dev,		\
+				    struct device_attribute *attr,	\
+				    const char *buf, size_t count)	\
+	{								\
+		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
 									\
-		return store_min_max_freq_khz(kobj, attr, buf, count,	\
-					      min_max);			\
+		return store_min_max_freq_khz(data, buf, count,	\
+					      min_max);		\
 	}
 
 #define show_uncore_min_max(name, min_max)				\
-	static ssize_t show_##name(struct kobject *kobj,		\
-				   struct attribute *attr, char *buf)	\
+	static ssize_t show_##name(struct device *dev,		\
+				   struct device_attribute *attr, char *buf)\
 	{                                                               \
+		struct uncore_data *data = container_of(attr, struct uncore_data, name##_dev_attr);\
 									\
-		return show_min_max_freq_khz(kobj, attr, buf, min_max); \
+		return show_min_max_freq_khz(data, buf, min_max);	\
 	}
 
 store_uncore_min_max(min_freq_khz, 0);
@@ -215,30 +191,64 @@ store_uncore_min_max(max_freq_khz, 1);
 show_uncore_min_max(min_freq_khz, 0);
 show_uncore_min_max(max_freq_khz, 1);
 
-define_one_uncore_rw(min_freq_khz);
-define_one_uncore_rw(max_freq_khz);
+#define show_uncore_data(member_name)					\
+	static ssize_t show_##member_name(struct device *dev,	\
+					  struct device_attribute *attr, char *buf)\
+	{                                                               \
+		struct uncore_data *data = container_of(attr, struct uncore_data,\
+							  member_name##_dev_attr);\
+									\
+		return scnprintf(buf, PAGE_SIZE, "%u\n",		\
+				 data->member_name);			\
+	}								\
 
-static struct attribute *uncore_attrs[] = {
-	&initial_min_freq_khz.attr,
-	&initial_max_freq_khz.attr,
-	&max_freq_khz.attr,
-	&min_freq_khz.attr,
-	NULL
-};
-ATTRIBUTE_GROUPS(uncore);
+show_uncore_data(initial_min_freq_khz);
+show_uncore_data(initial_max_freq_khz);
 
-static void uncore_sysfs_entry_release(struct kobject *kobj)
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
+static int create_attr_group(struct uncore_data *data, char *name)
 {
-	struct uncore_data *data = to_uncore_data(kobj);
+	int ret, index = 0;
+
+	init_attribute_rw(max_freq_khz);
+	init_attribute_rw(min_freq_khz);
+	init_attribute_ro(initial_min_freq_khz);
+	init_attribute_ro(initial_max_freq_khz);
+
+	data->uncore_attrs[index++] = &data->max_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->min_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->initial_min_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index++] = &data->initial_max_freq_khz_dev_attr.attr;
+	data->uncore_attrs[index] = NULL;
+
+	data->uncore_attr_group.name = name;
+	data->uncore_attr_group.attrs = data->uncore_attrs;
+	ret = sysfs_create_group(uncore_root_kobj, &data->uncore_attr_group);
 
-	complete(&data->kobj_unregister);
+	return ret;
 }
 
-static struct kobj_type uncore_ktype = {
-	.release = uncore_sysfs_entry_release,
-	.sysfs_ops = &kobj_sysfs_ops,
-	.default_groups = uncore_groups,
-};
+static void delete_attr_group(struct uncore_data *data, char *name)
+{
+	sysfs_remove_group(uncore_root_kobj, &data->uncore_attr_group);
+}
 
 /* Caller provides protection */
 static struct uncore_data *uncore_get_instance(unsigned int cpu)
@@ -266,21 +276,17 @@ static void uncore_add_die_entry(int cpu)
 		/* control cpu changed */
 		data->control_cpu = cpu;
 	} else {
-		char str[64];
 		int ret;
 
 		memset(data, 0, sizeof(*data));
-		sprintf(str, "package_%02d_die_%02d",
+		sprintf(data->name, "package_%02d_die_%02d",
 			topology_physical_package_id(cpu),
 			topology_die_id(cpu));
 
 		uncore_read_ratio(data, &data->initial_min_freq_khz,
 				  &data->initial_max_freq_khz);
 
-		init_completion(&data->kobj_unregister);
-
-		ret = kobject_init_and_add(&data->kobj, &uncore_ktype,
-					   uncore_root_kobj, str);
+		ret = create_attr_group(data, data->name);
 		if (!ret) {
 			data->control_cpu = cpu;
 			data->valid = true;
@@ -296,8 +302,11 @@ static void uncore_remove_die_entry(int cpu)
 
 	mutex_lock(&uncore_lock);
 	data = uncore_get_instance(cpu);
-	if (data)
+	if (data) {
+		delete_attr_group(data, data->name);
 		data->control_cpu = -1;
+		data->valid = false;
+	}
 	mutex_unlock(&uncore_lock);
 }
 
@@ -433,16 +442,8 @@ module_init(intel_uncore_init)
 
 static void __exit intel_uncore_exit(void)
 {
-	int i;
-
 	unregister_pm_notifier(&uncore_pm_nb);
 	cpuhp_remove_state(uncore_hp_state);
-	for (i = 0; i < uncore_max_entries; ++i) {
-		if (uncore_instances[i].valid) {
-			kobject_put(&uncore_instances[i].kobj);
-			wait_for_completion(&uncore_instances[i].kobj_unregister);
-		}
-	}
 	kobject_put(uncore_root_kobj);
 	kfree(uncore_instances);
 }
-- 
2.31.1

