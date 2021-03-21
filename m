Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8045E343265
	for <lists+platform-driver-x86@lfdr.de>; Sun, 21 Mar 2021 13:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCUMXt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 21 Mar 2021 08:23:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:32772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229784AbhCUMXc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 08:23:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 59F3C61941
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 12:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616329412;
        bh=gxtaN/CtoJBFnmyy1+50Gg/Yh7b/p4L9ALSpCEYAmD8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BT38ptHfQavzKZF/8YaNEgrnMXGK1Kz2LiLJ5K0iikZp+MY+OZxQ7bx8jmvssYib2
         svrYnnO9A6Wa3tBwukz6CZKjtug+UNW5updFJ6vBxOurwPAE/6juel+LuLDsV6w5tf
         N+f94qGafqk5FMvmGt2KyYEj2z5jzTSNgl690CU9UHZxNQOWQsUm7lw9HB6p3XaypE
         zX5SXeJfE2lknK38d+cXF4XIfiuCk1BUfZhkAGj37vFZftq/75b2YnLI9UowrcIEtV
         OQPSGm/WfOTWuts3R91zqZHFsIqyyZyAqAgEYU4HcZk28fZuvASGNX7pXEgBwmcTPZ
         XGtzBK9l/U26w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 4429A62AAE; Sun, 21 Mar 2021 12:23:32 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211895] dell_wmi_sysman causes unbootable system
Date:   Sun, 21 Mar 2021 12:23:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211895-215701-ETBgz1PExS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211895-215701@https.bugzilla.kernel.org/>
References: <bug-211895-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211895

--- Comment #10 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Thanks to Freddy's testing, we now have confirmation that the patches fix
things and I now also now the exact circumstances / root-cause which trigge=
rs
this crash.

I've posted a v2 of the patches, adding one more robustness fix and dropping
one patch which needs more testing:

https://lore.kernel.org/platform-driver-x86/20210321115901.35072-1-hdegoede=
@redhat.com/T/#t

I'll work on getting these merged by Linus and then also on getting them ad=
ded
to the stable kernel series (I'm the drivers/platform/x86 maintainer). In t=
he
mean time it would be best if distros carry the v2 patch-series as downstre=
am
patches.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
