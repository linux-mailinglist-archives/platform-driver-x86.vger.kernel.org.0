Return-Path: <platform-driver-x86+bounces-10955-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9AA85937
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Apr 2025 12:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A648C4499
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Apr 2025 10:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0C329CB3E;
	Fri, 11 Apr 2025 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5cZTVgp"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CB429CB37;
	Fri, 11 Apr 2025 10:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744365813; cv=none; b=R5jJVsxy57Na1gHTLp2WGbQ7S+A2/FcPUsqdtxP4MebYglrJoy/nXnLrqDXAO4bZO4oBF+3kHzjZz8Kdep/lYXlt06tHWFhZ9klpPofcQDhoDy2OJl8yF+Ukk6TH0LU2XROXYGkxlX+BHuOhdBuWA63UViKT984lbpk1UvlqDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744365813; c=relaxed/simple;
	bh=b2Ie6XJ2A2NKBljjWxVkQT+qhr6ceNjwd/GaOMtseAU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XcAH2DNCxX/Wc0tevuAgnd6aodfc7AnbySxy3azbWKkig3L0RhZgPK4NM/p22sYIQxjNbLtPuSZshaXp9luUJ4RO2Yhx5pRQuzXf1KwrlH9QeHBtOaWXFzg3rEuhktOXSuI4gUMzRoKKubK5wBaoVRgXI8RBfAxSwKFLMQ3CiTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5cZTVgp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744365812; x=1775901812;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=b2Ie6XJ2A2NKBljjWxVkQT+qhr6ceNjwd/GaOMtseAU=;
  b=I5cZTVgp+77wiPL3g5QRzVaL1e76p9WR8R668+ro3v5NsOrmYjMPHvPP
   QvAKRhBxH5XhkZfhgmnKTzZRHduBpS+hoziXLSRcvsh9MLevsWPnDT6BD
   u6csNh8/2seztjGSw9FWDlKJVWLjgF8WMYgUHwZTbyu/V8swaZhIcKvse
   RSuliviJKA3XTbI1Hawf59mpoDSm+frtsHFxaPQ1I5iWd8nHVHkDyLimZ
   XxWzLjsyBZp6whE0UNvkX/NoiJS1l2XKhR2hdgfN3BvV7zPzv46XJ06/c
   7tD0cRIDF1IYhnqpNporHkfiXWvzegjOLGawLIJ5+hjHHQHO3nPbvbOKr
   g==;
X-CSE-ConnectionGUID: 9Wk7b9uiT7KTFnaaB7cVVg==
X-CSE-MsgGUID: FMnl3DzKRuqbLQwu1M94Qg==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="68399691"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="68399691"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 03:03:32 -0700
X-CSE-ConnectionGUID: 2G259lLWQqyzCDXEvpTM/w==
X-CSE-MsgGUID: IdYAU45TToWWXuskk0iDKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="134136153"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.51])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 03:03:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, vadimp@nvidia.com, 
 David Thompson <davthompson@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250407132558.2418719-1-davthompson@nvidia.com>
References: <20250407132558.2418719-1-davthompson@nvidia.com>
Subject: Re: [PATCH] mlxbf-bootctl: use sysfs_emit_at() in
 secure_boot_fuse_state_show()
Message-Id: <174436580385.2374.522905941005450478.b4-ty@linux.intel.com>
Date: Fri, 11 Apr 2025 13:03:23 +0300
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0

On Mon, 07 Apr 2025 13:25:58 +0000, David Thompson wrote:

> A warning is seen when running the latest kernel on a BlueField SOC:
> [251.512704] ------------[ cut here ]------------
> [251.512711] invalid sysfs_emit: buf:0000000003aa32ae
> [251.512720] WARNING: CPU: 1 PID: 705264 at fs/sysfs/file.c:767 sysfs_emit+0xac/0xc8
> 
> The warning is triggered because the mlxbf-bootctl driver invokes
> "sysfs_emit()" with a buffer pointer that is not aligned to the
> start of the page. The driver should instead use "sysfs_emit_at()"
> to support non-zero offsets into the destination buffer.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] mlxbf-bootctl: use sysfs_emit_at() in secure_boot_fuse_state_show()
      commit: b129005ddfc0e6daf04a6d3b928a9e474f9b3918

--
 i.


