Return-Path: <platform-driver-x86+bounces-190-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB7A7FF1F1
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 15:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06FD01C20EC1
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 14:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7039C3D389;
	Thu, 30 Nov 2023 14:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JN1YkBYE"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4268B85;
	Thu, 30 Nov 2023 06:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701354786; x=1732890786;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=lq1/T0fXlF0cZFg5jLIO16pUiR3nibRQporHPQDkvmk=;
  b=JN1YkBYEhxsLvxIrCIeV3vcTfHnJUs60VY74XOo5uNmLupoHgIRFPz67
   MiKfK0jGzqKpJMnQmkd/rv+qiQih3P9dT+OvMffwiejMg9SpKglTnGKBI
   /U04vR+iuneGEokBx7a9dA/y1bxIq1948QHqhdGkOu3wXY9JLbEpe04A2
   MZVlQ8ro4q4u7Vre3Njdf0yS5iGlkawLTepI43Mz9LjxEfMbQlXsHXe77
   JoJJyViJFf0SqW+zJYnzDlaJCPMNgehjaOxpR3uR4Mqu8atQr+rbaEnDZ
   fu7ehY2Ss/ooH7sml6PAIUuY/3Lt7jPZxYLx91Kb8Qyd8yZ9I1lWJHrSk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="12036009"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="12036009"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:33:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="798309865"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="798309865"
Received: from bergler-mobl.ger.corp.intel.com ([10.249.33.30])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 06:33:02 -0800
Date: Thu, 30 Nov 2023 16:33:00 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
cc: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
    Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] platform/x86/intel/tpmi: Don't create devices for
 disabled features
In-Reply-To: <29cf2ab24e5d63e2b1268516ad7ab2b1beb44c91.camel@linux.intel.com>
Message-ID: <84eafa2c-27e3-1a55-39df-edb4a87f5eb1@linux.intel.com>
References: <20231128185605.3027653-1-srinivas.pandruvada@linux.intel.com>  <20231128185605.3027653-3-srinivas.pandruvada@linux.intel.com>  <9603f75-3adb-8eba-9322-cbd9551668c8@linux.intel.com>
 <29cf2ab24e5d63e2b1268516ad7ab2b1beb44c91.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1545743258-1701354784=:1808"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1545743258-1701354784=:1808
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Nov 2023, srinivas pandruvada wrote:

> On Thu, 2023-11-30 at 14:26 +0200, Ilpo Järvinen wrote:
> > On Tue, 28 Nov 2023, Srinivas Pandruvada wrote:
> > 
> > > If some TPMI features are disabled, don't create auxiliary devices.
> > > In
> > > this way feature drivers will not load.
> > > 
> > > While creating auxiliary devices, call tpmi_read_feature_status()
> > > to
> > > check feature state and return if the feature is disabled without
> > > creating a device.
> > > 
> > > Signed-off-by: Srinivas Pandruvada
> > > <srinivas.pandruvada@linux.intel.com>
> > > ---
> > >  drivers/platform/x86/intel/tpmi.c | 10 +++++++++-
> > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/platform/x86/intel/tpmi.c
> > > b/drivers/platform/x86/intel/tpmi.c
> > > index c89aa4d14bea..4edaa182db04 100644
> > > --- a/drivers/platform/x86/intel/tpmi.c
> > > +++ b/drivers/platform/x86/intel/tpmi.c
> > > @@ -604,9 +604,17 @@ static int tpmi_create_device(struct
> > > intel_tpmi_info *tpmi_info,
> > >         struct intel_vsec_device *vsec_dev = tpmi_info->vsec_dev;
> > >         char feature_id_name[TPMI_FEATURE_NAME_LEN];
> > >         struct intel_vsec_device *feature_vsec_dev;
> > > +       struct tpmi_feature_state feature_state;
> > >         struct resource *res, *tmp;
> > >         const char *name;
> > > -       int i;
> > > +       int i, ret;
> > > +
> > > +       ret = tpmi_read_feature_status(tpmi_info, pfs-
> > > >pfs_header.tpmi_id, &feature_state);
> > > +       if (ret)
> > > +               return ret;
> > > +
> > > +       if (!feature_state.enabled)
> > > +               return -EOPNOTSUPP;
> > 
> > -ENODEV sounds more appropriate.  
>
> The -EOPNOTSUPP is returned matching the next return statement, which
> causes to continue to create devices which are supported and not
> disabled. Any other error is real device creation will causes driver
> modprobe to fail.

Oh, I see... I didn't look that deep into the code during my review
(perhaps note that down into the commit message?).

-- 
 i.

--8323329-1545743258-1701354784=:1808--

