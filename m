Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3728B434E16
	for <lists+platform-driver-x86@lfdr.de>; Wed, 20 Oct 2021 16:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbhJTOmM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 20 Oct 2021 10:42:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44650 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229639AbhJTOmL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Oct 2021 10:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634740797;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jEmoj0pmD3P9WCH1oAICo4Le6YRTfWi88s40buVzYhY=;
        b=chupBgtnTfC6pVHjEt7yIQudwnOP/dn042f2Wd/Ka9hahZsLWqSFGjgFfPj/B8c3/6KnN6
        Mf7NBxVr4Z64YuNSXVSpW6FSadllK71V7nn9SM/qEqIRC1On0iTSIzdbn8YC2kJ9W21UkK
        Ff3QZie6Vva2nxgp6+rRZl+XhR86u5k=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-vmf2zQlAN6S289erUEDhdA-1; Wed, 20 Oct 2021 10:39:55 -0400
X-MC-Unique: vmf2zQlAN6S289erUEDhdA-1
Received: by mail-ed1-f71.google.com with SMTP id x5-20020a50f185000000b003db0f796903so21205463edl.18
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Oct 2021 07:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=jEmoj0pmD3P9WCH1oAICo4Le6YRTfWi88s40buVzYhY=;
        b=zOvEdCC8TDGpmJXDMuQjuajXiJpVdZBQqOox4K80xomciqipaxikqrePJTVmkxtM0M
         lwyKdbccoU+rVHBq8trn/TflYFhqibrs9YqSSPJIj3LKcFDRGdYKvSZp1mlSyi8zsMnz
         K9d3ZPRRwSML+SUySJS+hOsQ8b/SFYYHY3CtwRJJfLqps+wcPsj8WbaY1bzbVFQOu0IT
         dICeolIEVCBrekccCJxQdwLUKYsWpHdxLKcXuyM1HXpHZtNzT0z/dvf6RJI/r1gMDWpL
         jGCp1e7mwf0tem+vFlnyrWzDdKOmjUj3qAxAne3ns1BbU3s+9XkMvLY8DS6l8Oi5jMfU
         bKbg==
X-Gm-Message-State: AOAM533h9oSZAZQ4/YyLHhnMovaXf36+XlwKyvxfRktEiJ4Dy5mo5hlE
        L0STwuejXVPHsvr5E6LTOb6n82VPXGyR9GD2GoXTt5mDZsEsRo5FTldwJkfI7EwC8dyskcysC4B
        3StfmrV+Q+HMFnarbCxa8fBYUHO/9A8h/Ug==
X-Received: by 2002:a05:6402:5186:: with SMTP id q6mr483761edd.340.1634740794205;
        Wed, 20 Oct 2021 07:39:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsnrPSOF+zSAUHZCYz8Q8/l+jGY6MhJ3ypGlW07f0s8ZmW54CV9ceoBG9Yv7ceEHmIoORRpg==
X-Received: by 2002:a05:6402:5186:: with SMTP id q6mr483715edd.340.1634740793906;
        Wed, 20 Oct 2021 07:39:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id hp3sm755271ejc.61.2021.10.20.07.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Oct 2021 07:39:53 -0700 (PDT)
Message-ID: <150f27d2-32b9-403b-01ff-8ab7d971d1d1@redhat.com>
Date:   Wed, 20 Oct 2021 16:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2] platform/x86: Support for EC-connected GPIOs for
 identify LED/button on Barco P50 board
Content-Language: en-US
To:     Peter Korsgaard <peter@korsgaard.com>,
        platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com,
        Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
References: <20211013140356.6235-1-santoshkumar.yadav@barco.com>
 <20211020123634.2638-1-peter@korsgaard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211020123634.2638-1-peter@korsgaard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/20/21 14:36, Peter Korsgaard wrote:
> From: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
> 
> Add a driver providing access to the GPIOs for the identify button and led
> present on Barco P50 board, based on the pcengines-apuv2.c driver.
> 
> There is unfortunately no suitable ACPI entry for the EC communication
> interface, so instead bind to boards with "P50" as their DMI product family
> and hard code the I/O port number (0x299).
> 
> The driver also hooks up the leds-gpio and gpio-keys-polled drivers to the
> GPIOs, so they are finally exposed as:
> 
> LED:
> /sys/class/leds/identify
> 
> Button: (/proc/bus/input/devices)
> I: Bus=0019 Vendor=0001 Product=0001 Version=0100
> N: Name="identify"
> P: Phys=gpio-keys-polled/input0
> S: Sysfs=/devices/platform/barco-p50-gpio/gpio-keys-polled/input/input10
> U: Uniq=
> H: Handlers=event10
> B: PROP=0
> B: EV=3
> B: KEY=1000000 0 0 0 0 0 0
> 
> Signed-off-by: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
> v2: Match on DMI vendor as well, add module table, drop softdeps

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
>  MAINTAINERS                           |   6 +
>  drivers/platform/x86/Kconfig          |  10 +
>  drivers/platform/x86/Makefile         |   3 +
>  drivers/platform/x86/barco-p50-gpio.c | 436 ++++++++++++++++++++++++++
>  4 files changed, 455 insertions(+)
>  create mode 100644 drivers/platform/x86/barco-p50-gpio.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d118d7957d2..60980f7cc29a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3220,6 +3220,12 @@ F:	drivers/video/backlight/
>  F:	include/linux/backlight.h
>  F:	include/linux/pwm_backlight.h
>  
> +BARCO P50 GPIO DRIVER
> +M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
> +M:	Peter Korsgaard <peter.korsgaard@barco.com>
> +S:	Maintained
> +F:	drivers/platform/x86/barco-p50-gpio.c
> +
>  BATMAN ADVANCED
>  M:	Marek Lindner <mareklindner@neomailbox.ch>
>  M:	Simon Wunderlich <sw@simonwunderlich.de>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e21ea3d23e6f..42b4895e4acc 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -713,6 +713,16 @@ config PCENGINES_APU2
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called pcengines-apuv2.
>  
> +config BARCO_P50_GPIO
> +	tristate "Barco P50 GPIO driver for identify LED/button"
> +	depends on GPIOLIB
> +	help
> +	  This driver provides access to the GPIOs for the identify button
> +	  and led present on Barco P50 board.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called barco-p50-gpio.
> +
>  config SAMSUNG_LAPTOP
>  	tristate "Samsung Laptop driver"
>  	depends on RFKILL || RFKILL = n
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 69690e26bb6d..931dc55f6f3e 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -80,6 +80,9 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
>  # PC Engines
>  obj-$(CONFIG_PCENGINES_APU2)	+= pcengines-apuv2.o
>  
> +# Barco
> +obj-$(CONFIG_BARCO_P50_GPIO)	+= barco-p50-gpio.o
> +
>  # Samsung
>  obj-$(CONFIG_SAMSUNG_LAPTOP)	+= samsung-laptop.o
>  obj-$(CONFIG_SAMSUNG_Q10)	+= samsung-q10.o
> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
> new file mode 100644
> index 000000000000..ca0b2564c407
> --- /dev/null
> +++ b/drivers/platform/x86/barco-p50-gpio.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Support for EC-connected GPIOs for identify
> + * LED/button on Barco P50 board
> + *
> + * Copyright (C) 2021 Barco NV
> + * Author: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
> + */
> +
> +#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
> +
> +#include <linux/io.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/gpio_keys.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/input.h>
> +
> +
> +#define DRIVER_NAME		"barco-p50-gpio"
> +
> +/* GPIO lines */
> +#define P50_GPIO_LINE_LED	0
> +#define P50_GPIO_LINE_BTN	1
> +
> +/* GPIO IO Ports */
> +#define P50_GPIO_IO_PORT_BASE	0x299
> +
> +#define P50_PORT_DATA		0x00
> +#define P50_PORT_CMD		0x01
> +
> +#define P50_STATUS_OBF		0x01 /* EC output buffer full */
> +#define P50_STATUS_IBF		0x02 /* EC input buffer full */
> +
> +#define P50_CMD_READ		0xa0
> +#define P50_CMD_WRITE		0x50
> +
> +/* EC mailbox registers */
> +#define P50_MBOX_REG_CMD	0x00
> +#define P50_MBOX_REG_STATUS	0x01
> +#define P50_MBOX_REG_PARAM	0x02
> +#define P50_MBOX_REG_DATA	0x03
> +
> +#define P50_MBOX_CMD_READ_GPIO	0x11
> +#define P50_MBOX_CMD_WRITE_GPIO	0x12
> +#define P50_MBOX_CMD_CLEAR	0xff
> +
> +#define P50_MBOX_STATUS_SUCCESS	0x01
> +
> +#define P50_MBOX_PARAM_LED	0x12
> +#define P50_MBOX_PARAM_BTN	0x13
> +
> +
> +struct p50_gpio {
> +	struct gpio_chip gc;
> +	struct mutex lock;
> +	unsigned long base;
> +	struct platform_device *leds_pdev;
> +	struct platform_device *keys_pdev;
> +};
> +
> +static struct platform_device *gpio_pdev;
> +
> +static int gpio_params[] = {
> +	[P50_GPIO_LINE_LED] = P50_MBOX_PARAM_LED,
> +	[P50_GPIO_LINE_BTN] = P50_MBOX_PARAM_BTN,
> +};
> +
> +static const char * const gpio_names[] = {
> +	[P50_GPIO_LINE_LED] = "identify-led",
> +	[P50_GPIO_LINE_BTN] = "identify-button",
> +};
> +
> +
> +static struct gpiod_lookup_table p50_gpio_led_table = {
> +	.dev_id = "leds-gpio",
> +	.table = {
> +		GPIO_LOOKUP_IDX(DRIVER_NAME, P50_GPIO_LINE_LED, NULL, 0, GPIO_ACTIVE_HIGH),
> +		{}
> +	}
> +};
> +
> +/* GPIO LEDs */
> +static struct gpio_led leds[] = {
> +	{ .name = "identify" }
> +};
> +
> +static struct gpio_led_platform_data leds_pdata = {
> +	.num_leds = ARRAY_SIZE(leds),
> +	.leds = leds,
> +};
> +
> +/* GPIO keyboard */
> +static struct gpio_keys_button buttons[] = {
> +	{
> +		.code = KEY_RESTART,
> +		.gpio = P50_GPIO_LINE_BTN,
> +		.active_low = 1,
> +		.type = EV_KEY,
> +		.value = 1,
> +	},
> +};
> +
> +static struct gpio_keys_platform_data keys_pdata = {
> +	.buttons = buttons,
> +	.nbuttons = ARRAY_SIZE(buttons),
> +	.poll_interval = 100,
> +	.rep = 0,
> +	.name = "identify",
> +};
> +
> +
> +/* low level access routines */
> +
> +static int p50_wait_ec(struct p50_gpio *p50, int mask, int expected)
> +{
> +	int i, val;
> +
> +	for (i = 0; i < 100; i++) {
> +		val = inb(p50->base + P50_PORT_CMD) & mask;
> +		if (val == expected)
> +			return 0;
> +		usleep_range(500, 2000);
> +	}
> +
> +	dev_err(p50->gc.parent, "Timed out waiting for EC (0x%x)\n", val);
> +	return -ETIMEDOUT;
> +}
> +
> +
> +static int p50_read_mbox_reg(struct p50_gpio *p50, int reg)
> +{
> +	int ret;
> +
> +	ret = p50_wait_ec(p50, P50_STATUS_IBF, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* clear output buffer flag, prevent unfinished commands */
> +	inb(p50->base + P50_PORT_DATA);
> +
> +	/* cmd/address */
> +	outb(P50_CMD_READ | reg, p50->base + P50_PORT_CMD);
> +
> +	ret = p50_wait_ec(p50, P50_STATUS_OBF, P50_STATUS_OBF);
> +	if (ret)
> +		return ret;
> +
> +	return inb(p50->base + P50_PORT_DATA);
> +}
> +
> +static int p50_write_mbox_reg(struct p50_gpio *p50, int reg, int val)
> +{
> +	int ret;
> +
> +	ret = p50_wait_ec(p50, P50_STATUS_IBF, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* cmd/address */
> +	outb(P50_CMD_WRITE | reg, p50->base + P50_PORT_CMD);
> +
> +	ret = p50_wait_ec(p50, P50_STATUS_IBF, 0);
> +	if (ret)
> +		return ret;
> +
> +	/* data */
> +	outb(val, p50->base + P50_PORT_DATA);
> +
> +	return 0;
> +}
> +
> +
> +/* mbox routines */
> +
> +static int p50_wait_mbox_idle(struct p50_gpio *p50)
> +{
> +	int i, val;
> +
> +	for (i = 0; i < 1000; i++) {
> +		val = p50_read_mbox_reg(p50, P50_MBOX_REG_CMD);
> +		/* cmd is 0 when idle */
> +		if (val <= 0)
> +			return val;
> +
> +		usleep_range(500, 2000);
> +	}
> +
> +	dev_err(p50->gc.parent,	"Timed out waiting for EC mbox idle (CMD: 0x%x)\n", val);
> +
> +	return -ETIMEDOUT;
> +}
> +
> +static int p50_send_mbox_cmd(struct p50_gpio *p50, int cmd, int param, int data)
> +{
> +	int ret;
> +
> +	ret = p50_wait_mbox_idle(p50);
> +	if (ret)
> +		return ret;
> +
> +	ret = p50_write_mbox_reg(p50, P50_MBOX_REG_DATA, data);
> +	if (ret)
> +		return ret;
> +
> +	ret = p50_write_mbox_reg(p50, P50_MBOX_REG_PARAM, param);
> +	if (ret)
> +		return ret;
> +
> +	ret = p50_write_mbox_reg(p50, P50_MBOX_REG_CMD, cmd);
> +	if (ret)
> +		return ret;
> +
> +	ret = p50_wait_mbox_idle(p50);
> +	if (ret)
> +		return ret;
> +
> +	ret = p50_read_mbox_reg(p50, P50_MBOX_REG_STATUS);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ret == P50_MBOX_STATUS_SUCCESS)
> +		return 0;
> +
> +	dev_err(p50->gc.parent,	"Mbox command failed (CMD=0x%x STAT=0x%x PARAM=0x%x DATA=0x%x)\n",
> +		cmd, ret, param, data);
> +
> +	return -EIO;
> +}
> +
> +
> +/* gpio routines */
> +
> +static int p50_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	switch (offset) {
> +	case P50_GPIO_LINE_BTN:
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	case P50_GPIO_LINE_LED:
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct p50_gpio *p50 = gpiochip_get_data(gc);
> +	int ret;
> +
> +	mutex_lock(&p50->lock);
> +
> +	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_READ_GPIO, gpio_params[offset], 0);
> +	if (ret == 0)
> +		ret = p50_read_mbox_reg(p50, P50_MBOX_REG_DATA);
> +
> +	mutex_unlock(&p50->lock);
> +
> +	return ret;
> +}
> +
> +static void p50_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	struct p50_gpio *p50 = gpiochip_get_data(gc);
> +
> +	mutex_lock(&p50->lock);
> +
> +	p50_send_mbox_cmd(p50, P50_MBOX_CMD_WRITE_GPIO, gpio_params[offset], value);
> +
> +	mutex_unlock(&p50->lock);
> +}
> +
> +static int p50_gpio_probe(struct platform_device *pdev)
> +{
> +	struct p50_gpio *p50;
> +	struct resource *res;
> +	int ret;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "Cannot get I/O ports\n");
> +		return -ENODEV;
> +	}
> +
> +	if (!devm_request_region(&pdev->dev, res->start, resource_size(res), pdev->name)) {
> +		dev_err(&pdev->dev, "Unable to reserve I/O region\n");
> +		return -EBUSY;
> +	}
> +
> +	p50 = devm_kzalloc(&pdev->dev, sizeof(*p50), GFP_KERNEL);
> +	if (!p50)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, p50);
> +	mutex_init(&p50->lock);
> +	p50->base = res->start;
> +	p50->gc.owner = THIS_MODULE;
> +	p50->gc.parent = &pdev->dev;
> +	p50->gc.label = dev_name(&pdev->dev);
> +	p50->gc.ngpio = ARRAY_SIZE(gpio_names);
> +	p50->gc.names = gpio_names;
> +	p50->gc.can_sleep = true;
> +	p50->gc.base = -1;
> +	p50->gc.get_direction = p50_gpio_get_direction;
> +	p50->gc.get = p50_gpio_get;
> +	p50->gc.set = p50_gpio_set;
> +
> +
> +	/* reset mbox */
> +	ret = p50_wait_mbox_idle(p50);
> +	if (ret)
> +		return ret;
> +
> +	ret = p50_write_mbox_reg(p50, P50_MBOX_REG_CMD, P50_MBOX_CMD_CLEAR);
> +	if (ret)
> +		return ret;
> +
> +	ret = p50_wait_mbox_idle(p50);
> +	if (ret)
> +		return ret;
> +
> +
> +	ret = devm_gpiochip_add_data(&pdev->dev, &p50->gc, p50);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Could not register gpiochip: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_add_lookup_table(&p50_gpio_led_table);
> +
> +	p50->leds_pdev = platform_device_register_data(&pdev->dev,
> +		"leds-gpio", PLATFORM_DEVID_NONE, &leds_pdata, sizeof(leds_pdata));
> +
> +	if (IS_ERR(p50->leds_pdev)) {
> +		ret = PTR_ERR(p50->leds_pdev);
> +		dev_err(&pdev->dev, "Could not register leds-gpio: %d\n", ret);
> +		goto err_leds;
> +	}
> +
> +	/* gpio-keys-polled uses old-style gpio interface, pass the right identifier */
> +	buttons[0].gpio += p50->gc.base;
> +
> +	p50->keys_pdev =
> +		platform_device_register_data(&pdev->dev, "gpio-keys-polled",
> +					      PLATFORM_DEVID_NONE,
> +					      &keys_pdata, sizeof(keys_pdata));
> +
> +	if (IS_ERR(p50->keys_pdev)) {
> +		ret = PTR_ERR(p50->keys_pdev);
> +		dev_err(&pdev->dev, "Could not register gpio-keys-polled: %d\n", ret);
> +		goto err_keys;
> +	}
> +
> +	return 0;
> +
> +err_keys:
> +	platform_device_unregister(p50->leds_pdev);
> +err_leds:
> +	gpiod_remove_lookup_table(&p50_gpio_led_table);
> +
> +	return ret;
> +}
> +
> +static int p50_gpio_remove(struct platform_device *pdev)
> +{
> +	struct p50_gpio *p50 = platform_get_drvdata(pdev);
> +
> +	platform_device_unregister(p50->keys_pdev);
> +	platform_device_unregister(p50->leds_pdev);
> +
> +	gpiod_remove_lookup_table(&p50_gpio_led_table);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver p50_gpio_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +	},
> +	.probe = p50_gpio_probe,
> +	.remove = p50_gpio_remove,
> +};
> +
> +/* Board setup */
> +static const struct dmi_system_id dmi_ids[] __initconst = {
> +	{
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Barco"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_FAMILY, "P50")
> +		},
> +	},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(dmi, dmi_ids);
> +
> +static int __init p50_module_init(void)
> +{
> +	struct resource res = DEFINE_RES_IO(P50_GPIO_IO_PORT_BASE, P50_PORT_CMD + 1);
> +
> +	if (!dmi_first_match(dmi_ids))
> +		return -ENODEV;
> +
> +	platform_driver_register(&p50_gpio_driver);
> +
> +	gpio_pdev = platform_device_register_simple(DRIVER_NAME, PLATFORM_DEVID_NONE, &res, 1);
> +	if (IS_ERR(gpio_pdev)) {
> +		pr_err("failed registering %s: %ld\n", DRIVER_NAME, PTR_ERR(gpio_pdev));
> +		platform_driver_unregister(&p50_gpio_driver);
> +		return PTR_ERR(gpio_pdev);
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit p50_module_exit(void)
> +{
> +	platform_device_unregister(gpio_pdev);
> +	platform_driver_unregister(&p50_gpio_driver);
> +}
> +
> +module_init(p50_module_init);
> +module_exit(p50_module_exit);
> +
> +MODULE_AUTHOR("Santosh Kumar Yadav, Barco NV <santoshkumar.yadav@barco.com>");
> +MODULE_DESCRIPTION("Barco P50 identify GPIOs driver");
> +MODULE_LICENSE("GPL");
> 

