Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08EB27DED15
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Nov 2023 08:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjKBHIr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Nov 2023 03:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjKBHIr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 03:08:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F4CDE
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 00:08:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93751C433C9
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 07:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698908924;
        bh=Sx02syrJeuDww6vVHfbqbUI2B+QvjtvJtMfg9dqPbyI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=o9piGo5SA6cPGXuNsrjHRaopp7vL8aEuEWOXhzHO1XTHFoJ+MaRGMPAfQUlhCc+0e
         gouSKzT64buDwIM9mju3XoC7RuUDzvOmK+R/BznEsW5NhVzSY0Bc5cSNljg+8psvOe
         ZZoaEVxsok/xzuejwSfyq+dtArPTBWSMoKftzWTLZB/UzUcRKwFiV4RarR6Dn/IId/
         B6it+tmqiDDRwSkccI9LITjR64R50GpfghhNPJOVLL3qQALG4QQhFvnQ6OLTDU7htq
         vulBd/Xt0jyR+h+0XBz5yWQJ/Z3mx24j5MY6cbv2w7earoGgWODn4Tq2+PseUvs436
         hr994GCDBYxJA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 713B4C4332E; Thu,  2 Nov 2023 07:08:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 07:08:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ertugruluyar.personal@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-veSELIGL0s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #22 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Ertugrul Uyar from comment #19)
> (In reply to Mario Limonciello (AMD) from comment #18)
> > If you do a git checkout then it would be 'git am foo.patch'.
> > If you download a tarball it would be 'patch -p1 < foo.patch'.
>=20
> I quess, I am gonna extract tarball then open it and open terminal on it.
> Then I use 'patch -p1 < foo.patch' command. Am I right?

This is the result:
~/Desktop/linux-6.6$ patch -p1 <
/home/ertugruluyar/Desktop/0001-platform-x86-amd-pmc-Add-ThinkBook-15-G2-AR=
E-to-NVME.patch=20
patching file drivers/platform/x86/amd/pmc/pmc-quirks.c

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
