Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7CE7376F07
	for <lists+platform-driver-x86@lfdr.de>; Sat,  8 May 2021 05:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230165AbhEHDCB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 7 May 2021 23:02:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229775AbhEHDCB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 May 2021 23:02:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 690506113E
        for <platform-driver-x86@vger.kernel.org>; Sat,  8 May 2021 03:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620442860;
        bh=+nKfea4+FwJY9VOnujao6ZKwg3icvG/VqLFZhpUxFi0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SRGzf+y3XUkXd/RMC0/9LFGSYdRfYlBGfq+EVbG/RBcFOdRzcxvzVTYVlHQZLHdHo
         IUviqOxDLf4QohdY4qoBXdDFnL632rKpZhTTzwc0HOLinbR6gJbApCm8bJyyj6mFge
         tyi6KYM5W7a5ZjyQdXHFB4KsuAQPyyIjBudciy1IIQBgNMWTabj0YgywD+mBe33Xq2
         hgX6f9Yh4HoFjc3DclF6ecKbETQfqBuiorL9646/W7+NYFaN5U4lusf+nwxqhBgIVb
         2+gRB/xw5HwcJJZwDOkxGvmRNZZorVul2d5aVvrNTEdq/WlkTYtkh7xNclrBPsnBnv
         UAhUnOEc4HYzQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5509760F56; Sat,  8 May 2021 03:01:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212985] ideapad_acpi: VPC2004:00: DYTC interface is not
 available. platform_profile interface is unavailable
Date:   Sat, 08 May 2021 03:01:00 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tsweet64@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform-driver-x86@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212985-215701-9Cm7HAjTVF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212985-215701@https.bugzilla.kernel.org/>
References: <bug-212985-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212985

--- Comment #5 from Tim S (tsweet64@protonmail.com) ---
Okay, that makes sense. Thank you so much!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
