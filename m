Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD78B4B47A8
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Feb 2022 10:55:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243027AbiBNJwR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Feb 2022 04:52:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343651AbiBNJuz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Feb 2022 04:50:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52CB657BC
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 01:41:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 34F49611DD
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 09:41:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 994B2C340F5
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Feb 2022 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644831713;
        bh=YuBYtyd7np8uevpp5gS9+Qgcxg4GYQSAsDw89IsRrIE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=AdqvSBbaJekWZGyDrywL/K3KHnO9LFkgfipoZDOl4FAn/9UrjcPIOhAUzGOBEpt3z
         nB8+gCfLY/cbF6hGlLN3PWd0O3enkGdwqbbwPnhjFWPbobhTwiSw9TdwkBIgd/hMj6
         Ii13A/SwUk86jyLb67XAQKI68TqUiO06UOGxoc3D4yB3OLySXE12boC0H4y9cITGwU
         AwJqgjwWufos0R9UbKrkD7TuZ6bB0m6sZM74j/wfVvlbVaWDf0+J8Uw7uhEQNdOiRA
         9N0sDyKH6WxGkXl3zP+BCOgOYSctOmgpO4AYoy6x8j1DcVO1cnlk4I6JOWF3KEZ+Dq
         DalbawcoteEgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 84F05C05FE2; Mon, 14 Feb 2022 09:41:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215531] Lenovo charge limit feature stops 1% short of the
 configured limit and says it's still charging
Date:   Mon, 14 Feb 2022 09:41:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-215531-215701-enHsJIPdRI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215531-215701@https.bugzilla.kernel.org/>
References: <bug-215531-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215531

Hans de Goede (jwrdegoede@fedoraproject.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |jwrdegoede@fedoraproject.or
                   |                            |g
         Resolution|---                         |CODE_FIX

--- Comment #1 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
This has been fixed in kernels >=3D 5.16.3 with this commit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3De96c1197aca628f7d2480a1cc3214912b40b3414

With these kernels:

cat /sys/class/power_supply/BAT0/status

Will now output "not charging" under these conditions. This is what the
device's firmware gives us, so this is the best the kernel can do. Translat=
ing
"not charging" + the capacity in % being more or less equal to the
charge_control_end_threshold(1) value to "full" is something for userspace
(upower) to sort out. Since we are looking on adding UI options to set
charge_control_end_threshold, it would be good if we can get upower reporti=
ng
"full" under these conditions.

Note the upower issue should be re-opened to track this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
