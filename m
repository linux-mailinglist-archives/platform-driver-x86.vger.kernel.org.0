Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C52B26D407
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Sep 2020 08:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726153AbgIQG53 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 17 Sep 2020 02:57:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgIQG53 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 02:57:29 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F17CEC06174A;
        Wed, 16 Sep 2020 23:57:28 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id y6so612612plt.9;
        Wed, 16 Sep 2020 23:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jg19jCAhKeKxWJ00lYzBYp7Vg8YEvbHmjVUPRl4Nk2w=;
        b=ryca5ZkbT7PsGMSex1D0lCBr07XaQYBzxM7BbpaMr/7iAAWdtRq5Fu/3+qjbOb+6DP
         spDYuzyVqrbPK6+oEUtTssMltSS3ktZyCWRmbeg4zA/ikUBmIY35XRbFYT0S0qApl5A9
         VFEHfcUvvF9vn3YSSbO7OIi1kky9EX28O+B+HfAodp3khf91GfQhSD7V8tYSIVAerDF4
         EsWydmRTgEvYzNEzZsPE9jAUaewWx3fTjjKj3dAWfz61PDblGgfqbT+p0RYZou8em4hJ
         xC9brD7e0yt/LIzzC3Fvtg/afFKk1SMkl6ErahXq8JeZX/emal/rMjXzjycIFQHk+BX9
         WrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Jg19jCAhKeKxWJ00lYzBYp7Vg8YEvbHmjVUPRl4Nk2w=;
        b=lxGGSoyulqsNNp4V2B6rXECaaauUgtwaYanLe29Jr9AWbeHktazdB7tqFa7OUbCiTl
         KUM7NNcLL6vrB15YQeN/TOnLT8XcjLL3jeBRfoPsDETYozHmaFaD3rqNXAmZKOFSmW4P
         M+Wq+se3mOdQXkVk7XzV/XWSnBYVPR3m2lrctd1zl5GnMA52HoxDSa6m1BarkzqfLnum
         Q9BsT5lcx4rz+4+fhg3OE+U84VVa+2gu7OL0CDdRfkzZybl588jI5gADibaWHvLUk7UE
         cZK8KsqM9q5ZjwrlVc1cxYdM2Yv+NRuqElIMds8PCBE8GCNHH14oka7zIpp5QyjLXQAc
         tNqA==
X-Gm-Message-State: AOAM5300TAtrWz1lRJ1CiS1qltd58+XenPb8cvCN39Z5Ys3lm07a2m0n
        POx3OwS1XwKFrvQ2gE7XfgJgxGyDvCS8Gg==
X-Google-Smtp-Source: ABdhPJw2lWjOzjSmzQBrdE1aMg2FuSp8Aq2HxdQvYTl4QETKlHdKJYac+/JWJmCnvF4q44MVZMOC1w==
X-Received: by 2002:a17:90a:cc17:: with SMTP id b23mr7301920pju.32.1600325847919;
        Wed, 16 Sep 2020 23:57:27 -0700 (PDT)
Received: from localhost.localdomain ([122.172.59.50])
        by smtp.gmail.com with ESMTPSA id n2sm19266085pfe.208.2020.09.16.23.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 23:57:26 -0700 (PDT)
From:   Divya Bharathi <divya27392@gmail.com>
X-Google-Original-From: Divya Bharathi <divya_bharathi@dell.com>
To:     dvhart@infradead.org
Cc:     LKML <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Divya Bharathi <divya_bharathi@dell.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        mark gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Prasanth KSR <prasanth.ksr@dell.com>
Subject: [PATCH v3] Introduce support for Systems Management Driver over WMI for Dell Systems
Date:   Thu, 17 Sep 2020 12:25:50 +0530
Message-Id: <20200917065550.127400-1-divya_bharathi@dell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Dell WMI Systems Management Driver provides a sysfs
interface for systems management to enable BIOS configuration
capability on certain Dell Systems.

This driver allows user to configure Dell systems with a
uniform common interface. To facilitate this, the patch
introduces a generic way for driver to be able to create
configurable BIOS Attributes available in Setup (F2) screen.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: mark gross <mgross@linux.intel.com>

Co-developed-by: Mario Limonciello <mario.limonciello@dell.com>
Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
Co-developed-by: Prasanth KSR <prasanth.ksr@dell.com>
Signed-off-by: Prasanth KSR <prasanth.ksr@dell.com>
Signed-off-by: Divya Bharathi <divya_bharathi@dell.com>
---

Changes from v2 to v3:
 - Fix a possible NULL pointer error in init
 - Add missing newlines to all dev_err/dev_dbg/pr_err/pr_debug statements
 - Correct updating passwords when both Admin and System password are set
 - Correct the WMI driver name
 - Correct some namespace clashing when compiled into the kernel (Reported by Mark Gross)
 - Correct some comment typos
 - Adopt suggestions made by Hans:
   + Use single global mutex
   + Clarify reason for uevents with a comment
   + Remove functions for set and get current password
   + Rename lower_bound to min_value and upper_bound to max_value
   + Rename possible_value to possible_values
   + Remove references to float
   + Build a separate passwords directory again since it behaves differently from the other
     attributes
   + Move more calls from pr_err -> dev_err
 - Documentation cleanups (see v2 patch feedback)
   + Grouping types
   + Syntax of `modifier` output

Changes from v1 to v2:
 - use pr_fmt instead of pr_err(DRIVER_NAME
 - re-order variables reverse xmas tree order
 - correct returns of -1 to error codes
 - correct usage of {} on some split line statements
 - Refine all documentation deficiencies suggested by Hans
 - Merge all attributes to a single directory
 - Overhaul WMI interface interaction as suggested by Hans
   * Move WMI driver registration to start of module
   * Remove usage of lists that only use first entry for WMI interfaces
   * Create a global structure shared across interface source files
   * Make get_current_password function static
   * Remove get_pending changes function, shared across global structure now.
- Overhaul use of mutexes
   * Make kset list mutex shared across source files
   * Remove unneeded dell-wmi-sysman call_mutex
   * Keep remaining call_mutexes in WMI functions
- Move security area calculation into a function
- Use NLS helper for utf8->utf16 conversion

 .../testing/sysfs-platform-dell-wmi-sysman    | 175 ++++++
 MAINTAINERS                                   |   9 +
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   8 +
 .../x86/dell-wmi-biosattr-interface.c         | 197 ++++++
 .../platform/x86/dell-wmi-enum-attributes.c   | 208 +++++++
 .../platform/x86/dell-wmi-int-attributes.c    | 189 ++++++
 .../x86/dell-wmi-passobj-attributes.c         | 165 +++++
 .../x86/dell-wmi-passwordattr-interface.c     | 167 +++++
 .../platform/x86/dell-wmi-string-attributes.c | 171 +++++
 .../platform/x86/dell-wmi-sysman-attributes.c | 589 ++++++++++++++++++
 .../platform/x86/dell-wmi-sysman-attributes.h | 137 ++++
 12 files changed, 2027 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-wmi-sysman
 create mode 100644 drivers/platform/x86/dell-wmi-biosattr-interface.c
 create mode 100644 drivers/platform/x86/dell-wmi-enum-attributes.c
 create mode 100644 drivers/platform/x86/dell-wmi-int-attributes.c
 create mode 100644 drivers/platform/x86/dell-wmi-passobj-attributes.c
 create mode 100644 drivers/platform/x86/dell-wmi-passwordattr-interface.c
 create mode 100644 drivers/platform/x86/dell-wmi-string-attributes.c
 create mode 100644 drivers/platform/x86/dell-wmi-sysman-attributes.c
 create mode 100644 drivers/platform/x86/dell-wmi-sysman-attributes.h

diff --git a/Documentation/ABI/testing/sysfs-platform-dell-wmi-sysman b/Documentation/ABI/testing/sysfs-platform-dell-wmi-sysman
new file mode 100644
index 000000000000..03398ac11121
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-platform-dell-wmi-sysman
@@ -0,0 +1,175 @@
+What:		/sys/devices/platform/dell-wmi-sysman/attributes/
+Date:		December 2020
+KernelVersion:	5.10
+Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
+		Mario Limonciello <mario.limonciello@dell.com>,
+		Prasanth KSR <prasanth.ksr@dell.com>
+Description:
+		The Dell WMI Systems Management Driver provides a sysfs interface
+		for systems management software to enable BIOS configuration
+		capability on certain Dell systems. This directory exposes
+		interfaces for interacting with BIOS attributes.
+
+		Attributes can accept a set of pre-defined valid values (enumeration)
+		or a range of numerical values (integer) or a string.
+
+		current_value:	A file that can be read to obtain the current
+		value of the <attr>
+
+		This file can also be written to in order to update
+		the value of a <attr>
+
+		default_value:	A file that can be read to obtain the default
+		value of the <attr>
+
+		display_name:	A file that can be read to obtain a user friendly
+		description of the at <attr>
+
+		display_name_language_code:	A file that can be read to obtain
+		the IETF language tag corresponding to the "display_name" of the <attr>
+
+		modifier:	A file that can be read to obtain attribute-level
+		dependency rule. It says an attribute X will become read-only or
+		suppressed, if/if-not attribute Y is configured.
+
+		modifier rules can be in following format,
+		[ReadOnlyIf:<attribute>=<value>]
+		[ReadOnlyIfNot:<attribute>=<value>]
+		[SuppressIf:<attribute>=<value>]
+		[SuppressIfNot:<attribute>=<value>]
+
+		For example,
+		AutoOnFri/modifier has value,
+			[SuppressIfNot:AutoOn=SelectDays]
+		This means AutoOnFri will be supressed in BIOS setup if AutoOn
+		attribute is not "SelectDays" and its value will not be effective
+		through sysfs until this rule is met.
+
+		"enumeration"-type specific properties:
+
+		possible_values:	A file that can be read to obtain the possible
+		values of the <attr>. Values are separated using semi-colon.
+
+		value_modifier:	A file that can be read to obtain value-level
+		dependency. This file is similar to modifier but here, an attribute's
+		current value will be forcefully changed based dependent attributes
+		value.
+
+		value_modifier rules can be in following format,
+		<value>[ForceIf:<attribute>=<value>]
+		<value>[ForceIfNot:<attribute>=<value>]
+
+		For example,
+		LegacyOrom/value_modifier has value,
+			Disabled[ForceIf:SecureBoot=Enabled]
+		This means LegacyOrom's current value will be forced to "Disabled"
+		in BIOS setup if SecureBoot is Enabled and its value will not be
+		effective through sysfs until this rule is met.
+
+		"integer"-type specific properties:
+
+		min_value:	A file that can be read to obtain the lower
+		bound value of the <attr>
+
+		max_value:	A file that can be read to obtain the upper
+		bound value of the <attr>
+
+		scalar_increment:	A file that can be read to obtain the
+		resolution of the incremental value this attribute accepts.
+
+		"string"-type specific properties:
+
+		max_length:	A file that can be read to obtain the maximum
+		length value of the <attr>
+
+		min_length:	A file that can be read to obtain the minimum
+		length value of the <attr>
+
+What:		/sys/devices/platform/dell-wmi-sysman/passwords/
+Date:		December 2020
+KernelVersion:	5.10
+Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
+		Mario Limonciello <mario.limonciello@dell.com>,
+		Prasanth KSR <prasanth.ksr@dell.com>
+
+		A BIOS Admin password and System Password can be set, reset or
+		cleared using these attributes. An "Admin" password is used for
+		preventing modification to the BIOS settings. A "System" password is
+		required to boot a machine.
+
+		is_password_set:	A file that can be read
+		to obtain flag to see if a password is set on <attr>
+
+		max_password_length:	A file that can be read to obtain the
+		maximum length of the Password
+
+		min_password_length:	A file that can be read to obtain the
+		minimum length of the Password
+
+		current_password: A write only value used for privileged access
+		such as setting attributes when a system or admin password is set
+		or resetting to a new password
+
+		new_password: A write only value that when used in tandem with
+		current_password will reset a system or admin password.
+
+		Note, password management is session specific. If Admin/System
+		password is set, same password must be writen into current_password
+		file (requied for pasword-validation) and must be cleared once the
+		session	is over. For example,
+			echo "password" > current_password
+			echo "disabled" > TouchScreen/current_value
+			echo "" > current_password
+
+
+What:		/sys/devices/platform/dell-wmi-sysman/attributes/reset_bios
+Date:		December 2020
+KernelVersion:	5.10
+Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
+		Mario Limonciello <mario.limonciello@dell.com>,
+		Prasanth KSR <prasanth.ksr@dell.com>
+Description:
+		This attribute can be used to reset the BIOS Configuration.
+		Specifically, it tells which type of reset BIOS configuration is being
+		requested on the host.
+
+		Reading from it returns a list of supported options encoded as:
+
+			'builtinsafe' (Built in safe configuration profile)
+			'lastknowngood' (Last known good saved configuration profile)
+			'factory' (Default factory settings configuration profile)
+			'custom' (Custom saved configuration profile)
+
+		The currently selected option is printed in square brackets as
+		shown below:
+
+		# echo "factory" > sys/devices/platform/dell-wmi-sysman/attributes/reset_bios
+
+		# cat sys/devices/platform/dell-wmi-sysman/attributes/reset_bios
+		# builtinsafe lastknowngood [factory] custom
+
+		Note that any changes to this attribute requires a reboot
+		for changes to take effect.
+
+What:		/sys/devices/platform/dell-wmi-sysman/attributes/pending_reboot
+Date:		December 2020
+KernelVersion:	5.10
+Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
+		Mario Limonciello <mario.limonciello@dell.com>,
+		Prasanth KSR <prasanth.ksr@dell.com>
+Description:
+		A read-only attribute reads 1 if a reboot is necessary to apply
+		pending BIOS attribute changes.
+
+			0:	All BIOS attributes setting are current
+			1:	A reboot is necessary to get pending BIOS attribute changes
+				applied
+
+
+		Note, userspace applications need to follow below steps for efficient
+		BIOS management,
+		1.	Check if admin password is set. If yes, follow session method for
+			password management as briefed under password section above.
+		2.	Before setting any attribute, check if it has any modifiers
+			or value_modifiers. If yes, incorporate them and then modify
+			attribute.
diff --git a/MAINTAINERS b/MAINTAINERS
index d746519253c3..7f46d381d759 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4957,6 +4957,15 @@ M:	Mario Limonciello <mario.limonciello@dell.com>
 S:	Maintained
 F:	drivers/platform/x86/dell-wmi-descriptor.c
 
+DELL WMI SYSMAN DRIVER
+M:	Divya Bharathi <divya.bharathi@dell.com>
+M:	Mario Limonciello <mario.limonciello@dell.com>
+M:	Prasanth Ksr <prasanth.ksr@dell.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	drivers/platform/x86/dell-wmi-*-attributes.*
+F:	drivers/platform/x86/dell-wmi-*-interface.c
+
 DELL WMI NOTIFICATIONS DRIVER
 M:	Matthew Garrett <mjg59@srcf.ucam.org>
 M:	Pali Rohár <pali@kernel.org>
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 40219bba6801..4fd7a3f0a904 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -430,6 +430,18 @@ config DELL_WMI
 	  To compile this driver as a module, choose M here: the module will
 	  be called dell-wmi.
 
+config DELL_WMI_SYSMAN
+	tristate "Dell WMI Systems management WMI driver"
+	depends on ACPI_WMI
+	depends on DMI
+	select NLS
+	help
+	  This driver allows changing BIOS settings on many Dell machines from
+	  2018 and newer without the use of any additional software.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called dell-wmi-sysman.
+
 config DELL_WMI_DESCRIPTOR
 	tristate
 	depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 5f823f7eff45..dc2ccb574192 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -47,6 +47,14 @@ obj-$(CONFIG_DELL_WMI)			+= dell-wmi.o
 obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
 obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
 obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
+obj-$(CONFIG_DELL_WMI_SYSMAN)  += dell-wmi-sysman.o
+dell-wmi-sysman-objs := dell-wmi-sysman-attributes.o \
+				 dell-wmi-enum-attributes.o \
+				 dell-wmi-int-attributes.o \
+				 dell-wmi-string-attributes.o \
+				 dell-wmi-passobj-attributes.o \
+				 dell-wmi-passwordattr-interface.o \
+				 dell-wmi-biosattr-interface.o
 
 # Fujitsu
 obj-$(CONFIG_AMILO_RFKILL)	+= amilo-rfkill.o
diff --git a/drivers/platform/x86/dell-wmi-biosattr-interface.c b/drivers/platform/x86/dell-wmi-biosattr-interface.c
new file mode 100644
index 000000000000..6fd79c181ee6
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-biosattr-interface.c
@@ -0,0 +1,197 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to SET methods under BIOS attributes interface GUID for use
+ * with dell-wmi-sysman
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#include <linux/nls.h>
+#include <linux/wmi.h>
+#include "dell-wmi-sysman-attributes.h"
+
+#define SETDEFAULTVALUES_METHOD_ID					0x02
+#define SETBIOSDEFAULTS_METHOD_ID					0x03
+#define SETATTRIBUTE_METHOD_ID						0x04
+
+static int call_biosattributes_interface(struct wmi_device *wdev, char *in_args, size_t size,
+					int method_id)
+{
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	acpi_status status;
+	int ret = -EIO;
+
+	input.length =  (acpi_size) size;
+	input.pointer = in_args;
+	status = wmidev_evaluate_method(wdev, 0, method_id, &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	obj = (union acpi_object *)output.pointer;
+	if (obj->type == ACPI_TYPE_INTEGER)
+		ret = obj->integer.value;
+
+	/* let userland know it may need to check reboot pending again */
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
+	kfree(output.pointer);
+	return map_wmi_error(ret);
+}
+
+/**
+ * set_attribute() - Update an attribute value
+ * @a_name: The attribute name
+ * @a_value: The attribute value
+ *
+ * Sets an attribute to new value
+ **/
+int set_attribute(const char *a_name, const char *a_value)
+{
+	size_t security_area_size, string_area_size, buffer_size;
+	char *attribute_name, *attribute_value;
+	u8 *name_len, *value_len;
+	char *buffer = NULL;
+	int ret;
+
+	mutex_lock(&wmi_priv.mutex);
+	if (!wmi_priv.bios_attr_wdev) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	/* build/calculate buffer */
+	security_area_size = calculate_security_buffer();
+	string_area_size = (strlen(a_name) + strlen(a_value))*2;
+	buffer_size = security_area_size + string_area_size + sizeof(u16) * 2;
+	buffer = kzalloc(buffer_size, GFP_KERNEL);
+	if (!buffer) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* build security area */
+	if (strlen(wmi_priv.current_admin_password) > 0)
+		populate_security_buffer(buffer, wmi_priv.current_admin_password);
+
+	/* build variables to set */
+	name_len = buffer + security_area_size;
+	attribute_name = name_len + sizeof(u16);
+	*name_len = utf8s_to_utf16s(a_name, strlen(a_name), UTF16_HOST_ENDIAN,
+				    (wchar_t *) attribute_name, MAX_BUFF) * 2;
+	if (*name_len < 0) {
+		ret = -EINVAL;
+		dev_err(&wmi_priv.password_attr_wdev->dev, "UTF16 conversion failed\n");
+		goto out;
+	}
+
+	value_len = (u8 *) attribute_name + *name_len;
+	attribute_value = value_len + sizeof(u16);
+	*value_len = utf8s_to_utf16s(a_value, strlen(a_value), UTF16_HOST_ENDIAN,
+				    (wchar_t *) attribute_value, MAX_BUFF) * 2;
+	if (*value_len < 0) {
+		ret = -EINVAL;
+		dev_err(&wmi_priv.password_attr_wdev->dev, "UTF16 conversion failed\n");
+		goto out;
+	}
+
+	ret = call_biosattributes_interface(wmi_priv.bios_attr_wdev,
+					    buffer, buffer_size,
+					    SETATTRIBUTE_METHOD_ID);
+	if (ret == -EOPNOTSUPP)
+		dev_err(&wmi_priv.password_attr_wdev->dev, "admin password must be configured\n");
+	else if (ret == -EACCES)
+		dev_err(&wmi_priv.password_attr_wdev->dev, "invalid password\n");
+
+	wmi_priv.pending_changes = 1;
+out:
+	kfree(buffer);
+	mutex_unlock(&wmi_priv.mutex);
+
+	return ret;
+}
+
+/**
+ * set_bios_defaults() - Resets BIOS defaults
+ * @deftype: the type of BIOS value reset to issue.
+ *
+ * Resets BIOS defaults
+ **/
+int set_bios_defaults(u8 deftype)
+{
+	size_t security_area_size, buffer_size;
+	size_t integer_area_size = sizeof(u8);
+	char *buffer = NULL;
+	u8 *defaultType;
+	int ret;
+
+	mutex_lock(&wmi_priv.mutex);
+	if (!wmi_priv.bios_attr_wdev) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	security_area_size = calculate_security_buffer();
+	buffer_size = security_area_size + integer_area_size;
+	buffer = kzalloc(buffer_size, GFP_KERNEL);
+	if (!buffer)
+		return -ENOMEM;
+
+	/* build security area */
+	if (strlen(wmi_priv.current_admin_password) > 0)
+		populate_security_buffer(buffer, wmi_priv.current_admin_password);
+
+	defaultType = buffer + security_area_size;
+	*defaultType = deftype;
+
+	ret = call_biosattributes_interface(wmi_priv.bios_attr_wdev, buffer, buffer_size,
+					    SETBIOSDEFAULTS_METHOD_ID);
+	if (ret)
+		dev_err(&wmi_priv.bios_attr_wdev->dev, "reset BIOS defaults failed: %d\n", ret);
+	wmi_priv.pending_changes = 1;
+out:
+	kfree(buffer);
+	mutex_unlock(&wmi_priv.mutex);
+
+	return ret;
+}
+
+static int dell_wmi_bios_attr_set_interface_probe(struct wmi_device *wdev, const void *context)
+{
+	mutex_lock(&wmi_priv.mutex);
+	wmi_priv.bios_attr_wdev = wdev;
+	mutex_unlock(&wmi_priv.mutex);
+	return 0;
+}
+
+static int dell_wmi_bios_attr_set_interface_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&wmi_priv.mutex);
+	wmi_priv.bios_attr_wdev = NULL;
+	mutex_unlock(&wmi_priv.mutex);
+	return 0;
+}
+
+static const struct wmi_device_id dell_wmi_bios_attr_set_interface_id_table[] = {
+	{ .guid_string = DELL_WMI_BIOS_ATTRIBUTES_INTERFACE_GUID },
+	{ },
+};
+static struct wmi_driver dell_wmi_bios_attr_set_interface_driver = {
+	.driver = {
+		.name = DRIVER_NAME
+	},
+	.probe = dell_wmi_bios_attr_set_interface_probe,
+	.remove = dell_wmi_bios_attr_set_interface_remove,
+	.id_table = dell_wmi_bios_attr_set_interface_id_table,
+};
+
+int init_dell_wmi_bios_attr_set_interface(void)
+{
+	return wmi_driver_register(&dell_wmi_bios_attr_set_interface_driver);
+}
+
+void exit_dell_wmi_bios_attr_set_interface(void)
+{
+	wmi_driver_unregister(&dell_wmi_bios_attr_set_interface_driver);
+}
+
+MODULE_DEVICE_TABLE(wmi, dell_wmi_bios_attr_set_interface_id_table);
diff --git a/drivers/platform/x86/dell-wmi-enum-attributes.c b/drivers/platform/x86/dell-wmi-enum-attributes.c
new file mode 100644
index 000000000000..4598c4e27310
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-enum-attributes.c
@@ -0,0 +1,208 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to enumeration type attributes under BIOS Enumeration GUID for use
+ * with dell-wmi-sysman
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#include "dell-wmi-sysman-attributes.h"
+
+/* kept variable names same as in sysfs file name for sysfs_show macro definition */
+struct enumeration_data {
+	char display_name_language_code[MAX_BUFF];
+	char attribute_name[MAX_BUFF];
+	char display_name[MAX_BUFF];
+	char default_value[MAX_BUFF];
+	char current_value[MAX_BUFF];
+	char modifier[MAX_BUFF];
+	int value_modifier_count;
+	char value_modifier[MAX_BUFF];
+	int possible_values_count;
+	char possible_values[MAX_BUFF];
+	char type[MAX_BUFF];
+};
+
+static struct enumeration_data *enumeration_data;
+static int enumeration_instances_count;
+get_instance_id(enumeration);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+	instance_id = get_enumeration_instance_id(kobj);
+	if (instance_id >= 0) {
+		union acpi_object *obj;
+
+		/* need to use specific instance_id and guid combination to get right data */
+		obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_ENUMERATION_ATTRIBUTE_GUID);
+		if (!obj)
+			return -AE_ERROR;
+		strncpy_attr(enumeration_data[instance_id].current_value,
+		       obj->package.elements[CURRENT_VAL].string.pointer);
+		kfree(obj);
+		return sprintf(buf, "%s\n", enumeration_data[instance_id].current_value);
+	}
+	return -EIO;
+}
+
+/**
+ * validate_enumeration_input() - Validate input of current_value against possible values
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ **/
+int validate_enumeration_input(int instance_id, const char *buf)
+{
+	char *options, *tmp, *p;
+	int ret = -EINVAL;
+
+	options = tmp = kstrdup((enumeration_data[instance_id].possible_values), GFP_KERNEL);
+	if (!options)
+		return -ENOMEM;
+
+	while ((p = strsep(&options, ";")) != NULL) {
+		if (!*p)
+			continue;
+		if (!strncasecmp(p, buf, strlen(p))) {
+			ret = 0;
+			break;
+		}
+	}
+
+	kfree(tmp);
+	return ret;
+}
+
+attribute_s_property_show(display_name_language_code, enumeration);
+static struct kobj_attribute displ_langcode =
+		__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, enumeration);
+struct kobj_attribute displ_name =
+		__ATTR_RO(display_name);
+
+attribute_s_property_show(default_value, enumeration);
+struct kobj_attribute default_val =
+		__ATTR_RO(default_value);
+
+attribute_property_store(current_value, enumeration);
+struct kobj_attribute current_val =
+		__ATTR_RW(current_value);
+
+attribute_s_property_show(modifier, enumeration);
+struct kobj_attribute modifier =
+		__ATTR_RO(modifier);
+
+attribute_s_property_show(value_modifier, enumeration);
+struct kobj_attribute value_modfr =
+		__ATTR_RO(value_modifier);
+
+attribute_s_property_show(possible_values, enumeration);
+struct kobj_attribute poss_val =
+		__ATTR_RO(possible_values);
+
+attribute_s_property_show(type, enumeration);
+struct kobj_attribute type =
+		__ATTR_RO(type);
+
+static struct attribute *enumeration_attrs[] = {
+	&displ_langcode.attr,
+	&displ_name.attr,
+	&default_val.attr,
+	&current_val.attr,
+	&modifier.attr,
+	&value_modfr.attr,
+	&poss_val.attr,
+	&type.attr,
+	NULL,
+};
+
+static const struct attribute_group enumeration_attr_group = {
+	.attrs = enumeration_attrs,
+};
+
+int alloc_enum_data(void)
+{
+	int ret = 0;
+
+	enumeration_instances_count = get_instance_count(DELL_WMI_BIOS_ENUMERATION_ATTRIBUTE_GUID);
+	enumeration_data = kzalloc((sizeof(struct enumeration_data) * enumeration_instances_count),
+					GFP_KERNEL);
+	if (!enumeration_data)
+		ret = -ENOMEM;
+	return ret;
+}
+
+/**
+ * populate_enum_data() - Populate all properties of an instance under enumeration attribute
+ * @enumeration_obj: ACPI object with enumeration data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ **/
+int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+	int retval = sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
+	int i, next_obj;
+
+	if (retval)
+		goto out;
+
+	mutex_lock(&wmi_priv.mutex);
+	strncpy_attr(enumeration_data[instance_id].attribute_name,
+		enumeration_obj[ATTR_NAME].string.pointer);
+	strncpy_attr(enumeration_data[instance_id].display_name_language_code,
+		enumeration_obj[DISPL_NAME_LANG_CODE].string.pointer);
+	strncpy_attr(enumeration_data[instance_id].display_name,
+		enumeration_obj[DISPLAY_NAME].string.pointer);
+	strncpy_attr(enumeration_data[instance_id].default_value,
+		enumeration_obj[DEFAULT_VAL].string.pointer);
+	strncpy_attr(enumeration_data[instance_id].current_value,
+		enumeration_obj[CURRENT_VAL].string.pointer);
+	strncpy_attr(enumeration_data[instance_id].modifier,
+		enumeration_obj[MODIFIER].string.pointer);
+
+	next_obj = MODIFIER + 1;
+
+	enumeration_data[instance_id].value_modifier_count =
+		(uintptr_t)enumeration_obj[next_obj].string.pointer;
+
+	for (i = 0; i < enumeration_data[instance_id].value_modifier_count; i++) {
+		strcat(enumeration_data[instance_id].value_modifier,
+			enumeration_obj[++next_obj].string.pointer);
+		strcat(enumeration_data[instance_id].value_modifier, ";");
+	}
+
+	enumeration_data[instance_id].possible_values_count =
+		(uintptr_t) enumeration_obj[++next_obj].string.pointer;
+
+	for (i = 0; i < enumeration_data[instance_id].possible_values_count; i++) {
+		strcat(enumeration_data[instance_id].possible_values,
+			enumeration_obj[++next_obj].string.pointer);
+		strcat(enumeration_data[instance_id].possible_values, ";");
+	}
+	strncpy_attr(enumeration_data[instance_id].type, "enumeration");
+	mutex_unlock(&wmi_priv.mutex);
+
+out:
+	return retval;
+}
+
+/**
+ * exit_enum_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ **/
+void exit_enum_attributes(void)
+{
+	struct kobject *pos, *next;
+
+	list_for_each_entry_safe(pos, next, &wmi_priv.main_dir_kset->list, entry) {
+		/* this removes only enumeration atribute group under main_dir_kset */
+		sysfs_remove_group(pos, &enumeration_attr_group);
+	}
+	kfree(enumeration_data);
+}
diff --git a/drivers/platform/x86/dell-wmi-int-attributes.c b/drivers/platform/x86/dell-wmi-int-attributes.c
new file mode 100644
index 000000000000..66947972739c
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-int-attributes.c
@@ -0,0 +1,189 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to integer type attributes under BIOS Integer GUID for use with
+ * dell-wmi-sysman
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#include "dell-wmi-sysman-attributes.h"
+
+enum int_properties {MIN_VALUE = 6, MAX_VALUE, SCALAR_INCR};
+
+/* kept variable names same as in sysfs file name for sysfs_show macro definition */
+struct integer_data {
+	char display_name_language_code[MAX_BUFF];
+	char attribute_name[MAX_BUFF];
+	char display_name[MAX_BUFF];
+	int default_value;
+	int current_value;
+	char modifier[MAX_BUFF];
+	int min_value;
+	int max_value;
+	int scalar_increment;
+	char type[MAX_BUFF];
+};
+
+static struct integer_data *integer_data;
+static int integer_instances_count;
+get_instance_id(integer);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+	instance_id = get_integer_instance_id(kobj);
+	if (instance_id >= 0) {
+		union acpi_object *obj;
+
+		/* need to use specific instance_id and guid combination to get right data */
+		obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID);
+		if (!obj)
+			return -AE_ERROR;
+		integer_data[instance_id].current_value =
+			(uintptr_t)obj->package.elements[CURRENT_VAL].string.pointer;
+		kfree(obj);
+		return sprintf(buf, "%d\n", integer_data[instance_id].current_value);
+	}
+	return -EIO;
+}
+
+/**
+ * validate_integer_input() - Validate input of current_value against lower and upper bound
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ **/
+int validate_integer_input(int instance_id, const char *buf)
+{
+	int ret = -EINVAL;
+	int in_val;
+
+	if (kstrtoint(buf, 0, &in_val))
+		return ret;
+	if ((in_val >= integer_data[instance_id].min_value) &&
+	(in_val <= integer_data[instance_id].max_value))
+		ret = 0;
+
+	return ret;
+}
+
+attribute_s_property_show(display_name_language_code, integer);
+static struct kobj_attribute integer_displ_langcode =
+	__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, integer);
+struct kobj_attribute integer_displ_name =
+	__ATTR_RO(display_name);
+
+attribute_n_property_show(default_value, integer);
+struct kobj_attribute integer_default_val =
+	__ATTR_RO(default_value);
+
+attribute_property_store(current_value, integer);
+struct kobj_attribute integer_current_val =
+	__ATTR_RW(current_value);
+
+attribute_s_property_show(modifier, integer);
+struct kobj_attribute integer_modifier =
+	__ATTR_RO(modifier);
+
+attribute_n_property_show(min_value, integer);
+struct kobj_attribute integer_lower_bound =
+	__ATTR_RO(min_value);
+
+attribute_n_property_show(max_value, integer);
+struct kobj_attribute integer_upper_bound =
+	__ATTR_RO(max_value);
+
+attribute_n_property_show(scalar_increment, integer);
+struct kobj_attribute integer_scalar_increment =
+	__ATTR_RO(scalar_increment);
+
+attribute_s_property_show(type, integer);
+struct kobj_attribute integer_type =
+	__ATTR_RO(type);
+
+static struct attribute *integer_attrs[] = {
+	&integer_displ_langcode.attr,
+	&integer_displ_name.attr,
+	&integer_default_val.attr,
+	&integer_current_val.attr,
+	&integer_modifier.attr,
+	&integer_lower_bound.attr,
+	&integer_upper_bound.attr,
+	&integer_scalar_increment.attr,
+	&integer_type.attr,
+	NULL,
+};
+
+static const struct attribute_group integer_attr_group = {
+	.attrs = integer_attrs,
+};
+
+int alloc_int_data(void)
+{
+	int ret = 0;
+
+	integer_instances_count = get_instance_count(DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID);
+	integer_data = kzalloc((sizeof(struct integer_data) * integer_instances_count), GFP_KERNEL);
+	if (!integer_data)
+		ret = -ENOMEM;
+	return ret;
+}
+
+/**
+ * populate_int_data() - Populate all properties of an instance under integer attribute
+ * @integer_obj: ACPI object with integer data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ **/
+int populate_int_data(union acpi_object *integer_obj, int instance_id,
+			struct kobject *attr_name_kobj)
+{
+	int retval = sysfs_create_group(attr_name_kobj, &integer_attr_group);
+
+	if (retval)
+		goto out;
+
+	mutex_lock(&wmi_priv.mutex);
+	strncpy_attr(integer_data[instance_id].attribute_name,
+		integer_obj[ATTR_NAME].string.pointer);
+	strncpy_attr(integer_data[instance_id].display_name_language_code,
+		integer_obj[DISPL_NAME_LANG_CODE].string.pointer);
+	strncpy_attr(integer_data[instance_id].display_name,
+		integer_obj[DISPLAY_NAME].string.pointer);
+	integer_data[instance_id].default_value =
+		(uintptr_t)integer_obj[DEFAULT_VAL].string.pointer;
+	integer_data[instance_id].current_value =
+		(uintptr_t)integer_obj[CURRENT_VAL].string.pointer;
+	strncpy_attr(integer_data[instance_id].modifier, integer_obj[MODIFIER].string.pointer);
+	integer_data[instance_id].min_value =
+		(uintptr_t)integer_obj[MIN_VALUE].string.pointer;
+	integer_data[instance_id].max_value =
+		(uintptr_t)integer_obj[MAX_VALUE].string.pointer;
+	integer_data[instance_id].scalar_increment =
+		(uintptr_t)integer_obj[SCALAR_INCR].string.pointer;
+	strncpy_attr(integer_data[instance_id].type, "integer");
+	mutex_unlock(&wmi_priv.mutex);
+
+out:
+	return retval;
+}
+
+/**
+ * exit_int_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ **/
+void exit_int_attributes(void)
+{
+	struct kobject *pos, *next;
+
+	list_for_each_entry_safe(pos, next, &wmi_priv.main_dir_kset->list, entry) {
+		/* this removes only integer atribute group under main_dir_kset */
+		sysfs_remove_group(pos, &integer_attr_group);
+	}
+	kfree(integer_data);
+}
diff --git a/drivers/platform/x86/dell-wmi-passobj-attributes.c b/drivers/platform/x86/dell-wmi-passobj-attributes.c
new file mode 100644
index 000000000000..6884e6153dd6
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-passobj-attributes.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to password object type attributes under BIOS Password Object GUID for
+ * use with dell-wmi-sysman
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#include "dell-wmi-sysman-attributes.h"
+
+enum po_properties {IS_PASS_SET = 1, MIN_PASS_LEN, MAX_PASS_LEN};
+
+/* kept variable names same as in sysfs file name for sysfs_show macro definition */
+struct po_data {
+	char attribute_name[MAX_BUFF];
+	int is_password_set;
+	int min_password_length;
+	int max_password_length;
+	char type[MAX_BUFF];
+};
+
+static struct po_data *po_data;
+static int po_instances_count;
+get_instance_id(po);
+
+static ssize_t is_password_set_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id = get_po_instance_id(kobj);
+
+	if (instance_id >= 0) {
+		union acpi_object *obj;
+
+		/* need to use specific instance_id and guid combination to get right data */
+		obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_PASSOBJ_ATTRIBUTE_GUID);
+		if (!obj)
+			return -AE_ERROR;
+		po_data[instance_id].is_password_set =
+			(uintptr_t)obj->package.elements[IS_PASS_SET].string.pointer;
+		kfree(obj);
+		return sprintf(buf, "%d\n", po_data[instance_id].is_password_set);
+	}
+	return -EIO;
+}
+
+struct kobj_attribute po_is_pass_set =
+		__ATTR_RO(is_password_set);
+
+static ssize_t current_password_store(struct kobject *kobj,
+				      struct kobj_attribute *attr,
+				      const char *buf, size_t count)
+{
+	char *p = memchr(buf, '\n', count);
+	int ret;
+
+	if (p != NULL)
+		*p = '\0';
+	if (strlen(buf) > MAX_BUFF)
+		return -EINVAL;
+
+	if (strcmp(kobj->name, "Admin") == 0)
+		strncpy(wmi_priv.current_admin_password, buf, (strlen(buf) + 1));
+	if (strcmp(kobj->name, "System") == 0)
+		strncpy(wmi_priv.current_system_password, buf, (strlen(buf) + 1));
+	return ret ? ret : count;
+}
+
+struct kobj_attribute po_current_password =
+		__ATTR_WO(current_password);
+
+static ssize_t new_password_store(struct kobject *kobj,
+				  struct kobj_attribute *attr,
+				  const char *buf, size_t count)
+{
+	char *p = memchr(buf, '\n', count);
+	int ret;
+
+	if (p != NULL)
+		*p = '\0';
+	if (strlen(buf) > MAX_BUFF)
+		return -EINVAL;
+
+	ret = set_new_password(kobj->name, buf);
+	return ret ? ret : count;
+}
+
+struct kobj_attribute po_new_password =
+		__ATTR_WO(new_password);
+
+attribute_n_property_show(min_password_length, po);
+struct kobj_attribute po_min_pass_length =
+		__ATTR_RO(min_password_length);
+
+attribute_n_property_show(max_password_length, po);
+struct kobj_attribute po_max_pass_length =
+		__ATTR_RO(max_password_length);
+
+attribute_s_property_show(type, po);
+struct kobj_attribute po_type =
+	__ATTR_RO(type);
+
+static struct attribute *po_attrs[] = {
+	&po_is_pass_set.attr,
+	&po_min_pass_length.attr,
+	&po_max_pass_length.attr,
+	&po_current_password.attr,
+	&po_new_password.attr,
+	&po_type.attr,
+	NULL,
+};
+
+static const struct attribute_group po_attr_group = {
+	.attrs = po_attrs,
+};
+
+int alloc_po_data(void)
+{
+	int ret = 0;
+
+	po_instances_count = get_instance_count(DELL_WMI_BIOS_PASSOBJ_ATTRIBUTE_GUID);
+	po_data = kzalloc((sizeof(struct po_data) * po_instances_count), GFP_KERNEL);
+	if (!po_data)
+		ret = -ENOMEM;
+	return ret;
+}
+
+/**
+ * populate_po_data() - Populate all properties of an instance under password object attribute
+ * @po_obj: ACPI object with password object data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ **/
+int populate_po_data(union acpi_object *po_obj, int instance_id, struct kobject *attr_name_kobj)
+{
+	int retval = sysfs_create_group(attr_name_kobj, &po_attr_group);
+
+	if (retval)
+		goto out;
+
+	mutex_lock(&wmi_priv.mutex);
+	strncpy_attr(po_data[instance_id].attribute_name, po_obj[ATTR_NAME].string.pointer);
+	po_data[instance_id].is_password_set = (uintptr_t)po_obj[IS_PASS_SET].string.pointer;
+	po_data[instance_id].min_password_length = (uintptr_t)po_obj[MIN_PASS_LEN].string.pointer;
+	po_data[instance_id].max_password_length = (uintptr_t) po_obj[MAX_PASS_LEN].string.pointer;
+	strncpy_attr(po_data[instance_id].type, "password_object");
+	mutex_unlock(&wmi_priv.mutex);
+
+out:
+	return retval;
+}
+
+/**
+ * exit_po_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ **/
+void exit_po_attributes(void)
+{
+	struct kobject *pos, *next;
+
+	list_for_each_entry_safe(pos, next, &wmi_priv.password_dir_kset->list, entry) {
+		/* this removes only enumeration atribute group under main_dir_kset */
+		sysfs_remove_group(pos, &po_attr_group);
+	}
+	kfree(po_data);
+}
diff --git a/drivers/platform/x86/dell-wmi-passwordattr-interface.c b/drivers/platform/x86/dell-wmi-passwordattr-interface.c
new file mode 100644
index 000000000000..bd19d6c15002
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-passwordattr-interface.c
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to SET password methods under BIOS attributes interface GUID
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#include <linux/nls.h>
+#include <linux/wmi.h>
+#include "dell-wmi-sysman-attributes.h"
+
+static int call_password_interface(struct wmi_device *wdev, char *in_args, size_t size)
+{
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	struct acpi_buffer input;
+	union acpi_object *obj;
+	acpi_status status;
+	int ret = -EIO;
+
+	input.length =  (acpi_size) size;
+	input.pointer = in_args;
+	status = wmidev_evaluate_method(wdev, 0, 1, &input, &output);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+	obj = (union acpi_object *)output.pointer;
+	if (obj->type == ACPI_TYPE_INTEGER)
+		ret = obj->integer.value;
+
+	kfree(output.pointer);
+	/* let userland know it may need to check is_password_set again */
+	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
+	return map_wmi_error(ret);
+}
+
+/**
+ * set_new_password() - Sets a system admin password
+ * @password_type: The type of password to set
+ * @new: The new password
+ *
+ * Sets the password using plaintext interface
+ **/
+int set_new_password(const char *password_type, const char *new)
+{
+	char *current_password, *type_value, *old_value, *new_value;
+	size_t security_area_size, string_area_size, buffer_size;
+	u8 *type_len, *old_len, *new_len;
+	char *buffer = NULL;
+	int ret;
+
+	mutex_lock(&wmi_priv.mutex);
+	if (!wmi_priv.password_attr_wdev) {
+		ret = -ENODEV;
+		goto out;
+	}
+	if (strcmp(password_type, "Admin") == 0) {
+		current_password = wmi_priv.current_admin_password;
+	} else if (strcmp(password_type, "System") == 0) {
+		current_password = wmi_priv.current_system_password;
+	} else {
+		ret = -EINVAL;
+		dev_err(&wmi_priv.password_attr_wdev->dev, "unknown password type %s\n",
+			password_type);
+		goto out;
+	}
+
+	/* build/calculate buffer */
+	security_area_size = calculate_security_buffer();
+	string_area_size = (strlen(password_type) + strlen(current_password) + strlen(new))*2;
+	buffer_size = security_area_size + string_area_size + sizeof(u16) * 3;
+	buffer = kzalloc(buffer_size, GFP_KERNEL);
+	if (!buffer) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* build security area */
+	if (strlen(wmi_priv.current_admin_password) > 0)
+		populate_security_buffer(buffer, wmi_priv.current_admin_password);
+
+	/* build variables to set */
+	type_len = buffer + security_area_size;
+	type_value = type_len + sizeof(u16);
+	*type_len = utf8s_to_utf16s(password_type, strlen(password_type), UTF16_HOST_ENDIAN,
+				    (wchar_t *) type_value, MAX_BUFF) * 2;
+	if (*type_len < 0) {
+		ret = -EINVAL;
+		dev_err(&wmi_priv.password_attr_wdev->dev, "UTF16 conversion failed\n");
+		goto out;
+	}
+
+	old_len = type_value + *type_len;
+	old_value = old_len + sizeof(u16);
+	*old_len = utf8s_to_utf16s(current_password, strlen(current_password), UTF16_HOST_ENDIAN,
+				   (wchar_t *) old_value, MAX_BUFF) * 2;
+	if (*old_len < 0) {
+		ret = -EINVAL;
+		dev_err(&wmi_priv.password_attr_wdev->dev, "UTF16 conversion failed\n");
+		goto out;
+	}
+
+	new_len = old_value + *old_len;
+	new_value = new_len + sizeof(u16);
+	*new_len = utf8s_to_utf16s(new, strlen(new), UTF16_HOST_ENDIAN,
+				   (wchar_t *) new_value, MAX_BUFF) * 2;
+	if (*new_len < 0) {
+		ret = -EINVAL;
+		dev_err(&wmi_priv.password_attr_wdev->dev, "UTF16 conversion failed\n");
+		goto out;
+	}
+
+	ret = call_password_interface(wmi_priv.password_attr_wdev, buffer, buffer_size);
+	/* clear current_password here and use user input from wmi_priv.current_password */
+	if (!ret)
+		current_password = "";
+	/* explain to user the detailed failure reason */
+	else if (ret == -EOPNOTSUPP)
+		dev_err(&wmi_priv.password_attr_wdev->dev, "admin password must be configured\n");
+	else if (ret == -EACCES)
+		dev_err(&wmi_priv.password_attr_wdev->dev, "invalid password\n");
+
+out:
+	kfree(buffer);
+	mutex_unlock(&wmi_priv.mutex);
+
+	return ret;
+}
+
+static int dell_wmi_bios_attr_pass_interface_probe(struct wmi_device *wdev, const void *context)
+{
+	mutex_lock(&wmi_priv.mutex);
+	wmi_priv.password_attr_wdev = wdev;
+	mutex_unlock(&wmi_priv.mutex);
+	return 0;
+}
+
+static int dell_wmi_bios_attr_pass_interface_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&wmi_priv.mutex);
+	wmi_priv.password_attr_wdev = NULL;
+	mutex_unlock(&wmi_priv.mutex);
+	return 0;
+}
+
+static const struct wmi_device_id dell_wmi_bios_attr_pass_interface_id_table[] = {
+	{ .guid_string = DELL_WMI_BIOS_PASSWORD_INTERFACE_GUID },
+	{ },
+};
+static struct wmi_driver dell_wmi_bios_attr_pass_interface_driver = {
+	.driver = {
+		.name = DRIVER_NAME"-password"
+	},
+	.probe = dell_wmi_bios_attr_pass_interface_probe,
+	.remove = dell_wmi_bios_attr_pass_interface_remove,
+	.id_table = dell_wmi_bios_attr_pass_interface_id_table,
+};
+
+int init_dell_wmi_bios_attr_pass_interface(void)
+{
+	return wmi_driver_register(&dell_wmi_bios_attr_pass_interface_driver);
+}
+
+void exit_dell_wmi_bios_attr_pass_interface(void)
+{
+	wmi_driver_unregister(&dell_wmi_bios_attr_pass_interface_driver);
+}
+
+MODULE_DEVICE_TABLE(wmi, dell_wmi_bios_attr_pass_interface_id_table);
diff --git a/drivers/platform/x86/dell-wmi-string-attributes.c b/drivers/platform/x86/dell-wmi-string-attributes.c
new file mode 100644
index 000000000000..edc6f461e37f
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-string-attributes.c
@@ -0,0 +1,171 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to string type attributes under BIOS String GUID for use with
+ * dell-wmi-sysman
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#include "dell-wmi-sysman-attributes.h"
+
+enum string_properties {MIN_LEN = 6, MAX_LEN};
+
+/* kept variable names same as in sysfs file name for sysfs_show macro definition */
+struct str_data {
+	char display_name_language_code[MAX_BUFF];
+	char attribute_name[MAX_BUFF];
+	char display_name[MAX_BUFF];
+	char default_value[MAX_BUFF];
+	char current_value[MAX_BUFF];
+	char modifier[MAX_BUFF];
+	int min_length;
+	int max_length;
+	char type[MAX_BUFF];
+};
+
+static struct str_data *str_data;
+static int str_instances_count;
+get_instance_id(str);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id;
+
+	if (!capable(CAP_SYS_ADMIN))
+		return -EPERM;
+	instance_id = get_str_instance_id(kobj);
+	if (instance_id >= 0) {
+		union acpi_object *obj;
+
+		/* need to use specific instance_id and guid combination to get right data */
+		obj = get_wmiobj_pointer(instance_id, DELL_WMI_BIOS_STRING_ATTRIBUTE_GUID);
+		if (!obj)
+			return -AE_ERROR;
+		strncpy_attr(str_data[instance_id].current_value,
+			obj->package.elements[CURRENT_VAL].string.pointer);
+		kfree(obj);
+		return sprintf(buf, "%s\n", str_data[instance_id].current_value);
+	}
+	return -EIO;
+}
+
+/**
+ * validate_str_input() - Validate input of current_value against min and max lengths
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ **/
+int validate_str_input(int instance_id, const char *buf)
+{
+	int in_len = strlen(buf);
+
+	if ((in_len >= str_data[instance_id].min_length) &&
+	(in_len <= str_data[instance_id].max_length))
+		return 0;
+
+	return -EINVAL;
+}
+
+attribute_s_property_show(display_name_language_code, str);
+static struct kobj_attribute str_displ_langcode =
+		__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, str);
+struct kobj_attribute str_displ_name =
+		__ATTR_RO(display_name);
+
+attribute_s_property_show(default_value, str);
+struct kobj_attribute str_default_val =
+		__ATTR_RO(default_value);
+
+attribute_property_store(current_value, str);
+struct kobj_attribute str_current_val =
+		__ATTR_RW(current_value);
+
+attribute_s_property_show(modifier, str);
+struct kobj_attribute str_modifier =
+		__ATTR_RO(modifier);
+
+attribute_n_property_show(min_length, str);
+struct kobj_attribute str_min_length =
+		__ATTR_RO(min_length);
+
+attribute_n_property_show(max_length, str);
+struct kobj_attribute str_max_length =
+		__ATTR_RO(max_length);
+
+attribute_s_property_show(type, str);
+struct kobj_attribute str_type =
+	__ATTR_RO(type);
+
+static struct attribute *str_attrs[] = {
+	&str_displ_langcode.attr,
+	&str_displ_name.attr,
+	&str_default_val.attr,
+	&str_current_val.attr,
+	&str_modifier.attr,
+	&str_min_length.attr,
+	&str_max_length.attr,
+	&str_type.attr,
+	NULL,
+};
+
+static const struct attribute_group str_attr_group = {
+	.attrs = str_attrs,
+};
+
+int alloc_str_data(void)
+{
+	int ret = 0;
+
+	str_instances_count = get_instance_count(DELL_WMI_BIOS_STRING_ATTRIBUTE_GUID);
+	str_data = kzalloc((sizeof(struct str_data) * str_instances_count), GFP_KERNEL);
+	if (!str_data)
+		ret = -ENOMEM;
+	return ret;
+}
+
+/**
+ * populate_str_data() - Populate all properties of an instance under string attribute
+ * @str_obj: ACPI object with integer data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ **/
+int populate_str_data(union acpi_object *str_obj, int instance_id, struct kobject *attr_name_kobj)
+{
+	int retval = sysfs_create_group(attr_name_kobj, &str_attr_group);
+
+	if (retval)
+		goto out;
+
+	mutex_lock(&wmi_priv.mutex);
+	strncpy_attr(str_data[instance_id].attribute_name, str_obj[ATTR_NAME].string.pointer);
+	strncpy_attr(str_data[instance_id].display_name_language_code,
+		str_obj[DISPL_NAME_LANG_CODE].string.pointer);
+	strncpy_attr(str_data[instance_id].display_name, str_obj[DISPLAY_NAME].string.pointer);
+	strncpy_attr(str_data[instance_id].default_value, str_obj[DEFAULT_VAL].string.pointer);
+	strncpy_attr(str_data[instance_id].current_value, str_obj[CURRENT_VAL].string.pointer);
+	strncpy_attr(str_data[instance_id].modifier, str_obj[MODIFIER].string.pointer);
+	str_data[instance_id].min_length = (uintptr_t)str_obj[MIN_LEN].string.pointer;
+	str_data[instance_id].max_length = (uintptr_t) str_obj[MAX_LEN].string.pointer;
+	strncpy_attr(str_data[instance_id].type, "string");
+	mutex_unlock(&wmi_priv.mutex);
+
+out:
+	return retval;
+}
+
+/**
+ * exit_str_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ **/
+void exit_str_attributes(void)
+{
+	struct kobject *pos, *next;
+
+	list_for_each_entry_safe(pos, next, &wmi_priv.main_dir_kset->list, entry) {
+		/* this removes only string atribute group under main_dir_kset */
+		sysfs_remove_group(pos, &str_attr_group);
+	}
+	kfree(str_data);
+}
diff --git a/drivers/platform/x86/dell-wmi-sysman-attributes.c b/drivers/platform/x86/dell-wmi-sysman-attributes.c
new file mode 100644
index 000000000000..4a44ffff03c7
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-sysman-attributes.c
@@ -0,0 +1,589 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common methods for use with dell-wmi-sysman
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/dmi.h>
+#include <linux/wmi.h>
+#include "dell-wmi-sysman-attributes.h"
+
+#define MAX_TYPES  4
+
+static struct platform_device *platform_device;
+
+static struct platform_driver platform_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+	},
+};
+
+struct dell_wmi_sysman_priv wmi_priv = {
+	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
+};
+
+/* reset bios to defaults */
+static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
+static int reset_option = -1;
+
+/**
+ * calculate_security_buffer() - determines size of security buffer for authentication scheme
+ *
+ * Currently only supported type is Admin password
+ **/
+size_t calculate_security_buffer(void)
+{
+	if (strlen(wmi_priv.current_admin_password) > 0) {
+		return (sizeof(u32) * 2) +
+			strlen(wmi_priv.current_admin_password) +
+			strlen(wmi_priv.current_admin_password) % 2;
+	}
+	return sizeof(u32) * 2;
+}
+
+/**
+ * populate_security_buffer() - builds a security buffer for authentication scheme
+ * @buffer: the buffer to populate
+ * @authentication: the authentication content
+ *
+ * Currently only supported type is PLAIN TEXT
+ **/
+void populate_security_buffer(char *buffer, char *authentication)
+{
+	char *auth = buffer + sizeof(u32)*2;
+	u32 *sectype = (u32 *) buffer;
+	u32 *seclen = sectype + 1;
+	/* plain text */
+	*sectype = 1;
+	*seclen = strlen(authentication);
+	strncpy(auth, authentication, *seclen);
+}
+
+/**
+ * map_wmi_error() - map errors from WMI methods to kernel error codes
+ **/
+int map_wmi_error(int error_code)
+{
+	switch (error_code) {
+	case 0:
+		/* success */
+		return 0;
+	case 1:
+		/* failed */
+		return -EIO;
+	case 2:
+		/* invalid parameter */
+		return -EINVAL;
+	case 3:
+		/* access denied */
+		return -EACCES;
+	case 4:
+		/* not supported */
+		return -EOPNOTSUPP;
+	case 5:
+		/* memory error */
+		return -ENOMEM;
+	case 6:
+		/* protocol error */
+		return -EPROTO;
+	}
+	/* unspecified error */
+	return -EIO;
+}
+
+/**
+ * reset_bios_show() - sysfs implementaton for read reset_bios
+ * @kobj: Kernel object for this attribute
+ * @attr: Kernel object attribute
+ * @buf: The buffer to display to userspace
+ **/
+static ssize_t reset_bios_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	char *start = buf;
+	int i;
+
+	for (i = 0; i < MAX_TYPES; i++) {
+		if (i == reset_option)
+			buf += sprintf(buf, "[%s] ", reset_types[i]);
+		else
+			buf += sprintf(buf, "%s ", reset_types[i]);
+	}
+	buf += sprintf(buf, "\n");
+	return buf-start;
+}
+
+/**
+ * reset_bios_store() - sysfs implementaton for write reset_bios
+ * @kobj: Kernel object for this attribute
+ * @attr: Kernel object attribute
+ * @buf: The buffer from userspace
+ * @count: the size of the buffer from userspace
+ **/
+static ssize_t reset_bios_store(struct kobject *kobj,
+				struct kobj_attribute *attr, const char *buf, size_t count)
+{
+	int len, ret, i;
+	int type = -1;
+	char *p;
+
+	p = memchr(buf, '\n', count);
+	if (p != NULL)
+		*p = '\0';
+	len = p ? p - buf : count;
+
+	for (i = 0; i < MAX_TYPES; i++) {
+		if (len == strlen(reset_types[i])
+		    && !strncmp(buf, reset_types[i], len)) {
+			type = i;
+			break;
+		}
+	}
+
+	if (type < 0 || type >= MAX_TYPES) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = set_bios_defaults(type);
+	dev_dbg(&platform_device->dev, "reset all attributes request type %d: %d\n", type, ret);
+	if (ret) {
+		ret = -EINVAL;
+	} else {
+		reset_option = type;
+		ret = count;
+	}
+
+out:
+	return ret;
+}
+
+/**
+ * pending_reboot_show() - sysfs implementaton for read pending_reboot
+ * @kobj: Kernel object for this attribute
+ * @attr: Kernel object attribute
+ * @buf: The buffer to display to userspace
+ *
+ * Stores default value as 0
+ * When current_value is changed this attribute is set to 1 to notify reboot may be required
+ **/
+static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
+				   char *buf)
+{
+	return sprintf(buf, "%d\n", wmi_priv.pending_changes);
+}
+
+static struct kobj_attribute reset_bios = __ATTR_RW(reset_bios);
+static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
+
+
+/**
+ * create_reset_bios() - Creates reset_bios and pending_reboot attributes
+ **/
+static int create_reset_bios(void)
+{
+	int ret = sysfs_create_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
+
+	if (ret) {
+		dev_dbg(&platform_device->dev, "could not create reset_bios file\n");
+		return ret;
+	}
+
+	ret = sysfs_create_file(&wmi_priv.main_dir_kset->kobj, &pending_reboot.attr);
+	if (ret) {
+		dev_dbg(&platform_device->dev, "could not create changing_pending_reboot file\n");
+		sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
+	}
+	return ret;
+}
+
+static void release_reset_bios_data(void)
+{
+	sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &reset_bios.attr);
+	sysfs_remove_file(&wmi_priv.main_dir_kset->kobj, &pending_reboot.attr);
+}
+
+static ssize_t wmi_sysman_attr_show(struct kobject *kobj, struct attribute *attr,
+				    char *buf)
+{
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->show)
+		ret = kattr->show(kobj, kattr, buf);
+	return ret;
+}
+
+static ssize_t wmi_sysman_attr_store(struct kobject *kobj, struct attribute *attr,
+				     const char *buf, size_t count)
+{
+	struct kobj_attribute *kattr;
+	ssize_t ret = -EIO;
+
+	kattr = container_of(attr, struct kobj_attribute, attr);
+	if (kattr->store)
+		ret = kattr->store(kobj, kattr, buf, count);
+	return ret;
+}
+
+const struct sysfs_ops wmi_sysman_kobj_sysfs_ops = {
+	.show	= wmi_sysman_attr_show,
+	.store	= wmi_sysman_attr_store,
+};
+
+static void attr_name_release(struct kobject *kobj)
+{
+	kfree(kobj);
+}
+
+static struct kobj_type attr_name_ktype = {
+	.release	= attr_name_release,
+	.sysfs_ops	= &wmi_sysman_kobj_sysfs_ops,
+};
+
+/**
+ * strncpy_attr - Copy a length-limited, NULL-terminated string with bound checks
+ * @dest: Where to copy the string to
+ * @src: Where to copy the string from
+ **/
+void strncpy_attr(char *dest, char *src)
+{
+	size_t len = strlen(src) + 1;
+
+	if (len > 1 && len < MAX_BUFF)
+		strncpy(dest, src, len);
+}
+
+/**
+ * get_wmiobj_pointer() - Get Content of WMI block for particular instance
+ * @instance_id: WMI instance ID
+ * @guid_string: WMI GUID (in str form)
+ *
+ * Fetches the content for WMI block (instance_id) under GUID (guid_string)
+ * Caller must kfree the return
+ **/
+union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string)
+{
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status status;
+
+	status = wmi_query_block(guid_string, instance_id, &out);
+
+	return ACPI_SUCCESS(status) ? (union acpi_object *)out.pointer : NULL;
+}
+
+/**
+ * get_instance_count() - Compute total number of instances under guid_string
+ * @guid_string: WMI GUID (in string form)
+ **/
+int get_instance_count(const char *guid_string)
+{
+	union acpi_object *wmi_obj = NULL;
+	int i = 0;
+
+	do {
+		kfree(wmi_obj);
+		wmi_obj = get_wmiobj_pointer(i, guid_string);
+		i++;
+	} while (wmi_obj);
+
+	return (i-1);
+}
+
+/**
+ * alloc_attributes_data() - Allocate attributes data for a particular type
+ * @attr_type: Attribute type to allocate
+ **/
+static int alloc_attributes_data(int attr_type)
+{
+	int retval = 0;
+
+	switch (attr_type) {
+	case ENUM:
+		retval = alloc_enum_data();
+		break;
+	case INT:
+		retval = alloc_int_data();
+		break;
+	case STR:
+		retval = alloc_str_data();
+		break;
+	case PO:
+		retval = alloc_po_data();
+		break;
+	default:
+		break;
+	}
+
+	return retval;
+}
+
+/**
+ * destroy_attribute_objs() - Free a kset of kobjects
+ * @kset: The kset to destroy
+ *
+ * Fress kobjects created for each attribute_name under attribute type kset
+ **/
+static void destroy_attribute_objs(struct kset *kset)
+{
+	struct kobject *pos, *next;
+
+	list_for_each_entry_safe(pos, next, &kset->list, entry) {
+		kobject_put(pos);
+	}
+}
+
+/**
+ * release_attributes_data() - Clean-up all sysfs directories and files created
+ **/
+static void release_attributes_data(void)
+{
+	release_reset_bios_data();
+
+	mutex_lock(&wmi_priv.mutex);
+	exit_enum_attributes();
+	exit_int_attributes();
+	exit_str_attributes();
+	exit_po_attributes();
+	destroy_attribute_objs(wmi_priv.main_dir_kset);
+	destroy_attribute_objs(wmi_priv.password_dir_kset);
+	kset_unregister(wmi_priv.main_dir_kset);
+	kset_unregister(wmi_priv.password_dir_kset);
+	mutex_unlock(&wmi_priv.mutex);
+
+}
+
+/**
+ * init_bios_attributes() - Initialize all attributes for a type
+ * @attr_type: The attribute type to initialize
+ * @guid: The WMI GUID associated with this type to initialize
+ *
+ * Initialiaze all 4 types of attributes enumeration, integer, string and password object.
+ * Populates each attrbute typ's respective properties under sysfs files
+ **/
+static int init_bios_attributes(int attr_type, const char *guid)
+{
+	struct kobject *attr_name_kobj; //individual attribute names
+	union acpi_object *obj = NULL;
+	union acpi_object *elements;
+	struct kset *tmp_set;
+	
+	/* instance_id needs to be reset for each type GUID
+	 * also, instance IDs are unique within GUID but not across
+	 */
+	int instance_id = 0;
+	int retval = 0;
+
+	retval = alloc_attributes_data(attr_type);
+	if (retval)
+		return retval;
+	/* need to use specific instance_id and guid combination to get right data */
+	obj = get_wmiobj_pointer(instance_id, guid);
+	if (!obj)
+		return -ENODEV;
+	elements = obj->package.elements;
+
+	while (elements) {
+		/* sanity checking */
+		if (strlen(elements[ATTR_NAME].string.pointer) == 0) {
+			dev_dbg(&platform_device->dev, "empty attribute found\n");
+			goto nextobj;
+		}
+		if (attr_type == PO)
+			tmp_set = wmi_priv.password_dir_kset;
+		else
+			tmp_set = wmi_priv.main_dir_kset;
+
+		if (kset_find_obj(tmp_set, elements[ATTR_NAME].string.pointer)) {
+			dev_dbg(&platform_device->dev, "duplicate attribute name found - %s\n",
+				elements[ATTR_NAME].string.pointer);
+			goto nextobj;
+		}
+
+		/* build attribute */
+		attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
+		if (!attr_name_kobj)
+			goto err_attr_init;
+
+		attr_name_kobj->kset = tmp_set;
+
+		retval = kobject_init_and_add(attr_name_kobj, &attr_name_ktype, NULL, "%s",
+						elements[ATTR_NAME].string.pointer);
+		if (retval) {
+			kobject_put(attr_name_kobj);
+			goto err_attr_init;
+		}
+
+		/* enumerate all of this attribute */
+		switch (attr_type) {
+		case ENUM:
+			retval = populate_enum_data(elements, instance_id, attr_name_kobj);
+			break;
+		case INT:
+			retval = populate_int_data(elements, instance_id, attr_name_kobj);
+			break;
+		case STR:
+			retval = populate_str_data(elements, instance_id, attr_name_kobj);
+			break;
+		case PO:
+			retval = populate_po_data(elements, instance_id, attr_name_kobj);
+			break;
+		default:
+			break;
+		}
+
+		if (retval) {
+			dev_dbg(&platform_device->dev, "failed to populate %s\n",
+				elements[ATTR_NAME].string.pointer);
+			goto err_attr_init;
+		}
+
+nextobj:
+		kfree(obj);
+		instance_id++;
+		obj = get_wmiobj_pointer(instance_id, guid);
+		elements = obj ? obj->package.elements : NULL;
+	}
+
+	goto out;
+
+err_attr_init:
+	release_attributes_data();
+	kfree(obj);
+out:
+	return retval;
+}
+
+static int __init init_dell_bios_attrib_wmi(void)
+{
+	int ret = 0;
+
+	if (!dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "Dell System", NULL) &&
+	    !dmi_find_device(DMI_DEV_TYPE_OEM_STRING, "www.dell.com", NULL)) {
+		pr_err("Unable to run on non-Dell system\n");
+		return -ENODEV;
+	}
+
+	ret = init_dell_wmi_bios_attr_set_interface();
+	if (ret || !wmi_priv.bios_attr_wdev) {
+		pr_debug("failed to initialize set interface\n");
+		goto fail_set_interface;
+	}
+
+	ret = init_dell_wmi_bios_attr_pass_interface();
+	if (ret || !wmi_priv.password_attr_wdev) {
+		pr_debug("failed to initialize pass interface\n");
+		goto fail_pass_interface;
+	}
+
+	ret = platform_driver_register(&platform_driver);
+	if (ret)
+		goto fail_platform_driver;
+
+	platform_device = platform_device_alloc(DRIVER_NAME, -1);
+	if (!platform_device) {
+		ret = -ENOMEM;
+		goto fail_platform_device_alloc;
+	}
+
+	ret = platform_device_add(platform_device);
+	if (ret)
+		goto fail_platform_device_add;
+
+	wmi_priv.main_dir_kset = kset_create_and_add("attributes", NULL,
+											&platform_device->dev.kobj);
+	if (!wmi_priv.main_dir_kset) {
+		ret = -ENOMEM;
+		goto fail_platform_device_add;
+	}
+
+	wmi_priv.password_dir_kset = kset_create_and_add("passwords", NULL,
+												&platform_device->dev.kobj);
+	if (!wmi_priv.password_dir_kset) {
+		ret = -ENOMEM;
+		goto fail_main_kset;
+	}
+
+	ret = create_reset_bios();
+	if (ret) {
+		dev_dbg(&platform_device->dev, "could not create reset BIOS attribute\n");
+		goto fail_password_kset;
+	}
+
+	ret = init_bios_attributes(ENUM, DELL_WMI_BIOS_ENUMERATION_ATTRIBUTE_GUID);
+	if (ret) {
+		dev_dbg(&platform_device->dev, "failed to populate enumeration type attributes\n");
+		goto fail_create_group;
+	}
+
+	ret = init_bios_attributes(INT, DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID);
+	if (ret) {
+		dev_dbg(&platform_device->dev, "failed to populate integer type attributes\n");
+		goto fail_create_group;
+	}
+
+	ret = init_bios_attributes(STR, DELL_WMI_BIOS_STRING_ATTRIBUTE_GUID);
+	if (ret) {
+		dev_dbg(&platform_device->dev, "failed to populate string type attributes\n");
+		goto fail_create_group;
+	}
+
+	ret = init_bios_attributes(PO, DELL_WMI_BIOS_PASSOBJ_ATTRIBUTE_GUID);
+	if (ret) {
+		dev_dbg(&platform_device->dev, "failed to populate pass object type attributes\n");
+		goto fail_create_group;
+	}
+
+	return 0;
+
+fail_create_group:
+	release_attributes_data();
+	platform_device_del(platform_device);
+
+fail_password_kset:
+	kset_unregister(wmi_priv.password_dir_kset);
+
+fail_main_kset:
+	kset_unregister(wmi_priv.main_dir_kset);
+
+fail_platform_device_add:
+	platform_device_put(platform_device);
+
+fail_platform_device_alloc:
+	platform_driver_unregister(&platform_driver);
+
+fail_platform_driver:
+	exit_dell_wmi_bios_attr_pass_interface();
+
+fail_pass_interface:
+	exit_dell_wmi_bios_attr_set_interface();
+
+fail_set_interface:
+	return ret;
+}
+
+static void __exit exit_dell_bios_attrib_wmi(void)
+{
+	release_attributes_data();
+	exit_dell_wmi_bios_attr_set_interface();
+	exit_dell_wmi_bios_attr_pass_interface();
+	if (platform_device) {
+		platform_device_unregister(platform_device);
+		platform_driver_unregister(&platform_driver);
+	}
+}
+
+module_init(init_dell_bios_attrib_wmi);
+module_exit(exit_dell_bios_attrib_wmi);
+
+MODULE_AUTHOR("Mario Limonciello <mario.limonciello@dell.com>");
+MODULE_AUTHOR("Prasanth Ksr <prasanth.ksr@dell.com>");
+MODULE_AUTHOR("Divya Bharathi <divya.bharathi@dell.com>");
+MODULE_DESCRIPTION("Dell platform setting control interface");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/x86/dell-wmi-sysman-attributes.h b/drivers/platform/x86/dell-wmi-sysman-attributes.h
new file mode 100644
index 000000000000..cc66c120de6d
--- /dev/null
+++ b/drivers/platform/x86/dell-wmi-sysman-attributes.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0
+ * Definitions for kernel modules using Dell WMI System Management Driver
+ *
+ *  Copyright (c) 2020 Dell Inc.
+ */
+
+#ifndef _DELL_WMI_BIOS_ATTR_H_
+#define _DELL_WMI_BIOS_ATTR_H_
+
+#include <linux/wmi.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
+#include <linux/platform_device.h>
+#include <linux/capability.h>
+
+#define DRIVER_NAME					"dell-wmi-sysman"
+#define MAX_BUFF  512
+
+#define DELL_WMI_BIOS_ENUMERATION_ATTRIBUTE_GUID	"F1DDEE52-063C-4784-A11E-8A06684B9BF5"
+#define DELL_WMI_BIOS_INTEGER_ATTRIBUTE_GUID		"F1DDEE52-063C-4784-A11E-8A06684B9BFA"
+#define DELL_WMI_BIOS_STRING_ATTRIBUTE_GUID		"F1DDEE52-063C-4784-A11E-8A06684B9BF9"
+#define DELL_WMI_BIOS_PASSOBJ_ATTRIBUTE_GUID		"0894B8D6-44A6-4719-97D7-6AD24108BFD4"
+#define DELL_WMI_BIOS_ATTRIBUTES_INTERFACE_GUID		"F1DDEE52-063C-4784-A11E-8A06684B9BF4"
+#define DELL_WMI_BIOS_PASSWORD_INTERFACE_GUID		"70FE8229-D03B-4214-A1C6-1F884B1A892A"
+
+struct dell_wmi_sysman_priv {
+	char current_admin_password[MAX_BUFF];
+	char current_system_password[MAX_BUFF];
+	struct wmi_device *password_attr_wdev;
+	struct wmi_device *bios_attr_wdev;
+	bool pending_changes;
+	struct mutex mutex;
+	struct kset *main_dir_kset;
+	struct kset *password_dir_kset;
+};
+
+/* global structure used by multiple WMI interfaces */
+extern struct dell_wmi_sysman_priv wmi_priv;
+
+enum { ENUM, INT, STR, PO };
+
+enum {
+	ATTR_NAME,
+	DISPL_NAME_LANG_CODE,
+	DISPLAY_NAME,
+	DEFAULT_VAL,
+	CURRENT_VAL,
+	MODIFIER
+};
+
+#define get_instance_id(type)							\
+int get_##type##_instance_id(struct kobject *kobj)				\
+{										\
+	int i;									\
+	for (i = 0; i <= type##_instances_count; i++) {				\
+		if (!(strcmp(kobj->name, type##_data[i].attribute_name)))	\
+			return i;						\
+	}									\
+	return -EIO;								\
+}
+
+#define attribute_s_property_show(name, type)					\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sprintf(buf, "%s\n", type##_data[i].name);		\
+	return 0;								\
+}
+
+#define attribute_n_property_show(name, type)					\
+static ssize_t name##_show(struct kobject *kobj, struct kobj_attribute *attr,	\
+			   char *buf)						\
+{										\
+	int i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		return sprintf(buf, "%d\n", type##_data[i].name);		\
+	return 0;								\
+}
+
+#define attribute_property_store(curr_val, type)				\
+static ssize_t curr_val##_store(struct kobject *kobj,				\
+				struct kobj_attribute *attr,			\
+				const char *buf, size_t count)			\
+{										\
+	char *p = memchr(buf, '\n', count);					\
+	int ret = -EIO;								\
+	int i;									\
+										\
+	if (p != NULL)								\
+		*p = '\0';							\
+	i = get_##type##_instance_id(kobj);					\
+	if (i >= 0)								\
+		ret = validate_##type##_input(i, buf);				\
+	if (!ret)								\
+		ret = set_attribute(kobj->name, buf);				\
+	return ret ? ret : count;						\
+}
+
+union acpi_object *get_wmiobj_pointer(int instance_id, const char *guid_string);
+int get_instance_count(const char *guid_string);
+void strncpy_attr(char *dest, char *src);
+
+int populate_enum_data(union acpi_object *enumeration_obj, int instance_id,
+			struct kobject *attr_name_kobj);
+int alloc_enum_data(void);
+void exit_enum_attributes(void);
+
+int populate_int_data(union acpi_object *integer_obj, int instance_id,
+			struct kobject *attr_name_kobj);
+int alloc_int_data(void);
+void exit_int_attributes(void);
+
+int populate_str_data(union acpi_object *str_obj, int instance_id, struct kobject *attr_name_kobj);
+int alloc_str_data(void);
+void exit_str_attributes(void);
+
+int populate_po_data(union acpi_object *po_obj, int instance_id, struct kobject *attr_name_kobj);
+int alloc_po_data(void);
+void exit_po_attributes(void);
+
+int set_attribute(const char *a_name, const char *a_value);
+int set_bios_defaults(u8 defType);
+
+void exit_dell_wmi_bios_attr_set_interface(void);
+int init_dell_wmi_bios_attr_set_interface(void);
+int map_wmi_error(int error_code);
+size_t calculate_security_buffer(void);
+void populate_security_buffer(char *buffer, char *authentication);
+
+int set_new_password(const char *password_type, const char *new);
+int init_dell_wmi_bios_attr_pass_interface(void);
+void exit_dell_wmi_bios_attr_pass_interface(void);
+
+#endif
-- 
2.25.1

