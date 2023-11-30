Return-Path: <platform-driver-x86+bounces-191-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0FB7FF249
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 15:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18E771C20400
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 14:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2BA47798;
	Thu, 30 Nov 2023 14:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esKUhFk+"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AD693;
	Thu, 30 Nov 2023 06:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701355114; x=1732891114;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=UTtXKXJ8SBI9CTs1ef6BVqTU9Sgp6SpMNKw3i/jCWf4=;
  b=esKUhFk+vc22/xa1CMEpntpB+wi86SxrZFOeox8GImKVkmSKkGoqGNqM
   lxsKfBzrNcaUgh5Ecy+PP79CSJalMygArwPAqSLTMQ0peGhB6owjrms8G
   vYJgiE+sOVBavFjNTprxTKhr78FEkzwqeLq89tKtQE6Kiy4OdTdxHEY5O
   urUhNFhXQrVV2dXn/xXiRQGvfxrVg07k/xH1/5BvEpDEVNLfJ9YFaOZYF
   ORiyOn4Xg/2UkKjsMSlKOXpl0z3zBvjySs/GelAGkDasRT5N9SL15io63
   HpM/Qu7Igi2YrruiANDWAX+EtgOpkDXWMQnLysfMBYaEgeQaazqtAople
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="190830"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="190830"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1100956070"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="1100956070"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:38:32 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1r8iBR-00000000ir9-28wm;
	Thu, 30 Nov 2023 16:38:29 +0200
Date: Thu, 30 Nov 2023 16:38:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] platform/x86/intel/tpmi: Don't create devices for
 disabled features
Message-ID: <ZWieZa7huhCbrq7L@smile.fi.intel.com>
References: <20231128185605.3027653-1-srinivas.pandruvada@linux.intel.com>
 <20231128185605.3027653-3-srinivas.pandruvada@linux.intel.com>
 <9603f75-3adb-8eba-9322-cbd9551668c8@linux.intel.com>
 <29cf2ab24e5d63e2b1268516ad7ab2b1beb44c91.camel@linux.intel.com>
 <84eafa2c-27e3-1a55-39df-edb4a87f5eb1@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <84eafa2c-27e3-1a55-39df-edb4a87f5eb1@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Nov 30, 2023 at 04:33:00PM +0200, Ilpo J�rvinen wrote:
> On Thu, 30 Nov 2023, srinivas pandruvada wrote:
> > On Thu, 2023-11-30 at 14:26 +0200, Ilpo J�rvinen wrote:
> > > On Tue, 28 Nov 2023, Srinivas Pandruvada wrote:

...

> > > > +�������if (!feature_state.enabled)
> > > > +���������������return -EOPNOTSUPP;
> > > 
> > > -ENODEV sounds more appropriate.� 
> >
> > The -EOPNOTSUPP is returned matching the next return statement, which
> > causes to continue to create devices which are supported and not
> > disabled. Any other error is real device creation will causes driver
> > modprobe to fail.
> 
> Oh, I see... I didn't look that deep into the code during my review
> (perhaps note that down into the commit message?).

Maybe we should even use -ENOTSUPP (Linux internal error code), so
it will be clear that it's _not_ going to user space?

-- 
With Best Regards,
Andy Shevchenko



