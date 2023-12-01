Return-Path: <platform-driver-x86+bounces-205-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9277FFF68
	for <lists+platform-driver-x86@lfdr.de>; Fri,  1 Dec 2023 00:24:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFD661C20BE8
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 23:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42FF75952C;
	Thu, 30 Nov 2023 23:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQc5rw54"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3225010FC;
	Thu, 30 Nov 2023 15:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701386682; x=1732922682;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=uGbbctLMljhlsB6T/8B4y5j9G3mH6s1oSescm24JZhs=;
  b=PQc5rw54P3Xpi/J6MszJ3rNwOurD0SKkWak37ArKe/hq8ESHW37qoAU7
   adXggPfyS6YVyM/2Q7A2M2op79ROPt8kQt748Dnh6xDHFVRWV6MWtUqPQ
   DtFNGSYHm2IXW7BSI3ewc8hOmcAAjOQDeJUZSxP3f63LUy6KLueMQFB8M
   kqvY4a/4F41/ME96etTOh83o4q1J9EvkXLj5GRm7SyFb6ZniAJ3GiZV+C
   s5vH3JDoxtBlHgbhoa8D45nSjA+2O4RzZYn4y5zGEn2mQY+fLnjDV7jiu
   ciaxjU0KMtT/G1TkxQuEIPIeQa2hyM0SxpzE58U92Vb++lJEE1pYD4yJi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="411034"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="411034"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 15:24:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="1016809150"
X-IronPort-AV: E=Sophos;i="6.04,240,1695711600"; 
   d="scan'208";a="1016809150"
Received: from jpneilso-mobl3.amr.corp.intel.com (HELO [10.212.31.74]) ([10.212.31.74])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 15:24:39 -0800
Message-ID: <e84824057954fa8593783c4433f5b535f0da6490.camel@linux.intel.com>
Subject: Re: [PATCH v2 0/5] TPMI update for permissions
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: hdegoede@redhat.com, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com,  andriy.shevchenko@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 30 Nov 2023 18:24:38 -0500
In-Reply-To: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
References: <20231130214751.3100418-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2023-11-30 at 13:47 -0800, Srinivas Pandruvada wrote:
> Process read/write and enabled state for feature drivers. When a
> feature
> is disabled, don't create a device to load a feature driver. When a
> read
> is blocked then don't load feature drivers. When write is blocked
> continue
> to function in read only mode.
>=20
> v2:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Dropped patch platform/x8=
6/intel/tpmi: Add additional TPMI
> header fields
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Addressed other review co=
mments, details are in each patch
>=20
lkp@intel.com is complaining that these patches can't be applied. I
will fix any issue after review and post v3 if required.

Thanks,
Srinivas


> Srinivas Pandruvada (5):
> =C2=A0 platform/x86/intel/tpmi: Don't create devices for disabled feature=
s
> =C2=A0 platform/x86/intel/tpmi: Modify external interface to get
> read/write
> =C2=A0=C2=A0=C2=A0 state
> =C2=A0 platform/x86/intel/tpmi: Move TPMI ID definition
> =C2=A0 platform/x86: ISST: Process read/write blocked feature status
> =C2=A0 platform/x86/intel-uncore-freq: Process read/write blocked feature
> =C2=A0=C2=A0=C2=A0 status
>=20
> =C2=A0.../intel/speed_select_if/isst_tpmi_core.c=C2=A0=C2=A0=C2=A0 | 25 +=
++++++++++++
> =C2=A0drivers/platform/x86/intel/tpmi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 35 +++++++++--------
> --
> =C2=A0.../uncore-frequency/uncore-frequency-tpmi.c=C2=A0 | 15 ++++++++
> =C2=A0include/linux/intel_tpmi.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 18 ++++++++--
> =C2=A04 files changed, 72 insertions(+), 21 deletions(-)
>=20


