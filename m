Return-Path: <platform-driver-x86+bounces-5286-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8D396FF95
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Sep 2024 05:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A6AC1F23CAD
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Sep 2024 03:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3621B3A1A8;
	Sat,  7 Sep 2024 03:10:43 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCC8381BA;
	Sat,  7 Sep 2024 03:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725678643; cv=none; b=uHGw+29PdI/GAHLXw5l5UQg1fIug/dWc35bwREaK843F2zSu2hasLySUf3ECbDzBeiTXAoTIXylJ8j8mtmHTAcyW+gaGbEBplo4SCHFmRyK7Y3xVgzxPzd0unY23pa0S3jHP2yZBoFGRvYBqbPwhaM1QrnJv0HWFQb8knvHG36U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725678643; c=relaxed/simple;
	bh=fdKYo9K1OXr0IDZFawPQMci//VX89V9KaEj7kZo7VWM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=p0sFPN2e7JA32X+8oxyowL3Izefc0ngYofLvV7WowZFo8QgBLgD1KYne8Um/wC1WQj3lDduc98czgQN12q9BSkE9/oEAaLh9T5lSpV9e9zEn3EZuNzfNa1GyzBKhUj42UpouboVdP0txXSnF5la6yNuKp2LEu3FLAXfQFtDLdUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4X0yds3ykNz20nY1;
	Sat,  7 Sep 2024 11:05:37 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C0041A0188;
	Sat,  7 Sep 2024 11:10:37 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 7 Sep
 2024 11:10:36 +0800
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
Subject: [PATCH net-next v2 00/10] net: Convert using devm_clk_get_enabled()/devm_clk_get_optional_enabled()
Date: Sat, 7 Sep 2024 11:19:16 +0800
Message-ID: <20240907031926.3591353-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
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

v1 -> v2:
  1) Patch 5 optimizes the check and adds commit information for easier
  inspection.
  2) It is no longer necessary to use clk, so delete the clk member of
  the spl2sw_common structure.
  3) Remove patches 11 and 12, they should be sent to wireless-next
  individually

v1:
https://lore.kernel.org/all/20240831021334.1907921-1-lizetao1@huawei.com/

There are many examples[1][2] of clk resource leakage in LTS. The
reason is that developers need to maintain the allocation and release
of clk resources themselves, but this will increase the burden on
developers. Using the API related to devm_clk_get_*_enable ensures
that the life cycle of clk is consistent with that of the device,
reducing the risk of unreleased resources like clk.

Several other developers are also working on converting to more
secure interfaces, and this patch set is in principle the same as
theirs.

[1]:
https://lore.kernel.org/all/20240812160128.338041191@linuxfoundation.org/
[2]:
https://lore.kernel.org/all/20240812160135.992451065@linuxfoundation.org/

Li Zetao (10):
  net: dsa: bcm_sf2: Convert using devm_clk_get_optional_enabled() in
    bcm_sf2_sw_probe()
  net: ethernet: Convert using devm_clk_get_enabled() in emac_probe()
  net: ethernet: arc: Convert using devm_clk_get_enabled() in
    emac_probe()
  net: ethernet: ethoc: Convert using devm_clk_get_enabled() in
    ethoc_probe()
  net: ftgmac100: Convert using devm_clk_get_enabled() in
    ftgmac100_setup_clk()
  net: ethernet: hisilicon: Convert using devm_clk_get_enabled() in
    hisi_femac_drv_probe()
  net: lantiq_xrx200: Convert using devm_clk_get_enabled() in
    xrx200_probe()
  net: stmmac: dwmac-dwc-qos-eth: Convert using devm_clk_get_enabled()
    in dwc_qos_probe()
  net: ethernet: sunplus: Convert using devm_clk_get_enabled() in
    spl2sw_probe()
  net: xilinx: axienet: Convert using devm_clk_get_optional_enabled() in
    axienet_probe()

 drivers/net/dsa/bcm_sf2.c                     | 28 ++----
 drivers/net/ethernet/allwinner/sun4i-emac.c   | 13 +--
 drivers/net/ethernet/arc/emac_rockchip.c      | 34 ++-----
 drivers/net/ethernet/ethoc.c                  | 18 ++--
 drivers/net/ethernet/faraday/ftgmac100.c      | 26 +----
 drivers/net/ethernet/hisilicon/hisi_femac.c   | 17 +---
 drivers/net/ethernet/lantiq_xrx200.c          | 17 +---
 .../stmicro/stmmac/dwmac-dwc-qos-eth.c        | 98 ++++---------------
 drivers/net/ethernet/sunplus/spl2sw_define.h  |  1 -
 drivers/net/ethernet/sunplus/spl2sw_driver.c  | 25 ++---
 .../net/ethernet/xilinx/xilinx_axienet_main.c | 15 +--
 11 files changed, 62 insertions(+), 230 deletions(-)

-- 
2.34.1


