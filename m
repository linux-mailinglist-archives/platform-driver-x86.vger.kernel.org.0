Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3F0264F9D
	for <lists+platform-driver-x86@lfdr.de>; Thu, 10 Sep 2020 21:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIJTrP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 10 Sep 2020 15:47:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55457 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731271AbgIJPZS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Sep 2020 11:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599751502;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kCoTUHu/tdQwmi+wZYFHAyhp3vkXMoaBgjFMVvs15EE=;
        b=WQHJhb3ISsHK9CBb/nvO7VJNqUKeZx3C4rqJl66g+gsBkBxqtinzD/zCpiNNvbriNZgPu7
        OI7Q7tP13+lP3hE/CyKCruLrJUm8ZOqZPwP4Up++Nuuys5zqpwbU6LHWrS/+f0IwBkJ0lN
        ZaOLWe7h5rcOp93vStDiMqkLtDk3zwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-9juq9C-CPQeuGlYOv_zncA-1; Thu, 10 Sep 2020 11:08:48 -0400
X-MC-Unique: 9juq9C-CPQeuGlYOv_zncA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F68196AC7C;
        Thu, 10 Sep 2020 15:06:56 +0000 (UTC)
Received: from x1.nl (ovpn-112-105.ams2.redhat.com [10.36.112.105])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D8D641002D65;
        Thu, 10 Sep 2020 15:06:52 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: asus-nb-wmi: Revert "Do not load on Asus T100TA and T200TA"
Date:   Thu, 10 Sep 2020 17:06:50 +0200
Message-Id: <20200910150650.36764-2-hdegoede@redhat.com>
In-Reply-To: <20200910150650.36764-1-hdegoede@redhat.com>
References: <20200910150650.36764-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The WMI INIT method on for some reason turns on the camera LED on these
2-in-1s, without the WMI interface allowing further control over the LED.

To fix this commit b5f7311d3a2e ("platform/x86: asus-nb-wmi: Do not load
on Asus T100TA and T200TA") added a blacklist with these 2 models on it
since the WMI driver did not add any extra functionality to these models.

Recently I've been working on making more 2-in-1 models report their
tablet-mode (SW_TABLET_MODE) to userspace; and I've found that these 2
Asus models report this through WMI. This commit reverts the adding
of the blacklist, so that the Asus WMI driver can be used on these
models to report their tablet-mode. I have another patch fixing the LED
issue in a different manner.

Note this is the second time the we revert the adding of the
asus_nb_wmi_blacklist. It was reverted before in commit:

aab9e7896ec9 ("platform/x86: asus-nb-wmi: Revert "Do not load on Asus
T100TA and T200TA")"

But some how (accidentally re-applying of the patch?) it got re-added
again in commit 3bd12da7f50b ("platform/x86: asus-nb-wmi: Do not load
on Asus T100TA and T200TA"), so now we need to revert it again.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-nb-wmi.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index b2e3d1e3b3e9..680c3640e013 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -593,33 +593,9 @@ static struct asus_wmi_driver asus_nb_wmi_driver = {
 	.detect_quirks = asus_nb_wmi_quirks,
 };
 
-static const struct dmi_system_id asus_nb_wmi_blacklist[] __initconst = {
-	{
-		/*
-		 * asus-nb-wm adds no functionality. The T100TA has a detachable
-		 * USB kbd, so no hotkeys and it has no WMI rfkill; and loading
-		 * asus-nb-wm causes the camera LED to turn and _stay_ on.
-		 */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
-		},
-	},
-	{
-		/* The Asus T200TA has the same issue as the T100TA */
-		.matches = {
-			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T200TA"),
-		},
-	},
-	{} /* Terminating entry */
-};
 
 static int __init asus_nb_wmi_init(void)
 {
-	if (dmi_check_system(asus_nb_wmi_blacklist))
-		return -ENODEV;
-
 	return asus_wmi_register_driver(&asus_nb_wmi_driver);
 }
 
-- 
2.28.0

