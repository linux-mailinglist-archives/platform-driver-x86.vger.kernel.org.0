Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA4BE3B7AB8
	for <lists+platform-driver-x86@lfdr.de>; Wed, 30 Jun 2021 01:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235236AbhF2XlX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 29 Jun 2021 19:41:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:58978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235171AbhF2XlQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Jun 2021 19:41:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A398661D68
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Jun 2021 23:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625009928;
        bh=0ADBFE7jSRXf4JNXRHuWgR5AFHZC6T+Xm8pLmZW9qfA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UBxQ1c6vRbbsMGRCbtaWs5I6rbm/EVAmp/M8wk+rhTMbqjipGknJCr1I0B/d9YE9Q
         0hJJpSdffVU429QnQBvdYulqr1se0x1O4r36LgmJIyX7wg198diKqi3EeJGPE0ykjw
         bUonw3lOHQQfz4oGuZUt3/hRQpmQzDNPkTvOcDEZaqpY+WlHm6rXh8CQI+Pr9KnpJR
         yD+kvASdzhWCEiJhmkXsWw/dWNu//7X3YFmXf64tu34m3TrRVFsV7VQbBAnM9QOsp/
         gevdl0lq0j6qAmv2zW3SbeZy5tVccVgUqHVSyBuv8pcODmcBdV4zAZAHK+ueOplqck
         kMkfbFR23BoFQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 979F3612A5; Tue, 29 Jun 2021 23:38:48 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 213579] Clevo NH55HJ (intel tigerlake) touchpad support (GPIO
 can't be used as IRQ)
Date:   Tue, 29 Jun 2021 23:38:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmitry.torokhov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-213579-215701-DM3QVqMNsu@https.bugzilla.kernel.org/>
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

Dmitry Torokhov (dmitry.torokhov@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dmitry.torokhov@gmail.com
          Component|Input Devices               |Platform_x86
           Assignee|drivers_input-devices@kerne |drivers_platform_x86@kernel
                   |l-bugs.osdl.org             |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
