Return-Path: <platform-driver-x86+bounces-31-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6557F607B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 14:39:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 998BA281CE1
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 13:39:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7045824B5C;
	Thu, 23 Nov 2023 13:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BsthuZ4o"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF0D6BA;
	Thu, 23 Nov 2023 05:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700746779; x=1732282779;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=a3ViAGlyo9ioE8c/1Kfxbx/7EmHUL72QEVbxkTCaVRY=;
  b=BsthuZ4o/d3gy0VO1tOllDdHsM98H/5uMpF7Y7pFMDy5b3DzdJzcDKj9
   vaaGpevnICsIke9HMsfad/oA1QGAhMz7I1367rt+N4mti+Ih/2OucP/yX
   TYvgvZLBsXCJAsOA4AgB1t2JG889PYpMhkUprTooNdE4iRUX9HeLe1pV4
   GCkXBjNyacLoCDbAZ6PJUn2f20HGrWHa9pxcI6vJOMr04e/67zHl4pV/3
   SFk2IQpuSZJwf0pTg09D0k+hY8Mpir2+d+NvwuPR5qmHofmhKAtReYLmZ
   noKlznHPzdR3EBJAFtLd2STdgasijE0MvwhkshMOsbZ7eQKL6cGHI14Rv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="396173531"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="396173531"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 05:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="8677243"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 05:39:38 -0800
Date: Thu, 23 Nov 2023 15:39:35 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
cc: "David E. Box" <david.e.box@linux.intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rajvi.jingar@linux.intel.com
Subject: Re: [PATCH V5 19/20] platform/x86/intel/pmc: Add debug attribute
 for Die C6 counter
In-Reply-To: <5b3b7eb7-78c-c9ec-2acd-f54ff116188@linux.intel.com>
Message-ID: <797fd54-3038-4ed3-fc1c-ce7279c78a8@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com> <20231123040355.82139-20-david.e.box@linux.intel.com> <5b3b7eb7-78c-c9ec-2acd-f54ff116188@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2083658893-1700746778=:1676"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2083658893-1700746778=:1676
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

On Thu, 23 Nov 2023, Ilpo J�rvinen wrote:

> On Wed, 22 Nov 2023, David E. Box wrote:
> 
> > Add a "die_c6_us_show" debugfs attribute.  Reads the counter value using
> > Intel Platform Monitoring Technology (PMT) driver API. This counter is
> > useful for determining the idle residency of CPUs in the compute tile.
> > Also adds a missing forward declaration for punit_ep which was declared in
> > an earlier upstream commit but only used for the first time in this one.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > V5 - Change comment for crystal error and return value
> > 
> > V4 - no change
> > 
> > V3 - Split previous PATCH V2 13. Separates implementation (this patch) from
> >      platform specific use (next patch)
> > 
> > V2 - Remove use of __func__
> >    - Use HZ_PER_MHZ
> >    - Fix missing newlines in printks
> > 
> >  drivers/platform/x86/intel/pmc/core.c | 55 +++++++++++++++++++++++++++
> >  drivers/platform/x86/intel/pmc/core.h |  4 ++
> >  2 files changed, 59 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> > index 4a38d52558fd..fb2c84fba0ae 100644
> > --- a/drivers/platform/x86/intel/pmc/core.c
> > +++ b/drivers/platform/x86/intel/pmc/core.c
> 
> > +static int pmc_core_die_c6_us_show(struct seq_file *s, void *unused)
> > +{
> > +	struct pmc_dev *pmcdev = s->private;
> > +	u64 die_c6_res, count;
> > +	int ret;
> > +
> > +	if (!pmcdev->crystal_freq) {
> > +		dev_warn_once(&pmcdev->pdev->dev, "Crystal frequency unavailable\n");
> > +		return -ENXIO;
> > +	}
> 
> I actually started to wonder whether it would be better to just not show 
> the file in this case (using .is_visible())? (I'm sorry I forgot to send 
> the note about that earlier.)

Ah, sorry, this was actually a debugfs file, not a sysfs one (and that's 
why I didn't end up noting it earlier).

Reviewed-by: Ilpo J�rvinen <ilpo.jarvinen@linux.intel.com>

-- 
 i.

--8323329-2083658893-1700746778=:1676--

