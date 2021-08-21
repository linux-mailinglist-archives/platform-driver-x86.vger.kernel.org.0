Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B42043F3B93
	for <lists+platform-driver-x86@lfdr.de>; Sat, 21 Aug 2021 19:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhHURIt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 21 Aug 2021 13:08:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:40862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229600AbhHURIt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Aug 2021 13:08:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E07F86124C
        for <platform-driver-x86@vger.kernel.org>; Sat, 21 Aug 2021 17:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629565689;
        bh=Lb46EGjEeMx/1ojPUlH+cO29WM8rLQsWkwaumMpFcf4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lcdTfuvxBtiMMnlG3SE4r3p8E8XV3HKcTy/cqvm1RL4xv+S7g1tpVrCiYCV8k8vxj
         csS4aItZWivsz17D2MkZnpjHX7zcDigX3s3Abz06kDIlaDCYXAZ9371DcGBJFqpD9x
         mGGaZ+AjPLjGOv8+mrLjQdYJhkENmXTes2sqy5PfMGjVMCtucFCjXdjVE8yc2CSV5A
         EkOnakt/ErEJAQQexWpycwLdsh6nlY7F/JX61+wyIaAugQ7aTH/4BODdt8h3K7t7hv
         GqEKlDnGtCwr1VvLXMyIJEc8n1QvBikClpYAvqtCGPDEGkrq2PtHiBaGInXV8xdrid
         CQpYdXuljjVjw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id DC33560F54; Sat, 21 Aug 2021 17:08:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 21 Aug 2021 17:08:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-204807-215701-BW9Q7XvMFH@https.bugzilla.kernel.org/>
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

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|torvalds@linux-foundation.o |
                   |rg                          |

--- Comment #82 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to danglingpointerexception@gmail.com from comment #81)
> Hi All, I've got the same issue with a ASUS ROG STRIX X570-E Gaming.
>=20
> We need this patch merged!  Can anyone with influence or clout help push
> this along so we can get this resolved?
>=20
> There must be hundreds of thousands affected by this!

The best what you can do is to go to the mailing list and discuss it there =
with
a respective maintainer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
