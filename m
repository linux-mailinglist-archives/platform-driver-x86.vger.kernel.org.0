Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E15630E553
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:58:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbhBCV55 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:57:57 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:61311 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbhBCV5t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:49 -0500
Date:   Wed, 03 Feb 2021 21:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389424;
        bh=AG4jrH82e4o9CdvlpSlQYJ2SZkUKJ+Pbuikp1H0i90c=;
        h=Date:To:From:Reply-To:Subject:From;
        b=hPqOE23CPlBIT0mp712gDI7E+kgHYqSpF4WsiG2iakQwm8CI1Tm0MSQU7z+yigxm+
         1gKZt2YqgP18mJFD87csvS2rEKI95MmEvp9EK6bTo6+diCPy0aP2Wnn7XHTMtYnhpd
         lDUmq+H4mAypDMtJiGHffpcOeHVbRzPxuav8shck=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 25/29] platform/x86: ideapad-laptop: send notification about touchpad state change to sysfs
Message-ID: <20210203215403.290792-26-pobrn@protonmail.com>
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

Consumers can determine if the value of an attribute changed much more
easily if changes are broadcast using sysfs_notify(), so utilize it.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 2068831c5fe8..76b723f32c84 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1224,6 +1224,7 @@ static void ideapad_sync_touchpad_state(struct ideapa=
d_private *priv)
 =09=09 */
 =09=09i8042_command(&param, value ? I8042_CMD_AUX_ENABLE : I8042_CMD_AUX_D=
ISABLE);
 =09=09ideapad_input_report(priv, value ? 67 : 66);
+=09=09sysfs_notify(&priv->platform_device->dev.kobj, NULL, "touchpad");
 =09}
 }
=20
--=20
2.30.0


