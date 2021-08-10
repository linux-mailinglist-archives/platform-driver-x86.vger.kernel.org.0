Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDE93DF5A5
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Aug 2021 21:29:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239940AbhHCT3O (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 3 Aug 2021 15:29:14 -0400
Received: from mga09.intel.com ([134.134.136.24]:32499 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239930AbhHCT3N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 15:29:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10065"; a="213747206"
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="213747206"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2021 12:29:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,292,1620716400"; 
   d="scan'208";a="511459759"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2021 12:28:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A5544269; Tue,  3 Aug 2021 22:29:25 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v1 4/5] Bluetooth: hci_bcm: Use acpi_gpio_get_*_resource() helpers
Date:   Tue,  3 Aug 2021 22:29:04 +0300
Message-Id: <20210803192905.72246-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210803192905.72246-1-andriy.shevchenko@linux.intel.com>
References: <20210803192905.72246-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACPI provides generic helpers to get GPIO interrupt and IO resources.
Use it instead of open coded variant.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/bluetooth/hci_bcm.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm.c b/drivers/bluetooth/hci_bcm.c
index 16f854ac19b6..ed99fcde2523 100644
--- a/drivers/bluetooth/hci_bcm.c
+++ b/drivers/bluetooth/hci_bcm.c
@@ -911,15 +911,6 @@ static int bcm_resource(struct acpi_resource *ares, void *data)
 		dev->irq_active_low = true;
 		break;
 
-	case ACPI_RESOURCE_TYPE_GPIO:
-		gpio = &ares->data.gpio;
-		if (gpio->connection_type == ACPI_RESOURCE_GPIO_TYPE_INT) {
-			dev->gpio_int_idx = dev->gpio_count;
-			dev->irq_active_low = gpio->polarity == ACPI_ACTIVE_LOW;
-		}
-		dev->gpio_count++;
-		break;
-
 	default:
 		break;
 	}
@@ -927,6 +918,12 @@ static int bcm_resource(struct acpi_resource *ares, void *data)
 	if (serdev_acpi_get_uart_resource(ares, &uart)) {
 		dev->init_speed = uart->default_baud_rate;
 		dev->oper_speed = 4000000;
+	} else if (acpi_gpio_get_irq_resource(ares, &gpio)) {
+		dev->gpio_int_idx = dev->gpio_count;
+		dev->irq_active_low = gpio->polarity == ACPI_ACTIVE_LOW;
+		dev->gpio_count++;
+	} else if (acpi_gpio_get_io_resource(ares, &gpio)) {
+		dev->gpio_count++;
 	}
 
 	return 0;
-- 
2.30.2

