Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5C16C5BA5
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Mar 2023 02:00:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbjCWBAh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Mar 2023 21:00:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjCWBAf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 21:00:35 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8F3234F8
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 18:00:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 9B26ECE1F8E
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 01:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9821C433A1
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Mar 2023 01:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679533216;
        bh=dce0rmfbxTcsDoE0FRXEgnrmp+D8YhACnUWDHVB9HJM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Pt11ecu/gnXC2ep1lrJupWhAX7IrREWAVRbppFXTjM1dTT1ZtudX12mVhgGNE4UAb
         sdw8c8VyURAsRF8AzAaLbi7LrOCMJ2z9MZqj8c7YLI1A5TQNdsaAf9k5YBPziv20Vc
         wdF39UOgMVvowDMhDlQ52tiJengSnvM+4u42wjOdhpU8Hr/udKkTVkZ9qrzHzmSgKg
         emSMVykUTcuyG9XCYEpq2GIaGQ8QFL7gqcDviF0HTIywnneKo8M/h8DbjgZg9sf4tz
         3cqA8riZWFpj3IaQPOgAEw0FrE3e49Tn44043vGIuK6JVknBqA+kp0zi8SiVuMquh0
         /AbNripa9mH6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9B5CFC43145; Thu, 23 Mar 2023 01:00:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 204807] Hardware monitoring sensor nct6798d doesn't work unless
 acpi_enforce_resources=lax is enabled
Date:   Thu, 23 Mar 2023 01:00:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bmilreu@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-204807-215701-BDLqn9t36Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204807-215701@https.bugzilla.kernel.org/>
References: <bug-204807-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D204807

--- Comment #316 from bruno (bmilreu@gmail.com) ---
Created attachment 304005
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304005&action=3Dedit
dmidecode for ROG STRIX Z690-E GAMING WIFI

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
