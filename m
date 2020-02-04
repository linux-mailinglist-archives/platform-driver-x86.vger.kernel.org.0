Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35F52151634
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Feb 2020 08:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgBDHCW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Feb 2020 02:02:22 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:56460 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725976AbgBDHCW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Feb 2020 02:02:22 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0146mvFe191846;
        Tue, 4 Feb 2020 07:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=9JQmp4pJUcJ3uAn+sqzWmUOA/UaifdN9TnSL/pLffbE=;
 b=YVYKkeotr8opb7lnIR6kddVfzpdCKv/KqGWQiQSccQcWDOMYmtupYDTBevY7Wq+Zh6ez
 9uxvhP6TNN5KAsyXdV9Lsbu2a3ev5g9RWGxt0RueIZqrbwcEwMbQhDY7KI/kP2tbqQEB
 OBrbmDYLKuAnE1bu166i2e7MnanMNWqEomaDvQy/5C0s5kFxIYvzGz8IF16nu/Xf2DdP
 QWuGXNyq8OG6zR20IOox3y7CeRakKSeOxIyR7BZ+Ax1KARvdaRXyEYnbvGO3X3ig3k/I
 4xpPYvLUtKWy7xJyJMDhEoVc/l4UWYTStijwOWvsP3uc03bhhbt0QfmlnqnlZcNeD2K5 1A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 2xw0ru4krt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 07:02:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 0146n5TY001503;
        Tue, 4 Feb 2020 07:00:19 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3020.oracle.com with ESMTP id 2xxsbmfxyy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 07:00:18 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 01470GFB018835;
        Tue, 4 Feb 2020 07:00:16 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 03 Feb 2020 23:00:15 -0800
Date:   Tue, 4 Feb 2020 10:00:09 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     srinivas.pandruvada@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: Add support for Uncore frequency control
Message-ID: <20200204070009.pf4ejbj3iw3prs3z@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=3 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=882
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040050
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=930 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040050
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Srinivas Pandruvada,

The patch 49a474c7ba51: "platform/x86: Add support for Uncore
frequency control" from Jan 13, 2020, leads to the following static
checker warning:

	drivers/platform/x86/intel-uncore-frequency.c:285 uncore_remove_die_entry()
	error: dereferencing freed memory 'data'

drivers/platform/x86/intel-uncore-frequency.c
   276  /* Last CPU in this die is offline, so remove sysfs entries */
   277  static void uncore_remove_die_entry(int cpu)
   278  {
   279          struct uncore_data *data;
   280  
   281          mutex_lock(&uncore_lock);
   282          data = uncore_get_instance(cpu);
   283          if (data) {
   284                  kobject_put(&data->kobj);
                        ^^^^^^^^^^^^^^^^^^^^^^^^
This leads to a slightly delayed free.

   285                  data->control_cpu = -1;
                        ^^^^^^^^^^^^^^^^^
   286                  data->valid = false;
                        ^^^^^^^^^^^
Why do we need to do this?  It could lead to a use after free if we
got really unlucky, right?

   287          }
   288          mutex_unlock(&uncore_lock);
   289  }

regards,
dan carpenter
