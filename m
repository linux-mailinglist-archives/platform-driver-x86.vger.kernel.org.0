Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 933033FD183
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 Sep 2021 04:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241730AbhIACwx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Aug 2021 22:52:53 -0400
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:34225 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231588AbhIACwx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Aug 2021 22:52:53 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 8BABB5C00AB;
        Tue, 31 Aug 2021 22:51:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Tue, 31 Aug 2021 22:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=us/U36Lk9OcV7j82tCgTIeghcf37ZWic1+gdFUKFq0U=; b=H/fHWMYJ
        jTF2RTo5fslKDVymfeVeprDF0t2ciPsbXxhuvOnietvLGViMPy+Lpl5/4vyorrHA
        0WMh/zEiboiWXNh6OL2HUWsct/UfCK25toBw2fnFVDflWvCqzuWk83R7zgZs6afX
        HZwb/qFt1mcPzMPHST6qBU6fFtmuy48d/941jS8hUrgS0yTkfdoga6SXUbmaTeWj
        1pzZ6JHVjSmUjJKQiWgZIld9JF+H+VrXCSsddH50EMMRIuGTANDc9NEV6lV6fA1q
        5yqjxlIbJ/7IfPqkRXZfzFQkazOyeU7TAWyKDMZSIHtW3Tu546RR9fYgEFgfMlGB
        9824VmTyFZVEZw==
X-ME-Sender: <xms:zOouYWi45dWGnYyP6s7aiKr3H02ppo8CJlv1xcWVGeg7UQrkYD7xlw>
    <xme:zOouYXAQU-4B75aVt4T8ItzZ0ewFw_V_3RCmfL-xjgkaFD8bsVpPdp90Iqp_Vxa0R
    Gm7fiw-VKwbu1Samc4>
X-ME-Received: <xmr:zOouYeH3wljlsl2xV6TF8V3ODg_sGJadnm2OApuy7FWW3lvBCAOnz0-C1pVd>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvvddgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpedvteekvdeuhedthfeuudelheejie
    fhvddtteelleeghfekhfeugfehgeekffdtheenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:zOouYfQcB9xGgEQSvrEk5nL74h9_M-TBqczbfisoRrQr0zMfw17geA>
    <xmx:zOouYTxQPpiezONzZ4Z9Tia3eZ8n7XW8VrnHLUwzog1mKv6di3nsvg>
    <xmx:zOouYd6t1E4pQtppMaVDXP-mX34E5ls798LxSgQrFVG8Owm1Lrf6lA>
    <xmx:zOouYT-xJSo-nMxcU3FHavsyAxtJIblhHI57z74280ac8wtJH1dL8Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Aug 2021 22:51:52 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     linux-kernel@vger.kernel.org
Cc:     hdegoede@redhat.com, pobrn@protonmail.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v8] asus-wmi: Add support for custom fan curves
Date:   Wed,  1 Sep 2021 14:51:41 +1200
Message-Id: <20210901025141.1225029-2-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901025141.1225029-1-luke@ljones.dev>
References: <20210901025141.1225029-1-luke@ljones.dev>
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

This patch adds two blocks of attributes to the hwmon sysfs,
1 block each for CPU and GPU fans.

When the user switches profiles the associated curve data for that
profile is then show/store enabled to allow users to rotate through
the profiles and set a fan curve for each profile which then
activates on profile switch if enabled.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c            | 613 ++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |   2 +
 2 files changed, 611 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index cc5811844012..dd9cb325b542 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -106,8 +106,19 @@ module_param(fnlock_default, bool, 0444);
 
 #define WMI_EVENT_MASK			0xFFFF
 
+/* The number of ASUS_THROTTLE_THERMAL_POLICY_* available */
+#define FAN_CURVE_PROFILE_NUM	(ASUS_THROTTLE_THERMAL_POLICY_SILENT + 1)
+#define FAN_CURVE_POINTS		8
+#define FAN_CURVE_BUF_LEN		(FAN_CURVE_POINTS * 2)
+#define FAN_CURVE_DEV_CPU		0x00
+#define FAN_CURVE_DEV_GPU		0x01
+/* Mask to determine if setting temperature or percentage */
+#define FAN_CURVE_PWM_MASK		0x04
+
 static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
 
+static int throttle_thermal_policy_write(struct asus_wmi *);
+
 static bool ashs_present(void)
 {
 	int i = 0;
@@ -122,7 +133,8 @@ struct bios_args {
 	u32 arg0;
 	u32 arg1;
 	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
-	u32 arg4;
+	u32 arg3;
+	u32 arg4; /* Some ROG laptops require a full 5 input args */
 	u32 arg5;
 } __packed;
 
@@ -173,6 +185,19 @@ enum fan_type {
 	FAN_TYPE_SPEC83,	/* starting in Spec 8.3, use CPU_FAN_CTRL */
 };
 
+/*
+ * The related ACPI method for testing availability also returns the factory
+ * default fan curves. We save them here so that a user can reset custom
+ * settings if required.
+ */
+struct fan_curve_data {
+	bool enabled;
+	u8 temps[FAN_CURVE_POINTS];
+	u8 percents[FAN_CURVE_POINTS];
+	u8 default_temps[FAN_CURVE_POINTS];
+	u8 default_percents[FAN_CURVE_POINTS];
+};
+
 struct asus_wmi {
 	int dsts_id;
 	int spec;
@@ -220,6 +245,11 @@ struct asus_wmi {
 	bool throttle_thermal_policy_available;
 	u8 throttle_thermal_policy_mode;
 
+	bool cpu_fan_curve_available;
+	bool gpu_fan_curve_available;
+	/* [throttle modes][fan count] */
+	struct fan_curve_data custom_fan_curves[FAN_CURVE_PROFILE_NUM][2];
+
 	struct platform_profile_handler platform_profile_handler;
 	bool platform_profile_support;
 
@@ -285,6 +315,105 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
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
+		u32 arg0, u32 arg1, u8 *ret_buffer, size_t size)
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
+	int err = 0;
+
+	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID, 0, method_id,
+				     &input, &output);
+
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = (union acpi_object *)output.pointer;
+
+	if (obj && obj->type == ACPI_TYPE_BUFFER) {
+		if (obj->buffer.length > size)
+			err = -ENOSPC;
+		if (obj->buffer.length == 0)
+			err = -ENODATA;
+		if (err) {
+			kfree(obj);
+			return err;
+		}
+		memcpy(ret_buffer, obj->buffer.pointer, obj->buffer.length);
+	}
+
+	if (obj && obj->type == ACPI_TYPE_INTEGER) {
+		int_tmp = (u32)obj->integer.value;
+
+		kfree(obj);
+		if (int_tmp == ASUS_WMI_UNSUPPORTED_METHOD)
+			return -ENODEV;
+		/*
+		 * At least one method returns a 0 with no buffer if no arg
+		 * is provided, such as ASUS_WMI_DEVID_CPU_FAN_CURVE
+		 */
+		if (int_tmp == 0)
+			return -ENODATA;
+		return int_tmp;
+	}
+
+	kfree(obj);
+
+	if (obj == NULL)
+		return -ENODATA;
+
+	return 0;
+}
+
 static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
 {
 	struct acpi_buffer input;
@@ -2043,6 +2172,471 @@ static ssize_t fan_boost_mode_store(struct device *dev,
 // Fan boost mode: 0 - normal, 1 - overboost, 2 - silent
 static DEVICE_ATTR_RW(fan_boost_mode);
 
+/* Custom fan curves per-profile **********************************************/
+
+static void init_fan_curve(struct fan_curve_data *data, u8 *buf)
+{
+	int i;
+
+	for (i = 0; i < FAN_CURVE_POINTS; i++) {
+		data->temps[i] = buf[i];
+		data->default_temps[i] = buf[i];
+	}
+
+	for (i = 0; i < FAN_CURVE_POINTS; i++) {
+		data->percents[i] = 255 * buf[i + 8] / 100;
+		data->default_percents[i] = 255 * buf[i + 8] / 100;
+	}
+}
+
+/*
+ * Check if the ability to set fan curves on either fan exists, and populate
+ * with system defaults to provide users with a starting point.
+ *
+ * "fan_dev" is either CPU_FAN_CURVE or GPU_FAN_CURVE.
+ */
+static int fan_curve_check_present(struct asus_wmi *asus, bool *available,
+				   u32 fan_dev)
+{
+	int buf_len = FAN_CURVE_BUF_LEN;
+	struct fan_curve_data *curves;
+	u8 buf[FAN_CURVE_BUF_LEN];
+	int fan_idx = 0;
+	int err;
+
+	*available = false;
+	if (fan_dev == ASUS_WMI_DEVID_GPU_FAN_CURVE)
+		fan_idx = 1;
+
+	/*
+	 * Balanced default. The ASUS_WMI_DEVID_<C/G>PU_FAN_CURVE method needs
+	* an argument of at least 0 overwise it will return 0 and no buffer of
+	* defaults. GA401, GA502, GA503 all have 3 defaults to select from while
+	* other machines like G713Q have a single default.
+	 */
+	curves = &asus->custom_fan_curves[ASUS_THROTTLE_THERMAL_POLICY_DEFAULT]
+					 [fan_idx];
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, 0, buf,
+					   buf_len);
+	if (err) {
+		if (err == -ENODEV)
+			return 0;
+		return err;
+	}
+	init_fan_curve(curves, buf);
+
+	*available = true;
+	/* Early return for laptops with a single mode */
+	if (!asus->throttle_thermal_policy_available)
+		return 0;
+
+	/*
+	 * Quiet default. The index num for ACPI method does not match the
+	 * throttle_thermal number, same for Performance.
+	 */
+	curves = &asus->custom_fan_curves[ASUS_THROTTLE_THERMAL_POLICY_SILENT]
+					 [fan_idx];
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, 1, buf,
+					   buf_len);
+	if (err) {
+		if (err == -ENODEV)
+			return 0;
+		return err;
+	}
+	init_fan_curve(curves, buf);
+
+	/* Performance default */
+	curves =
+		&asus->custom_fan_curves[ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST]
+					[fan_idx];
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, 2, buf,
+					   buf_len);
+	if (err) {
+		if (err == -ENODEV)
+			return 0;
+		return err;
+	}
+	init_fan_curve(curves, buf);
+
+	return 0;
+}
+
+static struct fan_curve_data *
+fan_curve_data_select(struct device *dev, struct device_attribute *attr)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	int fan = nr & FAN_CURVE_DEV_GPU;
+	u8 mode = 0;
+
+	if (asus->throttle_thermal_policy_available)
+		mode = asus->throttle_thermal_policy_mode;
+
+	return &asus->custom_fan_curves[mode][fan];
+}
+
+static ssize_t fan_curve_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct fan_curve_data *data = fan_curve_data_select(dev, attr);
+	int value;
+
+	int index = to_sensor_dev_attr_2(attr)->index;
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	int pwm = nr & FAN_CURVE_PWM_MASK;
+
+	if (pwm)
+		value = data->percents[index];
+	else
+		value = data->temps[index];
+
+	return sysfs_emit(buf, "%d\n", value);
+}
+
+/*
+ * "fan_dev" is the related WMI method such as ASUS_WMI_DEVID_CPU_FAN_CURVE.
+ */
+static int fan_curve_write(struct asus_wmi *asus, u32 fan_dev,
+			   struct fan_curve_data *data)
+{
+	u32 arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0;
+	int ret, i, shift = 0;
+	u8 *temps;
+	u8 *percents;
+
+	/*
+	 * Some laptops without throttle_thermal require the stored defaults
+	 * to be written back as we can't reset behaviour with a
+	 * throttle_thermal mode change.
+	 */
+	if (data->enabled) {
+		temps = data->temps;
+		percents = data->percents;
+	} else if (!asus->throttle_thermal_policy_available) {
+		temps = data->default_temps;
+		percents = data->default_percents;
+	}
+
+	/* Args must be in a percentage */
+	for (i = 0; i < FAN_CURVE_POINTS / 2; i++) {
+		arg1 += (100 * temps[i] / 255) << shift;
+		arg2 += (100 * temps[i + 4] / 255) << shift;
+		arg3 += (100 * percents[i] / 255) << shift;
+		arg4 += (100 * percents[i + 4] / 255) << shift;
+		shift += 8;
+	}
+
+	return asus_wmi_evaluate_method5(ASUS_WMI_METHODID_DEVS, fan_dev, arg1,
+					 arg2, arg3, arg4, &ret);
+}
+
+/*
+ * Called on curve enable/disable, and by throttle mode change to apply
+ * fan curves for any enabled fans.
+ */
+static int fan_curve_write_data(struct asus_wmi *asus)
+{
+	struct fan_curve_data *cpu;
+	struct fan_curve_data *gpu;
+	u8 mode = 0;
+	int err;
+
+	if (asus->throttle_thermal_policy_available)
+		mode = asus->throttle_thermal_policy_mode;
+
+	cpu = &asus->custom_fan_curves[mode][FAN_CURVE_DEV_CPU];
+	gpu = &asus->custom_fan_curves[mode][FAN_CURVE_DEV_GPU];
+
+	if (asus->cpu_fan_curve_available && cpu->enabled) {
+		err = fan_curve_write(asus, ASUS_WMI_DEVID_CPU_FAN_CURVE, cpu);
+		if (err)
+			return err;
+	}
+
+	if (asus->gpu_fan_curve_available && gpu->enabled) {
+		err = fan_curve_write(asus, ASUS_WMI_DEVID_GPU_FAN_CURVE, gpu);
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
+
+static int fan_curve_verify(struct fan_curve_data *data)
+{
+	int i = 0;
+	u8 tmp = 0;
+	u8 prev_tmp = 0;
+
+	for (i = 0; i < FAN_CURVE_POINTS; i++) {
+		tmp = data->temps[i];
+		if (tmp < prev_tmp)
+			return -EINVAL;
+		prev_tmp = tmp;
+	}
+
+	tmp = 0;
+	prev_tmp = 0;
+	for (i = 0; i < FAN_CURVE_POINTS; i++) {
+		tmp = data->percents[i];
+		if (tmp < prev_tmp)
+			return -EINVAL;
+		prev_tmp = tmp;
+	}
+
+	return 0;
+}
+
+static ssize_t fan_curve_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t count)
+{
+	struct fan_curve_data *data = fan_curve_data_select(dev, attr);
+	u8 value, old_value;
+	int err;
+
+	int index = to_sensor_dev_attr_2(attr)->index;
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	int pwm = nr & FAN_CURVE_PWM_MASK;
+
+	err = kstrtou8(buf, 10, &value);
+	if (err < 0)
+		return err;
+
+	if (pwm) {
+		old_value = data->percents[index];
+		data->percents[index] = value;
+	} else {
+		old_value = data->temps[index];
+		data->temps[index] = value;
+	}
+	/*
+	 * The check here forces writing a curve graph in reverse,
+	 * from highest to lowest.
+	 */
+	err = fan_curve_verify(data);
+	if (err) {
+		if (pwm) {
+			dev_err(dev,
+				"a fan curve percentage was higher than the next in sequence\n");
+			data->percents[index] = old_value;
+		} else {
+			dev_err(dev,
+				"a fan curve temperature was higher than the next in sequence\n");
+			data->temps[index] = old_value;
+		}
+		return err;
+	}
+	/*
+	 * Mark as disabled so we don't write for every point change which
+	 * can cause issues. When user re-enables the curves will apply.
+	 */
+	data->enabled = false;
+
+	return count;
+}
+
+static ssize_t fan_curve_enable_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct fan_curve_data *data = fan_curve_data_select(dev, attr);
+
+	return sysfs_emit(buf, "%d\n", data->enabled);
+}
+
+static ssize_t fan_curve_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct fan_curve_data *data = fan_curve_data_select(dev, attr);
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	bool value;
+	int err;
+
+	err = kstrtobool(buf, &value);
+	if (err < 0)
+		return err;
+
+	data->enabled = value;
+
+	if (asus->throttle_thermal_policy_available)
+		/*
+		 * This calls fan_curve_write_data() after. This chain is
+		 * required so we correctly reset fans to throttle_thermal
+		 * then set(or not) enabled fans curve.
+		 */
+		throttle_thermal_policy_write(asus);
+	else
+		fan_curve_write_data(asus);
+
+	return count;
+}
+
+/* CPU */
+static SENSOR_DEVICE_ATTR_RW(pwm1_enable, fan_curve_enable, FAN_CURVE_DEV_CPU);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 3);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 4);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 5);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point7_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 6);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point8_temp, fan_curve,
+			       FAN_CURVE_DEV_CPU, 7);
+
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point1_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point2_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point3_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point4_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 3);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point5_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 4);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point6_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 5);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point7_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 6);
+static SENSOR_DEVICE_ATTR_2_RW(pwm1_auto_point8_pwm, fan_curve,
+			       FAN_CURVE_DEV_CPU | FAN_CURVE_PWM_MASK, 7);
+
+/* GPU */
+static SENSOR_DEVICE_ATTR_RW(pwm2_enable, fan_curve_enable, FAN_CURVE_DEV_GPU);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 3);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 4);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 5);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point7_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 6);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point8_temp, fan_curve,
+			       FAN_CURVE_DEV_GPU, 7);
+
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point1_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 0);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point2_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 1);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point3_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 2);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point4_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 3);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point5_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 4);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point6_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 5);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point7_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 6);
+static SENSOR_DEVICE_ATTR_2_RW(pwm2_auto_point8_pwm, fan_curve,
+			       FAN_CURVE_DEV_GPU | FAN_CURVE_PWM_MASK, 7);
+
+static struct attribute *asus_fan_curve_attr[] = {
+	/* CPU */
+	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point5_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point6_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point7_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point8_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point3_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point4_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point5_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point6_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point7_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm1_auto_point8_pwm.dev_attr.attr,
+	/* GPU */
+	&sensor_dev_attr_pwm2_enable.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point1_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point2_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point3_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point4_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point5_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point6_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point7_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point8_temp.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point3_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point4_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point5_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point6_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point7_pwm.dev_attr.attr,
+	&sensor_dev_attr_pwm2_auto_point8_pwm.dev_attr.attr,
+	NULL
+};
+
+static umode_t asus_fan_curve_is_visible(struct kobject *kobj,
+					 struct attribute *attr, int idx)
+{
+	struct device *dev = container_of(kobj, struct device, kobj);
+	struct asus_wmi *asus = dev_get_drvdata(dev->parent);
+
+	if (asus->cpu_fan_curve_available)
+		return 0644;
+
+	if (asus->gpu_fan_curve_available)
+		return 0644;
+
+	return 0;
+}
+
+static const struct attribute_group asus_fan_curve_attr_group = {
+	.is_visible = asus_fan_curve_is_visible,
+	.attrs = asus_fan_curve_attr,
+};
+__ATTRIBUTE_GROUPS(asus_fan_curve_attr);
+
+/*
+ * Must be initialised after throttle_thermal_policy_check_present() as
+ * we check the status of throttle_thermal_policy_available during init.
+ */
+static int asus_wmi_custom_fan_curve_init(struct asus_wmi *asus)
+{
+	struct device *dev = &asus->platform_device->dev;
+	struct device *hwmon;
+	int err;
+
+	err = fan_curve_check_present(asus, &asus->cpu_fan_curve_available,
+				      ASUS_WMI_DEVID_CPU_FAN_CURVE);
+	if (err)
+		return err;
+
+	err = fan_curve_check_present(asus, &asus->gpu_fan_curve_available,
+				      ASUS_WMI_DEVID_GPU_FAN_CURVE);
+	if (err)
+		return err;
+
+	hwmon = devm_hwmon_device_register_with_groups(
+		dev, "asus_custom_fan_curve", asus, asus_fan_curve_attr_groups);
+
+	if (IS_ERR(hwmon)) {
+		dev_err(dev,
+			"Could not register asus_custom_fan_curve device\n");
+		return PTR_ERR(hwmon);
+	}
+
+	return 0;
+}
+
 /* Throttle thermal policy ****************************************************/
 
 static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
@@ -2053,8 +2647,8 @@ static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
 	asus->throttle_thermal_policy_available = false;
 
 	err = asus_wmi_get_devstate(asus,
-				    ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
-				    &result);
+		ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
+		&result);
 	if (err) {
 		if (err == -ENODEV)
 			return 0;
@@ -2092,6 +2686,12 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
 		return -EIO;
 	}
 
+	err = fan_curve_write_data(asus);
+	if (err) {
+		pr_warn("Failed to set custom fan curves: %d\n", err);
+		return err;
+	}
+
 	return 0;
 }
 
@@ -2904,7 +3504,7 @@ static int show_call(struct seq_file *m, void *data)
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
-	obj = (union acpi_object *)output.pointer;
+	obj = output.pointer;
 	if (obj && obj->type == ACPI_TYPE_INTEGER)
 		seq_printf(m, "%#x(%#x, %#x) = %#x\n", asus->debug.method_id,
 			   asus->debug.dev_id, asus->debug.ctrl_param,
@@ -3038,6 +3638,10 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_hwmon;
 
+	err = asus_wmi_custom_fan_curve_init(asus);
+	if (err)
+		goto fail_custom_fan_curve;
+
 	err = asus_wmi_led_init(asus);
 	if (err)
 		goto fail_leds;
@@ -3109,6 +3713,7 @@ static int asus_wmi_add(struct platform_device *pdev)
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

