Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A7E6C35E0
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Mar 2023 16:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231790AbjCUPjT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Mar 2023 11:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbjCUPjG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Mar 2023 11:39:06 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E58614980
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Mar 2023 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679413100;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fMjdN/anu6prOaMTJhrn3iWHC5IdbBmbiG6Sm0CP7Vg=;
        b=Ei3wyaoINKxfw9/+LjjVzesrZZ5FQulTPmh0OvhkRQMkBnhxIMAi633GplYkV7NBSj9aSm
        fNu2mr6Dp9kFUl4rcBmKEzaGKmi5AuI69Y4deRHKqiFmRjidaOV7vxYBfBDT0Jk9n/aVar
        aAM7cCheFWSQa8ecd1/PSpRdaHsVkAI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-398-MpwZUU6SO66gHFFJbQOvQA-1; Tue, 21 Mar 2023 11:38:13 -0400
X-MC-Unique: MpwZUU6SO66gHFFJbQOvQA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F17E1C16410;
        Tue, 21 Mar 2023 15:38:04 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.17])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7047140BC798;
        Tue, 21 Mar 2023 15:38:00 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     Kate Hsuan <hpa@redhat.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH v3 2/3] include: mfd: tps68470: Add masks for LEDA and LEDB
Date:   Tue, 21 Mar 2023 23:37:17 +0800
Message-Id: <20230321153718.1355511-3-hpa@redhat.com>
In-Reply-To: <20230321153718.1355511-1-hpa@redhat.com>
References: <20230321153718.1355511-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add flags for both LEDA(TPS68470_ILEDCTL_ENA), LEDB
(TPS68470_ILEDCTL_ENB), and current control mask for LEDB
(TPS68470_ILEDCTL_CTRLB)

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 include/linux/mfd/tps68470.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/mfd/tps68470.h b/include/linux/mfd/tps68470.h
index 7807fa329db0..2d2abb25b944 100644
--- a/include/linux/mfd/tps68470.h
+++ b/include/linux/mfd/tps68470.h
@@ -34,6 +34,7 @@
 #define TPS68470_REG_SGPO		0x22
 #define TPS68470_REG_GPDI		0x26
 #define TPS68470_REG_GPDO		0x27
+#define TPS68470_REG_ILEDCTL		0x28
 #define TPS68470_REG_VCMVAL		0x3C
 #define TPS68470_REG_VAUX1VAL		0x3D
 #define TPS68470_REG_VAUX2VAL		0x3E
@@ -94,4 +95,8 @@
 #define TPS68470_GPIO_MODE_OUT_CMOS	2
 #define TPS68470_GPIO_MODE_OUT_ODRAIN	3
 
+#define TPS68470_ILEDCTL_ENA		BIT(2)
+#define TPS68470_ILEDCTL_ENB		BIT(6)
+#define TPS68470_ILEDCTL_CTRLB		GENMASK(5, 4)
+
 #endif /* __LINUX_MFD_TPS68470_H */
-- 
2.39.2

