Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29189395EF9
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 May 2021 16:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbhEaOGD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 May 2021 10:06:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:37418 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232516AbhEaOEA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 May 2021 10:04:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 47A8C61952
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 May 2021 13:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622468280;
        bh=gIpqn/x+ThXTyfdCxR0Glvpzya4xIJDvPScsy6nby0U=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GD2YEBsCDLhozo44oMXp959L0yl1VBSaoM8XXo7JAucrbDWLNnPnk7OBertuTIpTb
         MRzpS62EXSPQI2lHKiR5G0ZC+1cYcBtsmBjYX7AfuAyZyL5qi9CPuO7U1jqXETw9s/
         tuQMahxfundL8FaYOR/dSIg7vlSBEdJcOazdL3ubOFwN0EaDLJ8QukYRfn6UlJrOM1
         TS0FGy3n44yq20xuca4Pyp4DJ0JV2XIEj+qQwufLMeO9YGCxCSsxUIm55eSae8rsng
         B4Aevp9XqMT3t98iUEkqtmLmCFIl8hsOGEIDN+B//XTuRvU2mYWU7sQDIUMFVOVBSG
         ElnaJnPg6nx5A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3F81761157; Mon, 31 May 2021 13:38:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213297] ideapad-laptop: DYTC interface not found, several
 functionalities missing
Date:   Mon, 31 May 2021 13:38:00 +0000
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
Message-ID: <bug-213297-215701-mw0ipTI08P@https.bugzilla.kernel.org/>
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

--- Comment #1 from Johannes P (johannes.penssel@gmail.com) ---
Created attachment 297075
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297075&action=3Dedit
dmesg boot log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
