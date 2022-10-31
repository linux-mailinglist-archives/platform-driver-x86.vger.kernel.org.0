Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07FF86136A4
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Oct 2022 13:42:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbiJaMma (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Oct 2022 08:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231195AbiJaMm2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Oct 2022 08:42:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98255F588
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Oct 2022 05:42:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1E8C1611F6
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Oct 2022 12:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E282C433D6
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Oct 2022 12:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667220146;
        bh=/Gy+UeDV5Qs6YLau5a4xJVhk8C6BHh591sXZyjzXh2A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=h/LShYtzkf07RYX2m2WNF5AosGqZjOnS6dNijq0vnAKmssoRh6WuO9t7Tw+KADLZk
         U2K1ceZWbHDGuzefYIZDDww+sEBYOU377cl9HPaXABRewMqxdLjhWnYxGlK95IbafT
         Jldr/nWSAk6VGHTRoHpdgFOxzHJKFEx2gPHALCIiQAFqhpG6yhcnuLC/j/0B1FJcXD
         MhB33rKeEXiX7eKG2XKx3rO+uDTOaJreylq/Lj2DLUzCyJTcP5l6ubHUMjE7A5zqhW
         9nAqb8S4p5XKEZNxJuAtcsTwdDsNjoDrtmHemJVPaOWnKtLL+wNEOvC1IRqC+E1YfW
         BnmLUKrtvEp5w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5C1F1C433E4; Mon, 31 Oct 2022 12:42:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216574] Hybrid System Suspend broken HP EliteBook 845 G8
 (a.k.a. Hybrid Sleep / s2both) (s2idle Notebook)
Date:   Mon, 31 Oct 2022 12:42:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216574-215701-1JVdRjsrlJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216574-215701@https.bugzilla.kernel.org/>
References: <bug-216574-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216574

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Fixed in 6.1-rc3 and also will trickle into stable kernels.
https://github.com/torvalds/linux/commit/85850af4fc47132f3f2f0dd698b90f6790=
6600b4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
