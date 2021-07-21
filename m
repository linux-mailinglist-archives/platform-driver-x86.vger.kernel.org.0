Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B368E3D15C1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Jul 2021 19:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbhGURSp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Jul 2021 13:18:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:56888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229948AbhGURSp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 13:18:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DCF9760E0C
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 17:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626890361;
        bh=SRnQYMSIY0nymk+sUH1yx0tlrFAakne4n7W4r50h/pc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KDJML6bppt0VpBsQwfL/utzuo6Fa/lEhFw2rUrIpTz3qCrjWgPY1/aTWjpjpySkrA
         g34E5aeJgT1BpuoL0WuIqyVSFGTyiyzDSIATtPQvEM9f1UpA0kYasyvVFN4B2cAL+M
         +0P/wpyoqkSoGMAmT73Evb1WIEVVOFzgvE9IsscqY4vNRu/j5QYRAmlNzCJ8jpJokD
         eodgiqFO7Kh6o5vpWsgiHvbZ7uOMIk72QMB3daUPcw2C6kaXAnjvukGGe93G6CDz6z
         8kmvHdhEv0jf3nA3HKp5xN0qopQhRGpRijGNkW5cX9Bw6eOs+3IS5ZtPCnfndUZT+p
         RVwW2W6graW3g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C6B7461263; Wed, 21 Jul 2021 17:59:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Wed, 21 Jul 2021 17:59:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: patacca@autistici.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-JMRQAsEqKA@https.bugzilla.kernel.org/>
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

--- Comment #30 from Riccardo Mori (patacca@autistici.org) ---
I am going to test it soon

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
