Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E3983DEBC3
	for <lists+platform-driver-x86@lfdr.de>; Tue,  3 Aug 2021 13:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235527AbhHCLca (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 3 Aug 2021 07:32:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:55840 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235524AbhHCLca (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Aug 2021 07:32:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8305F60EBC
        for <platform-driver-x86@vger.kernel.org>; Tue,  3 Aug 2021 11:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627990339;
        bh=l8yb9vkPBQzFS7n+npOOEb+2JjUcu4AgHF2QTE16v6E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Jc121Mj8Oj0yAo617zpSnkljyvobFA/Dfj3Trcx/Yp755UGseWSvWkLvLwzfsVh+K
         OTbvgcI+rO+8IBlhAZN6aJULjvilCQNw56VcP24RqHlAlodtVg7G2ESFTcT5Z/8CCw
         j2rhKtqP1tqTX5e5T4PiIOS8jNcowqa6YR35AppcqfYozhvZaH18mmtiuZbvfiHkkF
         YduZbedfJrBPolvMa49+TEJSRhb65oVW8xL+IrF72008k18YouvbI4NaGzxuFoIweC
         Ej2mvaPlYrRUZGiTJHWvthKVzP5hMFn/7ZCctTcBOnCq1oXU57RhmxOq/gdWyAUP5W
         we3jnmUlYA89g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6AF0D60EBC; Tue,  3 Aug 2021 11:32:19 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 03 Aug 2021 11:32:19 +0000
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
Message-ID: <bug-213579-215701-t5U5VI2tGt@https.bugzilla.kernel.org/>
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

--- Comment #47 from wse@tuxedocomputers.com ---
More testing: Using the fixed acpi table on windows breaks the touchpad.

So windows expects the 0x2C here?

Is there some offset not implemented in the Linux kernel?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
