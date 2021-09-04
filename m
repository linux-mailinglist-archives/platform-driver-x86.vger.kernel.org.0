Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E554400C5A
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237317AbhIDR4h (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:37 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:38104 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbhIDR4h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:37 -0400
Date:   Sat, 04 Sep 2021 17:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778133;
        bh=Ujb753o2jpL8FGy8OVxlFHKih2w3WtkbFVfryXun3z4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=iphX+onY/T1opYf71moq+GyUSdp3WVQPVjffPXyFSutI37I7cMXvtdZHa2CTO7r5c
         UB9zjaMo/XfyFE1VdHHtvuoAd9OFFfMplqDwzDuUyMXjt5ARzls0oFm1C3vuPcGkGW
         Xtf0f7C80oUrtm7Dlneg38RkLBQd7hxCpbCRwfYI=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 09/30] platform/x86: wmi: remove stray empty line
Message-ID: <20210904175450.156801-10-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove an empty line after the last statement
in `acpi_wmi_notify_handler()` which serves
no purpose.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index c3ee64843731..42cc83cf117f 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1321,7 +1321,6 @@ static void acpi_wmi_notify_handler(acpi_handle handl=
e, u32 event,
 =09=09wblock->acpi_device->pnp.device_class,
 =09=09dev_name(&wblock->dev.dev),
 =09=09event, 0);
-
 }

 static int acpi_wmi_remove(struct platform_device *device)
--
2.33.0


