Return-Path: <platform-driver-x86+bounces-14658-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EFDBDC0A4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Oct 2025 03:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2A421928391
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Oct 2025 01:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8391D301483;
	Wed, 15 Oct 2025 01:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fEWmOysz"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351452FBE00
	for <platform-driver-x86@vger.kernel.org>; Wed, 15 Oct 2025 01:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760492987; cv=none; b=Wjh65pRtZhyn5EbTMU5JsS/QmjzO1VXZUQhAEhYJCL/cHv0eequZgRfAc4R4Oc6cvfxeu5r/CfH0VHgY3GsQjIYmKjFvfOMv3J29l+hgcypMTIvNuDaKYopBgt4FFQcRHhKouqPT9OTVE3MdGGGxptrv1R17vZpNG3AG3iMfTWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760492987; c=relaxed/simple;
	bh=Xyh2PtOtJ7shw45L8bxBXJvoyvGbJzYU76aAFEHPIcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHDsOgy5pxk4ZhllCf4ao80rKbrXwL/djLshhopinUSDvh3LZ/xXdKV4LNF78aLeAK+NaHn1uZf07WOwyi5QZH7lVC/71dU0gliMWzOwwxqk3ofTzfmwNVgzEatqXXJFenpgsnwpysVANcUoKBH8K9xc+21TSRx0nA6UADUZJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fEWmOysz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-46e504975dbso35699805e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Oct 2025 18:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760492984; x=1761097784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xh8xLpOXM3G32RBhCfX/Zae30+25W9kyaoHJO9zyZnI=;
        b=fEWmOysz0N+u6/LzFd+zvCqFF3FsIsKVLtoxo0lkBqsqtlrtHXZx3T0cWect5E9WrX
         VQyNhaV7YHzSkP0s/cHE2JiZTXIfK6riW13y0piBKvOeEYmR7EMsTt0mnAjNZG/C8ab8
         Ty/rbTdmPCwcbmKwTuHObl35RLFZGWFHopWImqZckTsnoQRLNwys04Qu8ni4cv6HwEUj
         IPNHC88nNP6fGiSdKC2net1KQs4WuR6dqrrDhMXHy3TDfueA8wTOlWCCyUBQQy7yYI3I
         /aQPWHGmI+vVlk5aq7ccm5Oz3zMedGCric1mzN59G5zY79J5f57Fylfzn/0T4vzUZ6hF
         8n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760492984; x=1761097784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xh8xLpOXM3G32RBhCfX/Zae30+25W9kyaoHJO9zyZnI=;
        b=GXZv3XOdnRTWo8H0JTcKds3wV2sWGUVfYLrzp8x1tU/odYbPX/3UXRPhY5U0Sfq8bB
         BrzpdKJOt7lG0WdYRadsE7qF/dbPyHADxMuWIjyKVb6NajMghsWj8uFcGw26CII1sDtz
         t1/XrQO8QDyf8r5nhs3vGb0Pyin44MWoOXGOX3FGaKaBf+4FtUIElOtC/BlwKpbECX91
         5O6T+Z2plNAS6Pjm2S2MUDb91NTDvl24beh+Z9RctQgNnZ5w2dVoxynXifDHGb6VDD6i
         dA+UP8QoH16r29poIa/yOVSdsJHobOd2q6h3REENCSKn6tWwy97zLpxQB+d1fBZc22Xe
         k6KA==
X-Gm-Message-State: AOJu0YyTOehGdUdlhPgJ0fIQihoAEWQq+p55O+HnsKXyAusz3P8K6PaQ
	JZT1kmrisSTGk6Kq/xS7d8Rl5Ja6ecXIO2OXl2y6f/g2rpgnfpikc9FrgBqROg==
X-Gm-Gg: ASbGnctGGvVWtEWsq/1gdFokh0qvOUYx1J/Zo8G+1zuUUOQlyR8f7ssDiu2ZwBzsYMF
	nSCTuEWLYrSKTMZw36/V3o2boOPUifrr0MkRPiW3wRCYSr+dfFSrWdAvFxw+Hp80KibjyUGE9Dv
	H9kjtkK7mmORxIfV04muEY+8oGLismFmJgNZ7zKdubwXzDRoXrfOTSvgEXTF3LOJ9RAzbt4Wi6E
	wI5nOHOjaw0ETbNLhZu85ZQ0H+Q3ESW8Tctg2Qt33FwJHo6K9CQk4goRvCjwqpNtCo7EcAQCuIa
	eIEPIRGNzKdB9Q+lWQS9Pfg5Xfxm91P91l8B8J75uyvHvoCiSWeaiBduFYGqCGl7tIj5Wyd5mmh
	WI+Atx/hmjhopfxtizZ/ONWPYx0jSzlivGJmho3NALLXTjw==
X-Google-Smtp-Source: AGHT+IFuhjpRtC6hKPQB/BlG4FAsty3ofNJUj5SoCw8GNUCnM3fhOCkAEpFladY9M9GbHoGW45aBMQ==
X-Received: by 2002:a05:6000:2910:b0:425:6866:ede8 with SMTP id ffacd0b85a97d-42666ac3686mr12928721f8f.8.1760492983460;
        Tue, 14 Oct 2025 18:49:43 -0700 (PDT)
Received: from denis-pc ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d49bsm27368995f8f.10.2025.10.14.18.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 18:49:43 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Alok Tiwari" <alok.a.tiwari@oracle.com>,
	"Derek John Clark" <derekjohn.clark@gmail.com>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	porfet828@gmail.com,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v14 5/9] platform/x86: asus-armoury: add core count control
Date: Wed, 15 Oct 2025 03:47:32 +0200
Message-ID: <20251015014736.1402045-6-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015014736.1402045-1-benato.denis96@gmail.com>
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Implement Intel core enablement under the asus-armoury module using the
fw_attributes class.

This allows users to enable or disable preformance or efficiency cores
depending on their requirements. After change a reboot is required.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c        | 258 ++++++++++++++++++++-
 drivers/platform/x86/asus-armoury.h        |  28 +++
 include/linux/platform_data/x86/asus-wmi.h |   5 +
 3 files changed, 290 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 3b49a27e397d..3d963025d84e 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -45,13 +45,49 @@
 #define ASUS_MINI_LED_2024_STRONG 0x01
 #define ASUS_MINI_LED_2024_OFF    0x02
 
+#define ASUS_POWER_CORE_MASK	GENMASK(15, 8)
+#define ASUS_PERF_CORE_MASK		GENMASK(7, 0)
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
+#define CPU_PERF_CORE_COUNT_MIN 4
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
 static struct asus_armoury_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 
+	struct cpu_cores *cpu_cores;
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
-} asus_armoury;
+	/*
+	 * Mutex to prevent big/little core count changes writing to same
+	 * endpoint at the same time. Must lock during attr store.
+	 */
+	struct mutex cpu_core_mutex;
+} asus_armoury = {
+	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex)
+};
 
 struct fw_attrs_group {
 	bool pending_reboot;
@@ -93,6 +129,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
 static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
 {
 	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
+	       !strcmp(attr->attr.name, "cores_performance") ||
+	       !strcmp(attr->attr.name, "cores_efficiency") ||
 	       !strcmp(attr->attr.name, "panel_hd_mode");
 }
 
@@ -171,6 +209,12 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
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
@@ -474,6 +518,207 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
 }
 ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
 
+static int init_max_cpu_cores(void)
+{
+	u32 cores;
+	int err;
+
+	asus_armoury.cpu_cores = kzalloc(sizeof(struct cpu_cores), GFP_KERNEL);
+	if (!asus_armoury.cpu_cores)
+		return -ENOMEM;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
+	if (err)
+		return err;
+
+	if ((cores & ASUS_WMI_DSTS_PRESENCE_BIT) == 0) {
+		pr_err("ACPI does not support CPU core count control\n");
+		err = -ENODEV;
+		goto init_max_cpu_cores_err;
+	}
+
+	asus_armoury.cpu_cores->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
+	asus_armoury.cpu_cores->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
+	if (err) {
+		pr_err("Could not get CPU core count: error %d\n", err);
+		goto init_max_cpu_cores_err;
+	}
+
+	asus_armoury.cpu_cores->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
+	asus_armoury.cpu_cores->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
+
+	asus_armoury.cpu_cores->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
+	asus_armoury.cpu_cores->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
+
+	return 0;
+
+init_max_cpu_cores_err:
+	kfree(asus_armoury.cpu_cores);
+	return err;
+}
+
+static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
+				enum cpu_core_type core_type, enum cpu_core_value core_value)
+{
+	u32 cores;
+
+	switch (core_value) {
+	case CPU_CORE_DEFAULT:
+	case CPU_CORE_MAX:
+		if (core_type == CPU_CORE_PERF)
+			return sysfs_emit(buf, "%u\n",
+					  asus_armoury.cpu_cores->max_perf_cores);
+		else
+			return sysfs_emit(buf, "%u\n",
+					  asus_armoury.cpu_cores->max_power_cores);
+	case CPU_CORE_MIN:
+		if (core_type == CPU_CORE_PERF)
+			return sysfs_emit(buf, "%u\n",
+					  asus_armoury.cpu_cores->min_perf_cores);
+		else
+			return sysfs_emit(buf, "%u\n",
+					  asus_armoury.cpu_cores->min_power_cores);
+	default:
+		break;
+	}
+
+	if (core_type == CPU_CORE_PERF)
+		cores = asus_armoury.cpu_cores->cur_perf_cores;
+	else
+		cores = asus_armoury.cpu_cores->cur_power_cores;
+
+	return sysfs_emit(buf, "%u\n", cores);
+}
+
+static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					 const char *buf, enum cpu_core_type core_type)
+{
+	u32 new_cores, perf_cores, power_cores, out_val, min, max;
+	int result, err;
+
+	result = kstrtou32(buf, 10, &new_cores);
+	if (result)
+		return result;
+
+	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
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
+		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
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
+ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
+		    "Set the max available performance cores");
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
+ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
+		    "Set the max available efficiency cores");
+
 /* Simple attribute creation */
 ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 		       "Show the current mode of charging");
@@ -495,6 +740,8 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
+	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
+	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
@@ -598,6 +845,7 @@ static int asus_fw_attr_add(void)
 static int __init asus_fw_init(void)
 {
 	char *wmi_uid;
+	int err;
 
 	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
 	if (!wmi_uid)
@@ -610,6 +858,14 @@ static int __init asus_fw_init(void)
 	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
 		return -ENODEV;
 
+	if (asus_wmi_is_present(ASUS_WMI_DEVID_CORES_MAX)) {
+		err = init_max_cpu_cores();
+		if (err) {
+			pr_err("Could not initialise CPU core control %d\n", err);
+			return err;
+		}
+	}
+
 	return asus_fw_attr_add();
 }
 
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 61675e7b5a60..a6c4caefdef9 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -161,4 +161,32 @@
 		.name = _fsname, .attrs = _attrname##_attrs			\
 	}
 
+/* CPU core attributes need a little different in setup */
+#define ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
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
2.51.0


