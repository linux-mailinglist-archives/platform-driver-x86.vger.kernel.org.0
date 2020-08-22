Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A0F24E6C9
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Aug 2020 11:56:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgHVJ4f (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 22 Aug 2020 05:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbgHVJ4e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Aug 2020 05:56:34 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6025AC061574
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2020 02:56:34 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x25so2293142pff.4
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Aug 2020 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l7aXGPl3X/xYs2Q5GHfUvsQEQDqjScmIL2WkfrO0/J8=;
        b=W8f//rSHBcdDDAsG8jkW4n1pEPAn1sCr5nT9WKxAhYBi0vghHRt9UfcuHgFpsACI5U
         C+z3wyhYGlhD9oeb4NKk28esSNgGE1m8J27cZUHtOD3HjttEpDu2TeIDuaAkeGDJOIXe
         miAifO1v8Sg8eQJdQKLA6W26EUxo1pVleApV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l7aXGPl3X/xYs2Q5GHfUvsQEQDqjScmIL2WkfrO0/J8=;
        b=cDAMc7vW4ssbisnm4cVFpIyDaE/gzZtjU8/W8kT+xMBtaH2htfJd+/Y9vdzbH0/SBB
         dp6DUN90gI82jMZDMnT/wLVrGuXnWk1rXwj5YjpGn5tTHEibR+bKJZm+8trXyWHHhFYm
         hBNnLcJpMAPt2oO0a7kS+SFiuQ01ucXqp9YpEMyJE/OZxPT1ID8JwacgAf57NZd9iBo7
         5YsxS4jha7giv0Q1zUkFsRZhAoPoHvypjsNRJsvN/gZdwwcpxJLjIXIiDFKNYLDQsVSq
         OU5hLUiBVD4kjfNsOOUC31mrhDKLhxYJ4HL/a20G6sSq9jyoWuD8YkK7i/rDNkbu3J2Q
         1elQ==
X-Gm-Message-State: AOAM531qUOeTIBJnkMxssY3Oa3UERyFhmGYLMO9SNypJT8sXYqiqGak7
        D8U4l3m9lsvSFqDSEE5qxIKv9g==
X-Google-Smtp-Source: ABdhPJypEzdvrBsNRY5wsHrDoJm1bHtjRZ4Qj+zqHGfH90ZVYoUQxjdEVGi8eLw5I6wC8PvJhUxBGA==
X-Received: by 2002:aa7:8a08:: with SMTP id m8mr5770969pfa.135.1598090193532;
        Sat, 22 Aug 2020 02:56:33 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id e23sm4240486pgb.79.2020.08.22.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2020 02:56:32 -0700 (PDT)
Date:   Sat, 22 Aug 2020 02:56:31 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Rajmohan Mani <rajmohan.mani@intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Ayman Bagabas <ayman.bagabas@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jithu Joseph <jithu.joseph@intel.com>,
        =?utf-8?B?Qmxhxb4=?= Hrastnik <blaz@mxxn.io>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, bleung@chromium.org
Subject: Re: [PATCH v2 1/3] platform/x86: Add Intel Input Output Manager
 (IOM) driver
Message-ID: <20200822095631.GB2553024@google.com>
References: <20200822040508.23510-1-rajmohan.mani@intel.com>
 <20200822040508.23510-2-rajmohan.mani@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200822040508.23510-2-rajmohan.mani@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Rajmohan,

On Fri, Aug 21, 2020 at 09:05:06PM -0700, Rajmohan Mani wrote:
> Input Output Manager (IOM) is part of the Tiger Lake SoC that
> configures the Type-C Sub System (TCSS). IOM is a micro controller
> that handles Type-C topology, configuration and PM functions of
> various Type-C devices connected on the platform.
> 
> This driver helps read relevant information such as Type-C port
> status (whether a device is connected to a Type-C port or not) and
> the activity type on the Type-C ports (such as USB, Display Port,
> Thunderbolt), for consumption by other drivers.
> 
> Currently intel_iom_port_status() API is exported by this driver,
> that has information about the Type-C port status and port activity
> type.
> 
> Signed-off-by: Rajmohan Mani <rajmohan.mani@intel.com>
> ---

Perhaps include a version log of changes since v1?
> diff --git a/drivers/platform/x86/intel_iom.c b/drivers/platform/x86/intel_iom.c
> new file mode 100644
> index 000000000000..cda7716410c6
> --- /dev/null
> +++ b/drivers/platform/x86/intel_iom.c
> +int intel_iom_port_status(u8 port, u32 *status)
> +{
> +	void __iomem *reg;
> +
> +	if (!iom || !iom->dev || !iom->regbar)

Do we need to check for !iom->dev and !iom->regbar? Is there a valid
situation where iom != NULL but iom->dev and/or iom->regbar == NULL?
Sounds like it shouldn't, but I may be missing something.

> +		return -ENODEV;
> +
> +	if (!status || (port > IOM_MAX_PORTS - 1))

I think parentheses around "port > IOM_MAX_PORT - 1" aren't required.
> +		return -EINVAL;
> +
> +	reg = iom->regbar + IOM_PORT_STATUS_OFFSET + IOM_REG_LEN * port;
> +
> +	*status = ioread32(reg);

Perhaps just inline reg within the parentheses?
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(intel_iom_port_status);
> +
> +static int intel_iom_probe(struct platform_device *pdev)
> +{
> +	void __iomem *addr;
> +
> +	/* only one IOM device is supported */

Minor nit: s/only/Only
> +	if (iom)
> +		return -EBUSY;
> +
> +	iom = devm_kzalloc(&pdev->dev, sizeof(*iom), GFP_KERNEL);
> +	if (!iom)
> +		return -ENOMEM;
> +
> +	addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +
> +	iom->regbar = addr;
> +	iom->dev = &pdev->dev;
> +
> +	return 0;
> +}
> +
> +static const struct acpi_device_id intel_iom_acpi_ids[] = {
> +	{ "INTC1072" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, intel_iom_acpi_ids);
> +
> +static struct platform_driver intel_iom_driver = {
> +	.probe = intel_iom_probe,

nit: I generally see ".probe" listed below ".driver".
> +	.driver = {
> +		.name = "intel_iom",
> +		.acpi_match_table = intel_iom_acpi_ids,
> +	},
> +};
> +
> +module_platform_driver_probe(intel_iom_driver, intel_iom_probe);
> +
> +MODULE_AUTHOR("Rajmohan Mani <rajmohan.mani@intel.com>");
> +MODULE_DESCRIPTION("Intel IOM driver");
> +MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/platform_data/x86/intel_iom.h b/include/linux/platform_data/x86/intel_iom.h
> new file mode 100644
> index 000000000000..e4c9a305e7a9
> --- /dev/null
> +++ b/include/linux/platform_data/x86/intel_iom.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _PLATFORM_DATA_X86_INTEL_IOM_H_
> +#define _PLATFORM_DATA_X86_INTEL_IOM_H_
> +
> +
> +#define IOM_MAX_PORTS					4
> +/* Register length in bytes */
> +#define IOM_REG_LEN					4

Do these two #define's need to be in the header, instead of directly in
intel_iom.c ?

> +
> +#ifdef CONFIG_ACPI
> +
> +int intel_iom_port_status(u8 port, u32 *status);
> +
> +#else
> +
> +int intel_iom_port_status(struct intel_iom *iom, u8 port, u32 *status)

Should the function signature be the same as the #ifdef case?

Best regards,

-Prashant

