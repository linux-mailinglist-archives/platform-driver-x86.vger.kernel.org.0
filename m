Return-Path: <platform-driver-x86+bounces-5289-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E08F96FFA2
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Sep 2024 05:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECAE7283CD2
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Sep 2024 03:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26771148FEB;
	Sat,  7 Sep 2024 03:10:46 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172D1F94C;
	Sat,  7 Sep 2024 03:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678646; cv=none; b=nnAuIA8sGU/OabSNL5LS/eCKbLj9B8KQDf1oHrPeh40j0sIOunCapLRQzpd04oeJTmWWqTlLnRtrE/1tGXdnGrVLM2VuezvLz06fKPZxpB3bNPPY02CIGfIw2wUi66yHR3wAaMjkZV/mRLMa13eoF5OV7fUHQxFVP1faJbHE8+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678646; c=relaxed/simple;
	bh=3DrBXBN4zHFdmZQPm97ddSdyM4eMMKuEHq8ZpIhhgb8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEgQ0AZUYnvn3gYWhkPyn3ii8V26seVhx9f4Pt0HnhFyWfBYqX8O7N49VEhSLZzewdaU16NjifD85aksD/x2MYt4kZvIPHOhPL/cVczEMiMPmfNDTANj4/hw61J86N2M+SOk65gyhrbPCR+GXdthJi3TH3zMFmSO2OGoCKp+HCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4X0ykW2XRmzyRGh;
	Sat,  7 Sep 2024 11:09:39 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 885A01800CF;
	Sat,  7 Sep 2024 11:10:40 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:39 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <mchehab@kernel.org>, <florian.fainelli@broadcom.com>, <andrew@lunn.ch>,
	<olteanv@gmail.com>, <davem@davemloft.net>, <edumazet@google.com>,
	<kuba@kernel.org>, <pabeni@redhat.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <heiko@sntech.de>,
	<yisen.zhuang@huawei.com>, <salil.mehta@huawei.com>, <hauke@hauke-m.de>,
	<alexandre.torgue@foss.st.com>, <joabreu@synopsys.com>,
	<mcoquelin.stm32@gmail.com>, <wellslutw@gmail.com>,
	<radhey.shyam.pandey@amd.com>, <michal.simek@amd.com>, <hdegoede@redhat.com>,
	<ilpo.jarvinen@linux.intel.com>, <ruanjinjie@huawei.com>,
	<lizetao1@huawei.com>, <hverkuil-cisco@xs4all.nl>,
	<u.kleine-koenig@pengutronix.de>, <jacky_chou@aspeedtech.com>,
	<jacob.e.keller@intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<platform-driver-x86@vger.kernel.org>
Subject: [PATCH net-next v2 03/10] net: ethernet: arc: Convert using devm_clk_get_enabled() in emac_probe()
Date: Sat, 7 Sep 2024 11:19:19 +0800
Message-ID: <20240907031926.3591353-4-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240907031926.3591353-1-lizetao1@huawei.com>
References: <20240907031926.3591353-1-lizetao1@huawei.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd500012.china.huawei.com (7.221.188.25)

Use devm_clk_get_enabled() instead of devm_clk_get() +
clk_prepare_enable(), which can make the clk consistent with the device
life cycle and reduce the risk of unreleased clk resources. Since the
device framework has automatically released the clk resource, there is
no need to execute clk_disable_unprepare(clk) on the error path, drop
the out_clk_disable_unprepare label, and the original error process can
changed to the out_dispose_mapping error path.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/net/ethernet/arc/emac_rockchip.c | 34 +++++-------------------
 1 file changed, 6 insertions(+), 28 deletions(-)

diff --git a/drivers/net/ethernet/arc/emac_rockchip.c b/drivers/net/ethernet/arc/emac_rockchip.c
index 493d6356c8ca..22b3ebe059d9 100644
--- a/drivers/net/ethernet/arc/emac_rockchip.c
+++ b/drivers/net/ethernet/arc/emac_rockchip.c
@@ -144,7 +144,7 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 		goto out_netdev;
 	}
 
-	priv->refclk = devm_clk_get(dev, "macref");
+	priv->refclk = devm_clk_get_enabled(dev, "macref");
 	if (IS_ERR(priv->refclk)) {
 		dev_err(dev, "failed to retrieve reference clock (%ld)\n",
 			PTR_ERR(priv->refclk));
@@ -152,18 +152,12 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 		goto out_netdev;
 	}
 
-	err = clk_prepare_enable(priv->refclk);
-	if (err) {
-		dev_err(dev, "failed to enable reference clock (%d)\n", err);
-		goto out_netdev;
-	}
-
 	/* Optional regulator for PHY */
 	priv->regulator = devm_regulator_get_optional(dev, "phy");
 	if (IS_ERR(priv->regulator)) {
 		if (PTR_ERR(priv->regulator) == -EPROBE_DEFER) {
 			err = -EPROBE_DEFER;
-			goto out_clk_disable;
+			goto out_netdev;
 		}
 		dev_err(dev, "no regulator found\n");
 		priv->regulator = NULL;
@@ -173,7 +167,7 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 		err = regulator_enable(priv->regulator);
 		if (err) {
 			dev_err(dev, "failed to enable phy-supply (%d)\n", err);
-			goto out_clk_disable;
+			goto out_netdev;
 		}
 	}
 
@@ -200,7 +194,7 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 	}
 
 	if (priv->soc_data->need_div_macclk) {
-		priv->macclk = devm_clk_get(dev, "macclk");
+		priv->macclk = devm_clk_get_enabled(dev, "macclk");
 		if (IS_ERR(priv->macclk)) {
 			dev_err(dev, "failed to retrieve mac clock (%ld)\n",
 				PTR_ERR(priv->macclk));
@@ -208,37 +202,26 @@ static int emac_rockchip_probe(struct platform_device *pdev)
 			goto out_regulator_disable;
 		}
 
-		err = clk_prepare_enable(priv->macclk);
-		if (err) {
-			dev_err(dev, "failed to enable mac clock (%d)\n", err);
-			goto out_regulator_disable;
-		}
-
 		/* RMII TX/RX needs always a rate of 25MHz */
 		err = clk_set_rate(priv->macclk, 25000000);
 		if (err) {
 			dev_err(dev,
 				"failed to change mac clock rate (%d)\n", err);
-			goto out_clk_disable_macclk;
+			goto out_regulator_disable;
 		}
 	}
 
 	err = arc_emac_probe(ndev, interface);
 	if (err) {
 		dev_err(dev, "failed to probe arc emac (%d)\n", err);
-		goto out_clk_disable_macclk;
+		goto out_regulator_disable;
 	}
 
 	return 0;
 
-out_clk_disable_macclk:
-	if (priv->soc_data->need_div_macclk)
-		clk_disable_unprepare(priv->macclk);
 out_regulator_disable:
 	if (priv->regulator)
 		regulator_disable(priv->regulator);
-out_clk_disable:
-	clk_disable_unprepare(priv->refclk);
 out_netdev:
 	free_netdev(ndev);
 	return err;
@@ -251,14 +234,9 @@ static void emac_rockchip_remove(struct platform_device *pdev)
 
 	arc_emac_remove(ndev);
 
-	clk_disable_unprepare(priv->refclk);
-
 	if (priv->regulator)
 		regulator_disable(priv->regulator);
 
-	if (priv->soc_data->need_div_macclk)
-		clk_disable_unprepare(priv->macclk);
-
 	free_netdev(ndev);
 }
 
-- 
2.34.1


