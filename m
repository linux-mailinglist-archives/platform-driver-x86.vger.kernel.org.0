Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26411545957
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jun 2022 02:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239432AbiFJAxJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jun 2022 20:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239357AbiFJAxI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jun 2022 20:53:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFBDF1C204C
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 17:53:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7869461680
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 00:53:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E05F3C3411F
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 00:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654822386;
        bh=M+sVAZ4dN3ctzfeKANysRNl/lb2vvKzH5qx37TFRuO4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fE5kMsHz9kphD+Ob7T685l/eX67rCwhXCUWZ1OGOF2BIL+AAx8OgdW314C9oxkviX
         ju+aL46fFCqcXcYeJ9HLq8xOlrpqEoeVDlB0H9JLI578YfJsAu34N5T85LE1/Mpk5j
         HEf1yIIZ2HGM72l4LX3rL1nY0VCQ+tl+WXdAdMvQ6jE5y8r7Df9TadSLWVBWLEPSY8
         BCrJShuQBsjBnbyxwiRyqVspee1uHmOoA+ewpAzkpSDU6Aks0Gxv93zxdkfQD6zG/o
         2EgCCjYKaOYSHv/hBqtl9bOMkwtSc9ZUS7Q3IIhWukC8EluAqtOeBctgG/qebv/kdo
         JNptmc2K12Ctg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CF9F6CC13B4; Fri, 10 Jun 2022 00:53:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Fri, 10 Jun 2022 00:53:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mike@carns.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204807-215701-X8fPcJW2S1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

Michael Carns (mike@carns.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mike@carns.com

--- Comment #253 from Michael Carns (mike@carns.com) ---
Created attachment 301145
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301145&action=3Dedit
Add Maximus XI Hero

I have an older Maximus XI Hero (WiFi) that works fine once I add it to the
appropriate lists.  I'm attaching the patch I've been using on top of the
existing nct6775.patch.  Hopefully, it can get integrated into the next
iteration.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
