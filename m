Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A990D5EB07D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Sep 2022 20:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbiIZStv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 26 Sep 2022 14:49:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbiIZStu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Sep 2022 14:49:50 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11925B7CD
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2022 11:49:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 87CC8CE1314
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2022 18:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FF19C433B5
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Sep 2022 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664218185;
        bh=JXpkfEu90r87P7xfEZGQAdT3wRdBxe6oewUbU3Pd1no=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=prDKSU7TxVVDzjke5/ZaOkDb+Sz3zQJZRmXT3Q0hVs3sHPTo/yUv2YDtIUGmeyzjT
         udoPGZkuv3dw+39aSYCFBoIb+38XDSMMQ9JXjKONJA0R3XgEcptqrfkn7l/GMdQYQn
         M5KuZPWCq0z9Zk1f2cmLCqj7XeopM5JydpYIf/pjm8xMxR3KBuUd6O2DtIQlsiPiK8
         2TlQlrFQkbMxdEFMH7LnfIQAj8IOhYUfXwfhsH1Re6NmfO2dB/JOhC7houAxGc2oFm
         YTZChkIcyxPTbrry7j739pfPgpW17VTxbXpDNJUq251K9tcLMHRGv025dg9A9kUS0x
         /RTmILGaJlXhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7253BC433E4; Mon, 26 Sep 2022 18:49:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216516] s2ram freezes screen (Ryzen-5650U incl. Radeon GPU)
Date:   Mon, 26 Sep 2022 18:49:45 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component assigned_to
Message-ID: <bug-216516-215701-crx8s6RvXb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216516-215701@https.bugzilla.kernel.org/>
References: <bug-216516-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216516

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Video(DRI - non Intel)      |Platform_x86
           Assignee|drivers_video-dri@kernel-bu |drivers_platform_x86@kernel
                   |gs.osdl.org                 |-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
