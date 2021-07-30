Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E1E3DB308
	for <lists+platform-driver-x86@lfdr.de>; Fri, 30 Jul 2021 07:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237270AbhG3F5W (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 30 Jul 2021 01:57:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:52334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236641AbhG3F5V (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Jul 2021 01:57:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F6DE61058
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Jul 2021 05:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627624637;
        bh=ZBIDXZJxr67NZmPSA6KeFSD8esmrmhBgi7HDvJkDOq8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=YDmIvC48wH4PTfRlCo36A7uEBDwjNaI9LOPjAfbGYFK1Xlq+e0O4HY738FkZkxzLn
         1Fq+4hWcvRihvuSYCNlmWmgo4jYPRv66A6pHTIX6TxVnpDQwMPbqffaFX/sWgDJeUw
         YoeRMCjp64WhF/QgkLkhexWTcMeT1osE4VXcyrKsxLFwURTs+tq3ZGPsxiUAENBzk/
         eSnPAu6R/lthZwd6fpSbOb3hrz7MFdjn0m7fZ+zfaTer68Ol4s/Qw6uFvYnFm7GZAO
         NFA+REnOIxtHxg2TtYPN1ONW59EJd6o2kHrFHRMJmntXWgw3DI5w3clBYT2aHtGYQa
         zfwfQqI7DuCfg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2C6CA60EEA; Fri, 30 Jul 2021 05:57:17 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 30 Jul 2021 05:57:16 +0000
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
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-204807-215701-GLgNnJW5vM@https.bugzilla.kernel.org/>
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
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
