Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FACC39FB8E
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Jun 2021 18:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233315AbhFHQCv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Jun 2021 12:02:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:38612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232688AbhFHQCu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Jun 2021 12:02:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 93736610A2
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Jun 2021 16:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623168057;
        bh=yvMZEACNUgjbIQfJbzt00tBq4JtNkYi50YBp5Ew3Y1U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jBHiL49n/0a5pReOaNJbmhhlPMcF+uZxcTYDjrJgty5NYDla9czYKntdKL+iXK6nu
         CUROX3/X1nWDN2INVB08OiuB9olIdmS+kmfetIj1JdGGtZldC4MF8qyJ8LB543gGQa
         7LMT7gFBhDzzbSjyWnLWKrrkYe2mH1eS2CxFcLbYdZef0i1/MSQJGuilod9h0k3cHl
         SFodZLpqhzffG7vUxLJ4sQj96dB8uhjCd92GihcwfWcq+gz1leDhgTuEFBRtRjaLfp
         sHQienh73LhQvXVu98SbKLiVQbk56pBY53LShclm+b6oAjOmIw2a0mXZbkDKpw9dnU
         Q+OVBwgRd3X7g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8A85161056; Tue,  8 Jun 2021 16:00:57 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211741] amd-hid: add support for SW_TABLET_MODE
Date:   Tue, 08 Jun 2021 16:00:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211741-215701-0kQ99qWaBu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211741-215701@https.bugzilla.kernel.org/>
References: <bug-211741-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211741

--- Comment #4 from Luya Tshimbalanga (luya@fedoraproject.org) ---
See the linked showing that SW_TABLET_MODE never worked with hp-wmi and why=
 it
was disabled in kernel 5.11.x for the time being:

https://bugzilla.redhat.com/show_bug.cgi?id=3D1651886#c44

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
