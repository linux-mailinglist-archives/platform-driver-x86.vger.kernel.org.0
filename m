Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0F0D5E800
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Jul 2019 17:41:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725847AbfGCPlo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Jul 2019 11:41:44 -0400
Received: from fallback15.mail.ru ([94.100.179.50]:33906 "EHLO
        fallback15.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726721AbfGCPlo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Jul 2019 11:41:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=dwZU2IdalR5sOX7PciYj9nOLCP6PVqnAwVG7b3ZatcQ=;
        b=YLbNqpQ89yARe8FvquP0yrijYB/a2LCZqQ2fYhfi56IPtoq8Yb/ugNJ91/aCMgz8l30GM+Ort0gnXZ74RVVW5F3x/7+8vxcWAQm7Qwb1RUNrNZJc0pcIk1UiDJU5vCpQFDKtzlrG8vMvHSNODCnTV1HS5u4FB7hWycElBgM5aP0=;
Received: from [10.161.8.33] (port=49162 helo=smtp14.mail.ru)
        by fallback15.m.smailru.net with esmtp (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihO1-0004on-J7
        for platform-driver-x86@vger.kernel.org; Wed, 03 Jul 2019 18:41:33 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From; bh=dwZU2IdalR5sOX7PciYj9nOLCP6PVqnAwVG7b3ZatcQ=;
        b=YLbNqpQ89yARe8FvquP0yrijYB/a2LCZqQ2fYhfi56IPtoq8Yb/ugNJ91/aCMgz8l30GM+Ort0gnXZ74RVVW5F3x/7+8vxcWAQm7Qwb1RUNrNZJc0pcIk1UiDJU5vCpQFDKtzlrG8vMvHSNODCnTV1HS5u4FB7hWycElBgM5aP0=;
Received: by smtp14.mail.ru with esmtpa (envelope-from <nemcev_aleksey@inbox.ru>)
        id 1hihNz-0001vG-1k; Wed, 03 Jul 2019 18:41:31 +0300
From:   Nemcev_Aleksey@inbox.ru
To:     platform-driver-x86@vger.kernel.org
Cc:     Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
Subject: [PATCH 1/4] platform/x86: asus-wmi: Add wmi_needs_3_args quirk
Date:   Wed,  3 Jul 2019 18:40:59 +0300
Message-Id: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-77F55803: 3FFC80838138E3AB5A78504BD2AC294133C3DD4F2B53C4EDBD7DF4EF93E893973B8746B73031A8FB71627129559B8843
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE788F80C3E4F8533EBEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006370B7B3F71CF0380598638F802B75D45FF5571747095F342E8C7A0BC55FA0FE5FC62F6EB1692E494EC8CD6B873F7B7E4859BDE1200281BD902389733CBF5DBD5E913377AFFFEAFD269A417C69337E82CC2CC7F00164DA146DAFE8445B8C89999725571747095F342E8C26CFBAC0749D213D2E47CDBA5A9658359CC434672EE6371117882F4460429728AD0CFFFB425014E40A5AABA2AD371193AA81AA40904B5D9A18204E546F3947C72BE6798D6036352BA3038C0950A5D36C8A9BA7A39EFB766BE1D6DAAD8F14AE176E601842F6C81A127C277FBC8AE2E8BE7CF831D07CEC04ED81D268191BDAD3DC74AC4170110C6EC35872C767BF85DA227C277FBC8AE2E8B10F8C14D5B06AFC693A58207EC9036CD35872C767BF85DA2F004C906525384306FED454B719173D6462275124DF8B9C934F12F0C005D1A85E5BFE6E7EFDEDCD789D4C264860C145E
X-Mailru-Sender: BAC27832F44D5424910E42FD2D628468E35CA7FE35398775E4E89C4BF8899FDDD2EF8CEB4856BCE9B5D628A7EF4494575C5F6E3C72ABB53BB0D9B300F142F0238EAA47040EB6BC244E4EA347F45ED768B49EAA7E57EF395F3453F38A29522196
X-Mras: OK
X-77F55803: 5241C2F38277A35D7F9F52485CB584D7271FD7DF62800FDC8A2F546F6BD22D8117DCCFA09BCD30C73E69F54B27A2D3974377C52109CA8204
X-7FA49CB5: 0D63561A33F958A55A140C4E4A4CEA2DC3124AD815045300CCC51FD5857EA4678941B15DA834481FA18204E546F3947CEDCF5861DED71B2F389733CBF5DBD5E9C8A9BA7A39EFB7666BA297DBC24807EA117882F44604297287769387670735209ECD01F8117BC8BEA471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0FECB2555BB02FD5A93B503F486389A921A5CC5B56E945C8DA
X-Mailru-Sender: A5480F10D64C9005D917D4885F602B38603BC1C7A63DF611BDCFD8A7726B98940A95ADFD67C9AF73E50935EE66542E109654EF9EE9506939349998EA56B56CE1D251A790F4B35225EC94D6048180DDBE5FEEDEB644C299C0ED14614B50AE0675
X-Mras: OK
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>

It is necessary for some Asus notebook models like FX705GE with the
AURA RGB keyboard backlight

On these models, 3 arguments must be passed to the WMI, or call fails:
[ 4524.641086] ACPI Error: Field [IIA2] at bit offset/length 64/32 exceeds size of target Buffer (64 bits) (20180531/dsopcode-201)
[ 4524.641105] No Local Variables are initialized for Method [WMNB]
[ 4524.641108] Initialized Arguments for Method [WMNB]:  (3 arguments defined for method invocation)
[ 4524.641109]   Arg0:   00000000ad8fc150 <Obj>           Integer 0000000000000000
[ 4524.641119]   Arg1:   0000000097c8ea2f <Obj>           Integer 0000000054494E49
[ 4524.641127]   Arg2:   00000000f3aa4ecd <Obj>           Buffer(8) 00 00 00 00 00 00 00 00

Signed-off-by: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
---
 drivers/platform/x86/asus-nb-wmi.c         |   4 +
 drivers/platform/x86/asus-wmi.c            | 216 ++++++++++++++++-----
 drivers/platform/x86/asus-wmi.h            |   1 +
 include/linux/platform_data/x86/asus-wmi.h |   8 +-
 4 files changed, 174 insertions(+), 55 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 8d9e30dbb5af..4bed95357a32 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -110,6 +110,10 @@ static struct quirk_entry quirk_asus_forceals = {
 	.wmi_force_als_set = true,
 };
 
+static struct quirk_entry quirk_asus_wmi_needs_3_args = {
+	.wmi_needs_3_args = true,
+};
+
 static int dmi_matched(const struct dmi_system_id *dmi)
 {
 	pr_info("Identified laptop model '%s'\n", dmi->ident);
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 9b18a184e0aa..56a407fa8944 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -87,6 +87,12 @@ struct bios_args {
 	u32 arg1;
 } __packed;
 
+struct bios_3args {
+	u32 arg0;
+	u32 arg1;
+	u32 arg2;
+} __packed;
+
 /*
  * Struct that's used for all methods called via AGFN. Naming is
  * identically to the AML code.
@@ -110,6 +116,7 @@ struct fan_args {
  * <platform>/    - debugfs root directory
  *   dev_id      - current dev_id
  *   ctrl_param  - current ctrl_param
+ *   ctrl_param2 - current ctrl_param2 (only with quirk_asus_wmi_needs_3_args)
  *   method_id   - current method_id
  *   devs        - call DEVS(dev_id, ctrl_param) and print result
  *   dsts        - call DSTS(dev_id)  and print result
@@ -120,6 +127,7 @@ struct asus_wmi_debug {
 	u32 method_id;
 	u32 dev_id;
 	u32 ctrl_param;
+	u32 ctrl_param2;
 };
 
 struct asus_rfkill {
@@ -211,13 +219,10 @@ static void asus_wmi_input_exit(struct asus_wmi *asus)
 	asus->inputdev = NULL;
 }
 
-int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
+int asus_wmi_evaluate_method_common(u32 method_id, void *args,
+				    size_t args_size, u32 *retval)
 {
-	struct bios_args args = {
-		.arg0 = arg0,
-		.arg1 = arg1,
-	};
-	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer input = { (acpi_size) args_size, args };
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_status status;
 	union acpi_object *obj;
@@ -247,9 +252,46 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
 
 	return 0;
 }
+
+int asus_wmi_evaluate_method(struct asus_wmi *asus, u32 method_id, u32 arg0,
+			     u32 arg1, u32 *retval)
+{
+	void *args_pointer = NULL;
+	size_t args_size = 0;
+	struct bios_args args;
+	struct bios_3args args3;
+
+	if (asus->driver->quirks->wmi_needs_3_args) {
+		args3.arg0 = arg0;
+		args3.arg1 = arg1;
+		args3.arg2 = 0;
+		args_pointer = &args3;
+		args_size = sizeof(args3);
+	} else {
+		args.arg0 = arg0;
+		args.arg1 = arg1;
+		args_pointer = &args;
+		args_size = sizeof(args);
+	}
+	return asus_wmi_evaluate_method_common(method_id, args_pointer,
+					       args_size, retval);
+}
 EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
 
-static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
+static int asus_wmi_evaluate_method_3args(u32 method_id, u32 arg0, u32 arg1,
+					  u32 arg2, u32 *retval)
+{
+	struct bios_3args args = {
+		.arg0 = arg0,
+		.arg1 = arg1,
+		.arg2 = arg2,
+	};
+	return asus_wmi_evaluate_method_common(method_id, &args, sizeof(args),
+					       retval);
+}
+
+static int asus_wmi_evaluate_method_agfn(struct asus_wmi *asus,
+					 const struct acpi_buffer args)
 {
 	struct acpi_buffer input;
 	u64 phys_addr;
@@ -267,7 +309,7 @@ static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
 	phys_addr = virt_to_phys(input.pointer);
 	memcpy(input.pointer, args.pointer, args.length);
 
-	status = asus_wmi_evaluate_method(ASUS_WMI_METHODID_AGFN,
+	status = asus_wmi_evaluate_method(asus, ASUS_WMI_METHODID_AGFN,
 					phys_addr, 0, &retval);
 	if (!status)
 		memcpy(args.pointer, input.pointer, args.length);
@@ -279,18 +321,27 @@ static int asus_wmi_evaluate_method_agfn(const struct acpi_buffer args)
 	return retval;
 }
 
-static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
+static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id,
+				 u32 *retval)
 {
-	return asus_wmi_evaluate_method(asus->dsts_id, dev_id, 0, retval);
+	return asus_wmi_evaluate_method(asus, asus->dsts_id, dev_id, 0,
+					retval);
 }
 
-static int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
-				 u32 *retval)
+static int asus_wmi_set_devstate(struct asus_wmi *asus, u32 dev_id,
+				 u32 ctrl_param, u32 *retval)
 {
-	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
+	return asus_wmi_evaluate_method(asus, ASUS_WMI_METHODID_DEVS, dev_id,
 					ctrl_param, retval);
 }
 
+static int asus_wmi_set_devstate_3args(u32 dev_id, u32 ctrl_param,
+				       u32 ctrl_param2, u32 *retval)
+{
+	return asus_wmi_evaluate_method_3args(ASUS_WMI_METHODID_DEVS, dev_id,
+					      ctrl_param, ctrl_param2, retval);
+}
+
 /* Helper for special devices with magic return codes */
 static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
 				      u32 dev_id, u32 mask)
@@ -337,7 +388,8 @@ static void tpd_led_update(struct work_struct *work)
 	asus = container_of(work, struct asus_wmi, tpd_led_work);
 
 	ctrl_param = asus->tpd_led_wk;
-	asus_wmi_set_devstate(ASUS_WMI_DEVID_TOUCHPAD_LED, ctrl_param, NULL);
+	asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_TOUCHPAD_LED, ctrl_param,
+			      NULL);
 }
 
 static void tpd_led_set(struct led_classdev *led_cdev,
@@ -376,7 +428,8 @@ static void kbd_led_update(struct asus_wmi *asus)
 	if (asus->kbd_led_wk > 0)
 		ctrl_param = 0x80 | (asus->kbd_led_wk & 0x7F);
 
-	asus_wmi_set_devstate(ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param, NULL);
+	asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_KBD_BACKLIGHT, ctrl_param,
+			      NULL);
 }
 
 static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
@@ -479,7 +532,8 @@ static void wlan_led_update(struct work_struct *work)
 	asus = container_of(work, struct asus_wmi, wlan_led_work);
 
 	ctrl_param = asus->wlan_led_wk;
-	asus_wmi_set_devstate(ASUS_WMI_DEVID_WIRELESS_LED, ctrl_param, NULL);
+	asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_WIRELESS_LED, ctrl_param,
+			      NULL);
 }
 
 static void wlan_led_set(struct led_classdev *led_cdev,
@@ -512,7 +566,7 @@ static void lightbar_led_update(struct work_struct *work)
 	asus = container_of(work, struct asus_wmi, lightbar_led_work);
 
 	ctrl_param = asus->lightbar_led_wk;
-	asus_wmi_set_devstate(ASUS_WMI_DEVID_LIGHTBAR, ctrl_param, NULL);
+	asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_LIGHTBAR, ctrl_param, NULL);
 }
 
 static void lightbar_led_set(struct led_classdev *led_cdev,
@@ -848,7 +902,7 @@ static int asus_rfkill_set(void *data, bool blocked)
 	     priv->asus->driver->wlan_ctrl_by_user)
 		dev_id = ASUS_WMI_DEVID_WLAN_LED;
 
-	return asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
+	return asus_wmi_set_devstate(priv->asus, dev_id, ctrl_param, NULL);
 }
 
 static void asus_rfkill_query(struct rfkill *rfkill, void *data)
@@ -1082,9 +1136,9 @@ static void asus_wmi_set_xusb2pr(struct asus_wmi *asus)
  * Some devices dont support or have borcken get_als method
  * but still support set method.
  */
-static void asus_wmi_set_als(void)
+static void asus_wmi_set_als(struct asus_wmi *asus)
 {
-	asus_wmi_set_devstate(ASUS_WMI_DEVID_ALS_ENABLE, 1, NULL);
+	asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_ALS_ENABLE, 1, NULL);
 }
 
 /*
@@ -1106,7 +1160,7 @@ static int asus_hwmon_agfn_fan_speed_read(struct asus_wmi *asus, int fan,
 	if (fan != 1)
 		return -EINVAL;
 
-	status = asus_wmi_evaluate_method_agfn(input);
+	status = asus_wmi_evaluate_method_agfn(asus, input);
 
 	if (status || args.agfn.err)
 		return -ENXIO;
@@ -1134,7 +1188,7 @@ static int asus_hwmon_agfn_fan_speed_write(struct asus_wmi *asus, int fan,
 	if (fan != 1 && fan != 0)
 		return -EINVAL;
 
-	status = asus_wmi_evaluate_method_agfn(input);
+	status = asus_wmi_evaluate_method_agfn(asus, input);
 
 	if (status || args.agfn.err)
 		return -ENXIO;
@@ -1504,7 +1558,7 @@ static int update_bl_status(struct backlight_device *bd)
 	power = read_backlight_power(asus);
 	if (power != -ENODEV && bd->props.power != power) {
 		ctrl_param = !!(bd->props.power == FB_BLANK_UNBLANK);
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT,
+		err = asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_BACKLIGHT,
 					    ctrl_param, NULL);
 		if (asus->driver->quirks->store_backlight_power)
 			asus->driver->panel_power = bd->props.power;
@@ -1520,7 +1574,7 @@ static int update_bl_status(struct backlight_device *bd)
 	else
 		ctrl_param = bd->props.brightness;
 
-	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BRIGHTNESS,
+	err = asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_BRIGHTNESS,
 				    ctrl_param, NULL);
 
 	return err;
@@ -1625,7 +1679,7 @@ static void asus_wmi_fnlock_update(struct asus_wmi *asus)
 {
 	int mode = asus->fnlock_locked;
 
-	asus_wmi_set_devstate(ASUS_WMI_DEVID_FNLOCK, mode, NULL);
+	asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_FNLOCK, mode, NULL);
 }
 
 static void asus_wmi_notify(u32 value, void *context)
@@ -1730,7 +1784,7 @@ static ssize_t store_sys_wmi(struct asus_wmi *asus, int devid,
 		return value;
 
 	rv = parse_arg(buf, count, &value);
-	err = asus_wmi_set_devstate(devid, value, &retval);
+	err = asus_wmi_set_devstate(asus, devid, value, &retval);
 
 	if (err < 0)
 		return err;
@@ -1783,13 +1837,15 @@ static ssize_t cpufv_store(struct device *dev, struct device_attribute *attr,
 			   const char *buf, size_t count)
 {
 	int value, rv;
+	struct asus_wmi *asus = dev_get_drvdata(dev);
 
 	if (!count || sscanf(buf, "%i", &value) != 1)
 		return -EINVAL;
 	if (value < 0 || value > 2)
 		return -EINVAL;
 
-	rv = asus_wmi_evaluate_method(ASUS_WMI_METHODID_CFVS, value, 0, NULL);
+	rv = asus_wmi_evaluate_method(asus, ASUS_WMI_METHODID_CFVS, value, 0,
+				      NULL);
 	if (rv < 0)
 		return rv;
 
@@ -1856,11 +1912,12 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	int rv;
 
 	/* INIT enable hotkeys on some models */
-	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_INIT, 0, 0, &rv))
+	if (!asus_wmi_evaluate_method(asus, ASUS_WMI_METHODID_INIT, 0, 0, &rv))
 		pr_info("Initialization: %#x\n", rv);
 
 	/* We don't know yet what to do with this version... */
-	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_SPEC, 0, 0x9, &rv)) {
+	if (!asus_wmi_evaluate_method(asus,
+				      ASUS_WMI_METHODID_SPEC, 0, 0x9, &rv)) {
 		pr_info("BIOS WMI version: %d.%d\n", rv >> 16, rv & 0xFF);
 		asus->spec = rv;
 	}
@@ -1871,7 +1928,8 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	 * bit signifies that the laptop is equipped with a Wi-Fi MiniPCI card.
 	 * The significance of others is yet to be found.
 	 */
-	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_SFUN, 0, 0, &rv)) {
+	if (!asus_wmi_evaluate_method(asus,
+				      ASUS_WMI_METHODID_SFUN, 0, 0, &rv)) {
 		pr_info("SFUN value: %#x\n", rv);
 		asus->sfun = rv;
 	}
@@ -1883,7 +1941,7 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	 * or note, while on notebooks, they returns 0xFFFFFFFE on failure,
 	 * but once again, SPEC may probably be used for that kind of things.
 	 */
-	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, 0, 0, NULL))
+	if (!asus_wmi_evaluate_method(asus, ASUS_WMI_METHODID_DSTS, 0, 0, NULL))
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS;
 	else
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
@@ -1891,7 +1949,7 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
 	if (asus->driver->quirks->wapf >= 0)
-		asus_wmi_set_devstate(ASUS_WMI_DEVID_CWAP,
+		asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_CWAP,
 				      asus->driver->quirks->wapf, NULL);
 
 	return asus_wmi_sysfs_init(asus->platform_device);
@@ -1932,15 +1990,25 @@ static int show_devs(struct seq_file *m, void *data)
 	struct asus_wmi *asus = m->private;
 	int err;
 	u32 retval = -1;
-
-	err = asus_wmi_set_devstate(asus->debug.dev_id, asus->debug.ctrl_param,
-				    &retval);
+	if (asus->driver->quirks->wmi_needs_3_args)
+		err = asus_wmi_set_devstate_3args(asus->debug.dev_id,
+						  asus->debug.ctrl_param,
+						  asus->debug.ctrl_param2,
+						  &retval);
+	else
+		err = asus_wmi_set_devstate(asus, asus->debug.dev_id,
+					    asus->debug.ctrl_param, &retval);
 
 	if (err < 0)
 		return err;
 
-	seq_printf(m, "DEVS(%#x, %#x) = %#x\n", asus->debug.dev_id,
-		   asus->debug.ctrl_param, retval);
+	if (asus->driver->quirks->wmi_needs_3_args)
+		seq_printf(m, "DEVS(%#x, %#x, %#x) = %#x\n", asus->debug.dev_id,
+			   asus->debug.ctrl_param, asus->debug.ctrl_param2,
+			   retval);
+	else
+		seq_printf(m, "DEVS(%#x, %#x) = %#x\n", asus->debug.dev_id,
+			   asus->debug.ctrl_param, retval);
 
 	return 0;
 }
@@ -1948,15 +2016,27 @@ static int show_devs(struct seq_file *m, void *data)
 static int show_call(struct seq_file *m, void *data)
 {
 	struct asus_wmi *asus = m->private;
-	struct bios_args args = {
-		.arg0 = asus->debug.dev_id,
-		.arg1 = asus->debug.ctrl_param,
-	};
-	struct acpi_buffer input = { (acpi_size) sizeof(args), &args };
+	struct acpi_buffer input;
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
 	acpi_status status;
 
+	struct bios_args  args;
+	struct bios_3args args3;
+
+	if (asus->driver->quirks->wmi_needs_3_args) {
+		args3.arg0 = asus->debug.dev_id;
+		args3.arg1 = asus->debug.ctrl_param;
+		args3.arg2 = asus->debug.ctrl_param2;
+		input.length = (acpi_size) sizeof(args3);
+		input.pointer =  &args3;
+	} else {
+		args.arg0 = asus->debug.dev_id;
+		args.arg1 = asus->debug.ctrl_param;
+		input.length = (acpi_size) sizeof(args);
+		input.pointer =  &args;
+	}
+
 	status = wmi_evaluate_method(ASUS_WMI_MGMT_GUID,
 				     0, asus->debug.method_id,
 				     &input, &output);
@@ -1965,14 +2045,35 @@ static int show_call(struct seq_file *m, void *data)
 		return -EIO;
 
 	obj = (union acpi_object *)output.pointer;
-	if (obj && obj->type == ACPI_TYPE_INTEGER)
-		seq_printf(m, "%#x(%#x, %#x) = %#x\n", asus->debug.method_id,
-			   asus->debug.dev_id, asus->debug.ctrl_param,
-			   (u32) obj->integer.value);
-	else
-		seq_printf(m, "%#x(%#x, %#x) = t:%d\n", asus->debug.method_id,
-			   asus->debug.dev_id, asus->debug.ctrl_param,
-			   obj ? obj->type : -1);
+	if (asus->driver->quirks->wmi_needs_3_args) {
+		if (obj && obj->type == ACPI_TYPE_INTEGER)
+			seq_printf(m, "%#x(%#x, %#x, %#x) = %#x\n",
+				   asus->debug.method_id,
+				   asus->debug.dev_id,
+				   asus->debug.ctrl_param,
+				   asus->debug.ctrl_param2,
+				   (u32) obj->integer.value);
+		else
+			seq_printf(m, "%#x(%#x, %#x, %#x) = t:%d\n",
+				   asus->debug.method_id,
+				   asus->debug.dev_id,
+				   asus->debug.ctrl_param,
+				   asus->debug.ctrl_param2,
+				   obj ? obj->type : -1);
+	} else {
+		if (obj && obj->type == ACPI_TYPE_INTEGER)
+			seq_printf(m, "%#x(%#x, %#x) = %#x\n",
+				   asus->debug.method_id,
+				   asus->debug.dev_id,
+				   asus->debug.ctrl_param,
+				   (u32) obj->integer.value);
+		else
+			seq_printf(m, "%#x(%#x, %#x) = t:%d\n",
+				   asus->debug.method_id,
+				   asus->debug.dev_id,
+				   asus->debug.ctrl_param,
+				   obj ? obj->type : -1);
+	}
 
 	kfree(obj);
 
@@ -2031,6 +2132,14 @@ static int asus_wmi_debugfs_init(struct asus_wmi *asus)
 	if (!dent)
 		goto error_debugfs;
 
+	if (asus->driver->quirks->wmi_needs_3_args) {
+		dent = debugfs_create_x32("ctrl_param2", S_IRUGO | S_IWUSR,
+					  asus->debug.root,
+					  &asus->debug.ctrl_param2);
+		if (!dent)
+			goto error_debugfs;
+	}
+
 	for (i = 0; i < ARRAY_SIZE(asus_wmi_debug_files); i++) {
 		struct asus_wmi_debugfs_node *node = &asus_wmi_debug_files[i];
 
@@ -2125,7 +2234,7 @@ static int asus_wmi_add(struct platform_device *pdev)
 	}
 
 	if (asus->driver->quirks->wmi_force_als_set)
-		asus_wmi_set_als();
+		asus_wmi_set_als(asus);
 
 	/* Some Asus desktop boards export an acpi-video backlight interface,
 	   stop this from showing up */
@@ -2147,7 +2256,8 @@ static int asus_wmi_add(struct platform_device *pdev)
 		if (err && err != -ENODEV)
 			goto fail_backlight;
 	} else if (asus->driver->quirks->wmi_backlight_set_devstate)
-		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_BACKLIGHT, 2, NULL);
+		err = asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_BACKLIGHT, 2,
+					    NULL);
 
 	if (asus_wmi_has_fnlock_key(asus)) {
 		asus->fnlock_locked = true;
@@ -2220,7 +2330,7 @@ static int asus_hotk_thaw(struct device *device)
 		 * we should kick it ourselves in case hibernation is aborted.
 		 */
 		wlan = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_WLAN);
-		asus_wmi_set_devstate(ASUS_WMI_DEVID_WLAN, wlan, NULL);
+		asus_wmi_set_devstate(asus, ASUS_WMI_DEVID_WLAN, wlan, NULL);
 	}
 
 	return 0;
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index 4f31b68642a0..9568e42a6995 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -33,6 +33,7 @@ struct quirk_entry {
 	bool wmi_backlight_native;
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
+	bool wmi_needs_3_args;
 	int wapf;
 	/*
 	 * For machines with AMD graphic chips, it will send out WMI event
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index bfba245636a7..06dd9892533b 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -89,10 +89,14 @@
 #define ASUS_WMI_DSTS_MAX_BRIGTH_MASK	0x0000FF00
 #define ASUS_WMI_DSTS_LIGHTBAR_MASK	0x0000000F
 
+struct asus_wmi;
+
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
-int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
+int asus_wmi_evaluate_method(struct asus_wmi *asus, u32 method_id, u32 arg0,
+			     u32 arg1, u32 *retval);
 #else
-static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
+static inline int asus_wmi_evaluate_method(struct asus_wmi *asus,
+					   u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
 	return -ENODEV;
-- 
2.20.1

