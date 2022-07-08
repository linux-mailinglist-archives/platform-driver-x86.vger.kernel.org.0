Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAEB56C1E9
	for <lists+platform-driver-x86@lfdr.de>; Sat,  9 Jul 2022 01:12:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240272AbiGHUx5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 8 Jul 2022 16:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238610AbiGHUx4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Jul 2022 16:53:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DB319C07
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 13:53:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9B09C628CD
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 20:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BF6CC341C6
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Jul 2022 20:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657313635;
        bh=/kU46b2167H1QkBaPfIQuQURIqTSB1QpggQHlsFZErI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ufdx3iwToib4JA7wfsHlS/Y8Xn5l70LkfwurLza6x4cdKFMpSmPFKZ7RwmO62IbxO
         eyIPVCH+xO1CbXp7Ite67+tsRLjQllXujmx3DORLN52pCQLlsfj1THQzyIRNlZJYYQ
         pgIGsW2H3b+u93+34WVqfO23bB9rzkJDU1MBWJ/UajXvB1GYnzV6Cv+h00DO67dNG8
         e2DvO0gSP2w6ozEjzym0xR13JA3v5VaR8ghkyad8BCn87T9uI0S946BGdJkTUHiCYQ
         N7g+3hh5GoqfH6TUQNFlBhm2qOOoedmAfh/iuL/0LFlkUtZ6EUVXt7P5t7okIP4173
         UwrvoRrMgyG7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EC26DC05FD2; Fri,  8 Jul 2022 20:53:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215993] Serial Bus Multi Instantiate driver fails to allocate
 SPI device CSC3551:00
Date:   Fri, 08 Jul 2022 20:53:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: blur.3rd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215993-215701-qUl3DQdbk6@https.bugzilla.kernel.org/>
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

--- Comment #11 from Supasak Sutha (blur.3rd@gmail.com) ---
Created attachment 301372
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301372&action=3Dedit
grep -H 15 /sys/bus/acpi/devices/*/status

grep -H 15 /sys/bus/acpi/devices/*/status

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
