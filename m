Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C0017BD879
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Oct 2023 12:26:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345716AbjJIK0U (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Oct 2023 06:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345709AbjJIK0T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Oct 2023 06:26:19 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97C3299;
        Mon,  9 Oct 2023 03:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696847178; x=1728383178;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1/cdl6TmyznVjvwUTt2iYmMvWoegBT6CdeEJuJVOJZQ=;
  b=ddKOKiVqqpLfrkdj/ZvLn45ZIwIEss9f03JUBq7GoNAyxJtSl7Pybm6A
   +grPLJmRUGrX1vgnJcgAdECxId3D/dOtxjvvbTTE1NHq4puNZRSiGQMOw
   7+Nrnwq9Qby3UCgWSEnytHqwL/ShAoWPH6dXHhUZ7QM4D1xzALcUqgVcb
   6OzuHd2W+2eGkKmQmqLEc8AfUJJuDxAjT8ZKF6LmMZ4e8DC7IEz+qU6is
   OH8SvCOlc25X2zT1qUnxxfHX8bKo+HTJAavhLsBW3+sYEaZshTiLQj9yZ
   aa7RkGlmhn5FrE0yx7dar7BtNGLcLEUJbAkkCMXhpQXAmwsG54ji7fNob
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="5658456"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="5658456"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 03:26:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="896716897"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="896716897"
Received: from lshebash-mobl3.ccr.corp.intel.com ([10.252.57.254])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 03:24:33 -0700
Date:   Mon, 9 Oct 2023 13:26:06 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        basavaraj.natikar@amd.com, jikos@kernel.org,
        benjamin.tissoires@redhat.com, alexander.deucher@amd.com,
        christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
        daniel@ffwll.ch, Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 06/16] platform/x86/amd/pmf: Add support to get inputs
 from other subsystems
In-Reply-To: <61840843-8cb6-4353-a92c-befc46960fad@amd.com>
Message-ID: <bd917993-372f-3565-41d-5882e648e0b5@linux.intel.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com> <20230930083715.2050863-7-Shyam-sundar.S-k@amd.com> <2eb2b3e5-4849-10ec-1c1b-66d2f0ba561@linux.intel.com> <61840843-8cb6-4353-a92c-befc46960fad@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1231359689-1696847176=:1721"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1231359689-1696847176=:1721
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 9 Oct 2023, Shyam Sundar S K wrote:
> On 10/4/2023 5:44 PM, Ilpo Järvinen wrote:
> > On Sat, 30 Sep 2023, Shyam Sundar S K wrote:
> > 
> >> PMF driver sends changing inputs from each subystem to TA for evaluating
> >> the conditions in the policy binary.
> >>
> >> Add initial support of plumbing in the PMF driver for Smart PC to get
> >> information from other subsystems in the kernel.
> >>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

> >> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> >> new file mode 100644
> >> index 000000000000..3113bde051d9
> >> --- /dev/null
> >> +++ b/drivers/platform/x86/amd/pmf/spc.c
> >> @@ -0,0 +1,119 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * AMD Platform Management Framework Driver - Smart PC Capabilities
> >> + *
> >> + * Copyright (c) 2023, Advanced Micro Devices, Inc.
> >> + * All Rights Reserved.
> >> + *
> >> + * Authors: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> + *          Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> + */
> >> +
> >> +#include <acpi/button.h>
> >> +#include <linux/power_supply.h>
> >> +#include <linux/units.h>
> >> +#include "pmf.h"
> >> +
> >> +static void amd_pmf_get_smu_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> >> +{
> >> +	u16 max, avg = 0;
> >> +	int i;
> >> +
> >> +	memset(dev->buf, 0, sizeof(dev->m_table));
> >> +	amd_pmf_send_cmd(dev, SET_TRANSFER_TABLE, 0, 7, NULL);
> >> +	memcpy(&dev->m_table, dev->buf, sizeof(dev->m_table));
> >> +
> >> +	in->ev_info.socket_power = dev->m_table.apu_power + dev->m_table.dgpu_power;
> >> +	in->ev_info.skin_temperature = dev->m_table.skin_temp;
> >> +
> >> +	/* get the avg C0 residency of all the cores */
> >> +	for (i = 0; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++)
> >> +		avg += dev->m_table.avg_core_c0residency[i];
> >> +
> >> +	/* get the max C0 residency of all the cores */
> >> +	max = dev->m_table.avg_core_c0residency[0];
> >> +	for (i = 1; i < ARRAY_SIZE(dev->m_table.avg_core_c0residency); i++) {
> >> +		if (dev->m_table.avg_core_c0residency[i] > max)
> >> +			max = dev->m_table.avg_core_c0residency[i];
> >> +	}
> > 
> > My comments weren't either answered adequately or changes made here.
> > Please check the v1 comments. I hope it's not because you feel hurry to 
> > get the next version out...
> > 
> > I'm still unsure if the u16 thing can overflow because I don't know what's 
> > the max value for avg_core_c0residency[i].
> 
> the highest value for avg_core_c0residency[i] is merely a small number
> and hence I retained the avg variable as u16. Not sure if there a
> 'real' case where it can overflow.

Okay, if you think it's fine, no problem with it then (not that there's 
a big advantage having it as u16 instead of e.g. unsigned int).

> Sorry, I missed to merge both into a single for loop. I will address
> this in v3.

Thanks.

-- 
 i.

--8323329-1231359689-1696847176=:1721--
