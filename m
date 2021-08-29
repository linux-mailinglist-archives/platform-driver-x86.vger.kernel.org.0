Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 122A33FA9E4
	for <lists+platform-driver-x86@lfdr.de>; Sun, 29 Aug 2021 09:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232001AbhH2HP2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 29 Aug 2021 03:15:28 -0400
Received: from wout4-smtp.messagingengine.com ([64.147.123.20]:59231 "EHLO
        wout4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230378AbhH2HP2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 29 Aug 2021 03:15:28 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id A43FF32006F2;
        Sun, 29 Aug 2021 03:14:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sun, 29 Aug 2021 03:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=c4qutMQcPKvT8neQ/E0mZXeS+FtmnyaZ+3Y7wMeqRd8=; b=LzsW2RZA
        QW5kuSNXSuAX49SqMx/Sui9WDGqq30R8wPuYlJaz7Gbw+91Z21RJb82RTIUutOI4
        08s+GH0HVglsfjhnNGMs3nsBX8ZRkxh5UmSq7mqC/D63q5r34QSXM08yfORCVf4N
        hIrCBV8D8A/65FDsW8jnY4fODqRVRnfMpYfcZ5BeW6x9Z1+hjTmllt123RV7Pc6+
        dFfuAS4bdIUEE1et01PbCCdmM2IP6ElhCj32y+kw2kogHinX3aa/oWgUorlpuslt
        n5EE4t3OVM3Kz4XIkDQiKgnN73B8paXVBeqjo0sPtEUXYxzPhueSkN1V89RtTfQB
        F8irocpC+y8vYQ==
X-ME-Sender: <xms:2jMrYSRKuhK0VvWk7yuk7WaFrNnaKb1Ob_bMmvabVZ3sKNbgRZBamg>
    <xme:2jMrYXwFFDET8QNHEG7576WJ4M6dCPiIoivenKf_AtVjl8VBrvKdf_acn9Z1VYx5X
    PkZhIqooL90XXufHnE>
X-ME-Received: <xmr:2jMrYf0VJHAvZhPrIl8uV4xQSphagBKKAVGgu9PgIxLh0gFTz9JRG7VdgHoa>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduiedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfggfgsedtke
    ertdertddtnecuhfhrohhmpedfnfhukhgvucffrdculfhonhgvshdfuceolhhukhgvsehl
    jhhonhgvshdruggvvheqnecuggftrfgrthhtvghrnhepvdetkedvueehtdfhueduleehje
    eihfdvtdetleelgefhkefhuefgheegkefftdehnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:2jMrYeAWPhvWCfvITrZh8f-7LbvUSrDZfcmOeUIS1BgwLp2Rulsvrw>
    <xmx:2jMrYbjBwPSV_AedLOZDqPF9yoCE26cVONectDZTij6wwFmsq8HSYw>
    <xmx:2jMrYapnpAoEZtdDxYdRpMkR0rwtH_E8G23V_C2s1H9aiuCPuItClA>
    <xmx:2zMrYYtYzvKoVRVRczd4XQ7G5RyYWAp6m6ecXlwJ0IpfOcS6pMKJtg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 29 Aug 2021 03:14:31 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     linux-kernel@vger.kernel.org
Cc:     hdegoede@redhat.com, pobrn@protonmail.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v6] asus-wmi: Add support for custom fan curves
Date:   Sun, 29 Aug 2021 19:14:02 +1200
Message-Id: <20210829071402.576380-2-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210829071402.576380-1-luke@ljones.dev>
References: <20210829071402.576380-1-luke@ljones.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add support for custom fan curves found on some ASUS ROG laptops.

These laptops have the ability to set a custom curve for the CPU
and GPU fans via an ACPI method call. This patch enables this,
additionally enabling custom fan curves per-profile, where profile
here means each of the 3 levels of "throttle_thermal_policy".

The format for input fan curves is
"30:1,49:2,59:3,69:4,79:31,89:49,99:56,109:58"
where each block of "30:1," is one point on the curve, and 30c, 1%
of fan RPM up to 100%. This follows the internal WMI format. This
format was chosen as it is used heavily by pre-existing utilities
that were based on using the acpi_call module. Further, each pair
can be defined as "T[ c:]P[ %,]" resulting in "30c:1%,", "30c1 "
or similar with a max of two chars between values.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c            | 488 ++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |   2 +
 2 files changed, 488 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index cc5811844012..dccdd41917ff 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -106,8 +106,23 @@ module_param(fnlock_default, bool, 0444);
 
 #define WMI_EVENT_MASK			0xFFFF
 
+/* The number of ASUS_THROTTLE_THERMAL_POLICY_* available */
+#define NUM_FAN_CURVE_PROFILES	3
+#define NUM_FAN_CURVE_POINTS	8
+#define NUM_FAN_CURVE_DATA	(NUM_FAN_CURVE_POINTS * 2)
+
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
+/*
+ * The order here matters, index positions reflect
+ * ASUS_THROTTLE_THERMAL_POLICY_<name>
+ */
+static const char * const fan_curve_names[] = {
+	"balanced", "performance", "quiet"
+};
+
+static int throttle_thermal_policy_write(struct asus_wmi *);
+
 static bool ashs_present(void)
 {
 	int i = 0;
@@ -122,7 +137,8 @@ struct bios_args {
 	u32 arg0;
 	u32 arg1;
 	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
-	u32 arg4;
+	u32 arg3;
+	u32 arg4; /* Some ROG laptops require a full 5 input args */
 	u32 arg5;
 } __packed;
 
@@ -173,6 +189,29 @@ enum fan_type {
 	FAN_TYPE_SPEC83,	/* starting in Spec 8.3, use CPU_FAN_CTRL */
 };
 
+enum fan_device {
+	FAN_DEVICE_CPU = 0,
+	FAN_DEVICE_GPU,
+};
+
+/*
+ * Each temps[n] is paired with percents[n]
+ */
+struct fan_curve {
+	u8 temps[NUM_FAN_CURVE_POINTS];
+	u8 percents[NUM_FAN_CURVE_POINTS];
+};
+
+/*
+ * The related ACPI method for testing availability also returns the factory
+ * default fan curves. We save them here so that a user can reset custom
+ * settings if required.
+ */
+struct fan_curve_data {
+	struct fan_curve custom;
+	struct fan_curve defaults;
+};
+
 struct asus_wmi {
 	int dsts_id;
 	int spec;
@@ -220,6 +259,11 @@ struct asus_wmi {
 	bool throttle_thermal_policy_available;
 	u8 throttle_thermal_policy_mode;
 
+	bool cpu_fan_curve_available;
+	bool gpu_fan_curve_available;
+	bool fan_curves_enabled[NUM_FAN_CURVE_PROFILES];
+	struct fan_curve_data throttle_fan_curves[NUM_FAN_CURVE_PROFILES][2];
+
 	struct platform_profile_handler platform_profile_handler;
 	bool platform_profile_support;
 
@@ -285,6 +329,84 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
 }
 EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
 
+static int asus_wmi_evaluate_method5(u32 method_id,
+		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
+{
+	struct bios_args args = {
+		.arg0 = arg0,
+		.arg1 = arg1,
+		.arg2 = arg2,
+		.arg3 = arg3,
+		.arg4 = arg4,
+	};
+	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	union acpi_object *obj;
+	u32 tmp = 0;
+
+	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID, 0, method_id,
+				     &input, &output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = (union acpi_object *)output.pointer;
+	if (obj && obj->type == ACPI_TYPE_INTEGER)
+		tmp = (u32) obj->integer.value;
+
+	if (retval)
+		*retval = tmp;
+
+	kfree(obj);
+
+	if (tmp == ASUS_WMI_UNSUPPORTED_METHOD)
+		return -ENODEV;
+
+	return 0;
+}
+
+/*
+ * Returns as an error if the method output is not a buffer. Typically this
+ * means that the method called is unsupported.
+ */
+static int asus_wmi_evaluate_method_buf(u32 method_id,
+		u32 arg0, u32 arg1, u8 *ret_buffer)
+{
+	struct bios_args args = {
+		.arg0 = arg0,
+		.arg1 = arg1,
+		.arg2 = 0,
+	};
+	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	union acpi_object *obj;
+	u32 int_tmp = 0;
+
+	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID, 0, method_id,
+				     &input, &output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = (union acpi_object *)output.pointer;
+
+	if (obj && obj->type == ACPI_TYPE_INTEGER) {
+		int_tmp = (u32) obj->integer.value;
+		if (int_tmp == ASUS_WMI_UNSUPPORTED_METHOD)
+			return -ENODEV;
+		return int_tmp;
+	}
+
+	if (obj && obj->type == ACPI_TYPE_BUFFER)
+		memcpy(ret_buffer, obj->buffer.pointer, obj->buffer.length);
+
+	kfree(obj);
+
+	return 0;
+}
+
 static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
 {
 	struct acpi_buffer input;
@@ -2043,6 +2165,330 @@ static ssize_t fan_boost_mode_store(struct device *dev,
 // Fan boost mode: 0 - normal, 1 - overboost, 2 - silent
 static DEVICE_ATTR_RW(fan_boost_mode);
 
+/* Custom fan curves per-profile **********************************************/
+
+static void copy_fan_curve_buf(struct fan_curve *data, u8 *buf)
+{
+	int i;
+
+	for (i = 0; i < NUM_FAN_CURVE_POINTS; i++)
+		data->temps[i] = buf[i];
+
+	for (i = 0; i < NUM_FAN_CURVE_POINTS; i++)
+		data->percents[i] = buf[i + 8];
+}
+
+static void init_fan_curve(struct fan_curve_data *curves,
+			       u8 *buf, u32 dev)
+{
+	copy_fan_curve_buf(&curves->custom, buf);
+	copy_fan_curve_buf(&curves->defaults, buf);
+}
+
+/*
+ * Check if the ability to set fan curves on either fan exists, and store the
+ * defaults for recall later plus to provide users with a starting point.
+ *
+ * "dev" is either CPU_FAN_CURVE or GPU_FAN_CURVE.
+ */
+static int custom_fan_check_present(struct asus_wmi *asus,
+				    bool *available, u32 dev)
+{
+	struct fan_curve_data *curves;
+	u8 buf[NUM_FAN_CURVE_DATA];
+	int fan_idx = 0;
+	int err;
+
+	*available = false;
+	if (dev == ASUS_WMI_DEVID_GPU_FAN_CURVE)
+		fan_idx = 1;
+
+	/* Balanced default */
+	curves =
+	&asus->throttle_fan_curves[ASUS_THROTTLE_THERMAL_POLICY_DEFAULT][fan_idx];
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id, dev, 0, buf);
+	if (err) {
+		if (err == -ENODEV)
+			return 0;
+		return err;
+	}
+	init_fan_curve(curves, buf, dev);
+
+	/*
+	 * Quiet default. The index num for ACPI method does not match the
+	 * throttle_thermal number, same for Performance.
+	 */
+	curves =
+	&asus->throttle_fan_curves[ASUS_THROTTLE_THERMAL_POLICY_SILENT][fan_idx];
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id, dev, 1, buf);
+	if (err) {
+		if (err == -ENODEV)
+			return 0;
+		return err;
+	}
+	init_fan_curve(curves, buf, dev);
+
+	/* Performance default */
+	curves =
+	&asus->throttle_fan_curves[ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST][fan_idx];
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id, dev, 2, buf);
+	if (err) {
+		if (err == -ENODEV)
+			return 0;
+		return err;
+	}
+	init_fan_curve(curves, buf, dev);
+
+	*available = true;
+	return 0;
+}
+
+static ssize_t fan_curve_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	/* index maps to ASUS_THROTTLE_THERMAL_POLICY_DEFAULT */
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	/* dev maps to ASUS_WMI_DEVID_[C/G]PU_FAN_CURVE */
+	int index = to_sensor_dev_attr_2(attr)->index;
+
+	struct fan_curve *dat = &asus->throttle_fan_curves[nr][index].custom;
+	int len = 0;
+	int i = 0;
+
+	for (i = 0; i < NUM_FAN_CURVE_POINTS; i++) {
+		len += sysfs_emit_at(buf, len, "%dc:%d%%",
+					dat->temps[i], dat->percents[i]);
+		if (i < NUM_FAN_CURVE_POINTS - 1)
+			len += sysfs_emit_at(buf, len, ",");
+	}
+	len += sysfs_emit_at(buf, len, "\n");
+	return len;
+}
+
+/*
+ * "dev" is the related WMI method such as ASUS_WMI_DEVID_CPU_FAN_CURVE.
+ */
+static int fan_curve_write(struct asus_wmi *asus, u32 dev,
+					struct fan_curve *curve)
+{
+	int ret;
+	u32 arg1, arg2, arg3, arg4;
+
+	arg1 = curve->temps[0];
+	arg2 = curve->temps[4];
+	arg1 += curve->temps[1] << 8;
+	arg2 += curve->temps[5] << 8;
+	arg1 += curve->temps[2] << 16;
+	arg2 += curve->temps[6] << 16;
+	arg1 += curve->temps[3] << 24;
+	arg2 += curve->temps[7] << 24;
+
+
+	arg3 = curve->percents[0];
+	arg4 = curve->percents[4];
+	arg3 += curve->percents[1] << 8;
+	arg4 += curve->percents[5] << 8;
+	arg3 += curve->percents[2] << 16;
+	arg4 += curve->percents[6] << 16;
+	arg3 += curve->percents[3] << 24;
+	arg4 += curve->percents[7] << 24;
+
+	return asus_wmi_evaluate_method5(ASUS_WMI_METHODID_DEVS, dev,
+					arg1, arg2, arg3, arg4, &ret);
+}
+
+/*
+ * Called only by throttle_thermal_policy_write()
+ */
+static int fan_curve_write_data(struct asus_wmi *asus)
+{
+	struct fan_curve_data *cpu;
+	struct fan_curve_data *gpu;
+	int err, mode;
+
+	mode = asus->throttle_thermal_policy_mode;
+	cpu = &asus->throttle_fan_curves[mode][FAN_DEVICE_CPU];
+	gpu = &asus->throttle_fan_curves[mode][FAN_DEVICE_GPU];
+
+	if (asus->fan_curves_enabled[mode]) {
+		err = fan_curve_write(asus, ASUS_WMI_DEVID_CPU_FAN_CURVE, &cpu->custom);
+		if (err)
+			return err;
+	}
+
+	if (asus->fan_curves_enabled[mode]) {
+		err = fan_curve_write(asus, ASUS_WMI_DEVID_GPU_FAN_CURVE, &gpu->custom);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+/*
+ * The expected input is 8 sets of number pairs, where "53c30%" temperacture
+ * and fan RPM percentage. The pair can be of the format "T[ c:]P[ %,]".
+ *
+ */
+static ssize_t fan_curve_store(struct device *dev,
+				struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	u8 temps[NUM_FAN_CURVE_POINTS];
+	u8 percents[NUM_FAN_CURVE_POINTS];
+	/* tmp1 and tmp2 exist only to allow matching to succeed */
+	char *tmp1;
+	char *tmp2;
+	int err;
+
+	/* index maps to ASUS_THROTTLE_THERMAL_POLICY_DEFAULT */
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	/* dev maps to ASUS_WMI_DEVID_[C/G]PU_FAN_CURVE */
+	int index = to_sensor_dev_attr_2(attr)->index;
+	/* Variable format, values must at least be separated by these */
+	char part[] = "%d%2[ c:]%d%2[ %%,\n]%n";
+	u32 prev_percent = 0;
+	u32 prev_temp = 0;
+	u32 percent = 0;
+	u32 temp = 0;
+	int len = 0;
+	int idx = 0;
+	int at = 0;
+
+	struct fan_curve_data *curve = &asus->throttle_fan_curves[nr][index];
+
+	/* Allow a user to write "" or " " to erase a curve setting */
+	if (strlen(buf) <= 1 || strcmp(buf, "\n") == 0) {
+		memcpy(&curve->custom, &curve->defaults, NUM_FAN_CURVE_DATA);
+		err = throttle_thermal_policy_write(asus);
+		if (err)
+			return err;
+		return count;
+	}
+
+	/* parse the buf */
+	while (sscanf(&buf[at], part, &temp, &tmp1, &percent, &tmp2, &len) == 4) {
+		if (temp < prev_temp || percent < prev_percent) {
+			pr_info("Fan curve invalid: a value is sequentially lower");
+			return -EINVAL;
+		}
+
+		if (percent > 100) {
+			pr_info("Fan curve invalid: percentage > 100");
+			return -EINVAL;
+		}
+
+		prev_temp = temp;
+		prev_percent = percent;
+
+		temps[idx] = temp;
+		percents[idx] = percent;
+		at += len;
+		idx += 1;
+	}
+
+	if (idx != NUM_FAN_CURVE_POINTS) {
+		pr_info("Fan curve invalid: incomplete string: %d", idx);
+		return -EINVAL;
+	}
+
+	memcpy(&curve->custom.temps, &temps, NUM_FAN_CURVE_POINTS);
+	memcpy(&curve->custom.percents, &percents, NUM_FAN_CURVE_POINTS);
+
+	/* Maybe activate fan curve if in associated mode */
+	err = throttle_thermal_policy_write(asus);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static SENSOR_DEVICE_ATTR_2_RW(cpu_fan_curve_balanced, fan_curve,
+				ASUS_THROTTLE_THERMAL_POLICY_DEFAULT,
+				FAN_DEVICE_CPU);
+static SENSOR_DEVICE_ATTR_2_RW(cpu_fan_curve_performance, fan_curve,
+				ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST,
+				FAN_DEVICE_CPU);
+static SENSOR_DEVICE_ATTR_2_RW(cpu_fan_curve_quiet, fan_curve,
+				ASUS_THROTTLE_THERMAL_POLICY_SILENT,
+				FAN_DEVICE_CPU);
+
+static SENSOR_DEVICE_ATTR_2_RW(gpu_fan_curve_balanced, fan_curve,
+				ASUS_THROTTLE_THERMAL_POLICY_DEFAULT,
+				FAN_DEVICE_GPU);
+static SENSOR_DEVICE_ATTR_2_RW(gpu_fan_curve_performance, fan_curve,
+				ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST,
+				FAN_DEVICE_GPU);
+static SENSOR_DEVICE_ATTR_2_RW(gpu_fan_curve_quiet, fan_curve,
+				ASUS_THROTTLE_THERMAL_POLICY_SILENT,
+				FAN_DEVICE_GPU);
+
+/*
+ * Profiles with enabled fan curve setting
+ */
+
+static int enabled_fan_curve_profiles_write(struct asus_wmi *asus,
+					    const char *names)
+{
+	char *buf, *set, *set_end;
+	int err, index;
+
+	buf = set_end = kstrdup(names, GFP_KERNEL);
+
+	/* Reset before checking */
+	asus->fan_curves_enabled[ASUS_THROTTLE_THERMAL_POLICY_DEFAULT] = false;
+	asus->fan_curves_enabled[ASUS_THROTTLE_THERMAL_POLICY_SILENT] = false;
+	asus->fan_curves_enabled[ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST] = false;
+
+	while ((set = strsep(&set_end, " ")) != NULL) {
+		index = sysfs_match_string(fan_curve_names, set);
+		if (index >= 0)
+			asus->fan_curves_enabled[index] = true;
+	}
+
+	err = throttle_thermal_policy_write(asus);
+	if (err)
+		return err;
+
+	kfree(buf);
+
+	return 0;
+}
+
+static ssize_t enabled_fan_curve_profiles_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	int i, len = 0;
+
+	for (i = 0; i < NUM_FAN_CURVE_PROFILES; i++) {
+		if (asus->fan_curves_enabled[i]) {
+			len += sysfs_emit_at(buf, len, fan_curve_names[i]);
+			len += sysfs_emit_at(buf, len, " ");
+		}
+	}
+
+	len += sysfs_emit_at(buf, len, "\n");
+	return len;
+}
+
+static ssize_t enabled_fan_curve_profiles_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t count)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	int err;
+
+	err = enabled_fan_curve_profiles_write(asus, buf);
+	if (err)
+		return err;
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(enabled_fan_curve_profiles);
+
 /* Throttle thermal policy ****************************************************/
 
 static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
@@ -2092,6 +2538,12 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
 		return -EIO;
 	}
 
+	if (asus->cpu_fan_curve_available || asus->gpu_fan_curve_available) {
+		err = fan_curve_write_data(asus);
+		if (err)
+			return err;
+	}
+
 	return 0;
 }
 
@@ -2711,6 +3163,13 @@ static struct attribute *platform_attributes[] = {
 	&dev_attr_als_enable.attr,
 	&dev_attr_fan_boost_mode.attr,
 	&dev_attr_throttle_thermal_policy.attr,
+	&sensor_dev_attr_cpu_fan_curve_balanced.dev_attr.attr,
+	&sensor_dev_attr_cpu_fan_curve_performance.dev_attr.attr,
+	&sensor_dev_attr_cpu_fan_curve_quiet.dev_attr.attr,
+	&sensor_dev_attr_gpu_fan_curve_balanced.dev_attr.attr,
+	&sensor_dev_attr_gpu_fan_curve_performance.dev_attr.attr,
+	&sensor_dev_attr_gpu_fan_curve_quiet.dev_attr.attr,
+	&dev_attr_enabled_fan_curve_profiles.attr,
 	&dev_attr_panel_od.attr,
 	NULL
 };
@@ -2741,6 +3200,20 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
 		ok = asus->fan_boost_mode_available;
 	else if (attr == &dev_attr_throttle_thermal_policy.attr)
 		ok = asus->throttle_thermal_policy_available;
+	else if (attr == &sensor_dev_attr_cpu_fan_curve_balanced.dev_attr.attr)
+		ok = asus->cpu_fan_curve_available;
+	else if (attr == &sensor_dev_attr_cpu_fan_curve_performance.dev_attr.attr)
+		ok = asus->cpu_fan_curve_available;
+	else if (attr == &sensor_dev_attr_cpu_fan_curve_quiet.dev_attr.attr)
+		ok = asus->cpu_fan_curve_available;
+	else if (attr == &sensor_dev_attr_gpu_fan_curve_balanced.dev_attr.attr)
+		ok = asus->gpu_fan_curve_available;
+	else if (attr == &sensor_dev_attr_gpu_fan_curve_performance.dev_attr.attr)
+		ok = asus->gpu_fan_curve_available;
+	else if (attr == &sensor_dev_attr_gpu_fan_curve_quiet.dev_attr.attr)
+		ok = asus->gpu_fan_curve_available;
+	else if (attr == &dev_attr_enabled_fan_curve_profiles.attr)
+		ok = asus->cpu_fan_curve_available || asus->gpu_fan_curve_available;
 	else if (attr == &dev_attr_panel_od.attr)
 		ok = asus->panel_overdrive_available;
 
@@ -2904,7 +3377,7 @@ static int show_call(struct seq_file *m, void *data)
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
-	obj = (union acpi_object *)output.pointer;
+	obj = output.pointer;
 	if (obj && obj->type == ACPI_TYPE_INTEGER)
 		seq_printf(m, "%#x(%#x, %#x) = %#x\n", asus->debug.method_id,
 			   asus->debug.dev_id, asus->debug.ctrl_param,
@@ -3016,6 +3489,16 @@ static int asus_wmi_add(struct platform_device *pdev)
 	else
 		throttle_thermal_policy_set_default(asus);
 
+	err = custom_fan_check_present(asus, &asus->cpu_fan_curve_available,
+			ASUS_WMI_DEVID_CPU_FAN_CURVE);
+	if (err)
+		goto fail_custom_fan_curve;
+
+	err = custom_fan_check_present(asus, &asus->gpu_fan_curve_available,
+			ASUS_WMI_DEVID_GPU_FAN_CURVE);
+	if (err)
+		goto fail_custom_fan_curve;
+
 	err = platform_profile_setup(asus);
 	if (err)
 		goto fail_platform_profile_setup;
@@ -3109,6 +3592,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus_wmi_sysfs_exit(asus->platform_device);
 fail_sysfs:
 fail_throttle_thermal_policy:
+fail_custom_fan_curve:
 fail_platform_profile_setup:
 	if (asus->platform_profile_support)
 		platform_profile_remove();
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 17dc5cb6f3f2..a571b47ff362 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -77,6 +77,8 @@
 #define ASUS_WMI_DEVID_THERMAL_CTRL	0x00110011
 #define ASUS_WMI_DEVID_FAN_CTRL		0x00110012 /* deprecated */
 #define ASUS_WMI_DEVID_CPU_FAN_CTRL	0x00110013
+#define ASUS_WMI_DEVID_CPU_FAN_CURVE	0x00110024
+#define ASUS_WMI_DEVID_GPU_FAN_CURVE	0x00110025
 
 /* Power */
 #define ASUS_WMI_DEVID_PROCESSOR_STATE	0x00120012
-- 
2.31.1

