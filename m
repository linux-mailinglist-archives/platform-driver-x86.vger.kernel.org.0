Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783BC6CA7E8
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Mar 2023 16:41:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjC0OlY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Mar 2023 10:41:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjC0OlY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 10:41:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66D0E18C
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 07:41:23 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 03E5E61291
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64197C433EF
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Mar 2023 14:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679928082;
        bh=v9kCAoGHI/fvxHKN8EH8Pr7RFecfX4Y5CzyNoV6wtYg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=b4FfoyFzHJKvi6RRmPN72PnzEiFqUxi9evWQQRoDeAQjVi4ecruiaHDkT7lZUW0qs
         jEcHzXrWJr/aNLA4NUDvF4KOPGWdzXKaFc07DjF+mzXby3quP66Tu1TSXS7FMTvO/9
         +JG7GDFTvuCUe8vxZPEkubcj4BpPHTP2Zz0r/2aLWr/a3G+BXBsOCssQyArTKKMyX9
         zv8sRlHo2po1a3SvdAvntspQxdv3rWVwd2wISi67+k8Dr05JHP92OjmsurKHMiKnTm
         jBLHgS9cxD3cjFZAsshl3e02i+mK8OzOMgfYFq9X3RINWgLMl4Bgm/surSuP/FuUES
         +lBGVuceFSbqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5117BC43142; Mon, 27 Mar 2023 14:41:22 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216824] Some laptop hotkeys don't work
Date:   Mon, 27 Mar 2023 14:41:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216824-215701-EbxieCgPbX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216824-215701@https.bugzilla.kernel.org/>
References: <bug-216824-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216824

--- Comment #23 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I did not see your earlier comment, no need to create a pull-request since I
just already did so myself :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
