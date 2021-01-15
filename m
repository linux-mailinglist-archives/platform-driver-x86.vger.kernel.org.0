Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 819D32F8043
	for <lists+platform-driver-x86@lfdr.de>; Fri, 15 Jan 2021 17:08:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728668AbhAOQIB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 15 Jan 2021 11:08:01 -0500
Received: from mail-03.mail-europe.com ([91.134.188.129]:32842 "EHLO
        mail-03.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbhAOQIB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 Jan 2021 11:08:01 -0500
Date:   Fri, 15 Jan 2021 16:06:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610726797;
        bh=rpwDHH8YpTsspihYKFgJ2DWnflYdj6iSgdWat1FlfQU=;
        h=Date:To:From:Reply-To:Subject:From;
        b=xg5Gm/bIJ/znB5yTCDXG80Qzr4PNaG1ffB7PKx5TNGUSuvZFpheYABmK0LhzrpMwo
         2H7PHw5/d8N/Klolpjf+o9HjWsArdyboWi+sMeAMqJQMX8NvZ+Oz1YEXD5kRZU8Awr
         3XSYFeQxZIkQ+kCt+3jpkW41/+hoRO4BJ/CeJZcY=
To:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>
From:   jeanniestevenson <jeanniestevenson@protonmail.com>
Reply-To: jeanniestevenson <jeanniestevenson@protonmail.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: Add P53/73 firmware to fan_quirk_table for dual fan control
Message-ID: <Pn_Xii4XYpQRFtgkf4PbNgieE89BAkHgLI1kWIq-zFudwh2A1DY5J_DJVHK06rMW_hGPHx_mPE33gd8mg9-8BxqJTaSC6hhPqAsfZlcNGH0=@protonmail.com>
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

This commit enables dual fan control for the new Lenovo P53 and P73 laptop =
models.

Signed-off-by: Jeannie Stevenson <jeanniestevenson@protonmail.com>

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index c404706379d9..69402758b99c 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8782,6 +8782,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __=
initconst =3D {
 =09TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),=09/* P71 */
 =09TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),=09/* P51 */
 =09TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),=09/* P52 / P72 */
+=09TPACPI_Q_LNV3('N', '2', 'N', TPACPI_FAN_2CTL),=09/* P53 / P73 */
 =09TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),=09/* P1 / X1 Extreme (1s=
t gen) */
 =09TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),=09/* P1 / X1 Extreme (2n=
d gen) */
 =09TPACPI_Q_LNV3('N', '2', 'V', TPACPI_FAN_2CTL),=09/* P1 / X1 Extreme (3n=
d gen) */
