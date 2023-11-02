Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 778267DED35
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Nov 2023 08:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233756AbjKBHY3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Nov 2023 03:24:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbjKBHY2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Nov 2023 03:24:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C92012F
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 00:24:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBC41C433C7
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Nov 2023 07:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698909865;
        bh=cskYCTIPPKrMhx3k1rijtdEYxMMhI9uIm42fFML6nTU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XfzsZfn890qKh67NBSyYLDCd2vCr+mTh/y+LNFoLAYiVSiotPVA0FYusTpj+xKTjy
         2CMujFDXFZiT81MNWgtCE5FuJRJsqnhy6/OidwaFLC/iGthTdNisfph08FIr7gCmtv
         8hsmCEbXtlSu+luiTuGvTKJYyJrQ8oJJA0SMJaFp4A0ZN6FeEx9Yl14g2NPw4l8wFT
         wtr240gnQwoiN1MfT400KqGqSHBSnW7nTOqWs0NOuMLPDKzub6L3CsBEMseyoC7QjE
         sJbVN6xJuA9eAeUifh/p7v0d2hD29BLbHUFzREmOJSQyh67SkRa8Dk/MtiPVCSXw+J
         GY6UMUDMnq6Qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C5178C4332E; Thu,  2 Nov 2023 07:24:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Thu, 02 Nov 2023 07:24:25 +0000
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
Message-ID: <bug-218092-215701-SZghjH6lOL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218092-215701@https.bugzilla.kernel.org/>
References: <bug-218092-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D218092

--- Comment #23 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #16)
> 8) Copy your existing kernel config from /boot to the file .config in the
> kernel directory.


There is no file that has extension .config in linux.6.6/kernel folder or
linux6.6. folder. There is a linux-6.6/kernel/configs/ folder. In
linux-6.6/kernel/configs/ folder:
debug.config
kvm_quest.config
nopm.config
rust.config
tiny-base.config
tiny.config
x86_debug.config
xen.config


Also, for this: "Copy your existing kernel config from /boot to the file
.config in the kernel directory."
Should I copy /boot/config-6.5.0-10006-tuxedo file or copy
config-6.5.0-10006-tuxedo file's content to the file's content .config in t=
he
kernel directory?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
