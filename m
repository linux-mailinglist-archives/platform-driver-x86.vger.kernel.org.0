Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64933D8DDD
	for <lists+platform-driver-x86@lfdr.de>; Wed, 28 Jul 2021 14:31:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234881AbhG1Mbf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 28 Jul 2021 08:31:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:38744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234676AbhG1Mbb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 08:31:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 791B260FA0
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 12:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627475490;
        bh=ockHK3ZJfv3Eyjuf72jbJg0eKXq0Am5mmwCGw+WfGpY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GNoZOZtz4rqpR1oAwremrTkb6RVc2rFCH7FbgSF5sPhUqI1A+OxoogU7m+MIWYX8t
         H9n+yq+/iJ6iotOTUsFBxSAKuw0n8Q64X2HkWdE649hsf6TngsNBL3HuGIHJdxPSBA
         ZNA1cnUAUN19C+aRwhQhcvB11uIJidMkDHrwVJHQ2b+gs1qK9Yfv2uQ3yVLXYanSsK
         /uctPa9ObPMbnhTk1xjI/VY4IMmF30r2hARyKZSzdbTWoU2+t+G9fxmFGThiPCGFtN
         MHA0/c80kdnGJbuKU7ia07c80k7NppDOIik1CVznMnb5B8QjIiTYGV0TLJSp2QsB28
         JDMtXrKvEVTSA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 70A6660ED4; Wed, 28 Jul 2021 12:31:30 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 209011] asus-wmi always reports tablet mode on a ZenBook
 UX390UAK
Date:   Wed, 28 Jul 2021 12:31:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julius@devpi.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-209011-215701-aUG0RScFjk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209011-215701@https.bugzilla.kernel.org/>
References: <bug-209011-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209011

--- Comment #9 from Julius Lehmann (julius@devpi.de) ---
Created attachment 298075
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298075&action=3Dedit
acpidump - TP412UA

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
