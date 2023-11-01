Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6BF7DE5C3
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 Nov 2023 19:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344802AbjKASDE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 1 Nov 2023 14:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344881AbjKASDC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Nov 2023 14:03:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96335131
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 11:02:47 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D3C0C433C8
        for <platform-driver-x86@vger.kernel.org>; Wed,  1 Nov 2023 18:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698861767;
        bh=20cvvZEkQMYVJcT0F88gKh9W1sbmVoXwRo3C5lbNsjQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NN9pReu00DzhO0YbmzZZZu3ue+KrbMiXK69OnDlBEJkj6e6xnEhmKbBQ/c2tj4spx
         Ck+AQTAyr4d9cDomjoeMNdvo4UCHHjtqJ11jNKZyxN20X85gDFoI3ZM7T0juqB5aIr
         HtYm/g/FZKzPG5SRvebZGoEwg36sV6tLMGBKrsGs88wb7aHmYJGHANg6bslt5hHzFX
         2WArkDnPmbnQxW3U2eTWWqZfRTz7j5P8FYA5C87ePOFyhmEYyiBGt+zQQPVM3JUPmo
         8CKQy/BYpcHHHcySWEhjFdXNHiV2BaXmj0/WOOZAOeOdZeb3h04oRDXBTx/lqkYWQz
         jNqIzgQB85wPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2D0B7C53BC6; Wed,  1 Nov 2023 18:02:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Wed, 01 Nov 2023 18:02:47 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218092-215701-vzhqxL0wYA@https.bugzilla.kernel.org/>
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

--- Comment #18 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
If you do a git checkout then it would be 'git am foo.patch'.
If you download a tarball it would be 'patch -p1 < foo.patch'.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
