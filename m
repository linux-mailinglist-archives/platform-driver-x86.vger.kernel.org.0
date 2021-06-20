Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 046553ADE2A
	for <lists+platform-driver-x86@lfdr.de>; Sun, 20 Jun 2021 13:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229571AbhFTLd6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 20 Jun 2021 07:33:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:49934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229568AbhFTLd5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Jun 2021 07:33:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A530610CA
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Jun 2021 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624188705;
        bh=NqE4Mxeau54y2tVsMr5wKUk8EnBZQtl79zmsJHql69U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=J1W0xEwbr7QOMa5DaM3xZiOUBc+GunTAc5SotZjBiJ5aF6V44v2KgPDkxOy+zaLTK
         tWZrUr0Ver7U4fRPDgYkLTPahLiagliSlaaM5gO9sLNlATl0INQWGwCInwHphsP0sb
         1R/E7aqWnDWwDgKbKga6vhcdy+tlzySIpguChYN7UH5KiWnPb6NRU4yaTPQKikKKfK
         Og6PeDPjzXE4b/nZIRm0gSCub7Fbf6I7Mgtu8A/P44YupVEUUf04DFuodjWNwzDFCm
         GmI18769+bsPVrq12ROCn4/CdiongWABU6DUhmpb1xVX4cr29e5h9KhqudY0Ca4FGg
         7y+iADC+yxhxg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 75E34611B0; Sun, 20 Jun 2021 11:31:45 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213511] kernel panic during boot
Date:   Sun, 20 Jun 2021 11:31:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: linux@brodo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213511-215701-R2oAkqjc2N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213511-215701@https.bugzilla.kernel.org/>
References: <bug-213511-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213511

--- Comment #2 from Dominik Brodowski (linux@brodo.de) ---
Created attachment 297499
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297499&action=3Dedit
/proc/ioports

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
