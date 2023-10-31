Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA087DD6EE
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Oct 2023 21:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjJaUN2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Oct 2023 16:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjJaUN2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 16:13:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EF43F3
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 13:13:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E24B0C433C8
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 20:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698783205;
        bh=Wb2xniNFp4xxXhs4ljd5pZ89qgXV91mKMT1bTK+zRmc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G1j2gNN2HJtCtcz3MCoIrcTn6WGw7j4spcGmuJsJolloLEsn+2oZYe0BfS+FW2gHW
         eDSJMbhEHl+f4/X2jT76pZcRkeaGcBsfGonpnep5I4j8spuRLhu98N86YnCmIx6utS
         LqI7Yn04rMLf+ndpTc/sp4zQpaXZoOyi9E8i3/mFRnewB6FFlsv7+Inqea7ZhAnrF7
         7EGSXzlbgPC6P+YVrHIf3saUEmP+lDM0w163PGthRUAXCo6yqDTzqhWFkd3eVNhpWY
         IWcuW6RC1OtEI4oJpj8t/zhGpFXdicI2/HKY62kZYnzsHFbTRmLf2T1qiR4S8sjj/W
         eav3FYQLHm6cQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D031AC4332E; Tue, 31 Oct 2023 20:13:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 20:13:25 +0000
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
Message-ID: <bug-218092-215701-AoQrk1Bokv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #11 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #10)
> We can try doing that same quirk as the other bug with the Lenovo Mendoci=
no
> laptops to see if it helps.
>=20
> But it needs testing for us to merge it.
> If I got you a patch could you handle building a kernel for it?

Thank you.
If it's easy, I'll try to do it with the instructions, but if it's risky
because I'm going to start writing a thesis and I only have a laptop, I can=
't
do it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
