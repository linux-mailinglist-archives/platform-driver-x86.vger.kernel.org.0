Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4411734790A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Mar 2021 13:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbhCXM4l (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Mar 2021 08:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234647AbhCXM4O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Mar 2021 08:56:14 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4135C0613E6
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:10 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id h10so27455475edt.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Mar 2021 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=deviqon.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Yr+hqksGhsoym9OCme5jUvwyeFtwCUa6Az4rur4J9Ag=;
        b=d1Hl+i0+A5Tve+esaspvDfy3ewi9VbVCtugdJQn0K1QWqY+FGWio3cXwpC7Y5TSQmb
         CAZbREkS4JI5YXjkYuuBEs3n6kd09gpj3KnlxvdNaHRAp2OgrLdRvvUhlbM46RaHyGnU
         mKANrSt2KGlLDwDn7rEBHMlOwIwN19zUX+/7EvKukLVv5Ku0uh89Er0X9omSScL4/nIe
         7j3ILSGNXewnknpaIG6j8xNuBUE/M9KN9/57LVC1rEHh2Cw1QnckIZST8W7Ur4RZ9Vrx
         vqNBC1+J5k8AlrzMWHjFH4Q5jpfBuj/yNGu01EozxvWJn1TU/dzgaNgUynTiC33iG8id
         isfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Yr+hqksGhsoym9OCme5jUvwyeFtwCUa6Az4rur4J9Ag=;
        b=JD0U0JFsNYHZagHmai56rL4fSyK6J1FUoyI6vtCbNZtecqAB7WFwTq4JVFJW7/H4dJ
         IRjlDhIjZL6fhSikd/wbD48b9Uq6g+35YatWK0JGMoQAmBhLDnjXUzHtw1d9j9FeuNyo
         eiM18xCd4B/YJf290PVUDaeJyQXx5xhWc1MyAbo7kwmCtfDHm3NUEbpQJ+ZBPlDnxQwd
         Lea2JqNOJhlDrMGjgB4t0B8Nj1RcMgaiYNcoQdfHopnBGAf3122OTOoN75EnPrIz84U/
         qWuLke20ndNqIYF4xOy8XmDE8MxfBQNPdXDfYp9RF+A2dmtAAkdPoJGjCMDMvzu5u0hL
         m1KA==
X-Gm-Message-State: AOAM5330EOW7Iso2TxFM2XhkfflqrcZ7CttirnBxaPGAOqtYDqZzJx4V
        JgQYXPwgms1p3L8U0MSz39sgwjl27gnmyNXl
X-Google-Smtp-Source: ABdhPJxIcmTmkmMN9WvwQrOU///P6BOxa5oEnluuOV54BfqppfMs+765Gs7vq6TYuoCyYNuyKS4u5g==
X-Received: by 2002:aa7:d416:: with SMTP id z22mr3222861edq.239.1616590569433;
        Wed, 24 Mar 2021 05:56:09 -0700 (PDT)
Received: from localhost.localdomain ([5.2.193.191])
        by smtp.gmail.com with ESMTPSA id fi11sm880282ejb.73.2021.03.24.05.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 05:56:09 -0700 (PDT)
From:   Alexandru Ardelean <aardelean@deviqon.com>
To:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org
Cc:     coproscefalo@gmail.com, hdegoede@redhat.com,
        mgross@linux.intel.com, jic23@kernel.org, linux@deviqon.com,
        Alexandru Ardelean <aardelean@deviqon.com>
Subject: [PATCH 09/10] platform/x86: toshiba_acpi: use device-managed for sysfs removal
Date:   Wed, 24 Mar 2021 14:55:47 +0200
Message-Id: <20210324125548.45983-10-aardelean@deviqon.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324125548.45983-1-aardelean@deviqon.com>
References: <20210324125548.45983-1-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This change moves the creation of the Toshiba ACPI group to be
automatically removed when the parent refcount goes to zero.

The main reason to do this, is to also enforce that the order of removal is
mirroring the order of initialization.

Signed-off-by: Alexandru Ardelean <aardelean@deviqon.com>
---
 drivers/platform/x86/toshiba_acpi.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index a1249f6dde9a..8e8917979047 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -200,7 +200,6 @@ struct toshiba_acpi_dev {
 	unsigned int usb_three_supported:1;
 	unsigned int wwan_supported:1;
 	unsigned int cooling_method_supported:1;
-	unsigned int sysfs_created:1;
 	unsigned int special_functions;
 
 	bool kbd_event_generated;
@@ -3019,10 +3018,6 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
 
 	remove_toshiba_proc_entries(dev);
 
-	if (dev->sysfs_created)
-		sysfs_remove_group(&dev->acpi_dev->dev.kobj,
-				   &toshiba_attr_group);
-
 	return 0;
 }
 
@@ -3049,6 +3044,13 @@ static void toshiba_acpi_misc_deregister(void *data)
 	misc_deregister(miscdev);
 }
 
+static void toshiba_acpi_sysfs_remove(void *data)
+{
+	struct kobject *kobj = data;
+
+	sysfs_remove_group(kobj, &toshiba_attr_group);
+}
+
 static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 {
 	struct device *parent = &acpi_dev->dev;
@@ -3219,21 +3221,20 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
 
 	ret = sysfs_create_group(&dev->acpi_dev->dev.kobj,
 				 &toshiba_attr_group);
-	if (ret) {
-		dev->sysfs_created = 0;
-		goto error;
-	}
-	dev->sysfs_created = !ret;
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(parent,
+				       toshiba_acpi_sysfs_remove,
+				       &dev->acpi_dev->dev.kobj);
+	if (ret)
+		return ret;
 
 	create_toshiba_proc_entries(dev);
 
 	toshiba_acpi = dev;
 
 	return 0;
-
-error:
-	toshiba_acpi_remove(acpi_dev);
-	return ret;
 }
 
 static void toshiba_acpi_notify(struct acpi_device *acpi_dev, u32 event)
-- 
2.30.2

