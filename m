Return-Path: <platform-driver-x86+bounces-2240-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 190A388A851
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 17:07:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AB551C60A6F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 25 Mar 2024 16:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C3680021;
	Mon, 25 Mar 2024 13:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPCq+5s9"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A8E56740;
	Mon, 25 Mar 2024 13:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711374838; cv=none; b=SsOCojsZG0mvLA4KgsfzW6AyUgwlAokvjNgEyBHh33uHe1NNJUSkMEA8SoVRbcHIAcSz4+pSZ5WJxEXHYOLjSvgZk4SBztz+Iw/AR0ZZouCI4NdyTH/RZ+L+B+a/kvGZp9y4tUMlbOCg+fAJoQ8pJtGZ0CZ3aUadQ3b13l/Jj1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711374838; c=relaxed/simple;
	bh=Z720W74Y2N7Q8FqECReuL+9eR3HFp91sc40BikJ/qNE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FSU6nd1butaXBpyt9KCb7EEVbDE/Fu5750p0cIpifdLvqCwIM0ZcidbFfnZ7p/oIm2rcFu20W7xfuiQbd8s8V0aj9PCXhYfcPswM+IIeyNZPfmJDJvnPs/8NNi9P6neymf9DsUdyAnXt6Zxkw2qiZCDP5wSze1jw1HqEgPc5ORg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPCq+5s9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711374837; x=1742910837;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Z720W74Y2N7Q8FqECReuL+9eR3HFp91sc40BikJ/qNE=;
  b=ZPCq+5s9RJEnvct4SaLRU27ilw5QDZdfbGC4JdYp4BoKzQdi9+DoJNNG
   /2Z5rcki+zSHlywAdaHsHbCkU66XvRjybifEHrLkwddo9YbXZn9zd9/ke
   gs+x65Gra67JDf3t9ExWjzzUa0WPqHWeJREY9/g8hNZ3M9P0E/DmFy/i2
   WzI5lkHGPsjjIQlswv3DEYHddAeQKMVGLJ0oFykvfoPTQ0Yj9dCc2kRdp
   P++XMsVN+GBB1WqcxU8zxRTbw1Pk3Y3L3hi/ZANCx9k0DDjgSddx7QCmx
   XAWgp6BbzysWgmLhGS6gbMWfUSENthJYPavn12sj46HANxdqvlFTO2yjg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6205079"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6205079"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 06:53:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="20301625"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.19])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 06:53:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 25 Mar 2024 15:53:46 +0200 (EET)
To: "Luke D. Jones" <luke@ljones.dev>
cc: Hans de Goede <hdegoede@redhat.com>, corentin.chary@gmail.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 8/9] platform/x86: asus-wmi: Add support for MCU
 powersave
In-Reply-To: <20240325054938.489732-9-luke@ljones.dev>
Message-ID: <cddf60d7-1523-2f22-252a-3c22d399addb@linux.intel.com>
References: <20240325054938.489732-1-luke@ljones.dev> <20240325054938.489732-9-luke@ljones.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 25 Mar 2024, Luke D. Jones wrote:

> Add support for an MCU powersave WMI call. This is intended to set the
> MCU in to a low-power mode when sleeping. This mode can cut sleep power
> use by around half.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>  .../ABI/testing/sysfs-platform-asus-wmi       | 11 +++-
>  drivers/platform/x86/asus-wmi.c               | 50 +++++++++++++++++++
>  2 files changed, 60 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-platform-asus-wmi b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> index 5645dbac4ce8..ab8e5ab1bba9 100644
> --- a/Documentation/ABI/testing/sysfs-platform-asus-wmi
> +++ b/Documentation/ABI/testing/sysfs-platform-asus-wmi
> @@ -202,4 +202,13 @@ Contact:	"Luke Jones" <luke@ljones.dev>
>  Description:
>  		Set if the BIOS POST sound is played on boot.
>  			* 0 - False,
> -			* 1 - True
> \ No newline at end of file
> +			* 1 - True
> +
> +What:		/sys/devices/platform/<platform>/mcu_powersave
> +Date:		Mar 2023

2024.

-- 
 i.


