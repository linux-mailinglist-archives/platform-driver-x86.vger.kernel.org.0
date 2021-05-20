Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEA4838ADCC
	for <lists+platform-driver-x86@lfdr.de>; Thu, 20 May 2021 14:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235759AbhETMRj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 20 May 2021 08:17:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50438 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231520AbhETMR3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 May 2021 08:17:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621512967;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EZ3LkrfoFFvvoKmmJpuy1X8j6DuacU1dibRn4dbsZJc=;
        b=R4TiQexnXn+g6IBWYgmeqGKbQ/XPuDcUQNZqwwjOUxLJ0vj7y9REq85qhFINV+Jz+4ENmJ
        Pfsz5FCNkF6iUPDTtuD3B1B+MNeKonvu89H3qJXjuQw4g1Mfa1ua/bEtqFBqXWWpZ9e9dq
        cKrcxTIPueXNtB8b8bC91EpEhMsMTbY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-PSkH9SJ5PPi6zpiZCeKgUw-1; Thu, 20 May 2021 08:16:05 -0400
X-MC-Unique: PSkH9SJ5PPi6zpiZCeKgUw-1
Received: by mail-ej1-f69.google.com with SMTP id w13-20020a170906384db02903d9ad6b26d8so3039614ejc.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 May 2021 05:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EZ3LkrfoFFvvoKmmJpuy1X8j6DuacU1dibRn4dbsZJc=;
        b=Fwi8Ketx6JkwAfKn279h7iSOktM3GmU42H7TE8rKx1l0IsuEugvY1IkU0Joe25mXp4
         SZtzDrxTe0wG8rWvzvxudwWAkLBN6/UPCd4yyzmS5K9FeWP5HCbFanrtldFjWbuOPIKo
         Y24TEKglsZb3Tgi00aCU9hTW8wffqhevf+ELcs5sD4Vcz6+U1FbZvzpOZtVoYihiByPu
         BAvxYjasfBlhBXvr29hljafQgyCdUrDL9piEGLtyr/v5YHtWnbW9YNGr3KfQfX5xHIAd
         pMEOwINkX+W2Q5e3hu6iP/3Z2208Sz2CQBh1zYxALtIn1CvD/TuzY5HtN3R6O4R+aZB4
         T9Yw==
X-Gm-Message-State: AOAM532mTvqxj/zVPuPW4dbTKbpTC4ZxKOczDBk/CGHeEmJzzFLsBdlg
        97YU1db2z9C57blr+YKfCqFvTZQJaWclEYYecraJAwM2pR+3ts3AlbzoMKUeMNs+v3cIRPw0RE+
        eRvc4kmv9WxCvV1KfLW2/6vIPRO3ViOzIZQ==
X-Received: by 2002:a17:906:5fd1:: with SMTP id k17mr4348287ejv.78.1621512963561;
        Thu, 20 May 2021 05:16:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweOYOF0Nohvb1HO/SIEDtfv0PyRMjD8+w7ZTifeTHkomFysXwydFEPfS8VlB/fO1Dji11/1w==
X-Received: by 2002:a17:906:5fd1:: with SMTP id k17mr4348247ejv.78.1621512963161;
        Thu, 20 May 2021 05:16:03 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id p9sm1422394edu.79.2021.05.20.05.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 May 2021 05:16:02 -0700 (PDT)
Subject: Re: [PATCH v8 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
From:   Hans de Goede <hdegoede@redhat.com>
To:     Perry Yuan <Perry.Yuan@dell.com>, pobrn@protonmail.com,
        pierre-louis.bossart@linux.intel.com, oder_chiou@realtek.com,
        perex@perex.cz, tiwai@suse.com, mgross@linux.intel.com
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, mario.limonciello@outlook.com,
        Dell.Client.Kernel@dell.com
References: <20210506115605.1504-1-Perry_Yuan@Dell.com>
 <dc365954-65d7-2a9a-1e40-44f6bd7b140d@redhat.com>
Message-ID: <c70ddbd0-09ef-9ab1-6830-0116e632e576@redhat.com>
Date:   Thu, 20 May 2021 14:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <dc365954-65d7-2a9a-1e40-44f6bd7b140d@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Perry,

On 5/18/21 3:02 PM, Hans de Goede wrote:
> Hi Perry,
> 
> On 5/6/21 1:56 PM, Perry Yuan wrote:
>> From: Perry Yuan <perry_yuan@dell.com>
>>
>> add support for Dell privacy driver for the Dell units equipped
>> hardware privacy design, which protect users privacy of audio and
>> camera from hardware level. Once the audio or camera privacy mode
>> activated, any applications will not get any audio or video stream
>> when user pressed ctrl+F4 hotkey, audio privacy mode will be
>> enabled, micmute led will be also changed accordingly
>> The micmute led is fully controlled by hardware & EC(embedded controller)
>> and camera mute hotkey is Ctrl+F9. Currently design only emits
>> SW_CAMERA_LENS_COVER event while the camera lens shutter will be
>> changed by EC & HW(hardware) control
>>
>> *The flow is like this:
>> 1) User presses key. HW does stuff with this key (timeout timer is started)
>> 2) WMI event is emitted from BIOS to kernel
>> 3) WMI event is received by dell-privacy
>> 4) KEY_MICMUTE emitted from dell-privacy
>> 5) Userland picks up key and modifies kcontrol for SW mute
>> 6) Codec kernel driver catches and calls ledtrig_audio_set, like this:
>>    ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led ? LED_ON :LED_OFF);
>> 7) If "LED" is set to on dell-privacy notifies EC, and timeout is cancelled,
>>    HW mic mute activated. If EC not notified, HW mic mute will also be
>>    activated when timeout used up, it is just later than active ack
>>
>> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>>
>> ---
>> v7 -> v8:
>> * addressed feedback from Hans
>> * use sysfs_emit_at in the sysfs attributes
>> * Update Kconfig
>> * improve led_classdev_unregister logic in dell-laptop 
> 
> Thank you, this version looks good to me, with the exception of
> then issue with e.g. dell-wmi being builtin vs dell-privacy being
> a module which will lead to the kernel not compiling.
> 
> I've implemented the fix which I described/suggested in the discussion
> about this in the v7 thread.
> 
> I've attached 4 patches:
> 
> [PATCH 1/4] platform/x86: dell-wmi: Rename dell-wmi.c to dell-wmi-base.c
> -This is a preparation patch for the Makefile + Kconfig changes suggested
>  in the v7 email thread
> [PATCH 2/4] platform/x86: dell-privacy: Add support for Dell hardware privacy
> -This is your v8 patch (without any changes)
> [PATCH 3/4] FIXUP platform/x86: dell-privacy: Add support for Dell hardware privacy
> -This implements the discussed Makefile + Kconfig changes, as well as
>  renaming dell-privacy-wmi.? to dell-wmi-privacy.? to because the privacy
>  code now is a part of the dell-wmi module
> [PATCH 4/4] FIXUP platform/x86: dell-privacy: Add support for Dell hardware privacy
> -Some small changes from reviewing v8
> 
> I've also pushed these 4 to my review-hans branch. Perry, if you can let me know if
> the suggested changes in the 2 FIXUP patches are ok with you then I'll squash
> them into the 2/4 patch (so that only 1/2 and 2/2 remain) and then push this to
> for-next.

Perry, can you please let me know if you are ok with the changes from the 2
FIXME follow up patches which I attached to my previous email and which are
also in the pdx86/review-hans branch ?

I would like to ge this merged and I'm waiting for your ack for this.

Regards,

Hans


>> v6 -> v7:
>> * addressed feedback from Hans
>> * addressed feedback from Pierre
>> * optimize some debug format with dev_dbg()
>> v5 -> v6:
>> * remove platform driver,combined privacy acpi driver into single wmi
>>   driver file
>> * optimize sysfs interface with string added to be more clearly reading
>> * remove unused function and clear header file
>> v4 -> v5:
>> * addressed feedback from Randy Dunlap
>> * addressed feedback from Pierre-Louis Bossart
>> * rebase to latest 5.12 rc4 upstream kernel
>> * fix some space alignment problem
>> v3 -> v4:
>> * fix format for Kconfig
>> * add sysfs document
>> * add flow comments to the privacy wmi/acpi driver
>> * addressed feedback from Barnabás Pőcze[Thanks very much]
>> * export privacy_valid to make the global state simpler to query
>> * fix one issue which will block the dell-laptop driver to load when
>>   privacy driver invalid
>> * addressed feedback from Pierre-Louis Bossart,remove the EC ID match
>> v2 -> v3:
>> * add sysfs attributes doc
>> v1 -> v2:
>> * query EC handle from EC driver directly.
>> * fix some code style.
>> * add KEY_END to keymap array.
>> * clean platform device when cleanup called
>> * use hexadecimal format for log print in dev_dbg
>> * remove __set_bit for the report keys from probe.
>> * fix keymap leak
>> * add err_free_keymap in dell_privacy_wmi_probe
>> * wmi driver will be unregistered if privacy_acpi_init() fails
>> * add sysfs attribute files for user space query.
>> * add leds micmute driver to privacy acpi
>> * add more design info the commit info
>> ---
>> ---
>>  .../testing/sysfs-platform-dell-privacy-wmi   |  55 +++
>>  drivers/platform/x86/dell/Kconfig             |  14 +
>>  drivers/platform/x86/dell/Makefile            |   1 +
>>  drivers/platform/x86/dell/dell-laptop.c       |  13 +-
>>  drivers/platform/x86/dell/dell-privacy-wmi.c  | 394 ++++++++++++++++++
>>  drivers/platform/x86/dell/dell-privacy-wmi.h  |  25 ++
>>  drivers/platform/x86/dell/dell-wmi.c          |   9 +-
>>  7 files changed, 507 insertions(+), 4 deletions(-)
>>  create mode 100644 Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.c
>>  create mode 100644 drivers/platform/x86/dell/dell-privacy-wmi.h
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> new file mode 100644
>> index 000000000000..7f9e18705861
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-platform-dell-privacy-wmi
>> @@ -0,0 +1,55 @@
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_supported_type
>> +Date:		Apr 2021
>> +KernelVersion:	5.13
>> +Contact:	"perry.yuan@dell.com>"
>> +Description:
>> +		Display which dell hardware level privacy devices are supported
>> +		“Dell Privacy” is a set of HW, FW, and SW features to enhance
>> +		Dell’s commitment to platform privacy for MIC, Camera, and
>> +		ePrivacy screens.
>> +		The supported hardware privacy devices are:
>> +Attributes:
>> +		Microphone Mute:
>> +				Identifies the local microphone can be muted by hardware, no applications
>> +				is available to capture system mic sound
>> +
>> +		Camera Shutter:
>> +				Identifies camera shutter controlled by hardware, which is a micromechanical
>> +				shutter assembly that is built onto the camera module to block capturing images
>> +				from outside the laptop
>> +
>> +		supported:
>> +				The privacy device is supported by this system
>> +
>> +		unsupported:
>> +				The privacy device is not supported on this system
>> +
>> +		For example to check which privacy devices are supported:
>> +
>> +		# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_supported_type
>> +		[Microphone Mute] [supported]
>> +		[Camera Shutter] [supported]
>> +		[ePrivacy Screen] [unsupported]
>> +
>> +What:		/sys/bus/wmi/devices/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_current_state
>> +Date:		Apr 2021
>> +KernelVersion:	5.13
>> +Contact:	"perry.yuan@dell.com>"
>> +Description:
>> +		Allow user space to check current dell privacy device state.
>> +		Describes the Device State class exposed by BIOS which can be
>> +		consumed by various applications interested in knowing the Privacy
>> +		feature capabilities
>> +Attributes:
>> +		muted:
>> +			Identifies the privacy device is turned off and cannot send stream to OS applications
>> +
>> +		unmuted:
>> +			Identifies the privacy device is turned on ,audio or camera driver can get
>> +			stream from mic and camera module to OS applications
>> +
>> +		For example to check all supported current privacy device states:
>> +
>> +		# cat /sys/bus/wmi/drivers/dell-privacy/6932965F-1671-4CEB-B988-D3AB0A901919/dell_privacy_current_state
>> +		[Microphone] [unmuted]
>> +		[Camera Shutter] [unmuted]
>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
>> index e0a55337f51a..be570ccbbce0 100644
>> --- a/drivers/platform/x86/dell/Kconfig
>> +++ b/drivers/platform/x86/dell/Kconfig
>> @@ -204,4 +204,18 @@ config DELL_WMI_SYSMAN
>>  	  To compile this driver as a module, choose M here: the module will
>>  	  be called dell-wmi-sysman.
>>  
>> +config DELL_PRIVACY
>> +	tristate "Dell Hardware Privacy Support"
>> +	depends on ACPI
>> +	depends on ACPI_WMI
>> +	depends on INPUT
>> +	depends on DELL_LAPTOP
>> +	depends on LEDS_TRIGGER_AUDIO
>> +	depends on DELL_WMI
>> +	help
>> +	  This driver provides integration with the "Dell Hardware Privacy" feature
>> +	  of Dell laptops.
>> +
>> +	  To compile this driver as a module, choose M here: the module will
>> +	  be called dell_privacy.
>>  endif # X86_PLATFORM_DRIVERS_DELL
>> diff --git a/drivers/platform/x86/dell/Makefile b/drivers/platform/x86/dell/Makefile
>> index d720a3e42ae3..7da0c33dfcca 100644
>> --- a/drivers/platform/x86/dell/Makefile
>> +++ b/drivers/platform/x86/dell/Makefile
>> @@ -19,3 +19,4 @@ obj-$(CONFIG_DELL_WMI_AIO)		+= dell-wmi-aio.o
>>  obj-$(CONFIG_DELL_WMI_DESCRIPTOR)	+= dell-wmi-descriptor.o
>>  obj-$(CONFIG_DELL_WMI_LED)		+= dell-wmi-led.o
>>  obj-$(CONFIG_DELL_WMI_SYSMAN)		+= dell-wmi-sysman/
>> +obj-$(CONFIG_DELL_PRIVACY)              += dell-privacy-wmi.o
>> diff --git a/drivers/platform/x86/dell/dell-laptop.c b/drivers/platform/x86/dell/dell-laptop.c
>> index 70edc5bb3a14..529547fb0cb1 100644
>> --- a/drivers/platform/x86/dell/dell-laptop.c
>> +++ b/drivers/platform/x86/dell/dell-laptop.c
>> @@ -31,6 +31,8 @@
>>  #include "dell-rbtn.h"
>>  #include "dell-smbios.h"
>>  
>> +#include "dell-privacy-wmi.h"
>> +
>>  struct quirk_entry {
>>  	bool touchpad_led;
>>  	bool kbd_led_not_present;
>> @@ -90,6 +92,7 @@ static struct rfkill *wifi_rfkill;
>>  static struct rfkill *bluetooth_rfkill;
>>  static struct rfkill *wwan_rfkill;
>>  static bool force_rfkill;
>> +static bool micmute_led_registered;
>>  
>>  module_param(force_rfkill, bool, 0444);
>>  MODULE_PARM_DESC(force_rfkill, "enable rfkill on non whitelisted models");
>> @@ -2205,11 +2208,13 @@ static int __init dell_init(void)
>>  	dell_laptop_register_notifier(&dell_laptop_notifier);
>>  
>>  	if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>> -	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) {
>> +	    dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE) &&
>> +	    !dell_privacy_present()) {
>>  		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>>  		ret = led_classdev_register(&platform_device->dev, &micmute_led_cdev);
>>  		if (ret < 0)
>>  			goto fail_led;
>> +		micmute_led_registered = true;
>>  	}
>>  
>>  	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
>> @@ -2257,7 +2262,8 @@ static int __init dell_init(void)
>>  fail_get_brightness:
>>  	backlight_device_unregister(dell_backlight_device);
>>  fail_backlight:
>> -	led_classdev_unregister(&micmute_led_cdev);
>> +	if (micmute_led_registered)
>> +		led_classdev_unregister(&micmute_led_cdev);
>>  fail_led:
>>  	dell_cleanup_rfkill();
>>  fail_rfkill:
>> @@ -2278,7 +2284,8 @@ static void __exit dell_exit(void)
>>  		touchpad_led_exit();
>>  	kbd_led_exit();
>>  	backlight_device_unregister(dell_backlight_device);
>> -	led_classdev_unregister(&micmute_led_cdev);
>> +	if (micmute_led_registered)
>> +		led_classdev_unregister(&micmute_led_cdev);
>>  	dell_cleanup_rfkill();
>>  	if (platform_device) {
>>  		platform_device_unregister(platform_device);
>> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.c b/drivers/platform/x86/dell/dell-privacy-wmi.c
>> new file mode 100644
>> index 000000000000..a32d0fbd99da
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.c
>> @@ -0,0 +1,394 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Dell privacy notification driver
>> + *
>> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <linux/acpi.h>
>> +#include <linux/bitops.h>
>> +#include <linux/input.h>
>> +#include <linux/input/sparse-keymap.h>
>> +#include <linux/list.h>
>> +#include <linux/leds.h>
>> +#include <linux/module.h>
>> +#include <linux/wmi.h>
>> +
>> +#include "dell-privacy-wmi.h"
>> +
>> +#define DELL_PRIVACY_GUID "6932965F-1671-4CEB-B988-D3AB0A901919"
>> +#define MICROPHONE_STATUS		BIT(0)
>> +#define CAMERA_STATUS		        BIT(1)
>> +#define DELL_PRIVACY_AUDIO_EVENT  0x1
>> +#define DELL_PRIVACY_CAMERA_EVENT 0x2
>> +#define led_to_priv(c)       container_of(c, struct privacy_wmi_data, cdev)
>> +
>> +/*
>> + * The wmi_list is used to store the privacy_priv struct with mutex protecting
>> + */
>> +static LIST_HEAD(wmi_list);
>> +static DEFINE_MUTEX(list_mutex);
>> +
>> +struct privacy_wmi_data {
>> +	struct input_dev *input_dev;
>> +	struct wmi_device *wdev;
>> +	struct list_head list;
>> +	struct led_classdev cdev;
>> +	u32 features_present;
>> +	u32 last_status;
>> +};
>> +
>> +/* DELL Privacy Type */
>> +enum dell_hardware_privacy_type {
>> +	DELL_PRIVACY_TYPE_AUDIO = 0,
>> +	DELL_PRIVACY_TYPE_CAMERA,
>> +	DELL_PRIVACY_TYPE_SCREEN,
>> +	DELL_PRIVACY_TYPE_MAX,
>> +};
>> +
>> +static const char * const privacy_types[DELL_PRIVACY_TYPE_MAX] = {
>> +	[DELL_PRIVACY_TYPE_AUDIO] = "Microphone",
>> +	[DELL_PRIVACY_TYPE_CAMERA] = "Camera Shutter",
>> +	[DELL_PRIVACY_TYPE_SCREEN] = "ePrivacy Screen",
>> +};
>> +
>> +/*
>> + * Keymap for WMI privacy events of type 0x0012
>> + */
>> +static const struct key_entry dell_wmi_keymap_type_0012[] = {
>> +	/* privacy mic mute */
>> +	{ KE_KEY, 0x0001, { KEY_MICMUTE } },
>> +	/* privacy camera mute */
>> +	{ KE_SW,  0x0002, { SW_CAMERA_LENS_COVER } },
>> +	{ KE_END, 0},
>> +};
>> +
>> +/*
>> + * global privacy state for other modules to query if the privacy driver loaded successfully
>> + * or no privacy WMI device was detected at initial probe phase
>> + */
>> +bool dell_privacy_present(void)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +
>> +	mutex_lock(&list_mutex);
>> +	priv = list_first_entry_or_null(&wmi_list,
>> +			struct privacy_wmi_data,
>> +			list);
>> +	mutex_unlock(&list_mutex);
>> +
>> +	return priv && (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO));
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_present);
>> +
>> +/*
>> + * The flow of privacy event:
>> + * 1) User presses key. HW does stuff with this key (timeout is started)
>> + * 2) WMI event is emitted from BIOS
>> + * 3) WMI event is received by dell-privacy
>> + * 4) KEY_MICMUTE emitted from dell-privacy
>> + * 5) Userland picks up key and modifies kcontrol for SW mute
>> + * 6) Codec kernel driver catches and calls ledtrig_audio_set defined by
>> + *    dell-privacy-acpi driver. Codec driver will call like this to switch micmute led state.
>> + *    ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led ? LED_ON :LED_OFF);
>> + * 7) If "LED" is set to on dell-privacy notifies EC,and timeout is cancelled,
>> + *	HW mic mute activated.
>> + */
>> +bool dell_privacy_process_event(int type, int code, int status)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +	const struct key_entry *key;
>> +	bool ret = false;
>> +
>> +	mutex_lock(&list_mutex);
>> +	priv = list_first_entry_or_null(&wmi_list,
>> +			struct privacy_wmi_data,
>> +			list);
>> +	if (!priv)
>> +		goto error;
>> +
>> +	key = sparse_keymap_entry_from_scancode(priv->input_dev, (type << 16) | code);
>> +	if (!key) {
>> +		dev_warn(&priv->wdev->dev, "Unknown key with type 0x%04x and code 0x%04x pressed\n",
>> +			type, code);
>> +		goto error;
>> +	}
>> +	dev_dbg(&priv->wdev->dev, "Key with type 0x%04x and code 0x%04x pressed\n", type, code);
>> +
>> +	switch (code) {
>> +	case DELL_PRIVACY_AUDIO_EVENT: /* Mic mute */
>> +	case DELL_PRIVACY_CAMERA_EVENT: /* Camera mute */
>> +		priv->last_status = status;
>> +		sparse_keymap_report_entry(priv->input_dev, key, 1, true);
>> +		ret = true;
>> +		break;
>> +	default:
>> +		dev_dbg(&priv->wdev->dev, "unknown event type 0x%04x 0x%04x\n", type, code);
>> +	}
>> +
>> +error:
>> +	mutex_unlock(&list_mutex);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(dell_privacy_process_event);
>> +
>> +static ssize_t dell_privacy_supported_type_show(struct device *dev,
>> +					struct device_attribute *attr,
>> +					char *buf)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +	enum dell_hardware_privacy_type type;
>> +	u32 privacy_list;
>> +	int len = 0;
>> +
>> +	privacy_list = priv->features_present;
>> +	for (type = DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; type++) {
>> +		if (privacy_list & BIT(type))
>> +			len += sysfs_emit_at(buf, len, "[%s] [supported]\n", privacy_types[type]);
>> +		else
>> +			len += sysfs_emit_at(buf, len, "[%s] [unsupported]\n", privacy_types[type]);
>> +	}
>> +
>> +	return len;
>> +}
>> +
>> +static ssize_t dell_privacy_current_state_show(struct device *dev,
>> +					struct device_attribute *attr,
>> +					char *buf)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +	u32 privacy_supported = priv->features_present;
>> +	enum dell_hardware_privacy_type type;
>> +	u32 privacy_state = priv->last_status;
>> +	int len = 0;
>> +
>> +	for (type = DELL_PRIVACY_TYPE_AUDIO; type < DELL_PRIVACY_TYPE_MAX; type++) {
>> +		if (privacy_supported & BIT(type)) {
>> +			if (privacy_state & BIT(type))
>> +				len += sysfs_emit_at(buf, len, "[%s] [unmuted]\n", privacy_types[type]);
>> +			else
>> +				len += sysfs_emit_at(buf, len, "[%s] [muted]\n", privacy_types[type]);
>> +		}
>> +	}
>> +
>> +	return len;
>> +}
>> +
>> +static DEVICE_ATTR_RO(dell_privacy_supported_type);
>> +static DEVICE_ATTR_RO(dell_privacy_current_state);
>> +
>> +static struct attribute *privacy_attributes[] = {
>> +	&dev_attr_dell_privacy_supported_type.attr,
>> +	&dev_attr_dell_privacy_current_state.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group privacy_attribute_group = {
>> +	.attrs = privacy_attributes
>> +};
>> +
>> +/*
>> + * Describes the Device State class exposed by BIOS which can be consumed by
>> + * various applications interested in knowing the Privacy feature capabilities.
>> + * class DeviceState
>> + * {
>> + *  [key, read] string InstanceName;
>> + *  [read] boolean ReadOnly;
>> + *
>> + *  [WmiDataId(1), read] uint32 DevicesSupported;
>> + *   0 - None; 0x1 - Microphone; 0x2 - Camera; 0x4 - ePrivacy  Screen
>> + *
>> + *  [WmiDataId(2), read] uint32 CurrentState;
>> + *   0 - Off; 1 - On; Bit0 - Microphone; Bit1 - Camera; Bit2 - ePrivacyScreen
>> + * };
>> + */
>> +static int get_current_status(struct wmi_device *wdev)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +	union acpi_object *obj_present;
>> +	u32 *buffer;
>> +	int ret = 0;
>> +
>> +	if (!priv) {
>> +		dev_err(&wdev->dev, "dell privacy priv is NULL\n");
>> +		return -EINVAL;
>> +	}
>> +	/* check privacy support features and device states */
>> +	obj_present = wmidev_block_query(wdev, 0);
>> +	if (!obj_present) {
>> +		dev_err(&wdev->dev, "failed to read Binary MOF\n");
>> +		return -EIO;
>> +	}
>> +
>> +	if (obj_present->type != ACPI_TYPE_BUFFER) {
>> +		dev_err(&wdev->dev, "Binary MOF is not a buffer!\n");
>> +		ret = -EIO;
>> +		goto obj_free;
>> +	}
>> +	/*  Although it's not technically a failure, this would lead to
>> +	 *  unexpected behavior
>> +	 */
>> +	if (obj_present->buffer.length != 8) {
>> +		dev_err(&wdev->dev, "Dell privacy buffer has unexpected length (%d)!\n",
>> +				obj_present->buffer.length);
>> +		ret = -EINVAL;
>> +		goto obj_free;
>> +	}
>> +	buffer = (u32 *)obj_present->buffer.pointer;
>> +	priv->features_present = buffer[0];
>> +	priv->last_status = buffer[1];
>> +
>> +obj_free:
>> +	kfree(obj_present);
>> +	return ret;
>> +}
>> +
>> +static int dell_privacy_micmute_led_set(struct led_classdev *led_cdev,
>> +					enum led_brightness brightness)
>> +{
>> +	struct privacy_wmi_data *priv = led_to_priv(led_cdev);
>> +	static char *acpi_method = (char *)"ECAK";
>> +	acpi_status status;
>> +	acpi_handle handle;
>> +
>> +	handle = ec_get_handle();
>> +	if (!handle)
>> +		return -EIO;
>> +
>> +	if (!acpi_has_method(handle, acpi_method))
>> +		return -EIO;
>> +
>> +	status = acpi_evaluate_object(handle, acpi_method, NULL, NULL);
>> +	if (ACPI_FAILURE(status)) {
>> +		dev_err(&priv->wdev->dev, "Error setting privacy EC ack value: %s\n",
>> +				acpi_format_exception(status));
>> +		return -EIO;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Pressing the mute key activates a time delayed circuit to physically cut
>> + * off the mute. The LED is in the same circuit, so it reflects the true
>> + * state of the HW mute.  The reason for the EC "ack" is so that software
>> + * can first invoke a SW mute before the HW circuit is cut off.  Without SW
>> + * cutting this off first does not affect the time delayed muting or status
>> + * of the LED but there is a possibility of a "popping" noise.
>> + *
>> + * If the EC receives the SW ack, the circuit will be activated before the
>> + * delay completed.
>> + *
>> + * Exposing as an LED device allows the codec drivers notification path to
>> + * EC ACK to work
>> + */
>> +static int dell_privacy_leds_setup(struct device *dev)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(dev);
>> +
>> +	priv->cdev.name = "dell-privacy::micmute";
>> +	priv->cdev.max_brightness = 1;
>> +	priv->cdev.brightness_set_blocking = dell_privacy_micmute_led_set;
>> +	priv->cdev.default_trigger = "audio-micmute";
>> +	priv->cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
>> +	return devm_led_classdev_register(dev, &priv->cdev);
>> +}
>> +
>> +static int dell_privacy_wmi_probe(struct wmi_device *wdev, const void *context)
>> +{
>> +	struct privacy_wmi_data *priv;
>> +	struct key_entry *keymap;
>> +	int ret, i;
>> +
>> +	ret = wmi_has_guid(DELL_PRIVACY_GUID);
>> +	if (!ret)
>> +		pr_debug("Unable to detect available Dell privacy devices!\n");
>> +
>> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +	priv->wdev = wdev;
>> +	/* create evdev passing interface */
>> +	priv->input_dev = devm_input_allocate_device(&wdev->dev);
>> +	if (!priv->input_dev)
>> +		return -ENOMEM;
>> +
>> +	/* remap the wmi keymap event to new keymap */
>> +	keymap = kcalloc(ARRAY_SIZE(dell_wmi_keymap_type_0012),
>> +			sizeof(struct key_entry), GFP_KERNEL);
>> +	if (!keymap)
>> +		return -ENOMEM;
>> +
>> +	/* remap the keymap code with Dell privacy key type 0x12 as prefix
>> +	 * KEY_MICMUTE scancode will be reported as 0x120001
>> +	 */
>> +	for (i = 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
>> +		keymap[i] = dell_wmi_keymap_type_0012[i];
>> +		keymap[i].code |= (0x0012 << 16);
>> +	}
>> +	ret = sparse_keymap_setup(priv->input_dev, keymap, NULL);
>> +	kfree(keymap);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->input_dev->dev.parent = &wdev->dev;
>> +	priv->input_dev->name = "Dell Privacy Driver";
>> +	priv->input_dev->id.bustype = BUS_HOST;
>> +
>> +	ret = input_register_device(priv->input_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = get_current_status(priv->wdev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = devm_device_add_group(&wdev->dev, &privacy_attribute_group);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (priv->features_present & BIT(DELL_PRIVACY_TYPE_AUDIO)) {
>> +		ret = dell_privacy_leds_setup(&priv->wdev->dev);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +	mutex_lock(&list_mutex);
>> +	list_add_tail(&priv->list, &wmi_list);
>> +	mutex_unlock(&list_mutex);
>> +	return 0;
>> +}
>> +
>> +static int dell_privacy_wmi_remove(struct wmi_device *wdev)
>> +{
>> +	struct privacy_wmi_data *priv = dev_get_drvdata(&wdev->dev);
>> +
>> +	mutex_lock(&list_mutex);
>> +	list_del(&priv->list);
>> +	mutex_unlock(&list_mutex);
>> +	return 0;
>> +}
>> +
>> +static const struct wmi_device_id dell_wmi_privacy_wmi_id_table[] = {
>> +	{ .guid_string = DELL_PRIVACY_GUID },
>> +	{ },
>> +};
>> +
>> +static struct wmi_driver dell_privacy_wmi_driver = {
>> +	.driver = {
>> +		.name = "dell-privacy",
>> +	},
>> +	.probe = dell_privacy_wmi_probe,
>> +	.remove = dell_privacy_wmi_remove,
>> +	.id_table = dell_wmi_privacy_wmi_id_table,
>> +};
>> +
>> +module_wmi_driver(dell_privacy_wmi_driver);
>> +
>> +MODULE_DEVICE_TABLE(wmi, dell_wmi_privacy_wmi_id_table);
>> +MODULE_AUTHOR("Perry Yuan <perry_yuan@dell.com>");
>> +MODULE_DESCRIPTION("Dell Privacy WMI Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/dell/dell-privacy-wmi.h b/drivers/platform/x86/dell/dell-privacy-wmi.h
>> new file mode 100644
>> index 000000000000..54004eed7213
>> --- /dev/null
>> +++ b/drivers/platform/x86/dell/dell-privacy-wmi.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * Dell privacy notification driver
>> + *
>> + * Copyright (C) 2021 Dell Inc. All Rights Reserved.
>> + */
>> +
>> +#ifndef _DELL_PRIVACY_WMI_H_
>> +#define _DELL_PRIVACY_WMI_H_
>> +
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +bool dell_privacy_present(void);
>> +bool dell_privacy_process_event(int type, int code, int status);
>> +#else /* CONFIG_DELL_PRIVACY */
>> +static inline bool dell_privacy_present(void)
>> +{
>> +	return -ENODEV;
>> +}
>> +
>> +static inline bool dell_privacy_process_event(int type, int code, int status)
>> +{
>> +	return false;
>> +}
>> +#endif /* CONFIG_DELL_PRIVACY */
>> +#endif
>> diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
>> index bbdb3e860892..20367a580fa0 100644
>> --- a/drivers/platform/x86/dell/dell-wmi.c
>> +++ b/drivers/platform/x86/dell/dell-wmi.c
>> @@ -27,6 +27,7 @@
>>  #include <acpi/video.h>
>>  #include "dell-smbios.h"
>>  #include "dell-wmi-descriptor.h"
>> +#include "dell-privacy-wmi.h"
>>  
>>  MODULE_AUTHOR("Matthew Garrett <mjg@redhat.com>");
>>  MODULE_AUTHOR("Pali Rohár <pali@kernel.org>");
>> @@ -427,7 +428,6 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>  
>>  		switch (buffer_entry[1]) {
>>  		case 0x0000: /* One key pressed or event occurred */
>> -		case 0x0012: /* Event with extended data occurred */
>>  			if (len > 2)
>>  				dell_wmi_process_key(wdev, buffer_entry[1],
>>  						     buffer_entry[2]);
>> @@ -439,6 +439,13 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>>  				dell_wmi_process_key(wdev, buffer_entry[1],
>>  						     buffer_entry[i]);
>>  			break;
>> +		case 0x0012:
>> +			if ((len > 4) && dell_privacy_process_event(buffer_entry[1], buffer_entry[3],
>> +								    buffer_entry[4]))
>> +				/* dell_privacy_process_event has handled the event */;
>> +			else if (len > 2)
>> +				dell_wmi_process_key(wdev, buffer_entry[1], buffer_entry[2]);
>> +			break;
>>  		default: /* Unknown event */
>>  			pr_info("Unknown WMI event type 0x%x\n",
>>  				(int)buffer_entry[1]);
>>

