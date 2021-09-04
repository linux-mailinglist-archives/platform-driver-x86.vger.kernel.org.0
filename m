Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0B2400C61
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbhIDR47 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:59 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:36581 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR47 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:59 -0400
Date:   Sat, 04 Sep 2021 17:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778155;
        bh=DCt0KJ8hjPB8FkCriJLTZ89ABmv8kzwN5WHB+pIjrDw=;
        h=Date:To:From:Reply-To:Subject:From;
        b=sxjeQ+JNrk/6435tC09eyiJGRBwpDGncsLRHcpitj+7NszXm9XmhG3BjboBu5TPuh
         C/WWHIZK9Wea19g9J+GK6xpfVgqmpoiJnDe54N9JIWnSmvhRV83Gs3Shdw9bewQAUF
         On4Qp4EWLMH/clMG2fC2SFRC0g5yCAqz2b5auaCE=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 17/30] platform/x86: wmi: use sizeof() instead of hard-coding
Message-ID: <20210904175450.156801-18-pobrn@protonmail.com>
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

Avoid hard-coding the buffer size in an `snprintf()`
call by using `sizeof()` to retrieve the size.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index f05c89fd1f79..979135a678e0 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -189,7 +189,7 @@ static acpi_status wmi_method_enable(struct wmi_block *=
wblock, bool enable)
 =09block =3D &wblock->gblock;
 =09handle =3D wblock->acpi_device->handle;

-=09snprintf(method, 5, "WE%02X", block->notify_id);
+=09snprintf(method, sizeof(method), "WE%02X", block->notify_id);
 =09status =3D acpi_execute_simple_method(handle, method, enable);

 =09if (status !=3D AE_OK && status !=3D AE_NOT_FOUND)
--
2.33.0


