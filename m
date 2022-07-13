Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D492573564
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jul 2022 13:29:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236128AbiGML3B (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jul 2022 07:29:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236085AbiGML24 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jul 2022 07:28:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7509FE06
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 04:28:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 533E5B81DF0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 11:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 12CF2C341C6
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Jul 2022 11:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657711731;
        bh=4xUOpuFhz9zJDcJuXyGmEJpsdSPXanZrIeFy0c+TYeg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ih44/PCZcsbf/RgY6t5prZFVqwKdsv4cAej9d5LVxKtbcH/pvj9XfA/G56HXT7Hng
         jovGtJ7d7BRcie1w/76odsfr/vTy7osVkDcVPg2dx6jDpr0QjzuJKhfPCSXHbnoiWl
         A2Q0IBThxtkWUea7PTaFZ/bc2wpqLK+Zp0//faoL1CkPgr8K1aAhWofI2O12x2HYZH
         vVhWeW4KoiG5126NI6VjLhKBmaoCyJ+2sSsFt2IT/3HCr0JTq/cTrEXSXxbHudpHWr
         sJvx4n+jnSgCFMiOPlgOnJLt0QOlHrn/kp2Q8nD8rWQkywZ5Byw/FZWfw1hVbcM+J5
         XvIgDl6a6fjqA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id E3700C05FD6; Wed, 13 Jul 2022 11:28:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215075] BUG: scheduling while atomic: cpuhp/1/21/0x00000002
 when going out of sleep S3 state
Date:   Wed, 13 Jul 2022 11:28:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Process Management
X-Bugzilla-Component: Scheduler
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215075-215701-9P2CYiQoAu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215075-215701@https.bugzilla.kernel.org/>
References: <bug-215075-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215075

--- Comment #3 from Lahfa Samy (samy@lahfa.xyz) ---
So you recommmend me to ask for a warranty covered repair, my laptop is sti=
ll
under warranty for any hardware issue/default

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
