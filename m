Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22A8D2F8DE8
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Jan 2021 18:12:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728489AbhAPRL4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 16 Jan 2021 12:11:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728527AbhAPRLA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 12:11:00 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0CD1C061342;
        Sat, 16 Jan 2021 07:25:18 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id x20so1551884pjh.3;
        Sat, 16 Jan 2021 07:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=ggcboeLG4CFiFtKTGSmZVZcrJyJsvuMrSDAwMqdE0Kw=;
        b=Fg0xoK/E8ciPg/mwRymFV+R+5Iz3Vr5Rs5/D26WJfqwjCoI+uSJdBibnuGUB6B8RVy
         iKDDrgpk1/zp5U8E5qPbsc7ETvPEqIeatHaKLVcag3ZoMpOaDYR9EdNouy22GPy5Va+j
         8IPMp4vEhH26zvHT2ZTLO62NznYmCCgXMdIf2mRfh+nsKkKyxVFGBQXvYskL2+l94blS
         uNBACVSYgEY14WJoJ2s3p326vBdZ5YtRgppLw4H1gfUNRq6/w3eiOOnWV/EPlOr4vFBe
         igsy6LxUYi07Ttle0Hpz9+KQRZES7SvkmaS3ubZpx70K6lk8QjJa1rEWvoRCaatS+CcM
         nRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=ggcboeLG4CFiFtKTGSmZVZcrJyJsvuMrSDAwMqdE0Kw=;
        b=uDFmzDcmMTROkgJ10YVWpFi56HPN8C93miNuP4s7X6OyxzJEnu8hkrW/Fpw36JR+uh
         9Gw5GobU7YH9RwuNn1IriwiBglytQaboUQZt54hokyc96gQulLegUOSjgNqf4str4KRF
         3ZRT9akm71qX+/zOb5Ls10Zv5DB4Bm5QMiA/Z6VZcn8brbrBs5fcAdqX9CwQjoI1TiY8
         NbxdtT8yh8vnwIQKgRbioc5SzhcwMLoDM4u15DDNCfKThflvihUIqC+RFykCQG6xIT95
         S9NoGkMH72AkCJVMWC4IJ8Nl+egrszz6KqykZ140HaVP0lZ/7ywjZh48YXOxlJ8/CMWT
         yxQw==
X-Gm-Message-State: AOAM532UE2KtOkyOQK03F3nghV+HQwaNZCxHEvf12nU+BLXKftmlUFf5
        Jom5lwSBy+TERhR0D3KBcm1nWT75JKgwdBY6KjE=
X-Google-Smtp-Source: ABdhPJxlBQvDBqAYZSBgJqI+aBB93gRv3OC6vlButVnCPnHBM7zBU6tIiIWQV+INE0eIHIiOG3jQMg==
X-Received: by 2002:a17:90a:8d84:: with SMTP id d4mr16549986pjo.56.1610810717334;
        Sat, 16 Jan 2021 07:25:17 -0800 (PST)
Received: from [0.0.0.0] (n218250008152.netvigator.com. [218.250.8.152])
        by smtp.gmail.com with ESMTPSA id x15sm11017288pfi.184.2021.01.16.07.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Jan 2021 07:25:16 -0800 (PST)
Subject: Re: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "Yuan, Perry" <Perry.Yuan@dell.com>,
        "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <BY3PR19MB49131AA4EAE7C24D365FAC8DFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
From:   Perry Yuan <perry979106@gmail.com>
Message-ID: <44d8e280-c8f3-4e3a-7ef7-b68224c96def@gmail.com>
Date:   Sat, 16 Jan 2021 23:25:02 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <BY3PR19MB49131AA4EAE7C24D365FAC8DFAAA0@BY3PR19MB4913.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2021/1/13 1:50, Limonciello, Mario wrote:

>> -----Original Message-----
>> From: Yuan, Perry <Perry_Yuan@Dell.com>
>> Sent: Tuesday, January 12, 2021 11:18
>> To: oder_chiou@realtek.com; perex@perex.cz; tiwai@suse.com;
>> hdegoede@redhat.com; mgross@linux.intel.com
>> Cc: lgirdwood@gmail.com; broonie@kernel.org; alsa-devel@alsa-project.org;
>> linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org; Yuan,
>> Perry; Limonciello, Mario
>> Subject: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
>>
>> From: Perry Yuan <perry_yuan@dell.com>
>>
>> Some new Dell system is going to support audio internal micphone
>> privacy setting from hardware level with micmute led state changing
>> When micmute hotkey pressed by user, soft mute will need to be enabled
>> firstly in case of pop noise, and codec driver need to react to mic
>> mute event to EC(embedded controller) notifying that SW mute is completed
>> Then EC will do the hardware mute physically within the timeout reached
>>
>> This patch allow codec rt715 driver to ack EC when micmute key pressed
>> through this micphone led control interface like hda_generic provided
>> ACPI method defined in dell-privacy micmute led trigger will be called
>> for notifying the EC that software mute has been completed
>>
>> Signed-off-by: Perry Yuan <perry_yuan@dell.com>
>>
>> --------
>> v2 -> v3
>> * simplify the patch to reuse some val value
>> * add more detail to the commit info
>>
>> v1 -> v2:
>> * fix some format issue
>> --------
>> ---
>>   sound/soc/codecs/rt715-sdca.c | 16 ++++++++++++++++
>>   sound/soc/codecs/rt715-sdca.h |  1 +
>>   sound/soc/codecs/rt715.c      | 14 ++++++++++++++
>>   sound/soc/codecs/rt715.h      |  1 +
>>   4 files changed, 32 insertions(+)
>>
>> diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
>> index b43ac8559e45..861a0d2a8957 100644
>> --- a/sound/soc/codecs/rt715-sdca.c
>> +++ b/sound/soc/codecs/rt715-sdca.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/version.h>
>>   #include <linux/kernel.h>
>>   #include <linux/init.h>
>> +#include <linux/leds.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm.h>
>>   #include <linux/soundwire/sdw.h>
>> @@ -244,6 +245,7 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol
>> *kcontrol,
>>   	unsigned int max = mc->max;
>>   	int val;
>>
>> +	pr_err("++++++rt715_sdca_get_volsw++\n");
>>   	val = snd_soc_component_read(component, mc->reg);
>>   	if (val < 0)
>>   		return -EINVAL;
>> @@ -261,6 +263,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
>> *kcontrol,
>>   	struct snd_ctl_elem_value *ucontrol)
>>   {
>>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>> +	struct rt715_sdca_priv *rt715 =
>> snd_soc_component_get_drvdata(component);
>>   	struct soc_mixer_control *mc =
>>   		(struct soc_mixer_control *)kcontrol->private_value;
>>   	unsigned int val, val2, loop_cnt = 2, i;
>> @@ -268,6 +271,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
>> *kcontrol,
>>   	unsigned int reg2 = mc->rreg;
>>   	unsigned int reg = mc->reg;
>>   	unsigned int max = mc->max;
>> +	unsigned int val0, val1;
>>   	int err;
>>
>>   	val = ucontrol->value.integer.value[0];
>> @@ -287,6 +291,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol
>> *kcontrol,
>>   			return err;
>>   	}
>>
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +	/* dell privacy LED trigger state changed by muted/unmute switch */
>> +	if (mc->invert) {
>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>> value.integer.value[1]) {
>> +			rt715->micmute_led = LED_OFF;
>> +		} else {
>> +			rt715->micmute_led = LED_ON;
>> +		}
>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>> +	}
>> +#endif
>> +
>>   	return 0;
>>   }
>>
>> diff --git a/sound/soc/codecs/rt715-sdca.h b/sound/soc/codecs/rt715-sdca.h
>> index 840c237895dd..f8988ab88f80 100644
>> --- a/sound/soc/codecs/rt715-sdca.h
>> +++ b/sound/soc/codecs/rt715-sdca.h
>> @@ -31,6 +31,7 @@ struct rt715_sdca_priv {
>>   	int l_is_unmute;
>>   	int r_is_unmute;
>>   	int hw_sdw_ver;
>> +	bool micmute_led;
>>   };
>>
>>   struct rt715_sdw_stream_data {
>> diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
>> index cdcba70146da..b4e480744c94 100644
>> --- a/sound/soc/codecs/rt715.c
>> +++ b/sound/soc/codecs/rt715.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/init.h>
>>   #include <linux/delay.h>
>>   #include <linux/i2c.h>
>> +#include <linux/leds.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/pm.h>
>>   #include <linux/soundwire/sdw.h>
>> @@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
>> *kcontrol,
>>   		RT715_SET_GAIN_MIX_ADC2_L};
>>   	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>>   	unsigned int read_ll, read_rl, i, j, loop_cnt;
>> +	unsigned int val0, val1;
>>
>>   	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
>>   		strstr(ucontrol->id.name, "Main Capture Volume"))
>> @@ -95,6 +97,18 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol
>> *kcontrol,
>>   	else
>>   		loop_cnt = 1;
>>
>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>> +	/* Micmute LED state changed by muted/unmute switch */
>> +	if (mc->invert) {
>> +		if (ucontrol->value.integer.value[0] || ucontrol-
>>> value.integer.value[1]) {
>> +			rt715->micmute_led = LED_OFF;
>> +		} else {
>> +			rt715->micmute_led = LED_ON;
>> +		}
>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>> +	}
>> +#endif
>> +
> You might have missed my other comment on v2 feedback, but is there a reason
> to keep it behind a compile time flag for dell privacy module?  In practice
> any other future led backend provider should work too.  Another way to think
> about it - if dell privacy wasn't enabled would this cause a problem to run
> this code?  I think it would just be a no-op.
>
>>   	for (j = 0; j < loop_cnt; j++) {
>>   		/* Can't use update bit function, so read the original value first
>> */
>>   		if (loop_cnt == 1) {
>> diff --git a/sound/soc/codecs/rt715.h b/sound/soc/codecs/rt715.h
>> index 009a8266f606..57c9af041181 100644
>> --- a/sound/soc/codecs/rt715.h
>> +++ b/sound/soc/codecs/rt715.h
>> @@ -22,6 +22,7 @@ struct rt715_priv {
>>   	struct sdw_bus_params params;
>>   	bool hw_init;
>>   	bool first_hw_init;
>> +	bool micmute_led;
>>   };
>>
>>   struct sdw_stream_data {
>> --
>> 2.25.1

Pierre Louis suggested to just set the mic mute led state unconditionally .
It is more common interface to allow other platforms to change micmute led.
The discussion result is from "[PATCH v2 2/2] ASoC: rt715:add Mic Mute LED control support"

Here is the change compared to V3 ,the CONFIG_DELL_PRIVACY will be removed

-#if IS_ENABLED(CONFIG_DELL_PRIVACY)
-       /* dell privacy LED trigger state changed by muted/unmute switch */
+       /* MicMute LED state changed by muted/unmute switch */
         if (mc->invert) {
                 if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
                         rt715->micmute_led = LED_OFF;
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index b4e480744c94..60bb3d98103e 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -97,8 +97,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
         else
                 loop_cnt = 1;
  
-#if IS_ENABLED(CONFIG_DELL_PRIVACY)
-       /* Micmute LED state changed by muted/unmute switch */
+       /* MicMute LED state changed by muted/unmute switch */
         if (mc->invert) {
                 if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
                         rt715->micmute_led = LED_OFF;
@@ -107,7 +106,6 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
                 }
                 ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
         }
-#endif

