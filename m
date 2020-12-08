Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F572D2079
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Dec 2020 03:08:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727057AbgLHCHH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Dec 2020 21:07:07 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:53929 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbgLHCHG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 21:07:06 -0500
Received: from 2.general.alexhung.us.vpn ([10.172.65.255] helo=canonical.com)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <alex.hung@canonical.com>)
        id 1kmSOV-0008On-5o; Tue, 08 Dec 2020 02:06:23 +0000
From:   Alex Hung <alex.hung@canonical.com>
To:     alex.hung@canonical.com, hdegoede@redhat.com,
        mgross@linux.intel.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel-hid: add Rocket Lake ACPI device ID
Date:   Mon,  7 Dec 2020 19:06:20 -0700
Message-Id: <20201208020620.101455-1-alex.hung@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Rocket Lake has a new ACPI ID for Intel HID event filter device.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/intel-hid.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
index 8626197..a65c48c 100644
--- a/drivers/platform/x86/intel-hid.c
+++ b/drivers/platform/x86/intel-hid.c
@@ -21,6 +21,7 @@ MODULE_AUTHOR("Alex Hung");
 static const struct acpi_device_id intel_hid_ids[] = {
 	{"INT33D5", 0},
 	{"INTC1051", 0},
+	{"INTC1054", 0},
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
-- 
2.7.4

