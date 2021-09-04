Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E837400C56
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237302AbhIDR4X (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:23 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:55908 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbhIDR4W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:22 -0400
Date:   Sat, 04 Sep 2021 17:55:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778117;
        bh=Uaqd0jXLjtY3STuCp7rKf0fXMDLb+KTv9C74JFI4EmI=;
        h=Date:To:From:Reply-To:Subject:From;
        b=esS7Kru35VMit9A8IyUymB2q5h16wZ0qrfSTHR6FlaKGhAKLcrTwRn6YOis7w2gA7
         SaY3puUSwHFVEWvCyExTz52VxJ7n9EXFpwVbdG4nlzoTHMXEYk4t1TcSCM/k9DFsyA
         WUD+OPMeSzmOucAnqBpeyUHGeSmIHbnfdbbJVSVo=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 06/30] platform/x86: wmi: remove unnecessary variable
Message-ID: <20210904175450.156801-7-pobrn@protonmail.com>
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

The `status` variable was assigned at the end, and then
immediately returned. Remove it altogether, and return
the previously assigned value directly.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 36890e301df5..dc31f81d83a7 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -254,7 +254,6 @@ acpi_status wmidev_evaluate_method(struct wmi_device *w=
dev, u8 instance,
 =09struct guid_block *block;
 =09struct wmi_block *wblock;
 =09acpi_handle handle;
-=09acpi_status status;
 =09struct acpi_object_list input;
 =09union acpi_object params[3];
 =09char method[5] =3D "WM";
@@ -290,9 +289,7 @@ acpi_status wmidev_evaluate_method(struct wmi_device *w=
dev, u8 instance,

 =09strncat(method, block->object_id, 2);

-=09status =3D acpi_evaluate_object(handle, method, &input, out);
-
-=09return status;
+=09return acpi_evaluate_object(handle, method, &input, out);
 }
 EXPORT_SYMBOL_GPL(wmidev_evaluate_method);

--
2.33.0


