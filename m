Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0833E2979
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Aug 2021 13:24:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245450AbhHFLYY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 6 Aug 2021 07:24:24 -0400
Received: from mga11.intel.com ([192.55.52.93]:4920 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242343AbhHFLYY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 07:24:24 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="211249181"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="211249181"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 04:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="523425420"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 06 Aug 2021 04:24:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 5B6DB11C; Fri,  6 Aug 2021 14:17:39 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>, Rob Herring <robh@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 1/2] serdev: Split and export serdev_acpi_get_uart_resource()
Date:   Fri,  6 Aug 2021 14:17:35 +0300
Message-Id: <20210806111736.66591-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The same as for I²C Serial Bus resource split and export
serdev_acpi_get_uart_resource(). We have already a few users
one of which is converted here.

Rationale of this is to consolidate parsing UART Serial Bus
resource in one place as it's done, e.g., for I²C Serial Bus.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
---
v3: amended kernel doc to have RETURN section (Jiri)
 drivers/tty/serdev/core.c | 36 +++++++++++++++++++++++++++++-------
 include/linux/serdev.h    | 14 ++++++++++++++
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serdev/core.c b/drivers/tty/serdev/core.c
index 92498961fd92..f1324fe99378 100644
--- a/drivers/tty/serdev/core.c
+++ b/drivers/tty/serdev/core.c
@@ -562,23 +562,45 @@ struct acpi_serdev_lookup {
 	int index;
 };
 
+/**
+ * serdev_acpi_get_uart_resource - Gets UARTSerialBus resource if type matches
+ * @ares:	ACPI resource
+ * @uart:	Pointer to UARTSerialBus resource will be returned here
+ *
+ * Checks if the given ACPI resource is of type UARTSerialBus.
+ * In this case, returns a pointer to it to the caller.
+ *
+ * Return: True if resource type is of UARTSerialBus, otherwise false.
+ */
+bool serdev_acpi_get_uart_resource(struct acpi_resource *ares,
+				   struct acpi_resource_uart_serialbus **uart)
+{
+	struct acpi_resource_uart_serialbus *sb;
+
+	if (ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
+		return false;
+
+	sb = &ares->data.uart_serial_bus;
+	if (sb->type != ACPI_RESOURCE_SERIAL_TYPE_UART)
+		return false;
+
+	*uart = sb;
+	return true;
+}
+EXPORT_SYMBOL_GPL(serdev_acpi_get_uart_resource);
+
 static int acpi_serdev_parse_resource(struct acpi_resource *ares, void *data)
 {
 	struct acpi_serdev_lookup *lookup = data;
 	struct acpi_resource_uart_serialbus *sb;
 	acpi_status status;
 
-	if (ares->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
-		return 1;
-
-	if (ares->data.common_serial_bus.type != ACPI_RESOURCE_SERIAL_TYPE_UART)
+	if (!serdev_acpi_get_uart_resource(ares, &sb))
 		return 1;
 
 	if (lookup->index != -1 && lookup->n++ != lookup->index)
 		return 1;
 
-	sb = &ares->data.uart_serial_bus;
-
 	status = acpi_get_handle(lookup->device_handle,
 				 sb->resource_source.string_ptr,
 				 &lookup->controller_handle);
@@ -586,7 +608,7 @@ static int acpi_serdev_parse_resource(struct acpi_resource *ares, void *data)
 		return 1;
 
 	/*
-	 * NOTE: Ideally, we would also want to retreive other properties here,
+	 * NOTE: Ideally, we would also want to retrieve other properties here,
 	 * once setting them before opening the device is supported by serdev.
 	 */
 
diff --git a/include/linux/serdev.h b/include/linux/serdev.h
index 9f14f9c12ec4..3368c261ab62 100644
--- a/include/linux/serdev.h
+++ b/include/linux/serdev.h
@@ -327,4 +327,18 @@ static inline int serdev_tty_port_unregister(struct tty_port *port)
 }
 #endif /* CONFIG_SERIAL_DEV_CTRL_TTYPORT */
 
+struct acpi_resource;
+struct acpi_resource_uart_serialbus;
+
+#ifdef CONFIG_ACPI
+bool serdev_acpi_get_uart_resource(struct acpi_resource *ares,
+				   struct acpi_resource_uart_serialbus **uart);
+#else
+static inline bool serdev_acpi_get_uart_resource(struct acpi_resource *ares,
+						 struct acpi_resource_uart_serialbus **uart)
+{
+	return false;
+}
+#endif /* CONFIG_ACPI */
+
 #endif /*_LINUX_SERDEV_H */
-- 
2.30.2

