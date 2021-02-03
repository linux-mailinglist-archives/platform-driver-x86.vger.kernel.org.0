Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE3E30E532
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:55:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbhBCVzA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:55:00 -0500
Received: from mail-40134.protonmail.ch ([185.70.40.134]:34416 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231807AbhBCVzA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:55:00 -0500
Date:   Wed, 03 Feb 2021 21:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389257;
        bh=5gAqn1Uyyzp6MO4df2yrBHmNngOgwJaLQf2Gis59Edo=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=n0zfcP2KxztNUEw6050BmNOWjqZhNXtYU1ml4PmJK7b4HPiCliT/3qG3eZztQbETG
         gbiwVBlWwIa3WJVCLmEvgqXLX7sCaJFXuZZ+U1FNaLUQ2d9LPEZSxYo9LdL52gF93X
         FNTEFfY+HK2VUQYGuCXmscfdPYrsbAUWYSC/Ix18=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 01/29] platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata() call
Message-ID: <20210203215403.290792-2-pobrn@protonmail.com>
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
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

The driver core already sets the driver specific data on
bind failure or removal. Thus the call is unnecessary.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index cc42af2a0a98..18c71e28ebc8 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1369,7 +1369,6 @@ static int ideapad_acpi_remove(struct platform_device=
 *pdev)
 =09ideapad_input_exit(priv);
 =09ideapad_debugfs_exit(priv);
 =09ideapad_sysfs_exit(priv);
-=09dev_set_drvdata(&pdev->dev, NULL);
=20
 =09return 0;
 }
--=20
2.30.0


