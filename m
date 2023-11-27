Return-Path: <platform-driver-x86+bounces-83-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE757F9B3D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Nov 2023 09:03:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BE221C20839
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Nov 2023 08:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5580210A0E;
	Mon, 27 Nov 2023 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="YgkMCfuK"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [IPv6:2a01:4f8:c0c:51f3::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 361DA113;
	Mon, 27 Nov 2023 00:03:45 -0800 (PST)
Message-ID: <3cae1ab1-841c-4414-9b70-76d6823cbd16@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1701072220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhZT5sF9qqZ1ZlYL72sPZsGsNpsxPgAaKiP8t2/TVjc=;
	b=YgkMCfuKrtjGiTR7PF75dj9nAVuqbA7D84Dpfc/62D7+nSf51ocn/Vy3YVDaIvZndrkh/e
	7RDSFLNhORKh6KLsb4QDldIGzEGOhzvTeWbAwikb6pgnohPwzg2bem0HMNx+KerMe/thaX
	LmOpqBhbWCLXETW1PtpX5IlQg+2bM0saVmK31/2vWsKl6kQSstM8a9ZimULQIyEOcsNCed
	80Hqf6R4TrTCeizdqN7OzdbqbGkIsunigHyop9Z2Xvz/Qn5Sf7PDLw8ZurRUTkn/jV/FbC
	ola6/Fcy6zUkA36BFynJ4nn/H2L7FRPBJmKYNqT3sIoO4JP+ha7yOCZe9fXhVg==
Date: Mon, 27 Nov 2023 15:03:34 +0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/1] platform/x86: asus-wmi: disable USB0 hub on ROG
 Ally before suspend
Content-Language: en-US
To: "Luke D. Jones" <luke@ljones.dev>, hdegoede@redhat.com
Cc: ilpo.jarvinen@linux.intel.com, corentin.chary@gmail.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231126230521.125708-1-luke@ljones.dev>
 <20231126230521.125708-2-luke@ljones.dev>
From: =?UTF-8?Q?Philip_M=C3=BCller?= <philm@manjaro.org>
Organization: Manjaro Community
In-Reply-To: <20231126230521.125708-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=philm@manjaro.org smtp.mailfrom=philm@manjaro.org

On 27.11.23 06:05, Luke D. Jones wrote:
> ASUS have worked around an issue in XInput where it doesn't support USB
> selective suspend, which causes suspend issues in Windows. They worked
> around this by adjusting the MCU firmware to disable the USB0 hub when
> the screen is switched off during the Microsoft DSM suspend path in ACPI.
> 
> The issue we have with this however is one of timing - the call the tells
> the MCU to this isn't able to complete before suspend is done so we call
> this in a prepare() and add a small msleep() to ensure it is done. This
> must be done before the screen is switched off to prevent a variety of
> possible races.
> 
> Further to this the MCU powersave option must also be disabled as it can
> cause a number of issues such as:
> - unreliable resume connection of N-Key
> - complete loss of N-Key if the power is plugged in while suspended
> Disabling the powersave option prevents this.
> 
> Without this the MCU is unable to initialise itself correctly on resume.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>
> ---
>   drivers/platform/x86/asus-wmi.c            | 50 ++++++++++++++++++++++
>   include/linux/platform_data/x86/asus-wmi.h |  3 ++
>   2 files changed, 53 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 6a79f16233ab..4ba33dfebfd4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -16,6 +16,7 @@
>   #include <linux/acpi.h>
>   #include <linux/backlight.h>
>   #include <linux/debugfs.h>
> +#include <linux/delay.h>
>   #include <linux/dmi.h>
>   #include <linux/fb.h>
>   #include <linux/hwmon.h>
> @@ -132,6 +133,11 @@ module_param(fnlock_default, bool, 0444);
>   #define ASUS_SCREENPAD_BRIGHT_MAX 255
>   #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
>   
> +/* Controls the power state of the USB0 hub on ROG Ally which input is on */
> +#define ASUS_USB0_PWR_EC0_CSEE "\\_SB.PCI0.SBRG.EC0.CSEE"
> +/* 300ms so far seems to produce a reliable result on AC and battery */
> +#define ASUS_USB0_PWR_EC0_CSEE_WAIT 300
> +
>   static const char * const ashs_ids[] = { "ATK4001", "ATK4002", NULL };
>   
>   static int throttle_thermal_policy_write(struct asus_wmi *);
> @@ -300,6 +306,9 @@ struct asus_wmi {
>   
>   	bool fnlock_locked;
>   
> +	/* The ROG Ally device requires the MCU USB device be disconnected before suspend */
> +	bool ally_mcu_usb_switch;
> +
>   	struct asus_wmi_debug debug;
>   
>   	struct asus_wmi_driver *driver;
> @@ -4488,6 +4497,8 @@ static int asus_wmi_add(struct platform_device *pdev)
>   	asus->nv_temp_tgt_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_NV_THERM_TARGET);
>   	asus->panel_overdrive_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_PANEL_OD);
>   	asus->mini_led_mode_available = asus_wmi_dev_is_present(asus, ASUS_WMI_DEVID_MINI_LED_MODE);
> +	asus->ally_mcu_usb_switch = acpi_has_method(NULL, ASUS_USB0_PWR_EC0_CSEE)
> +						&& dmi_match(DMI_BOARD_NAME, "RC71L");
>   
>   	err = fan_boost_mode_check_present(asus);
>   	if (err)
> @@ -4654,6 +4665,43 @@ static int asus_hotk_resume(struct device *device)
>   		asus_wmi_fnlock_update(asus);
>   
>   	asus_wmi_tablet_mode_get_state(asus);
> +
> +	return 0;
> +}
> +
> +static int asus_hotk_resume_early(struct device *device)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(device);
> +
> +	if (asus->ally_mcu_usb_switch) {
> +		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB8)))
> +			dev_err(device, "ROG Ally MCU failed to connect USB dev\n");
> +		else
> +			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
> +	return 0;
> +}
> +
> +static int asus_hotk_prepare(struct device *device)
> +{
> +	struct asus_wmi *asus = dev_get_drvdata(device);
> +	int result, err;
> +
> +	if (asus->ally_mcu_usb_switch) {
> +		/* When powersave is enabled it causes many issues with resume of USB hub */
> +		result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_MCU_POWERSAVE);
> +		if (result == 1) {
> +			dev_warn(device, "MCU powersave enabled, disabling to prevent resume issues");
> +			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_MCU_POWERSAVE, 0, &result);
> +			if (err || result != 1)
> +				dev_err(device, "Failed to set MCU powersave mode: %d\n", err);
> +		}
> +		/* sleep required to ensure USB0 is disabled before sleep continues */
> +		if (ACPI_FAILURE(acpi_execute_simple_method(NULL, ASUS_USB0_PWR_EC0_CSEE, 0xB7)))
> +			dev_err(device, "ROG Ally MCU failed to disconnect USB dev\n");
> +		else
> +			msleep(ASUS_USB0_PWR_EC0_CSEE_WAIT);
> +	}
>   	return 0;
>   }
>   
> @@ -4701,6 +4749,8 @@ static const struct dev_pm_ops asus_pm_ops = {
>   	.thaw = asus_hotk_thaw,
>   	.restore = asus_hotk_restore,
>   	.resume = asus_hotk_resume,
> +	.resume_early = asus_hotk_resume_early,
> +	.prepare = asus_hotk_prepare,
>   };
>   
>   /* Registration ***************************************************************/
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index 63e630276499..ab1c7deff118 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -114,6 +114,9 @@
>   /* Charging mode - 1=Barrel, 2=USB */
>   #define ASUS_WMI_DEVID_CHARGE_MODE	0x0012006C
>   
> +/* MCU powersave mode */
> +#define ASUS_WMI_DEVID_MCU_POWERSAVE   0x001200E2
> +
>   /* epu is connected? 1 == true */
>   #define ASUS_WMI_DEVID_EGPU_CONNECTED	0x00090018
>   /* egpu on/off */

Tested-by: Philip Mueller <philm@manjaro.org>


