Return-Path: <platform-driver-x86+bounces-14850-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B36DBF3B2D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Oct 2025 23:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 445834FEC91
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Oct 2025 21:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD24336EE9;
	Mon, 20 Oct 2025 21:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/0TXMe7"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B8A33375E
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 21:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760995094; cv=none; b=PopvJpMIQcK8OtcO5qJCR/VIkHtWW2Ecbsjl0XtTvZfoT795uLsiUPx43tL9iy7ZGE374DaRv/O4Tzv7UxVaBHW2mOt35to+yanSlDuGdKmH1yPAGrGUimt1V9GN2SyO5d/0FhY4pORNU67okB4LLka3WC4Zktk7bJnvcc68D/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760995094; c=relaxed/simple;
	bh=z+CUcUTj7+VqDNuTjuT6ehZw7yVMAp9CMvA6563budo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=REHkOqvJhbna+7eu61iayrhKnvL+wP0myeEA4WnBKHmm3AbhwsJ7DsKjVQklDcyoRzt3TEEKJFP0oatC/ex8ZVhD9gQbEhDyMg9Dc4DKFqrTK7CfYBOUL1lcx+MERf5hFnWb8k1XfiaCu79rz3BpqB6VUsC+J+6Sqbn3e9tje+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/0TXMe7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47106fc51faso56420505e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Oct 2025 14:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760995088; x=1761599888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqgdTeItPru02uryxoaTF51KtDO292skFB8iHyBTK8M=;
        b=P/0TXMe79YFLXq4xHToU36vxRZTErYy4C8aZ/5wWDc0lgaqltKZh1tzOcftJucoSGR
         a/QvFGuZNgzMmLghOBDSoVSJz0C5XcCQihKfQ6cJJcTBc2aU91GZdOer2Ym0jh+RQopT
         lA/Q4rrc7VYnyQqtHim3OfC9nqwgxNdJ9tvmRmBhtSDE70d88COjHtz8hvAS/W0uKaT/
         N3UeCE+kSXQQeS4c/WRphJYdfOHUuAVCBnvJ40s8U5gPMMI97bbAHyC8RSOIj8xK3vZX
         4qEtvVtZk3uxNpJaHsZvj4mnciYlql2XK0LlF3XGxGwi4sg9uLOXm0o9a/6OkbjiUtrQ
         Xa4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760995088; x=1761599888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqgdTeItPru02uryxoaTF51KtDO292skFB8iHyBTK8M=;
        b=tAPdS+OiUCUoN41i37t0RH7VqfpTzyLtlkyfgdZ2+qB+kFN3Xjm2jAQt8bETZjTDi5
         zCKFgT+K+M2gldug7/nm2D0cQ56TNcg0HpAtHbrgrn717GqJWePW+Lgr7/JTCmcCLB6Y
         fgtSbXZFKkP2MZORfMsMRExCpIuW3gdfDBZwQqFWS6z2tXNvAM1M7roumjIgerXYEv76
         sg/hreCJksZgMamYDaZa4pHXkpqKF6mEDjgsFA/CCxoGnxN3ADG6+UtORr6oqUoNwiUe
         vylb19gh+IQcfQrMYWWSgadr5aotjAbypMJop+z9OAVECtElO/YkGnsoDccDK+qGzJkW
         705g==
X-Gm-Message-State: AOJu0Yyy2uHf9mw4QEKPSGJZ8pmKxHbRnPzSKvSNp53+HUkZcpsm9GbV
	dpmg/oqJI3LH8Bj5vs/snTBsDOfhfag841jtZbW1lKafqA169JkyHwkU
X-Gm-Gg: ASbGncsxL7NwYzmx2MxAtA6ySHrV9Pz4HmByYljc8tHDonHyE/od9WNuy8PE6mcxTbx
	zCJ/AeiZArtrZZC0QMtEQFPIUGcrL2S+TG8ZVhlkgXQCnT8HyZKlnEGFc1ioLJ9bCSHN9YMITow
	J4vlE84f9usGt02DhZFsk2hKKqqdtTYMjWkfJ4LQ9pInwIUvxJpBp9K8LVCdNd35n2mOFhC2B36
	hh3cdAgAKRF5la4KZ3velira7QWipgwtexkZne3kZi56ZGHcQtOWzpgEF+m3pbOdzLU5ltGrMgI
	vCg6fwQN8vsmn7Bgj023EGbp1Un13eI0d8OAhGtZBKX1iAImJkJzR01Uh1h71Xnz1aR4zi24x1r
	F2Fr26QjnOe02KSilLcOQTA0cOqbbbtPlHFPyFjZrzAAg+B4qx2exGJAS2wlOtCIaWzRD41B8ye
	jOC1VlfI6Hkt2I
X-Google-Smtp-Source: AGHT+IG59S9Bp7qkueTJwmwG9LBAdpC4Qaoovs0T9CBGAPzfHlSsBPQJeSNG5nISdXIAevQ+KpCTjw==
X-Received: by 2002:a05:6000:186a:b0:3ff:17ac:a347 with SMTP id ffacd0b85a97d-42704d7be45mr11365865f8f.27.1760995087453;
        Mon, 20 Oct 2025 14:18:07 -0700 (PDT)
Received: from denis-pc ([151.49.75.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a976sm17254971f8f.32.2025.10.20.14.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 14:18:06 -0700 (PDT)
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
Subject: [PATCH v15 9/9] platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs
Date: Mon, 20 Oct 2025 23:17:40 +0200
Message-ID: <20251020211740.719676-10-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251020211740.719676-1-benato.denis96@gmail.com>
References: <20251020211740.719676-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Adds the ppt_* and nv_* tuning knobs that are available via WMI methods
and adds proper min/max levels plus defaults.

The min/max are defined by ASUS and typically gained by looking at what
they allow in the ASUS Armoury Crate application - ASUS does not share
the values outside of this. It could also be possible to gain the AMD
values by use of ryzenadj and testing for the minimum stable value.

The general rule of thumb for adding to the match table is that if the
model range has a single CPU used throughout, then the DMI match can
omit the last letter of the model number as this is the GPU model.

If a min or max value is not provided it is assumed that the particular
setting is not supported. for example ppt_pl2_sppt_min/max is not set.
If a <ppt_setting>_def is not set then the default is assumed to be
<ppt_setting>_max

It is assumed that at least AC settings are available so that the
firmware attributes will be created - if no DC table is available
and power is on DC, then reading the attributes is -ENODEV.

Co-developed-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Mateusz Schyboll <dragonn@op.pl>
Tested-by: Porfet Lillian <porfet828@gmail.com>
---
 drivers/platform/x86/asus-armoury.c        |  296 ++++-
 drivers/platform/x86/asus-armoury.h        | 1238 ++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |    3 +
 3 files changed, 1531 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 63579034756a..9f0bbdc45ca0 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -30,6 +30,7 @@
 #include <linux/pci.h>
 #include <linux/platform_data/x86/asus-wmi.h>
 #include <linux/printk.h>
+#include <linux/power_supply.h>
 #include <linux/sysfs.h>
 
 #include "asus-armoury.h"
@@ -48,9 +49,23 @@
 #define ASUS_MINI_LED_2024_STRONG 0x01
 #define ASUS_MINI_LED_2024_OFF    0x02
 
+/* Power tunable attribute name defines */
+#define ATTR_PPT_PL1_SPL        "ppt_pl1_spl"
+#define ATTR_PPT_PL2_SPPT       "ppt_pl2_sppt"
+#define ATTR_PPT_PL3_FPPT       "ppt_pl3_fppt"
+#define ATTR_PPT_APU_SPPT       "ppt_apu_sppt"
+#define ATTR_PPT_PLATFORM_SPPT  "ppt_platform_sppt"
+#define ATTR_NV_DYNAMIC_BOOST   "nv_dynamic_boost"
+#define ATTR_NV_TEMP_TARGET     "nv_temp_target"
+#define ATTR_NV_BASE_TGP        "nv_base_tgp"
+#define ATTR_NV_TGP             "nv_tgp"
+
 #define ASUS_POWER_CORE_MASK	GENMASK(15, 8)
 #define ASUS_PERF_CORE_MASK	GENMASK(7, 0)
 
+#define ASUS_ROG_TUNABLE_DC 0
+#define ASUS_ROG_TUNABLE_AC 1
+
 enum cpu_core_type {
 	CPU_CORE_PERF = 0,
 	CPU_CORE_POWER,
@@ -78,6 +93,19 @@ struct cpu_cores {
 	u32 max_power_cores;
 };
 
+struct rog_tunables {
+	const struct power_limits *power_limits;
+	u32 ppt_pl1_spl;			// cpu
+	u32 ppt_pl2_sppt;			// cpu
+	u32 ppt_pl3_fppt;			// cpu
+	u32 ppt_apu_sppt;			// plat
+	u32 ppt_platform_sppt;		// plat
+
+	u32 nv_dynamic_boost;
+	u32 nv_temp_target;
+	u32 nv_tgp;
+};
+
 struct asus_armoury_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
@@ -98,6 +126,9 @@ struct asus_armoury_priv {
 	struct cpu_cores *cpu_cores;
 	bool cpu_cores_changeable;
 
+	/* Index 0 for DC, 1 for AC */
+	struct rog_tunables *rog_tunables[2];
+
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
 };
@@ -918,6 +949,15 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
 ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
 			 "Set the max available performance cores");
 
+/* Define helper to access the current power mode tunable values */
+static inline struct rog_tunables *get_current_tunables(void)
+{
+	if (power_supply_is_system_supplied())
+		return asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC];
+
+	return asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
+}
+
 static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
 					       char *buf)
 {
@@ -973,6 +1013,24 @@ ASUS_ATTR_GROUP_BOOL_RW(screen_auto_brightness, "screen_auto_brightness",
 			"Set the panel brightness to Off<0> or On<1>");
 ASUS_ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
 			"Show the eGPU connection status");
+ASUS_ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, ATTR_PPT_PL1_SPL, ASUS_WMI_DEVID_PPT_PL1_SPL,
+			    "Set the CPU slow package limit");
+ASUS_ATTR_GROUP_ROG_TUNABLE(ppt_pl2_sppt, ATTR_PPT_PL2_SPPT, ASUS_WMI_DEVID_PPT_PL2_SPPT,
+			    "Set the CPU fast package limit");
+ASUS_ATTR_GROUP_ROG_TUNABLE(ppt_pl3_fppt, ATTR_PPT_PL3_FPPT, ASUS_WMI_DEVID_PPT_PL3_FPPT,
+			    "Set the CPU fastest package limit");
+ASUS_ATTR_GROUP_ROG_TUNABLE(ppt_apu_sppt, ATTR_PPT_APU_SPPT, ASUS_WMI_DEVID_PPT_APU_SPPT,
+			    "Set the APU package limit");
+ASUS_ATTR_GROUP_ROG_TUNABLE(ppt_platform_sppt, ATTR_PPT_PLATFORM_SPPT, ASUS_WMI_DEVID_PPT_PLAT_SPPT,
+			    "Set the platform package limit");
+ASUS_ATTR_GROUP_ROG_TUNABLE(nv_dynamic_boost, ATTR_NV_DYNAMIC_BOOST, ASUS_WMI_DEVID_NV_DYN_BOOST,
+			    "Set the Nvidia dynamic boost limit");
+ASUS_ATTR_GROUP_ROG_TUNABLE(nv_temp_target, ATTR_NV_TEMP_TARGET, ASUS_WMI_DEVID_NV_THERM_TARGET,
+			    "Set the Nvidia max thermal limit");
+ASUS_ATTR_GROUP_ROG_TUNABLE(nv_tgp, "nv_tgp", ASUS_WMI_DEVID_DGPU_SET_TGP,
+			    "Set the additional TGP on top of the base TGP");
+ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_DGPU_BASE_TGP,
+				  "Read the base TGP value");
 
 /* If an attribute does not require any special case handling add it here */
 static const struct asus_attr_group armoury_attr_groups[] = {
@@ -983,6 +1041,16 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 
+	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
+	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
+	{ &ppt_pl3_fppt_attr_group, ASUS_WMI_DEVID_PPT_PL3_FPPT },
+	{ &ppt_apu_sppt_attr_group, ASUS_WMI_DEVID_PPT_APU_SPPT },
+	{ &ppt_platform_sppt_attr_group, ASUS_WMI_DEVID_PPT_PLAT_SPPT },
+	{ &nv_dynamic_boost_attr_group, ASUS_WMI_DEVID_NV_DYN_BOOST },
+	{ &nv_temp_target_attr_group, ASUS_WMI_DEVID_NV_THERM_TARGET },
+	{ &nv_base_tgp_attr_group, ASUS_WMI_DEVID_DGPU_BASE_TGP },
+	{ &nv_tgp_attr_group, ASUS_WMI_DEVID_DGPU_SET_TGP },
+
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
 	{ &mcu_powersave_attr_group, ASUS_WMI_DEVID_MCU_POWERSAVE },
@@ -991,8 +1059,75 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &screen_auto_brightness_attr_group, ASUS_WMI_DEVID_SCREEN_AUTO_BRIGHTNESS },
 };
 
+/**
+ * is_power_tunable_attr - Determines if an attribute is a power-related tunable
+ * @name: The name of the attribute to check
+ *
+ * This function checks if the given attribute name is related to power tuning.
+ *
+ * Return: true if the attribute is a power-related tunable, false otherwise
+ */
+static bool is_power_tunable_attr(const char *name)
+{
+	static const char * const power_tunable_attrs[] = {
+		ATTR_PPT_PL1_SPL,	ATTR_PPT_PL2_SPPT,
+		ATTR_PPT_PL3_FPPT,	ATTR_PPT_APU_SPPT,
+		ATTR_PPT_PLATFORM_SPPT, ATTR_NV_DYNAMIC_BOOST,
+		ATTR_NV_TEMP_TARGET,	ATTR_NV_BASE_TGP,
+		ATTR_NV_TGP
+	};
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(power_tunable_attrs); i++) {
+		if (!strcmp(name, power_tunable_attrs[i]))
+			return true;
+	}
+
+	return false;
+}
+
+/**
+ * has_valid_limit - Checks if a power-related attribute has a valid limit value
+ * @name: The name of the attribute to check
+ * @limits: Pointer to the power_limits structure containing limit values
+ *
+ * This function checks if a power-related attribute has a valid limit value.
+ * It returns false if limits is NULL or if the corresponding limit value is zero.
+ *
+ * Return: true if the attribute has a valid limit value, false otherwise
+ */
+static bool has_valid_limit(const char *name, const struct power_limits *limits)
+{
+	u32 limit_value = 0;
+
+	if (!limits)
+		return false;
+
+	if (!strcmp(name, ATTR_PPT_PL1_SPL))
+		limit_value = limits->ppt_pl1_spl_max;
+	else if (!strcmp(name, ATTR_PPT_PL2_SPPT))
+		limit_value = limits->ppt_pl2_sppt_max;
+	else if (!strcmp(name, ATTR_PPT_PL3_FPPT))
+		limit_value = limits->ppt_pl3_fppt_max;
+	else if (!strcmp(name, ATTR_PPT_APU_SPPT))
+		limit_value = limits->ppt_apu_sppt_max;
+	else if (!strcmp(name, ATTR_PPT_PLATFORM_SPPT))
+		limit_value = limits->ppt_platform_sppt_max;
+	else if (!strcmp(name, ATTR_NV_DYNAMIC_BOOST))
+		limit_value = limits->nv_dynamic_boost_max;
+	else if (!strcmp(name, ATTR_NV_TEMP_TARGET))
+		limit_value = limits->nv_temp_target_max;
+	else if (!strcmp(name, ATTR_NV_BASE_TGP) ||
+		 !strcmp(name, ATTR_NV_TGP))
+		limit_value = limits->nv_tgp_max;
+
+	return limit_value > 0;
+}
+
 static int asus_fw_attr_add(void)
 {
+	const struct power_limits *limits;
+	bool should_create;
+	const char *name;
 	int err, i;
 
 	asus_armoury.fw_attr_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
@@ -1049,12 +1184,29 @@ static int asus_fw_attr_add(void)
 		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
 			continue;
 
-		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
-					 armoury_attr_groups[i].attr_group);
-		if (err) {
-			pr_err("Failed to create sysfs-group for %s\n",
-			       armoury_attr_groups[i].attr_group->name);
-			goto err_remove_groups;
+		/* Always create by default, unless PPT is not present */
+		should_create = true;
+		name = armoury_attr_groups[i].attr_group->name;
+
+		/* Check if this is a power-related tunable requiring limits */
+		if (asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] &&
+		    asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]->power_limits &&
+		    is_power_tunable_attr(name)) {
+			limits = asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]->power_limits;
+			/* Check only AC: if not present then DC won't be either */
+			should_create = has_valid_limit(name, limits);
+			if (!should_create)
+				pr_debug("Missing max value for tunable %s\n", name);
+		}
+
+		if (should_create) {
+			err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
+						 armoury_attr_groups[i].attr_group);
+			if (err) {
+				pr_err("Failed to create sysfs-group for %s\n",
+				       armoury_attr_groups[i].attr_group->name);
+				goto err_remove_groups;
+			}
 		}
 	}
 
@@ -1083,6 +1235,132 @@ static int asus_fw_attr_add(void)
 
 /* Init / exit ****************************************************************/
 
+/* Set up the min/max and defaults for ROG tunables */
+static void init_rog_tunables(void)
+{
+	const struct power_limits *ac_limits, *dc_limits;
+	struct rog_tunables *ac_rog_tunables = NULL, *dc_rog_tunables = NULL;
+	const struct power_data *power_data;
+	const struct dmi_system_id *dmi_id;
+
+	/* Match the system against the power_limits table */
+	dmi_id = dmi_first_match(power_limits);
+	if (!dmi_id) {
+		pr_warn("No matching power limits found for this system\n");
+		return;
+	}
+
+	/* Get the power data for this system */
+	power_data = dmi_id->driver_data;
+	if (!power_data) {
+		pr_info("No power data available for this system\n");
+		return;
+	}
+
+	/* Initialize AC power tunables */
+	ac_limits = power_data->ac_data;
+	if (ac_limits) {
+		ac_rog_tunables = kzalloc(sizeof(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]),
+				GFP_KERNEL);
+		if (!ac_rog_tunables)
+			goto err_nomem;
+
+		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC] = ac_rog_tunables;
+		ac_rog_tunables->power_limits = ac_limits;
+
+		/* Set initial AC values */
+		ac_rog_tunables->ppt_pl1_spl =
+			ac_limits->ppt_pl1_spl_def ?
+				ac_limits->ppt_pl1_spl_def :
+				ac_limits->ppt_pl1_spl_max;
+
+		ac_rog_tunables->ppt_pl2_sppt =
+			ac_limits->ppt_pl2_sppt_def ?
+				ac_limits->ppt_pl2_sppt_def :
+				ac_limits->ppt_pl2_sppt_max;
+
+		ac_rog_tunables->ppt_pl3_fppt =
+			ac_limits->ppt_pl3_fppt_def ?
+				ac_limits->ppt_pl3_fppt_def :
+				ac_limits->ppt_pl3_fppt_max;
+
+		ac_rog_tunables->ppt_apu_sppt =
+			ac_limits->ppt_apu_sppt_def ?
+				ac_limits->ppt_apu_sppt_def :
+				ac_limits->ppt_apu_sppt_max;
+
+		ac_rog_tunables->ppt_platform_sppt =
+			ac_limits->ppt_platform_sppt_def ?
+				ac_limits->ppt_platform_sppt_def :
+				ac_limits->ppt_platform_sppt_max;
+
+		ac_rog_tunables->nv_dynamic_boost =
+			ac_limits->nv_dynamic_boost_max;
+		ac_rog_tunables->nv_temp_target =
+			ac_limits->nv_temp_target_max;
+		ac_rog_tunables->nv_tgp = ac_limits->nv_tgp_max;
+
+		pr_debug("AC power limits initialized for %s\n", dmi_id->matches[0].substr);
+	} else {
+		pr_debug("No AC PPT limits defined\n");
+	}
+
+	/* Initialize DC power tunables */
+	dc_limits = power_data->dc_data;
+	if (dc_limits) {
+		dc_rog_tunables = kzalloc(sizeof(*asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]),
+					  GFP_KERNEL);
+		if (!dc_rog_tunables) {
+			kfree(ac_rog_tunables);
+			goto err_nomem;
+		}
+
+		asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC] = dc_rog_tunables;
+		dc_rog_tunables->power_limits = dc_limits;
+
+		/* Set initial DC values */
+		dc_rog_tunables->ppt_pl1_spl =
+			dc_limits->ppt_pl1_spl_def ?
+				dc_limits->ppt_pl1_spl_def :
+				dc_limits->ppt_pl1_spl_max;
+
+		dc_rog_tunables->ppt_pl2_sppt =
+			dc_limits->ppt_pl2_sppt_def ?
+				dc_limits->ppt_pl2_sppt_def :
+				dc_limits->ppt_pl2_sppt_max;
+
+		dc_rog_tunables->ppt_pl3_fppt =
+			dc_limits->ppt_pl3_fppt_def ?
+				dc_limits->ppt_pl3_fppt_def :
+				dc_limits->ppt_pl3_fppt_max;
+
+		dc_rog_tunables->ppt_apu_sppt =
+			dc_limits->ppt_apu_sppt_def ?
+				dc_limits->ppt_apu_sppt_def :
+				dc_limits->ppt_apu_sppt_max;
+
+		dc_rog_tunables->ppt_platform_sppt =
+			dc_limits->ppt_platform_sppt_def ?
+				dc_limits->ppt_platform_sppt_def :
+				dc_limits->ppt_platform_sppt_max;
+
+		dc_rog_tunables->nv_dynamic_boost =
+			dc_limits->nv_dynamic_boost_max;
+		dc_rog_tunables->nv_temp_target =
+			dc_limits->nv_temp_target_max;
+		dc_rog_tunables->nv_tgp = dc_limits->nv_tgp_max;
+
+		pr_debug("DC power limits initialized for %s\n", dmi_id->matches[0].substr);
+	} else {
+		pr_debug("No DC PPT limits defined\n");
+	}
+
+	return;
+
+err_nomem:
+	pr_err("Failed to allocate memory for tunables\n");
+}
+
 static int __init asus_fw_init(void)
 {
 	char *wmi_uid;
@@ -1113,6 +1391,9 @@ static int __init asus_fw_init(void)
 		asus_armoury.cpu_cores_changeable = true;
 	}
 
+	init_rog_tunables();
+
+	/* Must always be last step to ensure data is available */
 	return asus_fw_attr_add();
 }
 
@@ -1135,6 +1416,9 @@ static void __exit asus_fw_exit(void)
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 	kset_unregister(asus_armoury.fw_attr_kset);
 	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+
+	kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_AC]);
+	kfree(asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC]);
 }
 
 module_init(asus_fw_init);
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index c9f89f873251..e3d8d396331c 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -8,6 +8,7 @@
 #ifndef _ASUS_ARMOURY_H_
 #define _ASUS_ARMOURY_H_
 
+#include <linux/dmi.h>
 #include <linux/types.h>
 #include <linux/platform_device.h>
 
@@ -188,4 +189,1241 @@
 		.name = _fsname, .attrs = _attrname##_attrs		\
 	}
 
+#define ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, _dispname)	\
+	ASUS_WMI_SHOW_INT(_attrname##_current_value, "%d\n", _wmi);		\
+	static struct kobj_attribute attr_##_attrname##_current_value =		\
+		__ASUS_ATTR_RO(_attrname, current_value);			\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);		\
+	static struct kobj_attribute attr_##_attrname##_type =			\
+		__ASUS_ATTR_RO_AS(type, int_type_show);				\
+	static struct attribute *_attrname##_attrs[] = {			\
+		&attr_##_attrname##_current_value.attr,				\
+		&attr_##_attrname##_display_name.attr,				\
+		&attr_##_attrname##_type.attr, NULL				\
+	};									\
+	static const struct attribute_group _attrname##_attr_group = {		\
+		.name = _fsname, .attrs = _attrname##_attrs			\
+	}
+
+/*
+ * ROG PPT attributes need a little different in setup as they
+ * require rog_tunables members.
+ */
+
+#define __ROG_TUNABLE_SHOW(_prop, _attrname, _val)				\
+	static ssize_t _attrname##_##_prop##_show(				\
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf)	\
+	{									\
+		struct rog_tunables *tunables = get_current_tunables();		\
+										\
+		if (!tunables || !tunables->power_limits)			\
+			return -ENODEV;						\
+										\
+		return sysfs_emit(buf, "%d\n", tunables->power_limits->_val);	\
+	}									\
+	static struct kobj_attribute attr_##_attrname##_##_prop =		\
+		__ASUS_ATTR_RO(_attrname, _prop)
+
+#define __ROG_TUNABLE_SHOW_DEFAULT(_attrname)					\
+	static ssize_t _attrname##_default_value_show(				\
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf)	\
+	{									\
+		struct rog_tunables *tunables = get_current_tunables();		\
+										\
+		if (!tunables || !tunables->power_limits)			\
+			return -ENODEV;						\
+										\
+		return sysfs_emit(						\
+			buf, "%d\n",						\
+			tunables->power_limits->_attrname##_def ?		\
+				tunables->power_limits->_attrname##_def :	\
+				tunables->power_limits->_attrname##_max);	\
+	}									\
+	static struct kobj_attribute attr_##_attrname##_default_value =		\
+		__ASUS_ATTR_RO(_attrname, default_value)
+
+#define __ROG_TUNABLE_RW(_attr, _wmi)						\
+	static ssize_t _attr##_current_value_store(				\
+		struct kobject *kobj, struct kobj_attribute *attr,		\
+		const char *buf, size_t count)					\
+	{									\
+		struct rog_tunables *tunables = get_current_tunables();		\
+										\
+		if (!tunables || !tunables->power_limits)			\
+			return -ENODEV;						\
+										\
+		if (tunables->power_limits->_attr##_min ==			\
+		    tunables->power_limits->_attr##_max)			\
+			return -EINVAL;						\
+										\
+		return attr_uint_store(kobj, attr, buf, count,			\
+				       tunables->power_limits->_attr##_min,	\
+				       tunables->power_limits->_attr##_max,	\
+				       &tunables->_attr, _wmi);			\
+	}									\
+	static ssize_t _attr##_current_value_show(				\
+		struct kobject *kobj, struct kobj_attribute *attr, char *buf)	\
+	{									\
+		struct rog_tunables *tunables = get_current_tunables();		\
+										\
+		if (!tunables)							\
+			return -ENODEV;						\
+										\
+		return sysfs_emit(buf, "%u\n", tunables->_attr);		\
+	}									\
+	static struct kobj_attribute attr_##_attr##_current_value =		\
+		__ASUS_ATTR_RW(_attr, current_value)
+
+#define ASUS_ATTR_GROUP_ROG_TUNABLE(_attrname, _fsname, _wmi, _dispname)	\
+	__ROG_TUNABLE_RW(_attrname, _wmi);				\
+	__ROG_TUNABLE_SHOW_DEFAULT(_attrname);				\
+	__ROG_TUNABLE_SHOW(min_value, _attrname, _attrname##_min);	\
+	__ROG_TUNABLE_SHOW(max_value, _attrname, _attrname##_max);	\
+	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
+	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
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
+/* Default is always the maximum value unless *_def is specified */
+struct power_limits {
+	u8 ppt_pl1_spl_min;
+	u8 ppt_pl1_spl_def;
+	u8 ppt_pl1_spl_max;
+	u8 ppt_pl2_sppt_min;
+	u8 ppt_pl2_sppt_def;
+	u8 ppt_pl2_sppt_max;
+	u8 ppt_pl3_fppt_min;
+	u8 ppt_pl3_fppt_def;
+	u8 ppt_pl3_fppt_max;
+	u8 ppt_apu_sppt_min;
+	u8 ppt_apu_sppt_def;
+	u8 ppt_apu_sppt_max;
+	u8 ppt_platform_sppt_min;
+	u8 ppt_platform_sppt_def;
+	u8 ppt_platform_sppt_max;
+	/* Nvidia GPU specific, default is always max */
+	u8 nv_dynamic_boost_def; // unused. exists for macro
+	u8 nv_dynamic_boost_min;
+	u8 nv_dynamic_boost_max;
+	u8 nv_temp_target_def; // unused. exists for macro
+	u8 nv_temp_target_min;
+	u8 nv_temp_target_max;
+	u8 nv_tgp_def; // unused. exists for macro
+	u8 nv_tgp_min;
+	u8 nv_tgp_max;
+};
+
+struct power_data {
+		const struct power_limits *ac_data;
+		const struct power_limits *dc_data;
+		bool requires_fan_curve;
+};
+
+/*
+ * For each available attribute there must be a min and a max.
+ * _def is not required and will be assumed to be default == max if missing.
+ */
+static const struct dmi_system_id power_limits[] = {
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA401W"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 75,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 30,
+				.ppt_pl2_sppt_min = 31,
+				.ppt_pl2_sppt_max = 44,
+				.ppt_pl3_fppt_min = 45,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA507N"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA507R"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80
+			},
+			.dc_data = NULL,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA507X"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA507Z"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 105,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 15,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 60,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA607P"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_def = 100,
+				.ppt_pl1_spl_max = 135,
+				.ppt_pl2_sppt_min = 30,
+				.ppt_pl2_sppt_def = 115,
+				.ppt_pl2_sppt_max = 135,
+				.ppt_pl3_fppt_min = 30,
+				.ppt_pl3_fppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_def = 60,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 25,
+				.ppt_pl3_fppt_max = 80,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA608WI"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 90,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 90,
+				.ppt_pl2_sppt_max = 90,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_def = 90,
+				.ppt_pl3_fppt_max = 90,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_def = 65,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA617NS"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 80,
+				.ppt_platform_sppt_min = 30,
+				.ppt_platform_sppt_max = 120,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 25,
+				.ppt_apu_sppt_max = 35,
+				.ppt_platform_sppt_min = 45,
+				.ppt_platform_sppt_max = 100,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA617NT"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 80,
+				.ppt_platform_sppt_min = 30,
+				.ppt_platform_sppt_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 45,
+				.ppt_platform_sppt_min = 30,
+				.ppt_platform_sppt_max = 50,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FA617XS"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 80,
+				.ppt_platform_sppt_min = 30,
+				.ppt_platform_sppt_max = 120,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 25,
+				.ppt_apu_sppt_max = 35,
+				.ppt_platform_sppt_min = 45,
+				.ppt_platform_sppt_max = 100,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FX507VI"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 135,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 60,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "FX507Z"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 15,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 60,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA401Q"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 15,
+				.ppt_pl2_sppt_max = 80,
+			},
+			.dc_data = NULL,
+		},
+	},
+	{
+		.matches = {
+			// This model is full AMD. No Nvidia dGPU.
+			DMI_MATCH(DMI_BOARD_NAME, "GA402R"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 80,
+				.ppt_platform_sppt_min = 30,
+				.ppt_platform_sppt_max = 115,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 25,
+				.ppt_apu_sppt_def = 30,
+				.ppt_apu_sppt_max = 45,
+				.ppt_platform_sppt_min = 40,
+				.ppt_platform_sppt_max = 60,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA402X"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_def = 65,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 35,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA403U"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 65,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 35,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA503R"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 65,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 60,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA605W"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 31,
+				.ppt_pl2_sppt_max = 44,
+				.ppt_pl3_fppt_min = 45,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU603Z"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 60,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 40,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 40,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			}
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU604V"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 65,
+				.ppt_pl1_spl_max = 120,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_max = 150,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 40,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 40,
+				.ppt_pl2_sppt_max = 60,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605CW"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 45,
+				.ppt_pl1_spl_max = 85,
+				.ppt_pl2_sppt_min = 56,
+				.ppt_pl2_sppt_max = 110,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 80,
+				.nv_tgp_def = 90,
+				.nv_tgp_max = 110,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 85,
+				.ppt_pl2_sppt_min = 32,
+				.ppt_pl2_sppt_max = 110,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GU605M"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 38,
+				.ppt_pl2_sppt_max = 53,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GV301Q"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_max = 80,
+			},
+			.dc_data = NULL,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GV301R"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 45,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 54,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 35,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GV601R"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 100,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_def = 80,
+				.ppt_pl3_fppt_max = 125,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 28,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 54,
+				.ppt_pl2_sppt_max = 60,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_def = 80,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GV601V"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 100,
+				.ppt_pl1_spl_max = 110,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 40,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 40,
+				.ppt_pl2_sppt_max = 60,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GX650P"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 110,
+				.ppt_pl1_spl_max = 130,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 125,
+				.ppt_pl2_sppt_max = 130,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_def = 125,
+				.ppt_pl3_fppt_max = 135,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_def = 35,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_def = 42,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G513I"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				/* Yes this laptop is very limited */
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 15,
+				.ppt_pl2_sppt_max = 80,
+			},
+			.dc_data = NULL,
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G513QM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				/* Yes this laptop is very limited */
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 100,
+				.ppt_pl2_sppt_min = 15,
+				.ppt_pl2_sppt_max = 190,
+			},
+			.dc_data = NULL,
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G513R"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 35,
+				.ppt_pl1_spl_max = 90,
+				.ppt_pl2_sppt_min = 54,
+				.ppt_pl2_sppt_max = 100,
+				.ppt_pl3_fppt_min = 54,
+				.ppt_pl3_fppt_max = 125,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 50,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 50,
+				.ppt_pl3_fppt_min = 28,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G614J"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 140,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 175,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 70,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G634J"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 140,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 175,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 70,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G713PV"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_def = 120,
+				.ppt_pl1_spl_max = 130,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 125,
+				.ppt_pl2_sppt_max = 130,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 125,
+				.ppt_pl3_fppt_max = 130,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 75,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G733C"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 170,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 175,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 35,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G733P"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 30,
+				.ppt_pl1_spl_def = 100,
+				.ppt_pl1_spl_max = 130,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_def = 125,
+				.ppt_pl2_sppt_max = 130,
+				.ppt_pl3_fppt_min = 65,
+				.ppt_pl3_fppt_def = 125,
+				.ppt_pl3_fppt_max = 130,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 65,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 65,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 75,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G814J"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 140,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 140,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 70,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "G834J"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_max = 140,
+				.ppt_pl2_sppt_min = 28,
+				.ppt_pl2_sppt_max = 175,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 25,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 55,
+				.ppt_pl2_sppt_min = 25,
+				.ppt_pl2_sppt_max = 70,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+			.requires_fan_curve = true,
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "H7606W"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 35,
+				.ppt_pl2_sppt_max = 80,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_max = 80,
+				.nv_dynamic_boost_min = 5,
+				.nv_dynamic_boost_max = 20,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+				.nv_tgp_min = 55,
+				.nv_tgp_max = 85,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 25,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 31,
+				.ppt_pl2_sppt_max = 44,
+				.ppt_pl3_fppt_min = 45,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC71"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_max = 30,
+				.ppt_pl2_sppt_min = 15,
+				.ppt_pl2_sppt_max = 43,
+				.ppt_pl3_fppt_min = 15,
+				.ppt_pl3_fppt_max = 53,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_def = 15,
+				.ppt_pl1_spl_max = 25,
+				.ppt_pl2_sppt_min = 15,
+				.ppt_pl2_sppt_def = 20,
+				.ppt_pl2_sppt_max = 30,
+				.ppt_pl3_fppt_min = 15,
+				.ppt_pl3_fppt_def = 25,
+				.ppt_pl3_fppt_max = 35,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC72"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_max = 30,
+				.ppt_pl2_sppt_min = 15,
+				.ppt_pl2_sppt_max = 43,
+				.ppt_pl3_fppt_min = 15,
+				.ppt_pl3_fppt_max = 53,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_def = 17,
+				.ppt_pl1_spl_max = 25,
+				.ppt_pl2_sppt_min = 15,
+				.ppt_pl2_sppt_def = 24,
+				.ppt_pl2_sppt_max = 30,
+				.ppt_pl3_fppt_min = 15,
+				.ppt_pl3_fppt_def = 30,
+				.ppt_pl3_fppt_max = 35,
+			},
+		},
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "RC73"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 14,
+				.ppt_pl2_sppt_max = 45,
+				.ppt_pl3_fppt_min = 19,
+				.ppt_pl3_fppt_max = 55,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 7,
+				.ppt_pl1_spl_def = 17,
+				.ppt_pl1_spl_max = 35,
+				.ppt_pl2_sppt_min = 13,
+				.ppt_pl2_sppt_def = 21,
+				.ppt_pl2_sppt_max = 45,
+				.ppt_pl3_fppt_min = 19,
+				.ppt_pl3_fppt_def = 26,
+				.ppt_pl3_fppt_max = 55,
+			},
+		},
+	},
+	{}
+};
+
 #endif /* _ASUS_ARMOURY_H_ */
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 3d236f8498d8..8fedf818563f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -145,6 +145,9 @@
 
 #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
 
+#define ASUS_WMI_DEVID_DGPU_BASE_TGP	0x00120099
+#define ASUS_WMI_DEVID_DGPU_SET_TGP	0x00120098
+
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
 #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
-- 
2.51.1


