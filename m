Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 717807DF7A7
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Nov 2023 17:30:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229495AbjKBQaV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Nov 2023 12:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjKBQaV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 12:30:21 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87EA412D
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 09:30:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30B6DC433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698942618;
        bh=by016tV+3yIfsGj1WDQRi8G8DPDXZcamv+B7k7huU+Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aXCtlDR1Xxbt8hKJqiR1Pk1Ov/5YJ1VM6j1GU+mX87KbHZKcydT0fP/4I+y+g5CWQ
         X4Id2QcsA487uXvwDZVqYa0nn+eDnWlgDVVqHrc4xcy+Nsi+QkKARVWl+gybE5wXzj
         BQONWVcfRB/vudvZTnTUWdsfgpR42Xqu8AlhWDdgxI8odRIzMF35W1eHEUm0wFRACO
         uG0Rod9BIg4yRApnAcwoAjI6LZPclu/I4iutwbAlIy/OiYLXUa5yjGtH6IgMNGy0m8
         75U7jxrsOhWU/ROtGQbzabDcJHR7hR6n9pSsKhMJKFErVSJRPGWd6s8zFoljZPa74Q
         1AbPNNqSKFD6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1F150C4332E; Thu,  2 Nov 2023 16:30:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 16:30:17 +0000
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
Message-ID: <bug-218092-215701-pustOiwISo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #39 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Created attachment 305347
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305347&action=3Dedit
Boot Config file

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
