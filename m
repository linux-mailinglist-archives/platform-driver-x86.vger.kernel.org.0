Return-Path: <platform-driver-x86+bounces-2715-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B57A89F28B
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Apr 2024 14:44:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5AEA5B24350
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Apr 2024 12:44:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0AA158DB9;
	Wed, 10 Apr 2024 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHvae75g"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB51812EBEF
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712753078; cv=none; b=f7Znu511AhOvRaK920KcvPmOCg2EQbzRDb85uMnb3O9gFZEIZbxW2DgRrjoUTUtDRbOZ8vsl08lR5oxdnps+sZ8Bl2QKi0H6ftAs/C91P2NMgzVVGVjA1CZeDvf8QaBHEgkzIU9hyUNhyj5/VSfc/Q13t6CIQCuJ0fRF7k70OWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712753078; c=relaxed/simple;
	bh=pn9HELtwahHLvShST9amm/jFkoB+bmkt0vmMqADSOd8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k6jWGrPYb/Et4mLTT//1GrN6QvtH9heThx14P2bgFKLFIPHyYcCNsscPocpHAZQuTnvV8nL3oJCpqEeAw7C032IVpgKfhxDcqMFafRqPqSMIgOdG6FTi4LDpOtFzlMnaqxxHUOWpUBYfKB93dK3V/XAxiwyTvL/hrrB8RVs+1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHvae75g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64AA8C433A6
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Apr 2024 12:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712753078;
	bh=pn9HELtwahHLvShST9amm/jFkoB+bmkt0vmMqADSOd8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UHvae75gtpv3W9Lph2jEiW17DnEwnsMbRm/3E1ztUtcm9yLcMdh5KQSgSzlVHkmiw
	 EnE3hk9TeYRFED7Y86V6qvW6tS7XnKXKi5tPop0t8lO7+ZMsry2DDJYCYZcODzMjA2
	 Lk247E2Y+fsxj9sRQdTxkgXkiSY5iIEmoAtYgUKwpWJqJhxRFDYBxrbJOWJAM3vU8R
	 D2uhQgCkPbIILK3s7afeNieyMectj1/Nk83GYz4fBnH431pokF7IQ78g4dqd4r9pC8
	 M9rbQNjiIoc91ZI3kgz8UxnYIqZfQd2ntVp/7O5W6hVyaVp4Q++6ilSJ6UbvdYMNN6
	 kBxJqSMQrfLqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4B6A4C4332E; Wed, 10 Apr 2024 12:44:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 218685] asus-nb-wmi fails to load due to conflict with amd-pmf
Date: Wed, 10 Apr 2024 12:44:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218685-215701-NUnSrHJqje@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218685-215701@https.bugzilla.kernel.org/>
References: <bug-218685-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218685

--- Comment #33 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
OK, in that case let's see dmidecode output to pick the best string to use =
for
a quirk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

