Return-Path: <platform-driver-x86+bounces-10592-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69336A70798
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Mar 2025 18:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A01657A36B1
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Mar 2025 17:01:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6445625C716;
	Tue, 25 Mar 2025 17:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MEad3SWL"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41F11F78E4;
	Tue, 25 Mar 2025 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742922146; cv=none; b=kYLdZkVwojXfNEVeX8RXDtOf01WUvOl4Yy85JOCfJjoK8ySMONmLZZxrKFvYdAnob+zrL8ReZHFIGgGcKFjY3CpJS+zWtZzVN/OXlIFUCNZO9Rt+IBVFGPTSEQ3PL2iFnGin9KwV5cIEz20mQb1ERxGYo0YLdxbfL044CJqkB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742922146; c=relaxed/simple;
	bh=yHtcnIZ+1BumRxP+6+Cgl2D0MRgUmeaGh4ddlyshJHE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=F5rrC23wIYRrmDElu/RqM/Df5NmWPnBDR0OjnfLNNR5OwC7wfaQxx/Zik1aKPYHtzy6nByOwPsDSm9ayTuZuSCZtR3Ih0W/o7znavxGBZsl5LVEYXPlWywlAEOkIvgZi6hHmnhiMu1qL4uyMj/2R80IHz0uTSyP82FecLznkI68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MEad3SWL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742922145; x=1774458145;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=yHtcnIZ+1BumRxP+6+Cgl2D0MRgUmeaGh4ddlyshJHE=;
  b=MEad3SWLPEa9kXkibxmeP9hGJMB/mUxDURXBZDRAhSI1kxD3w+Br3NCZ
   NiIH/AaKJzfH4pfhzs7lWI1F9Per4NPRYDU/wzmDyrSwTI1DDF46U7LDQ
   4OaFa666VR+Y6LXfxe7zKyXkFKPmRf0WlxjEMucZ9ne5DoWQs4WWGQpTR
   DgT/mQryOUG9+r9TQFLqGU89h0qLuZlItC3isVYfzOszuD7xwSDNBQls2
   BxzhEcct0OfV1RcAfnjoUn3y54vV8GRHIheuTGUb9WyMawdCzNMjQtJT+
   Q/RTBkCYL7I4CLYrMqq+oLOqIsh+X/B05e3iARtsv8Hx6CAMPqpDo651n
   A==;
X-CSE-ConnectionGUID: 1c/giGmNRpyXnlzkK89BqQ==
X-CSE-MsgGUID: SIO01CTPT3CqYPQcD+1Yfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="55172849"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="55172849"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 10:02:24 -0700
X-CSE-ConnectionGUID: ZKPR4pQpQLyAXA7djMGK3A==
X-CSE-MsgGUID: T2TrIMDnT9aMWJ0dZsRInA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="161648979"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.158])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 10:02:20 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 25 Mar 2025 19:02:16 +0200 (EET)
To: Antheas Kapenekakis <lkml@antheas.dev>
cc: platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, 
    Benjamin Tissoires <bentiss@kernel.org>, 
    Corentin Chary <corentin.chary@gmail.com>, 
    "Luke D . Jones" <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 09/11] HID: asus: add basic RGB support
In-Reply-To: <20250324210151.6042-10-lkml@antheas.dev>
Message-ID: <1927afbf-25dc-506a-2942-efc7b8b6f478@linux.intel.com>
References: <20250324210151.6042-1-lkml@antheas.dev> <20250324210151.6042-10-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Mar 2025, Antheas Kapenekakis wrote:

> Adds basic RGB support to hid-asus through multi-index. The interface
> works quite well, but has not gone through much stability testing.
> Applied on demand, if userspace does not touch the RGB sysfs, not
> even initialization is done. Ensuring compatibility with existing
> userspace programs.
> 
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 169 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 155 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 905453a4eb5b7..3ac1e2dea45bb 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -30,6 +30,7 @@
>  #include <linux/input/mt.h>
>  #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
>  #include <linux/power_supply.h>
> +#include <linux/led-class-multicolor.h>
>  #include <linux/leds.h>
>  
>  #include "hid-ids.h"
> @@ -85,6 +86,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_HANDLE_GENERIC		BIT(13)
> +#define QUIRK_ROG_NKEY_RGB		BIT(14)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -97,9 +99,15 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  
>  struct asus_kbd_leds {
>  	struct asus_hid_listener listener;
> +	struct led_classdev_mc mc_led;
> +	struct mc_subled subled_info[3];
>  	struct hid_device *hdev;
>  	struct work_struct work;
>  	unsigned int brightness;
> +	uint8_t rgb_colors[3];

u8

> +	bool rgb_init;
> +	bool rgb_set;
> +	bool rgb_registered;
>  	spinlock_t lock;
>  	bool removed;
>  };
> @@ -504,23 +512,67 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>  	spin_unlock_irqrestore(&led->lock, flags);
>  }
>  
> -static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> +static void do_asus_kbd_backlight_set(struct asus_kbd_leds *led, int brightness)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&led->lock, flags);
> +	led->brightness = brightness;
> +	spin_unlock_irqrestore(&led->lock, flags);
> +
> +	asus_schedule_work(led);
> +}
> +
> +static void asus_kbd_listener_set(struct asus_hid_listener *listener,
>  				   int brightness)
>  {
>  	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
>  						 listener);
> +	do_asus_kbd_backlight_set(led, brightness);
> +	if (led->rgb_registered) {
> +		led->mc_led.led_cdev.brightness = brightness;
> +		led_classdev_notify_brightness_hw_changed(&led->mc_led.led_cdev,
> +							  brightness);
> +	}
> +}
> +
> +static void asus_kbd_brightness_set(struct led_classdev *led_cdev,
> +				    enum led_brightness brightness)
> +{
> +	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
> +	struct asus_kbd_leds *led = container_of(mc_cdev, struct asus_kbd_leds,
> +						 mc_led);
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&led->lock, flags);
> -	led->brightness = brightness;
> +	led->rgb_colors[0] = mc_cdev->subled_info[0].intensity;
> +	led->rgb_colors[1] = mc_cdev->subled_info[1].intensity;
> +	led->rgb_colors[2] = mc_cdev->subled_info[2].intensity;
> +	led->rgb_set = true;
>  	spin_unlock_irqrestore(&led->lock, flags);
>  
> -	asus_schedule_work(led);
> +	do_asus_kbd_backlight_set(led, brightness);
> +}
> +
> +static enum led_brightness asus_kbd_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct led_classdev_mc *mc_led;
> +	struct asus_kbd_leds *led;
> +	enum led_brightness brightness;
> +	unsigned long flags;
> +
> +	mc_led = lcdev_to_mccdev(led_cdev);
> +	led = container_of(mc_led, struct asus_kbd_leds, mc_led);
> +
> +	spin_lock_irqsave(&led->lock, flags);
> +	brightness = led->brightness;
> +	spin_unlock_irqrestore(&led->lock, flags);
> +
> +	return brightness;
>  }
>  
> -static void asus_kbd_backlight_work(struct work_struct *work)
> +static void asus_kbd_backlight_work(struct asus_kbd_leds *led)
>  {
> -	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
>  	u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4, 0x00 };
>  	int ret;
>  	unsigned long flags;
> @@ -534,10 +586,69 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>  		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>  }
>  
> +static void asus_kbd_rgb_work(struct asus_kbd_leds *led)
> +{
> +	u8 rgb_buf[][7] = {

Magic 7 should be named with a define.

> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB3 }, /* set mode */
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB5 }, /* apply mode */
> +		{ FEATURE_KBD_LED_REPORT_ID1, 0xB4 }, /* save to mem */
> +	};
> +	unsigned long flags;
> +	uint8_t colors[3];

uint*_t should be used only for uapi. Please use u8 for in kernel 
variables.

> +	bool rgb_init, rgb_set;
> +	int ret;
> +
> +	spin_lock_irqsave(&led->lock, flags);
> +	rgb_init = led->rgb_init;
> +	rgb_set = led->rgb_set;
> +	led->rgb_set = false;
> +	colors[0] = led->rgb_colors[0];
> +	colors[1] = led->rgb_colors[1];
> +	colors[2] = led->rgb_colors[2];
> +	spin_unlock_irqrestore(&led->lock, flags);
> +
> +	if (!rgb_set)
> +		return;
> +
> +	if (rgb_init) {
> +		ret = asus_kbd_init(led->hdev, FEATURE_KBD_LED_REPORT_ID1);
> +		if (ret < 0) {
> +			hid_err(led->hdev, "Asus failed to init RGB: %d\n", ret);
> +			return;
> +		}
> +		spin_lock_irqsave(&led->lock, flags);
> +		led->rgb_init = false;
> +		spin_unlock_irqrestore(&led->lock, flags);
> +	}
> +
> +	/* Protocol is: 54b3 zone (0=all) mode (0=solid) RGB */
> +	rgb_buf[0][4] = colors[0];
> +	rgb_buf[0][5] = colors[1];
> +	rgb_buf[0][6] = colors[2];
> +
> +	for (size_t i = 0; i < ARRAY_SIZE(rgb_buf); i++) {

Add include for ARRAY_SIZE()

> +		ret = asus_kbd_set_report(led->hdev, rgb_buf[i], sizeof(rgb_buf[i]));
> +		if (ret < 0) {
> +			hid_err(led->hdev, "Asus failed to set RGB: %d\n", ret);
> +			return;
> +		}
> +	}
> +}
> +
> +static void asus_kbd_work(struct work_struct *work)
> +{
> +	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds,
> +						 work);
> +	asus_kbd_backlight_work(led);
> +	asus_kbd_rgb_work(led);
> +}
> +
>  static int asus_kbd_register_leds(struct hid_device *hdev)
>  {
>  	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
>  	unsigned char kbd_func;
> +	struct asus_kbd_leds *leds;
> +	bool no_led;
>  	int ret;
>  
>  	ret = asus_kbd_init(hdev, FEATURE_KBD_REPORT_ID);
> @@ -565,21 +676,51 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	if (!drvdata->kbd_backlight)
>  		return -ENOMEM;
>  
> -	drvdata->kbd_backlight->removed = false;
> -	drvdata->kbd_backlight->brightness = 0;
> -	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
> -	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
> +	leds = drvdata->kbd_backlight;
> +	leds->removed = false;
> +	leds->brightness = 3;

Use the max brightness define here?

> +	leds->hdev = hdev;
> +	leds->listener.brightness_set = asus_kbd_listener_set;
> +
> +	leds->rgb_colors[0] = 0;
> +	leds->rgb_colors[1] = 0;
> +	leds->rgb_colors[2] = 0;
> +	leds->rgb_init = true;
> +	leds->rgb_set = false;
> +	leds->mc_led.led_cdev.name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
> +					"asus-%s:rgb:peripheral",
> +					strlen(hdev->uniq) ?

hdev->uniq[0] ?

> +					hdev->uniq : dev_name(&hdev->dev));
> +	leds->mc_led.led_cdev.flags = LED_BRIGHT_HW_CHANGED;
> +	leds->mc_led.led_cdev.max_brightness = 3,

Max brightness define.

> +	leds->mc_led.led_cdev.brightness_set = asus_kbd_brightness_set,
> +	leds->mc_led.led_cdev.brightness_get = asus_kbd_brightness_get,
> +	leds->mc_led.subled_info = leds->subled_info,
> +	leds->mc_led.num_colors = ARRAY_SIZE(leds->subled_info),
> +	leds->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	leds->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	leds->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +
> +	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_work);
>  	spin_lock_init(&drvdata->kbd_backlight->lock);
>  
>  	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
> +	no_led = !!ret;

Assigning to bool doesn't require !!.

> +
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_RGB) {
> +		ret = devm_led_classdev_multicolor_register(
> +			&hdev->dev, &leds->mc_led);

IMO, this could go to one line (it's only 87 chars long). At minimum, the 
first arg fits to the first line.

> +		if (!ret)
> +			leds->rgb_registered = true;
> +		no_led &= !!ret;

No !!

> +	}
>  
> -	if (ret < 0) {
> +	if (no_led) {
>  		/* No need to have this still around */
>  		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
>  	}
>  
> -	return ret;
> +	return no_led ? -ENODEV : 0;

Introduction of no_led leads to shadowing error code which is usually 
undesirable. What's the reason you don't want to pass the original ret 
code onward?

If you have a good reason for it, please documented it in the commit 
message and preferrably make that change own change so it can focus on 
that thing only. It would also make the diff here cleaner.

>  }
>  
>  /*
> @@ -1289,7 +1430,7 @@ static const struct hid_device_id asus_devices[] = {
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_Z13_LIGHTBAR),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>  	{ HID_USB_DEVICE(USB_VENDOR_ID_ASUSTEK,
>  	    USB_DEVICE_ID_ASUSTEK_ROG_NKEY_ALLY),
>  	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> @@ -1318,7 +1459,7 @@ static const struct hid_device_id asus_devices[] = {
>  	 */
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_ROG_Z13_FOLIO),
> -	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD },
> +	  QUIRK_USE_KBD_BACKLIGHT | QUIRK_ROG_NKEY_KEYBOARD | QUIRK_ROG_NKEY_RGB },
>  	{ HID_DEVICE(BUS_USB, HID_GROUP_GENERIC,
>  		USB_VENDOR_ID_ASUSTEK, USB_DEVICE_ID_ASUSTEK_T101HA_KEYBOARD) },
>  	{ }
> 

-- 
 i.


