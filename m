Return-Path: <platform-driver-x86+bounces-13889-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF1B3A601
	for <lists+platform-driver-x86@lfdr.de>; Thu, 28 Aug 2025 18:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEA861C232A3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 28 Aug 2025 16:21:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F2103218C2;
	Thu, 28 Aug 2025 16:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="emQ7fGWa"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AD427E1AC;
	Thu, 28 Aug 2025 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756398063; cv=none; b=AAC5PiHkYMaHTcQQ0JT4tVq+FFULlSQAhZpbcQAs4vfpcm5Uh/NaNnqW5alrSo7BDtjsJdN9NnSVEGSab0n5gkvhV/tXtFBwXt/JrMEqGrmtJ67m/VJtHhZxCgIqdLT0yZAsmhaFTMGQnRl3cUrmY5Vk1K2dxusK/8vViKuTX/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756398063; c=relaxed/simple;
	bh=HkAJ12vs5FF2illTiu1xqBhk7uvk5vSKbdHJHpF6g9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=s1vqEzCbcHb+QcizEH//zldXxOYi5V6+IqgOKoC2Mbj/QZQ62Oxixhe97eCVGOBUvIlGyZToAIQr3Wy0y/B1gEW9NxVKasTDFf+fO+qWyR0vIKVekBWciTQ6qEXnwhh5FljoTgd2x205t5TAQvQJ+NrEdI8xhjdYhYx5A1fEP+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=emQ7fGWa; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756398062; x=1787934062;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=HkAJ12vs5FF2illTiu1xqBhk7uvk5vSKbdHJHpF6g9A=;
  b=emQ7fGWabitt6PkRW1CBZuBFWNZKcwdA4rL65Clloi+4hfNNQ0RL5iuR
   3zQJqCL1bi06yPTYR6KVGhurCU4wo74ofHdllreSs+XWjOEl+61eK6iRE
   lgwbVrUBjZOxyK2hLP6U8Mft9c5V66m7qrK5kJtZf3R8J4VUHtEQlIA5e
   THvTpTvZx99RVzuXSpNvTEKSWtteKDSwW2B2KKiGKDAqqh46P0ywOlO5f
   Bkhn/T0nPsIWsfZRdFmuz8yeRQG22ThxM4v7WT8NBxBM/+XUb1Mum+8r0
   UpaJM92UA0Bmr0zw3sdkQAbRRS9KkX+rPU8KP1B0nvGBv+J750t7i33db
   A==;
X-CSE-ConnectionGUID: k3bYgwYHQUiR9ePx/2qBTA==
X-CSE-MsgGUID: XJNgEWVpREyOnpk4bkgagg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58619079"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58619079"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:21:01 -0700
X-CSE-ConnectionGUID: zPNXqHLQR0yZ4JE9ukv4CQ==
X-CSE-MsgGUID: q3zY/pO1TG2gNKlxt2Wi1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; 
   d="scan'208";a="175431327"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 09:20:58 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "Luke D . Jones" <luke@ljones.dev>, Takashi Iwai <tiwai@suse.de>
Cc: Corentin Chary <corentin.chary@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250827052441.23382-1-tiwai@suse.de>
References: <20250827052441.23382-1-tiwai@suse.de>
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix racy registrations
Message-Id: <175639805403.20700.2974410587242050974.b4-ty@linux.intel.com>
Date: Thu, 28 Aug 2025 19:20:54 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Wed, 27 Aug 2025 07:24:33 +0200, Takashi Iwai wrote:

> asus_wmi_register_driver() may be called from multiple drivers
> concurrently, which can lead to the racy list operations, eventually
> corrupting the memory and hitting Oops on some ASUS machines.
> Also, the error handling is missing, and it forgot to unregister ACPI
> lps0 dev ops in the error case.
> 
> This patch covers those issues by introducing a simple mutex at
> acpi_wmi_register_driver() & *_unregister_driver, and adding the
> proper call of asus_s2idle_check_unregister() in the error path.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: Fix racy registrations
      commit: 5549202b9c02c2ecbc8634768a3da8d9e82d548d

--
 i.


