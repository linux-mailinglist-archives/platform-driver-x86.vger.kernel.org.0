Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E94FE699223
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Feb 2023 11:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229597AbjBPKs0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Feb 2023 05:48:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjBPKsZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Feb 2023 05:48:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A9704C6FC
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 02:48:07 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5EF5761FA1
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 10:47:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7A17C4339E
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Feb 2023 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676544477;
        bh=wrdy9McsGN7L4LQlTOG7hGLerXFLrQRW0/w/o6n0264=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=akWBgtEF2lkBXrMFLZXY3njzX4bTf1Fb6ApNKD5P2uLwFrOICd3JlyGT0hqFdkR4X
         biMGYSO7o1GmZDS4bDVboC4w9J1/qLEXU6gVSCw4WLH/bOhsR4jMNm1DAP9d4nQfhB
         cOClHpYuMB9KzaBtfuMRJ7XR+aPw9CRzdzSHwKs3DQqPNMG+KpHwedowvF+PRBgfkA
         +ER5h+bVyJEBS72LVgqvP0Kt9tFUpm4sGfNrNT9/WK9l9eLQFWRlviDo6gMPgRz2uX
         PXHLttLdn2Qh3u40WSx+lYK/yKOIJ8QOF1MwnhjDYSiCafN/OsKaK8DwDBpCy7wSEI
         FcuOzBVI5ZYlg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B7BBBC43143; Thu, 16 Feb 2023 10:47:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 16 Feb 2023 10:47:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jeroen@beerstra.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204807-215701-yCdBd1Xh3J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #294 from Jeroen Beerstra (jeroen@beerstra.org) ---
For me, on 6.1 ML via elrepo. I needed to apply patch and modprobe nct6775.
Lmsensors did not detect my sensors. Other than that it just works :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
