Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46FFB6F2592
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Apr 2023 20:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229865AbjD2SQx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Apr 2023 14:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229768AbjD2SQw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Apr 2023 14:16:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 644CA1FCA
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Apr 2023 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682792163;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qoMw8hZsLZdf/cdbGeh0wbM5n+2XCZVN28XQ0DZAp9Y=;
        b=Q+8LsIhY03iK4IYOQBTr9orZ/C3oxlYS2d7Fhzfu03mAyUcWbQLcMIq1BiSc+oqOduWuc9
        5INndm2xYwACjRaUKZl34wleeAEdMMEllR9fvFsEI4x6F5OJbVoY8qm6wI9HyIYCxS0GO1
        wQEt+UeEQjFQQEq9TDF4urd4YLitHH8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-507-eyYPoH-XMuqKrmH-ozuZBg-1; Sat, 29 Apr 2023 14:16:01 -0400
X-MC-Unique: eyYPoH-XMuqKrmH-ozuZBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 129FA85A588;
        Sat, 29 Apr 2023 18:16:01 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8F62F2027043;
        Sat, 29 Apr 2023 18:15:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH 00/19] platform/x86: lenovo-yogabook: Modify to also work on Android version
Date:   Sat, 29 Apr 2023 20:15:32 +0200
Message-Id: <20230429181551.98201-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

The Lenovo Yoga Book (yb1-x9*) is a yoga 2-in-1 where the keyboard
half has a touch keyboard (with a backlit fixed key layout) to make
it extra thin and light. The keyboard half can also be switched to
an alternative wacom digitizer mode where it instead can be used
to draw on. The backlight + switching is handled by
the lenovo-yogabook driver.

There are both Windows and Android versions with different BIOS-es /
ACPI tables. This series extends the current Windows model only driver
to also support the Android model.

On the Android yb1-x90f/l models there is not ACPI method to control
the keyboard backlight brightness. Instead the second PWM controller
is exposed directly to the OS there.

This requires adding a pwm_lookup table and the lenovo-yogabook code
can (and typically is) build as a module. So the first patch in
this series exports pwm_add_table() and pwm_remove_table() for use
in modules.

I believe that it is easiest to just merge the entire series through
the drivers/platform/x86 tree. Thierry, may I have your ack for
patch 1/19 to merge it through the pdx86 tree ?

Regards,

Hans


Hans de Goede (19):
  pwm: Export pwm_add_table() / pwm_remove_table()
  platform/x86: lenovo-yogabook: Fix work race on remove()
  platform/x86: lenovo-yogabook: Reprobe devices on remove()
  platform/x86: lenovo-yogabook: Set default keyboard backligh
    brightness on probe()
  platform/x86: lenovo-yogabook: Simplify gpio lookup table cleanup
  platform/x86: lenovo-yogabook: Switch to DEFINE_SIMPLE_DEV_PM_OPS()
  platform/x86: lenovo-yogabook: Store dev instead of wdev in drvdata
    struct
  platform/x86: lenovo-yogabook: Add dev local variable to probe()
  platform/x86: lenovo-yogabook: Use PMIC LED driver for pen icon LED
    control
  platform/x86: lenovo-yogabook: Split probe() into generic and WMI
    specific parts
  platform/x86: lenovo-yogabook: Stop checking adev->power.state
  platform/x86: lenovo-yogabook: Abstract kbd backlight setting
  platform/x86: lenovo-yogabook: Add a yogabook_toggle_digitizer_mode()
    helper function
  platform/x86: lenovo-yogabook: Drop _wmi_ from remaining generic
    symbols
  platform/x86: lenovo-yogabook: Group WMI specific code together
  platform/x86: lenovo-yogabook: Add YB_KBD_BL_MAX define
  platform/x86: lenovo-yogabook: Add platform driver support
  platform/x86: lenovo-yogabook: Add keyboard backlight control to
    platform driver
  platform/x86: lenovo-yogabook: Rename lenovo-yogabook-wmi to
    lenovo-yogabook

 drivers/platform/x86/Kconfig               |   6 +-
 drivers/platform/x86/Makefile              |   2 +-
 drivers/platform/x86/lenovo-yogabook-wmi.c | 408 --------------
 drivers/platform/x86/lenovo-yogabook.c     | 587 +++++++++++++++++++++
 drivers/pwm/core.c                         |   2 +
 5 files changed, 593 insertions(+), 412 deletions(-)
 delete mode 100644 drivers/platform/x86/lenovo-yogabook-wmi.c
 create mode 100644 drivers/platform/x86/lenovo-yogabook.c

-- 
2.39.2

