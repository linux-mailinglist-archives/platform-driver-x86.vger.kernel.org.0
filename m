Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5C7C7DF9DA
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Nov 2023 19:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbjKBSXd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Nov 2023 14:23:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjKBSXd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 14:23:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF19B9
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 11:23:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FF55C433C8
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 18:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698949409;
        bh=YAwf/6EMr00WjmMEDhYbePuQpZIv35OzhLw9NUzB/jE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=iDB3qHeLDWdosQDTCWthNfdg5ZHsg1V8Gj6QnOHjWGHv6vfwnaHe3JOHZGih2Maln
         9gwA2qQPlM95TWFebxLfT4VgL6TldBL6FMenqP2/Rz68Ggwzpxc9du7vF9CPtRIpGS
         9VCO1hA/9/tqwFBZZj799IofWr0NdKu57hwUieVHfPO4DUsaOg/fHFyru7X4TXZGZb
         kFT/JGYao2odIzgNFFW2wuWifNFzjFfz7Cp3hlVz+LHqiJ1vIBjI+P830Ldyt9Zk4U
         Y/aP39LAzBEYoNJ2VAn1AiHJ/YoIjXB2TsQ+09dEQYGPCEJ7yIY4Jb1f+NKHF6gUc3
         80MrN5CFpXepg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 82562C4332E; Thu,  2 Nov 2023 18:23:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218024] broken suspend to idle on Lenovo V15 G4 AMN (and
 related laptops)
Date:   Thu, 02 Nov 2023 18:23:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dlazar@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218024-215701-MwQSCTPxaF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218024-215701@https.bugzilla.kernel.org/>
References: <bug-218024-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218024

--- Comment #16 from David Lazar (dlazar@gmail.com) ---
The fixes also landed in 6.1.61, for distros that follow that older branch.

And, as a note of caution, make sure the module containing this code is loa=
ded,
otherwise you'll still see those page faults.  Ask me how I know...

For the 6.5+ kernels, the module is called 'amd-pmc', while in 6.1 this code
still lived in 'thinpad_acpi'.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
