Return-Path: <platform-driver-x86+bounces-7954-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F349FAB9A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 23 Dec 2024 09:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2300F1614A3
	for <lists+platform-driver-x86@lfdr.de>; Mon, 23 Dec 2024 08:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C595C18A92F;
	Mon, 23 Dec 2024 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQUOpFSF"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E311262BE
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734943251; cv=none; b=b590BGtG/cTeu9NfjZ8QePPehb+zUoT4IveWTPNjlsDv0iSBIA+DAAzzQXC6ZlofWz9v77fPhUKlY3RR4NT9BVn6HuyoZ11nRDm2spqfO+7jsb/p7NnXft1lNbWk6cjZdNC80Vl4O2aM3+jZl3FvRi1hEciqnBWuoQOEyZ02lv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734943251; c=relaxed/simple;
	bh=8b0MSlk2O1OJSQRptnrGa61O1BsJjl5zDYC5CjwsoW4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CadtTdXv+CQ7cYDSXRT3823qSXFNjQGcUNS4PVL5LRA6fAFzUtxUalbA+QE2V3Zd3hSiZBeWlwV7Fo770/7xarrc5FmOedCcpHjNQYYq7DLgy39x0GRkMxnyHP3n4He9FJS+cek7apJgtg5s83aDJKOrv65/pc80kFzJpts/4AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQUOpFSF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73C7CC4CED4
	for <platform-driver-x86@vger.kernel.org>; Mon, 23 Dec 2024 08:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734943251;
	bh=8b0MSlk2O1OJSQRptnrGa61O1BsJjl5zDYC5CjwsoW4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TQUOpFSFK46dkNqsf5kJ89/1tZEyUABs+T22/p43M/5rvfk4AAm/qy7XoO8RhdAch
	 LF1JbNX9lXTRo019I+aqUrseLk5cH1dmf6lH8Wb1BkqmPXYeM/YHmGIN4cvUAO0jcC
	 9RcfXgFhg1MIvxMoodrllNYPZa3cgxQpsCYm68kcqVluB5Vej6LBsjOUkF3fXFoQ2v
	 gIWeAFij2K8vd571bj9XBtZvEzfGXlfyVGqrDUmmS27/a2IE3IT+umdMly5tiHgwxt
	 zfB90X12bCPXflfY8jlrLGrAMlREgslhKUKffkKgwgtzO0N25LNB8l7qu3y7pgDtBH
	 X3+kGwBv6Pisw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5A24DC41606; Mon, 23 Dec 2024 08:40:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 219495] [TPM2] tpm_tis driver crashs during the boot time.
Date: Mon, 23 Dec 2024 08:40:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.liang@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219495-215701-l5xPlar3o1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219495-215701@https.bugzilla.kernel.org/>
References: <bug-219495-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D219495

--- Comment #54 from andy.liang@hpe.com ---
(In reply to jarkko from comment #51)
> (In reply to jarkko from comment #31)
> > OK, I somehow managed to miss it as it had different naming convention
> sorry.
> >=20
> > Anywhow, I see this:
> >=20
> > [   10.693310][    T1] tpm_tis STM0925:00: 2.0 TPM (device-id 0x3, rev-=
id
> 0)
> > [   10.848132][    T1] ------------[ cut here ]------------
> > [   10.853559][    T1] WARNING: CPU: 59 PID: 1 at mm/page_alloc.c:4727
> > __alloc_pages_noprof+0x2ca/0x330
> > [   10.862827][    T1] Modules linked in:
> > [   10.866671][    T1] CPU: 59 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> > 6.12.0-lp155.2.g52785e2-default #1 openSUSE Tumbleweed (unreleased)
> > 588cd98293a7c9eba9013378d807364c088c9375
> > [   10.882741][    T1] Hardware name: HPE ProLiant DL320 Gen12/ProLiant
> > DL320 Gen12, BIOS 1.20 10/28/2024
> > [   10.892170][    T1] RIP: 0010:__alloc_pages_noprof+0x2ca/0x330
> > [   10.898103][    T1] Code: 24 08 e9 4a fe ff ff e8 34 36 fa ff e9 88 =
fe
> ff
> > ff 83 fe 0a 0f 86 b3 fd ff ff 80 3d 01 e7 ce 01 00 75 09 c6 05 f8 e6 ce=
 01
> > 01 <0f> 0b 45 31 ff e9 e5 fe ff ff f7 c2 00 00 08 00 75 42 89 d9 80 e1
> > [   10.917750][    T1] RSP: 0000:ffffb7cf40077980 EFLAGS: 00010246
> > [   10.923777][    T1] RAX: 0000000000000000 RBX: 0000000000040cc0 RCX:
> > 0000000000000000
> > [   10.931727][    T1] RDX: 0000000000000000 RSI: 000000000000000c RDI:
> > 0000000000040cc0
> > [   10.939678][    T1] RBP: 000000000000000c R08: ffffffffbb6fdc67 R09:
> > 0000000000000000
> > [   10.947626][    T1] R10: ffffb7cf40077ac8 R11: 0000000000000000 R12:
> > 0000000000000000
> > [   10.955560][    T1] R13: 00000000ffffffff R14: 0000000000000cc0 R15:
> > ffff9a5c051cc000
> > [   10.963507][    T1] FS:  0000000000000000(0000)
> GS:ffff9a6348780000(0000)
> > knlGS:0000000000000000
> > [   10.972405][    T1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   10.978944][    T1] CR2: 0000000000000000 CR3: 0000000184638001 CR4:
> > 0000000000f70ef0
> > [   10.986891][    T1] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> > 0000000000000000
> > [   10.994837][    T1] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
> > 0000000000000400
> > [   11.002770][    T1] PKRU: 55555554
> > [   11.006256][    T1] Call Trace:
> > [   11.009479][    T1]  <TASK>
> > [   11.012352][    T1]  ? __alloc_pages_noprof+0x2ca/0x330
> >=20
> >=20
> > RSI=3D0x0c, which maps to the parameter 'order' in __alloc_pages_noprof=
(),
> > which allocates=20
> > 4096*2**0xc =3D 16777216 =3D 16 MiB of memory. This means that memory c=
onsumed
> > by the log is in the range 8 MiB < N <=3D 16 MiB.
>=20
> I don't understand why ESI=3D0x0c while TPM2 table has size 0x800000, whi=
ch
> maps to the order 0x0b as 4096 * 2**0x0b =3D 0x800000.
>=20
> It looks like as if TPM2 table and this transcript are either from differ=
ent
> machines or different BIOS versions. I'm not sure how to otherwise explain
> that difference.
>=20
> For 0x0c, the last line in that TPM2 dump screenshot should start: 000000=
01
> not 00008000.

Sorry about that. The machine I had in November is different from the one in
December. I uploaded a new dmesg with Kernel 6.12.6. Thank you.=20
https://bugzilla.kernel.org/attachment.cgi?id=3D307386

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

