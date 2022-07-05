Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 723AA5675E0
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 Jul 2022 19:38:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbiGERiE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 Jul 2022 13:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbiGERh6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Jul 2022 13:37:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73CF52018E
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 10:37:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1B8DD617C9
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 17:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DA16C341C7
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 17:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657042677;
        bh=/IfF/ajiL06Z29io3wnrYqRIX7heD+xZ9i3ff6Xs5U0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lRH5WBTBeyMX/iIdb47d6CfLRjDpwQ/BW0E+dxFXljvaJVNTWozRiuVSql2/IuSMy
         e9izyv6xhFfooEEEIr18NeihpWWMZO2s4guPGYEL/iYZyD91dQm3fuADY8cuiKmtrL
         h+MsV9bOnVD4bUXMGmvzxVdkXT/wPQ33M0vRv9zlpQaDr36iS+SaSlKdyyTdRePkqc
         LOz8iTs0RqNQYVXZA2FKoNwkmSxtW96fpqRoGo+RzLMIpxHFYpxvAlTiEPtpkjVbU5
         m9CyLdW2efHzSbjPWeiitrzSCvZqz1cAG/DnueffzXPBkZ7bRZwO29Y85FlW3ZmwLA
         7bSutmHjvnRbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6430BC05FD6; Tue,  5 Jul 2022 17:37:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Tue, 05 Jul 2022 17:37:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215993-215701-9guEW3Cztv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215993-215701@https.bugzilla.kernel.org/>
References: <bug-215993-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215993

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com

--- Comment #2 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Guys, would you be able to test the latest vanilla (v5.19-rc5)? Just to be =
sure
that the bug can be reproduced.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
