Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A555B3DF1FC
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Aug 2021 18:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229716AbhHCQBH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 3 Aug 2021 12:01:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35730 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229691AbhHCQBH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 12:01:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628006455;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kdOgtOuVQHbf87f8Qp1FagQcvjvyA/sQWrsW+aqcXCo=;
        b=U4S8tCH+VVaKnRfXfCX0pCBlV8kpPbd+mSAEoo4ObXr48laWaYZ5AtwMhDt4nZDQZEzhW2
        EfrUQelVqzjw3SZsV9KixdynzQxm0iEv6urWaf5AwDSuSj6S41oKOQVeKamBhuVbRoHEUP
        gjl0UKu4FJMV+vZFF+bZH48dSS5IQ9Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-ISZrde0GMXWp5J7OPUZ5wg-1; Tue, 03 Aug 2021 12:00:52 -0400
X-MC-Unique: ISZrde0GMXWp5J7OPUZ5wg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FA7218C8C01;
        Tue,  3 Aug 2021 16:00:51 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.193.55])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A05C560C0F;
        Tue,  3 Aug 2021 16:00:49 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: [PATCH 2/4] platform/x86: dual_accel_detect: Use the new i2c_acpi_client_count() helper
Date:   Tue,  3 Aug 2021 18:00:42 +0200
Message-Id: <20210803160044.158802-3-hdegoede@redhat.com>
In-Reply-To: <20210803160044.158802-1-hdegoede@redhat.com>
References: <20210803160044.158802-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use the new i2c_acpi_client_count() helper, this
results in a nice cleanup.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/dual_accel_detect.h | 26 +-----------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/platform/x86/dual_accel_detect.h b/drivers/platform/x86/dual_accel_detect.h
index a9eae17cc43d..72e9624331c8 100644
--- a/drivers/platform/x86/dual_accel_detect.h
+++ b/drivers/platform/x86/dual_accel_detect.h
@@ -17,30 +17,6 @@
 #include <linux/acpi.h>
 #include <linux/i2c.h>
 
-static int dual_accel_i2c_resource_count(struct acpi_resource *ares, void *data)
-{
-	struct acpi_resource_i2c_serialbus *sb;
-	int *count = data;
-
-	if (i2c_acpi_get_i2c_resource(ares, &sb))
-		*count = *count + 1;
-
-	return 1;
-}
-
-static int dual_accel_i2c_client_count(struct acpi_device *adev)
-{
-	int ret, count = 0;
-	LIST_HEAD(r);
-
-	ret = acpi_dev_get_resources(adev, &r, dual_accel_i2c_resource_count, &count);
-	if (ret < 0)
-		return ret;
-
-	acpi_dev_free_resource_list(&r);
-	return count;
-}
-
 static bool dual_accel_detect_bosc0200(void)
 {
 	struct acpi_device *adev;
@@ -50,7 +26,7 @@ static bool dual_accel_detect_bosc0200(void)
 	if (!adev)
 		return false;
 
-	count = dual_accel_i2c_client_count(adev);
+	count = i2c_acpi_client_count(adev);
 
 	acpi_dev_put(adev);
 
-- 
2.31.1

