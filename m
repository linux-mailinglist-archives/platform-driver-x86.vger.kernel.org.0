Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E672321F4
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 17:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgG2Ptv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 Jul 2020 11:49:51 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:8295 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726365AbgG2Ptu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jul 2020 11:49:50 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 55A25F7A6DA5D37E894C;
        Wed, 29 Jul 2020 23:49:31 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 29 Jul 2020 23:49:25 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH -next] platform/x86: thinkpad_acpi: Make some symbols static
Date:   Wed, 29 Jul 2020 23:59:14 +0800
Message-ID: <20200729155914.34026-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The sparse tool complains as follows:

drivers/platform/x86/thinkpad_acpi.c:9636:25: warning:
 symbol 'dev_attr_charge_start_threshold' was not declared. Should it be static?
drivers/platform/x86/thinkpad_acpi.c:9642:25: warning:
 symbol 'dev_attr_charge_stop_threshold' was not declared. Should it be static?

Those variables are not used outside of thinkpad_acpi.c, so this
commit marks them static.

Fixes: e33929537b76 ("platform/x86: thinkpad_acpi: use standard charge control attribute names")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 446936c1e65a..9fcf1802fccd 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9633,13 +9633,13 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 
 static DEVICE_ATTR_RW(charge_control_start_threshold);
 static DEVICE_ATTR_RW(charge_control_end_threshold);
-struct device_attribute dev_attr_charge_start_threshold = __ATTR(
+static struct device_attribute dev_attr_charge_start_threshold = __ATTR(
 	charge_start_threshold,
 	0644,
 	charge_control_start_threshold_show,
 	charge_control_start_threshold_store
 );
-struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
+static struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
 	charge_stop_threshold,
 	0644,
 	charge_control_end_threshold_show,

