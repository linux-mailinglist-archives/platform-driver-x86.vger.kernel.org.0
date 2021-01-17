Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D49D2F92DB
	for <lists+platform-driver-x86@lfdr.de>; Sun, 17 Jan 2021 15:24:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbhAQOYU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 17 Jan 2021 09:24:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:35396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729131AbhAQOYU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jan 2021 09:24:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A13AE208DB
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jan 2021 14:23:39 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9D84683C0D; Sun, 17 Jan 2021 14:23:39 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Sun, 17 Jan 2021 14:23:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-MX3yA4u2vt@https.bugzilla.kernel.org/>
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

--- Comment #34 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Richard Neumann from comment #33)
> They are all recognized

That does not mean anything since the HID descriptors are provided by the
amd_fsh driver itself, so of course they describe a valid gyroscope and
magnetometer.

> Testing the other sensors is non-trivial.

Testing the ALS sensor actually should be easy, I assume that you have
iio-sensor-proxy installed (that is what is typically used to do accelerometer
based auto-display-rotation) ? Then you can just run monitor-sensor and it will
print the ALS readings and then moving the laptop from a dark environment (say
inside in a room with the blinds closed) to a light environment (say outside)
should lead to significant different readings, with the outside readings being
significantly higher.

As you indicate there are not really any userspace consumers of the gyroscope
and 
magnetometer so testing those might be harder, although I think that
monitor-sensor probably also prints magnetometer readings. And that should
behave as a compass so if you stand upright, holding the laptop and then spin
around the axis from your head to your feet, then those should change.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
