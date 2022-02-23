Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E14E14C143B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Feb 2022 14:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239431AbiBWNcn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Feb 2022 08:32:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239491AbiBWNcm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Feb 2022 08:32:42 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 76339AB460
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 05:32:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645623134;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ARmOV6UfVJ4llIeXOFo21Jm0uKYOJxAZfmOH8IuHdU8=;
        b=WC6/ZupfH051Mo/xa2dLfzx0sLZ/WSNxPckrK+SZ3DQgrDhxYLgFZnWZ8OBuQg8k3+Iz48
        2fAmo+ZttrnCHINhaDzaUewtIX7xDaoSlpyV3rwpSKgETf6LMcH1OPXJFMBY3AiPsz4w9L
        sq2zWlzsMkDJm168nW6vs+cy253Lcf8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-BKfVl1mtPf2xU8w5do8Gmw-1; Wed, 23 Feb 2022 08:32:11 -0500
X-MC-Unique: BKfVl1mtPf2xU8w5do8Gmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35462805742;
        Wed, 23 Feb 2022 13:32:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C1120832A4;
        Wed, 23 Feb 2022 13:32:08 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 2/5] platform/x86: x86-android-tablets: Fix EBUSY error when requesting IOAPIC IRQs
Date:   Wed, 23 Feb 2022 14:31:50 +0100
Message-Id: <20220223133153.730337-3-hdegoede@redhat.com>
In-Reply-To: <20220223133153.730337-1-hdegoede@redhat.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Sometimes IRQs used by GPIOs in direct-IRQ mode are already registered
because they are used as ACPI "Interrupt () {}" resource for one of the
many bogus I2C devices present in the broken DSDTs of Android x86 tablets.

This is an issue if the existing (bogus) ACPI resource uses different
trigger settings then what is being requested, leading to an -EBUSY
error return of acpi_register_gsi().

Fix this by calling acpi_unregister_gsi() first, so that
the acpi_register_gsi() is allowed to change the trigger settings.

In cases where the GSI has not been registered yet
the acpi_unregister_gsi() is a no-op.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index f280c82d5ba5..61e526e048c3 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -89,6 +89,12 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 
 	switch (data->type) {
 	case X86_ACPI_IRQ_TYPE_APIC:
+		/*
+		 * The DSDT may already reference the GSI in a device skipped by
+		 * acpi_quirk_skip_i2c_client_enumeration(). Unregister the GSI
+		 * to avoid EBUSY errors in this case.
+		 */
+		acpi_unregister_gsi(data->index);
 		irq = acpi_register_gsi(NULL, data->index, data->trigger, data->polarity);
 		if (irq < 0)
 			pr_err("error %d getting APIC IRQ %d\n", irq, data->index);
-- 
2.35.1

