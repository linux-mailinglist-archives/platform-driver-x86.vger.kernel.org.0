Return-Path: <platform-driver-x86+bounces-10313-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E66B0A68565
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 Mar 2025 08:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E19B3BFE4A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 19 Mar 2025 07:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7983250C1E;
	Wed, 19 Mar 2025 06:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b="RNbeHo9v";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="G0oSPTR5"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE4C2500BC;
	Wed, 19 Mar 2025 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742367560; cv=none; b=NTYD6ZedxXUKcNpkwH4WP1bs17L9aQNfDdWY71YlYBXQ8hFpkmO33XHW0KaykqNT3Hp/PhXowWHVgVqmN4UhBtRFLrCNI+BOaUMWim8+I08552LB9nwRi9jl+vwacPHrToYVcDK4BrZdztzWSvoA60TbeoTgIQDVQJ9u6TOF798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742367560; c=relaxed/simple;
	bh=La5b/RIKd0Fy6rboPeLTzGrGCNWMsjPX1sFt9mZnZJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lygOpQO/yZwqZApt3MortMXx90qCBfRt1oU048Uw2bQUqUVlQPr954KzdYGILUFES/1GBXNGPWwEM8Y9nFbFJVRlZVaz2WsR2xu/oSo9yV1vYFDOmisFuFYgoJrGUh8IsGiXOLY1n+TkgosQwtJlR0Q6nEYuGxsxFzPlJf2S/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev; spf=none smtp.mailfrom=ljones.dev; dkim=pass (2048-bit key) header.d=ljones.dev header.i=@ljones.dev header.b=RNbeHo9v; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=G0oSPTR5; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ljones.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ljones.dev
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9703725401E0;
	Wed, 19 Mar 2025 02:59:16 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Wed, 19 Mar 2025 02:59:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1742367556; x=
	1742453956; bh=8g716C0xmK/Kr0plusDVuTFWsU1T9gwNGH7f9/RL7d4=; b=R
	NbeHo9vXi+kELjQVJ7liPqLzyPo5KGv1cS2Myg8DEtISoWZJtspOYbC0ws6DrJLI
	DaBld6rlgR9YP55o0OkOS7ylpSS7TzH8GFbNgBOMtyRqHnGLRjV3zZJpZ1ens1G+
	tHQ5IFC2eoXUk6nvOO9IellN1gq5eXt89lQpyoiRAT540KPp6vdVim8+qxv0M/AF
	xxQv7sMksUd96HyXps/D1BGtKFxV1sMXoYQBUYiukf7YInm0fz39a5TVqHsvFHOx
	DFKdMBwVYVLjDwSc6Pc3/g8ajfH8zJrcOvNcXNrFani9HTy8QzQMwRwfSqJt79V/
	Wj5yjmNRH+Grhi7XYVdnw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1742367556; x=1742453956; bh=8
	g716C0xmK/Kr0plusDVuTFWsU1T9gwNGH7f9/RL7d4=; b=G0oSPTR5IIaBRhW+W
	AYWQ989Lalar0eBTDsh1oTwnzrKsXWt6+e3usMQZHGg7C445sSkG/7F+LB9vH8RH
	ADuEVraD9N4V+jSVQwJxV1enXl/7Sfn+BOmGLSItRyU57HK/Tkg6lvZaf5rBmTi7
	i1b2fRsqltjnjswBUS3Wyr2YPXL2QPbPL/0nnsi8VKGDXJOS57VU39rwnrY8An+Y
	4cjP+WATvTubKzlidHW8mgxXH1CmAQPfISuOQDjsIsMf77Pbu88ic/4F2InK45F4
	IaRzG0dQiQg0944gAd5GGcv3kDDRHSwbP4ml3YatdjW4zbzQAupS35NT7oNAb5EU
	ocD7w==
X-ME-Sender: <xms:RGvaZ6VU6FHG-sgxlO4XSf8Y3ts_l6qq1ozR0hwm5u-4n8UD0W_dVA>
    <xme:RGvaZ2lkCgINWZFj6D6fcWFg10U8PVfYVk9_oo-B5ardGyiKCmXHlRXAnY3joyZHn
    AseVaQOJHa0R2j-lsw>
X-ME-Received: <xmr:RGvaZ-Zuz8oC67IgX3_KTZ89-eTHS_bXD3B4-1hLK90uJzdSluzPVXDLmZZskIoCGd_DoujZ5aDHBKwBtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeegieejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepnfhukhgvucflohhnvghsuceolhhukhgvsehljhhonhgvshdruggvvh
    eqnecuggftrfgrthhtvghrnhepueeuleeffeeihfelhffhheelfeffgeetuefhheevkeet
    uedugfetfeetlefhieejnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
    hilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvhdpnhgspghrtghpthhtohepiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvgh
    gvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgr
    thdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinh
    htvghlrdgtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekiees
    vhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrghrihhordhlihhmohhntg
    hivghllhhosegrmhgurdgtohhmpdhrtghpthhtoheplhhukhgvsehljhhonhgvshdruggv
    vh
X-ME-Proxy: <xmx:RGvaZxVI4Kw2b2E92nOLCkJm63cPfvaVLhpu9Cfud9bP6SvlJXUFJA>
    <xmx:RGvaZ0lT4QG0fBUK4cEEYrmVVP_HZiUZv4NwiQsPBYgCidNnTqTaCQ>
    <xmx:RGvaZ2eo9tMPvd_-OhCkPKDQhOqmBrsAUN4DS8M1Gt2WL27jLeO9Dg>
    <xmx:RGvaZ2HP4962UY-ZbDvOd4kCooHz8XSIgVJNLYR1NNzqRjdCMFlDgA>
    <xmx:RGvaZztNrqcLnVgpAKNABIIlqCeVHy6KfgrmhrsUhqrmlSiNf58iEZLw>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 19 Mar 2025 02:59:12 -0400 (EDT)
From: Luke Jones <luke@ljones.dev>
To: linux-kernel@vger.kernel.org
Cc: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	mario.limonciello@amd.com,
	"Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v8 8/8] platform/x86: asus-armoury: add ppt_* and nv_* tuning knobs
Date: Wed, 19 Mar 2025 19:58:27 +1300
Message-ID: <20250319065827.53478-9-luke@ljones.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319065827.53478-1-luke@ljones.dev>
References: <20250319065827.53478-1-luke@ljones.dev>
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

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-armoury.c        |  299 +++++-
 drivers/platform/x86/asus-armoury.h        | 1087 +++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |    3 +
 3 files changed, 1382 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 802c304e2ebc..84abc92bd365 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -21,6 +21,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/platform_data/x86/asus-wmi.h>
+#include <linux/power_supply.h>
 #include <linux/types.h>
 
 #include "asus-armoury.h"
@@ -39,6 +40,17 @@
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
 #define ASUS_POWER_CORE_MASK GENMASK(15, 8)
 #define ASUS_PERF_CORE_MASK GENMASK(7, 0)
 
@@ -67,11 +79,26 @@ struct cpu_cores {
 	u32 max_power_cores;
 };
 
+struct rog_tunables {
+	const struct power_limits *power_limits;
+	u32 ppt_pl1_spl; // cpu
+	u32 ppt_pl2_sppt; // cpu
+	u32 ppt_pl3_fppt; // cpu
+	u32 ppt_apu_sppt; // plat
+	u32 ppt_platform_sppt; // plat
+
+	u32 nv_dynamic_boost;
+	u32 nv_temp_target;
+	u32 nv_tgp;
+};
+
 static struct asus_armoury_priv {
 	struct device *fw_attr_dev;
 	struct kset *fw_attr_kset;
 
 	struct cpu_cores *cpu_cores;
+	/* Index 0 for DC, 1 for AC */
+	struct rog_tunables *rog_tunables[2];
 	u32 mini_led_dev_id;
 	u32 gpu_mux_dev_id;
 	/*
@@ -740,7 +767,34 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
 ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
 		    "Set the max available efficiency cores");
 
+/* Define helper to access the current power mode tunable values */
+static inline struct rog_tunables *get_current_tunables(void)
+{
+	return asus_armoury
+		.rog_tunables[power_supply_is_system_supplied() ? 1 : 0];
+}
+
 /* Simple attribute creation */
+ATTR_GROUP_ROG_TUNABLE(ppt_pl1_spl, ATTR_PPT_PL1_SPL, ASUS_WMI_DEVID_PPT_PL1_SPL,
+		       "Set the CPU slow package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_pl2_sppt, ATTR_PPT_PL2_SPPT, ASUS_WMI_DEVID_PPT_PL2_SPPT,
+		       "Set the CPU fast package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_pl3_fppt, ATTR_PPT_PL3_FPPT, ASUS_WMI_DEVID_PPT_FPPT,
+		       "Set the CPU fastest package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_apu_sppt, ATTR_PPT_APU_SPPT, ASUS_WMI_DEVID_PPT_APU_SPPT,
+		       "Set the APU package limit");
+ATTR_GROUP_ROG_TUNABLE(ppt_platform_sppt, ATTR_PPT_PLATFORM_SPPT, ASUS_WMI_DEVID_PPT_PLAT_SPPT,
+		       "Set the platform package limit");
+ATTR_GROUP_ROG_TUNABLE(nv_dynamic_boost, ATTR_NV_DYNAMIC_BOOST, ASUS_WMI_DEVID_NV_DYN_BOOST,
+		       "Set the Nvidia dynamic boost limit");
+ATTR_GROUP_ROG_TUNABLE(nv_temp_target, ATTR_NV_TEMP_TARGET, ASUS_WMI_DEVID_NV_THERM_TARGET,
+		       "Set the Nvidia max thermal limit");
+ATTR_GROUP_ROG_TUNABLE(nv_tgp, "nv_tgp", ASUS_WMI_DEVID_DGPU_SET_TGP,
+		       "Set the additional TGP on top of the base TGP");
+ATTR_GROUP_INT_VALUE_ONLY_RO(nv_base_tgp, ATTR_NV_BASE_TGP, ASUS_WMI_DEVID_DGPU_BASE_TGP,
+			     "Read the base TGP value");
+
+
 ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 		       "Show the current mode of charging");
 
@@ -767,6 +821,16 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
 
+	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
+	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
+	{ &ppt_pl3_fppt_attr_group, ASUS_WMI_DEVID_PPT_FPPT },
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
@@ -774,8 +838,75 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &panel_hd_mode_attr_group, ASUS_WMI_DEVID_PANEL_HD },
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
+	for (int i = 0; i < ARRAY_SIZE(power_tunable_attrs); i++) {
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
@@ -832,12 +963,33 @@ static int asus_fw_attr_add(void)
 		if (!asus_wmi_is_present(armoury_attr_groups[i].wmi_devid))
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
+		if (asus_armoury.rog_tunables[1] && asus_armoury.rog_tunables[1]->power_limits &&
+			is_power_tunable_attr(name)) {
+			limits = asus_armoury.rog_tunables[1]->power_limits;
+			/* Check only AC, if DC is not present then AC won't be either */
+			should_create = has_valid_limit(name, limits);
+			if (!should_create) {
+				pr_debug(
+					"Missing max value on %s for tunable: %s\n",
+					dmi_get_system_info(DMI_BOARD_NAME),
+					name);
+			}
+		}
+
+		if (should_create) {
+			err = sysfs_create_group(
+				&asus_armoury.fw_attr_kset->kobj,
+				armoury_attr_groups[i].attr_group);
+			if (err) {
+				pr_err("Failed to create sysfs-group for %s\n",
+				       armoury_attr_groups[i].attr_group->name);
+				goto err_remove_groups;
+			}
 		}
 	}
 
@@ -866,6 +1018,135 @@ static int asus_fw_attr_add(void)
 
 /* Init / exit ****************************************************************/
 
+/* Set up the min/max and defaults for ROG tunables */
+static void init_rog_tunables(void)
+{
+	const struct power_limits *ac_limits, *dc_limits;
+	const struct power_data *power_data;
+	const struct dmi_system_id *dmi_id;
+	bool ac_initialized = false, dc_initialized = false;
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
+		asus_armoury.rog_tunables[1] =
+			kzalloc(sizeof(struct rog_tunables), GFP_KERNEL);
+		if (!asus_armoury.rog_tunables[1])
+			goto err_nomem;
+
+		asus_armoury.rog_tunables[1]->power_limits = ac_limits;
+
+		/* Set initial AC values */
+		asus_armoury.rog_tunables[1]->ppt_pl1_spl =
+			ac_limits->ppt_pl1_spl_def ?
+				ac_limits->ppt_pl1_spl_def :
+				ac_limits->ppt_pl1_spl_max;
+
+		asus_armoury.rog_tunables[1]->ppt_pl2_sppt =
+			ac_limits->ppt_pl2_sppt_def ?
+				ac_limits->ppt_pl2_sppt_def :
+				ac_limits->ppt_pl2_sppt_max;
+
+		asus_armoury.rog_tunables[1]->ppt_pl3_fppt =
+			ac_limits->ppt_pl3_fppt_def ?
+				ac_limits->ppt_pl3_fppt_def :
+				ac_limits->ppt_pl3_fppt_max;
+
+		asus_armoury.rog_tunables[1]->ppt_apu_sppt =
+			ac_limits->ppt_apu_sppt_def ?
+				ac_limits->ppt_apu_sppt_def :
+				ac_limits->ppt_apu_sppt_max;
+
+		asus_armoury.rog_tunables[1]->ppt_platform_sppt =
+			ac_limits->ppt_platform_sppt_def ?
+				ac_limits->ppt_platform_sppt_def :
+				ac_limits->ppt_platform_sppt_max;
+
+		asus_armoury.rog_tunables[1]->nv_dynamic_boost =
+			ac_limits->nv_dynamic_boost_max;
+		asus_armoury.rog_tunables[1]->nv_temp_target =
+			ac_limits->nv_temp_target_max;
+		asus_armoury.rog_tunables[1]->nv_tgp = ac_limits->nv_tgp_max;
+
+		ac_initialized = true;
+		pr_debug("AC power limits initialized for %s\n", dmi_id->matches[0].substr);
+	}
+
+	/* Initialize DC power tunables */
+	dc_limits = power_data->dc_data;
+	if (dc_limits) {
+		asus_armoury.rog_tunables[0] =
+			kzalloc(sizeof(struct rog_tunables), GFP_KERNEL);
+		if (!asus_armoury.rog_tunables[0]) {
+			if (ac_initialized)
+				kfree(asus_armoury.rog_tunables[1]);
+			goto err_nomem;
+		}
+
+		asus_armoury.rog_tunables[0]->power_limits = dc_limits;
+
+		/* Set initial DC values */
+		asus_armoury.rog_tunables[0]->ppt_pl1_spl =
+			dc_limits->ppt_pl1_spl_def ?
+				dc_limits->ppt_pl1_spl_def :
+				dc_limits->ppt_pl1_spl_max;
+
+		asus_armoury.rog_tunables[0]->ppt_pl2_sppt =
+			dc_limits->ppt_pl2_sppt_def ?
+				dc_limits->ppt_pl2_sppt_def :
+				dc_limits->ppt_pl2_sppt_max;
+
+		asus_armoury.rog_tunables[0]->ppt_pl3_fppt =
+			dc_limits->ppt_pl3_fppt_def ?
+				dc_limits->ppt_pl3_fppt_def :
+				dc_limits->ppt_pl3_fppt_max;
+
+		asus_armoury.rog_tunables[0]->ppt_apu_sppt =
+			dc_limits->ppt_apu_sppt_def ?
+				dc_limits->ppt_apu_sppt_def :
+				dc_limits->ppt_apu_sppt_max;
+
+		asus_armoury.rog_tunables[0]->ppt_platform_sppt =
+			dc_limits->ppt_platform_sppt_def ?
+				dc_limits->ppt_platform_sppt_def :
+				dc_limits->ppt_platform_sppt_max;
+
+		asus_armoury.rog_tunables[0]->nv_dynamic_boost =
+			dc_limits->nv_dynamic_boost_max;
+		asus_armoury.rog_tunables[0]->nv_temp_target =
+			dc_limits->nv_temp_target_max;
+		asus_armoury.rog_tunables[0]->nv_tgp = dc_limits->nv_tgp_max;
+
+		dc_initialized = true;
+		pr_debug("DC power limits initialized for %s\n", dmi_id->matches[0].substr);
+	}
+
+	if (!ac_initialized)
+		pr_debug("No AC PPT limits defined\n");
+
+	if (!dc_initialized)
+		pr_debug("No DC PPT limits defined\n");
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
@@ -895,6 +1176,9 @@ static int __init asus_fw_init(void)
 		}
 	}
 
+	init_rog_tunables();
+
+	/* Must always be last step to ensure data is available */
 	return asus_fw_attr_add();
 }
 
@@ -903,6 +1187,9 @@ static void __exit asus_fw_exit(void)
 	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
 	kset_unregister(asus_armoury.fw_attr_kset);
 	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+
+	kfree(asus_armoury.rog_tunables[0]);
+	kfree(asus_armoury.rog_tunables[1]);
 }
 
 module_init(asus_fw_init);
diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 584a75df113d..438768ea14cc 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -8,6 +8,7 @@
 #ifndef _ASUS_ARMOURY_H_
 #define _ASUS_ARMOURY_H_
 
+#include <linux/dmi.h>
 #include <linux/types.h>
 #include <linux/platform_device.h>
 
@@ -63,7 +64,6 @@
 	static struct kobj_attribute attr_##_attrname##_##_prop =		\
 		__ASUS_ATTR_RO(_attrname, _prop)
 
-
 #define __ATTR_RO_INT_GROUP_ENUM(_attrname, _wmi, _fsname, _possible, _dispname)\
 	WMI_SHOW_INT(_attrname##_current_value, "%d\n", _wmi);			\
 	static struct kobj_attribute attr_##_attrname##_current_value =		\
@@ -190,4 +190,1089 @@
 		.name = _fsname, .attrs = _attrname##_attrs		\
 	}
 
+#define ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, _dispname)	\
+	WMI_SHOW_INT(_attrname##_current_value, "%d\n", _wmi);			\
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
+#define ATTR_GROUP_ROG_TUNABLE(_attrname, _fsname, _wmi, _dispname)	\
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
+ * For each avilable attribute there must be a min and a max.
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
+			}
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
+			.dc_data = NULL
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
+			}
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
+			}
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
+			}
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
+				.ppt_platform_sppt_max = 120
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 25,
+				.ppt_apu_sppt_max = 35,
+				.ppt_platform_sppt_min = 45,
+				.ppt_platform_sppt_max = 100
+			}
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
+				.ppt_platform_sppt_max = 115
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_apu_sppt_min = 15,
+				.ppt_apu_sppt_max = 45,
+				.ppt_platform_sppt_min = 30,
+				.ppt_platform_sppt_max = 50
+			}
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
+			}
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
+			.dc_data = NULL
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
+			}
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
+				.ppt_pl3_fppt_max = 65
+			}
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
+				/* Only allowed in AC mode */
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
+				/* Only allowed in AC mode */
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
+			}
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
+			.dc_data = NULL
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
+			}
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
+				.ppt_pl2_sppt_def = 40,
+				.ppt_pl2_sppt_max = 60,
+				.ppt_pl3_fppt_min = 35,
+				.ppt_pl3_fppt_def = 80,
+				.ppt_pl3_fppt_max = 65,
+				.nv_temp_target_min = 75,
+				.nv_temp_target_max = 87,
+			}
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
+			}
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
+			}
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
+			}
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
+				.ppt_pl3_fppt_max = 53
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
+				.ppt_pl3_fppt_max = 35
+			}
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
+				.ppt_pl3_fppt_max = 53
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
+				.ppt_pl3_fppt_max = 35
+			}
+		},
+	},
+	{}
+};
+
 #endif /* _ASUS_ARMOURY_H_ */
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 92fea0710ada..bf53592e2a2f 100644
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
2.49.0


