Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1738975B970
	for <lists+platform-driver-x86@lfdr.de>; Thu, 20 Jul 2023 23:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjGTVQu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 20 Jul 2023 17:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjGTVQu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jul 2023 17:16:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E0B2D46
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jul 2023 14:16:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A33FB61C7B
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jul 2023 21:16:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1657AC433C9
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jul 2023 21:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689887804;
        bh=f/xD1M5wILXqAkCLw8fHxh889mK4966mp5UufdaW1dw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N2aQxJm9TezrV2IF8/8KSqt9MO80tq7KU4G9qytZuZA875zfiEhI45QVHBSSJH6dq
         FE3MnAv066f3bqLaoLeA086qHhpmb7BH5rQgarAkZUEat6vYB5GCkWCCTmRCT/P8i/
         c+ZCe7IYjGd8EjwaXIhIflvMNRtRD9fix8zOgxl8xd6pe8tpOl5RfdbhOfOy7gWPoA
         NX8iYvWdI8p1dpBs78qNHwFLknC4qlMcLWgDc6YdRWda7SWF6hp84UdzxOxSP+GNZL
         iABVYfOG/Ym46dHZ7Vjcrh90oBXXHUjAdpdKAc8Ba7NWqteDQFzmS2YIIOzc6BZsbF
         eZVHL9uCTknXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EFA6FC53BCD; Thu, 20 Jul 2023 21:16:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216176] ideapad-laptop doesn't expose rapid charge
Date:   Thu, 20 Jul 2023 21:16:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sid.swapnildevesh@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216176-215701-cKWmVwpRDI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216176-215701@https.bugzilla.kernel.org/>
References: <bug-216176-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216176

Swapnil Devesh (sid.swapnildevesh@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sid.swapnildevesh@gmail.com

--- Comment #9 from Swapnil Devesh (sid.swapnildevesh@gmail.com) ---
Is there any progress on this ? I think exposing rapid change in ideapad-la=
ptop
makes sense similar to conservation_mode until a better api is implemented.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
