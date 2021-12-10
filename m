Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB9F47041E
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Dec 2021 16:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243047AbhLJPpr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Dec 2021 10:45:47 -0500
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:19738 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242992AbhLJPpo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Dec 2021 10:45:44 -0500
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1BACurAR000494;
        Fri, 10 Dec 2021 09:42:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=v1Qh9lWm4IKBdghH93JFeiDyjO1mi+pXvGRYPvw/xw4=;
 b=G3/yqbihiY+aQQMfh8mx8fHKwn337EbL3+fKRlMAd8eIK3U/ncZqBhaVvSmiRMaXwu4T
 GAawIk4I3qrjpc32MCN7SatZ+q3l6mBIym/VCkE4chX1Op9ploLge7Gw8Cfn+SblVKOL
 LBeWjBeEW+dJ4E4qM9HfXz9MVycXbgydyTHcd2xgIdSlib3xE5ZnJD6sCyG/wDJ7Gspg
 TEGtC83BACGF6kJDcQVO2KdUhbg+rw+8eiBFPnnVqlJKTBOC5mwGU/56PCqbPQuPvMa5
 h9d8JdeWfl0gp9lAmNEYfogjAoBfVus0WD0EdyapnZ3XiCI0x1UtW6dQ18eix3pxRsg0 VA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3cuds09y4p-3
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 10 Dec 2021 09:42:00 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Fri, 10 Dec
 2021 15:41:58 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 10 Dec 2021 15:41:58 +0000
Received: from LONN2DGDQ73.ad.cirrus.com (unknown [198.90.238.135])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CE1072AA;
        Fri, 10 Dec 2021 15:41:57 +0000 (UTC)
From:   Stefan Binding <sbinding@opensource.cirrus.com>
To:     Mark Brown <broonie@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <linux-acpi@vger.kernel.org>,
        <platform-driver-x86@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v2 2/6] spi: Make spi_alloc_device and spi_add_device public again
Date:   Fri, 10 Dec 2021 15:40:46 +0000
Message-ID: <20211210154050.3713-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211210154050.3713-1-sbinding@opensource.cirrus.com>
References: <20211210154050.3713-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: VNk9--TW9PrL157D9hpSAproVy37QNqJ
X-Proofpoint-ORIG-GUID: VNk9--TW9PrL157D9hpSAproVy37QNqJ
X-Proofpoint-Spam-Reason: safe
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This functions were previously made private since they
were not used. However, these functions will be needed
again.

Partial revert of commit da21fde0fdb3
("spi: Make several public functions private to spi.c")

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 drivers/spi/spi.c       |  6 ++++--
 include/linux/spi/spi.h | 12 ++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 9495f776e53c..33ed5693560d 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -531,7 +531,7 @@ static DEFINE_MUTEX(board_lock);
  *
  * Return: a pointer to the new device, or NULL.
  */
-static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
+struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
 {
 	struct spi_device	*spi;
 
@@ -556,6 +556,7 @@ static struct spi_device *spi_alloc_device(struct spi_controller *ctlr)
 	device_initialize(&spi->dev);
 	return spi;
 }
+EXPORT_SYMBOL_GPL(spi_alloc_device);
 
 static void spi_dev_set_name(struct spi_device *spi)
 {
@@ -651,7 +652,7 @@ static int __spi_add_device(struct spi_device *spi)
  *
  * Return: 0 on success; negative errno on failure
  */
-static int spi_add_device(struct spi_device *spi)
+int spi_add_device(struct spi_device *spi)
 {
 	struct spi_controller *ctlr = spi->controller;
 	struct device *dev = ctlr->dev.parent;
@@ -672,6 +673,7 @@ static int spi_add_device(struct spi_device *spi)
 	mutex_unlock(&ctlr->add_lock);
 	return status;
 }
+EXPORT_SYMBOL_GPL(spi_add_device);
 
 static int spi_add_device_locked(struct spi_device *spi)
 {
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 8c2978853573..d70e66c712d0 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -1462,7 +1462,19 @@ spi_register_board_info(struct spi_board_info const *info, unsigned n)
  * use spi_new_device() to describe each device.  You can also call
  * spi_unregister_device() to start making that device vanish, but
  * normally that would be handled by spi_unregister_controller().
+ *
+ * You can also use spi_alloc_device() and spi_add_device() to use a two
+ * stage registration sequence for each spi_device.  This gives the caller
+ * some more control over the spi_device structure before it is registered,
+ * but requires that caller to initialize fields that would otherwise
+ * be defined using the board info.
  */
+extern struct spi_device *
+spi_alloc_device(struct spi_controller *ctlr);
+
+extern int
+spi_add_device(struct spi_device *spi);
+
 extern struct spi_device *
 spi_new_device(struct spi_controller *, struct spi_board_info *);
 
-- 
2.25.1

