Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A8F6A8473
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Mar 2023 15:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjCBOsC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Mar 2023 09:48:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230088AbjCBOrw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:52 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 254FD41B40
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:50 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDd-0003r8-30; Thu, 02 Mar 2023 15:47:41 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDZ-001Lqx-AC; Thu, 02 Mar 2023 15:47:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDY-001ZpQ-KV; Thu, 02 Mar 2023 15:47:36 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Andrea Ho <Andrea.Ho@advantech.com.tw>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 02/29] platform/x86: adv_swbutton: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:05 +0100
Message-Id: <20230302144732.1903781-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=S11c6ENi4+/lxeQmRpXtLc6wBlJ/k8mkXkXP9+wKzJw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALaJOzTBveIAfTSCwQvRQ6uJZTExOKijXVmnq qFL+oafJ/qJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC2iQAKCRDB/BR4rcrs CX4RCACc/Z4VGxknmml3BqrqXgbspWm+mRxcVMhLNbb7hh/TMfV8fT7/KjiKPOSmxTm2fEXQOgB RevAeCjJRHEI1wyf82FUjtvLMHMkp5bFrdcR6VRN7ESVo6G9crT/7BPH/Qbz16EFzSr/A2m3Y8c IerD01wHq3i+loNgoZ4ltSlW/Ts1KEUunXaD4jqOL6wjYtIksSjNBnWmyrQxUIMgE7pR2B2QDD5 ILPE1CDdE/44UGnn/2gnmSkH2dPP/R90vxVJwUlQb0J1MebVM5Cw6bEiNK9nLRdeLspslS9IFqN nZIgSGbdcEf8DI+aFNF8yQCns7WXQtspY5N+d62Y+vGrgMdB
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is (mostly) ignored
and this typically results in resource leaks. To improve here there is a
quest to make the remove callback return void. In the first step of this
quest all drivers are converted to .remove_new() which already returns
void.

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/adv_swbutton.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/adv_swbutton.c
index 38693b735c87..6b23ba78e028 100644
--- a/drivers/platform/x86/adv_swbutton.c
+++ b/drivers/platform/x86/adv_swbutton.c
@@ -90,14 +90,12 @@ static int adv_swbutton_probe(struct platform_device *device)
 	return 0;
 }
 
-static int adv_swbutton_remove(struct platform_device *device)
+static void adv_swbutton_remove(struct platform_device *device)
 {
 	acpi_handle handle = ACPI_HANDLE(&device->dev);
 
 	acpi_remove_notify_handler(handle, ACPI_DEVICE_NOTIFY,
 				   adv_swbutton_notify);
-
-	return 0;
 }
 
 static const struct acpi_device_id button_device_ids[] = {
@@ -112,7 +110,7 @@ static struct platform_driver adv_swbutton_driver = {
 		.acpi_match_table = button_device_ids,
 	},
 	.probe = adv_swbutton_probe,
-	.remove = adv_swbutton_remove,
+	.remove_new = adv_swbutton_remove,
 };
 module_platform_driver(adv_swbutton_driver);
 
-- 
2.39.1

