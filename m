Return-Path: <platform-driver-x86+bounces-47-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F269B7F6FDE
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 10:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7801AB20E65
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 09:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA28156F8;
	Fri, 24 Nov 2023 09:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+qRxnI1"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A41AED46;
	Fri, 24 Nov 2023 01:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700818314; x=1732354314;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=//oUXD9WMGcG6hQPFhgCT7QH/7I5uRzXFCu5VGSZo3M=;
  b=Y+qRxnI1e3hbthuxPdrdGhCO5b660cGM7iGuFz0QjxMtLJ4Lst5o/+qj
   X/pLjuEb3vWqEm1ItAAcclisJePmsMYm46VHKPCu3n3azf51bWqQydKqB
   E0aaFxZAM1JYro3258mFR3Pc7bKoPiKm7G9k37O+y95jqWZox6pY3qEBo
   LA5CxSGDluZGlIFkDS7d6v2Y79e7B+tZP5dHhbK1KsqaF48xtkwrSU6yD
   Tv5uyvQPPijsYbTTbASjd6c4YpdO1UUVIhLKpXU2MMUbZ5TGJmKXFFtZ5
   0Esjab3yhmL6G2pNDAClWuJtn5bUdaAsNUPwCKU/JhCyhzJnbVYoRP4M2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="371749822"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="371749822"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 01:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="838034977"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="838034977"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga004.fm.intel.com with SMTP; 24 Nov 2023 01:31:49 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 24 Nov 2023 11:31:48 +0200
Date: Fri, 24 Nov 2023 11:31:48 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Mark Gross <markgross@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: tcpm: Parse Accessory Mode information
Message-ID: <ZWBthDmFIKK3IvGq@kuha.fi.intel.com>
References: <20231121202925.2481471-1-dmitry.baryshkov@linaro.org>
 <20231121202925.2481471-3-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121202925.2481471-3-dmitry.baryshkov@linaro.org>

On Tue, Nov 21, 2023 at 10:27:00PM +0200, Dmitry Baryshkov wrote:
> Some of the boards supported by the TCPM drivers can support USB-C
> Accessory Modes (Analog Audio, Debug). Parse information about supported
> modes from the device tree.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 6e843c511b85..ba2926846269 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -6114,6 +6114,7 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  {
>  	const char *opmode_str;
>  	int ret;
> +	int mode;
>  	u32 mw, frs_current;
>  
>  	if (!fwnode)
> @@ -6132,6 +6133,14 @@ static int tcpm_fw_get_caps(struct tcpm_port *port,
>  	if (ret < 0)
>  		return ret;
>  
> +	mode = 0;
> +
> +	if (fwnode_property_read_bool(fwnode, "accessory-mode-audio"))
> +		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_AUDIO;
> +
> +	if (fwnode_property_read_bool(fwnode, "accessory-mode-debug"))
> +		port->typec_caps.accessory[mode++] = TYPEC_ACCESSORY_DEBUG;
> +
>  	port->port_type = port->typec_caps.type;
>  	port->pd_supported = !fwnode_property_read_bool(fwnode, "pd-disable");
>  
> -- 
> 2.42.0

-- 
heikki

