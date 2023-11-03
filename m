Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCEDD7E046A
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Nov 2023 15:10:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234149AbjKCOKV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Nov 2023 10:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjKCOKU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 10:10:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C66E61A8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 07:10:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D102C433C7
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 14:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699020617;
        bh=48JNv0T+JKbzyjQqs8qEJyMXDmcnwH/y1U70rTS3OoA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XYCRzUntJ6x7LesyuWVh0FOxww820DLSxdkEYp+2qi9yUwIlvVfgEDWfqyXD+WCY8
         Ko70u/JbLtijCUozSM+FdLU6oCnefVRFWTNFaOI/9lgYD30hb0uAoWuGKDnN/ijRbw
         UplcTl3acsPpKqDrtRu75uH97c2Vs42+iaeBGVSDmTsD5Kv56HDlf4uH22DAZh96sN
         okNKfeUbocfwyuaw49PTb+TmFSj3dvKU/lANN/VK9dLFB0LghFgSoNmSTXrwHDwM4x
         nwpCFdUbHkFyOCV+CZUfxVto+CFawDDfl0PZtsUUHamXjzrv9RdgJVXS1uTyn7TJKT
         150HP8H3BedhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4A548C53BD0; Fri,  3 Nov 2023 14:10:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 14:10:17 +0000
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
Message-ID: <bug-218092-215701-0OKx97ZPPV@https.bugzilla.kernel.org/>
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

--- Comment #53 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
It's in the BIOS if it's offered for your system. Lenovo calls it sleep mod=
e.
If you have it set it to Windows.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
