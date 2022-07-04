Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6130565273
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Jul 2022 12:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbiGDKeK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 4 Jul 2022 06:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232438AbiGDKeI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jul 2022 06:34:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82658E0CB
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 03:34:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 04371B80E8D
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8755BC341CE
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656930844;
        bh=uhKZ9+k2DcGjTBkCehypgEL4KXx4qQ/yJaRpZB3kyc0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fom7H/X5pGagz5LhzVTwgRA2CfAhnbQ8i10FILrGq3BA4vQucG/+yVDWgsZ4Fr7ol
         6WWCQcUaGeu3XuhWXdiUtGncv14E9bK76cFneqtpvo5wYlMIP6sGlVlvCz+aaslCex
         jV/0CTByHEJVraHj9e/wKrjk2LqiaRdbwDz7WZMqFXAPOzvl7ALu2fb9EbTAKgUCdu
         KlND5Glr5oQK096JGwL9ZPUDzw/fLe0odvqJUC/tlSen+IBs7UcUh5ixu1ziXcFjOD
         02nYpxO42dmkb6kFsj5UW/NfJwWIfh+0MIy79wz5IjWAoSXjfqZWDHrtBd66xHy6bi
         dbTdWrEeEBBaQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 700C6C05FD2; Mon,  4 Jul 2022 10:34:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 214899] ideapad-laptop: brightness hotkeys not working
Date:   Mon, 04 Jul 2022 10:34:04 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214899-215701-V0NteZuCMJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214899-215701@https.bugzilla.kernel.org/>
References: <bug-214899-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214899

--- Comment #47 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
(In reply to Philipp Jungkamp from comment #43)
> I can report that this also fixes the brightness keys on the 'Lenovo Yoga=
 9
> 14IAP7'.

That is great news.

> My device has multiple of these open app keys (Support, Favorite App,
> Virtual Background, Sound Profile, Dark Mode Toggle), I just wrote a short
> WMI driver to get them working.

Cool, please submit the new driver upstream to:
platform-driver-x86@vger.kernel.org
and then I can review it and once it passes review merge it into the mainli=
ne
kernel.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
