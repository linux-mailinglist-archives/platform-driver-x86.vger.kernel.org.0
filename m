Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA111A5997
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2019 16:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730874AbfIBOmT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 2 Sep 2019 10:42:19 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:49634 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730559AbfIBOmT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Sep 2019 10:42:19 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x82EdCxG167673;
        Mon, 2 Sep 2019 14:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=nNxuQ+XhbrNcPxEVkBUve1gkarjWc5v6szxVPvvy5TA=;
 b=q5KH9/2oVwLsbq8tldipBF4TewYfyFoBbsTofIPDtnPdZyGSIyiZ7JR101vbyCZMCu8t
 q/KjdczMx8XkFQZ8gE+e0BXHe2msnfamhB4iwC/SCn9mSDfc6KnE9OYIQvPcHJz/+LdO
 InHmH3P8tllK2fdPE5qLaPHyBCVn3Ng/wja0etkjracPPQi1cccs3wHAQVZeZdP4am1U
 EzyWQTsIJt1GRMjmX6LrufrgewWgjC0wMeM+l7kIiuJEgYEjCAxCHooGW6zl2qv+ZoqS
 mOmqMbnDnHyRGqJKbdXi/FkaJfFgM3rW5Dqtf6Fb1m7QSrkPfV5ltSgsNC1x/b0tq3/P VQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 2us4xk01d5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Sep 2019 14:41:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x82EcPuh062943;
        Mon, 2 Sep 2019 14:39:22 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2uryv5akfs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 02 Sep 2019 14:39:22 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x82Ecvsc002191;
        Mon, 2 Sep 2019 14:38:57 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 02 Sep 2019 07:38:57 -0700
Date:   Mon, 2 Sep 2019 17:38:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86: asus-wmi: Fix condition in
 charge_threshold_store()
Message-ID: <20190902143850.GA607@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9367 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909020165
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9367 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909020166
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This error handling is reversed so we return early.

Fixes: 84d8e80b0a36 ("platform/x86: asus-wmi: Refactor charge_threshold_store()")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/platform/x86/asus-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 14467748b343..848b23764fc3 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -2068,7 +2068,7 @@ static ssize_t charge_threshold_store(struct device *dev,
 		return -EINVAL;
 
 	ret = asus_wmi_set_devstate(ASUS_WMI_CHARGE_THRESHOLD, value, &rv);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	if (rv != 1)
-- 
2.20.1

