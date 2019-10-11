Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4F3D43CC
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Oct 2019 17:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727714AbfJKPHc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Oct 2019 11:07:32 -0400
Received: from mga07.intel.com ([134.134.136.100]:59762 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726332AbfJKPHb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Oct 2019 11:07:31 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 11 Oct 2019 08:07:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,284,1566889200"; 
   d="scan'208";a="207444150"
Received: from kuha.fi.intel.com ([10.237.72.53])
  by fmsmga001.fm.intel.com with SMTP; 11 Oct 2019 08:07:28 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 11 Oct 2019 18:07:28 +0300
Date:   Fri, 11 Oct 2019 18:07:27 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v1] platform/x86: i2c-multi-instantiate: Fail the probe
 if no IRQ provided
Message-ID: <20191011150727.GC32191@kuha.fi.intel.com>
References: <20191011144712.32766-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011144712.32766-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Oct 11, 2019 at 05:47:12PM +0300, Andy Shevchenko wrote:
> For APIC case of interrupt we don't fail a ->probe() of the driver,
> which makes kernel to print a lot of warnings from the children.
> 
> We have two options here:
> - switch to platform_get_irq_optional(), though it won't stop children
>   to be probed and failed
> - fail the ->probe() of i2c-multi-instantiate
> 
> Since the in reality we never had devices in the wild where IRQ resource
> is optional, the latter solution suits the best.
> 
> Fixes: 799d3379a672 ("platform/x86: i2c-multi-instantiate: Introduce IOAPIC IRQ support")
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/platform/x86/i2c-multi-instantiate.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index ea68f6ed66ae..ffb8d5d1eb5f 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -108,6 +108,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>  			if (ret < 0) {
>  				dev_dbg(dev, "Error requesting irq at index %d: %d\n",
>  					inst_data[i].irq_idx, ret);
> +				goto error;
>  			}
>  			board_info.irq = ret;
>  			break;
> -- 
> 2.23.0

thanks,

-- 
heikki
