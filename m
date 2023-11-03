Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9947E027A
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Nov 2023 13:05:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233216AbjKCMFT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Nov 2023 08:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbjKCMFQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 08:05:16 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB54D5E
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 05:05:10 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C81A1C433C9
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 12:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699013109;
        bh=gSJCX3dv3zTYXX9CVnLBK00k/VMzifQw7CJ4neMgKx0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qdO2l+4fnzIpuPhJFwUg/Y75r6SJzmCOmFEZxNQqwKs3ZQ2/Qwi6Gmz2bgmWfho/c
         hHR4j7NNXw6Qt7f5dbAJpXPpF6oOe0Nzc4980XtJqC5pzLcvXYybE5EhF1WmU0K4XB
         cCHr+vZ2o5q1h4MgUXu7tP3u3/BzeuEpnDR6TmlQ4ufFvpA6Lzn3zCUPtaGejiYFG4
         kR2vMrK8Y/9ZPEOleur2GpVGjZ6rKntVVJ78p8MmEXIruAcoGPJCbx7PQsTaelBB9S
         PcM/YcRoVEQ+MdF08MslbvPrN7e5wyqSZOV+P92fQv50OEnmKR1VN92yYHukR873En
         JFwqvHMeXNFRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B8B6BC53BD0; Fri,  3 Nov 2023 12:05:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 12:05:09 +0000
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
Message-ID: <bug-218092-215701-yi2bZFpf3V@https.bugzilla.kernel.org/>
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

--- Comment #49 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
The patch doesn't work for your system this means.

> ertugruluyar@ertugruluyar-pc:~$ sudo cat /sys/power/mem_sleep
[sudo] password for ertugruluyar:=20
s2idle [deep]

From you above logs your system uses S3 by default, so it's not surprising =
the
patch doesn't work. It's only for systems that use s2idle.

So there is some other problem than we have observed in the past.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
