Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 656A4395338
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 May 2021 00:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbhE3Wde (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 May 2021 18:33:34 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.116]:41796 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229897AbhE3Wde (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 May 2021 18:33:34 -0400
Received: from [100.112.135.212] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-west-2.aws.symcld.net id E0/DD-13947-B5214B06; Sun, 30 May 2021 22:31:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHIsWRWlGSWpSXmKPExsWSLveKTTdKaEu
  CwfKHshYvJxxmtDi04QCTxZvj05ksVu95wezA4jFp5gxmj52z7rJ7vN93lc3j8ya5AJYo1sy8
  pPyKBNaMhevKChY1MlV8P3uQuYHx2m3GLkYuDiGBf4wSVy4vZ4NwXjNKXN7/ESjDycEmoC2xZ
  csvoAQHh4iAjMSHtZ4gJrNArcTnmVwgFcICcRL7jk9lBgmzCKhKbJgSARLmFbCWeNL8hhnElh
  CQlzh94hrYQE4BG4nWB9uZQGwhgVCJHUsmMUPUC0qcnPmEBcRmFtCUaN3+mx3Clpdo3jobbk7
  b+TYmCDtBouffI7YJjAKzkLTPQtI+C0n7AkbmVYzmSUWZ6RkluYmZObqGBga6hoZGuobGxrpm
  FnqJVbpJeqXFuuWpxSW6RnqJ5cV6xZW5yTkpenmpJZsYgUGfUtDqsoPx/+sPeocYJTmYlER5x
  RU3JwjxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4K0S2JIgJFiUmp5akZaZA4xAmLQEB4+SCC+fIF
  Cat7ggMbc4Mx0idYpRl+P820+bmYVY8vLzUqXEeZNBigRAijJK8+BGwJLBJUZZKWFeRgYGBiG
  egtSi3MwSVPlXjOIcjErCvBYgU3gy80rgNr0COoIJ6IjPoZtAjihJREhJNTC1nbbrvL2rq3FR
  xwMDA9cjVpp8nkW515641nQ+eb5/S+wulQL/pzpfdn2c/CRkg4GSYKHNnVk7ZMT/8bPu+7Akb
  SGbAK/HrNq3G0v6xW8z66d6KnRfmbh9a6zAKjetYwcqmJb+ctgTaX/twO0bXvNeBXxm8taJd/
  Of7GdnzbrXYJbLj8NR87/tUl3D3BHTp64XrTZ3U/j5+vLGiwxlF1UDLM0aufkUb+WL2Eoc9eb
  tUHzd/eGZb/228tV9vJeUeEvro6dEBjnuuK5Wxif4QXWiSGxE7brbyWfzOF9ama2w4lScXbA7
  zdvkzfItTzfF3n15ir00yVHM5cb1gC0WT/xm3p20Sldtyt+1qX4nFiuxFGckGmoxFxUnAgBfw
  ce2gQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-6.tower-346.messagelabs.com!1622413912!27629!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22478 invoked from network); 30 May 2021 22:31:54 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-6.tower-346.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 30 May 2021 22:31:54 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 1DF0E944D40F6715E83;
        Mon, 31 May 2021 06:31:50 +0800 (CST)
Received: from localhost.localdomain.com (10.38.59.12) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Sun, 30 May 2021 18:31:48 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <andy.shevchenko@gmail.com>,
        <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v5 3/3] platform/x86: think-lmi: Add WMI interface support on Lenovo platforms
Date:   Sun, 30 May 2021 18:31:11 -0400
Message-ID: <20210530223111.25929-3-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210530223111.25929-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20210530223111.25929-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.59.12]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For Lenovo platforms that support a WMI interface to the BIOS add
support, using the firmware-attributes class, to allow users to access
and modify various BIOS related settings.

Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in V2:
 - Improved error handling
 - updated to use kobj's better (thanks Hans for pointers). Makes code
   simpler and cleaner
 - Removed some dead code from previous implementation that I'd missed
 - Moved think-lmi.h into platform/x86 directory
 - Use firmware_attributes_class helper
 - Corrected some bad indexing when storing an attribute
 - improved encoding options to limit selection
 - Added details on encoding and kbdlang to
   sysfs-class-firmware-attributes documentation

Changes in v3:
 - Clean up is_enabled display
 - Use new firmware-attributes class API names
 - Correct release of kobj objects
 - Change pwd_type to const char
 - Add role field to pwd_settings
 - Improved checking when setting new password

Changes in v4:
 - Updated documentation with password update specifics
 - Implement tlmi_errs to make error string scanning cleaner
 - Clean up pointer check handling
 - Clean up pointer free handling
 - Clean up pwd string length handling as recommended
 - Use kasprintf where appropriate
 - use strreplace where appropriate
 - Cosmetic cleanups as recommended

Changes in v5:
 - Pick up corrections from Hans review
 - Add details to MAINTAINERS file
 - Clean up code based on review feedback
 - Use strscpy instead of memcpy and sprintf
 - Use strchrnul instead of strreplace

 .../testing/sysfs-class-firmware-attributes   |  18 +-
 MAINTAINERS                                   |   7 +
 drivers/platform/x86/Kconfig                  |  13 +-
 drivers/platform/x86/Makefile                 |   3 +-
 drivers/platform/x86/think-lmi.c              | 891 ++++++++++++++++++
 drivers/platform/x86/think-lmi.h              |  81 ++
 6 files changed, 1010 insertions(+), 3 deletions(-)
 create mode 100644 drivers/platform/x86/think-lmi.c
 create mode 100644 drivers/platform/x86/think-lmi.h

diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
index 8ea59fea4..3348bf80a 100644
--- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -197,8 +197,24 @@ Description:
 		Drivers may emit a CHANGE uevent when a password is set or unset
 		userspace may check it again.
 
-		On Dell systems, if Admin password is set, then all BIOS attributes
+		On Dell and Lenovo systems, if Admin password is set, then all BIOS attributes
 		require password validation.
+		On Lenovo systems if you change the Admin password the new password is not active until
+		the next boot.
+
+		Lenovo specific class extensions
+		------------------------------
+
+		On Lenovo systems the following additional settings are available:
+
+		lenovo_encoding:
+					The encoding method that is used. This can be either "ascii"
+					or "scancode". Default is set to "ascii"
+
+		lenovo_kbdlang:
+					The keyboard language method that is used. This is generally a
+					two char code (e.g. "us", "fr", "gr") and may vary per platform.
+					Default is set to "us"
 
 What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
 Date:		February 2021
diff --git a/MAINTAINERS b/MAINTAINERS
index e845f052a..82854dbff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18160,6 +18160,13 @@ W:	http://thinkwiki.org/wiki/Ibm-acpi
 T:	git git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git
 F:	drivers/platform/x86/thinkpad_acpi.c
 
+THINKPAD LMI DRIVER
+M:	Mark Pearson <markpearson@lenovo.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-class-firmware-attributes
+F:	drivers/platform/x86/think-lmi.c
+
 THUNDERBOLT DMA TRAFFIC TEST DRIVER
 M:	Isaac Hazan <isaac.hazan@intel.com>
 L:	linux-usb@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 57da8352d..09d2f54e2 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -639,6 +639,17 @@ config THINKPAD_ACPI_HOTKEY_POLL
 	  If you are not sure, say Y here.  The driver enables polling only if
 	  it is strictly necessary to do so.
 
+config THINKPAD_LMI
+	tristate "Lenovo WMI-based systems management driver"
+	depends on ACPI_WMI
+	select FW_ATTR_CLASS
+	help
+	  This driver allows changing BIOS settings on Lenovo machines whose
+	  BIOS support the WMI interface.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called think-lmi.
+
 config INTEL_ATOMISP2_LED
 	tristate "Intel AtomISP2 camera LED driver"
 	depends on GPIOLIB && LEDS_GPIO
@@ -1077,7 +1088,7 @@ config TOUCHSCREEN_DMI
 	  Enable this for x86 tablets with Silead or Chipone touchscreens.
 
 config FW_ATTR_CLASS
-	tristate "Firmware attributes class helper module"
+	tristate
 	default n
 
 config INTEL_IMR
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 147573f69..78997301b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -64,6 +64,7 @@ obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
 obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
 obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
 obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
+obj-$(CONFIG_THINKPAD_LMI)	+= think-lmi.o
 
 # Intel
 obj-$(CONFIG_INTEL_ATOMISP2_LED)	+= intel_atomisp2_led.o
@@ -112,10 +113,10 @@ obj-$(CONFIG_SYSTEM76_ACPI)	+= system76_acpi.o
 obj-$(CONFIG_TOPSTAR_LAPTOP)	+= topstar-laptop.o
 
 # Platform drivers
+obj-$(CONFIG_FW_ATTR_CLASS)		+= firmware_attributes_class.o
 obj-$(CONFIG_I2C_MULTI_INSTANTIATE)	+= i2c-multi-instantiate.o
 obj-$(CONFIG_MLX_PLATFORM)		+= mlx-platform.o
 obj-$(CONFIG_TOUCHSCREEN_DMI)		+= touchscreen_dmi.o
-obj-$(CONFIG_FW_ATTR_CLASS)             += firmware_attributes_class.o
 
 # Intel uncore drivers
 obj-$(CONFIG_INTEL_IPS)				+= intel_ips.o
diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
new file mode 100644
index 000000000..854427fed
--- /dev/null
+++ b/drivers/platform/x86/think-lmi.c
@@ -0,0 +1,891 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Think LMI BIOS configuration driver
+ *
+ * Copyright(C) 2019-2021 Lenovo
+ *
+ * Original code from Thinkpad-wmi project https://github.com/iksaif/thinkpad-wmi
+ * Copyright(C) 2017 Corentin Chary <corentin.chary@gmail.com>
+ * Distributed under the GPL-2.0 license
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/acpi.h>
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/string.h>
+#include <linux/types.h>
+#include <linux/wmi.h>
+#include "firmware_attributes_class.h"
+#include "think-lmi.h"
+
+/*
+ * Name:
+ *  Lenovo_BiosSetting
+ * Description:
+ *  Get item name and settings for current LMI instance.
+ * Type:
+ *  Query
+ * Returns:
+ *  "Item,Value"
+ * Example:
+ *  "WakeOnLAN,Enable"
+ */
+#define LENOVO_BIOS_SETTING_GUID "51F5230E-9677-46CD-A1CF-C0B23EE34DB7"
+
+/*
+ * Name:
+ *  Lenovo_SetBiosSetting
+ * Description:
+ *  Change the BIOS setting to the desired value using the Lenovo_SetBiosSetting
+ *  class. To save the settings, use the Lenovo_SaveBiosSetting class.
+ *  BIOS settings and values are case sensitive.
+ *  After making changes to the BIOS settings, you must reboot the computer
+ *  before the changes will take effect.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "Item,Value,Password,Encoding,KbdLang;"
+ * Example:
+ *  "WakeOnLAN,Disable,pa55w0rd,ascii,us;"
+ */
+#define LENOVO_SET_BIOS_SETTINGS_GUID "98479A64-33F5-4E33-A707-8E251EBBC3A1"
+
+/*
+ * Name:
+ *  Lenovo_SaveBiosSettings
+ * Description:
+ *  Save any pending changes in settings.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "Password,Encoding,KbdLang;"
+ * Example:
+ * "pa55w0rd,ascii,us;"
+ */
+#define LENOVO_SAVE_BIOS_SETTINGS_GUID "6A4B54EF-A5ED-4D33-9455-B0D9B48DF4B3"
+
+/*
+ * Name:
+ *  Lenovo_BiosPasswordSettings
+ * Description:
+ *  Return BIOS Password settings
+ * Type:
+ *  Query
+ * Returns:
+ *  PasswordMode, PasswordState, MinLength, MaxLength,
+ *  SupportedEncoding, SupportedKeyboard
+ */
+#define LENOVO_BIOS_PASSWORD_SETTINGS_GUID "8ADB159E-1E32-455C-BC93-308A7ED98246"
+
+/*
+ * Name:
+ *  Lenovo_SetBiosPassword
+ * Description:
+ *  Change a specific password.
+ *  - BIOS settings cannot be changed at the same boot as power-on
+ *    passwords (POP) and hard disk passwords (HDP). If you want to change
+ *    BIOS settings and POP or HDP, you must reboot the system after changing
+ *    one of them.
+ *  - A password cannot be set using this method when one does not already
+ *    exist. Passwords can only be updated or cleared.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "PasswordType,CurrentPassword,NewPassword,Encoding,KbdLang;"
+ * Example:
+ *  "pop,pa55w0rd,newpa55w0rd,ascii,us;”
+ */
+#define LENOVO_SET_BIOS_PASSWORD_GUID "2651D9FD-911C-4B69-B94E-D0DED5963BD7"
+
+/*
+ * Name:
+ *  Lenovo_GetBiosSelections
+ * Description:
+ *  Return a list of valid settings for a given item.
+ * Type:
+ *  Method
+ * Arguments:
+ *  "Item"
+ * Returns:
+ *  "Value1,Value2,Value3,..."
+ * Example:
+ *  -> "FlashOverLAN"
+ *  <- "Enabled,Disabled"
+ */
+#define LENOVO_GET_BIOS_SELECTIONS_GUID	"7364651A-132F-4FE7-ADAA-40C6C7EE2E3B"
+
+#define TLMI_POP_PWD (1 << 0)
+#define TLMI_PAP_PWD (1 << 1)
+#define to_tlmi_pwd_setting(kobj)  container_of(kobj, struct tlmi_pwd_setting, kobj)
+#define to_tlmi_attr_setting(kobj)  container_of(kobj, struct tlmi_attr_setting, kobj)
+
+static const struct tlmi_err_codes tlmi_errs[] = {
+	{"Success", 0},
+	{"Not Supported", -EOPNOTSUPP},
+	{"Invalid Parameter", -EINVAL},
+	{"Access Denied", -EACCES},
+	{"System Busy", -EBUSY},
+};
+
+static const char * const encoding_options[] = {
+	[TLMI_ENCODING_ASCII] = "ascii",
+	[TLMI_ENCODING_SCANCODE] = "scancode",
+};
+static struct think_lmi tlmi_priv;
+struct class *fw_attr_class;
+
+/* ------ Utility functions ------------*/
+/* Convert BIOS WMI error string to suitable error code */
+static int tlmi_errstr_to_err(const char *errstr)
+{
+	int i;
+
+	for (i = 0; i < sizeof(tlmi_errs)/sizeof(struct tlmi_err_codes); i++) {
+		if (!strcmp(tlmi_errs[i].err_str, errstr))
+			return tlmi_errs[i].err_code;
+	}
+	return -EPERM;
+}
+
+/* Extract error string from WMI return buffer */
+static int tlmi_extract_error(const struct acpi_buffer *output)
+{
+	const union acpi_object *obj;
+
+	obj = output->pointer;
+	if (!obj)
+		return -ENOMEM;
+	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer)
+		return -EIO;
+
+	return tlmi_errstr_to_err(obj->string.pointer);
+}
+
+/* Utility function to execute WMI call to BIOS */
+static int tlmi_simple_call(const char *guid, const char *arg)
+{
+	const struct acpi_buffer input = { strlen(arg), (char *)arg };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	int i, err;
+
+	/*
+	 * Duplicated call required to match BIOS workaround for behavior
+	 * seen when WMI accessed via scripting on other OS.
+	 */
+	for (i = 0; i < 2; i++) {
+		/* (re)initialize output buffer to default state */
+		output.length = ACPI_ALLOCATE_BUFFER;
+		output.pointer = NULL;
+
+		status = wmi_evaluate_method(guid, 0, 0, &input, &output);
+		if (ACPI_FAILURE(status)) {
+			kfree(output.pointer);
+			return -EIO;
+		}
+		err = tlmi_extract_error(&output);
+		kfree(output.pointer);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
+/* Extract output string from WMI return buffer */
+static int tlmi_extract_output_string(const struct acpi_buffer *output,
+				      char **string)
+{
+	const union acpi_object *obj;
+	char *s;
+
+	obj = output->pointer;
+	if (!obj)
+		return -ENOMEM;
+	if (obj->type != ACPI_TYPE_STRING || !obj->string.pointer)
+		return -EIO;
+
+	s = kstrdup(obj->string.pointer, GFP_KERNEL);
+	if (!s)
+		return -ENOMEM;
+	*string = s;
+	return 0;
+}
+
+/* ------ Core interface functions ------------*/
+
+/* Get password settings from BIOS */
+static int tlmi_get_pwd_settings(struct tlmi_pwdcfg *pwdcfg)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	const union acpi_object *obj;
+	acpi_status status;
+
+	if (!tlmi_priv.can_get_password_settings)
+		return -EOPNOTSUPP;
+
+	status = wmi_query_block(LENOVO_BIOS_PASSWORD_SETTINGS_GUID, 0,
+				 &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	obj = output.pointer;
+	if (!obj)
+		return -ENOMEM;
+	if (obj->type != ACPI_TYPE_BUFFER || !obj->buffer.pointer) {
+		kfree(obj);
+		return -EIO;
+	}
+	/*
+	 * The size of thinkpad_wmi_pcfg on ThinkStation is larger than ThinkPad.
+	 * To make the driver compatible on different brands, we permit it to get
+	 * the data in below case.
+	 */
+	if (obj->buffer.length < sizeof(struct tlmi_pwdcfg)) {
+		pr_warn("Unknown pwdcfg buffer length %d\n", obj->buffer.length);
+		kfree(obj);
+		return -EIO;
+	}
+	memcpy(pwdcfg, obj->buffer.pointer, sizeof(struct tlmi_pwdcfg));
+	kfree(obj);
+	return 0;
+}
+
+static int tlmi_save_bios_settings(const char *password)
+{
+	return tlmi_simple_call(LENOVO_SAVE_BIOS_SETTINGS_GUID,
+				password);
+}
+
+static int tlmi_setting(int item, char **value, const char *guid_string)
+{
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	int ret;
+
+	status = wmi_query_block(guid_string, item, &output);
+	if (ACPI_FAILURE(status)) {
+		kfree(output.pointer);
+		return -EIO;
+	}
+
+	ret = tlmi_extract_output_string(&output, value);
+	kfree(output.pointer);
+	return ret;
+}
+
+static int tlmi_get_bios_selections(const char *item, char **value)
+{
+	const struct acpi_buffer input = { strlen(item), (char *)item };
+	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+	int ret;
+
+	status = wmi_evaluate_method(LENOVO_GET_BIOS_SELECTIONS_GUID,
+				     0, 0, &input, &output);
+
+	if (ACPI_FAILURE(status)) {
+		kfree(output.pointer);
+		return -EIO;
+	}
+
+	ret = tlmi_extract_output_string(&output, value);
+	kfree(output.pointer);
+	return ret;
+}
+
+/* ---- Authentication sysfs --------------------------------------------------------- */
+static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
+					  char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->valid);
+}
+
+static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
+
+static ssize_t current_password_store(struct kobject *kobj,
+				      struct kobj_attribute *attr,
+				      const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	size_t pwdlen;
+	char *p;
+
+	pwdlen = strlen(buf);
+	/* pwdlen == 0 is allowed to clear the password */
+	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))
+		return -EINVAL;
+
+	strscpy(setting->password, buf, setting->maxlen);
+	/* Strip out CR if one is present, setting password won't work if it is present */
+	p = strchrnul(setting->password, '\n');
+	*p = '\0';
+	return count;
+}
+
+static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
+
+static ssize_t new_password_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	char *auth_str, *new_pwd, *p;
+	size_t pwdlen;
+	int ret;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+
+	if (!tlmi_priv.can_set_bios_password)
+		return -EOPNOTSUPP;
+
+	new_pwd = kstrdup(buf, GFP_KERNEL);
+	if (!new_pwd)
+		return -ENOMEM;
+
+	/* Strip out CR if one is present, setting password won't work if it is present */
+	p = strchrnul(new_pwd, '\n');
+	*p = '\0';
+
+	pwdlen = strlen(new_pwd);
+	/* pwdlen == 0 is allowed to clear the password */
+	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen))) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
+	auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",
+		 setting->pwd_type, setting->password, new_pwd,
+		 encoding_options[setting->encoding], setting->kbdlang);
+	if (!auth_str) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
+	kfree(auth_str);
+out:
+	kfree(new_pwd);
+	return ret ?: count;
+}
+
+static struct kobj_attribute auth_new_password = __ATTR_WO(new_password);
+
+static ssize_t min_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->minlen);
+}
+
+static struct kobj_attribute auth_min_pass_length = __ATTR_RO(min_password_length);
+
+static ssize_t max_password_length_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%d\n", setting->maxlen);
+}
+static struct kobj_attribute auth_max_pass_length = __ATTR_RO(max_password_length);
+
+static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "password\n");
+}
+static struct kobj_attribute auth_mechanism = __ATTR_RO(mechanism);
+
+static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", encoding_options[setting->encoding]);
+}
+
+static ssize_t encoding_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	int i;
+
+	/* Scan for a matching profile */
+	i = sysfs_match_string(encoding_options, buf);
+	if (i < 0)
+		return -EINVAL;
+
+	setting->encoding = i;
+	return count;
+}
+
+static struct kobj_attribute auth_encoding = __ATTR_RW(encoding);
+
+static ssize_t kbdlang_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->kbdlang);
+}
+
+static ssize_t kbdlang_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+	int length;
+
+	length = strlen(buf);
+	if (buf[length-1] == '\n')
+		length--;
+
+	if (!length || (length >= TLMI_LANG_MAXLEN))
+		return -EINVAL;
+
+	memcpy(setting->kbdlang, buf, length);
+	setting->kbdlang[length] = '\0';
+	return count;
+}
+
+static struct kobj_attribute auth_kbdlang = __ATTR_RW(kbdlang);
+
+static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->role);
+}
+static struct kobj_attribute auth_role = __ATTR_RO(role);
+
+static struct attribute *auth_attrs[] = {
+	&auth_is_pass_set.attr,
+	&auth_min_pass_length.attr,
+	&auth_max_pass_length.attr,
+	&auth_current_password.attr,
+	&auth_new_password.attr,
+	&auth_role.attr,
+	&auth_mechanism.attr,
+	&auth_encoding.attr,
+	&auth_kbdlang.attr,
+	NULL
+};
+
+static const struct attribute_group auth_attr_group = {
+	.attrs = auth_attrs,
+};
+
+/* ---- Attributes sysfs --------------------------------------------------------- */
+static ssize_t display_name_show(struct kobject *kobj, struct kobj_attribute *attr,
+		char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	return sysfs_emit(buf, "%s\n", setting->display_name);
+}
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+	char *item;
+	int ret;
+
+	ret = tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID);
+	if (ret)
+		return ret;
+
+	ret = sysfs_emit(buf, "%s\n", item);
+	kfree(item);
+	return ret;
+}
+
+static ssize_t possible_values_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	if (!tlmi_priv.can_get_bios_selections)
+		return -EOPNOTSUPP;
+
+	return sysfs_emit(buf, "%s\n", setting->possible_values);
+}
+
+static ssize_t current_value_store(struct kobject *kobj,
+		struct kobj_attribute *attr,
+		const char *buf, size_t count)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+	char *set_str = NULL, *new_setting = NULL;
+	char *auth_str = NULL;
+	char *p;
+	int ret;
+
+	if (!tlmi_priv.can_set_bios_settings)
+		return -EOPNOTSUPP;
+
+	new_setting = kstrdup(buf, GFP_KERNEL);
+	if (!new_setting)
+		return -ENOMEM;
+
+	/* Strip out CR if one is present */
+	p = strchrnul(new_setting, '\n');
+	*p = '\0';
+
+	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
+		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
+				tlmi_priv.pwd_admin->password,
+				encoding_options[tlmi_priv.pwd_admin->encoding],
+				tlmi_priv.pwd_admin->kbdlang);
+		if (!auth_str) {
+			ret = -ENOMEM;
+			goto out;
+		}
+	}
+
+	if (auth_str)
+		set_str = kasprintf(GFP_KERNEL, "%s,%s,%s", setting->display_name,
+				new_setting, auth_str);
+	else
+		set_str = kasprintf(GFP_KERNEL, "%s,%s;", setting->display_name,
+				new_setting);
+	if (!set_str) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	ret = tlmi_simple_call(LENOVO_SET_BIOS_SETTINGS_GUID, set_str);
+	if (ret)
+		goto out;
+
+	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
+		ret = tlmi_save_bios_settings(auth_str);
+	else
+		ret = tlmi_save_bios_settings("");
+
+out:
+	kfree(auth_str);
+	kfree(set_str);
+	kfree(new_setting);
+	return ret ?: count;
+}
+
+static struct kobj_attribute attr_displ_name = __ATTR_RO(display_name);
+
+static struct kobj_attribute attr_possible_values = __ATTR_RO(possible_values);
+
+static struct kobj_attribute attr_current_val = __ATTR_RW_MODE(current_value, 0600);
+
+static struct attribute *tlmi_attrs[] = {
+	&attr_displ_name.attr,
+	&attr_current_val.attr,
+	&attr_possible_values.attr,
+	NULL
+};
+
+static const struct attribute_group tlmi_attr_group = {
+	.attrs = tlmi_attrs,
+};
+
+static ssize_t tlmi_attr_show(struct kobject *kobj, struct attribute *attr,
+				    char *buf)
+{
+	struct kobj_attribute *kattr;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->show)
+		return kattr->show(kobj, kattr, buf);
+	return -EIO;
+}
+
+static ssize_t tlmi_attr_store(struct kobject *kobj, struct attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct kobj_attribute *kattr;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->store)
+		return kattr->store(kobj, kattr, buf, count);
+	return -EIO;
+}
+
+static const struct sysfs_ops tlmi_kobj_sysfs_ops = {
+	.show	= tlmi_attr_show,
+	.store	= tlmi_attr_store,
+};
+
+static void tlmi_attr_setting_release(struct kobject *kobj)
+{
+	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
+
+	kfree(setting);
+}
+
+static void tlmi_pwd_setting_release(struct kobject *kobj)
+{
+	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
+
+	kfree(setting);
+}
+
+static struct kobj_type tlmi_attr_setting_ktype = {
+	.release        = &tlmi_attr_setting_release,
+	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
+};
+
+static struct kobj_type tlmi_pwd_setting_ktype = {
+	.release        = &tlmi_pwd_setting_release,
+	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
+};
+
+/* ---- Initialisation --------------------------------------------------------- */
+static void tlmi_release_attr(void)
+{
+	int i;
+
+	/* Attribute structures */
+	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
+		if (tlmi_priv.setting[i]) {
+			kfree(tlmi_priv.setting[i]->possible_values);
+			sysfs_remove_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
+			kobject_put(&tlmi_priv.setting[i]->kobj);
+		}
+	}
+	kset_unregister(tlmi_priv.attribute_kset);
+
+	/* Authentication structures */
+	sysfs_remove_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
+	kobject_put(&tlmi_priv.pwd_admin->kobj);
+	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
+	kobject_put(&tlmi_priv.pwd_power->kobj);
+	kset_unregister(tlmi_priv.authentication_kset);
+}
+
+static int tlmi_sysfs_init(void)
+{
+	int i, ret;
+
+	ret = fw_attributes_class_get(&fw_attr_class);
+	if (ret)
+		return ret;
+
+	tlmi_priv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
+			NULL, "%s", "thinklmi");
+	if (IS_ERR(tlmi_priv.class_dev)) {
+		ret = PTR_ERR(tlmi_priv.class_dev);
+		goto fail_class_created;
+	}
+
+	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
+			&tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.attribute_kset) {
+		ret = -ENOMEM;
+		goto fail_device_created;
+	}
+
+	for (i = 0; i < TLMI_SETTINGS_COUNT; i++) {
+		/* Check if index is a valid setting - skip if it isn't */
+		if (!tlmi_priv.setting[i])
+			continue;
+
+		/* Build attribute */
+		tlmi_priv.setting[i]->kobj.kset = tlmi_priv.attribute_kset;
+		ret = kobject_init_and_add(&tlmi_priv.setting[i]->kobj, &tlmi_attr_setting_ktype,
+				NULL, "%s", tlmi_priv.setting[i]->display_name);
+		if (ret)
+			goto fail_create_attr;
+
+		ret = sysfs_create_group(&tlmi_priv.setting[i]->kobj, &tlmi_attr_group);
+		if (ret)
+			goto fail_create_attr;
+	}
+
+	/* Create authentication entries */
+	tlmi_priv.authentication_kset = kset_create_and_add("authentication", NULL,
+								&tlmi_priv.class_dev->kobj);
+	if (!tlmi_priv.authentication_kset) {
+		ret = -ENOMEM;
+		goto fail_create_attr;
+	}
+	tlmi_priv.pwd_admin->kobj.kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(&tlmi_priv.pwd_admin->kobj, &tlmi_pwd_setting_ktype,
+			NULL, "%s", "Admin");
+	if (ret)
+		goto fail_create_attr;
+
+	ret = sysfs_create_group(&tlmi_priv.pwd_admin->kobj, &auth_attr_group);
+	if (ret)
+		goto fail_create_attr;
+
+	tlmi_priv.pwd_power->kobj.kset = tlmi_priv.authentication_kset;
+	ret = kobject_init_and_add(&tlmi_priv.pwd_power->kobj, &tlmi_pwd_setting_ktype,
+			NULL, "%s", "System");
+	if (ret)
+		goto fail_create_attr;
+
+	ret = sysfs_create_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
+	if (ret)
+		goto fail_create_attr;
+
+	return ret;
+
+fail_create_attr:
+	tlmi_release_attr();
+fail_device_created:
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+fail_class_created:
+	fw_attributes_class_put();
+	return ret;
+}
+
+/* ---- Base Driver -------------------------------------------------------- */
+static int tlmi_analyze(void)
+{
+	struct tlmi_pwdcfg pwdcfg;
+	acpi_status status;
+	int i, ret;
+
+	if (wmi_has_guid(LENOVO_SET_BIOS_SETTINGS_GUID) &&
+	    wmi_has_guid(LENOVO_SAVE_BIOS_SETTINGS_GUID))
+		tlmi_priv.can_set_bios_settings = true;
+
+	if (wmi_has_guid(LENOVO_GET_BIOS_SELECTIONS_GUID))
+		tlmi_priv.can_get_bios_selections = true;
+
+	if (wmi_has_guid(LENOVO_SET_BIOS_PASSWORD_GUID))
+		tlmi_priv.can_set_bios_password = true;
+
+	if (wmi_has_guid(LENOVO_BIOS_PASSWORD_SETTINGS_GUID))
+		tlmi_priv.can_get_password_settings = true;
+
+	/*
+	 * Try to find the number of valid settings of this machine
+	 * and use it to create sysfs attributes.
+	 */
+	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i) {
+		struct tlmi_attr_setting *setting;
+		char *item = NULL;
+		char *p;
+
+		tlmi_priv.setting[i] = NULL;
+		status = tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
+		if (ACPI_FAILURE(status))
+			break;
+		if (!item)
+			break;
+		if (!*item)
+			continue;
+
+		/* It is not allowed to have '/' for file name. Convert it into '\'. */
+		strreplace(item, '/', '\\');
+
+		/* Remove the value part */
+		p = strchrnul(item, ',');
+		*p = '\0';
+
+		/* Create a setting entry */
+		setting = kzalloc(sizeof(*setting), GFP_KERNEL);
+		if (!setting) {
+			ret = -ENOMEM;
+			goto fail_clear_attr;
+		}
+		setting->index = i;
+		strscpy(setting->display_name, item, TLMI_SETTINGS_MAXLEN);
+		/* If BIOS selections supported, load those */
+		if (tlmi_priv.can_get_bios_selections) {
+			ret = tlmi_get_bios_selections(setting->display_name,
+					&setting->possible_values);
+			if (ret || !setting->possible_values)
+				pr_info("Error retrieving possible values for %d : %s\n",
+						i, setting->display_name);
+		}
+		tlmi_priv.setting[i] = setting;
+		tlmi_priv.settings_count++;
+		kfree(item);
+	}
+
+	/* Create password setting structure */
+	ret = tlmi_get_pwd_settings(&pwdcfg);
+	if (ret)
+		goto fail_clear_attr;
+
+	tlmi_priv.pwd_admin = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	if (!tlmi_priv.pwd_admin) {
+		ret = -ENOMEM;
+		goto fail_clear_attr;
+	}
+	strscpy(tlmi_priv.pwd_admin->display_name, "admin", TLMI_PWDTYPE_MAXLEN);
+	strscpy(tlmi_priv.pwd_admin->kbdlang, "us", TLMI_LANG_MAXLEN);
+	tlmi_priv.pwd_admin->encoding = TLMI_ENCODING_ASCII;
+	tlmi_priv.pwd_admin->pwd_type = "pap";
+	tlmi_priv.pwd_admin->role = "bios-admin";
+	tlmi_priv.pwd_admin->minlen = pwdcfg.min_length;
+	if (WARN_ON(pwdcfg.max_length >= TLMI_PWD_BUFSIZE))
+		pwdcfg.max_length = TLMI_PWD_BUFSIZE - 1;
+	tlmi_priv.pwd_admin->maxlen = pwdcfg.max_length;
+	if (pwdcfg.password_state & TLMI_PAP_PWD)
+		tlmi_priv.pwd_admin->valid = true;
+
+	tlmi_priv.pwd_power = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	if (!tlmi_priv.pwd_power) {
+		ret = -ENOMEM;
+		goto fail_clear_attr;
+	}
+	strscpy(tlmi_priv.pwd_power->display_name, "power-on", TLMI_PWDTYPE_MAXLEN);
+	strscpy(tlmi_priv.pwd_power->kbdlang, "us", TLMI_LANG_MAXLEN);
+	tlmi_priv.pwd_power->encoding = TLMI_ENCODING_ASCII;
+	tlmi_priv.pwd_power->pwd_type = "pop";
+	tlmi_priv.pwd_power->role = "power-on";
+	tlmi_priv.pwd_power->minlen = pwdcfg.min_length;
+	tlmi_priv.pwd_power->maxlen = pwdcfg.max_length;
+
+	if (pwdcfg.password_state & TLMI_POP_PWD)
+		tlmi_priv.pwd_power->valid = true;
+
+	return 0;
+
+fail_clear_attr:
+	for (i = 0; i < TLMI_SETTINGS_COUNT; ++i)
+		kfree(tlmi_priv.setting[i]);
+	return ret;
+}
+
+static void tlmi_remove(struct wmi_device *wdev)
+{
+	tlmi_release_attr();
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+	fw_attributes_class_put();
+}
+
+static int tlmi_probe(struct wmi_device *wdev, const void *context)
+{
+	tlmi_analyze();
+	return tlmi_sysfs_init();
+}
+
+static const struct wmi_device_id tlmi_id_table[] = {
+	{ .guid_string = LENOVO_BIOS_SETTING_GUID },
+	{ }
+};
+
+static struct wmi_driver tlmi_driver = {
+	.driver = {
+		.name = "think-lmi",
+	},
+	.id_table = tlmi_id_table,
+	.probe = tlmi_probe,
+	.remove = tlmi_remove,
+};
+
+MODULE_AUTHOR("Sugumaran L <slacshiminar@lenovo.com>");
+MODULE_AUTHOR("Mark Pearson <markpearson@lenovo.com>");
+MODULE_AUTHOR("Corentin Chary <corentin.chary@gmail.com>");
+MODULE_DESCRIPTION("ThinkLMI Driver");
+MODULE_LICENSE("GPL");
+
+module_wmi_driver(tlmi_driver);
diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
new file mode 100644
index 000000000..6cd5325cc
--- /dev/null
+++ b/drivers/platform/x86/think-lmi.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _THINK_LMI_H_
+#define _THINK_LMI_H_
+
+#include <linux/types.h>
+
+#define TLMI_SETTINGS_COUNT  256
+#define TLMI_SETTINGS_MAXLEN 512
+#define TLMI_PWD_BUFSIZE     129
+#define TLMI_PWDTYPE_MAXLEN   64
+#define TLMI_ENC_MAXLEN       64
+#define TLMI_LANG_MAXLEN       4
+#define TLMI_PWDTYPE_LEN       4
+/*
+ * Longest string should be in the set command: allow size of BIOS
+ * option and choice
+ */
+#define TLMI_GETSET_MAXLEN (TLMI_SETTINGS_MAXLEN + TLMI_SETTINGS_MAXLEN)
+
+/* Possible error values */
+struct tlmi_err_codes {
+	const char *err_str;
+	int err_code;
+};
+
+enum encoding_option {
+	TLMI_ENCODING_ASCII,
+	TLMI_ENCODING_SCANCODE,
+};
+
+/* password configuration details */
+struct tlmi_pwdcfg {
+	uint32_t password_mode;
+	uint32_t password_state;
+	uint32_t min_length;
+	uint32_t max_length;
+	uint32_t supported_encodings;
+	uint32_t supported_keyboard;
+};
+
+/* password setting details */
+struct tlmi_pwd_setting {
+	struct kobject kobj;
+	bool valid;
+	char display_name[TLMI_PWDTYPE_MAXLEN];
+	char password[TLMI_PWD_BUFSIZE];
+	const char *pwd_type;
+	const char *role;
+	int minlen;
+	int maxlen;
+	enum encoding_option encoding;
+	char kbdlang[TLMI_LANG_MAXLEN];
+};
+
+/* Attribute setting details */
+struct tlmi_attr_setting {
+	struct kobject kobj;
+	int index;
+	char display_name[TLMI_SETTINGS_MAXLEN];
+	char *possible_values;
+};
+
+struct think_lmi {
+	struct wmi_device *wmi_device;
+
+	int settings_count;
+	bool can_set_bios_settings;
+	bool can_get_bios_selections;
+	bool can_set_bios_password;
+	bool can_get_password_settings;
+
+	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
+	struct device *class_dev;
+	struct kset *attribute_kset;
+	struct kset *authentication_kset;
+	struct tlmi_pwd_setting *pwd_admin;
+	struct tlmi_pwd_setting *pwd_power;
+};
+
+#endif /* !_THINK_LMI_H_ */
-- 
2.31.1

