Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9E30300888
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 Jan 2021 17:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729468AbhAVQWu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 Jan 2021 11:22:50 -0500
Received: from mga12.intel.com ([192.55.52.136]:40543 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729477AbhAVQWm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Jan 2021 11:22:42 -0500
IronPort-SDR: Pj6FvR2GIqoTSFDjEs31gTtX/+7glmLtp0u/S7vIb+fFmTquo7dx1KRGIKoctiwOon4c6Zgwyt
 OitDPfoOIUgg==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="158647054"
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; 
   d="scan'208";a="158647054"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 08:20:44 -0800
IronPort-SDR: ks8o/WLUq/vE8zE40SVor3vOSrqMYlTYhcCNhfuSmMkq+Fvv0h8TtRuMMfOX7LvBA+mEWAkU6G
 t0UmGCMuJr+g==
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; 
   d="scan'208";a="357078037"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2021 08:20:42 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l2zBx-00976f-LP; Fri, 22 Jan 2021 18:21:45 +0200
Date:   Fri, 22 Jan 2021 18:21:45 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] platform/x86: intel_mid_powerbtn: Remove driver for
 deprecated platform
Message-ID: <YAr7mT0wB9/QkQz5@smile.fi.intel.com>
References: <20210122114145.38813-1-andriy.shevchenko@linux.intel.com>
 <5b7a5176-225a-22e3-e5f0-1de255bd0f80@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b7a5176-225a-22e3-e5f0-1de255bd0f80@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jan 22, 2021 at 04:44:11PM +0100, Hans de Goede wrote:
> On 1/22/21 12:41 PM, Andy Shevchenko wrote:
> > Intel Moorestown and Medfield are quite old Intel Atom based
> > 32-bit platforms, which were in limited use in some Android phones,
> > tablets and consumer electronics more than eight years ago.
> > 
> > There are no bugs or problems ever reported outside from Intel
> > for breaking any of that platforms for years. It seems no real
> > users exists who run more or less fresh kernel on it. The commit
> > 05f4434bc130 ("ASoC: Intel: remove mfld_machine") also in align
> > with this theory.
> > 
> > Due to above and to reduce a burden of supporting outdated drivers
> > we remove the support of outdated platforms completely.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> 
> I take it that this patch and the similar intel_mid_thermal
> patch are ready for merging?

Yes.

-- 
With Best Regards,
Andy Shevchenko


