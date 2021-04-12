Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37DC435C77A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Apr 2021 15:25:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239143AbhDLNZU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Apr 2021 09:25:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:39326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237277AbhDLNZU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Apr 2021 09:25:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EC46C61357
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Apr 2021 13:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618233902;
        bh=V+yWSN5haXBa8FKnMIdT6edaMMmBwYltcl5IblZ0Tas=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R0epMN4W3y+Zy0J/nYdZMSTphCl/uDrd/D10nRSJgswT+t4oZATKONGxqbtyFJqBx
         IIlfG4YVTYCSihfH1XV4SWubeFVkcWgrYdBQjfsYUEPM5rOltJfySKuFuWaE5EFdor
         Apvvq0XtldgKbnqVilq2hhGhRZ+dkMcdOAp1sRFQNCfs76TuBU9dt0ko1nmovZXc0J
         UGZ/iEpTzjfayRKk0JqSZoyMsB7DEK6AJxQu9RhBua9Z3ybs57lmw7iEXaegsGVgPT
         44UXabIDmxfifZMjlN6hyGE8B1rk8o2UxKvpIDDaOiUzP1pNRd2nY7fJOpeCbhciQA
         7uDt5j2xsxXuA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id E4741610CF; Mon, 12 Apr 2021 13:25:01 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 12 Apr 2021 13:25:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kdudka@redhat.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-ev3HhYPwAR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #62 from Kamil Dudka (kdudka@redhat.com) ---
Yes, my board was neither listed as supported, nor as unsupported/unknown in
the mentioned README file.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
