Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 050D864B98C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 13 Dec 2022 17:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiLMQYL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 13 Dec 2022 11:24:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234940AbiLMQYK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Dec 2022 11:24:10 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96E88BF7
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Dec 2022 08:24:09 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584b-00013R-Jl; Tue, 13 Dec 2022 17:24:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584Z-004Hou-Sz; Tue, 13 Dec 2022 17:24:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p584Z-004orD-Ss; Tue, 13 Dec 2022 17:24:03 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/3] platform/x86: acerhdf: Drop empty platform remove function
Date:   Tue, 13 Dec 2022 17:23:57 +0100
Message-Id: <20221213162359.651529-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
References: <20221213162359.651529-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=uhsJ/1HGiBY9gbicwgCY68oXdBwmVW/9PxYPdzIU59U=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjmKcTz3OOX/xadDCb0FL9ziUiEHUMiDz2wcz64lgg EwS0DIyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5inEwAKCRDB/BR4rcrsCfmxB/ 9Nh0A4fO+U9pPaZHaWW1wS8yLd7utVTvQS3S6k9qhJbB3VWpIyH0Kks95S8GTSesOennUFoj/4CMXB p2BhoKCuQcsYPPmTPM7H9yF8a2rLuswQ2cCZvBdenB9E5rcQjwOuKhmQ72VsQ4mDFZ4+hxToLAYG8z 5Ge9FwnulAJqPtFujfEglUcwzdSjj8v4ADL8V/iHF4AF9xIN0ShhXb+A8oaEBkAm+3bmUxUDc3WqUD vpY4uvDbdmlo+5LkaV/1BVONT9SFmEUau+yhl7k9XY0gDHalab+4iwcd85uynWTUqt8xXsAQp5LOlM AwFj6kBXVfhy2oWdwh1rtQ8qwheg85
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

A remove callback just returning 0 is equivalent to no remove callback
at all. So drop the useless function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/platform/x86/acerhdf.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index d2c0fc38c201..ed49393d22ed 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -565,11 +565,6 @@ static int acerhdf_probe(struct platform_device *device)
 	return 0;
 }
 
-static int acerhdf_remove(struct platform_device *device)
-{
-	return 0;
-}
-
 static const struct dev_pm_ops acerhdf_pm_ops = {
 	.suspend = acerhdf_suspend,
 	.freeze  = acerhdf_suspend,
@@ -581,7 +576,6 @@ static struct platform_driver acerhdf_driver = {
 		.pm    = &acerhdf_pm_ops,
 	},
 	.probe = acerhdf_probe,
-	.remove = acerhdf_remove,
 };
 
 /* check hardware */
-- 
2.38.1

