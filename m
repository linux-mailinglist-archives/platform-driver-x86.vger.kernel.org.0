Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 010643D1509
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Jul 2021 19:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhGUQn1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Jul 2021 12:43:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:41306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229526AbhGUQn0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 12:43:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A0CC60FDA
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 17:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626888241;
        bh=0nl1BhZ6aeV40Gim7cYbWY2g1Zdl71iAzMrHUbTMeUM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XXZWKQu3yveD0V79nXD9BVLjR+H+mtlysNPYAglvqp6JP0EZ28x9JBD2JXbm9rjdH
         S/L30rqtfxHTcdmclbUYRlyj6h5kKy3Cc0kRZNRkgcz9eMmrCmYfMr3HSc2Nuse/nm
         F9oB+gkikWnbGI342WeOEF2H9X25RRQT23q7BY9CWt9QMQPvG3q8NUs+sHvm+SrhiW
         6TpLKvPZJhniH7W/IPtFqXBBig/Nc8RZbTokWBVvevXJcKy3Vy8thK29L2zedOzJoj
         kc8khesOm0scxM8j0sQFRgDEcv3iGUeeY0w17saQgRnXc8ugS+qx9xABuXbbx24H+g
         YyVPzwCHn52MA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 1FFBF61263; Wed, 21 Jul 2021 17:24:01 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 17:24:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-l2t2sijhsv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #28 from wse@tuxedocomputers.com ---
I found a schematic for the Clevo NH5xHP

According to that the touchpad is connected with 3 wires to the EC and with=
 3
wires to the CPU (and to vcc and gnd ofc):

TP_CLK -> GPF4/PS2CLK2/5VT (EC)
TP_DATA -> GPF5/PS2DAT2/5VT (EC)
TP_I2C_CLK -> BD21 -> GPP_C17/I2C0_SCL
TP_I2C_DAT -> BC22 -> GPP_C16/I2C0_SDA
LID_SW# -> GPB1/LID_SW# (EC)
TP_ATTN# -> BC48 -> GPP_R12/CLKOUT_48

Looking at
https://elixir.bootlin.com/linux/v5.13/source/drivers/pinctrl/intel/pinctrl=
-tigerlake.c
the CPU pins are:
PINCTRL_PIN(37, "CLKOUT_48"),
PINCTRL_PIN(121, "I2C0_SDA"),
PINCTRL_PIN(122, "I2C0_SCL"),

I hope this information helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
