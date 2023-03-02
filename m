Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC5D6A846C
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Mar 2023 15:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjCBOr4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Mar 2023 09:47:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjCBOrv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Mar 2023 09:47:51 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD1CD18159
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Mar 2023 06:47:48 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDa-0003rA-P8; Thu, 02 Mar 2023 15:47:38 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDa-001Lr6-0g; Thu, 02 Mar 2023 15:47:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pXkDZ-001Zpb-7B; Thu, 02 Mar 2023 15:47:37 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     kernel@pengutronix.de,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/29] platform/x86: amd: pmf: core: Convert to platform remove callback returning void
Date:   Thu,  2 Mar 2023 15:47:08 +0100
Message-Id: <20230302144732.1903781-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
References: <20230302144732.1903781-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1749; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=NLxovv9AqdM9/bwpLuxYogacX4f0kVeQEwMkH3uF2MA=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBkALaVdEf8Iym4jEzQzhQOe04S9Uf9m2gLZ0/MD dAnrq4FWveJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCZAC2lQAKCRDB/BR4rcrs CRpWB/9pbIaMZy87nfOk+7vTzUoPV7iOdFI8iZOP8bZ1BwiUHKqUYQCWNjrPCRQCbmCWv6kEMAU h/cdt0PUc804WzHHwOK03oQAe6cunZA+fKZaw7S+82drmJ4SdfIVOHsnzvS1sT10+WlDYWvKqJ2 zciWXyZ6eAzSx/TIpMgW6hFPWU91S4U1+kJn85DkINmRPHG8dKY/hvfvPmXvKp2aYCFQ5solVEx HckHwDmEd8Ni8KprTu711Vz1VuJqR7rD8dgBe2pqF2MT++gK58rN+Y/5I6OJulOwSiAA2wLMKVt qQ1Fti6zrucbjL+y4WT+Llo6RhgjGzaDVaygHcTZA6sCVcYU
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
 drivers/platform/x86/amd/pmf/core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index da23639071d7..800ca2c998d3 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -402,7 +402,7 @@ static int amd_pmf_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int amd_pmf_remove(struct platform_device *pdev)
+static void amd_pmf_remove(struct platform_device *pdev)
 {
 	struct amd_pmf_dev *dev = platform_get_drvdata(pdev);
 
@@ -413,7 +413,6 @@ static int amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	kfree(dev->buf);
-	return 0;
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
@@ -428,7 +427,7 @@ static struct platform_driver amd_pmf_driver = {
 		.dev_groups = amd_pmf_driver_groups,
 	},
 	.probe = amd_pmf_probe,
-	.remove = amd_pmf_remove,
+	.remove_new = amd_pmf_remove,
 };
 module_platform_driver(amd_pmf_driver);
 
-- 
2.39.1

