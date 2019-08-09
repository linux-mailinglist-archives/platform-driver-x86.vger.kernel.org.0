Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A02BD87D33
	for <lists+platform-driver-x86@lfdr.de>; Fri,  9 Aug 2019 16:50:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436513AbfHIOu2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 9 Aug 2019 10:50:28 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40121 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfHIOu2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Aug 2019 10:50:28 -0400
Received: by mail-wm1-f65.google.com with SMTP id v19so5865042wmj.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Aug 2019 07:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YwCybFhKUTQ0nw+6+tV6w818sk397qfRzU3+RJ6dIUw=;
        b=uSKh166Pr81pemWcQlAbm3RkJU1USiljHnL63CmTg5fFwdUrW5L9wkcTjsaLcDjvbf
         +BGLsAiYFPFvp8qCzSkxkd2xBLhS8h3ZkoWf/z9hmVQLBmx1oOun/I2gtkyH6QKZkz8i
         uu0ElrQCSuFUndTIKF6WrYb3s2op/DuBJe0XWPhZPQXnjPtUnbK9gS8ttmJio8mygSxj
         E9iG1ADC6FRyffFsFgMA6QmuHCUtUBqALZRIyZ4O0Ob4oU30QcPxdYQnJeaeeQo1EBdh
         TATSCo4dqvnaGCeNFj9zvrs5iBH4KpNm0eqfiChJa0iK6NorHRo6ifo6Ehy+e4lo+56+
         EdYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YwCybFhKUTQ0nw+6+tV6w818sk397qfRzU3+RJ6dIUw=;
        b=G/o5/q7Ov6gBj6/F0bm4td61qAXcFo6wBqKb/FItvEU6GNdmJfW0v71oPllJZcBHGy
         vaibvPlyBC1pEx/spgOnMg5p7zR53H9U5ZTmdk6qNby66/vc3Qo3XLgHvjcxYbckOnI0
         rdJgtjAxchnr/RzjuVhUa0OQiPgT3m0TWxygQ4Ogo45XG796vFAIchQ+ksxr7TjSIDNz
         lxdZ926b6hi4GmtGYveLyyv7SoSpJCJVNCc+9Q7BS7lCFXKsjM3BMkXXHrYMTU25DdUX
         0jlQ1Q37mI1TLi4j4GkBsHLGdqH5F1DSLyXBZII5johk1rDNI4Z5tUau6FDtJBE/aHDh
         DisQ==
X-Gm-Message-State: APjAAAW6NUCzl2NKzUFxQSkF8UFH+hWoekTEPF3zim3iKVIADmw9U/JM
        ssjcdbmkif8GJlEHLMSdX20=
X-Google-Smtp-Source: APXvYqwQHq/4MXMGwCZiI/seusLC2XtYS7wSLrlXk96L3z3gTA5ZwqOuFqj5/RIwNJ3vrQNykBxxGg==
X-Received: by 2002:a7b:c247:: with SMTP id b7mr11788774wmj.13.1565362225489;
        Fri, 09 Aug 2019 07:50:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-vpdn-46-53-207-124.telecom.by. [46.53.207.124])
        by smtp.gmail.com with ESMTPSA id w13sm19425106wre.44.2019.08.09.07.50.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 09 Aug 2019 07:50:24 -0700 (PDT)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
        by localhost.localdomain with esmtp (Exim 4.92)
        (envelope-from <jekhor@gmail.com>)
        id 1hw6Ex-0004mO-Bf; Fri, 09 Aug 2019 17:51:35 +0300
Date:   Fri, 9 Aug 2019 17:51:35 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to
 microUSB and TypeC variants
Message-ID: <20190809145135.GC30248@jeknote.loshitsa1.net>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
 <e7913031-4a0a-bcd9-2149-8e718b876a0e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7913031-4a0a-bcd9-2149-8e718b876a0e@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Aug 09, 2019 at 12:49:27PM +0200, Hans de Goede wrote:
> Hi,
> 
> Overall this looks good, thank you for your work on this.
> 
> I have some small remarks inline / below:
> > +EXPORT_SYMBOL_GPL(cht_int33fe_check_hw_compatible);
> > +
> > +MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver (common part)");
> > +MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
> > +MODULE_LICENSE("GPL v2");
> 
> I see from the Makefile changes that you are linking the common code
> into both intel_cht_int33fe_typec.ko and into intel_cht_int33fe_musb.ko, that is fine
> since it is tiny and not worth the trouble of creating its own .ko file for.

No, this Makefile fragment adds two targets for every config variables,
and intel_cht_int33fe_common.c compiles into one .ko file even if it was
added twice.

> 
> I do wonder what happens if you set the Kconfig value for both modules to Y,
> since that will like put the common code twice in the builtin.a file, I guess / hope
> ar is smart enough to only add it once, but I'm not sure... can you please give
> this a try?

For both Y it should be OK, but for one M and one Y... OK, it need to be
corrected.

> 
> But this does mean that you do not need the EXPORT_SYMBOL_GPL and that the
> MODULE_ macros here will get merged with those from intel_cht_int33fe_typec.c
> and intel_cht_int33fe_musb.c, since these files already have these macros
> I suggest simply dropping the MODuLE_ macro calls here, to avoid having
> 2 descriptions in the resulting modules.

intel_cht_int33fe_common.c is separated module, so this directives are
needed.

> > diff --git a/drivers/platform/x86/intel_cht_int33fe_musb.c b/drivers/platform/x86/intel_cht_int33fe_musb.c
> > new file mode 100644
> > index 000000000000..49a8d34ac666
> > --- /dev/null
> > +++ b/drivers/platform/x86/intel_cht_int33fe_musb.c
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Intel Cherry Trail ACPI INT33FE pseudo device driver for devices with
> > + * microUSB connector (e.g. without of FUSB302 USB Type-C controller)
> > + *
> > + * Copyright (C) 2019 Yauhen Kharuzhy <jekhor@gmail.com>
> > + *
> > + * At least one Intel Cherry Trail based device which ship with Windows 10
> > + * (Lenovo YogaBook YB1-X91L/F tablet), have this weird INT33FE ACPI device
> > + * with a CRS table with 2 I2cSerialBusV2 resources, for 2 different chips
> > + * attached to various i2c busses:
> > + * 1. The Whiskey Cove pmic, which is also described by the INT34D3 ACPI device
> > + * 2. TI BQ27542 Fuel Gauge Controller
> > + *
> > + * So this driver is a stub / pseudo driver whose only purpose is to
> > + * instantiate i2c-client for battery fuel gauge, so that standard i2c driver
> > + * for these chip can bind to the it.
> > + */
> > +
> > +#define DEBUG
> 
> It looks like you forgot to drop this, please drop it for the next version.

sure.

> 
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/i2c.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/pci.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regulator/consumer.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb/pd.h>
> > +
> > +#include "intel_cht_int33fe_common.h"
> > +
> > +struct cht_int33fe_data {
> > +	struct i2c_client *battery_fg;
> > +};
> > +
> > +static const char * const bq27xxx_suppliers[] = { "bq25890-charger" };
> > +
> > +static const struct property_entry bq27xxx_props[] = {
> > +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq27xxx_suppliers),
> > +	{ }
> > +};
> > +
> > +static int cht_int33fe_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct i2c_board_info board_info;
> > +	struct cht_int33fe_data *data;
> > +	int ret;
> > +
> > +	ret = cht_int33fe_check_hw_compatible(dev, INT33FE_HW_MUSB);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	memset(&board_info, 0, sizeof(board_info));
> > +	stracpy(board_info.type, "bq27542");
> > +	board_info.dev_name = "bq27542";
> > +	board_info.properties = bq27xxx_props;
> > +	data->battery_fg = i2c_acpi_new_device(dev, 1, &board_info);
> > +
> > +	if (IS_ERR(data->battery_fg)) {
> > +		dev_err(dev, "Failed to register battery fuel gauge: %ld\n",
> > +			PTR_ERR(data->battery_fg));
> > +		return PTR_ERR(data->battery_fg);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, data);
> > +
> > +	return 0;
> > +}
> > +
> > +static int cht_int33fe_remove(struct platform_device *pdev)
> > +{
> > +	struct cht_int33fe_data *data = platform_get_drvdata(pdev);
> > +
> > +	i2c_unregister_device(data->battery_fg);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct acpi_device_id cht_int33fe_acpi_ids[] = {
> > +	{ "INT33FE", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(acpi, cht_int33fe_acpi_ids);
> > +
> > +static struct platform_driver cht_int33fe_driver = {
> > +	.driver	= {
> > +		.name = "Intel Cherry Trail ACPI INT33FE mUSB driver",
> > +		.acpi_match_table = ACPI_PTR(cht_int33fe_acpi_ids),
> > +	},
> > +	.probe = cht_int33fe_probe,
> > +	.remove = cht_int33fe_remove,
> > +};
> > +
> > +module_platform_driver(cht_int33fe_driver);
> > +
> > +MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver (microUSB conn)");
> > +MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/drivers/platform/x86/intel_cht_int33fe.c b/drivers/platform/x86/intel_cht_int33fe_typec.c
> > similarity index 94%
> > rename from drivers/platform/x86/intel_cht_int33fe.c
> > rename to drivers/platform/x86/intel_cht_int33fe_typec.c
> > index 4fbdff48a4b5..6444d0673bef 100644
> > --- a/drivers/platform/x86/intel_cht_int33fe.c
> > +++ b/drivers/platform/x86/intel_cht_int33fe_typec.c
> > @@ -27,7 +27,7 @@
> >   #include <linux/slab.h>
> >   #include <linux/usb/pd.h>
> > -#define EXPECTED_PTYPE		4
> > +#include "intel_cht_int33fe_common.h"
> >   enum {
> >   	INT33FE_NODE_FUSB302,
> > @@ -300,30 +300,12 @@ static int cht_int33fe_probe(struct platform_device *pdev)
> >   	struct cht_int33fe_data *data;
> >   	struct fwnode_handle *fwnode;
> >   	struct regulator *regulator;
> > -	unsigned long long ptyp;
> > -	acpi_status status;
> >   	int fusb302_irq;
> >   	int ret;
> > -	status = acpi_evaluate_integer(ACPI_HANDLE(dev), "PTYP", NULL, &ptyp);
> > -	if (ACPI_FAILURE(status)) {
> > -		dev_err(dev, "Error getting PTYPE\n");
> > -		return -ENODEV;
> > -	}
> > -
> > -	/*
> > -	 * The same ACPI HID is used for different configurations check PTYP
> > -	 * to ensure that we are dealing with the expected config.
> > -	 */
> > -	if (ptyp != EXPECTED_PTYPE)
> > -		return -ENODEV;
> > -
> > -	/* Check presence of INT34D3 (hardware-rev 3) expected for ptype == 4 */
> > -	if (!acpi_dev_present("INT34D3", "1", 3)) {
> > -		dev_err(dev, "Error PTYPE == %d, but no INT34D3 device\n",
> > -			EXPECTED_PTYPE);
> > -		return -ENODEV;
> > -	}
> > +	ret = cht_int33fe_check_hw_compatible(dev, INT33FE_HW_TYPEC);
> > +	if (ret < 0)
> > +		return ret;
> >   	/*
> >   	 * We expect the WC PMIC to be paired with a TI bq24292i charger-IC.
> > 
> 
> Tomorrow I will try to make some time to give this a test-run on one of me devices
> which use this driver with typec connector and verify that it does not cause any
> regressions there.

OK, I don't have TypeC HW, so I will wait before sending next iteration.


-- 
Yauhen Kharuzhy
