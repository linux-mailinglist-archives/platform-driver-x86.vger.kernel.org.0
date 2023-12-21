Return-Path: <platform-driver-x86+bounces-564-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04BE181ABBB
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Dec 2023 01:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B64EB28722E
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Dec 2023 00:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0E7EEAD;
	Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="STrdB7kf"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECF11FCF;
	Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 47070C433A9;
	Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703118317;
	bh=dLB0uDEh1CFZDSOV6OBld1/wxTy7GJtHU+kegrWvb40=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=STrdB7kfVdnW1G647nauq+257irAr8sgNSWdgVIHatRKRVkIboPNTxBGMnhcXeCOr
	 VQcQXYp7Bx8b2YcyazMk6ydQtnAxVP2phBKKWJsL1vHWFi0TtPk9uG+njGR/d6MWPR
	 RZ5k6MuFOoJNPqB0qquxBFt0yIIaIAPa8cLbNrm0plfTBXNz8n/2LWysByW78VY6pU
	 5Ag4XnjuTpK78iawd2sfEwIb/8sN/UuUGRvs23Z6VUev7jWWhw6g0Bh9niwWETHyV0
	 Tw1pAzMtZtVDaPyPVFmoD3yJ30FYWZEnzTkD6vk+Zcc54UJFuJl+wI0oIDe+HOXOBP
	 5FpGruurN1ZMw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2F84AD8C983;
	Thu, 21 Dec 2023 00:25:17 +0000 (UTC)
Subject: Re: [GIT PULL] platform-drivers-x86 for v6.7-5
From: pr-tracker-bot@kernel.org
In-Reply-To: <8a82d4$p36og3@fmsmga008-auth.fm.intel.com>
References: <8a82d4$p36og3@fmsmga008-auth.fm.intel.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <8a82d4$p36og3@fmsmga008-auth.fm.intel.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.7-5
X-PR-Tracked-Commit-Id: a55bdad5dfd1efd4ed9ffe518897a21ca8e4e193
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 1bddd45b5cbc0dd278ea7c568d60dc399bc4d3cc
Message-Id: <170311831719.17908.4195705444376228430.pr-tracker-bot@kernel.org>
Date: Thu, 21 Dec 2023 00:25:17 +0000
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, PDx86 <platform-driver-x86@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

The pull request you sent on Wed, 20 Dec 2023 12:46:41 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.7-5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/1bddd45b5cbc0dd278ea7c568d60dc399bc4d3cc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

