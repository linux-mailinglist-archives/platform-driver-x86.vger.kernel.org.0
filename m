Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4351D395F1E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 May 2021 16:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbhEaOIB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 May 2021 10:08:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232875AbhEaOGB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 10:06:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E25F06195E
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 May 2021 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622468333;
        bh=gpYvEvRCPkrqmrVo3on34pQjHnHkY50tRstjpMhjN5w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o483g/vR7pbbUa88VoVtk4lrEjdLW4udbNCsxF3YIsq3mFiEuUA6OC3ZsRj6Gc8Ct
         uJUEtEASYrLH3WvbYXnNVQ99MCGiH8Zbqk40SsnSoBptM82gchHzziSxeW3ftgznfM
         X5iHoFozv1xe1aTn2gvzgWN6Cy+03z4gE0BSnL2HtKOP6gU3lLiLPPQdW5pvIhlIht
         6PLW+8VYn5/+8rXtCiiLy+ys6+rOG+c1JGACqf+PA35Z7o11hGXt3GdxtnE5I+DYu5
         MUzen2fny722qKRjsICwr3cejLy1X7Fl+dGDOxouQaANwsU3Td7+kSIJHo5Sclb4if
         v4tCiny+/GZ0g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D9AE361157; Mon, 31 May 2021 13:38:53 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Mon, 31 May 2021 13:38:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johannes.penssel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213297-215701-A1BjJ8hikQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213297-215701@https.bugzilla.kernel.org/>
References: <bug-213297-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213297

--- Comment #2 from Johannes P (johannes.penssel@gmail.com) ---
Created attachment 297077
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297077&action=3Dedit
DSDT.dsl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
