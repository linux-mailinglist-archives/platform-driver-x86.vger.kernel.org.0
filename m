Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6FF3DABED
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Jul 2021 21:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbhG2Thx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 29 Jul 2021 15:37:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:36766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229606AbhG2Thx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Jul 2021 15:37:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8793860F4A
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Jul 2021 19:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627587469;
        bh=fi14g9DUI1tp7zlgmNa6RMQe1kANilp0WyuslSbLBSg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mxdVCr5Ge8IUyaboRlvkRPhkjIF21id4v9bHAJ7yMYwGBE31RmrDSHGWMNM5cgzuC
         /MqyZ1MOZFlZ7Sqkn1STNTh/DdUkZhfOyMWwT2hkPxgqOpIG/DrcnJwX7/UynnqeQp
         XQYqZPIZu/NYonP+DUT2z2Tddd0lijelVq+0XEPZ57kJCLp/QKIjhd2A/NDPo0KL0A
         GXYwSzFLmmY8Teo1qvgq3U49gW1nch33Pn/YnA7YOA5k+W//2/uJGtO+WxwxYEPcbF
         QsAOnjJ92bIwNLUSp9BUZ1Q0HBWVJupnvifJWP3+GT9vactCj1QRkDQcd6U4DLRkIh
         u3yM3l4fPZceg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8489D60EE2; Thu, 29 Jul 2021 19:37:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 29 Jul 2021 19:37:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204807-215701-cicyMMxxsb@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|CLOSED                      |REOPENED
         Resolution|INVALID                     |---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
