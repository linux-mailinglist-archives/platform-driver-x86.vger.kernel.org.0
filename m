Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 813EF376D14
	for <lists+platform-driver-x86@lfdr.de>; Sat,  8 May 2021 00:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbhEGW7X (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 7 May 2021 18:59:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhEGW7X (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 May 2021 18:59:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D2F75610F7
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 May 2021 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620428302;
        bh=E6dF3X8J/pUtnCi0Y4OtVSnOL3qCF3aJ0I67IA1eySs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GLBFt48j1TbCIIN/tIbaqSuRow6gthjHzHoIlXCuBRmnSn5fjHB1XoHEPPEzswada
         sAhcxn3+PB+4udXngOijvhnC4zs26nvpRi6UsQevoqj8feHbuuYdwEFtJEF7bJZzuF
         qQ4zC+OpeSBiN4eCs1tF7GA4PsFE46invSylBhuscXZBHtmDUNdhgO8HqC43ARX0if
         UP4NYuuudN4MrQau1OriiNNTKzlcQzdw89MIvUgcdQBDYED00imd4dH5Bqj8ANn+AA
         s9dLS3TMbECnCUKIJNI+KC18+1FNOYYEIwjqsJiTAqM1ycVwZN05vO6VC64VU6K1n0
         WMkMi8RReGXDw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CA14260F23; Fri,  7 May 2021 22:58:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 212985] ideapad_acpi: VPC2004:00: DYTC interface is not
 available. platform_profile interface is unavailable
Date:   Fri, 07 May 2021 22:58:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Platform Specific/Hardware
X-Bugzilla-Component: x86-64
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tsweet64@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: platform-driver-x86@vger.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212985-215701-4FR0ikMewS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212985-215701@https.bugzilla.kernel.org/>
References: <bug-212985-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212985

--- Comment #3 from Tim S (tsweet64@protonmail.com) ---
Created attachment 296693
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296693&action=3Dedit
ACPI: Dissassembly of dsdt.dat via iasl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.=
