Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F12B7DD61D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Oct 2023 19:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbjJaSfX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Oct 2023 14:35:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231550AbjJaSfW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 14:35:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5163A6
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 11:35:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70A61C433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 18:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698777320;
        bh=C2NddF2DCd+UhQ+rbdMtXEENYSeCZNHu93wXNSvNQ0g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fVHYhZJwIvfwubNMB4LXdgm9X9qS6TMEGWcynAiAiK5cJhRXMXmO0s1ndgTxwEMQD
         6ZuXTXTYoV8bl5nEK2VqyFmaXBH16q+3v/xLXbLpUR77TKAt0kqOsuU0ShxkCBdXNo
         Ea/tUUNatPOynVkhvSRBOGR3oGy0U2J3lAInjsKQ1MaUhl6eXGVHQy0hYyVRU80q0H
         Dr7TBccQg0u1OYRyZBsWwBE8mBte+TCHT9Vs/bfqGJHtmILJKhoVyYK9PLNeVnyLYl
         rWo1iKk0qDaOBV1o7VfBCJGoMe5DghSBfbLd8V36ce8zfT0+3grYwwsxL/xMFRJm7O
         RDIPPGg5L3erA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 51A3CC4332E; Tue, 31 Oct 2023 18:35:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 18:35:20 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218092-215701-lYDuQDkop2@https.bugzilla.kernel.org/>
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

--- Comment #4 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Created attachment 305343
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305343&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
