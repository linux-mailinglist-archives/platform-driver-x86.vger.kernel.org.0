Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 268656E6AB1
	for <lists+platform-driver-x86@lfdr.de>; Tue, 18 Apr 2023 19:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbjDRROJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 18 Apr 2023 13:14:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbjDRRNu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 18 Apr 2023 13:13:50 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530D37EFA;
        Tue, 18 Apr 2023 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681838028; x=1713374028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pcz0xuzvKFQ972qMSTpd7/yWgsuX10hbC8u9kalTPD0=;
  b=IwQ/hJMppyMnHxeUvh7grFbRXFCS86jEOTQNiLED3JyU/qBM2y/xbz/P
   I7a+87akASOS8ZIUdC9GCm27cH1V0v9x7uIWSlon2rObpJtFScuOiyrv1
   PBBckS2eLQ5nRWABd5Rc7j53+9k+0AoahWUobEbxmbTO9R639oT2iAO1o
   c+nTi6+cVC7hAjgPNFCbwHXiat4pLFjj0Ri7RkC4Kk2+X1XzmFdHXnhrG
   mlX1o+pzUILeU6x8Rb5olp1cy5r05aSyrF6igKQYUCFTLlguhoD395dk8
   ibZU35N7xk4k8ypjc7nsPJGS0esPQFgr7gTO2dOTHft0aZuri4NXTnHSA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347084264"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="347084264"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 10:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="755762661"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="755762661"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga008.fm.intel.com with ESMTP; 18 Apr 2023 10:13:44 -0700
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Wendy Wang <wendy.wang@intel.com>
Subject: [PATCH v2 2/3] platform/x86/intel-uncore-freq: Support for cluster level controls
Date:   Tue, 18 Apr 2023 10:13:39 -0700
Message-Id: <20230418171340.681662-3-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230418171340.681662-1-srinivas.pandruvada@linux.intel.com>
References: <20230418171340.681662-1-srinivas.pandruvada@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

An SoC can contain multiple power domains with individual or collection
of mesh partitions. This partition is called fabric cluster.

Certain type of meshes will need to run at the same frequency, they will
be placed in the same fabric cluster. Benefit of fabric cluster is that
it offers a scalable mechanism to deal with partitioned fabrics in a SoC.

The current sysfs interface supports control at package and die level.
This interface is not enough to support more granular control at
fabric cluster level.

SoCs with the support of TPMI (Topology Aware Register and PM Capsule
Interface), can have multiple power domains. Each power domain can
contain one or more fabric clusters.

To support such granular controls, enhance uncore common to optionally
create new directories to provide controls at fabric cluster level. It
is also important to have flexibility to change granularity for future
version of SoCs. If the directory name contains scope like:
"package_*_die_*_power_domain_*_cluster_*", then this is not expandable.

The cpufreq policies also have different scopes. There the scope of the
policy (affected_cpus) specified by attributes inside each policy.
So, follow the same model for uncore frequency scaling sysfs as:
"sys/devices/system/cpu/cpufreq/policy*"

Allow client drivers to optionally support granular control for each
fabric cluster. Here, the directory name will be "uncore" suffixed with
an unique instance number. For example: uncore00, uncore01 etc.
Attributes in the directory identify package id, power domain and
fabric cluster id. This interface is expandable even if some new level
of granularity is introduced. A new sysfs attribute can identify new
level.

For compatibility with the existing sysfs and provide easy way to set
limits for each fabric cluster in the package/die, the existing control
at package/die levels are still provided. For majority of users, this is
an easy approach.

For example: On a single package/die system, with three power domains
and one fabric cluster per power domain:

$tree -L 2 /sys/devices/system/cpu/intel_uncore_frequency/
/sys/devices/system/cpu/intel_uncore_frequency/
├── package_00_die_00
│   ├── current_freq_khz
│   ├── initial_max_freq_khz
│   ├── initial_min_freq_khz
│   ├── max_freq_khz
│   └── min_freq_khz
├── uncore00
│   ├── current_freq_khz
│   ├── domain_id
│   ├── fabric_cluster_id
│   ├── initial_max_freq_khz
│   ├── initial_min_freq_khz
│   ├── max_freq_khz
│   ├── min_freq_khz
│   └── package_id
├── uncore01
│   ├── current_freq_khz
│   ├── domain_id
│   ├── fabric_cluster_id
│   ├── initial_max_freq_khz
│   ├── initial_min_freq_khz
│   ├── max_freq_khz
│   ├── min_freq_khz
│   └── package_id
└── uncore02
    ├── current_freq_khz
    ├── domain_id
    ├── fabric_cluster_id
    ├── initial_max_freq_khz
    ├── initial_min_freq_khz
    ├── max_freq_khz
    ├── min_freq_khz
    └── package_id

The attribute for cluster id is "fabric_cluster_id" instead of just
"cluster_id" is to avoid confusion with usage of term clusters in
other part of the Linux kernel.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Reviewed-by: Zhang Rui <rui.zhang@intel.com>
Tested-by: Wendy Wang <wendy.wang@intel.com>
---
New patch with this series.

 .../pm/intel_uncore_frequency_scaling.rst     | 57 ++++++++++++++++++-
 .../uncore-frequency-common.c                 | 51 ++++++++++++++++-
 .../uncore-frequency-common.h                 | 16 +++++-
 .../intel/uncore-frequency/uncore-frequency.c |  1 +
 4 files changed, 121 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
index 09169d935835..5ab3440e6cee 100644
--- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
+++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
@@ -5,7 +5,7 @@
 Intel Uncore Frequency Scaling
 ==============================
 
-:Copyright: |copy| 2022 Intel Corporation
+:Copyright: |copy| 2022-2023 Intel Corporation
 
 :Author: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
 
@@ -58,3 +58,58 @@ Each package_*_die_* contains the following attributes:
 
 ``current_freq_khz``
 	This attribute is used to get the current uncore frequency.
+
+SoCs with TPMI (Topology Aware Register and PM Capsule Interface)
+-----------------------------------------------------------------
+
+An SoC can contain multiple power domains with individual or collection
+of mesh partitions. This partition is called fabric cluster.
+
+Certain type of meshes will need to run at the same frequency, they will
+be placed in the same fabric cluster. Benefit of fabric cluster is that it
+offers a scalable mechanism to deal with partitioned fabrics in a SoC.
+
+The current sysfs interface supports controls at package and die level.
+This interface is not enough to support more granular control at
+fabric cluster level.
+
+SoCs with the support of TPMI (Topology Aware Register and PM Capsule
+Interface), can have multiple power domains. Each power domain can
+contain one or more fabric clusters.
+
+To represent controls at fabric cluster level in addition to the
+controls at package and die level (like systems without TPMI
+support), sysfs is enhanced. This granular interface is presented in the
+sysfs with directories names prefixed with "uncore". For example:
+uncore00, uncore01 etc.
+
+The scope of control is specified by attributes "package_id", "domain_id"
+and "fabric_cluster_id" in the directory.
+
+Attributes in each directory:
+
+``domain_id``
+	This attribute is used to get the power domain id of this instance.
+
+``fabric_cluster_id``
+	This attribute is used to get the fabric cluster id of this instance.
+
+``package_id``
+	This attribute is used to get the package id of this instance.
+
+The other attributes are same as presented at package_*_die_* level.
+
+In most of current use cases, the "max_freq_khz" and "min_freq_khz"
+is updated at "package_*_die_*" level. This model will be still supported
+with the following approach:
+
+When user uses controls at "package_*_die_*" level, then every fabric
+cluster is affected in that package and die. For example: user changes
+"max_freq_khz" in the package_00_die_00, then "max_freq_khz" for uncore*
+directory with the same package id will be updated. In this case user can
+still update "max_freq_khz" at each uncore* level, which is more restrictive.
+Similarly, user can update "min_freq_khz" at "package_*_die_*" level
+to apply at each uncore* level.
+
+Support for "current_freq_khz" is available only at each fabric cluster
+level (i.e., in uncore* directory).
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
index fa8f14c925ec..b86e65a8ffdc 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c
@@ -16,11 +16,34 @@ static struct kobject *uncore_root_kobj;
 /* uncore instance count */
 static int uncore_instance_count;
 
+static DEFINE_IDA(intel_uncore_ida);
+
 /* callbacks for actual HW read/write */
 static int (*uncore_read)(struct uncore_data *data, unsigned int *min, unsigned int *max);
 static int (*uncore_write)(struct uncore_data *data, unsigned int input, unsigned int min_max);
 static int (*uncore_read_freq)(struct uncore_data *data, unsigned int *freq);
 
+static ssize_t show_domain_id(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct uncore_data *data = container_of(attr, struct uncore_data, domain_id_dev_attr);
+
+	return sprintf(buf, "%u\n", data->domain_id);
+}
+
+static ssize_t show_fabric_cluster_id(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct uncore_data *data = container_of(attr, struct uncore_data, fabric_cluster_id_dev_attr);
+
+	return sprintf(buf, "%u\n", data->cluster_id);
+}
+
+static ssize_t show_package_id(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct uncore_data *data = container_of(attr, struct uncore_data, package_id_dev_attr);
+
+	return sprintf(buf, "%u\n", data->package_id);
+}
+
 static ssize_t show_min_max_freq_khz(struct uncore_data *data,
 				      char *buf, int min_max)
 {
@@ -161,6 +184,15 @@ static int create_attr_group(struct uncore_data *data, char *name)
 	init_attribute_ro(initial_max_freq_khz);
 	init_attribute_root_ro(current_freq_khz);
 
+	if (data->domain_id != UNCORE_DOMAIN_ID_INVALID) {
+		init_attribute_root_ro(domain_id);
+		data->uncore_attrs[index++] = &data->domain_id_dev_attr.attr;
+		init_attribute_root_ro(fabric_cluster_id);
+		data->uncore_attrs[index++] = &data->fabric_cluster_id_dev_attr.attr;
+		init_attribute_root_ro(package_id);
+		data->uncore_attrs[index++] = &data->package_id_dev_attr.attr;
+	}
+
 	data->uncore_attrs[index++] = &data->max_freq_khz_dev_attr.attr;
 	data->uncore_attrs[index++] = &data->min_freq_khz_dev_attr.attr;
 	data->uncore_attrs[index++] = &data->initial_min_freq_khz_dev_attr.attr;
@@ -191,12 +223,24 @@ int uncore_freq_add_entry(struct uncore_data *data, int cpu)
 		goto uncore_unlock;
 	}
 
-	sprintf(data->name, "package_%02d_die_%02d", data->package_id, data->die_id);
+	if (data->domain_id != UNCORE_DOMAIN_ID_INVALID) {
+		ret = ida_alloc(&intel_uncore_ida, GFP_KERNEL);
+		if (ret < 0)
+			goto uncore_unlock;
+
+		data->instance_id = ret;
+		sprintf(data->name, "uncore%02d", ret);
+	} else {
+		sprintf(data->name, "package_%02d_die_%02d", data->package_id, data->die_id);
+	}
 
 	uncore_read(data, &data->initial_min_freq_khz, &data->initial_max_freq_khz);
 
 	ret = create_attr_group(data, data->name);
-	if (!ret) {
+	if (ret) {
+		if (data->domain_id != UNCORE_DOMAIN_ID_INVALID)
+			ida_free(&intel_uncore_ida, data->instance_id);
+	} else {
 		data->control_cpu = cpu;
 		data->valid = true;
 	}
@@ -214,6 +258,9 @@ void uncore_freq_remove_die_entry(struct uncore_data *data)
 	delete_attr_group(data, data->name);
 	data->control_cpu = -1;
 	data->valid = false;
+	if (data->domain_id != UNCORE_DOMAIN_ID_INVALID)
+		ida_free(&intel_uncore_ida, data->instance_id);
+
 	mutex_unlock(&uncore_lock);
 }
 EXPORT_SYMBOL_NS_GPL(uncore_freq_remove_die_entry, INTEL_UNCORE_FREQUENCY);
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
index f5dcfa2fb285..7afb69977c7e 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.h
@@ -21,6 +21,9 @@
  * @valid:		Mark the data valid/invalid
  * @package_id:	Package id for this instance
  * @die_id:		Die id for this instance
+ * @domain_id:		Power domain id for this instance
+ * @cluster_id:		cluster id in a domain
+ * @instance_id:	Unique instance id to append to directory name
  * @name:		Sysfs entry name for this instance
  * @uncore_attr_group:	Attribute group storage
  * @max_freq_khz_dev_attr: Storage for device attribute max_freq_khz
@@ -28,6 +31,9 @@
  * @initial_max_freq_khz_dev_attr: Storage for device attribute initial_max_freq_khz
  * @initial_min_freq_khz_dev_attr: Storage for device attribute initial_min_freq_khz
  * @current_freq_khz_dev_attr: Storage for device attribute current_freq_khz
+ * @domain_id_dev_attr: Storage for device attribute domain_id
+ * @fabric_cluster_id_dev_attr: Storage for device attribute fabric_cluster_id
+ * @package_id_dev_attr: Storage for device attribute package_id
  * @uncore_attrs:	Attribute storage for group creation
  *
  * This structure is used to encapsulate all data related to uncore sysfs
@@ -41,6 +47,9 @@ struct uncore_data {
 	bool valid;
 	int package_id;
 	int die_id;
+	int domain_id;
+	int cluster_id;
+	int instance_id;
 	char name[32];
 
 	struct attribute_group uncore_attr_group;
@@ -49,9 +58,14 @@ struct uncore_data {
 	struct device_attribute initial_max_freq_khz_dev_attr;
 	struct device_attribute initial_min_freq_khz_dev_attr;
 	struct device_attribute current_freq_khz_dev_attr;
-	struct attribute *uncore_attrs[6];
+	struct device_attribute domain_id_dev_attr;
+	struct device_attribute fabric_cluster_id_dev_attr;
+	struct device_attribute package_id_dev_attr;
+	struct attribute *uncore_attrs[9];
 };
 
+#define UNCORE_DOMAIN_ID_INVALID	-1
+
 int uncore_freq_common_init(int (*read_control_freq)(struct uncore_data *data, unsigned int *min, unsigned int *max),
 			     int (*write_control_freq)(struct uncore_data *data, unsigned int input, unsigned int min_max),
 			     int (*uncore_read_freq)(struct uncore_data *data, unsigned int *freq));
diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
index 00ac7e381441..0ea13c5fbba8 100644
--- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
+++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
@@ -136,6 +136,7 @@ static int uncore_event_cpu_online(unsigned int cpu)
 
 	data->package_id = topology_physical_package_id(cpu);
 	data->die_id = topology_die_id(cpu);
+	data->domain_id = UNCORE_DOMAIN_ID_INVALID;
 
 	return uncore_freq_add_entry(data, cpu);
 }
-- 
2.38.1

