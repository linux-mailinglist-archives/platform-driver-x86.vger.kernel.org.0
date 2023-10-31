Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4EA77DCD82
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Oct 2023 14:05:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344424AbjJaNCY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Oct 2023 09:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344382AbjJaNCY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 09:02:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98317DA
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 06:02:21 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E59EC433D9
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698757341;
        bh=LKxfiZqHtLK4jiNyl6kd7qtrBZ8dmXdon2uYcAftrP4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dvUS4mHSpe1n5607Dv2v0iAfbQVJ6qawuhLawPhoqF0A/pigZ5Dt2L7m4hlIwyj1o
         zeVkM/5JCpMMkJdDV+o+5bxhKzkBLYu7ES8+0jXnGFGhgZaC3G97dpaU3WXQYHnqq9
         Ag+Yw/J0Qp+1grnTfGndd1lEj7mjWd2xcHMtlcmowaiBRJfs+ArPJeHjS7IRILGxy9
         y+Lix2NP3JRa7lWsMXHGC5jyikvwI1OjcWIv0ztgVlR7wd2d42m7LwAjjh8oqxVeNq
         /D3ttuA4WuRrjwpaorQSJyc112qfUTven1qNQXQiK/3a3xPbN00vPfrhmxNHPRwguE
         O7FpUp0rQveUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2D3FBC4332E; Tue, 31 Oct 2023 13:02:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 13:02:20 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to product
Message-ID: <bug-218092-215701-mL1lVxYj1g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|x86-64                      |Platform_x86
           Assignee|platform_x86_64@kernel-bugs |drivers_platform_x86@kernel
                   |.osdl.org                   |-bugs.osdl.org
            Product|Platform Specific/Hardware  |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
