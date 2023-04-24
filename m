Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 961316EC9B9
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Apr 2023 12:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbjDXKFZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Apr 2023 06:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbjDXKFY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Apr 2023 06:05:24 -0400
Received: from s.wrqvtzvf.outbound-mail.sendgrid.net (s.wrqvtzvf.outbound-mail.sendgrid.net [149.72.126.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D64171A
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Apr 2023 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equiv.tech;
        h=from:subject:mime-version:cc:content-type:content-transfer-encoding:
        cc:content-type:from:subject:to;
        s=org; bh=QzYE3WF98ijEeKhYOXQjFULZPtPoZTpjV4lXRMV4vHc=;
        b=t2G2I3zPGRDrflbDePikA+mgrmCaxg9pRRwiIrPL73j+yZQh63DMq1LwBMrXt0pNaqZw
        Z3TmcmPgpymsUZ25o/cWTW3j2bpMmh2rVL/OplHP+d+GfVjUwi1RKAia5eURqyFHT1zwFM
        jrLDTI2bJi9NcLyqlKCgsNw+ydltPjJVI=
Received: by filterdrecv-canary-5ddf6b8c5d-xwqsg with SMTP id filterdrecv-canary-5ddf6b8c5d-xwqsg-1-6446545D-98
        2023-04-24 10:05:18.094646929 +0000 UTC m=+5316412.096755319
Received: from localhost (unknown)
        by geopod-ismtpd-17 (SG) with ESMTP
        id r4iIYsxOSIeFC0wXCIjlgg
        Mon, 24 Apr 2023 10:05:17.773 +0000 (UTC)
From:   James Seo <james@equiv.tech>
Subject: [PATCH v3] hwmon: add HP WMI Sensors driver
Date:   Mon, 24 Apr 2023 10:05:18 +0000 (UTC)
Message-Id: <20230424100459.41672-1-james@equiv.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?1X41iaRO4wVP+tFXGLuxpQ0yxxMDhGIesR5UcsYKVengQKgidLJSXwOMZlPQwP?=
 =?us-ascii?Q?Wsczo08N+r27mw2dKehUbYtATFLUwoGbHH8vdBv?=
 =?us-ascii?Q?MM388rnaG7eNbpKkwdmixy0HpyJvWaYM42UdfkC?=
 =?us-ascii?Q?5JmCOLM9WrS=2FQa2eL3BT+mVZ=2FAGLDlccRwzyQiv?=
 =?us-ascii?Q?ES2OfEFMwkS7drip4BS6LhCo=2F46hPJImyjyYW32?=
 =?us-ascii?Q?YxXaRg=2Fqfpybc7ZtzLN7iMJSyQ1UeUQRnXvoKBA?=
 =?us-ascii?Q?NNnjFWM1I6NOAIr+lzOIQ=3D=3D?=
Cc:     James Seo <james@equiv.tech>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Entity-ID: Y+qgTyM7KJvXcwsg19bS4g==
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FUZZY_MILLION,MISSING_HEADERS,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hewlett-Packard (and some HP Compaq) business-class computers report
hardware monitoring information via WMI. This driver exposes that
information to hwmon.

Initial support is provided for temperature, fan speed, and intrusion
sensor types. Provisional support is provided for voltage and current
sensor types.

HP's WMI implementation permits many other types of numeric sensors.
Therefore, a debugfs interface is also provided to enumerate and
inspect all numeric sensors visible on the WMI side. This should
facilitate adding support for other sensor types in the future.

Tested on a HP Z420, a HP EliteOne 800 G1, and a HP Compaq Elite 8300
SFF.

Note that provisionally supported sensor types are untested and seem
to be rare-to-nonexistent in the wild, having been encountered
neither on test systems nor in ACPI dumps from the Linux Hardware
Database. They are included because their general popularity makes
their presence on past or future HP systems plausible and because no
doubt exists as to how the sensors themselves would be represented in
WMI (alarm attributes will need to wait for hardware to be located).
A 2005 HP whitepaper gives the relevant sensor object MOF definition
and sensor value scaling calculation, and both this driver and the
official HP Performance Advisor utility comply with them (confirmed
in the latter case by reverse engineering).

Link: https://h20331.www2.hp.com/hpsub/downloads/cmi_whitepaper.pdf
Signed-off-by: James Seo <james@equiv.tech>

---

Changes in v3:
* Address reviewer comments
  - Filter out only disconnected sensors
  - Remove unnecessary GUID check
  - Add comment about HP's odd choice of fan RPM sensor type
  - Detect fault condition in a more nuanced manner
  - Change format string for debugfs root directory name
  - Don't have an else branch after return in an if statement
  - Don't goto a return statement without cleanup before it
  - Remove unused pointer from driver state struct
* Cleanups and minor changes
  - Add support for "Temperature Index" Celsius sensors
  - Adjust a goto to avoid an unnecessary call to kfree()
  - Trim strings received from WMI
  - Reword help entry in Kconfig
* Implement temperature, fan, and intrusion alarm attributes
* Expose "platform events" used for alarms in debugfs
* Significantly rework driver initialization
* Update commit message
* Update documentation

Changes in v2:
* Cleanups and minor changes
  - Remove stray #include
  - Use DIV_ROUND_CLOSEST in F to C conversion
  - Consolidate uses of mutex_lock()/mutex_unlock()
  - Process sensors in forward order by type
* Update commit message
* Update documentation

History:
v2: https://lore.kernel.org/linux-hwmon/20230406152321.42010-1-james@equiv.tech/
v1: https://lore.kernel.org/linux-hwmon/20230403084859.26286-1-james@equiv.tech/
---
 Documentation/hwmon/hp-wmi-sensors.rst |  137 ++
 Documentation/hwmon/index.rst          |    1 +
 MAINTAINERS                            |    7 +
 drivers/hwmon/Kconfig                  |   12 +
 drivers/hwmon/Makefile                 |    1 +
 drivers/hwmon/hp-wmi-sensors.c         | 1883 ++++++++++++++++++++++++
 6 files changed, 2041 insertions(+)
 create mode 100644 Documentation/hwmon/hp-wmi-sensors.rst
 create mode 100644 drivers/hwmon/hp-wmi-sensors.c

diff --git a/Documentation/hwmon/hp-wmi-sensors.rst b/Documentation/hwmon/hp-wmi-sensors.rst
new file mode 100644
index 000000000000..bbc2aee95d72
--- /dev/null
+++ b/Documentation/hwmon/hp-wmi-sensors.rst
@@ -0,0 +1,137 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+.. include:: <isonum.txt>
+
+Linux HP WMI Sensors Driver
+===========================
+
+:Copyright: |copy| 2023 James Seo <james@equiv.tech>
+
+Description
+-----------
+
+Hewlett-Packard (and some HP Compaq) business-class computers report hardware
+monitoring information via Windows Management Instrumentation (WMI). This
+driver exposes that information to the Linux ``hwmon`` subsystem, allowing
+userspace utilities like ``sensors`` to gather numeric sensor readings.
+
+``sysfs`` interface
+-------------------
+
+When the driver is loaded, it discovers the sensors available on the current
+system and creates the following ``sysfs`` attributes as necessary within
+``/sys/class/hwmon/hwmon[X]``:
+
+(``[X]`` is some number that depends on other system components.)
+
+======================= ======= ===================================
+Name			Perm	Description
+======================= ======= ===================================
+curr[X]_input           RO      Current in milliamperes (mA).
+curr[X]_label           RO      Current sensor label.
+fan[X]_input            RO      Fan speed in RPM.
+fan[X]_label            RO      Fan sensor label.
+fan[X]_fault            RO      Fan sensor fault indicator.
+fan[X]_alarm            RO      Fan sensor alarm indicator.
+in[X]_input             RO      Voltage in millivolts (mV).
+in[X]_label             RO      Voltage sensor label.
+temp[X]_input           RO      Temperature in millidegrees Celsius
+                                (m\ |deg|\ C).
+temp[X]_label           RO      Temperature sensor label.
+temp[X]_fault           RO      Temperature sensor fault indicator.
+temp[X]_alarm           RO      Temperature sensor alarm indicator.
+intrusion[X]_alarm      RW      Chassis intrusion alarm indicator.
+======================= ======= ===================================
+
+``fault`` attributes
+  Reading ``1`` instead of ``0`` as the ``fault`` attribute for a sensor
+  indicates that it has encountered some issue during operation such that
+  measurements from it should not be trusted. If a sensor with the fault
+  condition later recovers, reading this attribute will return ``0`` again.
+
+``alarm`` attributes
+  Reading ``1`` instead of ``0`` as the ``alarm`` attribute for a sensor
+  indicates that one of the following has occurred, depending on its type:
+
+  - ``fan``: The fan has stalled or been disconnected while running.
+  - ``temp``: The sensor reading has reached a critical threshold. The exact
+    threshold is system-dependent.
+  - ``intrusion``: The system's chassis has been opened.
+
+  After ``1`` is read from an ``alarm`` attribute, the attribute resets itself
+  and returns ``0`` on subsequent reads. As an exception, an
+  ``intrusion[X]_alarm`` can only be manually reset by writing ``0`` to it.
+
+``debugfs`` interface
+---------------------
+
+.. warning:: The ``debugfs`` interface is only available when the kernel is
+             compiled with option ``CONFIG_DEBUG_FS``, and is subject to
+             change without notice at any time.
+
+The standard ``hwmon`` interface in ``sysfs`` exposes sensors of several
+common types that are connected as of driver initialization. However, there
+are usually other sensors on the WMI side that do not meet these criteria.
+In addition, a number of system-dependent "platform events" used for ``alarm``
+attributes may be present. A ``debugfs`` interface is therefore provided for
+read-only access to *all* HP WMI sensors and platform events on the system.
+
+``/sys/kernel/debug/hp-wmi-sensors-[X]/sensor``
+contains one numbered entry per sensor with the following attributes:
+
+=============================== =======================================
+Name				Example
+=============================== =======================================
+name                            ``CPU0 Fan``
+description                     ``Reports CPU0 fan speed``
+sensor_type                     ``12``
+other_sensor_type               (an empty string)
+operational_status              ``2``
+current_state                   ``Normal``
+possible_states                 ``Normal,Caution,Critical,Not Present``
+base_units                      ``19``
+unit_modifier                   ``0``
+current_reading                 ``1008``
+=============================== =======================================
+
+``/sys/kernel/debug/hp-wmi-sensors-[X]/platform_events``
+contains one numbered entry per platform event with the following attributes:
+
+=============================== ====================
+Name				Example
+=============================== ====================
+name                            ``CPU0 Fan Stall``
+description                     ``CPU0 Fan Speed``
+source_namespace                ``root\wmi``
+source_class                    ``HPBIOS_BIOSEvent``
+category                        ``3``
+possible_severity               ``25``
+possible_status                 ``5``
+=============================== ====================
+
+These represent the properties of the underlying ``HPBIOS_BIOSNumericSensor``
+and ``HPBIOS_PlatformEvents`` WMI objects, which vary between systems. See
+[#]_ for more details, including Managed Object Format (MOF) definitions.
+
+Known issues and limitations
+----------------------------
+
+- If the existing ``hp-wmi`` driver for non-business-class HP systems is
+  already loaded, ``alarm`` attributes will be unavailable. This is because
+  the same WMI event GUID used by this driver for ``alarm`` attributes is
+  used on those systems for e.g. laptop hotkeys.
+- Dubious sensor hardware and inconsistent system WMI implementations have
+  been observed to cause inaccurate readings and peculiar behavior, such as
+  alarms failing to occur or occurring only once per boot.
+- Only temperature, fan speed, and intrusion sensor types have been seen in
+  the wild so far. Support for voltage and current sensors is therefore
+  provisional.
+- Although HP WMI sensors may claim to be of any type, any oddball sensor
+  types unknown to hwmon will not be supported.
+
+References
+----------
+
+.. [#] Hewlett-Packard Development Company, L.P.,
+       "HP Client Management Interface Technical White Paper", 2005. [Online].
+       Available: https://h20331.www2.hp.com/hpsub/downloads/cmi_whitepaper.pdf
diff --git a/Documentation/hwmon/index.rst b/Documentation/hwmon/index.rst
index f1fe75f596a5..f8f3c0bef6ed 100644
--- a/Documentation/hwmon/index.rst
+++ b/Documentation/hwmon/index.rst
@@ -77,6 +77,7 @@ Hardware Monitoring Kernel Drivers
    gl518sm
    gxp-fan-ctrl
    hih6130
+   hp-wmi-sensors
    ibmaem
    ibm-cffps
    ibmpowernv
diff --git a/MAINTAINERS b/MAINTAINERS
index c6545eb54104..237cbb40bd41 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9373,6 +9373,13 @@ L:	platform-driver-x86@vger.kernel.org
 S:	Orphan
 F:	drivers/platform/x86/hp/tc1100-wmi.c
 
+HP WMI HARDWARE MONITOR DRIVER
+M:	James Seo <james@equiv.tech>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/hwmon/hp-wmi-sensors.rst
+F:	drivers/hwmon/hp-wmi-sensors.c
+
 HPET:	High Precision Event Timers driver
 M:	Clemens Ladisch <clemens@ladisch.de>
 S:	Maintained
diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 5b3b76477b0e..e330f439f4a6 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2399,6 +2399,18 @@ config SENSORS_ASUS_EC
 	  This driver can also be built as a module. If so, the module
 	  will be called asus_ec_sensors.
 
+config SENSORS_HP_WMI
+	tristate "HP WMI Sensors"
+	depends on ACPI_WMI
+	help
+	  If you say yes here you get support for the ACPI hardware monitoring
+	  interface found in HP (and some HP Compaq) business-class computers.
+	  Available sensors vary between systems. Temperature and fan speed
+	  sensors are the most common.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called hp_wmi_sensors.
+
 endif # ACPI
 
 endif # HWMON
diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
index 88712b5031c8..05cce16f37f6 100644
--- a/drivers/hwmon/Makefile
+++ b/drivers/hwmon/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SENSORS_ACPI_POWER) += acpi_power_meter.o
 obj-$(CONFIG_SENSORS_ATK0110)	+= asus_atk0110.o
 obj-$(CONFIG_SENSORS_ASUS_EC)	+= asus-ec-sensors.o
 obj-$(CONFIG_SENSORS_ASUS_WMI)	+= asus_wmi_sensors.o
+obj-$(CONFIG_SENSORS_HP_WMI)	+= hp-wmi-sensors.o
 
 # Native drivers
 # asb100, then w83781d go first, as they can override other drivers' addresses.
diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
new file mode 100644
index 000000000000..f66d7599f802
--- /dev/null
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -0,0 +1,1883 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * hwmon driver for HP (and some HP Compaq) business-class computers that
+ * report numeric sensor data via Windows Management Instrumentation (WMI).
+ *
+ * Copyright (C) 2023 James Seo <james@equiv.tech>
+ *
+ * References:
+ * [1] Hewlett-Packard Development Company, L.P.,
+ *     "HP Client Management Interface Technical White Paper", 2005. [Online].
+ *     Available: https://h20331.www2.hp.com/hpsub/downloads/cmi_whitepaper.pdf
+ * [2] Hewlett-Packard Development Company, L.P.,
+ *     "HP Retail Manageability", 2012. [Online].
+ *     Available: http://h10032.www1.hp.com/ctg/Manual/c03291135.pdf
+ * [3] Linux Hardware Project, A. Ponomarenko et al.,
+ *     "linuxhw/ACPI - Collect ACPI table dumps", 2018. [Online].
+ *     Available: https://github.com/linuxhw/ACPI/
+ */
+
+#include <linux/acpi.h>
+#include <linux/debugfs.h>
+#include <linux/hwmon.h>
+#include <linux/jiffies.h>
+#include <linux/mutex.h>
+#include <linux/units.h>
+#include <linux/wmi.h>
+
+#define HP_WMI_EVENT_GUID		 "95F24279-4D7B-4334-9387-ACCDC67EF61C"
+#define HP_WMI_NUMERIC_SENSOR_GUID	 "8F1F6435-9F42-42C8-BADC-0E9424F20C9A"
+#define HP_WMI_PLATFORM_EVENTS_GUID	 "41227C2D-80E1-423F-8B8E-87E32755A0EB"
+#define HP_WMI_PLATFORM_EVENTS_CLASS	 "HPBIOS_BIOSEvent"
+#define HP_WMI_PLATFORM_EVENTS_NAMESPACE "root\\WMI"
+
+/* Patterns for recognizing sensors and matching events to channels. */
+
+#define HP_WMI_PATTERN_SYS_TEMP2	 "System Ambient Temperature"
+#define HP_WMI_PATTERN_SYS_TEMP		 "Chassis Thermal Index"
+#define HP_WMI_PATTERN_CPU_TEMP		 "CPU Thermal Index"
+#define HP_WMI_PATTERN_CPU_TEMP2	 "CPU Temperature"
+#define HP_WMI_PATTERN_TEMP_SENSOR	 "Thermal Index"
+#define HP_WMI_PATTERN_TEMP_ALARM	 "Thermal Critical"
+#define HP_WMI_PATTERN_INTRUSION_ALARM	 "Hood Intrusion"
+#define HP_WMI_PATTERN_FAN_ALARM	 "Stall"
+#define HP_WMI_PATTERN_TEMP		 "Temperature"
+#define HP_WMI_PATTERN_CPU		 "CPU"
+
+/* These limits are arbitrary. The WMI implementation may vary by system. */
+
+#define HP_WMI_MAX_STR_SIZE		 128U
+#define HP_WMI_MAX_PROPERTIES		 32U
+#define HP_WMI_MAX_INSTANCES		 32U
+
+enum hp_wmi_type {
+	HP_WMI_TYPE_OTHER			   = 1,
+	HP_WMI_TYPE_TEMPERATURE			   = 2,
+	HP_WMI_TYPE_VOLTAGE			   = 3,
+	HP_WMI_TYPE_CURRENT			   = 4,
+	HP_WMI_TYPE_AIR_FLOW			   = 12,
+	HP_WMI_TYPE_INTRUSION			   = 0xabadb01, /* Custom. */
+};
+
+enum hp_wmi_category {
+	HP_WMI_CATEGORY_SENSOR			   = 3,
+};
+
+enum hp_wmi_severity {
+	HP_WMI_SEVERITY_UNKNOWN			   = 0,
+	HP_WMI_SEVERITY_OK			   = 5,
+	HP_WMI_SEVERITY_DEGRADED_WARNING	   = 10,
+	HP_WMI_SEVERITY_MINOR_FAILURE		   = 15,
+	HP_WMI_SEVERITY_MAJOR_FAILURE		   = 20,
+	HP_WMI_SEVERITY_CRITICAL_FAILURE	   = 25,
+	HP_WMI_SEVERITY_NON_RECOVERABLE_ERROR	   = 30,
+};
+
+enum hp_wmi_status {
+	HP_WMI_STATUS_OK			   = 2,
+	HP_WMI_STATUS_DEGRADED			   = 3,
+	HP_WMI_STATUS_STRESSED			   = 4,
+	HP_WMI_STATUS_PREDICTIVE_FAILURE	   = 5,
+	HP_WMI_STATUS_ERROR			   = 6,
+	HP_WMI_STATUS_NON_RECOVERABLE_ERROR	   = 7,
+	HP_WMI_STATUS_NO_CONTACT		   = 12,
+	HP_WMI_STATUS_LOST_COMMUNICATION	   = 13,
+	HP_WMI_STATUS_ABORTED			   = 14,
+	HP_WMI_STATUS_SUPPORTING_ENTITY_IN_ERROR   = 16,
+
+	/* Occurs combined with one of "OK", "Degraded", and "Error" [1]. */
+	HP_WMI_STATUS_COMPLETED			   = 17,
+};
+
+enum hp_wmi_units {
+	HP_WMI_UNITS_OTHER			   = 1,
+	HP_WMI_UNITS_DEGREES_C			   = 2,
+	HP_WMI_UNITS_DEGREES_F			   = 3,
+	HP_WMI_UNITS_DEGREES_K			   = 4,
+	HP_WMI_UNITS_VOLTS			   = 5,
+	HP_WMI_UNITS_AMPS			   = 6,
+	HP_WMI_UNITS_RPM			   = 19,
+};
+
+enum hp_wmi_property {
+	HP_WMI_PROPERTY_NAME			   = 0,
+	HP_WMI_PROPERTY_DESCRIPTION		   = 1,
+	HP_WMI_PROPERTY_SENSOR_TYPE		   = 2,
+	HP_WMI_PROPERTY_OTHER_SENSOR_TYPE	   = 3,
+	HP_WMI_PROPERTY_OPERATIONAL_STATUS	   = 4,
+	HP_WMI_PROPERTY_CURRENT_STATE		   = 5,
+	HP_WMI_PROPERTY_POSSIBLE_STATES		   = 6,
+	HP_WMI_PROPERTY_BASE_UNITS		   = 7,
+	HP_WMI_PROPERTY_UNIT_MODIFIER		   = 8,
+	HP_WMI_PROPERTY_CURRENT_READING		   = 9,
+};
+
+static const acpi_object_type hp_wmi_property_map[] = {
+	[HP_WMI_PROPERTY_NAME]			   = ACPI_TYPE_STRING,
+	[HP_WMI_PROPERTY_DESCRIPTION]		   = ACPI_TYPE_STRING,
+	[HP_WMI_PROPERTY_SENSOR_TYPE]		   = ACPI_TYPE_INTEGER,
+	[HP_WMI_PROPERTY_OTHER_SENSOR_TYPE]	   = ACPI_TYPE_STRING,
+	[HP_WMI_PROPERTY_OPERATIONAL_STATUS]	   = ACPI_TYPE_INTEGER,
+	[HP_WMI_PROPERTY_CURRENT_STATE]		   = ACPI_TYPE_STRING,
+	[HP_WMI_PROPERTY_POSSIBLE_STATES]	   = ACPI_TYPE_STRING,
+	[HP_WMI_PROPERTY_BASE_UNITS]		   = ACPI_TYPE_INTEGER,
+	[HP_WMI_PROPERTY_UNIT_MODIFIER]		   = ACPI_TYPE_INTEGER,
+	[HP_WMI_PROPERTY_CURRENT_READING]	   = ACPI_TYPE_INTEGER,
+};
+
+enum hp_wmi_platform_events_property {
+	HP_WMI_PLATFORM_EVENTS_PROPERTY_NAME		    = 0,
+	HP_WMI_PLATFORM_EVENTS_PROPERTY_DESCRIPTION	    = 1,
+	HP_WMI_PLATFORM_EVENTS_PROPERTY_SOURCE_NAMESPACE    = 2,
+	HP_WMI_PLATFORM_EVENTS_PROPERTY_SOURCE_CLASS	    = 3,
+	HP_WMI_PLATFORM_EVENTS_PROPERTY_CATEGORY	    = 4,
+	HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_SEVERITY   = 5,
+	HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_STATUS	    = 6,
+};
+
+static const acpi_object_type hp_wmi_platform_events_property_map[] = {
+	[HP_WMI_PLATFORM_EVENTS_PROPERTY_NAME]		    = ACPI_TYPE_STRING,
+	[HP_WMI_PLATFORM_EVENTS_PROPERTY_DESCRIPTION]	    = ACPI_TYPE_STRING,
+	[HP_WMI_PLATFORM_EVENTS_PROPERTY_SOURCE_NAMESPACE]  = ACPI_TYPE_STRING,
+	[HP_WMI_PLATFORM_EVENTS_PROPERTY_SOURCE_CLASS]	    = ACPI_TYPE_STRING,
+	[HP_WMI_PLATFORM_EVENTS_PROPERTY_CATEGORY]	    = ACPI_TYPE_INTEGER,
+	[HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_SEVERITY] = ACPI_TYPE_INTEGER,
+	[HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_STATUS]   = ACPI_TYPE_INTEGER,
+};
+
+enum hp_wmi_event_property {
+	HP_WMI_EVENT_PROPERTY_NAME		   = 0,
+	HP_WMI_EVENT_PROPERTY_DESCRIPTION	   = 1,
+	HP_WMI_EVENT_PROPERTY_CATEGORY		   = 2,
+	HP_WMI_EVENT_PROPERTY_SEVERITY		   = 3,
+	HP_WMI_EVENT_PROPERTY_STATUS		   = 4,
+};
+
+static const acpi_object_type hp_wmi_event_property_map[] = {
+	[HP_WMI_EVENT_PROPERTY_NAME]		   = ACPI_TYPE_STRING,
+	[HP_WMI_EVENT_PROPERTY_DESCRIPTION]	   = ACPI_TYPE_STRING,
+	[HP_WMI_EVENT_PROPERTY_CATEGORY]	   = ACPI_TYPE_INTEGER,
+	[HP_WMI_EVENT_PROPERTY_SEVERITY]	   = ACPI_TYPE_INTEGER,
+	[HP_WMI_EVENT_PROPERTY_STATUS]		   = ACPI_TYPE_INTEGER,
+};
+
+static const enum hwmon_sensor_types hp_wmi_hwmon_type_map[] = {
+	[HP_WMI_TYPE_TEMPERATURE]		   = hwmon_temp,
+	[HP_WMI_TYPE_VOLTAGE]			   = hwmon_in,
+	[HP_WMI_TYPE_CURRENT]			   = hwmon_curr,
+	[HP_WMI_TYPE_AIR_FLOW]			   = hwmon_fan,
+};
+
+static const u32 hp_wmi_hwmon_attributes[hwmon_max] = {
+	[hwmon_chip]	  = HWMON_C_REGISTER_TZ,
+	[hwmon_temp]	  = HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_FAULT,
+	[hwmon_in]	  = HWMON_I_INPUT | HWMON_I_LABEL,
+	[hwmon_curr]	  = HWMON_C_INPUT | HWMON_C_LABEL,
+	[hwmon_fan]	  = HWMON_F_INPUT | HWMON_F_LABEL | HWMON_F_FAULT,
+	[hwmon_intrusion] = HWMON_INTRUSION_ALARM,
+};
+
+/*
+ * struct hp_wmi_numeric_sensor - a HPBIOS_BIOSNumericSensor instance
+ *
+ * MOF definition [1]:
+ *
+ *   #pragma namespace("\\\\.\\root\\HP\\InstrumentedBIOS");
+ *
+ *   [abstract]
+ *   class HP_BIOSSensor
+ *   {
+ *     [read] string Name;
+ *     [read] string Description;
+ *     [read, ValueMap {"0","1","2","3","4","5","6","7","8","9",
+ *      "10","11","12"}, Values {"Unknown","Other","Temperature",
+ *      "Voltage","Current","Tachometer","Counter","Switch","Lock",
+ *      "Humidity","Smoke Detection","Presence","Air Flow"}]
+ *     uint32 SensorType;
+ *     [read] string OtherSensorType;
+ *     [read, ValueMap {"0","1","2","3","4","5","6","7","8","9",
+ *      "10","11","12","13","14","15","16","17","18","..",
+ *      "0x8000.."}, Values {"Unknown","Other","OK","Degraded",
+ *      "Stressed","Predictive Failure","Error",
+ *      "Non-Recoverable Error","Starting","Stopping","Stopped",
+ *      "In Service","No Contact","Lost Communication","Aborted",
+ *      "Dormant","Supporting Entity in Error","Completed",
+ *      "Power Mode","DMTF Reserved","Vendor Reserved"}]
+ *     uint32 OperationalStatus;
+ *     [read] string CurrentState;
+ *     [read] string PossibleStates[];
+ *   };
+ *
+ *   class HP_BIOSNumericSensor : HP_BIOSSensor
+ *   {
+ *     [read, ValueMap {"0","1","2","3","4","5","6","7","8","9",
+ *      "10","11","12","13","14","15","16","17","18","19","20",
+ *      "21","22","23","24","25","26","27","28","29","30","31",
+ *      "32","33","34","35","36","37","38","39","40","41","42",
+ *      "43","44","45","46","47","48","49","50","51","52","53",
+ *      "54","55","56","57","58","59","60","61","62","63","64",
+ *      "65"}, Values {"Unknown","Other","Degrees C","Degrees F",
+ *      "Degrees K","Volts","Amps","Watts","Joules","Coulombs",
+ *      "VA","Nits","Lumens","Lux","Candelas","kPa","PSI",
+ *      "Newtons","CFM","RPM","Hertz","Seconds","Minutes",
+ *      "Hours","Days","Weeks","Mils","Inches","Feet",
+ *      "Cubic Inches","Cubic Feet","Meters","Cubic Centimeters",
+ *      "Cubic Meters","Liters","Fluid Ounces","Radians",
+ *      "Steradians","Revolutions","Cycles","Gravities","Ounces",
+ *      "Pounds","Foot-Pounds","Ounce-Inches","Gauss","Gilberts",
+ *      "Henries","Farads","Ohms","Siemens","Moles","Becquerels",
+ *      "PPM (parts/million)","Decibels","DbA","DbC","Grays",
+ *      "Sieverts","Color Temperature Degrees K","Bits","Bytes",
+ *      "Words (data)","DoubleWords","QuadWords","Percentage"}]
+ *     uint32 BaseUnits;
+ *     [read] sint32 UnitModifier;
+ *     [read] uint32 CurrentReading;
+ *   };
+ *
+ *   class HPBIOS_BIOSNumericSensor : HP_BIOSNumericSensor
+ *   {
+ *   };
+ */
+struct hp_wmi_numeric_sensor {
+	const char *name;
+	const char *description;
+	u32 sensor_type;
+	const char *other_sensor_type; /* Explains "Other" SensorType. */
+	u32 operational_status;
+	const char *current_state;
+	const char **possible_states;  /* Count may vary. */
+	u32 base_units;
+	s32 unit_modifier;
+	u32 current_reading;
+
+	u8 possible_states_count;
+};
+
+/*
+ * struct hp_wmi_platform_events - a HPBIOS_PlatformEvents instance
+ *
+ * Instances of this object reveal the set of possible HPBIOS_BIOSEvent
+ * instances for the current system, but it may not always be present.
+ *
+ * MOF definition:
+ *
+ *   #pragma namespace("\\\\.\\root\\HP\\InstrumentedBIOS");
+ *
+ *   [abstract]
+ *   class HP_PlatformEvents
+ *   {
+ *     [read] string Name;
+ *     [read] string Description;
+ *     [read] string SourceNamespace;
+ *     [read] string SourceClass;
+ *     [read, ValueMap {"0","1","2","3","4",".."}, Values {
+ *      "Unknown","Configuration Change","Button Pressed",
+ *      "Sensor","BIOS Settings","Reserved"}]
+ *     uint32 Category;
+ *     [read, ValueMap{"0","5","10","15","20","25","30",".."},
+ *      Values{"Unknown","OK","Degraded/Warning","Minor Failure",
+ *      "Major Failure","Critical Failure","Non-recoverable Error",
+ *      "DMTF Reserved"}]
+ *     uint32 PossibleSeverity;
+ *     [read, ValueMap {"0","1","2","3","4","5","6","7","8","9",
+ *      "10","11","12","13","14","15","16","17","18","..",
+ *      "0x8000.."}, Values {"Unknown","Other","OK","Degraded",
+ *      "Stressed","Predictive Failure","Error",
+ *      "Non-Recoverable Error","Starting","Stopping","Stopped",
+ *      "In Service","No Contact","Lost Communication","Aborted",
+ *      "Dormant","Supporting Entity in Error","Completed",
+ *      "Power Mode","DMTF Reserved","Vendor Reserved"}]
+ *     uint32 PossibleStatus;
+ *   };
+ *
+ *   class HPBIOS_PlatformEvents : HP_PlatformEvents
+ *   {
+ *   };
+ */
+struct hp_wmi_platform_events {
+	const char *name;
+	const char *description;
+	const char *source_namespace;
+	const char *source_class;
+	u32 category;
+	u32 possible_severity;
+	u32 possible_status;
+};
+
+/*
+ * struct hp_wmi_event - a HPBIOS_BIOSEvent instance
+ *
+ * MOF definition [1] (corrected below from original):
+ *
+ *   #pragma namespace("\\\\.\\root\\WMI");
+ *
+ *   class HP_BIOSEvent : WMIEvent
+ *   {
+ *     [read] string Name;
+ *     [read] string Description;
+ *     [read ValueMap {"0","1","2","3","4"}, Values {"Unknown",
+ *      "Configuration Change","Button Pressed","Sensor",
+ *      "BIOS Settings"}]
+ *     uint32 Category;
+ *     [read, ValueMap {"0","5","10","15","20","25","30"},
+ *      Values {"Unknown","OK","Degraded/Warning",
+ *      "Minor Failure","Major Failure","Critical Failure",
+ *      "Non-recoverable Error"}]
+ *     uint32 Severity;
+ *     [read, ValueMap {"0","1","2","3","4","5","6","7","8",
+ *      "9","10","11","12","13","14","15","16","17","18","..",
+ *      "0x8000.."}, Values {"Unknown","Other","OK","Degraded",
+ *      "Stressed","Predictive Failure","Error",
+ *      "Non-Recoverable Error","Starting","Stopping","Stopped",
+ *      "In Service","No Contact","Lost Communication","Aborted",
+ *      "Dormant","Supporting Entity in Error","Completed",
+ *      "Power Mode","DMTF Reserved","Vendor Reserved"}]
+ *     uint32 Status;
+ *   };
+ *
+ *   class HPBIOS_BIOSEvent : HP_BIOSEvent
+ *   {
+ *   };
+ */
+struct hp_wmi_event {
+	const char *name;
+	const char *description;
+	u32 category;
+};
+
+/*
+ * struct hp_wmi_info - sensor info
+ * @nsensor: numeric sensor properties
+ * @instance: its WMI instance number
+ * @is_active: whether the following fields are valid
+ * @has_alarm: whether sensor has an alarm flag
+ * @alarm: alarm flag
+ * @type: its hwmon sensor type
+ * @cached_val: current sensor reading value, scaled for hwmon
+ * @last_updated: when these readings were last updated
+ */
+struct hp_wmi_info {
+	struct hp_wmi_numeric_sensor nsensor;
+	u8 instance;
+
+	bool is_active;
+	bool has_alarm;
+	bool alarm;
+	enum hwmon_sensor_types type;
+	long cached_val;
+	unsigned long last_updated; /* in jiffies */
+
+};
+
+/*
+ * struct hp_wmi_sensors - driver state
+ * @wdev: pointer to the parent WMI device
+ * @pevents: platform events structs for all platform events visible in WMI
+ * @info: sensor info structs for all sensors visible in WMI
+ * @info_map: access info structs by hwmon type and channel number
+ * @count: count of all sensors visible in WMI
+ * @channel_count: count of hwmon channels by hwmon type
+ * @pevents_count: count of all platform events visible in WMI
+ * @has_intrusion: whether an intrusion sensor is present
+ * @intrusion: intrusion flag
+ * @lock: mutex to lock polling WMI and changes to driver state
+ */
+struct hp_wmi_sensors {
+	struct wmi_device *wdev;
+	struct hp_wmi_info info[HP_WMI_MAX_INSTANCES];
+	struct hp_wmi_info **info_map[hwmon_max];
+	struct hp_wmi_platform_events pevents[HP_WMI_MAX_INSTANCES];
+	u8 count;
+	u8 channel_count[hwmon_max];
+	u8 pevents_count;
+	bool has_intrusion;
+	bool intrusion;
+
+	struct mutex lock; /* lock polling WMI, driver state changes */
+};
+
+/* hp_wmi_strdup - devm_kstrdup, but length-limited */
+static char *hp_wmi_strdup(struct device *dev, const char *src)
+{
+	char *dst;
+	size_t len;
+
+	len = strnlen(src, HP_WMI_MAX_STR_SIZE - 1);
+
+	dst = devm_kmalloc(dev, (len + 1) * sizeof(*dst), GFP_KERNEL);
+	if (!dst)
+		return NULL;
+
+	strscpy(dst, src, len + 1);
+
+	return dst;
+}
+
+/*
+ * hp_wmi_get_wobj - poll WMI for a WMI object instance
+ * @guid: WMI object GUID
+ * @instance: WMI object instance number
+ *
+ * Returns a new WMI object instance on success, or NULL on error.
+ * Caller must kfree the result.
+ */
+static union acpi_object *hp_wmi_get_wobj(const char *guid, u8 instance)
+{
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	acpi_status err;
+
+	err = wmi_query_block(guid, instance, &out);
+	if (ACPI_FAILURE(err))
+		return NULL;
+
+	return out.pointer;
+}
+
+static int check_wobj(const union acpi_object *wobj,
+		      const acpi_object_type property_map[], int last_prop)
+{
+	acpi_object_type type = wobj->type;
+	acpi_object_type valid_type;
+	union acpi_object *elements;
+	u32 elem_count;
+	int prop;
+
+	if (type != ACPI_TYPE_PACKAGE)
+		return -EINVAL;
+
+	elem_count = wobj->package.count;
+	if (elem_count != last_prop + 1)
+		return -EINVAL;
+
+	elements = wobj->package.elements;
+	for (prop = 0; prop <= last_prop; prop++) {
+		type = elements[prop].type;
+		valid_type = property_map[prop];
+		if (type != valid_type)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int extract_acpi_value(struct device *dev, union acpi_object *element,
+			      acpi_object_type type, u32 *value, char **string)
+{
+	switch (type) {
+	case ACPI_TYPE_INTEGER:
+		*value = element->integer.value;
+		break;
+
+	case ACPI_TYPE_STRING:
+		*string = hp_wmi_strdup(dev, strim(element->string.pointer));
+		if (!*string)
+			return -ENOMEM;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+/*
+ * check_numeric_sensor_wobj - validate a HPBIOS_BIOSNumericSensor instance
+ * @wobj: pointer to WMI object instance to check
+ * @possible_states_count: out pointer to count of possible states
+ *
+ * Returns 0 on success, or a negative error code on error.
+ */
+static int check_numeric_sensor_wobj(const union acpi_object *wobj,
+				     u8 *possible_states_count)
+{
+	acpi_object_type type = wobj->type;
+	int prop = HP_WMI_PROPERTY_NAME;
+	acpi_object_type valid_type;
+	union acpi_object *elements;
+	u32 elem_count;
+	u8 count = 0;
+	u32 i;
+
+	if (type != ACPI_TYPE_PACKAGE)
+		return -EINVAL;
+
+	elem_count = wobj->package.count;
+	if (elem_count > HP_WMI_MAX_PROPERTIES)
+		return -EINVAL;
+
+	elements = wobj->package.elements;
+	for (i = 0; i < elem_count; i++, prop++) {
+		if (prop > HP_WMI_PROPERTY_CURRENT_READING)
+			return -EINVAL;
+
+		type = elements[i].type;
+		valid_type = hp_wmi_property_map[prop];
+		if (type != valid_type)
+			return -EINVAL;
+
+		/*
+		 * elements is a variable-length array of ACPI objects, one for
+		 * each property of the WMI object instance, except that the
+		 * strs in PossibleStates[] are flattened into this array, and
+		 * their count is found in the WMI BMOF. We don't decode the
+		 * BMOF, so find the count by finding the next int.
+		 */
+
+		if (prop == HP_WMI_PROPERTY_CURRENT_STATE) {
+			prop = HP_WMI_PROPERTY_POSSIBLE_STATES;
+			valid_type = hp_wmi_property_map[prop];
+			for (; i + 1 < elem_count; i++, count++) {
+				type = elements[i + 1].type;
+				if (type != valid_type)
+					break;
+			}
+		}
+	}
+
+	if (!count || prop <= HP_WMI_PROPERTY_CURRENT_READING)
+		return -EINVAL;
+
+	*possible_states_count = count;
+
+	return 0;
+}
+
+static int
+numeric_sensor_is_connected(const struct hp_wmi_numeric_sensor *nsensor)
+{
+	u32 operational_status = nsensor->operational_status;
+
+	return operational_status != HP_WMI_STATUS_NO_CONTACT;
+}
+
+static int numeric_sensor_has_fault(const struct hp_wmi_numeric_sensor *nsensor)
+{
+	u32 operational_status = nsensor->operational_status;
+
+	switch (operational_status) {
+	case HP_WMI_STATUS_DEGRADED:
+	case HP_WMI_STATUS_STRESSED:		/* e.g. Overload, overtemp. */
+	case HP_WMI_STATUS_PREDICTIVE_FAILURE:	/* e.g. Fan removed. */
+	case HP_WMI_STATUS_ERROR:
+	case HP_WMI_STATUS_NON_RECOVERABLE_ERROR:
+	case HP_WMI_STATUS_NO_CONTACT:
+	case HP_WMI_STATUS_LOST_COMMUNICATION:
+	case HP_WMI_STATUS_ABORTED:
+	case HP_WMI_STATUS_SUPPORTING_ENTITY_IN_ERROR:
+
+	/* Assume combination by addition; bitwise OR doesn't make sense. */
+	case HP_WMI_STATUS_COMPLETED + HP_WMI_STATUS_DEGRADED:
+	case HP_WMI_STATUS_COMPLETED + HP_WMI_STATUS_ERROR:
+		return true;
+	}
+
+	return false;
+}
+
+/* scale_numeric_sensor - scale sensor reading for hwmon */
+static long scale_numeric_sensor(const struct hp_wmi_numeric_sensor *nsensor)
+{
+	u32 current_reading = nsensor->current_reading;
+	s32 unit_modifier = nsensor->unit_modifier;
+	u32 sensor_type = nsensor->sensor_type;
+	u32 base_units = nsensor->base_units;
+	s32 target_modifier;
+	long val;
+
+	/* Fan readings are in RPM units; others are in milliunits. */
+	target_modifier = sensor_type == HP_WMI_TYPE_AIR_FLOW ? 0 : -3;
+
+	val = current_reading;
+
+	for (; unit_modifier < target_modifier; unit_modifier++)
+		val = DIV_ROUND_CLOSEST(val, 10);
+
+	for (; unit_modifier > target_modifier; unit_modifier--) {
+		if (val > LONG_MAX / 10) {
+			val = LONG_MAX;
+			break;
+		}
+		val *= 10;
+	}
+
+	if (sensor_type == HP_WMI_TYPE_TEMPERATURE) {
+		switch (base_units) {
+		case HP_WMI_UNITS_DEGREES_F:
+			val -= MILLI * 32;
+			val = val <= LONG_MAX / 5 ?
+				      DIV_ROUND_CLOSEST(val * 5, 9) :
+				      DIV_ROUND_CLOSEST(val, 9) * 5;
+			break;
+
+		case HP_WMI_UNITS_DEGREES_K:
+			val = milli_kelvin_to_millicelsius(val);
+			break;
+		}
+	}
+
+	return val;
+}
+
+/*
+ * classify_numeric_sensor - classify a numeric sensor
+ * @nsensor: pointer to numeric sensor struct
+ *
+ * Returns an enum hp_wmi_type value on success,
+ * or a negative value if the sensor type is unsupported.
+ */
+static int classify_numeric_sensor(const struct hp_wmi_numeric_sensor *nsensor)
+{
+	u32 sensor_type = nsensor->sensor_type;
+	u32 base_units = nsensor->base_units;
+	const char *name = nsensor->name;
+
+	switch (sensor_type) {
+	case HP_WMI_TYPE_TEMPERATURE:
+		/*
+		 * Some systems have sensors named "X Thermal Index" in "Other"
+		 * units. Tested CPU sensor examples were found to be in �C,
+		 * albeit perhaps "differently" accurate; e.g. readings were
+		 * reliably -6�C vs. coretemp on a HP Compaq Elite 8300, and
+		 * +8�C on an EliteOne G1 800. But this is still within the
+		 * realm of plausibility for cheaply implemented motherboard
+		 * sensors, and chassis readings were about as expected.
+		 */
+		if ((base_units == HP_WMI_UNITS_OTHER &&
+		     strstr(name, HP_WMI_PATTERN_TEMP_SENSOR)) ||
+		    base_units == HP_WMI_UNITS_DEGREES_C ||
+		    base_units == HP_WMI_UNITS_DEGREES_F ||
+		    base_units == HP_WMI_UNITS_DEGREES_K)
+			return HP_WMI_TYPE_TEMPERATURE;
+		break;
+
+	case HP_WMI_TYPE_VOLTAGE:
+		if (base_units == HP_WMI_UNITS_VOLTS)
+			return HP_WMI_TYPE_VOLTAGE;
+		break;
+
+	case HP_WMI_TYPE_CURRENT:
+		if (base_units == HP_WMI_UNITS_AMPS)
+			return HP_WMI_TYPE_CURRENT;
+		break;
+
+	case HP_WMI_TYPE_AIR_FLOW:
+		/*
+		 * Strangely, HP considers fan RPM sensor type to be
+		 * "Air Flow" instead of the more intuitive "Tachometer".
+		 */
+		if (base_units == HP_WMI_UNITS_RPM)
+			return HP_WMI_TYPE_AIR_FLOW;
+		break;
+	}
+
+	return -EINVAL;
+}
+
+static int
+populate_numeric_sensor_from_wobj(struct device *dev,
+				  struct hp_wmi_numeric_sensor *nsensor,
+				  union acpi_object *wobj)
+{
+	const char **possible_states;
+	union acpi_object *element;
+	u8 possible_states_count;
+	acpi_object_type type;
+	char *string;
+	u32 value;
+	int prop;
+	int err;
+
+	err = check_numeric_sensor_wobj(wobj, &possible_states_count);
+	if (err)
+		return err;
+
+	possible_states = devm_kcalloc(dev, possible_states_count,
+				       sizeof(*possible_states),
+				       GFP_KERNEL);
+	if (!possible_states)
+		return -ENOMEM;
+
+	element = wobj->package.elements;
+	nsensor->possible_states = possible_states;
+	nsensor->possible_states_count = possible_states_count;
+
+	for (prop = 0; prop <= HP_WMI_PROPERTY_CURRENT_READING; prop++) {
+		type = hp_wmi_property_map[prop];
+
+		err = extract_acpi_value(dev, element, type, &value, &string);
+		if (err)
+			return err;
+
+		element++;
+
+		switch (prop) {
+		case HP_WMI_PROPERTY_NAME:
+			nsensor->name = string;
+			break;
+
+		case HP_WMI_PROPERTY_DESCRIPTION:
+			nsensor->description = string;
+			break;
+
+		case HP_WMI_PROPERTY_SENSOR_TYPE:
+			if (value > HP_WMI_TYPE_AIR_FLOW)
+				return -EINVAL;
+
+			nsensor->sensor_type = value;
+			break;
+
+		case HP_WMI_PROPERTY_OTHER_SENSOR_TYPE:
+			nsensor->other_sensor_type = string;
+			break;
+
+		case HP_WMI_PROPERTY_OPERATIONAL_STATUS:
+			nsensor->operational_status = value;
+			break;
+
+		case HP_WMI_PROPERTY_CURRENT_STATE:
+			nsensor->current_state = string;
+			break;
+
+		case HP_WMI_PROPERTY_POSSIBLE_STATES:
+			*possible_states++ = string;
+			if (--possible_states_count)
+				prop--;
+			break;
+
+		case HP_WMI_PROPERTY_BASE_UNITS:
+			nsensor->base_units = value;
+			break;
+
+		case HP_WMI_PROPERTY_UNIT_MODIFIER:
+			/* UnitModifier is signed. */
+			nsensor->unit_modifier = (s32)value;
+			break;
+
+		case HP_WMI_PROPERTY_CURRENT_READING:
+			nsensor->current_reading = value;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/* update_numeric_sensor_from_wobj - update fungible sensor properties */
+static void
+update_numeric_sensor_from_wobj(struct device *dev,
+				struct hp_wmi_numeric_sensor *nsensor,
+				const union acpi_object *wobj)
+{
+	const union acpi_object *elements;
+	const union acpi_object *element;
+	const char *string;
+	u8 offset;
+
+	elements = wobj->package.elements;
+
+	element = &elements[HP_WMI_PROPERTY_OPERATIONAL_STATUS];
+	nsensor->operational_status = element->integer.value;
+
+	element = &elements[HP_WMI_PROPERTY_CURRENT_STATE];
+	string = strim(element->string.pointer);
+
+	if (strcmp(string, nsensor->current_state)) {
+		devm_kfree(dev, nsensor->current_state);
+		nsensor->current_state = hp_wmi_strdup(dev, string);
+	}
+
+	/* Offset reads into the elements array after PossibleStates[0]. */
+	offset = nsensor->possible_states_count - 1;
+
+	element = &elements[HP_WMI_PROPERTY_UNIT_MODIFIER + offset];
+	nsensor->unit_modifier = (s32)element->integer.value;
+
+	element = &elements[HP_WMI_PROPERTY_CURRENT_READING + offset];
+	nsensor->current_reading = element->integer.value;
+}
+
+/*
+ * check_platform_events_wobj - validate a HPBIOS_PlatformEvents instance
+ * @wobj: pointer to WMI object instance to check
+ *
+ * Returns 0 on success, or a negative error code on error.
+ */
+static int check_platform_events_wobj(const union acpi_object *wobj)
+{
+	return check_wobj(wobj, hp_wmi_platform_events_property_map,
+			  HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_STATUS);
+}
+
+static int
+populate_platform_events_from_wobj(struct device *dev,
+				   struct hp_wmi_platform_events *pevents,
+				   union acpi_object *wobj)
+{
+	int last_prop = HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_STATUS;
+	int prop = HP_WMI_PLATFORM_EVENTS_PROPERTY_NAME;
+	union acpi_object *element;
+	acpi_object_type type;
+	char *string;
+	u32 value;
+	int err;
+
+	err = check_platform_events_wobj(wobj);
+	if (err)
+		return err;
+
+	element = wobj->package.elements;
+
+	for (; prop <= last_prop; prop++, element++) {
+		type = hp_wmi_platform_events_property_map[prop];
+
+		err = extract_acpi_value(dev, element, type, &value, &string);
+		if (err)
+			return err;
+
+		switch (prop) {
+		case HP_WMI_PLATFORM_EVENTS_PROPERTY_NAME:
+			pevents->name = string;
+			break;
+
+		case HP_WMI_PLATFORM_EVENTS_PROPERTY_DESCRIPTION:
+			pevents->description = string;
+			break;
+
+		case HP_WMI_PLATFORM_EVENTS_PROPERTY_SOURCE_NAMESPACE:
+			if (strcasecmp(HP_WMI_PLATFORM_EVENTS_NAMESPACE,
+				       string))
+				return -EINVAL;
+
+			pevents->source_namespace = string;
+			break;
+
+		case HP_WMI_PLATFORM_EVENTS_PROPERTY_SOURCE_CLASS:
+			if (strcasecmp(HP_WMI_PLATFORM_EVENTS_CLASS, string))
+				return -EINVAL;
+
+			pevents->source_class = string;
+			break;
+
+		case HP_WMI_PLATFORM_EVENTS_PROPERTY_CATEGORY:
+			pevents->category = value;
+			break;
+
+		case HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_SEVERITY:
+			pevents->possible_severity = value;
+			break;
+
+		case HP_WMI_PLATFORM_EVENTS_PROPERTY_POSSIBLE_STATUS:
+			pevents->possible_status = value;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * check_event_wobj - validate a HPBIOS_BIOSEvent instance
+ * @wobj: pointer to WMI object instance to check
+ *
+ * Returns 0 on success, or a negative error code on error.
+ */
+static int check_event_wobj(const union acpi_object *wobj)
+{
+	return check_wobj(wobj, hp_wmi_event_property_map,
+			  HP_WMI_EVENT_PROPERTY_STATUS);
+}
+
+static int populate_event_from_wobj(struct hp_wmi_event *event,
+				    union acpi_object *wobj)
+{
+	int prop = HP_WMI_EVENT_PROPERTY_NAME;
+	union acpi_object *element;
+	int err;
+
+	err = check_event_wobj(wobj);
+	if (err)
+		return err;
+
+	element = wobj->package.elements;
+
+	/* Extracted strings are NOT device-managed copies. */
+
+	for (; prop <= HP_WMI_EVENT_PROPERTY_CATEGORY; prop++, element++) {
+		switch (prop) {
+		case HP_WMI_EVENT_PROPERTY_NAME:
+			event->name = strim(element->string.pointer);
+			break;
+
+		case HP_WMI_EVENT_PROPERTY_DESCRIPTION:
+			event->description = strim(element->string.pointer);
+			break;
+
+		case HP_WMI_EVENT_PROPERTY_CATEGORY:
+			event->category = element->integer.value;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/*
+ * classify_event - classify an event
+ * @name: event name
+ * @category: event category
+ *
+ * Classify instances of both HPBIOS_PlatformEvents and HPBIOS_BIOSEvent from
+ * property values. Recognition criteria are based on multiple ACPI dumps [3].
+ *
+ * Returns an enum hp_wmi_type value on success,
+ * or a negative value if the event type is unsupported.
+ */
+static int classify_event(const char *event_name, u32 category)
+{
+	if (category != HP_WMI_CATEGORY_SENSOR)
+		return -EINVAL;
+
+	/* Fan events have Name "X Stall". */
+	if (strstr(event_name, HP_WMI_PATTERN_FAN_ALARM))
+		return HP_WMI_TYPE_AIR_FLOW;
+
+	/* Intrusion events have Name "Hood Intrusion". */
+	if (!strcmp(event_name, HP_WMI_PATTERN_INTRUSION_ALARM))
+		return HP_WMI_TYPE_INTRUSION;
+
+	/*
+	 * Temperature events have Name either "Thermal Caution" or
+	 * "Thermal Critical". Deal only with "Thermal Critical" events.
+	 *
+	 * "Thermal Caution" events have Status "Stressed", informing us that
+	 * the OperationalStatus of the related sensor has become "Stressed".
+	 * However, this is already a fault condition that will clear itself
+	 * when the sensor recovers, so we have no further interest in them.
+	 */
+	if (!strcmp(event_name, HP_WMI_PATTERN_TEMP_ALARM))
+		return HP_WMI_TYPE_TEMPERATURE;
+
+	return -EINVAL;
+}
+
+/*
+ * interpret_info - interpret sensor for hwmon
+ * @info: pointer to sensor info struct
+ *
+ * Should be called after the numeric sensor member has been updated.
+ */
+static void interpret_info(struct hp_wmi_info *info)
+{
+	const struct hp_wmi_numeric_sensor *nsensor = &info->nsensor;
+
+	info->cached_val = scale_numeric_sensor(nsensor);
+	info->last_updated = jiffies;
+}
+
+/*
+ * hp_wmi_update_info - poll WMI to update sensor info
+ * @state: pointer to driver state
+ * @info: pointer to sensor info struct
+ *
+ * Returns 0 on success, or a negative error code on error.
+ */
+static int hp_wmi_update_info(struct hp_wmi_sensors *state,
+			      struct hp_wmi_info *info)
+{
+	struct hp_wmi_numeric_sensor *nsensor = &info->nsensor;
+	struct device *dev = &state->wdev->dev;
+	const union acpi_object *wobj;
+	u8 instance = info->instance;
+	int ret = 0;
+
+	if (time_after(jiffies, info->last_updated + HZ)) {
+		mutex_lock(&state->lock);
+
+		wobj = hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, instance);
+		if (!wobj) {
+			ret = -EIO;
+			goto out_unlock;
+		}
+
+		update_numeric_sensor_from_wobj(dev, nsensor, wobj);
+
+		interpret_info(info);
+
+		kfree(wobj);
+
+out_unlock:
+		mutex_unlock(&state->lock);
+	}
+
+	return ret;
+}
+
+#if CONFIG_DEBUG_FS
+
+static int basic_string_show(struct seq_file *seqf, void *ignored)
+{
+	const char *str = seqf->private;
+
+	seq_printf(seqf, "%s\n", str);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(basic_string);
+
+static int fungible_show(struct seq_file *seqf, enum hp_wmi_property prop)
+{
+	struct hp_wmi_numeric_sensor *nsensor;
+	struct hp_wmi_sensors *state;
+	struct hp_wmi_info *info;
+	int err;
+
+	switch (prop) {
+	case HP_WMI_PROPERTY_OPERATIONAL_STATUS:
+		nsensor = container_of(seqf->private,
+				       struct hp_wmi_numeric_sensor,
+				       operational_status);
+		break;
+
+	case HP_WMI_PROPERTY_CURRENT_STATE:
+		nsensor = container_of(seqf->private,
+				       struct hp_wmi_numeric_sensor,
+				       current_state);
+		break;
+
+	case HP_WMI_PROPERTY_UNIT_MODIFIER:
+		nsensor = container_of(seqf->private,
+				       struct hp_wmi_numeric_sensor,
+				       unit_modifier);
+		break;
+
+	case HP_WMI_PROPERTY_CURRENT_READING:
+		nsensor = container_of(seqf->private,
+				       struct hp_wmi_numeric_sensor,
+				       current_reading);
+		break;
+
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	info = container_of(nsensor, struct hp_wmi_info, nsensor);
+	state = container_of(info, struct hp_wmi_sensors, info[info->instance]);
+
+	err = hp_wmi_update_info(state, info);
+	if (err)
+		return err;
+
+	switch (prop) {
+	case HP_WMI_PROPERTY_OPERATIONAL_STATUS:
+		seq_printf(seqf, "%u\n", nsensor->operational_status);
+		break;
+
+	case HP_WMI_PROPERTY_CURRENT_STATE:
+		seq_printf(seqf, "%s\n", nsensor->current_state);
+		break;
+
+	case HP_WMI_PROPERTY_UNIT_MODIFIER:
+		seq_printf(seqf, "%d\n", nsensor->unit_modifier);
+		break;
+
+	case HP_WMI_PROPERTY_CURRENT_READING:
+		seq_printf(seqf, "%u\n", nsensor->current_reading);
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int operational_status_show(struct seq_file *seqf, void *ignored)
+{
+	return fungible_show(seqf, HP_WMI_PROPERTY_OPERATIONAL_STATUS);
+}
+DEFINE_SHOW_ATTRIBUTE(operational_status);
+
+static int current_state_show(struct seq_file *seqf, void *ignored)
+{
+	return fungible_show(seqf, HP_WMI_PROPERTY_CURRENT_STATE);
+}
+DEFINE_SHOW_ATTRIBUTE(current_state);
+
+static int possible_states_show(struct seq_file *seqf, void *ignored)
+{
+	struct hp_wmi_numeric_sensor *nsensor = seqf->private;
+	u8 i;
+
+	for (i = 0; i < nsensor->possible_states_count; i++)
+		seq_printf(seqf, "%s%s", i ? "," : "",
+			   nsensor->possible_states[i]);
+
+	seq_puts(seqf, "\n");
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(possible_states);
+
+static int unit_modifier_show(struct seq_file *seqf, void *ignored)
+{
+	return fungible_show(seqf, HP_WMI_PROPERTY_UNIT_MODIFIER);
+}
+DEFINE_SHOW_ATTRIBUTE(unit_modifier);
+
+static int current_reading_show(struct seq_file *seqf, void *ignored)
+{
+	return fungible_show(seqf, HP_WMI_PROPERTY_CURRENT_READING);
+}
+DEFINE_SHOW_ATTRIBUTE(current_reading);
+
+/* hp_wmi_devm_debugfs_remove - devm callback for debugfs cleanup */
+static void hp_wmi_devm_debugfs_remove(void *res)
+{
+	debugfs_remove_recursive(res);
+}
+
+/* hp_wmi_debugfs_init - create and populate debugfs directory tree */
+static void hp_wmi_debugfs_init(struct hp_wmi_sensors *state)
+{
+	struct hp_wmi_platform_events *pevents = state->pevents;
+	struct device *dev = &state->wdev->dev;
+	struct hp_wmi_info *info = state->info;
+	struct hp_wmi_numeric_sensor *nsensor;
+	char buf[HP_WMI_MAX_STR_SIZE];
+	struct dentry *debugfs;
+	struct dentry *entries;
+	struct dentry *dir;
+	int err;
+	u8 i;
+
+	/* dev_name() gives a not-very-friendly GUID for WMI devices. */
+	scnprintf(buf, sizeof(buf), "hp-wmi-sensors-%u", dev->id);
+
+	debugfs = debugfs_create_dir(buf, NULL);
+	if (IS_ERR(debugfs))
+		return;
+
+	err = devm_add_action(dev, hp_wmi_devm_debugfs_remove, debugfs);
+	if (err) {
+		debugfs_remove(debugfs);
+		return;
+	}
+
+	entries = debugfs_create_dir("sensor", debugfs);
+
+	for (i = 0; i < state->count; i++, info++) {
+		nsensor = &info->nsensor;
+
+		scnprintf(buf, sizeof(buf), "%u", i);
+		dir = debugfs_create_dir(buf, entries);
+
+		debugfs_create_file("name", 0444, dir,
+				    (void *)nsensor->name,
+				    &basic_string_fops);
+
+		debugfs_create_file("description", 0444, dir,
+				    (void *)nsensor->description,
+				    &basic_string_fops);
+
+		debugfs_create_u32("sensor_type", 0444, dir,
+				   &nsensor->sensor_type);
+
+		debugfs_create_file("other_sensor_type", 0444, dir,
+				    (void *)nsensor->other_sensor_type,
+				    &basic_string_fops);
+
+		debugfs_create_file("operational_status", 0444, dir,
+				    &nsensor->operational_status,
+				    &operational_status_fops);
+
+		debugfs_create_file("current_state", 0444, dir,
+				    (void *)&nsensor->current_state,
+				    &current_state_fops);
+
+		debugfs_create_file("possible_states", 0444, dir,
+				    nsensor, &possible_states_fops);
+
+		debugfs_create_u32("base_units", 0444, dir,
+				   &nsensor->base_units);
+
+		debugfs_create_file("unit_modifier", 0444, dir,
+				    &nsensor->unit_modifier,
+				    &unit_modifier_fops);
+
+		debugfs_create_file("current_reading", 0444, dir,
+				    &nsensor->current_reading,
+				    &current_reading_fops);
+	}
+
+	entries = debugfs_create_dir("platform_events", debugfs);
+
+	for (i = 0; i < state->pevents_count; i++, pevents++) {
+		scnprintf(buf, sizeof(buf), "%u", i);
+		dir = debugfs_create_dir(buf, entries);
+
+		debugfs_create_file("name", 0444, dir,
+				    (void *)pevents->name,
+				    &basic_string_fops);
+
+		debugfs_create_file("description", 0444, dir,
+				    (void *)pevents->description,
+				    &basic_string_fops);
+
+		debugfs_create_file("source_namespace", 0444, dir,
+				    (void *)pevents->source_namespace,
+				    &basic_string_fops);
+
+		debugfs_create_file("source_class", 0444, dir,
+				    (void *)pevents->source_class,
+				    &basic_string_fops);
+
+		debugfs_create_u32("category", 0444, dir,
+				   &pevents->category);
+
+		debugfs_create_u32("possible_severity", 0444, dir,
+				   &pevents->possible_severity);
+
+		debugfs_create_u32("possible_status", 0444, dir,
+				   &pevents->possible_status);
+	}
+}
+
+#else
+
+static void hp_wmi_debugfs_init(struct hp_wmi_sensors *state)
+{
+}
+
+#endif
+
+static umode_t hp_wmi_hwmon_is_visible(const void *drvdata,
+				       enum hwmon_sensor_types type,
+				       u32 attr, int channel)
+{
+	const struct hp_wmi_sensors *state = drvdata;
+	const struct hp_wmi_info *info;
+
+	if (type == hwmon_intrusion)
+		return state->has_intrusion ? 0644 : 0;
+
+	if (!state->info_map[type] || !state->info_map[type][channel])
+		return 0;
+
+	info = state->info_map[type][channel];
+
+	if ((type == hwmon_temp && attr == hwmon_temp_alarm) ||
+	    (type == hwmon_fan  && attr == hwmon_fan_alarm))
+		return info->has_alarm ? 0444 : 0;
+
+	return 0444;
+}
+
+static int hp_wmi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			     u32 attr, int channel, long *val)
+{
+	struct hp_wmi_sensors *state = dev_get_drvdata(dev);
+	const struct hp_wmi_numeric_sensor *nsensor;
+	struct hp_wmi_info *info;
+	int err;
+
+	if (type == hwmon_intrusion) {
+		*val = state->intrusion ? 1 : 0;
+
+		return 0;
+	}
+
+	info = state->info_map[type][channel];
+
+	if ((type == hwmon_temp && attr == hwmon_temp_alarm) ||
+	    (type == hwmon_fan  && attr == hwmon_fan_alarm)) {
+		*val = info->alarm ? 1 : 0;
+		info->alarm = false;
+
+		return 0;
+	}
+
+	nsensor = &info->nsensor;
+
+	err = hp_wmi_update_info(state, info);
+	if (err)
+		return err;
+
+	if ((type == hwmon_temp && attr == hwmon_temp_fault) ||
+	    (type == hwmon_fan  && attr == hwmon_fan_fault))
+		*val = numeric_sensor_has_fault(nsensor);
+	else
+		*val = info->cached_val;
+
+	return 0;
+}
+
+static int hp_wmi_hwmon_read_string(struct device *dev,
+				    enum hwmon_sensor_types type, u32 attr,
+				    int channel, const char **str)
+{
+	const struct hp_wmi_sensors *state = dev_get_drvdata(dev);
+	const struct hp_wmi_info *info;
+
+	info = state->info_map[type][channel];
+	*str = info->nsensor.name;
+
+	return 0;
+}
+
+static int hp_wmi_hwmon_write(struct device *dev, enum hwmon_sensor_types type,
+			      u32 attr, int channel, long val)
+{
+	struct hp_wmi_sensors *state = dev_get_drvdata(dev);
+
+	if (val || !state->intrusion)
+		return -EOPNOTSUPP;
+
+	mutex_lock(&state->lock);
+
+	state->intrusion = false;
+
+	mutex_unlock(&state->lock);
+
+	return 0;
+}
+
+static const struct hwmon_ops hp_wmi_hwmon_ops = {
+	.is_visible  = hp_wmi_hwmon_is_visible,
+	.read	     = hp_wmi_hwmon_read,
+	.read_string = hp_wmi_hwmon_read_string,
+	.write	     = hp_wmi_hwmon_write,
+};
+
+static struct hwmon_chip_info hp_wmi_chip_info = {
+	.ops         = &hp_wmi_hwmon_ops,
+	.info        = NULL,
+};
+
+static struct hp_wmi_info *match_fan_event(struct hp_wmi_sensors *state,
+					   const char *event_description)
+{
+	struct hp_wmi_info **ptr_info = state->info_map[hwmon_fan];
+	u8 fan_count = state->channel_count[hwmon_fan];
+	struct hp_wmi_info *info;
+	const char *name;
+	u8 i;
+
+	/* Fan event has Description "X Speed". Sensor has name "X[ Speed]". */
+
+	for (i = 0; i < fan_count; i++, ptr_info++) {
+		info = *ptr_info;
+		name = info->nsensor.name;
+
+		if (strstr(event_description, name))
+			return info;
+	}
+
+	return NULL;
+}
+
+static u8 match_temp_events(struct hp_wmi_sensors *state,
+			    const char *event_description,
+			    struct hp_wmi_info *temp_info[])
+{
+	struct hp_wmi_info **ptr_info = state->info_map[hwmon_temp];
+	u8 temp_count = state->channel_count[hwmon_temp];
+	struct hp_wmi_info *info;
+	const char *name;
+	u8 count = 0;
+	bool is_cpu;
+	bool is_sys;
+	u8 i;
+
+	/* Description either "CPU Thermal Index" or "Chassis Thermal Index". */
+
+	is_cpu = !strcmp(event_description, HP_WMI_PATTERN_CPU_TEMP);
+	is_sys = !strcmp(event_description, HP_WMI_PATTERN_SYS_TEMP);
+	if (!is_cpu && !is_sys)
+		return 0;
+
+	/*
+	 * CPU event: Match one sensor with Name either "CPU Thermal Index" or
+	 * "CPU Temperature", or multiple with Name(s) "CPU[#] Temperature".
+	 *
+	 * Chassis event: Match one sensor with Name either
+	 * "Chassis Thermal Index" or "System Ambient Temperature".
+	 */
+
+	for (i = 0; i < temp_count; i++, ptr_info++) {
+		info = *ptr_info;
+		name = info->nsensor.name;
+
+		if ((is_cpu && (!strcmp(name, HP_WMI_PATTERN_CPU_TEMP) ||
+				!strcmp(name, HP_WMI_PATTERN_CPU_TEMP2))) ||
+		    (is_sys && (!strcmp(name, HP_WMI_PATTERN_SYS_TEMP) ||
+				!strcmp(name, HP_WMI_PATTERN_SYS_TEMP2)))) {
+			temp_info[0] = info;
+			return 1;
+		}
+
+		if (is_cpu && (strstr(name, HP_WMI_PATTERN_CPU) &&
+			       strstr(name, HP_WMI_PATTERN_TEMP)))
+			temp_info[count++] = info;
+	}
+
+	return count;
+}
+
+/* hp_wmi_devm_debugfs_remove - devm callback for WMI event handler removal */
+static void hp_wmi_devm_notify_remove(void *ignored)
+{
+	wmi_remove_notify_handler(HP_WMI_EVENT_GUID);
+}
+
+/* hp_wmi_notify - WMI event notification handler */
+static void hp_wmi_notify(u32 value, void *context)
+{
+	struct hp_wmi_info *temp_info[HP_WMI_MAX_INSTANCES] = {};
+	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct hp_wmi_sensors *state = context;
+	struct device *dev = &state->wdev->dev;
+	struct hp_wmi_info *fan_info;
+	struct hp_wmi_event event;
+	union acpi_object *wobj;
+	acpi_status err;
+	int event_type;
+	u8 count;
+
+	/*
+	 * The following warning may occur in the kernel log:
+	 *
+	 *   ACPI Warning: \_SB.WMID._WED: Return type mismatch -
+	 *     found Package, expected Integer/String/Buffer
+	 *
+	 * Non-business-class HP systems have the same WMI event GUID. Per the
+	 * existing hp-wmi driver, the event data on those systems is indeed
+	 * an ACPI_BUFFER containing a raw struct of 8 or 16 bytes. Because we
+	 * validate the event data to ensure it is an ACPI_PACKAGE containing
+	 * a HPBIOS_BIOSEvent instance, we need not concern ourselves.
+	 */
+
+	mutex_lock(&state->lock);
+
+	err = wmi_get_event_data(value, &out);
+	if (ACPI_FAILURE(err))
+		goto out_unlock;
+
+	wobj = out.pointer;
+
+	err = populate_event_from_wobj(&event, wobj);
+	if (err) {
+		dev_warn(dev, "Bad event data (ACPI type %d)\n", wobj->type);
+		goto out_free_wobj;
+	}
+
+	event_type = classify_event(event.name, event.category);
+	switch (event_type) {
+	case HP_WMI_TYPE_AIR_FLOW:
+		fan_info = match_fan_event(state, event.description);
+		if (fan_info)
+			fan_info->alarm = true;
+		break;
+
+	case HP_WMI_TYPE_INTRUSION:
+		state->intrusion = true;
+		break;
+
+	case HP_WMI_TYPE_TEMPERATURE:
+		count = match_temp_events(state, event.description, temp_info);
+		while (count)
+			temp_info[--count]->alarm = true;
+		break;
+
+	default:
+		break;
+	}
+
+out_free_wobj:
+	kfree(wobj);
+
+out_unlock:
+	mutex_unlock(&state->lock);
+}
+
+static void init_platform_events(struct hp_wmi_sensors *state)
+{
+	struct hp_wmi_platform_events *pevents = state->pevents;
+	struct device *dev = &state->wdev->dev;
+	union acpi_object *wobj;
+	int err;
+	u8 i;
+
+	for (i = 0; i < HP_WMI_MAX_INSTANCES; i++, pevents++) {
+		wobj = hp_wmi_get_wobj(HP_WMI_PLATFORM_EVENTS_GUID, i);
+		if (!wobj)
+			break;
+
+		err = populate_platform_events_from_wobj(dev, pevents, wobj);
+
+		kfree(wobj);
+
+		if (err)
+			break;
+	}
+
+	state->pevents_count = i;
+
+	dev_dbg(dev, "Found %u platform events\n", i);
+}
+
+static int init_numeric_sensors(struct hp_wmi_sensors *state,
+				struct hp_wmi_info *connected[], u8 *out_count)
+{
+	struct hp_wmi_info ***info_map = state->info_map;
+	u8 *channel_count = state->channel_count;
+	struct device *dev = &state->wdev->dev;
+	struct hp_wmi_info *info = state->info;
+	struct hp_wmi_numeric_sensor *nsensor;
+	u8 type_index[hwmon_max] = {};
+	enum hwmon_sensor_types type;
+	union acpi_object *wobj;
+	u8 type_count = 0;
+	u8 count = 0;
+	int wtype;
+	int err;
+	u8 c;
+	u8 i;
+
+	for (i = 0; i < HP_WMI_MAX_INSTANCES; i++, info++) {
+		wobj = hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, i);
+		if (!wobj)
+			break;
+
+		info->instance = i;
+		nsensor = &info->nsensor;
+
+		err = populate_numeric_sensor_from_wobj(dev, nsensor, wobj);
+		if (err)
+			goto out_free_wobj;
+
+		if (!numeric_sensor_is_connected(nsensor))
+			goto out_free_wobj;
+
+		wtype = classify_numeric_sensor(nsensor);
+		if (wtype < 0)
+			goto out_free_wobj;
+
+		type = hp_wmi_hwmon_type_map[wtype];
+		if (!channel_count[type])
+			type_count++;
+		channel_count[type]++;
+
+		info->is_active = true;
+		info->type = type;
+
+		interpret_info(info);
+
+		connected[count++] = info;
+
+out_free_wobj:
+		kfree(wobj);
+
+		if (err)
+			return err;
+	}
+
+	dev_dbg(dev, "Found %u sensors (%u connected, %u types)\n",
+		i, count, type_count);
+
+	state->count = i;
+	if (!state->count)
+		return -ENODATA;
+
+	for (i = 0; i < count; i++) {
+		info = connected[i];
+		type = info->type;
+		c = type_index[type]++;
+
+		if (!info_map[type]) {
+			info_map[type] = devm_kcalloc(dev, channel_count[type],
+						      sizeof(*info_map),
+						      GFP_KERNEL);
+			if (!info_map[type])
+				return -ENOMEM;
+		}
+
+		info_map[type][c] = info;
+	}
+
+	*out_count = count;
+
+	return 0;
+}
+
+static bool find_event_attributes(struct hp_wmi_sensors *state)
+{
+	/*
+	 * The existence of this HPBIOS_PlatformEvents instance:
+	 *
+	 *   {
+	 *     Name = "Rear Chassis Fan0 Stall";
+	 *     Description = "Rear Chassis Fan0 Speed";
+	 *     Category = 3;           // "Sensor"
+	 *     PossibleSeverity = 25;  // "Critical Failure"
+	 *     PossibleStatus = 5;     // "Predictive Failure"
+	 *     [...]
+	 *   }
+	 *
+	 * means that this HPBIOS_BIOSEvent instance may occur:
+	 *
+	 *   {
+	 *     Name = "Rear Chassis Fan0 Stall";
+	 *     Description = "Rear Chassis Fan0 Speed";
+	 *     Category = 3;           // "Sensor"
+	 *     Severity = 25;          // "Critical Failure"
+	 *     Status = 5;             // "Predictive Failure"
+	 *   }
+	 *
+	 * After the event occurs (e.g. because the fan was unplugged),
+	 * polling the related HPBIOS_BIOSNumericSensor instance gives:
+	 *
+	 *   {
+	 *      Name = "Rear Chassis Fan0";
+	 *      Description = "Reports rear chassis fan0 speed";
+	 *      OperationalStatus = 5; // "Predictive Failure", was 3 ("OK")
+	 *      CurrentReading = 0;
+	 *      [...]
+	 *   }
+	 *
+	 * In this example, the hwmon fan channel for "Rear Chassis Fan0"
+	 * should support the alarm flag and have it be set if the related
+	 * HPBIOS_BIOSEvent instance occurs.
+	 *
+	 * In addition to fan events, temperature (CPU/chassis) and intrusion
+	 * events are relevant to hwmon [2]. Note that much information in [2]
+	 * is unreliable; it is referenced in addition to ACPI dumps [3] merely
+	 * to support the conclusion that sensor and event names/descriptions
+	 * are systematic enough to allow this driver to match them.
+	 *
+	 * Complications and limitations:
+	 *
+	 *   - Strings are freeform and may vary, cf. sensor Name "CPU0 Fan"
+	 *     on a Z420 vs. "CPU Fan Speed" on an EliteOne 800 G1.
+	 *   - Leading/trailing whitespace is a rare but real possibility [3].
+	 *   - The HPBIOS_PlatformEvents object may not exist or its instances
+	 *     may show that the system only has e.g. BIOS setting-related
+	 *     events (cf. the ProBook 4540s and ProBook 470 G0 [3]).
+	 */
+
+	struct hp_wmi_info *temp_info[HP_WMI_MAX_INSTANCES] = {};
+	struct hp_wmi_platform_events *pevents = state->pevents;
+	u8 pevents_count = state->pevents_count;
+	const char *event_description;
+	struct hp_wmi_info *fan_info;
+	bool has_events = false;
+	const char *event_name;
+	u32 event_category;
+	int event_type;
+	u8 count;
+	u8 i;
+
+	for (i = 0; i < pevents_count; i++, pevents++) {
+		event_name = pevents->name;
+		event_description = pevents->description;
+		event_category = pevents->category;
+
+		event_type = classify_event(event_name, event_category);
+		switch (event_type) {
+		case HP_WMI_TYPE_AIR_FLOW:
+			fan_info = match_fan_event(state, event_description);
+			if (!fan_info)
+				break;
+
+			fan_info->has_alarm = true;
+			has_events = true;
+			break;
+
+		case HP_WMI_TYPE_INTRUSION:
+			state->has_intrusion = true;
+			has_events = true;
+			break;
+
+		case HP_WMI_TYPE_TEMPERATURE:
+			count = match_temp_events(state, event_description,
+						  temp_info);
+			if (!count)
+				break;
+
+			while (count)
+				temp_info[--count]->has_alarm = true;
+			has_events = true;
+			break;
+
+		default:
+			break;
+		}
+	}
+
+	return has_events;
+}
+
+static int make_chip_info(struct hp_wmi_sensors *state, bool has_events)
+{
+	const struct hwmon_channel_info **ptr_channel_info;
+	struct hp_wmi_info ***info_map = state->info_map;
+	u8 *channel_count = state->channel_count;
+	struct hwmon_channel_info *channel_info;
+	struct device *dev = &state->wdev->dev;
+	enum hwmon_sensor_types type;
+	u8 type_count = 0;
+	u32 *config;
+	u32 attr;
+	u8 count;
+	u8 i;
+
+	if (channel_count[hwmon_temp])
+		channel_count[hwmon_chip] = 1;
+
+	if (has_events && state->has_intrusion)
+		channel_count[hwmon_intrusion] = 1;
+
+	for (type = hwmon_chip; type < hwmon_max; type++)
+		type_count += channel_count[type];
+
+	channel_info = devm_kcalloc(dev, type_count,
+				    sizeof(*channel_info), GFP_KERNEL);
+	if (!channel_info)
+		return -ENOMEM;
+
+	ptr_channel_info = devm_kcalloc(dev, type_count + 1,
+					sizeof(*ptr_channel_info), GFP_KERNEL);
+	if (!ptr_channel_info)
+		return -ENOMEM;
+
+	hp_wmi_chip_info.info = ptr_channel_info;
+
+	for (type = hwmon_chip; type < hwmon_max; type++) {
+		count = channel_count[type];
+		if (!count)
+			continue;
+
+		config = devm_kcalloc(dev, count + 1,
+				      sizeof(*config), GFP_KERNEL);
+		if (!config)
+			return -ENOMEM;
+
+		attr = hp_wmi_hwmon_attributes[type];
+		channel_info->type = type;
+		channel_info->config = config;
+		memset32(config, attr, count);
+
+		*ptr_channel_info++ = channel_info++;
+
+		if (!has_events || (type != hwmon_temp && type != hwmon_fan))
+			continue;
+
+		attr = type == hwmon_temp ? HWMON_T_ALARM : HWMON_F_ALARM;
+
+		for (i = 0; i < count; i++)
+			if (info_map[type][i]->has_alarm)
+				config[i] |= attr;
+	}
+
+	return 0;
+}
+
+static bool add_event_handler(struct hp_wmi_sensors *state)
+{
+	struct device *dev = &state->wdev->dev;
+	int err;
+
+	err = wmi_install_notify_handler(HP_WMI_EVENT_GUID,
+					 hp_wmi_notify, state);
+	if (err) {
+		dev_info(dev, "Failed to subscribe to WMI event\n");
+		return false;
+	}
+
+	err = devm_add_action(dev, hp_wmi_devm_notify_remove, NULL);
+	if (err) {
+		wmi_remove_notify_handler(HP_WMI_EVENT_GUID);
+		return false;
+	}
+
+	return true;
+}
+
+static int hp_wmi_sensors_init(struct hp_wmi_sensors *state)
+{
+	struct hp_wmi_info *connected[HP_WMI_MAX_INSTANCES];
+	struct device *dev = &state->wdev->dev;
+	struct device *hwdev;
+	bool has_events;
+	u8 count;
+	int err;
+
+	init_platform_events(state);
+
+	err = init_numeric_sensors(state, connected, &count);
+	if (err)
+		return err;
+
+	hp_wmi_debugfs_init(state);
+
+	if (!count)
+		return 0; /* Not an error, but debugfs only. */
+
+	has_events = find_event_attributes(state);
+
+	/* Survive failure to install WMI event handler. */
+	if (has_events && !add_event_handler(state))
+		has_events = false;
+
+	err = make_chip_info(state, has_events);
+	if (err)
+		return err;
+
+	hwdev = devm_hwmon_device_register_with_info(dev, "hp_wmi_sensors",
+						     state, &hp_wmi_chip_info,
+						     NULL);
+	return PTR_ERR_OR_ZERO(hwdev);
+}
+
+static int hp_wmi_sensors_probe(struct wmi_device *wdev, const void *context)
+{
+	struct device *dev = &wdev->dev;
+	struct hp_wmi_sensors *state;
+
+	state = devm_kzalloc(dev, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	state->wdev = wdev;
+
+	mutex_init(&state->lock);
+
+	dev_set_drvdata(dev, state);
+
+	return hp_wmi_sensors_init(state);
+}
+
+static const struct wmi_device_id hp_wmi_sensors_id_table[] = {
+	{ HP_WMI_NUMERIC_SENSOR_GUID, NULL },
+	{},
+};
+
+static struct wmi_driver hp_wmi_sensors_driver = {
+	.driver   = { .name = "hp-wmi-sensors" },
+	.id_table = hp_wmi_sensors_id_table,
+	.probe    = hp_wmi_sensors_probe,
+};
+module_wmi_driver(hp_wmi_sensors_driver);
+
+MODULE_AUTHOR("James Seo <james@equiv.tech>");
+MODULE_DESCRIPTION("HP WMI Sensors driver");
+MODULE_LICENSE("GPL");

base-commit: 457391b0380335d5e9a5babdec90ac53928b23b4
-- 
2.34.1

