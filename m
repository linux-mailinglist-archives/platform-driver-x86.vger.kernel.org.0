Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C414D2FCE97
	for <lists+platform-driver-x86@lfdr.de>; Wed, 20 Jan 2021 12:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729101AbhATKpZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 20 Jan 2021 05:45:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:39374 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731208AbhATJZd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Jan 2021 04:25:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D82F52333F
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Jan 2021 09:24:52 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D206A815EB; Wed, 20 Jan 2021 09:24:52 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Wed, 20 Jan 2021 09:24:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla@hadess.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-U2hlfQeMlR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=199715

--- Comment #49 from Bastien Nocera (bugzilla@hadess.net) ---
You might want to use "iio_generic_buffer -A -N 0" for testing instead.

This makes sure that all the triggers are enabled, so that there's hopefully
some data coming out of the devices. Substitute the "0" with the IIO device
number, the command live in kernel-tools in Fedora.

If you get all zeroes out of the light sensor, it might also be the same
problem I've recently reported to the IIO list, which would point to a problem
in the common IIO code, rather than a problem with the light sensor in the
hid-sensor-hub code.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
