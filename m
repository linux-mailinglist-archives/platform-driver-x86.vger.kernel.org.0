Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9FAD7E041B
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Nov 2023 14:59:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbjKCN7D (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Nov 2023 09:59:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjKCN7C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Nov 2023 09:59:02 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793431A8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 06:58:59 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22697C433C8
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Nov 2023 13:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699019939;
        bh=zgLUJiXGL7a7OV6Cox8h/GlUxicWHkMyS9UJ9Cd3gpM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FXQIYOhNHPAfzh5lpAMF1et5aCM2FMRPdn5sSu7OKp4f4rocNOZpEzRtRkzTO+1FP
         et9Ufw5xmbjXPs23oRbm5IhQRJKwmUILLcexg8bzJU9cY/gMUQZo2cQM1WMm20Fkt6
         vJclSShWlAIGQmIYsr3nTpvO/UPv8gt+0RpU4LpFnxb/kDd5ey0pyso1SFL8JpTQh0
         4RjjaeXa3qxdTX00cygHMGK8QcSmQdmROm0+NS2dZxDgDyMY7+fAOZrxtwbjGm6XXF
         aHfxXtqOeJwaJouVw2a5JKM7iTrabPJBs39RNKIyojdWyo2/3SF7qeNGcFbUQkZ9qZ
         PrkNIxoA99NhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 05D65C53BD0; Fri,  3 Nov 2023 13:58:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Fri, 03 Nov 2023 13:58:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218092-215701-4uyY08A1Fc@https.bugzilla.kernel.org/>
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

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #51 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Ertugrul Uyar from comment #50)
> (In reply to Mario Limonciello (AMD) from comment #49)
> > The patch doesn't work for your system this means.
> >=20
> > > ertugruluyar@ertugruluyar-pc:~$ sudo cat /sys/power/mem_sleep
> > [sudo] password for ertugruluyar:=20
> > s2idle [deep]
> >=20
> > From you above logs your system uses S3 by default, so it's not surpris=
ing
> > the patch doesn't work. It's only for systems that use s2idle.
> >=20
> > So there is some other problem than we have observed in the past.
>=20
> Okey, then, should I change to s2idle or remove the kernel that patched. I
> am on tuxedo's kernel by choose on grub menu. What do you suggest to me,
> should I just add amd_iommu=3Doff to my grub config? Thank you for your h=
elps
> by the way.

Try that!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
