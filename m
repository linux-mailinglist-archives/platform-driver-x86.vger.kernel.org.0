Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F6D7AFDCE
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Sep 2023 10:11:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjI0ILf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 27 Sep 2023 04:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbjI0ILD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2023 04:11:03 -0400
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F45119C
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Sep 2023 01:10:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlPdC-00086t-Jn; Wed, 27 Sep 2023 10:10:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlPdB-009I7y-QL; Wed, 27 Sep 2023 10:10:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qlPdB-005BRG-H4; Wed, 27 Sep 2023 10:10:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Hans de Goede <hdegoede@redhat.com>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH 19/27] platform/mellanox: nvsw-sn2201: Convert to platform remove callback returning void
Date:   Wed, 27 Sep 2023 10:10:32 +0200
Message-Id: <20230927081040.2198742-20-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
References: <20230927081040.2198742-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2047; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=6XfHk0S7bPOzQoL6+8JJudU1CUxgDhv75KyTmedpZUw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlE+NzWIGN/61OxNnBHOlQieO5BOjJVQ2TaOhNX iAEfMwuXiOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZRPjcwAKCRCPgPtYfRL+ TmI+B/4weiDZumoyGKba8bd4q0TK/I1+YV8rcG4ye97HqiBQ5ZF0vpggBZSSoHvyT3HyCccblJS wUZ/r1gPvOlJ2itBa+UySAtoAwwXKUEmP014qU4GGFN3pLL6u8kIKX11gkINJylWdAK0yZ747JT 55unsHgiUKSiqgeke7PiOy7lwuzwjrQktjbr7bf4WfjGm9cSXYmOxM7d6+USokuKWXAMrv+9Fbi JJhEN/aMGpxCxH5+R4m3E5g4JtGi/rqq7RhAkdEvHkWllgNNeqMu6NoIoSJTIyMfTrIU732GK+Q THruy2dF3ffrYZY4qibyYdJoT/EKNOLwdz69i5oH7HR9CX0H
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The .remove() callback for a platform driver returns an int which makes
many driver authors wrongly assume it's possible to do error handling by
returning an error code. However the value returned is ignored (apart
from emitting a warning) and this typically results in resource leaks.

To improve here there is a quest to make the remove callback return
void. In the first step of this quest all drivers are converted to
.remove_new(), which already returns void. Eventually after all drivers
are converted, .remove_new() will be renamed to .remove().

Trivially convert this driver from always returning zero in the remove
callback to the void returning variant.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/mellanox/nvsw-sn2201.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mellanox/nvsw-sn2201.c b/drivers/platform/mellanox/nvsw-sn2201.c
index 75b699676ca6..3ef655591424 100644
--- a/drivers/platform/mellanox/nvsw-sn2201.c
+++ b/drivers/platform/mellanox/nvsw-sn2201.c
@@ -1217,7 +1217,7 @@ static int nvsw_sn2201_probe(struct platform_device *pdev)
 	return nvsw_sn2201_config_pre_init(nvsw_sn2201);
 }
 
-static int nvsw_sn2201_remove(struct platform_device *pdev)
+static void nvsw_sn2201_remove(struct platform_device *pdev)
 {
 	struct nvsw_sn2201 *nvsw_sn2201 = platform_get_drvdata(pdev);
 
@@ -1239,8 +1239,6 @@ static int nvsw_sn2201_remove(struct platform_device *pdev)
 	/* Unregister I2C controller. */
 	if (nvsw_sn2201->pdev_i2c)
 		platform_device_unregister(nvsw_sn2201->pdev_i2c);
-
-	return 0;
 }
 
 static const struct acpi_device_id nvsw_sn2201_acpi_ids[] = {
@@ -1252,7 +1250,7 @@ MODULE_DEVICE_TABLE(acpi, nvsw_sn2201_acpi_ids);
 
 static struct platform_driver nvsw_sn2201_driver = {
 	.probe = nvsw_sn2201_probe,
-	.remove = nvsw_sn2201_remove,
+	.remove_new = nvsw_sn2201_remove,
 	.driver = {
 		.name = "nvsw-sn2201",
 	.acpi_match_table = nvsw_sn2201_acpi_ids,
-- 
2.40.1

