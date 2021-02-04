Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9433630F4D1
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Feb 2021 15:21:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236638AbhBDOVQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Feb 2021 09:21:16 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:24075 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236651AbhBDOVJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 09:21:09 -0500
Date:   Thu, 04 Feb 2021 14:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612448424;
        bh=/3im6k1GNlJEIup7dacbvSESNlDgje5cX9xH2M6HCdg=;
        h=Date:To:From:Reply-To:Subject:From;
        b=KAiNUiVI8aFZF5B4Mqqi1Sdqnol9Bmr9Sqx89c9xe/MiCz6ETR4+oObOadzIjO3CY
         4VrNm3g8+bwi0pZAMJuLOVRpMjsYxBmuvWOAMQEhUev0lZ7AMplSJ3XBRgGwenova0
         KUMJce5LmtTF4X8pcd9zb1wwOTQpYK3bx+6t908k=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH] platform/x86: Kconfig: add missing selects for ideapad-laptop
Message-ID: <20210204142010.356675-1-pobrn@protonmail.com>
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

LED class support is needed by the ideapad-laptop module to compile after
the referenced commit. Add missing NEW_LEDS and LEDS_CLASS to Kconfig.

Fixes: 503325f84bc0 ("platform/x86: ideapad-laptop: add keyboard backlight =
control support")
Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index cf76e724e8c3..89cc2936f2ef 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -452,6 +452,8 @@ config IDEAPAD_LAPTOP
 =09depends on ACPI_WMI || ACPI_WMI =3D n
 =09depends on ACPI_PLATFORM_PROFILE
 =09select INPUT_SPARSEKMAP
+=09select NEW_LEDS
+=09select LEDS_CLASS
 =09help
 =09  This is a driver for Lenovo IdeaPad netbooks contains drivers for
 =09  rfkill switch, hotkey, fan control and backlight control.
--=20
2.30.0


