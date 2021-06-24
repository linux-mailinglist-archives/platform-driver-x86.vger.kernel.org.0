Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A477A3B2F6C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Jun 2021 14:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbhFXMzq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 24 Jun 2021 08:55:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:44004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230236AbhFXMzq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Jun 2021 08:55:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2E7E661374
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Jun 2021 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624539207;
        bh=UoGhrau9UBAIBRxCv80/vTzfCoAJRZivEHSsWEBPZcI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b/wQqT1kP8cWkky+viZC35oKz4Ae2Ka1N3/E87JAkSdzkpU9J5HnZmsslCceCbRzO
         InInEJhJZkkMuiM23VN25jdoVetWx/i6ypNKS7etuB6mB25+e5OTYdief7dhGFqUK9
         q6Lmcj+G5BzEvpNt+zOvvK3ypU/5ptTTbHVx/DqCV2u1uJAKTH5/Fauzjui4YMd9lZ
         GV/OutK1J1ma+5nyD+4HT5W0Fm40iRwUEcD6Rh5TRcoCtKdFKh/S9mAvNrtDiHDd6d
         XKbGo8sZApfizC28Jlsmna+FDDEtjm3iSbmwl2bPAUj+f+prytGLhEPhDFHJEJHUHD
         IsRuUnYXDdRUg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2B1CB610A2; Thu, 24 Jun 2021 12:53:27 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 210457] Fan sporadically maxed on wake-up due to unavailable
 sensor temperature
Date:   Thu, 24 Jun 2021 12:53:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: s-cvhajmmblfsofmpsh@thorsten-wissmann.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210457-215701-Pe5g1v5gBd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210457-215701@https.bugzilla.kernel.org/>
References: <bug-210457-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210457

--- Comment #12 from Thorsten (s-cvhajmmblfsofmpsh@thorsten-wissmann.de) ---
After updating to kernel 5.12.12(-arch1-1), the issue still existed, but on=
ly
after multiple suspend/resume-cycles (I couldn't find a deterministic way to
reproduce it). After a BIOS update I wasn't able to reproduce it anymore. T=
he
BIOS now reports: UEFI BIOS Version: N1MET65W (1.50), Embedded Controller
Version: N1MHT31W (1.20), Machine Type Model: 20HQS3KG00. However, I do not
own/hold the laptop anymore, so I can't tell whether the issue returns after
running the laptop for a longer time (days, or so).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
