Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B757DF7A4
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Nov 2023 17:29:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235516AbjKBQ3L (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Nov 2023 12:29:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235482AbjKBQ3L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 12:29:11 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D417F123
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 09:29:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6981BC433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 16:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698942548;
        bh=pQO8D5RHCULy/La6MHVymb1NG/rLVYBEEKzX57EfYmc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rrSYLn6aAEJjZbhbUJrjddFgvBHOZz4PWvR0Zc8HSqDbwHxC5DgdowZmZ613ZbPQC
         SwDDjUZzb/y+aLRx+2A+sTItlpVC4SRYq58IyU+LcgLjew/bxjRDSbEBm2ArisYrzs
         392qF81nbRKe4xti7nda1BViBsaVhEc/EvqQXzHd+u82WE9kTjxtmz/Oez17Md3l24
         ZqfhBj28me16zC/9RyhPmWvG0dO5QHf5kEDV2PpQLIsyPLEjN30VwAORfhVXqp4Wek
         5V8GnzdMLKPdZXpLEiTxAuNsrhdOV3K/6BN9nsksGVBehFzQUNsJx4/zuB1s/sbRdG
         6BD/IHRTIcolg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4E91DC4332E; Thu,  2 Nov 2023 16:29:08 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 16:29:08 +0000
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
Message-ID: <bug-218092-215701-K6sfdoVo09@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #38 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #37)
> Can you share your kernel config to the bug?  Maybe one of us can figure =
out
> what needs to be torn out for it to be able to build.

Okey, thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
