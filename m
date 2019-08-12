Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3849E8A403
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2019 19:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbfHLRHg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Aug 2019 13:07:36 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50261 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfHLRHg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Aug 2019 13:07:36 -0400
Received: by mail-wm1-f68.google.com with SMTP id v15so246677wml.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2019 10:07:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Lzv8eBCo6LImFXfxnZNOb9oYvD4Ap3KUOKVwLMaQDBs=;
        b=QdC9054T5jeuf1KHJ+RRWprozgflsBGCN4r1yNmVjmwqJttALvvllE/Bd221+j1Tpl
         IqU45UQQSMetoxAoYUJBxvwp8IEqRnW8VKGyQHs1uQ3r9AeZ7Yv27A4+5oSGQ7JbUDqh
         0UkL6i8PrL/V5DZv4GKGV9U8SDFcD+HNbpX/yG5/wWjB+baokcGvwoHd55jBcpeSuJfl
         XhaAC+yhZiDCoQhlXx83l3uiCilUxId4dqhfzP6j0pzFWZhXjMEQ4BOoOd7cZgRRLXoq
         Xr4qdQKjRqIzRhZ5T3lixQy22A/vuhePmjmGr06X7GtF2B2U47r7GvSp6Li7hOOzNme8
         TaTg==
X-Gm-Message-State: APjAAAWTZ3XnNNuQlFqVCv/zmavOT0vT9V+kOCYuN6Zqyu4mdKq9bgaG
        6h3DbyRq8i4OXcimN+CJZvWAkw==
X-Google-Smtp-Source: APXvYqyiY/SH7PZZiv3nxN6ZBWc5j9vuVnxDuQZDd4TkSiEZKjsjlrvItaE42bQkVyTuEIpmy82kDg==
X-Received: by 2002:a1c:9648:: with SMTP id y69mr306486wmd.122.1565629654158;
        Mon, 12 Aug 2019 10:07:34 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id h12sm11276741wrq.73.2019.08.12.10.07.32
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 10:07:33 -0700 (PDT)
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to microUSB
 and TypeC variants
To:     Yauhen Kharuzhy <jekhor@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
Message-ID: <73b283c9-bbfc-2c43-1cb0-ca0a245593c4@redhat.com>
Date:   Mon, 12 Aug 2019 19:07:32 +0200
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

One more remark inline.

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

> diff --git a/drivers/platform/x86/intel_cht_int33fe_musb.c b/drivers/platform/x86/intel_cht_int33fe_musb.c
> new file mode 100644
> index 000000000000..49a8d34ac666
> --- /dev/null
> +++ b/drivers/platform/x86/intel_cht_int33fe_musb.c
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel Cherry Trail ACPI INT33FE pseudo device driver for devices with
> + * microUSB connector (e.g. without of FUSB302 USB Type-C controller)
> + *
> + * Copyright (C) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
> + *
> + * At least one Intel Cherry Trail based device which ship with Windows 10
> + * (Lenovo YogaBook YB1-X91L/F tablet), have this weird INT33FE ACPI device
> + * with a CRS table with 2 I2cSerialBusV2 resources, for 2 different chips
> + * attached to various i2c busses:
> + * 1. The Whiskey Cove pmic, which is also described by the INT34D3 ACPI device
> + * 2. TI BQ27542 Fuel Gauge Controller
> + *
> + * So this driver is a stub / pseudo driver whose only purpose is to
> + * instantiate i2c-client for battery fuel gauge, so that standard i2c driver
> + * for these chip can bind to the it.
> + */
> +
> +#define DEBUG
> +
> +#include <linux/acpi.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +#include <linux/usb/pd.h>
> +
> +#include "intel_cht_int33fe_common.h"
> +
> +struct cht_int33fe_data {
> +	struct i2c_client *battery_fg;
> +};
> +
> +static const char * const bq27xxx_suppliers[] = { "bq25890-charger" };
> +
> +static const struct property_entry bq27xxx_props[] = {
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27xxx_suppliers),
> +	{ }
> +};
> +
> +static int cht_int33fe_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct i2c_board_info board_info;
> +	struct cht_int33fe_data *data;
> +	int ret;
> +
> +	ret = cht_int33fe_check_hw_compatible(dev, INT33FE_HW_MUSB);
> +	if (ret < 0)
> +		return ret;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	memset(&board_info, 0, sizeof(board_info));
> +	stracpy(board_info.type, "bq27542");

stracpy ? that does not compile for me, normally you would use:

         strlcpy(board_info.type, "bq27542", I2C_NAME_SIZE);

here, I've used this for my testing.

> +	board_info.dev_name = "bq27542";
> +	board_info.properties = bq27xxx_props;
> +	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
> +
> +	if (IS_ERR(data->battery_fg)) {
> +		dev_err(dev, "Failed to register battery fuel gauge: %ld\n",
> +			PTR_ERR(data->battery_fg));
> +		return PTR_ERR(data->battery_fg);
> +	}
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	return 0;
> +}

<snip>

With that fixed, I can confirm that everything still works as it should on a
device which uses this driver combined with a Type-C connector.

Regards,

Hans
