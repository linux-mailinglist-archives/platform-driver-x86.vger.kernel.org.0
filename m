Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A14C400C59
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237297AbhIDR4f (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:35 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:58304 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237282AbhIDR4f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:35 -0400
Date:   Sat, 04 Sep 2021 17:55:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778131;
        bh=5h8z55lNsaA+ijdoGzRpnCzu0eDR/FDf6B9HgN5ftAY=;
        h=Date:To:From:Reply-To:Subject:From;
        b=L6q7qmmHlTsezpAemyYbxMCPRs7Jr5QVR9szw+qTiP/7CLn9YTNWwbx1Vo0Ln08UD
         e8HxhvOmTcmJe3iM8ADV4wMOjYj/5sKJ/dPnmTVmuOIyqRr5ru/xMwAtqxc1OcSp9u
         BB75De4lwLIC7Te+p2xop2u9EMRDe/qzxzK3vjPI=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 10/30] platform/x86: wmi: remove unnecessary checks
Message-ID: <20210904175450.156801-11-pobrn@protonmail.com>
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

The `find_guid_context()` is only called from one place,
and `wblock` and `wdriver` cannot be NULL there.
So remove the currently redundant checks.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 42cc83cf117f..46ebc4e421b4 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -135,8 +135,6 @@ static const void *find_guid_context(struct wmi_block *=
wblock,
 =09const struct wmi_device_id *id;
 =09guid_t guid_input;

-=09if (wblock =3D=3D NULL || wdriver =3D=3D NULL)
-=09=09return NULL;
 =09if (wdriver->id_table =3D=3D NULL)
 =09=09return NULL;

--
2.33.0


