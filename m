Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 349977DD640
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Oct 2023 19:45:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbjJaSpK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Oct 2023 14:45:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233401AbjJaSpJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 14:45:09 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99924ED
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 11:45:07 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4242BC433C9
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 18:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698777907;
        bh=kI6+ccqvxlAV6jZzFoVPx0gGErxLtrHowmvUqRRFr2w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=B8jQQjhwR6FoV4nVlU95aB9X4DI7zdeFW8fxEojtwiVhQ3FpH91bnU8lUCqbr0LdX
         q6FmvlGwa1Tw8NXso1cfY9oZqMCNJgkoMj3V3KGxSMv8LoawXISDgPeiU8XesWOl1G
         RqVpZDtB9tfXP5x8m4dMDJM01OlEMBLSiN+a+LBuspRKn4IUXBKTGOEGak3EiTH1Zr
         aYbRuIq9bHKVyIJ5R1ukjxFcf+RCN0kQyEdRzHze1/jkIwKjm0F74045LTDdYQ/lKy
         nNRkGZlCry8JrOuTa+xuFQLnKIbqW7TJQO4yRm3sGMRDs2zwkLHUOK6mGdto4hC577
         auZtJxNnr41Zg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 244CCC4332E; Tue, 31 Oct 2023 18:45:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 18:45:07 +0000
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
Message-ID: <bug-218092-215701-uuooWM67VS@https.bugzilla.kernel.org/>
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

--- Comment #9 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
I am sorry for the extra comments, this is the first time for me to use this
platform.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
