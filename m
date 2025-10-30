Return-Path: <platform-driver-x86+bounces-15050-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E53D4C2028B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Oct 2025 14:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB6FA3BF5E4
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Oct 2025 13:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566C33559C8;
	Thu, 30 Oct 2025 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rZrb1kh8"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF40355023
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 13:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761829420; cv=none; b=Nl37c1GF2YU53iPJZLWB8RfKsGC3LcYCHehKd6knchuw0zYair7qBzwUVLlQvzYsb4Ju02GX42+oyCms2rERZ0y3CpZQPSILT84bJBOUUPagYkjPfzFbDnghKnlmQknIbTVMgJLoNUr282yJJ9H4HAvNKzqIcdU6k1iMpjoa3CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761829420; c=relaxed/simple;
	bh=xeBCT1iY28ZqpdzfoBwRAhNBlZ3VDn+Xd9b5fj7Ejz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8FGhAwRLDszuj1lLClw/domUjI/Rg06Brxtq9ERWB1v0ueqOMTB9gd+eBAskp7DNQ9VNl0pAa45wSGlfm82Av7OHXQT7+SAY2VqeLZ5RXXpyRor2VRVI2ZMmIVIqAuHTNzc/egjpGisfodWwaYTY3foJsK0ABNhqngP1C88EVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rZrb1kh8; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761829415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fGADMqwCtfJ1KFxYHv06YxFLLKjamUHpo6oZ8lPWg8s=;
	b=rZrb1kh8R6fyIcFdotbzR9u9lvRvsGlEIoftUhshnf0xOgFfoCil4VShNF79gXP0IPyX4B
	ZLwBQPY2gHno6thsmIYSnyNc2yt0foY8jlTqKW7xrVghOLNK1IwtkJFceBdZ8x2t+ypUHy
	ziNyzN3jLBpCjtb8RqCXFz+xaawDifA=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	porfet828@gmail.com,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v16 5/9] platform/x86: asus-armoury: add core count control
Date: Thu, 30 Oct 2025 14:03:16 +0100
Message-ID: <20251030130320.1287122-6-denis.benato@linux.dev>
In-Reply-To: <20251030130320.1287122-1-denis.benato@linux.dev>
References: <20251030130320.1287122-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: "Luke D. Jones" <luke@ljones.dev>

Implement Intel core enablement under the asus-armoury module using the
fw_attributes class.

This allows users to enable or disable preformance or efficiency cores
depending on their requirements. After change a reboot is required.

Co-developed-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c        | 284 +++++++++++++++++++++
 drivers/platform/x86/asus-armoury.h        |  28 ++
 include/linux/platform_data/x86/asus-wmi.h |   5 +
 3 files changed, 317 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index fe80d5d04300..1b34c929a0b4 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -48,6 +48,36 @@
 #define ASUS_MINI_LED_2024_STRONG 0x01
 #define ASUS_MINI_LED_2024_OFF    0x02
 
+#define ASUS_POWER_CORE_MASK	GENMASK(15, 8)
+#define ASUS_PERF_CORE_MASK	GENMASK(7, 0)
+
+enum cpu_core_type {
+	CPU_CORE_PERF = 0,
+	CPU_CORE_POWER,
+};
+
+enum cpu_core_value {
+	CPU_CORE_DEFAULT = 0,
+	CPU_CORE_MIN,
+	CPU_CORE_MAX,
+	CPU_CORE_CURRENT,
+};
+
+/* Minimum number of performance cores (P-cores) */
+#define CPU_PERF_CORE_COUNT_MIN 4
+/* Minimum number of efficiency cores (E-cores) */
+#define CPU_POWR_CORE_COUNT_MIN 0
+
+/* Tunables provided by ASUS for gaming laptops */
+struct cpu_cores {
+	u32 cur_perf_cores;
+	u32 min_perf_cores;
+	u32 max_perf_cores;
+	u32 cur_power_cores;
+	u32 min_power_cores;
+	u32 max_power_cores;
+};
+
 struct asus_armoury_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
@@ -60,12 +90,22 @@ struct asus_armoury_priv {
 	 */
 	struct mutex egpu_mutex;
 
+	/*
+	 * Mutex to prevent big/little core count changes writing to same
+	 * endpoint at the same time. Must lock during attr store.
+	 */
+	struct mutex cpu_core_mutex;
+	struct cpu_cores *cpu_cores;
+	bool cpu_cores_changeable;
+
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
 };
 
 static struct asus_armoury_priv asus_armoury = {
 	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
+
+	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
 };
 
 struct fw_attrs_group {
@@ -97,6 +137,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
 	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "cores_performance") ||
+	       !strcmp(attr->attr.name, "cores_efficiency") ||
 	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
@@ -199,6 +241,18 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
 			return -EINVAL;
 		}
 		break;
+	case ASUS_WMI_DEVID_CORES:
+		/*
+		 * Prevent risk disabling cores essential for booting the system
+		 * up to a point where system settings can be reset:
+		 * this has already caused unrecoverable bricks in the past.
+		 */
+		if ((FIELD_GET(ASUS_POWER_CORE_MASK, value) < CPU_POWR_CORE_COUNT_MIN) ||
+		    (FIELD_GET(ASUS_PERF_CORE_MASK, value) < CPU_PERF_CORE_COUNT_MIN)) {
+			pr_err("Refusing to set CPU cores to unsafe value: 0x%x\n", value);
+			return -EINVAL;
+		}
+		break;
 	default:
 		/* No known problems are known for this dev_id */
 		break;
@@ -297,6 +351,12 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
 	return sysfs_emit(buf, "enumeration\n");
 }
 
+static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			     char *buf)
+{
+	return sysfs_emit(buf, "integer\n");
+}
+
 /* Mini-LED mode **************************************************************/
 static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
 						struct kobj_attribute *attr, char *buf)
@@ -690,6 +750,213 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
 }
 ASUS_ATTR_GROUP_ENUM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
 
+static struct cpu_cores *init_cpu_cores_ctrl(void)
+{
+	u32 cores;
+	int err;
+	struct cpu_cores *cores_p __free(kfree) = NULL;
+
+	cores_p = kzalloc(sizeof(struct cpu_cores), GFP_KERNEL);
+	if (!cores_p)
+		return ERR_PTR(-ENOMEM);
+
+	err = armoury_get_devstate(NULL, &cores, ASUS_WMI_DEVID_CORES_MAX);
+	if (err) {
+		pr_err("ACPI does not support CPU core count control\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
+	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
+
+	err = armoury_get_devstate(NULL, &cores, ASUS_WMI_DEVID_CORES);
+	if (err) {
+		pr_err("Could not get CPU core count: error %d\n", err);
+		return ERR_PTR(-EIO);
+	}
+
+	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
+	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
+
+	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
+	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
+
+	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
+	    (cores_p->min_power_cores > cores_p->max_power_cores) ||
+		(cores_p->cur_perf_cores > cores_p->max_perf_cores) ||
+		(cores_p->cur_power_cores > cores_p->max_power_cores) ||
+		(cores_p->cur_perf_cores < cores_p->min_perf_cores) ||
+		(cores_p->cur_power_cores < cores_p->min_power_cores)
+	) {
+		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	return no_free_ptr(cores_p);
+}
+
+static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
+				enum cpu_core_type core_type, enum cpu_core_value core_value)
+{
+	u32 cpu_core_value;
+
+	switch (core_value) {
+	case CPU_CORE_DEFAULT:
+	case CPU_CORE_MAX:
+		cpu_core_value = (core_type == CPU_CORE_PERF) ?
+			asus_armoury.cpu_cores->max_perf_cores :
+			asus_armoury.cpu_cores->max_power_cores;
+		break;
+	case CPU_CORE_MIN:
+		cpu_core_value = (core_type == CPU_CORE_PERF) ?
+			asus_armoury.cpu_cores->min_perf_cores :
+			asus_armoury.cpu_cores->min_power_cores;
+		break;
+	case CPU_CORE_CURRENT:
+		cpu_core_value = (core_type == CPU_CORE_PERF) ?
+			asus_armoury.cpu_cores->cur_perf_cores :
+			asus_armoury.cpu_cores->cur_power_cores;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return sysfs_emit(buf, "%u\n", cpu_core_value);
+}
+
+static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					 const char *buf, enum cpu_core_type core_type)
+{
+	u32 new_cores, perf_cores, power_cores, out_val, min, max, result;
+	int err;
+
+	result = kstrtou32(buf, 10, &new_cores);
+	if (result)
+		return result;
+
+	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
+		if (!asus_armoury.cpu_cores_changeable) {
+			pr_warn("CPU core count change not allowed until reboot\n");
+			return -EBUSY;
+		}
+
+		if (core_type == CPU_CORE_PERF) {
+			perf_cores = new_cores;
+			power_cores = asus_armoury.cpu_cores->cur_power_cores;
+			min = asus_armoury.cpu_cores->min_perf_cores;
+			max = asus_armoury.cpu_cores->max_perf_cores;
+		} else {
+			perf_cores = asus_armoury.cpu_cores->cur_perf_cores;
+			power_cores = new_cores;
+			min = asus_armoury.cpu_cores->min_power_cores;
+			max = asus_armoury.cpu_cores->max_power_cores;
+		}
+
+		if (new_cores < min || new_cores > max)
+			return -EINVAL;
+
+		out_val = FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores) |
+			FIELD_PREP(ASUS_POWER_CORE_MASK, power_cores);
+
+		asus_armoury.cpu_cores_changeable = false;
+		err = armoury_set_devstate(attr, out_val, &result, ASUS_WMI_DEVID_CORES);
+		if (err) {
+			pr_warn("Failed to set CPU core count: %d\n", err);
+			return err;
+		}
+
+		if (result > 1) {
+			pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
+			return -EIO;
+		}
+	}
+
+	pr_info("CPU core count changed, reboot required\n");
+
+	sysfs_notify(kobj, NULL, attr->attr.name);
+	asus_set_reboot_and_signal_event();
+
+	return 0;
+}
+
+static ssize_t cores_performance_min_value_show(struct kobject *kobj,
+						struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
+}
+
+static ssize_t cores_performance_max_value_show(struct kobject *kobj,
+						struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
+}
+
+static ssize_t cores_performance_default_value_show(struct kobject *kobj,
+						    struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
+}
+
+static ssize_t cores_performance_current_value_show(struct kobject *kobj,
+						    struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
+}
+
+static ssize_t cores_performance_current_value_store(struct kobject *kobj,
+						     struct kobj_attribute *attr,
+						     const char *buf, size_t count)
+{
+	int err;
+
+	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
+	if (err)
+		return err;
+
+	return count;
+}
+ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
+			 "Set the max available performance cores");
+
+static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					       char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
+}
+
+static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					       char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
+}
+
+static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
+						   struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
+}
+
+static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
+						   struct kobj_attribute *attr, char *buf)
+{
+	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
+}
+
+static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
+						    struct kobj_attribute *attr, const char *buf,
+						    size_t count)
+{
+	int err;
+
+	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
+	if (err)
+		return err;
+
+	return count;
+}
+ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
+		    "Set the max available efficiency cores");
+
 /* Simple attribute creation */
 ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 			    "Show the current mode of charging");
@@ -710,6 +977,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
+	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
+	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
@@ -813,6 +1082,8 @@ static int asus_fw_attr_add(void)
 static int __init asus_fw_init(void)
 {
 	char *wmi_uid;
+	struct cpu_cores *cpu_cores_ctrl;
+	int err;
 
 	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
 	if (!wmi_uid)
@@ -825,6 +1096,19 @@ static int __init asus_fw_init(void)
 	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
 		return -ENODEV;
 
+	asus_armoury.cpu_cores_changeable = false;
+	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
+		cpu_cores_ctrl = init_cpu_cores_ctrl();
+		if (IS_ERR(cpu_cores_ctrl)) {
+			err = PTR_ERR(cpu_cores_ctrl);
+			pr_err("Could not initialise CPU core control: %d\n", err);
+			return err;
+		}
+
+		asus_armoury.cpu_cores = cpu_cores_ctrl;
+		asus_armoury.cpu_cores_changeable = true;
+	}
+
 	return asus_fw_attr_add();
 }
 
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 9f2c98df5fd7..c9f89f873251 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -160,4 +160,32 @@
 		.name = _fsname, .attrs = _attrname##_attrs			\
 	}
 
+/* CPU core attributes need a little different in setup */
+#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
+	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
+	static struct kobj_attribute attr_##_attrname##_current_value =	\
+		__ASUS_ATTR_RW(_attrname, current_value);		\
+	static struct kobj_attribute attr_##_attrname##_default_value = \
+		__ASUS_ATTR_RO(_attrname, default_value);		\
+	static struct kobj_attribute attr_##_attrname##_min_value =	\
+		__ASUS_ATTR_RO(_attrname, min_value);			\
+	static struct kobj_attribute attr_##_attrname##_max_value =	\
+		__ASUS_ATTR_RO(_attrname, max_value);			\
+	static struct kobj_attribute attr_##_attrname##_type =		\
+		__ASUS_ATTR_RO_AS(type, int_type_show);			\
+	static struct attribute *_attrname##_attrs[] = {		\
+		&attr_##_attrname##_current_value.attr,			\
+		&attr_##_attrname##_default_value.attr,			\
+		&attr_##_attrname##_min_value.attr,			\
+		&attr_##_attrname##_max_value.attr,			\
+		&attr_##_attrname##_scalar_increment.attr,		\
+		&attr_##_attrname##_display_name.attr,			\
+		&attr_##_attrname##_type.attr,				\
+		NULL							\
+	};								\
+	static const struct attribute_group _attrname##_attr_group = {	\
+		.name = _fsname, .attrs = _attrname##_attrs		\
+	}
+
 #endif /* _ASUS_ARMOURY_H_ */
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index a4f6bab93a6f..9a79dae97adf 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -137,6 +137,11 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+/* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
+#define ASUS_WMI_DEVID_CORES		0x001200D2
+ /* Maximum Intel E-core and P-core availability */
+#define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
+
 #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
-- 
2.51.2


