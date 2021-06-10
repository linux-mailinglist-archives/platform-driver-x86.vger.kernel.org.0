Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6103A2AE0
	for <lists+platform-driver-x86@lfdr.de>; Thu, 10 Jun 2021 13:56:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230331AbhFJL6C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 10 Jun 2021 07:58:02 -0400
Received: from mga01.intel.com ([192.55.52.88]:17349 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230332AbhFJL55 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Jun 2021 07:57:57 -0400
IronPort-SDR: idLIkENXxoI1tYvt4i3NCTDbm3wG2Og/F6WcbZoQhbWRFigvZK+Id0eemiJw5a8Upfi0KPlIH2
 HiryWn7Dkukw==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="226674750"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="226674750"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 04:56:00 -0700
IronPort-SDR: 4HvAtng04rI4EJIc41e55QWKIaW7jQqGvhjYUtLTF0hdMxIBFL6IQ5+7pimANgYAGLEbf4SHuB
 XVJpwNFOA9Qw==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="402663181"
Received: from jwalsh5-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.28.33])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2021 04:55:57 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <548dd463-3942-00a1-85c3-232897dea1a3@canonical.com>
References: <548dd463-3942-00a1-85c3-232897dea1a3@canonical.com>
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: Computation of return value being discarded in get_cpu_power() in drivers/platform/x86/intel_ips.c
Cc:     platform-driver-x86@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
To:     "Hans de Goede" <hdegoede@redhat.com>,
        Colin Ian King <colin.king@canonical.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Jesse Barnes <jsbarnes@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <162332615476.15946.17135355064135638083@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date:   Thu, 10 Jun 2021 14:55:54 +0300
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

(Address for Hans was corrupt in previous message, which confused my mail
client. Sorry for duplicate message, the other is without From: field).

+ Jesse

Quoting Colin Ian King (2021-06-09 14:50:07)
> Hi,
> 
> I was reviewing some old unassigned variable warnings from static
> analysis by Coverity and found an issue introduced with the following
> commit:
> 
> commit aa7ffc01d254c91a36bf854d57a14049c6134c72
> Author: Jesse Barnes <jbarnes@virtuousgeek.org>
> Date:   Fri May 14 15:41:14 2010 -0700
> 
>     x86 platform driver: intelligent power sharing driver
> 
> The analysis is as follows:
> 
> drivers/platform/x86/intel_ips.c
> 
>  871 static u32 get_cpu_power(struct ips_driver *ips, u32 *last, int period)
>  872 {
>  873        u32 val;
>  874        u32 ret;
>  875
>  876        /*
>  877         * CEC is in joules/65535.  Take difference over time to
>  878         * get watts.
>  879         */
>  880        val = thm_readl(THM_CEC);
>  881
>  882        /* period is in ms and we want mW */
>  883        ret = (((val - *last) * 1000) / period);
> 
> Unused value (UNUSED_VALUE)
> assigned_value:  Assigning value from ret * 1000U / 65535U to ret here,
> but that stored value is not used.
> 
>  884        ret = (ret * 1000) / 65535;
>  885        *last = val;
>  886
>  887        return 0;
>  888 }
> 
> I'm really not sure why ret is being calculated on lines 883,884 and not
> being used. Should that be *last = ret on line 885? Looks suspect anyhow.

According to git blame code seems to have been disabled intentionally by the
following commit:
  
commit 96f3823f537088c13735cfdfbf284436c802352a
Author: Jesse Barnes <jbarnes@virtuousgeek.org>
Date:   Tue Oct 5 14:50:59 2010 -0400
  
    [PATCH 2/2] IPS driver: disable CPU turbo
  
    The undocumented interface we're using for reading CPU power seems to be
    overreporting power.  Until we figure out how to correct it, disable CPU
    turbo and power reporting to be safe.  This will keep the CPU within default
    limits and still allow us to increase GPU frequency as needed.
  
Maybe wrap the code after thm_readl() in #if 0 in case somebody ends up
wanting to fix it? Or eliminate completely.
  
In theory the thm_readl() may affect the system behavior so would not
remove that for extra paranoia.
  
Regards, Joonas

> Colin
> 
> 
