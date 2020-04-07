Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEA111A0A36
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Apr 2020 11:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728083AbgDGJdc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Apr 2020 05:33:32 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:56866 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726716AbgDGJdc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Apr 2020 05:33:32 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379S0MG154476;
        Tue, 7 Apr 2020 09:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=n6Axmsa49z/+wlOeoF6VVaXlwWg+uZsMXpjAn9nVBWI=;
 b=FwqPcHe1LlJ6h9yTZ5+BLW8fW7RZelCplyV8cRFZLzr2prwNBFZWJ2zBfu0nHPZsuJU2
 wcmxPegbDPFqX+Riqwi8898UQoQ8RFtegm3dXN50IrlfW1i7YR/YvqgXBJVZFnzZeYwN
 LjH0GzUofpSUqV114wKVcN4hwvUXFIA6gprhRKj3qI//5n6GoVuQPzS4xiBNMH3JGHif
 u4KZHxaGyJX3A7pRaafWdPIFA/u9rHyd5lHaVcDEwbEiE8PqLjoqqDTjFJRZxA0Oz7/O
 s6J2aw9+wQFVod0ka+weLCpG30okwZKAPN4ZyUUZArb/TACImaD4VEKhwPwuTrjE8S4z zg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 308ffd9sar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:33:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0379RGXG041396;
        Tue, 7 Apr 2020 09:31:02 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 3073qfge9e-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 07 Apr 2020 09:31:02 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0379UxJU005703;
        Tue, 7 Apr 2020 09:31:00 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 07 Apr 2020 02:30:59 -0700
Date:   Tue, 7 Apr 2020 12:30:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Darren Hart <dvhart@infradead.org>,
        =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Stephen Just <stephenjust@gmail.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: surface3_power: Fix a NULL vs IS_ERR() check
 in probe
Message-ID: <20200407093052.GL68494@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9583 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1011 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004070080
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The i2c_acpi_new_device() function never returns NULL, it returns error
pointers.

Fixes: b1f81b496b0d ("platform/x86: surface3_power: MSHW0011 rev-eng implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/surface3_power.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86/surface3_power.c
index 946ac2dc08ae..cc4f9cba6856 100644
--- a/drivers/platform/x86/surface3_power.c
+++ b/drivers/platform/x86/surface3_power.c
@@ -522,8 +522,8 @@ static int mshw0011_probe(struct i2c_client *client)
 	strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
 
 	bat0 = i2c_acpi_new_device(dev, 1, &board_info);
-	if (!bat0)
-		return -ENOMEM;
+	if (IS_ERR(bat0))
+		return PTR_ERR(bat0);
 
 	data->bat0 = bat0;
 	i2c_set_clientdata(bat0, data);
-- 
2.25.1

