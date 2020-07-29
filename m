Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9458B23232B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 19:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgG2RKw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 Jul 2020 13:10:52 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:10393 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbgG2RKw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jul 2020 13:10:52 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f21ad6e0000>; Wed, 29 Jul 2020 10:10:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 10:10:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Jul 2020 10:10:51 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jul
 2020 17:10:50 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>
CC:     <pobrn@protonmail.com>, <andy@infradead.org>,
        <dvhart@infradead.org>, Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH v2] platform/x86: Add new vga-switcheroo gmux driver for ACPI-driven muxes
Date:   Wed, 29 Jul 2020 12:11:51 -0500
Message-ID: <20200729171151.18426-1-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <78a56eca-f0e3-3520-f3d5-1222b54f6fe9@nvidia.com>
References: <78a56eca-f0e3-3520-f3d5-1222b54f6fe9@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596042606; bh=K80f4zIL2weSIP6EEtTx+ZtG/CW/Adx5ALG3Fnbn76I=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:X-NVConfidentiality:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:
         Content-Transfer-Encoding;
        b=LNT/t8tTI5TU8oZpu5QWnPp6habpuvtnRwg9T/JLQchN+AT6HINEQwvrDdCC/LqUs
         vJNwmX9Mw/7XwvOrzHmO+5Qmu8LMQ5Al8PVvEwcIhhogI13fvvqoB5LKa8E8xZTJom
         xYapQ1mTTkoqMs6O4Rfu+61xhyqxMfKBbeov+8XZJdELVofQRnQTuirwUcOfpOQZlw
         iVGr8GEOmMHkXw1l9BzGvb2xiCmWPnhiN0aOoQFhvgLgZZEgDXmYp6eFfgXok3txdM
         0+GjQXBV6hcL6EC6gBqemZ/A09ydPdo5a0XX3CaWiDql6g2e9oRtD4jHa76l0Xl1/H
         A17K1ETY/gkHw==
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

v2: Applied some suggestions from Barnab=C3=A1s P=C5=91cze <pobrn@protonmai=
l.com>

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 MAINTAINERS                      |   6 +
 drivers/platform/x86/Kconfig     |   9 ++
 drivers/platform/x86/Makefile    |   2 +
 drivers/platform/x86/mxds-gmux.c | 261 +++++++++++++++++++++++++++++++
 4 files changed, 278 insertions(+)
 create mode 100644 drivers/platform/x86/mxds-gmux.c

diff --git a/MAINTAINERS b/MAINTAINERS
index eeff55560759..636c9259b345 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11510,6 +11510,12 @@ L:	linux-usb@vger.kernel.org
 S:	Maintained
 F:	drivers/usb/musb/
=20
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
index 0ad7ad8cf8e1..5d00ad1ffc0e 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -1368,6 +1368,15 @@ config INTEL_TELEMETRY
 	  directly via debugfs files. Various tools may use
 	  this interface for SoC state monitoring.
=20
+config MXDS_GMUX
+	tristate "ACPI MXDS Gmux Driver"
+	depends on ACPI_WMI
+	depends on ACPI
+	depends on VGA_SWITCHEROO
+	help
+	  This driver provides support for ACPI-driven gmux devices which are
+	  present on some notebook designs with hybrid graphics.
+
 endif # X86_PLATFORM_DEVICES
=20
 config PMC_ATOM
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 53408d965874..b79000733fae 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)		+=3D intel_telemetry_cor=
e.o \
 					   intel_telemetry_pltdrv.o \
 					   intel_telemetry_debugfs.o
 obj-$(CONFIG_PMC_ATOM)			+=3D pmc_atom.o
+
+obj-$(CONFIG_MXDS_GMUX)			+=3D mxds-gmux.o
diff --git a/drivers/platform/x86/mxds-gmux.c b/drivers/platform/x86/mxds-g=
mux.c
new file mode 100644
index 000000000000..7fbf3c5c9bb3
--- /dev/null
+++ b/drivers/platform/x86/mxds-gmux.c
@@ -0,0 +1,261 @@
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
+ * This program is distributed in the hope that it will be useful, but WIT=
HOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
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
+ * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off o=
f
+ * the WMI wrapper for the related WMAA method for backlight control.
+ */
+MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
+
+static struct pci_dev *ig_dev, *dg_dev;
+static acpi_handle internal_mux_handle;
+static acpi_handle external_mux_handle;
+static bool vga_switcheroo_registered;
+
+static int mxds_gmux_switchto(enum vga_switcheroo_client_id);
+static enum vga_switcheroo_client_id mxds_gmux_get_client_id(struct pci_de=
v *);
+
+static const struct vga_switcheroo_handler handler =3D {
+	.switchto =3D mxds_gmux_switchto,
+	.get_client_id =3D mxds_gmux_get_client_id,
+};
+
+enum acpi_method {
+	MXDM =3D 0,
+	MXDS,
+	NUM_ACPI_METHODS
+};
+
+static char *acpi_methods[NUM_ACPI_METHODS] =3D {
+	[MXDM] =3D "MXDM",
+	[MXDS] =3D "MXDS",
+};
+
+enum mux_mode_command {
+	MUX_MODE_GET =3D 0,
+};
+
+enum mux_mode {
+	MUX_MODE_DGPU_ONLY =3D 1,
+	MUX_MODE_IGPU_ONLY =3D 2,
+	MUX_MODE_MSHYBRID =3D 3,	/* Dual GPU, mux switched to iGPU */
+	MUX_MODE_DYNAMIC =3D 4,	/* Dual GPU, dynamic mux switching */
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
+	MUX_STATE_IGPU =3D 1,
+	MUX_STATE_DGPU =3D 2,
+};
+
+enum mux_state_command {
+	MUX_STATE_GET =3D 0,
+	MUX_STATE_SET_IGPU =3D 0x01,
+	MUX_STATE_SET_DGPU =3D 0x11,
+};
+
+static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method metho=
d,
+				acpi_integer action)
+{
+	union acpi_object arg;
+	struct acpi_object_list in =3D {.count =3D 1, .pointer =3D &arg};
+	acpi_integer ret;
+	acpi_status status;
+
+	arg.integer.type =3D ACPI_TYPE_INTEGER;
+	arg.integer.value =3D action;
+
+	status =3D acpi_evaluate_integer(handle, acpi_methods[method], &in, &ret)=
;
+
+	if (ACPI_FAILURE(status)) {
+		pr_err("ACPI %s failed: %s\n", acpi_methods[method],
+			acpi_format_exception(status));
+		return 0;
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
+static void set_mux_state(acpi_handle handle, enum mux_state_command comma=
nd)
+{
+	acpi_helper(handle, MXDS, command);
+}
+
+static int mxds_gmux_switchto(enum vga_switcheroo_client_id id)
+{
+	enum mux_state state;
+	enum mux_state_command command;
+
+	switch (id) {
+	case VGA_SWITCHEROO_IGD:
+		state =3D MUX_STATE_IGPU;
+		command =3D MUX_STATE_SET_IGPU;
+		break;
+	case VGA_SWITCHEROO_DIS:
+		state =3D MUX_STATE_DGPU;
+		command =3D MUX_STATE_SET_DGPU;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (internal_mux_handle) {
+		set_mux_state(internal_mux_handle, command);
+		if (get_mux_state(internal_mux_handle) !=3D state)
+			return -EAGAIN;
+	}
+
+	if (external_mux_handle) {
+		set_mux_state(external_mux_handle, command);
+		if (get_mux_state(external_mux_handle) !=3D state)
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
+		if (ig_dev && dev->vendor =3D=3D ig_dev->vendor)
+			return VGA_SWITCHEROO_IGD;
+		if (dg_dev && dev->vendor =3D=3D dg_dev->vendor)
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
+	if (get_mux_mode(object) !=3D MUX_MODE_DYNAMIC)
+		return 0;
+
+	/* Internal display has _BCL; external does not */
+	if (acpi_get_handle(object, "_BCL", &search))
+		external_mux_handle =3D object;
+	else
+		internal_mux_handle =3D object;
+
+	return 0;
+}
+
+static int __init mxds_gmux_init(void)
+{
+	int ret =3D 0;
+	struct pci_dev *dev =3D NULL;
+
+	while ((dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) {
+		switch (dev->vendor) {
+		case 0x8086:
+			pci_dev_put(ig_dev);
+			ig_dev =3D pci_dev_get(dev);
+			break;
+		case 0x10de:
+			pci_dev_put(dg_dev);
+			dg_dev =3D pci_dev_get(dev);
+			break;
+		default:
+			break;
+		}
+	}
+
+	/* Require both integrated and discrete GPUs */
+	if (!ig_dev || !dg_dev) {
+		ret =3D -ENODEV;
+		goto done;
+	}
+
+	acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ACPI_UINT32_MAX,
+		find_acpi_methods, NULL, NULL, NULL);
+
+	/* Require at least one mux */
+	if (!internal_mux_handle && !external_mux_handle) {
+		ret =3D -ENODEV;
+		goto done;
+	}
+
+	ret =3D vga_switcheroo_register_handler(&handler, 0);
+
+	if (ret)
+		goto done;
+
+	vga_switcheroo_registered =3D true;
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
+static void __exit mxds_gmux_exit(void)
+{
+	if (vga_switcheroo_registered)
+		vga_switcheroo_unregister_handler();
+	pci_dev_put(ig_dev);
+	pci_dev_put(dg_dev);
+}
+module_exit(mxds_gmux_exit);
--=20
2.18.4

