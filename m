Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B97AA7DD633
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Oct 2023 19:40:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbjJaSks (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Oct 2023 14:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbjJaSks (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Oct 2023 14:40:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2BD4A3
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 11:40:45 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91408C433C7
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Oct 2023 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698777645;
        bh=cbBhbZfKPgFgKzVNm9FC+ONK7Rzhl7XXgpSI9uG42Xk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=mNZI8j+q+lNAzDtTAoz6g7W4Ait9lPnn+a0cA7opgqNKxQjvztx0ErsMhrbb90a+m
         ZrS3u9HVjLb2uvxzYd41JY3S91NF3F6NIBsQ15CO68UwGpWeYk5nHEbXsT3oN2XvVB
         1dM8a2Af5Sgl4kos7VJ/a4DXR5i8YEcYEeKrXODCKqnscCaB7kooxjVF6er6dNGbDs
         7OjW8/zs1dasOmpQHpN1uIi8ETSm7DmQGZdbANzkEIxIGHbvTdLPj847QJpGEqV3zF
         I04QBOYyAUoja07Tn7oLYbiLxSlcS7UT2Rrad3yACS/d+nbW3QHoahEzjPpQgN3T7w
         S9J4cYytPmAxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 746F3C4332E; Tue, 31 Oct 2023 18:40:45 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 218092] Laptop hanging on black screen, when suspended and woke
 up!
Date:   Tue, 31 Oct 2023 18:40:45 +0000
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
Message-ID: <bug-218092-215701-nrxJnQin9M@https.bugzilla.kernel.org/>
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

--- Comment #7 from Ertugrul Uyar (ertugruluyar.personal@gmail.com) ---
Comment on attachment 305344
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305344
dmidecode

I used "sudo dmidecode" command and result:

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
