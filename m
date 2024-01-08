Return-Path: <platform-driver-x86+bounces-844-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E818267F3
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 07:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9D0F1C2189C
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 06:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20B07481;
	Mon,  8 Jan 2024 06:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Sf3kktFG"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC6263A1;
	Mon,  8 Jan 2024 06:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wdc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1704694934; x=1736230934;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IZt/tcfcFyVdZtPJTC+ygNxUQ+EEk7GP6KBuA3opgW8=;
  b=Sf3kktFGp4m1oegWbjOl2tBfip/wRfU4aYFC+H4ukg5lGfuyw/Vq/OxA
   Wj5+PRXFQt8CttuAL0ph3WxNEqlMpxqh6lhTxNE/I/rOnuU7osZL/BBTU
   u89XtXkQI2O1YQB8ucOuzJH1kgZoOeJT9TKNv8hfw9G7uApFfQW4XDzyw
   QtNRm3X9Dxg13FrtCjrApxRu0DikdB42qlcOvAZxEb7MZqtGe3JY2TYNS
   uyX0/XYgpyDl7oU1sa9X5yolSPHml7mnM2GH0OQhhU97vRHgA2Vl4kQ5t
   uWFnjNYoFbyB7KNtXUR/pTr8BTOMlalNXCGo3apV3O6L9pcurDrO+def2
   g==;
X-CSE-ConnectionGUID: toqhOngjRk2/PE0Ipl0zrw==
X-CSE-MsgGUID: 9bwPcs++TGukKGFR51vQJA==
X-IronPort-AV: E=Sophos;i="6.04,340,1695657600"; 
   d="scan'208";a="6822651"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2024 14:21:05 +0800
IronPort-SDR: 8XW0as5r0GBhnpQx/MGFOc9tzUZFRIcvlCoIgk4HjgJgJjR/yfWAnDEE/ddIIMxt57YUnbWzs8
 xYNPRmZZenXA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Jan 2024 21:31:26 -0800
IronPort-SDR: mbcn1uVdPMlWJtWTSMby11aUm2OU1Wg9BZ9ybJZ0CzUU6PoxJwxnFLbP0xD5ZUQZ7oqd4vTuaz
 fD4uxPnrLXLQ==
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.66.30])
  by uls-op-cesaip02.wdc.com with ESMTP; 07 Jan 2024 22:21:03 -0800
From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Klara Modin <klarasmodin@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [PATCH v6 1/2] platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe
Date: Mon,  8 Jan 2024 15:20:58 +0900
Message-ID: <20240108062059.3583028-2-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
References: <20240108062059.3583028-1-shinichiro.kawasaki@wdc.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

p2sb_bar() unhides P2SB device to get resources from the device. It
guards the operation by locking pci_rescan_remove_lock so that parallel
rescans do not find the P2SB device. However, this lock causes deadlock
when PCI bus rescan is triggered by /sys/bus/pci/rescan. The rescan
locks pci_rescan_remove_lock and probes PCI devices. When PCI devices
call p2sb_bar() during probe, it locks pci_rescan_remove_lock again.
Hence the deadlock.

To avoid the deadlock, do not lock pci_rescan_remove_lock in p2sb_bar().
Instead, do the lock at fs_initcall. Introduce p2sb_cache_resources()
for fs_initcall which gets and caches the P2SB resources. At p2sb_bar(),
refer the cache and return to the caller.

Before operating the device at P2SB DEVFN for resource cache, check
that its device class is PCI_CLASS_MEMORY_OTHER 0x0580 that PCH
specifications define. This avoids unexpected operation to other devices
at the same DEVFN.

Link: https://lore.kernel.org/linux-pci/6xb24fjmptxxn5js2fjrrddjae6twex5bjaftwqsuawuqqqydx@7cl3uik5ef6j/
Fixes: 9745fb07474f ("platform/x86/intel: Add Primary to Sideband (P2SB) bridge support")
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
---
 drivers/platform/x86/p2sb.c | 181 ++++++++++++++++++++++++++++--------
 1 file changed, 140 insertions(+), 41 deletions(-)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 1cf2471d54dd..061d22ad6548 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -26,6 +26,21 @@ static const struct x86_cpu_id p2sb_cpu_ids[] = {
 	{}
 };
 
+/*
+ * Cache BAR0 of P2SB device functions 0 to 7.
+ * TODO: The constant 8 is the number of functions that PCI specification
+ *       defines. Same definitions exist tree-wide. Unify this definition and
+ *       the other definitions then move to include/uapi/linux/pci.h.
+ */
+#define NR_P2SB_RES_CACHE 8
+
+struct p2sb_res_cache {
+	u32 bus_dev_id;
+	struct resource res;
+};
+
+static struct p2sb_res_cache p2sb_resources[NR_P2SB_RES_CACHE];
+
 static int p2sb_get_devfn(unsigned int *devfn)
 {
 	unsigned int fn = P2SB_DEVFN_DEFAULT;
@@ -39,8 +54,16 @@ static int p2sb_get_devfn(unsigned int *devfn)
 	return 0;
 }
 
+static bool p2sb_valid_resource(struct resource *res)
+{
+	if (res->flags)
+		return true;
+
+	return false;
+}
+
 /* Copy resource from the first BAR of the device in question */
-static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
+static void p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 {
 	struct resource *bar0 = &pdev->resource[0];
 
@@ -56,49 +79,67 @@ static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
 	mem->end = bar0->end;
 	mem->flags = bar0->flags;
 	mem->desc = bar0->desc;
-
-	return 0;
 }
 
-static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+static void p2sb_scan_and_cache_devfn(struct pci_bus *bus, unsigned int devfn)
 {
+	struct p2sb_res_cache *cache = &p2sb_resources[PCI_FUNC(devfn)];
 	struct pci_dev *pdev;
-	int ret;
 
 	pdev = pci_scan_single_device(bus, devfn);
 	if (!pdev)
-		return -ENODEV;
+		return;
 
-	ret = p2sb_read_bar0(pdev, mem);
+	p2sb_read_bar0(pdev, &cache->res);
+	cache->bus_dev_id = bus->dev.id;
 
 	pci_stop_and_remove_bus_device(pdev);
-	return ret;
+	return;
 }
 
-/**
- * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
- * @bus: PCI bus to communicate with
- * @devfn: PCI slot and function to communicate with
- * @mem: memory resource to be filled in
- *
- * The BIOS prevents the P2SB device from being enumerated by the PCI
- * subsystem, so we need to unhide and hide it back to lookup the BAR.
- *
- * if @bus is NULL, the bus 0 in domain 0 will be used.
- * If @devfn is 0, it will be replaced by devfn of the P2SB device.
- *
- * Caller must provide a valid pointer to @mem.
- *
- * Locking is handled by pci_rescan_remove_lock mutex.
- *
- * Return:
- * 0 on success or appropriate errno value on error.
- */
-int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+static int p2sb_scan_and_cache(struct pci_bus *bus, unsigned int devfn)
+{
+	unsigned int slot, fn;
+
+	if (PCI_FUNC(devfn) == 0) {
+		/*
+		 * When function number of the P2SB device is zero, scan it and
+		 * other function numbers, and if devices are available, cache
+		 * their BAR0s.
+		 */
+		slot = PCI_SLOT(devfn);
+		for (fn = 0; fn < NR_P2SB_RES_CACHE; fn++)
+			p2sb_scan_and_cache_devfn(bus, PCI_DEVFN(slot, fn));
+	} else {
+		/* Scan the P2SB device and cache its BAR0 */
+		p2sb_scan_and_cache_devfn(bus, devfn);
+	}
+
+	if (!p2sb_valid_resource(&p2sb_resources[PCI_FUNC(devfn)].res))
+		return -ENOENT;
+
+	return 0;
+}
+
+static struct pci_bus *p2sb_get_bus(struct pci_bus *bus)
+{
+	static struct pci_bus *p2sb_bus;
+
+	bus = bus ?: p2sb_bus;
+	if (bus)
+		return bus;
+
+	/* Assume P2SB is on the bus 0 in domain 0 */
+	p2sb_bus = pci_find_bus(0, 0);
+	return p2sb_bus;
+}
+
+static int p2sb_cache_resources(void)
 {
-	struct pci_dev *pdev_p2sb;
 	unsigned int devfn_p2sb;
 	u32 value = P2SBC_HIDE;
+	struct pci_bus *bus;
+	u16 class;
 	int ret;
 
 	/* Get devfn for P2SB device itself */
@@ -106,8 +147,17 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	if (ret)
 		return ret;
 
-	/* if @bus is NULL, use bus 0 in domain 0 */
-	bus = bus ?: pci_find_bus(0, 0);
+	bus = p2sb_get_bus(NULL);
+	if (!bus)
+		return -ENODEV;
+
+	/*
+	 * When a device with same devfn exists and its device class is not
+	 * PCI_CLASS_MEMORY_OTHER for P2SB, do not touch it.
+	 */
+	pci_bus_read_config_word(bus, devfn_p2sb, PCI_CLASS_DEVICE, &class);
+	if (!PCI_POSSIBLE_ERROR(class) && class != PCI_CLASS_MEMORY_OTHER)
+		return -ENODEV;
 
 	/*
 	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
@@ -115,17 +165,16 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 	 */
 	pci_lock_rescan_remove();
 
-	/* Unhide the P2SB device, if needed */
+	/*
+	 * The BIOS prevents the P2SB device from being enumerated by the PCI
+	 * subsystem, so we need to unhide and hide it back to lookup the BAR.
+	 * Unhide the P2SB device here, if needed.
+	 */
 	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
 	if (value & P2SBC_HIDE)
 		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
 
-	pdev_p2sb = pci_scan_single_device(bus, devfn_p2sb);
-	if (devfn)
-		ret = p2sb_scan_and_read(bus, devfn, mem);
-	else
-		ret = p2sb_read_bar0(pdev_p2sb, mem);
-	pci_stop_and_remove_bus_device(pdev_p2sb);
+	ret = p2sb_scan_and_cache(bus, devfn_p2sb);
 
 	/* Hide the P2SB device, if it was hidden */
 	if (value & P2SBC_HIDE)
@@ -133,12 +182,62 @@ int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
 
 	pci_unlock_rescan_remove();
 
-	if (ret)
-		return ret;
+	return ret;
+}
+
+/**
+ * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
+ * @bus: PCI bus to communicate with
+ * @devfn: PCI slot and function to communicate with
+ * @mem: memory resource to be filled in
+ *
+ * If @bus is NULL, the bus 0 in domain 0 will be used.
+ * If @devfn is 0, it will be replaced by devfn of the P2SB device.
+ *
+ * Caller must provide a valid pointer to @mem.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+{
+	struct p2sb_res_cache *cache;
+	int ret;
+
+	bus = p2sb_get_bus(bus);
+	if (!bus)
+		return -ENODEV;
+
+	if (!devfn) {
+		ret = p2sb_get_devfn(&devfn);
+		if (ret)
+			return ret;
+	}
 
-	if (mem->flags == 0)
+	cache = &p2sb_resources[PCI_FUNC(devfn)];
+	if (cache->bus_dev_id != bus->dev.id)
 		return -ENODEV;
 
+	if (!p2sb_valid_resource(&cache->res))
+		return -ENOENT;
+
+	memcpy(mem, &cache->res, sizeof(*mem));
 	return 0;
 }
 EXPORT_SYMBOL_GPL(p2sb_bar);
+
+static int __init p2sb_fs_init(void)
+{
+	p2sb_cache_resources();
+	return 0;
+}
+
+/*
+ * pci_rescan_remove_lock to avoid access to unhidden P2SB devices can
+ * not be locked in sysfs pci bus rescan path because of deadlock. To
+ * avoid the deadlock, access to P2SB devices with the lock at an early
+ * step in kernel initialization and cache required resources. This
+ * should happen after subsys_initcall which initializes PCI subsystem
+ * and before device_initcall which requires P2SB resources.
+ */
+fs_initcall(p2sb_fs_init);
-- 
2.43.0


