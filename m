Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECF84009C5
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 06:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhIDEeM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 00:34:12 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:47733 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229777AbhIDEeL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 00:34:11 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id B50F75C0129;
        Sat,  4 Sep 2021 00:33:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 04 Sep 2021 00:33:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=5WDgzv7roNJCJHXPo3gS22hhnsiSE0o2eBcgrIffNHE=; b=Y7hwjP/+
        1Bobb8XyzOW6vJ4WwOmlonIrX+3Ve8wYBKzYSMYTDfK3YsXD9yvyV8/GW3PTKVNi
        i9ObqVYHQh3ESan/XHehR31ibx+2zHYO0+N729ipDYSqtrsgg+Le0+uDFVwgzLC3
        CRiul06NsH5OymXRU+nbaGuQQ/wGGNMsLr6KY1EJ02POTb7OVA9wHB3k389zpKU5
        +fOvE5hUAILMa/wYejMl4p/CdQybQHMbDx9acqAMe1Kv/ls3rIMPUAN/MoO90OMr
        TnOBelgLtSNLD9ox7dZWrU38XYn3RPemZ8xzVWYh30ncGElDGx26i3MaTARioAN/
        R5P2hhiTpcuGPA==
X-ME-Sender: <xms:BPcyYT14hWKdSSrhuEq44xGrgeEIE6v3j2Y2UMQXRTFLUZTswam2bw>
    <xme:BPcyYSEcDeMYPXNS886plnyaR_eUvg0if5Kh8mvyirqLSAJ_2CkigQdi8OfXsHl5l
    dA_X1OdWIq-7lnuv2o>
X-ME-Received: <xmr:BPcyYT74pvf1kllk1tCFbRcPQ3xPv7Vp_ocp4kENQCas6kQlz_zQqzczdJwh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvkedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
    dtredttdenucfhrhhomhepfdfnuhhkvgcuffdrucflohhnvghsfdcuoehluhhkvgeslhhj
    ohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpedvteekvdeuhedthfeuudelheejie
    fhvddtteelleeghfekhfeugfehgeekffdtheenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehluhhkvgeslhhjohhnvghsrdguvghv
X-ME-Proxy: <xmx:BPcyYY3SKlcTgRI_n0seR3OQJa2jKI09u-EPABvQw_FqG2NK7o9DZg>
    <xmx:BPcyYWEYpjJ-ANHHHPT1c4qmojYD4mU_YUCjURwKb0bklX5TPpwnaQ>
    <xmx:BPcyYZ8j8uKbWvIwumZLZKguKhxOutH4E4pn2g7UnXGLOaVA00wgKA>
    <xmx:BfcyYShTOsbsmpEvUMKcFxjnwUAgyOu_xJmgjPLANMqJKqg3b3aVIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 4 Sep 2021 00:33:05 -0400 (EDT)
From:   "Luke D. Jones" <luke@ljones.dev>
To:     linux-kernel@vger.kernel.org
Cc:     hdegoede@redhat.com, pobrn@protonmail.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, hadess@hadess.net,
        "Luke D. Jones" <luke@ljones.dev>
Subject: [PATCH v9] asus-wmi: Add support for custom fan curves
Date:   Sat,  4 Sep 2021 16:32:50 +1200
Message-Id: <20210904043250.134260-2-luke@ljones.dev>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210904043250.134260-1-luke@ljones.dev>
References: <20210904043250.134260-1-luke@ljones.dev>
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

This patch adds two pwm<N> attributes to the hwmon sysfs,
pwm1 for CPU fan, pwm2 for GPU fan. Both are under the hwmon of the
name `asus_custom_fan_curve`.

The fans have settings [1,2,3] under pwm<N>_enable:
1. Enable and write settings out
2. Disable and restore factory fan mode
3. Same as 2, additionally restoring default factory curve.
this is following `pwm[1-*]_enable`.

Notes:
- pwm<N>_enable = 0 is an invalid setting.
- pwm is actually a percentage and is scaled on writing to device.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c            | 646 ++++++++++++++++++++-
 include/linux/platform_data/x86/asus-wmi.h |   2 +
 2 files changed, 644 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index cc5811844012..ee244b9ea57e 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -106,8 +106,17 @@ module_param(fnlock_default, bool, 0444);
 
 #define WMI_EVENT_MASK			0xFFFF
 
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
@@ -122,7 +131,8 @@ struct bios_args {
 	u32 arg0;
 	u32 arg1;
 	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
-	u32 arg4;
+	u32 arg3;
+	u32 arg4; /* Some ROG laptops require a full 5 input args */
 	u32 arg5;
 } __packed;
 
@@ -173,6 +183,19 @@ enum fan_type {
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
@@ -220,6 +243,11 @@ struct asus_wmi {
 	bool throttle_thermal_policy_available;
 	u8 throttle_thermal_policy_mode;
 
+	bool cpu_fan_curve_available;
+	bool gpu_fan_curve_available;
+	/* [throttle modes][fan count] */
+	struct fan_curve_data custom_fan_curves[2];
+
 	struct platform_profile_handler platform_profile_handler;
 	bool platform_profile_support;
 
@@ -285,6 +313,105 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
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
@@ -1806,6 +1933,13 @@ static ssize_t pwm1_enable_store(struct device *dev,
 	}
 
 	asus->fan_pwm_mode = state;
+
+	/* Must set to disabled if mode is toggled */
+	if (asus->cpu_fan_curve_available)
+		asus->custom_fan_curves[0].enabled = false;
+	if (asus->gpu_fan_curve_available)
+		asus->custom_fan_curves[1].enabled = false;
+
 	return count;
 }
 
@@ -2043,6 +2177,498 @@ static ssize_t fan_boost_mode_store(struct device *dev,
 // Fan boost mode: 0 - normal, 1 - overboost, 2 - silent
 static DEVICE_ATTR_RW(fan_boost_mode);
 
+/* Custom fan curves per-profile **********************************************/
+
+static void fan_curve_copy_from_buf(struct fan_curve_data *data, u8 *buf)
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
+static u8 fan_curve_throttle_to_wmi_index(struct asus_wmi *asus)
+{
+	u8 mode = 0;
+
+	if (asus->throttle_thermal_policy_available)
+		mode = asus->throttle_thermal_policy_mode;
+	/*
+	 * The index for ASUS_WMI_DEVID_<C/G>PU_FAN_CURVE is switched for
+	 * OVERBOOST vs SILENT.
+	 */
+	if (mode == 2)
+		mode = 1;
+	if (mode == 1)
+		mode = 2;
+
+	return mode;
+}
+
+static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
+{
+	u8 mode = fan_curve_throttle_to_wmi_index(asus);
+	int buf_len = FAN_CURVE_BUF_LEN;
+	struct fan_curve_data *curves;
+	u8 buf[FAN_CURVE_BUF_LEN];
+	int fan_idx = 0;
+	int err;
+
+	curves = &asus->custom_fan_curves[fan_idx];
+	err = asus_wmi_evaluate_method_buf(asus->dsts_id, fan_dev, mode, buf,
+					   buf_len);
+	if (err)
+		return err;
+
+	fan_curve_copy_from_buf(curves, buf);
+
+	return 0;
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
+	int err;
+
+	*available = false;
+
+	err = fan_curve_get_factory_default(asus, fan_dev);
+	if (err) {
+		if (err == -ENODEV)
+			return 0;
+		return err;
+	}
+
+	*available = true;
+
+	return 0;
+}
+
+static struct fan_curve_data *
+fan_curve_data_select(struct asus_wmi *asus, struct device_attribute *attr)
+{
+	/* Determine which fan the attribute is for */
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+	int fan = nr & FAN_CURVE_DEV_GPU;
+
+	return &asus->custom_fan_curves[fan];
+}
+
+static ssize_t fan_curve_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	struct fan_curve_data *data = fan_curve_data_select(asus, attr);
+	int value;
+
+	int index = to_sensor_dev_attr_2(attr)->index;
+
+	/* Determine if temperature or pwm */
+	int nr = to_sensor_dev_attr_2(attr)->nr;
+
+	if (nr & FAN_CURVE_PWM_MASK)
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
+static int fan_curve_write(struct asus_wmi *asus,
+			   struct device_attribute *attr, u32 fan_dev)
+{
+	struct fan_curve_data *data = fan_curve_data_select(asus, attr);
+
+	u32 arg1 = 0, arg2 = 0, arg3 = 0, arg4 = 0;
+	int ret, i, shift = 0;
+	u8 *temps = data->temps;
+	u8 *percents = data->percents;
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
+static int fan_curve_write_data(struct asus_wmi *asus, struct device_attribute *attr)
+{
+	int err;
+
+	if (asus->cpu_fan_curve_available) {
+		err = fan_curve_write(asus, attr, ASUS_WMI_DEVID_CPU_FAN_CURVE);
+		if (err)
+			return err;
+	}
+
+	if (asus->gpu_fan_curve_available) {
+		err = fan_curve_write(asus, attr, ASUS_WMI_DEVID_GPU_FAN_CURVE);
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
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	struct fan_curve_data *data = fan_curve_data_select(asus, attr);
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
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	struct fan_curve_data *data = fan_curve_data_select(asus, attr);
+
+	return sysfs_emit(buf, "%d\n", data->enabled);
+}
+
+static int fan_curve_set_default(struct asus_wmi *asus)
+{
+	int err;
+
+	err = fan_curve_get_factory_default(
+		asus, ASUS_WMI_DEVID_CPU_FAN_CURVE);
+	if (err)
+		return err;
+	err = fan_curve_get_factory_default(
+		asus, ASUS_WMI_DEVID_GPU_FAN_CURVE);
+	if (err)
+		return err;
+	return 0;
+}
+
+static ssize_t fan_curve_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct asus_wmi *asus = dev_get_drvdata(dev);
+	struct fan_curve_data *data = fan_curve_data_select(asus, attr);
+	int value;
+	int err;
+
+	err = kstrtoint(buf, 10, &value);
+	if (err < 0)
+		return err;
+
+	switch (value) {
+	case 1:
+		data->enabled = true;
+		break;
+	case 2:
+		data->enabled = false;
+		break;
+	/* Auto + reset the fan curve data to defaults */
+	case 3:
+		err = fan_curve_set_default(asus);
+		if (err)
+			return err;
+		data->enabled = false;
+		break;
+	default:
+		return -EINVAL;
+	};
+
+	/*
+	 * For machines with throttle this is the only way to reset fans to
+	 * default mode of operation (does not erase curve data).
+	 */
+	if (asus->throttle_thermal_policy_available && !data->enabled) {
+		err = throttle_thermal_policy_write(asus);
+		if (err)
+			return err;
+	}
+	/* Similar is true for laptops with this fan */
+	if (asus->fan_type == FAN_TYPE_SPEC83) {
+		err = asus_fan_set_auto(asus);
+		if (err)
+			return err;
+	}
+	/*
+	 * Machines without either need to write their defaults back always.
+	 * This is more of a safeguard against ASUS faulty ACPI tables.
+	 */
+	if (!asus->throttle_thermal_policy_available
+	    && asus->fan_type != FAN_TYPE_SPEC83 && !data->enabled) {
+		err = fan_curve_set_default(asus);
+		if (err)
+			return err;
+		err = fan_curve_write_data(asus, attr);
+		if (err)
+			return err;
+	}
+
+	if (data->enabled) {
+		err = fan_curve_write_data(asus, attr);
+		if (err)
+			return err;
+	}
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
@@ -2053,8 +2679,8 @@ static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
 	asus->throttle_thermal_policy_available = false;
 
 	err = asus_wmi_get_devstate(asus,
-				    ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
-				    &result);
+		ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
+		&result);
 	if (err) {
 		if (err == -ENODEV)
 			return 0;
@@ -2092,6 +2718,12 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
 		return -EIO;
 	}
 
+	/* Must set to disabled if mode is toggled */
+	if (asus->cpu_fan_curve_available)
+		asus->custom_fan_curves[0].enabled = false;
+	if (asus->gpu_fan_curve_available)
+		asus->custom_fan_curves[1].enabled = false;
+
 	return 0;
 }
 
@@ -2904,7 +3536,7 @@ static int show_call(struct seq_file *m, void *data)
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
-	obj = (union acpi_object *)output.pointer;
+	obj = output.pointer;
 	if (obj && obj->type == ACPI_TYPE_INTEGER)
 		seq_printf(m, "%#x(%#x, %#x) = %#x\n", asus->debug.method_id,
 			   asus->debug.dev_id, asus->debug.ctrl_param,
@@ -3038,6 +3670,10 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (err)
 		goto fail_hwmon;
 
+	err = asus_wmi_custom_fan_curve_init(asus);
+	if (err)
+		goto fail_custom_fan_curve;
+
 	err = asus_wmi_led_init(asus);
 	if (err)
 		goto fail_leds;
@@ -3109,6 +3745,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	asus_wmi_sysfs_exit(asus->platform_device);
 fail_sysfs:
 fail_throttle_thermal_policy:
+fail_custom_fan_curve:
 fail_platform_profile_setup:
 	if (asus->platform_profile_support)
 		platform_profile_remove();
@@ -3134,6 +3771,7 @@ static int asus_wmi_remove(struct platform_device *device)
 	asus_wmi_debugfs_exit(asus);
 	asus_wmi_sysfs_exit(asus->platform_device);
 	asus_fan_set_auto(asus);
+	throttle_thermal_policy_set_default(asus);
 	asus_wmi_battery_exit(asus);
 
 	if (asus->platform_profile_support)
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

