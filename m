Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42BFB4E4C5B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Mar 2022 06:36:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbiCWFiR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Mar 2022 01:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbiCWFiR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Mar 2022 01:38:17 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59B9470F58
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 22:36:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E852A615C4
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 05:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 487FEC340F2
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2022 05:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648013807;
        bh=dYbQln+l27Zt+PruTE3a+U8Hc4ifneW2nbFm8VVii/0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=h8afGpNyZyoZD7Y0u6MxtBQ5a0mxv7ky29t+vpu2ci+aylBW1MoPeEPLRakg3Vjxy
         99V6VEBAAk+Uz4NeQoyuiFuZXGCoYmHUfLdw7tW970j3Uj2xbCRwqJPh/YCuqepZuw
         5PxhANcwaH+6FWFBUJWuM/D0fzaxd0ixt4NX979XNBv3IEKpWzDUTeCgJs+/8U7lBk
         1P+PlPItT6B2dH7cetElNDNepWTWdrMM6NXCDPxtoO2t+fHt2O/3+n/qWM0DNupcEE
         efhIC3OHQJibc0uA+lmiGlXadrXRIdr39qVX73ddnHTzNEsx2PxDyQtcBNcrEfraZw
         Tbndui9KNjN8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2041CC05F98; Wed, 23 Mar 2022 05:36:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 215730] acpi_bus_register_driver() does not work on Alder Lake
Date:   Wed, 23 Mar 2022 05:36:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: xuemin.wu@dbh.dynabook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215730-215701-4eN0yZwRKg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215730-215701@https.bugzilla.kernel.org/>
References: <bug-215730-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215730

--- Comment #2 from xuemin (xuemin.wu@dbh.dynabook.com) ---
Created attachment 300602
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300602&action=3Dedit
acpidump.output.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
