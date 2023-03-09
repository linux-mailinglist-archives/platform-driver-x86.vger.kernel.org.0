Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 209CD6B2058
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Mar 2023 10:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbjCIJlh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Mar 2023 04:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231298AbjCIJlc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 04:41:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B171BE8437
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 01:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678354840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Y+Ycje4yqZvGj2ZTpJYfrES1vVy8SUFz/YxSVsbxMTQ=;
        b=WDZwpKmqeYjOPbaAXrZ8bZ0UEjJdw20AWdUopf37rJ1SckSV7N2zuOWoLx9vFgkHoVvooR
        ykEXUd42cIQb0Xu+qn2NsM1+mX0jii7uNAC9Wr2GgvKaB288f7Nq0/GLafDwDzXkxlbKsh
        ofKv8IfDfmRFj55G2ocPZkODb4eBkOI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-0jqAwMG1MvOg37yFLExvYQ-1; Thu, 09 Mar 2023 04:40:37 -0500
X-MC-Unique: 0jqAwMG1MvOg37yFLExvYQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE50F88B77E;
        Thu,  9 Mar 2023 09:40:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.206])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E51C82026D4B;
        Thu,  9 Mar 2023 09:40:35 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] platform/x86: x86-android-tablets: Add depends on PMIC_OPREGION
Date:   Thu,  9 Mar 2023 10:40:35 +0100
Message-Id: <20230309094035.18736-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a depends on PMIC_OPREGION to x86-android-tablets Kconfig to fix
the following build error:

ERROR: modpost: "intel_soc_pmic_exec_mipi_pmic_seq_element"
 [drivers/platform/x86/x86-android-tablets/x86-android-tablets.ko] undefined!

Fixes: 9b1d2662b8c5 ("platform/x86: x86-android-tablets: Add touchscreen support for Lenovo Yoga Tab 3 Pro YT3-X90F")
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303091711.howZNrIY-lkp@intel.com/
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Add Fixes tag
---
 drivers/platform/x86/x86-android-tablets/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/x86-android-tablets/Kconfig b/drivers/platform/x86/x86-android-tablets/Kconfig
index 2b3daca5380b..6603461d4273 100644
--- a/drivers/platform/x86/x86-android-tablets/Kconfig
+++ b/drivers/platform/x86/x86-android-tablets/Kconfig
@@ -5,7 +5,7 @@
 
 config X86_ANDROID_TABLETS
 	tristate "X86 Android tablet support"
-	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB
+	depends on I2C && SPI && SERIAL_DEV_BUS && ACPI && EFI && GPIOLIB && PMIC_OPREGION
 	help
 	  X86 tablets which ship with Android as (part of) the factory image
 	  typically have various problems with their DSDTs. The factory kernels
-- 
2.39.1

