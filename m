Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE321234C22
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 22:21:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728477AbgGaUVB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 16:21:01 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:15950 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgGaUVB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 16:21:01 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f247cfe0000>; Fri, 31 Jul 2020 13:20:14 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 13:21:01 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 Jul 2020 13:21:01 -0700
Received: from lenny.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 20:21:00 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     <platform-driver-x86@vger.kernel.org>,
        <mario.limonciello@dell.com>, <pobrn@protonmail.com>
CC:     <andy@infradead.org>, <dvhart@infradead.org>,
        <aplattner@nvidia.com>, Daniel Dadap <ddadap@nvidia.com>
Subject: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when no GUID is found
Date:   Fri, 31 Jul 2020 15:21:54 -0500
Message-ID: <20200731202154.11382-2-ddadap@nvidia.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20200731202154.11382-1-ddadap@nvidia.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596226814; bh=RB+wi6G36g3YvHCpahYOFO6ReVvK2FAxZg1nMEg8Nu4=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         X-Originating-IP:X-ClientProxiedBy:Content-Type;
        b=RMjz0o5vTU1fH3VucodaKjUGMmAa9OdVcZJ93EXGyJ8UjYL8Fu7/YEgRfEtWk4nCP
         sjxnGYLynSArOT8G1ormZwfmkN/fe74aUIsgFab6+/4WvIAdKTeEUaG8BcQui1WvKK
         1ork9ce8GY9JYf5csPx0jXibFA8TzChI+nsRz9Zh32xkHqmgYKvz+fjKbF1JuWw285
         QvJQVBI7MkbP0x+QOt/elX7TEdq8jxMCRvjbYchWUOpxF7Wd/uVCcgNPVoIcn1ojUJ
         OY0o6J+K+XcjfmzhfuSI0zSYVLahdOWiyY5e5BSn6QnIByIA3FI20A6bg5k4QNierJ
         4A4e37NurJ5og==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

If a driver registers with WMI, and none of the GUIDs in its ID table
is present on the system, then that driver will not be probed and
automatically loaded. However, it is still possible to load such a
driver explicitly on a system which doesn't include the relevant
hardware.

Update wmi_driver_register to test for the presence of at least one
GUID from the driver's ID table at driver registration time, and
fail registration if none are found.

Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
---
 drivers/platform/x86/wmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 941739db7199..19aa23d1cf8e 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -130,6 +130,21 @@ static bool find_guid(const char *guid_string, struct wmi_block **out)
 	return false;
 }
 
+static bool find_driver_guid(const struct wmi_driver *wdriver)
+{
+	const struct wmi_device_id *id;
+
+	if (wdriver == NULL)
+		return false;
+
+	for (id = wdriver->id_table; *id->guid_string; id++) {
+		if (find_guid(id->guid_string, NULL))
+			return true;
+	}
+
+	return false;
+}
+
 static const void *find_guid_context(struct wmi_block *wblock,
 				      struct wmi_driver *wdriver)
 {
@@ -1419,6 +1434,9 @@ static int acpi_wmi_probe(struct platform_device *device)
 int __must_check __wmi_driver_register(struct wmi_driver *driver,
 				       struct module *owner)
 {
+	if (!find_driver_guid(driver))
+		return -ENODEV;
+
 	driver->driver.owner = owner;
 	driver->driver.bus = &wmi_bus_type;
 
-- 
2.18.4

