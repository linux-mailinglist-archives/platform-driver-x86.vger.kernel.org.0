Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018B0A5CD7
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2019 21:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfIBT70 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 2 Sep 2019 15:59:26 -0400
Received: from mx4.ucr.edu ([138.23.248.66]:38840 "EHLO mx4.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfIBT70 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 2 Sep 2019 15:59:26 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Sep 2019 15:59:25 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1567454366; x=1598990366;
  h=from:to:cc:subject:date:message-id;
  bh=9YFH2+4SF5lZUXY1DJWRSn3RrCp+ubm6h31IWEhi4Fw=;
  b=C0KcddCKZTAUpTrYpylvRGa3v8K4xh5+dcqF+wWKoxKmajbrlCe1OYLx
   AZibtAPJY/sFjX+df5dPIxevCg40wLfSoecm41T/tswI28GEl2P9+jlmn
   gptPMLq8ASkZ+/PHVLkAMG7Q+nAE3OHwENbXH1DhUNaGGGoy9lm7k62RJ
   RZjIsAR7dRz10Wnh+pd1n1kMj0HRzdWe3uT8OLSKmiEsHI4kzUwevxeZr
   JKkENwY6bZrIynrdRWRccEQKojny77ptBwADjwfcC+eXSHatQxjiADamx
   62qAOrPsq9bTkiQLRfnX+QOzclwT/Z9VOWvTrAvZaWWKyupOHKKeXXPHY
   w==;
IronPort-SDR: Zp82rFu8pJ3OYJ0tK5JfgmMdAOR4xRhZLGSKTiZ1x1Q4/BDvJXMatwQCCyUmH85bst73nAFRxN
 b951Sh+ugAq0I/twdDTbeLKeDFPGn2jI4AhqDJK+YvRPR3b/onLuWzHfsJOyKx4CpEf3wHwWzt
 /nlNdzdpbuD2r1gKO47AWKHmbMFCYCqVDzzpc7xHFGdh30EIT+sJ3lJlyhWLvpwSGlz8chyZH5
 oLleeDV/cGnXa8AJL/9lInSuPC6zh9toXXgflgdYsm/0V5Z1hrOONMbIZ5bzvYlQcH/kGLXuGc
 +AM=
IronPort-PHdr: =?us-ascii?q?9a23=3AHyevxhHw0GHpLrRP2HoBSp1GYnF86YWxBRYc79?=
 =?us-ascii?q?8ds5kLTJ7zps2wAkXT6L1XgUPTWs2DsrQY0rCQ6v+4EjVcuN6oizMrSNR0TR?=
 =?us-ascii?q?gLiMEbzUQLIfWuLgnFFsPsdDEwB89YVVVorDmROElRH9viNRWJ+iXhpTEdFQ?=
 =?us-ascii?q?/iOgVrO+/7BpDdj9it1+C15pbffxhEiCCybL9vMhm6txjdu8sKjYdtN6o8xQ?=
 =?us-ascii?q?bFqWZUdupLwm9lOUidlAvm6Meq+55j/SVQu/Y/+MNFTK73Yac2Q6FGATo/K2?=
 =?us-ascii?q?w669HluhfFTQuU+3sTSX4WnQZSAwjE9x71QJH8uTbnu+Vn2SmaOcr2Ta0oWT?=
 =?us-ascii?q?mn8qxmRgPkhDsBOjUk62zclNB+g7xHrxKgvxx/wpDbYIeJNPplY6jRecoWSX?=
 =?us-ascii?q?ddUspNUiBMBIa8b4oUD+oaPOZYqYb9rEYQoxWnGAKsCuLvxSFMhnDrwKY21+?=
 =?us-ascii?q?osHR3D0AEmAtkAsmnbrM/tOakST+670afGwzbEYf5NxTvx9JLFfgw7rP2QQb?=
 =?us-ascii?q?59d9fax0k1FwPCi1WdsY7qPzKU1+QNrmib6PdrWOWvim8mqwF+uDmvytswho?=
 =?us-ascii?q?THnY8V10zL9T9jzIkrONK4VVd2bNi5G5VTryGXL5V6Tt8mTm1yuys3yqcKtY?=
 =?us-ascii?q?CmcCUK0pgr2QLTZ+Cff4SV4x/uUPydLSl2iX9lYr6zmRe//VKix+DzUMS/zU?=
 =?us-ascii?q?xEoTBfktbWs3AAzxnT6s+aRfRj5kqhwjOP1xzL6uFDPEA0ibLXK54/zb40kZ?=
 =?us-ascii?q?oeqUHDETX3mEXylaOWbkok9vWx5+TpfLnquoOQO5V7igH5NaQulci/DvoiPg?=
 =?us-ascii?q?cSWGib/Pyw1Lzl/ULnXLVHluM6nrXdvZzAJskWprS1DxFI3osj8RqzESuq3M?=
 =?us-ascii?q?gAkXkCNl1FeRaHj4bzO1HJJfD1Ffe+glWskDhxxvDKIqHtD5vWI3jejLjhZ6?=
 =?us-ascii?q?xx5FBBxwou1dxf/Y5bCqkdIPLvXU/8rMTYDhsjPAyozebnD8991oYHVW2SGK?=
 =?us-ascii?q?+ZMb3SvkGS5u42LOiBZ44YtS3jK/gq+fHul2U1mVwDcqmz25sYdnS4Eu5hI0?=
 =?us-ascii?q?WDbnq/yvkbFmJfjwssTPHtwAmTQz5aZi7qBIoh7St9BY67W9SQDruxiaCMiX?=
 =?us-ascii?q?/oVqZdYXpLXxXTSXo=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2G8AQDOcW1dgMjXVdFlHQEBBQEHBQG?=
 =?us-ascii?q?BVgUBCwGDV0wQjR2GXwEBAQaLOHGFeoooAQgBAQEMAQEtAgEBhD+CbyM3Bg4?=
 =?us-ascii?q?CAwgBAQUBAQEBAQYEAQECEAEBCQ0JCCeFQ4I6KYJgCxZngRUBBQE1IjmCRwG?=
 =?us-ascii?q?BdhQFnSyBAzyMVohvAQgMgUkJAQiBIgGHHoRZgRCBB4RhhA2DVoJEBIEuAQE?=
 =?us-ascii?q?BlFqWDQEGAoINFIFzklwnhDKJG4sYAS2mEgIKBwYPIYFFgXtNJYFsCoFEgnq?=
 =?us-ascii?q?OLSAzgQiMKoJUAQ?=
X-IPAS-Result: =?us-ascii?q?A2G8AQDOcW1dgMjXVdFlHQEBBQEHBQGBVgUBCwGDV0wQj?=
 =?us-ascii?q?R2GXwEBAQaLOHGFeoooAQgBAQEMAQEtAgEBhD+CbyM3Bg4CAwgBAQUBAQEBA?=
 =?us-ascii?q?QYEAQECEAEBCQ0JCCeFQ4I6KYJgCxZngRUBBQE1IjmCRwGBdhQFnSyBAzyMV?=
 =?us-ascii?q?ohvAQgMgUkJAQiBIgGHHoRZgRCBB4RhhA2DVoJEBIEuAQEBlFqWDQEGAoINF?=
 =?us-ascii?q?IFzklwnhDKJG4sYAS2mEgIKBwYPIYFFgXtNJYFsCoFEgnqOLSAzgQiMKoJUA?=
 =?us-ascii?q?Q?=
X-IronPort-AV: E=Sophos;i="5.64,460,1559545200"; 
   d="scan'208";a="74305842"
Received: from mail-pg1-f200.google.com ([209.85.215.200])
  by smtpmx4.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2019 12:52:18 -0700
Received: by mail-pg1-f200.google.com with SMTP id d19so9450248pgh.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Sep 2019 12:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=imcM1xVZHBkiHfxi87jX+roFThFEftffl3PXiRWCv+8=;
        b=eBkwLaHMZljk99eXKz0r9ECq687Rn9jVimz1guvQmtdhA5edEMr0eOYH4kcIEa74Ux
         7Eih4uiajWZl4GdUYEH2eMyqfOTRowHXgIBNIK0T4Y5TTN8t/3ChqTUmqKgYV5gFdCDq
         4QTHtJTWGFIb+w24UKR1xDZC4oWKfOZso/hPMsDvqcT7fGN2UCfmh81H8YK9Q7X8GbDU
         4H0BcTXTBuN/S6k+ugswje3HomQ1tNR3eVHGk9VwMy4lQ2s3eo+o39IGcq1qPA/u1Ubo
         qJZN5G7bbZlfMW1KgDk4NB9CMuyx7iI0UB7z9oipUkvu2R0CkXmA7KhOzWON5nsoToin
         yZEA==
X-Gm-Message-State: APjAAAWqOf/rbOl9FC7jbWXdFfAnu8DyGgXFW3kcfVnjsm+5QoTHhSse
        I0qiGCSZ+Q0GpRDhUHEoEWoM7vgMKz1KvfMiJHeJEwmuvtmajSPGgMbBE0VSrs0AX6pjvkN1LHG
        XxNZXno1C4sLcwbXt5RoA1AS0ZPrc070bSjo=
X-Received: by 2002:a62:1ad3:: with SMTP id a202mr4537051pfa.75.1567453936365;
        Mon, 02 Sep 2019 12:52:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPBYltAxKyIZu4dx1GwCHmzv2ova/fEu/SPfzXd989va7lJQiG441O5i7EwTD95j5m7ldSNg==
X-Received: by 2002:a62:1ad3:: with SMTP id a202mr4537028pfa.75.1567453936124;
        Mon, 02 Sep 2019 12:52:16 -0700 (PDT)
Received: from Yizhuo.cs.ucr.edu (yizhuo.cs.ucr.edu. [169.235.26.74])
        by smtp.googlemail.com with ESMTPSA id s76sm13420529pgc.92.2019.09.02.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 12:52:15 -0700 (PDT)
From:   Yizhuo <yzhai003@ucr.edu>
Cc:     csong@cs.ucr.edu, zhiyunq@cs.ucr.edu, Yizhuo <yzhai003@ucr.edu>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] compal-laptop: Variable "value" in function ec_read_u8() could be uninitialized
Date:   Mon,  2 Sep 2019 12:52:49 -0700
Message-Id: <20190902195249.18221-1-yzhai003@ucr.edu>
X-Mailer: git-send-email 2.17.1
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In function ec_read_u8(), variable "value" could be uninitialized
if ec_read() fails. However, "value" is returned directly and used
in its callers. This is potentially unsafe.

Signed-off-by: Yizhuo <yzhai003@ucr.edu>
---
 drivers/platform/x86/compal-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index 09dfa6f48a1a..ab610376fdad 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -226,7 +226,7 @@ static const unsigned char pwm_lookup_table[256] = {
 /* General access */
 static u8 ec_read_u8(u8 addr)
 {
-	u8 value;
+	u8 value = 0;
 	ec_read(addr, &value);
 	return value;
 }
-- 
2.17.1

