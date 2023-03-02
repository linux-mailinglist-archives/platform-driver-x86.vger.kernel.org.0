Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E19886A846A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Mar 2023 15:47:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbjCBOry (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Mar 2023 09:47:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230038AbjCBOru (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5644E43938
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:48 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDb-0003r9-2P; Thu, 02 Mar 2023 15:47:39 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDZ-001Lr2-Mo; Thu, 02 Mar 2023 15:47:37 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDY-001ZpT-RI; Thu, 02 Mar 2023 15:47:36 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Carlos Bilbao <carlos.bilbao@amd.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/29] platform/x86: amd: hsmp: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:06 +0100
Message-Id: <20230302144732.1903781-4-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1461; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=qgD6Fu+TwEiUbD68TORw2X6DDiB/hL0lY5kxPSiVZIw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALaNEhHeZybd0i9WVR1+OP5V0++Ct8ZKYQXPY SR2dxnaPy+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC2jQAKCRDB/BR4rcrs CQblCACBa4XFyZ4EUSa9UsFxt52M+imRA1OkAW1aKR1jxMnUiTcge54noOrMVuW74wFatFUm4NC 1Q8G6WymgHcOyA8lgiaCEnTRX0CQ+1XixLaF+e2arwIIip0NHBg3BLbkUiz9d63pw26wRnvASeU 2SpxelmAMaY+szOQFdktT0TsizOcP9P52roVXL85e/zjyuRORno1h4XmoKKwNPVn0lZI5tfR0TP fiGLEacB1nOkpS3IoN0ffYQft7CtBooBfAJs38jV2M23JHOrwCStfofeEMw5PJeqkW9ui9n3jKB qgtmpVfYYKak/c9x/8OUs1sLGdLqfTcyJcIHxklaGVrNr2Rk
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
 drivers/platform/x86/amd/hsmp.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
index 521c6a229362..31382ef52efb 100644
--- a/drivers/platform/x86/amd/hsmp.c
+++ b/drivers/platform/x86/amd/hsmp.c
@@ -340,16 +340,14 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
 	return misc_register(&hsmp_device);
 }
 
-static int hsmp_pltdrv_remove(struct platform_device *pdev)
+static void hsmp_pltdrv_remove(struct platform_device *pdev)
 {
 	misc_deregister(&hsmp_device);
-
-	return 0;
 }
 
 static struct platform_driver amd_hsmp_driver = {
 	.probe		= hsmp_pltdrv_probe,
-	.remove		= hsmp_pltdrv_remove,
+	.remove_new	= hsmp_pltdrv_remove,
 	.driver		= {
 		.name	= DRIVER_NAME,
 	},
-- 
2.39.1

