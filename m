Return-Path: <platform-driver-x86+bounces-29-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FD27F5E3A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 12:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DE1D281BC3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 11:51:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC6723767;
	Thu, 23 Nov 2023 11:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+PF/yaw"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3C12101;
	Thu, 23 Nov 2023 03:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700740281; x=1732276281;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=c3bcXnDOVlFpX+Ph2RovZJ6+TK7ouwTaIB2jo3XHN/U=;
  b=n+PF/yawXEWT6jfPikm7QikRKdmiJUTzP+E1xzGNLfgsq1HKSX+qoS2G
   8YzZxnVNiEmRx6P5utIjr0qSuZS1QBnWI0RNCSx2+NRQ2W3VQ3oJWMf9P
   C+RBbiy0q+xp+xI6wNaCoVP2trxhzXXEVdjErveX1cAsBigHikB2wAGtv
   UCB958D7sCMT0gQfl/p/ytEV3sCokp+6OE04IOFckHp+Q9dcvITgxFM2H
   06ZdztVbjPBarvJJUDp9/qw5LvH9kLfK1WtQiUXMECNcOpiheMjwfj/30
   5aArmYUZ3xBru4lN6Oj8u8f/HGtuFJTZ6y1wboQDUYs2pCFsAczTQddQ1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="10929854"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="10929854"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 03:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="15632384"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 03:51:18 -0800
Date: Thu, 23 Nov 2023 13:51:15 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: SungHwan Jung <onenowy@gmail.com>
cc: lkp@intel.com, Hans de Goede <hdegoede@redhat.com>, jdelvare@suse.com, 
    jlee@suse.com, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, linux@roeck-us.net, 
    oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org
Subject: Re: Re: [PATCH v2 2/2] platform/x86: acer-wmi: add fan speed monitoring
 for Predator PHN16-71
In-Reply-To: <20231123055323.417287-1-onenowy@gmail.com>
Message-ID: <24bf6134-4111-87bc-1e4d-a84b2fb67443@linux.intel.com>
References: <202311230750.psygl1ot-lkp@intel.com> <20231123055323.417287-1-onenowy@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Nov 2023, SungHwan Jung wrote:

> It is caused by dependency on hwmon. Setting both hwmon and acer-wmi as
> module (or in-kernel) in config fixes this error.

Then you should add
	depends on HWMON
into the Kconfig in the next version of this patch.

-- 
 i.


