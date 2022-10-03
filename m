Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EA965F3200
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Oct 2022 16:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiJCOdW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Oct 2022 10:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiJCOdV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Oct 2022 10:33:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06424481D6
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 07:33:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 99F6A61048
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09120C433C1
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Oct 2022 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664807600;
        bh=IPxLCdC3fAeKBZVJmmBZsltgrwBdjsQgXqapdmJ1cNg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MiZXdZGdKoq1QI8XuimgWPTFXC/FrI1kSCiqS1amwxqTnyryZUgjz+atWH4FL4S6Z
         KEObEA79Lpf6crhS8zQ4yoXTA4EcVtXE1I1YkSs+ap5NkYLAtTVfCxDpKnvlok24qb
         t1Q1X+eKQvWrtzi8enlZt+mB1u0zAqntxnHanw48TNrDOZyvrhEnGCjVAulFrlLgW8
         AbJ81cSyXJx1eLafeDAw9bBek2fpv5Jqpu3+AwRnpcoJhjP2Lpj0R0kkyJx4hntnG/
         KCaHUyAHPbT8KRIYwqmo8EymvY+7nLn/uik/Vr/yoWkHp0Yq1ywCkCeNnCl1DcsOEw
         7ZrgINBnjMrcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EDB85C433E6; Mon,  3 Oct 2022 14:33:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 03 Oct 2022 14:33:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214899-215701-HWIBHOSLhu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #55 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
Created attachment 302927
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D302927&action=3Dedit
[PATCH 3/4] ACPI: EC: Fix EC address space handler unregistration

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
