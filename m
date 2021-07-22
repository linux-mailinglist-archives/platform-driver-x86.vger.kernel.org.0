Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFD53D2B20
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 Jul 2021 19:27:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbhGVQrK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 22 Jul 2021 12:47:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:53732 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229992AbhGVQrK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Jul 2021 12:47:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D28D46135A
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jul 2021 17:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626974864;
        bh=RjvvonioXSUaPeGfIVOOdbmqGH4v+gzjfS9cBA+BedM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Xdx2+z8ZQkRijgLsj3AF0SmHi5QKKVJsZHzo16rnxcvAUPz28zl3wEdmDXpuiv61s
         c0LE7CwifKMJeYNuEKc3Fhq8ftK2w+W8hKe9Kuo1MlRrswdgB8AK8ZgLTStJdt3WR6
         rkh18knV4bqj9/aj2CKPRtLyQdDhCcljMWDhdYvFjDgPN6AffT7AG2isU7faQZV6uD
         NtjZWwjN8j3RInhWhlhelZiA1vv8Qr+NcowAKnToX8D9vuouSUTKKt7mlEiDfX+AFP
         VkkmRV+BlCODAueK7xt0iofLGCN6nxDOBXor0K+nYMp72J8wSZwWdVMHScoJoQhDfp
         YSZRbwL7c7oyw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C06B861283; Thu, 22 Jul 2021 17:27:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Thu, 22 Jul 2021 17:27:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213579-215701-Uh2kciyhSN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213579-215701@https.bugzilla.kernel.org/>
References: <bug-213579-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213579

--- Comment #40 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
(In reply to Riccardo Mori from comment #39)

> I see you are using an archlinux based distro so you might find useful th=
is
> repo I just created to build linux with this hack:
> https://github.com/patacca/linux-tigerlake-hack


Cool! One side note: https://stackoverflow.com/q/27899104/2511795

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
