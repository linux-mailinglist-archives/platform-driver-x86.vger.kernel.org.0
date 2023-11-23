Return-Path: <platform-driver-x86+bounces-2-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED9D7F568B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 03:47:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F7E71C20A9F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 02:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94F4BEDE;
	Thu, 23 Nov 2023 02:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WVXbNU5q"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792EC187E
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Nov 2023 02:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D5A7C433C8;
	Thu, 23 Nov 2023 02:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700707651;
	bh=rRbIXqjq8DKBA6vW+7glleky65j8TQodsqrm6IeWtY0=;
	h=Date:From:To:Subject:From;
	b=WVXbNU5qrI9xVsXShWjH0qzUOMTwpqG+rWhnO+/5d5NEVtLaRHsEIeHXQkaUacman
	 2duMBAqLYYg72uyv+TIIF4LEcFNoo6ZsQRPFuAtvFj9lp5xwiP79xrkNNnzUQPklR5
	 hNVZUHatHqj8zuAaHGVll1PHGMgAPCLoLvEh+0Lw=
Date: Wed, 22 Nov 2023 21:47:30 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: platform-driver-x86@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231122-tangible-marigold-caracara-dfadbe@nitro>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to the new vger infrastructure. No action is
required on your part and there should be no change in how you interact with
this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K

