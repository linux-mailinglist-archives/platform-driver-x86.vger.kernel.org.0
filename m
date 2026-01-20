Return-Path: <platform-driver-x86+bounces-16930-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKQzBxTKb2mgMQAAu9opvQ
	(envelope-from <platform-driver-x86+bounces-16930-lists+platform-driver-x86=lfdr.de@vger.kernel.org>)
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Jan 2026 19:31:48 +0100
X-Original-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E29497F5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Jan 2026 19:31:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ECD4A944581
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Jan 2026 15:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9E3944BC80;
	Tue, 20 Jan 2026 14:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E3r6Xaev"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BD644B690;
	Tue, 20 Jan 2026 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920873; cv=none; b=op2OIV9tBJTyPvA3U3C5IWt1VVNb4ZUAKrYkmVc/4czrKyWhf/J7MuqphF8i2YyEodKoPdTIJ/0/0DGCh3n4omh/fMAMyQ5tkD6lUR02cTxCQM3Dp2rD1aaZWJp4Lzcw3vzgGke2dgGduplggBg+PVopLtgxTtP34yeZg+DKYNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920873; c=relaxed/simple;
	bh=WkhkmygIvX0tauPzGiNw8mZX+sW+xTTCJQczA8voYHY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fFTPcVbv2TE46exUuftRQMwf38ePyCHb8eraT8xQAACBASOqphEanC7NqyTWmxpBb/FKZqh2o3kDDwwkO4GEr0tXIDoidkcu6yRhyspRRKgZaT1nH29Jg2VW8suZVsWr58Klo6tEeNTr/TpzA/X7hD4X3CiPJ+MDJQ1p/UHLS1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E3r6Xaev; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768920871; x=1800456871;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=WkhkmygIvX0tauPzGiNw8mZX+sW+xTTCJQczA8voYHY=;
  b=E3r6XaevI9fPa/r5kDvaeqxwIOFDZV/pZSHgNw2tHQvkHQ8UXxJLF98F
   X62Bhb2jDho4LqNDaGoxoxwzY2Mfa7V0RG1c3xuENCn0s3BupgD98mh13
   S9/ldZ4E5MYY8qCTiIDVXYCFib+r8C4kqpgSWbEsl3t2qAIwlERHD6rAw
   Soyb2ExrN07E37NVoaLbGb8rxICYy2gZkY++ZK7wlgvuArNAUGButN5vj
   sW9qRZysoIMgf9z8wcFUS1GNwxEuqYuPaoXhK1y0x6NFSoT7FtY4S6egx
   9q5lbJcQbGFdFb5//jxtP4s2kzpwfN9so96KNxgqYv6rQtafGLNs1rnFz
   g==;
X-CSE-ConnectionGUID: Xwrw/zTKTNiXsDy4UiC26g==
X-CSE-MsgGUID: 0C0ncLpzTtyGfdYUephfmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80433190"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="80433190"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:54:22 -0800
X-CSE-ConnectionGUID: hFOAhQK/RBC66ZcqmofgZA==
X-CSE-MsgGUID: +2Gvlf8rSlekB902+iOO/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="210286876"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.10])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 06:54:19 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Benjamin Philip <benjamin.philip495@gmail.com>
Cc: Ike Panhc <ikepanhc@gmail.com>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>
In-Reply-To: <20260106184830.34426-1-benjamin.philip495@gmail.com>
References: <20260106184830.34426-1-benjamin.philip495@gmail.com>
Subject: Re: [PATCH RESEND] platform/x86: ideadpad-laptop: Clean up style
 warnings and checks
Message-Id: <176892085530.15580.3220559549900135862.b4-ty@linux.intel.com>
Date: Tue, 20 Jan 2026 16:54:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,squebb.ca,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16930-lists,platform-driver-x86=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com];
	DMARC_POLICY_ALLOW(0.00)[intel.com,none];
	DKIM_TRACE(0.00)[intel.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ilpo.jarvinen@linux.intel.com,platform-driver-x86@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TAGGED_RCPT(0.00)[platform-driver-x86];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,intel.com:dkim,linux.intel.com:mid]
X-Rspamd-Queue-Id: A8E29497F5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 07 Jan 2026 00:18:29 +0530, Benjamin Philip wrote:

> This commit makes some style changes to clean up the following
> checkpatch warnings and checks at various places in ideapad.c:
> 
> - WARNING: quoted string split across lines
> - WARNING: space prohibited between function name and open parenthesis '('
> - WARNING: braces {} are not necessary for any arm of this statement
> - CHECK: Alignment should match open parenthesis
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-next branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-next branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: ideadpad-laptop: Clean up style warnings and checks
      commit: 779bda29f17f99ecef3d6b1be3eb689d2a477a26

--
 i.


