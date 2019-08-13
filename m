Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 222CD8B2C5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 13 Aug 2019 10:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfHMIoj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 13 Aug 2019 04:44:39 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40495 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbfHMIoj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Aug 2019 04:44:39 -0400
Received: by mail-ed1-f65.google.com with SMTP id h8so18076469edv.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 Aug 2019 01:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=r9PW4YFGMJVSTAt9dAtACKAg1TawK+0LXcHryi1J7HQ=;
        b=JOaz2ub2yr5xM6ABD6xxP7P5WDO0hJ+33U2YEi37DDoR0OTq5DU7gO9XC6I0qXB20S
         Er91hXn/NNtb2Qv7MWV4m69KFnAPU+WH+hSD5Zg2wXpMJDwHthUKCWcTNDEpjijE4vXP
         lNasmCUWq7TkkI0ykkKodEABbjsI4fxP7nhFbDsFQXzPirRTcvR1/Tw+duOACzqZRMpN
         dulIWkugv7dfaU9skv6d+uhTdzXku+pZ5ofoBQtHUxpQ5LRhcty58qulTWBq7/VSLX0i
         /2vjaNUwclyGEKX3yz13ukkkPJfB6bKKOyIHZetVSCgMYrUrPl9DLxt+LvLECXFBM9T9
         xAgg==
X-Gm-Message-State: APjAAAVMi6ZszsUcfU3gupyjtN2rZVCUyI6cdJRNgmksd42FBV0i0kDo
        XvN2k4ksXRspUO9XeSOG3zvSrZRGLoY=
X-Google-Smtp-Source: APXvYqxnAputKG3FLSYJ07r7/EFPT40PjRg1S3LuOfoqbMrN8Hfc+o6bdcOPM24nlwDnNbqGYwSC3Q==
X-Received: by 2002:a17:906:3518:: with SMTP id r24mr15473242eja.133.1565685877242;
        Tue, 13 Aug 2019 01:44:37 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id p20sm1187675eja.59.2019.08.13.01.44.36
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Aug 2019 01:44:36 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to microUSB
 and TypeC variants
To:     Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
Message-ID: <3387c6f0-5b25-a6ff-3c83-052ba75b5e54@redhat.com>
Date:   Tue, 13 Aug 2019 10:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808215559.2029-2-jekhor@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

One more remark to fix in v3 below:

On 8/8/19 11:55 PM, Yauhen Kharuzhy wrote:
> Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> hardware has TypeC connector and register related devices described as
> I2C connections in the _CRS resource.
> 
> There at least one hardware (Lenovo Yoga Book YB1-91L/F) with microUSB
> connector exists. It has INT33FE device in the DSDT table but there are
> only two I2C connection described: PMIC and BQ27452 battery fuel gauge.
> 
> Splitting existing INT33FE driver allow to maintain code for microUSB
> variant separately and make it simpler.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---

<snip>

> diff --git a/drivers/platform/x86/intel_cht_int33fe_common.c b/drivers/platform/x86/intel_cht_int33fe_common.c
> new file mode 100644
> index 000000000000..91c1b599dda8
> --- /dev/null
> +++ b/drivers/platform/x86/intel_cht_int33fe_common.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Common code for Intel Cherry Trail ACPI INT33FE pseudo device drivers
> + * (microUSB and TypeC connector variants)
> + *
> + * Copyright (c) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +
> +#include "intel_cht_int33fe_common.h"
> +
> +#define EXPECTED_PTYPE		4
> +
> +static int cht_int33fe_i2c_res_filter(struct acpi_resource *ares, void *data)
> +{
> +	struct acpi_resource_i2c_serialbus *sb;
> +	int *count = data;
> +
> +	if (i2c_acpi_get_i2c_resource(ares, &sb))
> +		(*count)++;
> +
> +	return 1;
> +}
> +
> +static int cht_int33fe_count_i2c_clients(struct device *dev)
> +{
> +	struct acpi_device *adev;
> +	LIST_HEAD(resource_list);
> +	int count = 0;
> +
> +	adev = ACPI_COMPANION(dev);
> +	if (!adev)
> +		return -EINVAL;
> +
> +	acpi_dev_get_resources(adev, &resource_list,
> +			       cht_int33fe_i2c_res_filter, &count);
> +
> +	acpi_dev_free_resource_list(&resource_list);
> +
> +	return count;
> +}
> +
> +int cht_int33fe_check_hw_compatible(struct device *dev,
> +				    enum int33fe_hw_type hw_type)
> +{
> +	unsigned long long ptyp;
> +	acpi_status status;
> +	int i2c_expected;
> +	int ret;
> +
> +	i2c_expected = (hw_type == INT33FE_HW_TYPEC) ? 4 : 2;
> +
> +	status = acpi_evaluate_integer(ACPI_HANDLE(dev), "PTYP", NULL, &ptyp);
> +	if (ACPI_FAILURE(status)) {
> +		dev_err(dev, "Error getting PTYPE\n");
> +		return -ENODEV;
> +	}
> +
> +	/*
> +	 * The same ACPI HID is used for different configurations check PTYP
> +	 * to ensure that we are dealing with the expected config.
> +	 */
> +	if (ptyp != EXPECTED_PTYPE)
> +		return -ENODEV;
> +
> +	/* Check presence of INT34D3 (hardware-rev 3) expected for ptype == 4 */
> +	if (!acpi_dev_present("INT34D3", "1", 3)) {
> +		dev_err(dev, "Error PTYPE == %d, but no INT34D3 device\n",
> +			EXPECTED_PTYPE);
> +		return -ENODEV;
> +	}
> +
> +	ret = cht_int33fe_count_i2c_clients(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret != i2c_expected) {
> +		dev_info(dev, "I2C clients count (%d) is not %d, ignore (probably %s hardware)",
> +			 ret, i2c_expected,
> +			 (hw_type == INT33FE_HW_TYPEC) ? "microUSB" : "Type C");

The intel_cht_int33fe_typec driver returns -EPROBE_DEFER in various places and now
this dev_info will get printed for each probe attempt, until all the other drivers
this depends on have been loaded and the probe succeeds. On one of my TypeC systems
this message gets printed 28 times! :

[hans@shalem ~]$ dmesg | grep "I2C clients count" | wc -l
28

Please change this to a dev_dbg

Regards,

Hans

