Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0430400C51
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhIDR4I (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:08 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:39480 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237247AbhIDR4I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:08 -0400
Date:   Sat, 04 Sep 2021 17:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778103;
        bh=5xz8REU2zTnPpbrXMnernHNASHyjzj6oSURQi478v00=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=UfVpXSj+lmFgqEr4GeaQhmln+lTV1tvz1GcgPNm5w8Jw9NvUXhY+tHRqVqO5FpMit
         r//M/ZC3jpCmwZYuXZAIzl+9LkylrVqAG6+tA0zi1bPXywmWIQEmj83s+BRmeB6CzV
         IjDH4gvYwuW0cCJT4Im2bdiW1JRS0Xj26h9tgSuw=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 03/30] platform/x86: wmi: remove commas
Message-ID: <20210904175450.156801-4-pobrn@protonmail.com>
In-Reply-To: <20210904175450.156801-1-pobrn@protonmail.com>
References: <20210904175450.156801-1-pobrn@protonmail.com>
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

Remove commas that are after terminating entries in arrays.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 73ed17a53af5..67c09d81a676 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -714,7 +714,7 @@ static struct attribute *wmi_attrs[] =3D {
 =09&dev_attr_guid.attr,
 =09&dev_attr_instance_count.attr,
 =09&dev_attr_expensive.attr,
-=09NULL,
+=09NULL
 };
 ATTRIBUTE_GROUPS(wmi);

@@ -729,7 +729,7 @@ static DEVICE_ATTR_RO(notify_id);

 static struct attribute *wmi_event_attrs[] =3D {
 =09&dev_attr_notify_id.attr,
-=09NULL,
+=09NULL
 };
 ATTRIBUTE_GROUPS(wmi_event);

@@ -755,13 +755,13 @@ static DEVICE_ATTR_RO(setable);
 static struct attribute *wmi_data_attrs[] =3D {
 =09&dev_attr_object_id.attr,
 =09&dev_attr_setable.attr,
-=09NULL,
+=09NULL
 };
 ATTRIBUTE_GROUPS(wmi_data);

 static struct attribute *wmi_method_attrs[] =3D {
 =09&dev_attr_object_id.attr,
-=09NULL,
+=09NULL
 };
 ATTRIBUTE_GROUPS(wmi_method);

--
2.33.0


