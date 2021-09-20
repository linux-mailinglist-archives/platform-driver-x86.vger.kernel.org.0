Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C6EB4115E3
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Sep 2021 15:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhITNfZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Sep 2021 09:35:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236876AbhITNfZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Sep 2021 09:35:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 38E8C60F12
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Sep 2021 13:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632144838;
        bh=gg+scJIlzktOCA0Zj6G+k/OI3ZzxPnBKjTp6Ubcn6sU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Q6UZurlm+T5xwR2jwVUCX67TtRLwMazcVBikCJCqk5pGQv9Kyj/QPFainQln2l+SS
         voR8hYK+ou2AVBsVS0ACZsX03qR/KLirZUn1RKWCdFtV+aFNDfuTvdjVf78846YUku
         fYLDPBELADPfD9CoWc6lswFqZ78D7/ByBcebrxCs4U1Zi4EZQ3QvBSz8HF7jDoHm2T
         c6z674uK72+89l/KQI6E8znSgvryDFN+WEhsBXQ0X0Rdr/39xLtHIedM2WBVzobgYT
         u0feUBcyzPDtzliansSLmE+YD5ZNFanwozQgEFfO5QFUC8jEAgNfahDl1iKloCm2yc
         Gw2ETNAHRlGsQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 3578460F50; Mon, 20 Sep 2021 13:33:58 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Mon, 20 Sep 2021 13:33:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: igor@svelig.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-Y1g4NQ5xFG@https.bugzilla.kernel.org/>
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

--- Comment #126 from Igor (igor@svelig.com) ---
(In reply to Denis Pauk from comment #125)
> Created attachment 298887 [details]
> Add support for access via Asus WMI to nct6775 (2021.09.20)
>=20
> Updated patch with support:

Could you please add my motherboard as well?

cat /sys/class/dmi/id/board_name
ROG STRIX B550-I GAMING

I mention it in the comment 104 above.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
