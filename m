Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F336030F481
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Feb 2021 15:06:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236602AbhBDOEW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Feb 2021 09:04:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24599 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236477AbhBDODg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 09:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612447330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=1T6E6hRus1e5llbVYMcvcCrA20et2NSSAcNG0kJJ9z4=;
        b=E6ecI6GAzNW/GL+mlhO2XeccPXdDPvk2jNndyf/MWkZYdDFxco8oJkBU2bWIlBT2/buIxN
        t+XxDqQ4dbM4uEOpE/3VPhLCl5OcbHExhLApxddQvP533xSWGWWGkjQiZx/HDakmCXfdkc
        g0U5SzcwudLpbKqJjOsruOLInmL0wbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-xfuYXn4NPZGo3eo4YAaxrg-1; Thu, 04 Feb 2021 09:02:08 -0500
X-MC-Unique: xfuYXn4NPZGo3eo4YAaxrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 395D1C73A9;
        Thu,  4 Feb 2021 14:02:07 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-112.ams2.redhat.com [10.36.112.112])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4211010023B9;
        Thu,  4 Feb 2021 14:02:05 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: acer-wmi: Don't use ACPI_EXCEPTION()
Date:   Thu,  4 Feb 2021 15:02:05 +0100
Message-Id: <20210204140205.268344-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

ACPI_EXCEPTION is only intended for internal use by the ACPICA code.

ACPI_EXCEPTION was being used here to change the apci_status code into
something human-readable, use acpi_format_exception() for this instead,
which is the proper way to do this outside of ACPICA.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/acer-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index c1a5357da885..85db9403cc14 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -30,7 +30,6 @@
 #include <linux/input/sparse-keymap.h>
 #include <acpi/video.h>
 
-ACPI_MODULE_NAME(KBUILD_MODNAME);
 MODULE_AUTHOR("Carlos Corbacho");
 MODULE_DESCRIPTION("Acer Laptop WMI Extras Driver");
 MODULE_LICENSE("GPL");
@@ -1605,7 +1604,8 @@ static void acer_kbd_dock_get_initial_state(void)
 
 	status = wmi_evaluate_method(WMID_GUID3, 0, 0x2, &input_buf, &output_buf);
 	if (ACPI_FAILURE(status)) {
-		ACPI_EXCEPTION((AE_INFO, status, "Error getting keyboard-dock initial status"));
+		pr_err("Error getting keyboard-dock initial status: %s\n",
+		       acpi_format_exception(status));
 		return;
 	}
 
-- 
2.29.2

