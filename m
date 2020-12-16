Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A7852DB87F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Dec 2020 02:40:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgLPBjy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Dec 2020 20:39:54 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:19361 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgLPBjy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:39:54 -0500
Date:   Wed, 16 Dec 2020 01:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082752;
        bh=G5Q/dImlhjgPdFyvZPfG1F6/jzaFuuMWOBF1F76yj5I=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=HTDpsMfduobjG5FeILV6QqFZxj2C2fVtqmJo1LEbF/EHOIy0ubcEifbtka3zfOkV7
         WAUFdAWnA50e/1PxCABYmMEjoSLnW5ZwciH91I8Kt8JR31RjCztvyQ2jZi6N+YqALM
         pibl5xIBz1wXuBJjyC/CTKOtQOB1Tc3sr7F1CU/w=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 01/24] platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata() call
Message-ID: <20201216013857.360987-2-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
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

The driver core already sets the driver specific data on bind failure
or removal. Thus the call is unnecessary.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 7598cd46cf60..9ed5bd8d955b 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -1071,7 +1071,6 @@ static int ideapad_acpi_remove(struct platform_device=
 *pdev)
 =09ideapad_input_exit(priv);
 =09ideapad_debugfs_exit(priv);
 =09ideapad_sysfs_exit(priv);
-=09dev_set_drvdata(&pdev->dev, NULL);
=20
 =09return 0;
 }
--=20
2.29.2


