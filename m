Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 639EB55475B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jun 2022 14:12:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352451AbiFVIbn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jun 2022 04:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351444AbiFVIbm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jun 2022 04:31:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A3E10F1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 01:31:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DACFBB81CCE
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:31:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CF56C341C5
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2022 08:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655886698;
        bh=VDNYWSvznrfL5ImwOVzg5nTF3yKG+VbrlLTlysCQNPM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DaHBPrKa8oRD1qbgaSk3PJDDUS0rvtutW2cQwc67cR7U8E9smjxkYqSTqJLuXwQol
         fAMpSJUDxGQKahmY5jQPU+L2LGpW3+7CL2lUz9L63dVOKtuJp5kza4Dv5QLPgEQSl3
         +YmEA7DUe0gXBoz8Y13ia2ffTZnLePXr3mByoa613d3a46KoxW/niAs7GKejMfFlOR
         vnedPVX9KjjkRDNzIwvqDPJts5lzAMUl2lwusSYtAs+ZWIgcCl0zmt+/JvbvqpAOk5
         0JYz1X04aNWUokzfFlt0T1ahtdKAJDfuPQDjEb2bQjiJJTbaoeb0rmB5nk6t63yTaQ
         6YpelntDEJMXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6C71BC05FD2; Wed, 22 Jun 2022 08:31:38 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 216163] cstates: intel_idle.max_cstate=4 required to eliminate
 flickering of the display on the laptop model 3Logic Group Graviton N15i-K2
Date:   Wed, 22 Jun 2022 08:31:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kovalev@altlinux.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-216163-215701-Zf6SpHwvwg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216163-215701@https.bugzilla.kernel.org/>
References: <bug-216163-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216163

Vasiliy Kovalev (kovalev@altlinux.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kovalev@altlinux.org

--- Comment #1 from Vasiliy Kovalev (kovalev@altlinux.org) ---
Created attachment 301250
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301250&action=3Dedit
dmesg

dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
