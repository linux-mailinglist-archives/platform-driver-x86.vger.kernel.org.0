Return-Path: <platform-driver-x86+bounces-14063-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78497B51513
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Sep 2025 13:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7702E1C837C8
	for <lists+platform-driver-x86@lfdr.de>; Wed, 10 Sep 2025 11:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B147B31814C;
	Wed, 10 Sep 2025 11:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d28qSwiQ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BD3176F2;
	Wed, 10 Sep 2025 11:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757502666; cv=none; b=LQs3Msh1AMpbpZU02ev1MyPm1Vce1BDeOntmbYlFyhOJKw3RfWtd9ASq0XTQ0v/jwO+OME2A4eknPqQtn0IzrUGJzaJ4b8sSjslZxdQmqUXSdx55Oh3/lt4Qg9rH7yd38ue3sb4sTJZtyr7808phq8riTo+Vv0E09z/+AIsLiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757502666; c=relaxed/simple;
	bh=2jX8psXUjQWTBykG89Zh5pee1iFxy1xlbnRQThYTJMw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=aBnxaMx98vNaopvkCCfwRpYGZnmphzyOjVsVntzCv59PyOt6x3WN4s7mmLgRyTiWTXwQ22YgCFxiCDL5Glg+OMt0M2HaeLfLYoYsfOaeUQv1CsexZpyjaoVsXJROnjw7vOa7SbfYgQdUmY+RlbTYwe5G6rXPSgpUuMRZzl6wZr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d28qSwiQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757502664; x=1789038664;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=2jX8psXUjQWTBykG89Zh5pee1iFxy1xlbnRQThYTJMw=;
  b=d28qSwiQ7a7wujeikxjmSRHsfSQub0JZ8lKH8FXI5xdra38uUvC9v5c2
   iZ4J2vzo/opZ2IMXQzL0e7AO6CFF1wjaGMAyjZBacv3nDaulNpjwpgGqG
   f/EDCdzIzMcsC0huYzfFEAEjkA0vjHVu6e84FH4iYgmMl2kOggEXKNuZq
   iyEuO29onxxjcW//qB6SdZHf4K87gwqoLEATBj346SHe7vKdG6vgSLc0h
   zR3qAaSUn02b3ltKOJoxN9ubDOudH3yjX3i1a+kfJjJj7v3KnZeA8D4JT
   ut+RPbbss4c3dAs62iaOsCGYdkcVkqT80bWDlGH/BYBOsLSH7nSy7pSlp
   Q==;
X-CSE-ConnectionGUID: nARhUgpHSQSK12jpoj81rw==
X-CSE-MsgGUID: 2oxPyGdERDGb+eY66qDnKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59502562"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="59502562"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 04:11:03 -0700
X-CSE-ConnectionGUID: L4OkQX4aRtC/qm+oSK8B0w==
X-CSE-MsgGUID: LH7wEUwlQ56GAHlRdiZtFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="172956784"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.59])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 04:10:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 10 Sep 2025 14:10:54 +0300 (EEST)
To: Sebastian Reichel <sre@kernel.org>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Bjorn Andersson <andersson@kernel.org>, 
    Konrad Dybcio <konradybcio@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 2/3] platform: arm64: thinkpad-t14s-ec: new driver
In-Reply-To: <20250909-thinkpad-t14s-ec-v4-2-caf6159daaee@collabora.com>
Message-ID: <cf4f87e0-b749-5bc0-27b3-bd254c29c483@linux.intel.com>
References: <20250909-thinkpad-t14s-ec-v4-0-caf6159daaee@collabora.com> <20250909-thinkpad-t14s-ec-v4-2-caf6159daaee@collabora.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 9 Sep 2025, Sebastian Reichel wrote:

> Introduce EC driver for the ThinkPad T14s Gen6 Snapdragon, which is in
> theory compatible with ThinkPad ACPI. On Linux the system is booted with
> device tree, which is not supported by the ThinkPad ACPI driver
> (drivers/platform/x86/lenovo/thinkpad_acpi.c). Also most of the hardware
> compatibility is handled via ACPI tables, which are obviously not used
> when booting via device tree. Thus adding DT compatibility to the
> existing driver is not worth it as there is almost no code sharing.
> 
> The driver currently exposes features, which are not available
> via other means:
> 
>  * Extra Keys
>  * System LEDs
>  * Keyboard Backlight Control
> 
> The driver has been developed by reading the ACPI DSDT. There
> are some more features around thermal control, which are not
> yet supported by the driver.
> 
> The speaker mute and mic mute LEDs need some additional changes
> in the ALSA UCM to be set automatically.
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  MAINTAINERS                                   |   6 +
>  drivers/platform/arm64/Kconfig                |  20 +
>  drivers/platform/arm64/Makefile               |   1 +
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 619 ++++++++++++++++++++++++++
>  4 files changed, 646 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cd7ff55b5d321752ac44c91d2d7e74de28e08960..73a685a75d7a15b75bbc97c25ae0428bdf21e2ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -25100,6 +25100,12 @@ W:	http://thinkwiki.org/wiki/Ibm-acpi
>  T:	git git://repo.or.cz/linux-2.6/linux-acpi-2.6/ibm-acpi-2.6.git
>  F:	drivers/platform/x86/lenovo/thinkpad_acpi.c
>  
> +THINKPAD T14S EMBEDDED CONTROLLER DRIVER
> +M:	Sebastian Reichel <sre@kernel.org>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/platform/lenovo,thinkpad-t14s-ec.yaml
> +F:	drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +
>  THINKPAD LMI DRIVER
>  M:	Mark Pearson <mpearson-lenovo@squebb.ca>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 06288aebc5599435065a37f8dacd046b5def80bd..10f905d7d6bfa5fad30a0689d3a20481268c781e 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -70,4 +70,24 @@ config EC_LENOVO_YOGA_C630
>  
>  	  Say M or Y here to include this support.
>  
> +config EC_LENOVO_THINKPAD_T14S
> +	tristate "Lenovo Thinkpad T14s Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on INPUT
> +	select INPUT_SPARSEKMAP
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	select SND_CTL_LED if SND
> +	help
> +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> +	  Lenovo Thinkpad T14s, which provides access to keyboard backlight
> +	  and status LEDs.
> +
> +	  This driver provides support for the mentioned laptop where this
> +	  information is not properly exposed via the standard Qualcomm
> +	  devices.
> +
> +	  Say M or Y here to include this support.
> +
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 46a99eba3264cc40e812567d1533bb86031a6af3..60c131cff6a15bb51a49c9edab95badf513ee0f6 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -8,3 +8,4 @@
>  obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> +obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) += lenovo-thinkpad-t14s.o
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..7f355f749c012cfc7013fd07c94b389317f75fba
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -0,0 +1,619 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025, Sebastian Reichel
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/delay.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/interrupt.h>
> +#include <linux/leds.h>
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define T14S_EC_CMD_ECRD	0x02
> +#define T14S_EC_CMD_ECWR	0x03
> +#define T14S_EC_CMD_EVT		0xf0
> +
> +#define T14S_EC_REG_LED		0x0c
> +#define T14S_EC_REG_KBD_BL1	0x0d
> +#define T14S_EC_REG_KBD_BL2	0xe1
> +#define T14S_EC_KBD_BL1_MASK	GENMASK_U8(7, 6)
> +#define T14S_EC_KBD_BL2_MASK	GENMASK_U8(3, 2)
> +#define T14S_EC_REG_AUD		0x30
> +#define T14S_EC_MIC_MUTE_LED	BIT(5)
> +#define T14S_EC_SPK_MUTE_LED	BIT(6)
> +
> +#define T14S_EC_EVT_NONE			0x00
> +#define T14S_EC_EVT_KEY_FN_4			0x13
> +#define T14S_EC_EVT_KEY_FN_F7			0x16
> +#define T14S_EC_EVT_KEY_FN_SPACE		0x1f
> +#define T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
> +#define T14S_EC_EVT_AC_CONNECTED		0x26
> +#define T14S_EC_EVT_AC_DISCONNECTED		0x27
> +#define T14S_EC_EVT_KEY_POWER			0x28
> +#define T14S_EC_EVT_LID_OPEN			0x2a
> +#define T14S_EC_EVT_LID_CLOSED			0x2b
> +#define T14S_EC_EVT_THERMAL_TZ40		0x5c
> +#define T14S_EC_EVT_THERMAL_TZ42		0x5d
> +#define T14S_EC_EVT_THERMAL_TZ39		0x5e
> +#define T14S_EC_EVT_KEY_FN_F12			0x62
> +#define T14S_EC_EVT_KEY_FN_TAB			0x63
> +#define T14S_EC_EVT_KEY_FN_F8			0x64
> +#define T14S_EC_EVT_KEY_FN_F10			0x65
> +#define T14S_EC_EVT_KEY_FN_F4			0x6a
> +#define T14S_EC_EVT_KEY_FN_D			0x6b
> +#define T14S_EC_EVT_KEY_FN_T			0x6c
> +#define T14S_EC_EVT_KEY_FN_H			0x6d
> +#define T14S_EC_EVT_KEY_FN_M			0x6e
> +#define T14S_EC_EVT_KEY_FN_L			0x6f
> +#define T14S_EC_EVT_KEY_FN_RIGHT_SHIFT		0x71
> +#define T14S_EC_EVT_KEY_FN_ESC			0x74
> +#define T14S_EC_EVT_KEY_FN_N			0x79
> +#define T14S_EC_EVT_KEY_FN_F11			0x7a
> +#define T14S_EC_EVT_KEY_FN_G			0x7e
> +
> +/* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
> +#define T14S_EC_BLINK_RATE_ON_OFF_MS		500
> +
> +/*
> + * Add a virtual offset on all key event codes for sparse keymap handling,
> + * since the sparse keymap infrastructure does not map some raw key event
> + * codes used by the EC. For example 0x16 (T14S_EC_EVT_KEY_FN_F7) is mapped
> + * to KEY_MUTE if no offset is applied.
> + */
> +#define T14S_EC_KEY_EVT_OFFSET			0x1000
> +#define T14S_EC_KEY_ENTRY(key, value) \
> +	{ KE_KEY, T14S_EC_KEY_EVT_OFFSET + T14S_EC_EVT_KEY_##key, { value } }
> +
> +enum thinkpad_t14s_ec_led_status_t {
> +	T14S_EC_LED_OFF =	0x00,
> +	T14S_EC_LED_ON =	0x80,
> +	T14S_EC_LED_BLINK =	0xc0,
> +};
> +
> +struct thinkpad_t14s_ec_led_classdev {
> +	struct led_classdev led_classdev;
> +	int led;
> +	enum thinkpad_t14s_ec_led_status_t cache;
> +	struct thinkpad_t14s_ec *ec;
> +};
> +
> +struct thinkpad_t14s_ec {
> +	struct regmap *regmap;
> +	struct device *dev;
> +	struct thinkpad_t14s_ec_led_classdev led_pwr_btn;
> +	struct thinkpad_t14s_ec_led_classdev led_chrg_orange;
> +	struct thinkpad_t14s_ec_led_classdev led_chrg_white;
> +	struct thinkpad_t14s_ec_led_classdev led_lid_logo_dot;
> +	struct led_classdev kbd_backlight;
> +	struct led_classdev led_mic_mute;
> +	struct led_classdev led_spk_mute;
> +	struct input_dev *inputdev;
> +};
> +
> +static const struct regmap_config thinkpad_t14s_ec_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.max_register = 0xff,
> +};
> +
> +static int thinkpad_t14s_ec_write(void *context, unsigned int reg,

Does the thinkpad_ part of the prefix provide some real value? To me it 
looks that similar to the define change you've already made, t14s prefix 
alone would be enough to avoid namespace collisions, the rest just seems 
extra letters and line length (or even extra lines here and there).

> +				  unsigned int val)
> +{
> +	u8 buf[5] = {T14S_EC_CMD_ECWR, reg, 0x00, 0x01, val};
> +	struct thinkpad_t14s_ec *ec = context;
> +	struct i2c_client *client = to_i2c_client(ec->dev);

I'd move u8 buf here, these struct initialization/type conversions are 
mostly uninteresting boilerplate so having them first is better (normally 
it usually mostly follows from reverse-xmas tree order but here the 
command was slightly too long for that to happen naturally).

It also matches the order in the functions below after making them 
reverse-xmas tree as closely as possible.

> +	int ret;
> +
> +	ret = i2c_master_send(client, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int thinkpad_t14s_ec_read(void *context, unsigned int reg,
> +				 unsigned int *val)
> +{
> +	u8 buf[4] = {T14S_EC_CMD_ECRD, reg, 0x00, 0x01};
> +	struct thinkpad_t14s_ec *ec = context;
> +	struct i2c_client *client = to_i2c_client(ec->dev);

Move u8 buf here. It's the closest we can get to the reverse xmas-tree 
order.

> +	struct i2c_msg request, response;
> +	u8 result;
> +	int ret;
> +
> +	request.addr = client->addr;
> +	request.flags = I2C_M_STOP;
> +	request.len = sizeof(buf);
> +	request.buf = buf;
> +	response.addr = client->addr;
> +	response.flags = I2C_M_RD;
> +	response.len = 1;
> +	response.buf = &result;
> +
> +	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +
> +	ret = __i2c_transfer(client->adapter, &request, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = __i2c_transfer(client->adapter, &response, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	*val = result;
> +	ret = 0;
> +
> +out:
> +	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	return ret;
> +}
> +
> +static const struct regmap_bus thinkpad_t14s_ec_regmap_bus = {
> +	.reg_write = thinkpad_t14s_ec_write,
> +	.reg_read = thinkpad_t14s_ec_read,
> +};
> +
> +static int thinkpad_t14s_ec_read_evt(struct thinkpad_t14s_ec *ec, u8 *val)
> +{
> +	u8 buf[4] = {T14S_EC_CMD_EVT, 0x00, 0x00, 0x01};
> +	struct i2c_client *client = to_i2c_client(ec->dev);

reverse xmas-tree order.

-- 
 i.

> +	struct i2c_msg request, response;
> +	int ret;
> +
> +	request.addr = client->addr;
> +	request.flags = I2C_M_STOP;
> +	request.len = sizeof(buf);
> +	request.buf = buf;
> +	response.addr = client->addr;
> +	response.flags = I2C_M_RD;
> +	response.len = 1;
> +	response.buf = val;
> +
> +	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +
> +	ret = __i2c_transfer(client->adapter, &request, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = __i2c_transfer(client->adapter, &response, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	ret = 0;
> +
> +out:
> +	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
> +	return ret;
> +}
> +
> +static int thinkpad_t14s_led_set_status(struct thinkpad_t14s_ec *ec,
> +			struct thinkpad_t14s_ec_led_classdev *led,
> +			const enum thinkpad_t14s_ec_led_status_t ledstatus)
> +{
> +	int ret;
> +
> +	ret = regmap_write(ec->regmap, T14S_EC_REG_LED,
> +			   led->led | ledstatus);
> +	if (ret < 0)
> +		return ret;
> +
> +	led->cache = ledstatus;
> +	return 0;
> +}
> +
> +static int thinkpad_t14s_led_brightness_set(struct led_classdev *led_cdev,
> +					    enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
> +			struct thinkpad_t14s_ec_led_classdev, led_classdev);
> +	enum thinkpad_t14s_ec_led_status_t new_state;
> +
> +	if (brightness == LED_OFF)
> +		new_state = T14S_EC_LED_OFF;
> +	else if (led->cache == T14S_EC_LED_BLINK)
> +		new_state = T14S_EC_LED_BLINK;
> +	else
> +		new_state = T14S_EC_LED_ON;
> +
> +	return thinkpad_t14s_led_set_status(led->ec, led, new_state);
> +}
> +
> +static int thinkpad_t14s_led_blink_set(struct led_classdev *led_cdev,
> +				       unsigned long *delay_on,
> +				       unsigned long *delay_off)
> +{
> +	struct thinkpad_t14s_ec_led_classdev *led = container_of(led_cdev,
> +			struct thinkpad_t14s_ec_led_classdev, led_classdev);
> +
> +	if (*delay_on == 0 && *delay_off == 0) {
> +		/* Userspace does not provide a blink rate; we can choose it */
> +		*delay_on = T14S_EC_BLINK_RATE_ON_OFF_MS;
> +		*delay_off = T14S_EC_BLINK_RATE_ON_OFF_MS;
> +	} else if ((*delay_on != T14S_EC_BLINK_RATE_ON_OFF_MS) ||
> +		   (*delay_off != T14S_EC_BLINK_RATE_ON_OFF_MS))
> +		return -EINVAL;
> +
> +	return thinkpad_t14s_led_set_status(led->ec, led, T14S_EC_LED_BLINK);
> +}
> +
> +static int thinkpad_t14s_init_led(struct thinkpad_t14s_ec *ec,
> +				  struct thinkpad_t14s_ec_led_classdev *led,
> +				  u8 id, const char *name)
> +{
> +	led->led_classdev.name = name;
> +	led->led_classdev.flags = LED_RETAIN_AT_SHUTDOWN;
> +	led->led_classdev.max_brightness = 1;
> +	led->led_classdev.brightness_set_blocking = thinkpad_t14s_led_brightness_set;
> +	led->led_classdev.blink_set = thinkpad_t14s_led_blink_set;
> +	led->ec = ec;
> +	led->led = id;
> +
> +	return devm_led_classdev_register(ec->dev, &led->led_classdev);
> +}
> +
> +static int thinkpad_t14s_leds_probe(struct thinkpad_t14s_ec *ec)
> +{
> +	int ret;
> +
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_pwr_btn, 0,
> +				     "platform::power");
> +	if (ret)
> +		return ret;
> +
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_chrg_orange, 1,
> +				     "platform:amber:battery-charging");
> +	if (ret)
> +		return ret;
> +
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_chrg_white, 2,
> +				     "platform:white:battery-full");
> +	if (ret)
> +		return ret;
> +
> +	ret = thinkpad_t14s_init_led(ec, &ec->led_lid_logo_dot, 10,
> +				     "platform::lid_logo_dot");
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int thinkpad_t14s_kbd_bl_set(struct led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, kbd_backlight);
> +	int ret;
> +	u8 val;
> +
> +	val = FIELD_PREP(T14S_EC_KBD_BL1_MASK, brightness);
> +	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL1,
> +				 T14S_EC_KBD_BL1_MASK, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = FIELD_PREP(T14S_EC_KBD_BL2_MASK, brightness);
> +	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL2,
> +				 T14S_EC_KBD_BL2_MASK, val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static enum led_brightness thinkpad_t14s_kbd_bl_get(struct led_classdev *led_cdev)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, kbd_backlight);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(ec->regmap, T14S_EC_REG_KBD_BL1, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return FIELD_GET(T14S_EC_KBD_BL1_MASK, val);
> +}
> +
> +static void thinkpad_t14s_kbd_bl_update(struct thinkpad_t14s_ec *ec)
> +{
> +	enum led_brightness brightness = thinkpad_t14s_kbd_bl_get(&ec->kbd_backlight);
> +
> +	led_classdev_notify_brightness_hw_changed(&ec->kbd_backlight, brightness);
> +}
> +
> +static int thinkpad_t14s_kbd_backlight_probe(struct thinkpad_t14s_ec *ec)
> +{
> +	ec->kbd_backlight.name = "platform::kbd_backlight";
> +	ec->kbd_backlight.flags = LED_BRIGHT_HW_CHANGED;
> +	ec->kbd_backlight.max_brightness = 2;
> +	ec->kbd_backlight.brightness_set_blocking = thinkpad_t14s_kbd_bl_set;
> +	ec->kbd_backlight.brightness_get = thinkpad_t14s_kbd_bl_get;
> +
> +	return devm_led_classdev_register(ec->dev, &ec->kbd_backlight);
> +}
> +
> +static enum led_brightness thinkpad_t14s_audio_led_get(struct thinkpad_t14s_ec *ec,
> +						       u8 led_bit)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(ec->regmap, T14S_EC_REG_AUD, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val & led_bit) ? LED_ON : LED_OFF;
> +}
> +
> +static enum led_brightness thinkpad_t14s_audio_led_set(struct thinkpad_t14s_ec *ec,
> +						       u8 led_mask,
> +						       enum led_brightness brightness)
> +{
> +	return regmap_assign_bits(ec->regmap, T14S_EC_REG_AUD, led_mask, brightness > 0);
> +}
> +
> +static enum led_brightness thinkpad_t14s_mic_mute_led_get(struct led_classdev *led_cdev)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_mic_mute);
> +
> +	return thinkpad_t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
> +}
> +
> +static int thinkpad_t14s_mic_mute_led_set(struct led_classdev *led_cdev,
> +					  enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_mic_mute);
> +
> +	return thinkpad_t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
> +}
> +
> +static enum led_brightness thinkpad_t14s_spk_mute_led_get(struct led_classdev *led_cdev)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_spk_mute);
> +
> +	return thinkpad_t14s_audio_led_get(ec, T14S_EC_SPK_MUTE_LED);
> +}
> +
> +static int thinkpad_t14s_spk_mute_led_set(struct led_classdev *led_cdev,
> +					  enum led_brightness brightness)
> +{
> +	struct thinkpad_t14s_ec *ec = container_of(led_cdev,
> +					struct thinkpad_t14s_ec, led_spk_mute);
> +
> +	return thinkpad_t14s_audio_led_set(ec, T14S_EC_SPK_MUTE_LED, brightness);
> +}
> +
> +static int thinkpad_t14s_kbd_audio_led_probe(struct thinkpad_t14s_ec *ec)
> +{
> +	int ret;
> +
> +	ec->led_mic_mute.name = "platform::micmute";
> +	ec->led_mic_mute.max_brightness = 1,
> +	ec->led_mic_mute.default_trigger = "audio-micmute",
> +	ec->led_mic_mute.brightness_set_blocking = thinkpad_t14s_mic_mute_led_set;
> +	ec->led_mic_mute.brightness_get = thinkpad_t14s_mic_mute_led_get;
> +
> +	ec->led_spk_mute.name = "platform::mute";
> +	ec->led_spk_mute.max_brightness = 1,
> +	ec->led_spk_mute.default_trigger = "audio-mute",
> +	ec->led_spk_mute.brightness_set_blocking = thinkpad_t14s_spk_mute_led_set;
> +	ec->led_spk_mute.brightness_get = thinkpad_t14s_spk_mute_led_get;
> +
> +	ret = devm_led_classdev_register(ec->dev, &ec->led_mic_mute);
> +	if (ret)
> +		return ret;
> +
> +	return devm_led_classdev_register(ec->dev, &ec->led_spk_mute);
> +}
> +
> +static const struct key_entry thinkpad_t14s_keymap[] = {
> +	T14S_EC_KEY_ENTRY(FN_4, KEY_SLEEP),
> +	T14S_EC_KEY_ENTRY(FN_N, KEY_VENDOR),
> +	T14S_EC_KEY_ENTRY(FN_F4, KEY_MICMUTE),
> +	T14S_EC_KEY_ENTRY(FN_F7, KEY_SWITCHVIDEOMODE),
> +	T14S_EC_KEY_ENTRY(FN_F8, KEY_PERFORMANCE),
> +	T14S_EC_KEY_ENTRY(FN_F10, KEY_SELECTIVE_SCREENSHOT),
> +	T14S_EC_KEY_ENTRY(FN_F11, KEY_LINK_PHONE),
> +	T14S_EC_KEY_ENTRY(FN_F12, KEY_BOOKMARKS),
> +	T14S_EC_KEY_ENTRY(FN_SPACE, KEY_KBDILLUMTOGGLE),
> +	T14S_EC_KEY_ENTRY(FN_ESC, KEY_FN_ESC),
> +	T14S_EC_KEY_ENTRY(FN_TAB, KEY_ZOOM),
> +	T14S_EC_KEY_ENTRY(FN_RIGHT_SHIFT, KEY_FN_RIGHT_SHIFT),
> +	T14S_EC_KEY_ENTRY(TP_DOUBLE_TAP, KEY_PROG4),
> +	{ KE_END }
> +};
> +
> +static int thinkpad_t14s_input_probe(struct thinkpad_t14s_ec *ec)
> +{
> +	int ret;
> +
> +	ec->inputdev = devm_input_allocate_device(ec->dev);
> +	if (!ec->inputdev)
> +		return -ENOMEM;
> +
> +	ec->inputdev->name = "ThinkPad Extra Buttons";
> +	ec->inputdev->phys = "thinkpad/input0";
> +	ec->inputdev->id.bustype = BUS_HOST;
> +	ec->inputdev->dev.parent = ec->dev;
> +
> +	ret = sparse_keymap_setup(ec->inputdev, thinkpad_t14s_keymap, NULL);
> +	if (ret)
> +		return ret;
> +
> +	return input_register_device(ec->inputdev);
> +}
> +
> +static irqreturn_t thinkpad_t14s_ec_irq_handler(int irq, void *data)
> +{
> +	struct thinkpad_t14s_ec *ec = data;
> +	int ret;
> +	u8 val;
> +
> +	ret = thinkpad_t14s_ec_read_evt(ec, &val);
> +	if (ret < 0) {
> +		dev_err(ec->dev, "Failed to read event\n");
> +		return IRQ_HANDLED;
> +	}
> +
> +	switch (val) {
> +	case T14S_EC_EVT_NONE:
> +		break;
> +	case T14S_EC_EVT_KEY_FN_SPACE:
> +		thinkpad_t14s_kbd_bl_update(ec);
> +		fallthrough;
> +	case T14S_EC_EVT_KEY_FN_F4:
> +	case T14S_EC_EVT_KEY_FN_F7:
> +	case T14S_EC_EVT_KEY_FN_4:
> +	case T14S_EC_EVT_KEY_FN_F8:
> +	case T14S_EC_EVT_KEY_FN_F12:
> +	case T14S_EC_EVT_KEY_FN_TAB:
> +	case T14S_EC_EVT_KEY_FN_F10:
> +	case T14S_EC_EVT_KEY_FN_N:
> +	case T14S_EC_EVT_KEY_FN_F11:
> +	case T14S_EC_EVT_KEY_FN_ESC:
> +	case T14S_EC_EVT_KEY_FN_RIGHT_SHIFT:
> +	case T14S_EC_EVT_KEY_TP_DOUBLE_TAP:
> +		sparse_keymap_report_event(ec->inputdev,
> +				T14S_EC_KEY_EVT_OFFSET + val, 1, true);
> +		break;
> +	case T14S_EC_EVT_AC_CONNECTED:
> +		dev_dbg(ec->dev, "AC connected\n");
> +		break;
> +	case T14S_EC_EVT_AC_DISCONNECTED:
> +		dev_dbg(ec->dev, "AC disconnected\n");
> +		break;
> +	case T14S_EC_EVT_KEY_POWER:
> +		dev_dbg(ec->dev, "power button\n");
> +		break;
> +	case T14S_EC_EVT_LID_OPEN:
> +		dev_dbg(ec->dev, "LID open\n");
> +		break;
> +	case T14S_EC_EVT_LID_CLOSED:
> +		dev_dbg(ec->dev, "LID closed\n");
> +		break;
> +	case T14S_EC_EVT_THERMAL_TZ40:
> +		dev_dbg(ec->dev, "Thermal Zone 40 Status Change Event (CPU/GPU)\n");
> +		break;
> +	case T14S_EC_EVT_THERMAL_TZ42:
> +		dev_dbg(ec->dev, "Thermal Zone 42 Status Change Event (Battery)\n");
> +		break;
> +	case T14S_EC_EVT_THERMAL_TZ39:
> +		dev_dbg(ec->dev, "Thermal Zone 39 Status Change Event (CPU/GPU)\n");
> +		break;
> +	case T14S_EC_EVT_KEY_FN_G:
> +		dev_dbg(ec->dev, "FN + G - toggle double-tapping\n");
> +		break;
> +	case T14S_EC_EVT_KEY_FN_L:
> +		dev_dbg(ec->dev, "FN + L - low performance mode\n");
> +		break;
> +	case T14S_EC_EVT_KEY_FN_M:
> +		dev_dbg(ec->dev, "FN + M - medium performance mode\n");
> +		break;
> +	case T14S_EC_EVT_KEY_FN_H:
> +		dev_dbg(ec->dev, "FN + H - high performance mode\n");
> +		break;
> +	case T14S_EC_EVT_KEY_FN_T:
> +		dev_dbg(ec->dev, "FN + T - toggle intelligent cooling mode\n");
> +		break;
> +	case T14S_EC_EVT_KEY_FN_D:
> +		dev_dbg(ec->dev, "FN + D - toggle privacy guard mode\n");
> +		break;
> +	default:
> +		dev_info(ec->dev, "Unknown EC event: 0x%02x\n", val);
> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int thinkpad_t14s_ec_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct thinkpad_t14s_ec *ec;
> +	int ret;
> +
> +	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +	if (!ec)
> +		return -ENOMEM;
> +
> +	ec->dev = dev;
> +
> +	ec->regmap = devm_regmap_init(dev, &thinkpad_t14s_ec_regmap_bus,
> +				      ec, &thinkpad_t14s_ec_regmap_config);
> +	if (IS_ERR(ec->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ec->regmap),
> +				     "Failed to init regmap\n");
> +
> +	ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +					thinkpad_t14s_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to get IRQ\n");
> +
> +	ret = thinkpad_t14s_leds_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = thinkpad_t14s_kbd_backlight_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = thinkpad_t14s_kbd_audio_led_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = thinkpad_t14s_input_probe(ec);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * Disable wakeup support by default, because the driver currently does
> +	 * not support masking any events and the laptop should not wake up when
> +	 * the LID is closed.
> +	 */
> +	device_wakeup_disable(dev);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id thinkpad_t14s_ec_of_match[] = {
> +	{ .compatible = "lenovo,thinkpad-t14s-ec" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, thinkpad_t14s_ec_of_match);
> +
> +static const struct i2c_device_id thinkpad_t14s_ec_i2c_id_table[] = {
> +	{ "thinkpad-t14s-ec", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, thinkpad_t14s_ec_i2c_id_table);
> +
> +static struct i2c_driver thinkpad_t14s_ec_i2c_driver = {
> +	.driver = {
> +		.name = "thinkpad-t14s-ec",
> +		.of_match_table = thinkpad_t14s_ec_of_match,
> +	},
> +	.probe = thinkpad_t14s_ec_probe,
> +	.id_table = thinkpad_t14s_ec_i2c_id_table,
> +};
> +module_i2c_driver(thinkpad_t14s_ec_i2c_driver);
> +
> +MODULE_AUTHOR("Sebastian Reichel <sre@kernel.org>");
> +MODULE_DESCRIPTION("Lenovo Thinkpad T14s Embedded Controller");
> +MODULE_LICENSE("GPL");
> 
> 

