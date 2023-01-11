Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6871F66636A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Jan 2023 20:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbjAKTSY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 11 Jan 2023 14:18:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbjAKTSU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 11 Jan 2023 14:18:20 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB62BCCD
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 11:18:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B0F08B81C9B
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 19:18:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 652F5C433D2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jan 2023 19:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673464697;
        bh=7tDKXd6V/lwFjfQyZgVGsmE2QRWV889Zg1rSXKX4iAg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=n+6KVKx85ysTmWiLnJ/tzZxQjIBeDeuZ/Ka7KYqBtaCUldv7eu5NvmK2XMGIl9aRx
         V6rs0ShhdR/HM/gzL+nufiKVKgBfrodKZsBDS41hDRES/r4evRpluGj7pSiojxDnBa
         0sWpYZuxrUGqELtQWdbH3SnIZ6rfKDS/+pzogznjR5EAPTWi/Gu2gae+tByHT+8cqV
         d0UX+N20W5dlazDTqat/2rQQUXygXXXbgbsrbww/M7xSLRwUZHr85LgMosErF0k5yL
         fp3zYEJnuRUnsw+WVlN64MEgMAiRTjWoC7MAJVOnQB7yJNax7MsTGQ+bPrn+798ukN
         rjac/iEVvx18A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 43249C43141; Wed, 11 Jan 2023 19:18:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date:   Wed, 11 Jan 2023 19:18:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216917-215701-VhAhVRG8a5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-215701@https.bugzilla.kernel.org/>
References: <bug-216917-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #2 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
If it's between 6fc4c0cd9 and v6.0.18 a bisect would be best, but my first
educated guess would be:

306df163069e ("drm/amdgpu: make display pinning more flexible (v2)")

If you revert that does it start working again?

It's peculiar that 6.1.4 is fine, that fix is also in 6.1.4 but we might ne=
ed
something else.

> (i just can't use it productively because of
> https://gitlab.freedesktop.org/drm/amd/-/issues/2171 )

Yeah; hopefully that's fixed soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
