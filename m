Return-Path: <platform-driver-x86+bounces-5171-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8EB9683E0
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2024 11:58:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFA18B23E63
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2024 09:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142571D2F73;
	Mon,  2 Sep 2024 09:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emcjhz20"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4450187335
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Sep 2024 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725271060; cv=none; b=LA9DcIUxn+P8R1T7uehILUVeXd43b0bcGQ3T9e6vu3djpXxa2EvmKs16Eu8Qj0wjEstQHKRW8YFn7WZ+qVgf72/rhf+2DHb7efUQDUHu0KXMAH05tR0nIwLYRTnQd3sCZqmnAvjDy8rd8jvzQZZeCQuf5u0EwCUN6UKSThg++tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725271060; c=relaxed/simple;
	bh=zzlvs85P0p0/cxyCoycDgYJnu7zL1vPogQdHQ+uYvH8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VBYcFtWvXeCqcJhCSv92AB20831rQMLhkQpUuMuVHfTHr7SEKkhJxtaL3NlajS0BS0Jsm9FvNC+KzpGn1miUpY3pLIljkqKosCfHKuEqVKOcuEXAdfKJd9SM4fVaf/8jVImwBgbvvefVoFOtQzosLauhXuIyyTqlDikOfIuqlyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emcjhz20; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65C5DC4CECB
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Sep 2024 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725271059;
	bh=zzlvs85P0p0/cxyCoycDgYJnu7zL1vPogQdHQ+uYvH8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=emcjhz20aBtJ5J00mT9Tfp01/1w/MRMRo9DI6HEsR4Fm8RZkRTUlQOe8pyhRB4vZD
	 nwUf12n3xJq+Gs+rx+T9FRzcC7fLdZ55tPoUOIUc1UxjrtHuZps0X35Vl+1p5yA15I
	 5X0uvqP+9UmcAZ/nHT5t+GzaAhjdCf/z+SfMEbS2DUU7GPqHWhC1Yw9UmJkc2Vi7Jf
	 CZavne8Eme+QwSynSgXT95B8Wnd51jcBMLojqApUrZJsfzyRCr/gxA/OD1DvjlMret
	 ButZV+usXW7Esv1NP+qugMtB2+Ul9HozO04obSQjz9jpn12XSZv5YHqL7KZJwychRT
	 5nB3X9DVDOW8A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D4D0C53B73; Mon,  2 Sep 2024 09:57:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: platform-driver-x86@vger.kernel.org
Subject: [Bug 38082] Fan sensor/controls not working in Thinkpad Edge E220s
Date: Mon, 02 Sep 2024 09:57:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lorenzo@masellis.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-38082-215701-HgGdU2By8J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-38082-215701@https.bugzilla.kernel.org/>
References: <bug-38082-215701@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D38082

Lorenzo M. (lorenzo@masellis.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |acpi_power-fan@kernel-bugs.
                   |                            |osdl.org

--- Comment #5 from Lorenzo M. (lorenzo@masellis.eu) ---
Please consider reassigning to acpi_power-fan@kernel-bugs.osdl.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

