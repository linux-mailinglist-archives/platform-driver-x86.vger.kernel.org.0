Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB34342C86
	for <lists+platform-driver-x86@lfdr.de>; Sat, 20 Mar 2021 12:54:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230080AbhCTLxz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 20 Mar 2021 07:53:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:34488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230114AbhCTLxn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 20 Mar 2021 07:53:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D94C8619AA
        for <platform-driver-x86@vger.kernel.org>; Sat, 20 Mar 2021 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616228165;
        bh=CnfCt6wM7SvbfvX6ELwYqeITUukMMtG264zhW3PSxZo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uC6bgG5my9KLg3TixCGAhWbubhofUCAx1GIkgGW+PlhOwtYDdkX8Rap0iAXlqIBMJ
         6oKsjppBadsmkeFR5F4XA2Al3dA+0QbgpygMuokLH7d/MgZkafqcnuzGNDJRSkfG5Y
         1Fevb2lWBxczgwWt5SZGGcPfF3tnOKz/UKQrxVnhrf7eU6+2AbP3bSfAF9didraXfm
         Q5G332ZPPhTuGXF9Yx+Z7/CAHGkoKrPLDeryraFovltkYQjLueiW+zYD1mQpeLEu1j
         q+fjfGLWxp0wCxvdkktCNAR8aPkJX1Q9p1xdr3at3EJKLotES1P8WaENMwag5dkMF0
         pxPoU0prHCCMw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D471362A60; Sat, 20 Mar 2021 08:16:05 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Sat, 20 Mar 2021 08:16:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mjg59-kernel@srcf.ucam.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-iY9g5Qzjrt@https.bugzilla.kernel.org/>
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

--- Comment #41 from Matthew Garrett (mjg59-kernel@srcf.ucam.org) ---
Interesting, it looks like it uses the same GUID but has a different set of
methods. So yes, this driver probably won't work for a bunch of the boards =
here
- it would need to be adapted to add support for the methods that these ones
provide.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
