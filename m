Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B1197D7F2E
	for <lists+platform-driver-x86@lfdr.de>; Thu, 26 Oct 2023 10:59:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjJZI7E (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 26 Oct 2023 04:59:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjJZI7D (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Oct 2023 04:59:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33AC910E
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Oct 2023 01:59:02 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9022C433C8
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Oct 2023 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698310741;
        bh=wNCKrGof692UFEo2qMK2SWVKzb8t5Nb1/IN8zVhF/NQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lu19SIiS/3zrjpNGUjTlsho/g3oYTX1ncz6GsERD93ygFF7/Wz/f0qTbCeksqoOB3
         dk5xoXoKq33fUjB/YrFrSsXON4prsEL3N/eXZVGptluUvI+HFmGikdTi337xRz7MEi
         3PGxCgvFE2VqJC8CDLTTkHw9fEoABlMf/RVbnwZXqjxdwLcjBBPCRkFSlwJr0aI5jZ
         ShJTlYKFWvvlNC1LuT2Gp8iIf1RvBePikzJCBQRWdyWZ/QwjVj5dR0WinHIFmEeTwQ
         ktRhIhE4uPaFSkAJBoxgypLI8IUEXT69tkMCvkA+VBYvUziV65PJBkzrAhTITwMPqg
         c0S3ktaEYY5VA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8DB43C4332E; Thu, 26 Oct 2023 08:59:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 217947] WARNING at drivers/acpi/platform_profile.c:74 in
 platform_profile_show()
Date:   Thu, 26 Oct 2023 08:59:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jirislaby@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217947-215701-Q3r3XtQxPQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217947-215701@https.bugzilla.kernel.org/>
References: <bug-217947-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217947

--- Comment #9 from Jiri Slaby (jirislaby@gmail.com) ---
Gentle ping: any updates on this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
