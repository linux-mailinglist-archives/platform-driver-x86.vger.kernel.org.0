Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0023400C62
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237297AbhIDR5B (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:57:01 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:59987 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR5A (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:57:00 -0400
Date:   Sat, 04 Sep 2021 17:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778156;
        bh=ML+bFiDT8uKwEDgTby/Q6ZiVFNrU5Dm92qzCoSPh7Qg=;
        h=Date:To:From:Reply-To:Subject:From;
        b=uKn0qEKy4zAbEsrOvIfCIP91PTvd6R1DSE63BqGsTaM5kSsawnGRkA4Mq+5obJDVI
         XgNVbOugKK5mAHdMyYynzBvdJffal27psJ4YE0Pnhy4z2l9OAibBTZuBU2r+Y9HaxY
         PmmiTlubH13SPDKkLMDJ8b2rYtS2sdtJ6WYHVYgA=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 18/30] platform/x86: wmi: use !p to check for NULL
Message-ID: <20210904175450.156801-19-pobrn@protonmail.com>
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

Other parts of the code use the `!p` idiom to check
for NULL pointers, convert `find_guid_context()` to
do the same.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 979135a678e0..0e721d868bf7 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -141,10 +141,10 @@ static const void *find_guid_context(struct wmi_block=
 *wblock,
 =09const struct wmi_device_id *id;
 =09guid_t guid_input;

-=09if (wdriver->id_table =3D=3D NULL)
+=09id =3D wdriver->id_table;
+=09if (!id)
 =09=09return NULL;

-=09id =3D wdriver->id_table;
 =09while (*id->guid_string) {
 =09=09if (guid_parse(id->guid_string, &guid_input))
 =09=09=09continue;
--
2.33.0


