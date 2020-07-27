Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B7522FAC2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 22:56:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726706AbgG0U40 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 16:56:26 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9402 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbgG0U40 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 16:56:26 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f1f3f6c0000>; Mon, 27 Jul 2020 13:56:12 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 27 Jul 2020 13:56:25 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 27 Jul 2020 13:56:25 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 27 Jul
 2020 20:56:25 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH] platform/x86: Add new vga-switcheroo gmux driver for ACPI-driven muxes
Date:   Mon, 27 Jul 2020 15:57:52 -0500
Message-ID: <20200727205752.28224-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595883372; bh=NJwj2t+sbdTEaMj3eII609wxvdi3wNLnV4Q+gnOG/IY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:X-Originating-IP:
         X-ClientProxiedBy:Content-Type;
        b=gI5wxMfL3AsuwMmFDeHGyAnS0KzCzzxTxhwAfCIZjJ9pz59puT67Anb0+zSvvyxwT
         +Ib41FEBz3mrnj8RMR8eujEMoXH1HoVqwVti+2jJl5mAD3bs442es2HQdavcLt14sS
         BkqZpPtMco/vb74DK5ey1Ls1MaUzfHHfRKBESLl808SushA0kQPzJyUDWXTHmZQY3t
         //y3RqyXYSTvfyecrYP2ggdl05X4EvzxO5SrQ8vzqjrvNIMlbyTdwiqB/uRT6iNbPU
         Z33az2UIOdy4yXg7Z5CDsikGt6FU4qnKwc+XIHnRbN3S8TrvNH5TV/PL1eC0POaRkT
         HI14S2kWc9WKw==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Some upcoming notebook designs utilize display muxes driven by a
pair of ACPI methods, MXDM to query and configure the operational
mode of the mux (integrated only, discrete only, hybrid non-muxed,
hybrid with dynamic mux switching), and MXDS to query and set the
mux state when running in dynamic switch mode.

Add a vga-switcheroo driver to support switching the mux on systems
with the ACPI MXDM/MXDS interface. The mux mode cannot be changed
dynamically (calling MXDM to change the mode won't have effect until
the next boot, and calling MXDM to read the mux mode returns the
active mode, not the mode that will be enabled on next boot), and
MXDS only works when the mux mode is set to dynamic switch, so this
driver will fail to load when MXDM reports any non-dynamic mode.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 MAINTAINERS                      |   6 +
 drivers/platform/x86/Kconfig     |   9 ++
 drivers/platform/x86/Makefile    |   2 +
 drivers/platform/x86/mxds-gmux.c | 268 +++++++++++++++++++++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 drivers/platform/x86/mxds-gmux.c

diff --git a/MAINTAINERS b/MAINTAINERS
index eeff55560759..636c9259b345 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11510,6 +11510,12 @@ L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	drivers/usb/musb/
 
+MXDS GMUX DRIVER
+M:	Daniel Dadap <ddadap@nvidia.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/mxds-gmux.c
+
 MXL301RF MEDIA DRIVER
 M:	Akihiro Tsukada <tskd08@gmail.com>
 L:	linux-media@vger.kernel.org
diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0ad7ad8cf8e1..f2fef1e8e8d9 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1368,6 +1368,15 @@ config INTEL_TELEMETRY
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
 
+config MXDS_GMUX
+	tristate "ACPI MXDS Gmux Driver"
+	depends on ACPI_WMI
+	depends on ACPI
+	depends on VGA_SWITCHEROO
+	---help---
+	  This driver provides support for ACPI-driven gmux devices which are
+	  present on some notebook designs with hybrid graphics.
+
 endif # X86_PLATFORM_DEVICES
 
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 53408d965874..bc75b1f42057 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)		+= intel_telemetry_core.o \
 					   intel_telemetry_pltdrv.o \
 					   intel_telemetry_debugfs.o
 obj-$(CONFIG_PMC_ATOM)			+= pmc_atom.o
+
+obj-$(CONFIG_MXDS_GMUX)                 += mxds-gmux.o
diff --git a/drivers/platform/x86/mxds-gmux.c b/drivers/platform/x86/mxds-gmux.c
new file mode 100644
index 000000000000..c6c5973bde80
--- /dev/null
+++ b/drivers/platform/x86/mxds-gmux.c
@@ -0,0 +1,268 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * mxds-gmux: vga_switcheroo mux handler for ACPI MXDS muxes
+ *
+ * Copyright (C) 2020 NVIDIA Corporation
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses>.
+ *
+ */
+
+#include <linux/module.h>
+#include <linux/acpi.h>
+#include <linux/pci.h>
+#include <linux/vga_switcheroo.h>
+#include <linux/delay.h>
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("vga_switcheroo mux handler for ACPI MXDS muxes");
+MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
+
+/*
+ *  The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off of
+ * the WMI wrapper for the related WMAA method for backlight control.
+ */
+MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
+
+static struct pci_dev *ig_dev, *dg_dev;
+static acpi_handle internal_mux_handle;
+static acpi_handle external_mux_handle;
+static int vga_switcheroo_registered;
+
+enum acpi_method {
+	MXDM,
+	MXDS,
+};
+
+static char *acpi_methods[] = {
+	[MXDM] = "MXDM",
+	[MXDS] = "MXDS",
+};
+
+enum mux_mode {
+	MUX_MODE_GET = 0,
+	MUX_MODE_DGPU_ONLY = 1,
+	MUX_MODE_IGPU_ONLY = 2,
+	MUX_MODE_MSHYBRID = 3,
+	MUX_MODE_DYNAMIC = 4,
+};
+
+/*
+ * Call MXDS with argument value 0 to read the current state.
+ * When reading, a return value of 1 means iGPU and 2 means dGPU.
+ * Call MXDS with bit 0 set to change the current state.
+ * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
+ */
+
+enum mux_state {
+	MUX_STATE_GET = 0,
+	MUX_STATE_SET_IGPU = 0x01,
+	MUX_STATE_IGPU = 1,
+	MUX_STATE_DGPU = 2,
+	MUX_STATE_SET_DGPU = 0x11,
+};
+
+static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method method,
+				acpi_integer action)
+{
+	union acpi_object arg;
+	struct acpi_object_list in = {.count = 1, .pointer = &arg};
+	struct acpi_buffer buf = {
+		.length = ACPI_ALLOCATE_BUFFER,
+		.pointer = NULL,
+	};
+	acpi_integer ret = 0;
+
+	arg.integer.type = ACPI_TYPE_INTEGER;
+	arg.integer.value = action;
+
+	if (!ACPI_FAILURE(acpi_evaluate_object(handle, acpi_methods[method],
+			  &in, &buf))) {
+		union acpi_object *obj = buf.pointer;
+
+		if (obj && obj->type == ACPI_TYPE_INTEGER)
+			ret = obj->integer.value;
+	}
+
+	return ret;
+}
+
+static acpi_integer get_mux_mode(acpi_handle handle)
+{
+	return acpi_helper(handle, MXDM, MUX_MODE_GET);
+}
+
+static acpi_integer get_mux_state(acpi_handle handle)
+{
+	return acpi_helper(handle, MXDS, MUX_STATE_GET);
+}
+
+static void set_mux_state(acpi_handle handle, enum mux_state state)
+{
+	switch (state) {
+	case MUX_STATE_IGPU:
+		state = MUX_STATE_SET_IGPU;
+		break;
+	case MUX_STATE_DGPU:
+	case MUX_STATE_SET_DGPU:
+		state = MUX_STATE_SET_DGPU;
+		break;
+	default:
+		state = MUX_STATE_GET;
+		break;
+	}
+
+	acpi_helper(handle, MXDS, state);
+}
+
+static int mxds_gmux_switchto(enum vga_switcheroo_client_id id)
+{
+	enum mux_state state_set_cmd, target_state;
+
+	if (!internal_mux_handle && !external_mux_handle)
+		return -ENOTSUPP;
+
+	switch (id) {
+	case VGA_SWITCHEROO_IGD:
+		state_set_cmd = MUX_STATE_SET_IGPU;
+		target_state = MUX_STATE_IGPU;
+		break;
+	case VGA_SWITCHEROO_DIS:
+		state_set_cmd = MUX_STATE_SET_DGPU;
+		target_state = MUX_STATE_DGPU;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (internal_mux_handle) {
+		set_mux_state(internal_mux_handle, state_set_cmd);
+		if (get_mux_state(internal_mux_handle) != target_state)
+			return -EAGAIN;
+	}
+
+	if (external_mux_handle) {
+		set_mux_state(external_mux_handle, state_set_cmd);
+		if (get_mux_state(external_mux_handle) != target_state)
+			return -EAGAIN;
+	}
+
+	/* DP AUX can take up to 100ms to settle after mux switch */
+	mdelay(100);
+
+	return 0;
+}
+
+static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
+	struct pci_dev *dev)
+{
+	if (dev) {
+		if (ig_dev && dev->vendor == ig_dev->vendor)
+			return VGA_SWITCHEROO_IGD;
+		if (dg_dev && dev->vendor == dg_dev->vendor)
+			return VGA_SWITCHEROO_DIS;
+	}
+
+	return VGA_SWITCHEROO_UNKNOWN_ID;
+}
+
+static acpi_status find_acpi_methods(
+	acpi_handle object, u32 nesting_level, void *context,
+	void **return_value)
+{
+	acpi_handle search;
+
+	/* If either MXDM or MXDS is missing, we can't use this object */
+	if (acpi_get_handle(object, "MXDM", &search))
+		return 0;
+	if (acpi_get_handle(object, "MXDS", &search))
+		return 0;
+
+	/* MXDS only works when MXDM indicates dynamic mode */
+	if (get_mux_mode(object) != MUX_MODE_DYNAMIC)
+		return 0;
+
+	/* Internal display has _BCL; external does not */
+	if (acpi_get_handle(object, "_BCL", &search))
+		external_mux_handle = object;
+	else
+		internal_mux_handle = object;
+
+	return 0;
+}
+
+static int mxds_gmux_init(void)
+{
+	int ret = 0;
+	struct pci_dev *dev = NULL;
+	static struct vga_switcheroo_handler handler = {
+		.switchto = mxds_gmux_switchto,
+		.get_client_id = mxds_gmux_get_client_id,
+	};
+
+	while ((dev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) {
+		switch (dev->vendor) {
+		case 0x8086:
+			pci_dev_put(ig_dev);
+			ig_dev = pci_dev_get(dev);
+			break;
+		case 0x10de:
+			pci_dev_put(dg_dev);
+			dg_dev = pci_dev_get(dev);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* Require both integrated and discrete GPUs */
+	if (!ig_dev || !dg_dev) {
+		ret = -ENODEV;
+		goto done;
+	}
+
+	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ACPI_UINT32_MAX,
+		find_acpi_methods, NULL, NULL, NULL);
+
+	/* Require at least one mux */
+	if (!internal_mux_handle && !external_mux_handle) {
+		ret = -ENODEV;
+		goto done;
+	}
+
+	ret = vga_switcheroo_register_handler(&handler, 0);
+
+	if (ret)
+		goto done;
+
+	vga_switcheroo_registered = true;
+
+done:
+
+	if (ret) {
+		pci_dev_put(ig_dev);
+		pci_dev_put(dg_dev);
+	}
+
+	return ret;
+}
+module_init(mxds_gmux_init);
+
+static void mxds_gmux_fini(void)
+{
+	if (vga_switcheroo_registered)
+		vga_switcheroo_unregister_handler();
+	pci_dev_put(ig_dev);
+	pci_dev_put(dg_dev);
+}
+module_exit(mxds_gmux_fini);
-- 
2.18.4

