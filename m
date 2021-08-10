Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A8333E297C
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Aug 2021 13:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245468AbhHFLYZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 6 Aug 2021 07:24:25 -0400
Received: from mga11.intel.com ([192.55.52.93]:4920 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245463AbhHFLYZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Aug 2021 07:24:25 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10067"; a="211249182"
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="211249182"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2021 04:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,300,1620716400"; 
   d="scan'208";a="669402149"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 06 Aug 2021 04:24:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8172A15E; Fri,  6 Aug 2021 14:17:40 +0300 (EEST)
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
Subject: [PATCH v3 2/2] platform/surface: aggregator: Use serdev_acpi_get_uart_resource() helper
Date:   Fri,  6 Aug 2021 14:17:36 +0300
Message-Id: <20210806111736.66591-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806111736.66591-1-andriy.shevchenko@linux.intel.com>
References: <20210806111736.66591-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

serdev provides a generic helper to get UART Serial Bus resources.
Use it instead of an open coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
v3: no changes
 drivers/platform/surface/aggregator/core.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
index 279d9df19c01..c61bbeeec2df 100644
--- a/drivers/platform/surface/aggregator/core.c
+++ b/drivers/platform/surface/aggregator/core.c
@@ -301,20 +301,13 @@ static acpi_status ssam_serdev_setup_via_acpi_crs(struct acpi_resource *rsc,
 						  void *ctx)
 {
 	struct serdev_device *serdev = ctx;
-	struct acpi_resource_common_serialbus *serial;
 	struct acpi_resource_uart_serialbus *uart;
 	bool flow_control;
 	int status = 0;
 
-	if (rsc->type != ACPI_RESOURCE_TYPE_SERIAL_BUS)
+	if (!serdev_acpi_get_uart_resource(rsc, &uart))
 		return AE_OK;
 
-	serial = &rsc->data.common_serial_bus;
-	if (serial->type != ACPI_RESOURCE_SERIAL_TYPE_UART)
-		return AE_OK;
-
-	uart = &rsc->data.uart_serial_bus;
-
 	/* Set up serdev device. */
 	serdev_device_set_baudrate(serdev, uart->default_baud_rate);
 
-- 
2.30.2

