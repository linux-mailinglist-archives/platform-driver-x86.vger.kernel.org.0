Return-Path: <platform-driver-x86+bounces-5617-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F351989108
	for <lists+platform-driver-x86@lfdr.de>; Sat, 28 Sep 2024 20:27:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC7BF1F2176B
	for <lists+platform-driver-x86@lfdr.de>; Sat, 28 Sep 2024 18:27:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3F5149C6A;
	Sat, 28 Sep 2024 18:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ETbitmjz"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBCD2AEEE
	for <platform-driver-x86@vger.kernel.org>; Sat, 28 Sep 2024 18:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727548075; cv=none; b=Ud3s2hh9rhUFSMAA0hWMqak/G02c0cTfjgSvh3k2YWNVd6iQ68ezXJWVRNAKOM/rgi9BySVacCcMj65k7dOvF+gtnjft5fyrgQCJzBFcoY1AgxItBXiJHpoUb1kP3RcTjJdiZ+oLG0JU0cFbT98vU0GwfLprb8tngGx8BnnlhsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727548075; c=relaxed/simple;
	bh=TeaENJjEU5JBBoHQ2aowfCVAk50H+CjXppvRksInNHk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NMsOYk9meVAnHCTp+wwt3/68CRopM+PiHPHedEvjmnX/f6ewvHJYOp9OG9NRGquxB0CkUw5hq4hYbz0wui60CvpGwU/OrxB4sm3BC7Sg8L43uh3ZHroabHoyixvovqKFpcX+6vxZsMtPmTwSsunqnM66ggOErEq6b84azO1fUns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ETbitmjz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727548072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bhengj+dgz1SZg//IZxDbLGJ1rsMPXjBU00ItGHc3PQ=;
	b=ETbitmjzP89zSvqsNpXC7FmcmCRbUvjRZ/NQKpCgtKLmgUHOTaazI0cug7Mk5OdE+Jx4rw
	RZA+SlZC2eQmOVQSMGPpyN2i4VcTDZtf3qWCgIyqPm8oZEzwjDB23AqboQCLu4aIgR7nuJ
	d7uW9Q74nWrbi7blOIH4NM5swJ2vmh0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-Asg2gqF7PLOyG9TY1f1IJw-1; Sat, 28 Sep 2024 14:27:50 -0400
X-MC-Unique: Asg2gqF7PLOyG9TY1f1IJw-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5c3c398b511so2326111a12.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 28 Sep 2024 11:27:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727548069; x=1728152869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bhengj+dgz1SZg//IZxDbLGJ1rsMPXjBU00ItGHc3PQ=;
        b=SxtQqQWWuHtmRsDEsT++BD2RmZ4zm8atWRmWjuV6Zz5BcikMNKzQS6C30fHZt7CNAs
         +T8GNoNOi93mWIq4QuKrnuaqY/qcAAXK9iJDcU86yVPVFh2WARa8xA20NGZ0SK9ji+Em
         2G9eXPwSI4sqY15WKY/NL//llrvnngcY3Ur9Vg42XUTcGyWIYSjysGNemClfziKo+pqF
         0Crw2iqc07VQNzcqS5m2t2XZOeGPn17cZWInCvreHFSrTVL2frTgTb3FQ+D+6nUnxti+
         j6G+RKLeyyLavti/CZkftryO+tNKx7P2CQxfb39P0WiL+vGqCilHg0g7m8eSNsQa1BJv
         hqhA==
X-Forwarded-Encrypted: i=1; AJvYcCX9wftqMojqrqx50vNYjcYG0PQkyfl85XYo1yNWvP36PyTbv8Z5m7j1YsLPVKtaiV7vmNxnHt3YoLOWsbykt7zN3HI/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6FxhlRBkPgxBvIfJxPidedEulJqz4Dr1BlV29lJfXzqRg577M
	Q5BVhgaq24nq7k/ByBY8dVq9Qiy3Cl62CJ7Cm8iEPzl//Gzfxv/+HwBqdZchCv2qPb0vzfy48bi
	b2uB6IYsWp3MqhbxV+uN5VYPe84YYIHZlnnoP1z8862MO3GE3wPY6HNpofHdghQoFOo5Ul6cgGy
	3p7Fr/iA==
X-Received: by 2002:a05:6402:3588:b0:5c7:1eae:2e6e with SMTP id 4fb4d7f45d1cf-5c8824cf63bmr6197608a12.4.1727548069210;
        Sat, 28 Sep 2024 11:27:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2hG58N0aftIf8AxYzcRUV7YD8cHD/TM4aNItzHNm1XPzp4839F3uHGj2/LuLhFEjEXiLt6g==
X-Received: by 2002:a05:6402:3588:b0:5c7:1eae:2e6e with SMTP id 4fb4d7f45d1cf-5c8824cf63bmr6197589a12.4.1727548068734;
        Sat, 28 Sep 2024 11:27:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c88245ea1dsm2408337a12.53.2024.09.28.11.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 11:27:48 -0700 (PDT)
Message-ID: <504de49f-63fc-4399-95f1-1ef3905ed74c@redhat.com>
Date: Sat, 28 Sep 2024 20:27:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] platform: arm64: Add driver for Lenovo Yoga Slim 7x's
 EC
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20240927185345.3680-1-maccraft123mc@gmail.com>
 <20240927185345.3680-2-maccraft123mc@gmail.com>
 <4365cae6-33e2-4b86-aab9-0b9ad112e6b0@redhat.com>
 <CAO_MupJTdo8+cpx2DHtC47WDQsFRVnB7xQFOmHiEQQzVmkFywg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAO_MupJTdo8+cpx2DHtC47WDQsFRVnB7xQFOmHiEQQzVmkFywg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 28-Sep-24 8:04 PM, Maya Matuszczyk wrote:
> Hi, thanks for taking a look at this driver.
> 
> sob., 28 wrz 2024 o 17:53 Hans de Goede <hdegoede@redhat.com> napisał(a):
>>
>> Hi Maya,
>>
>> Thank you for your patch. It is great to so people working on supporting
>> more ARM64 based laptop ECs.
>>
>> Note not a full review just one remark from a quick scan of the driver.
>>
>> On 27-Sep-24 8:53 PM, Maya Matuszczyk wrote:
>>> This patch adds a basic driver for the EC in Qualcomm Snapdragon X1
>>> Elite-based Lenovo Yoga Slim 7x.
>>>
>>> For now it supports only reporting that the AP is going to suspend and
>>> the microphone mute button, however the EC seems to also support reading
>>> fan information, other key combinations and thermal data.
>>>
>>> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
>>> ---
>>>  MAINTAINERS                                 |   1 +
>>>  drivers/platform/arm64/Kconfig              |  12 ++
>>>  drivers/platform/arm64/Makefile             |   1 +
>>>  drivers/platform/arm64/lenovo-yoga-slim7x.c | 202 ++++++++++++++++++++
>>>  4 files changed, 216 insertions(+)
>>>  create mode 100644 drivers/platform/arm64/lenovo-yoga-slim7x.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 0d4bfdde166d..f689cba80fa3 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -12906,6 +12906,7 @@ LENOVO YOGA SLIM 7X EC DRIVER
>>>  M:   Maya Matuszczyk <maccraft123mc@gmail.com>
>>>  S:   Maintained
>>>  F:   Documentation/devicetree/bindings/platform/lenovo,yoga-slim7x-ec.yaml
>>> +F:   drivers/platform/arm64/lenovo-yoga-slim7x.c
>>>
>>>  LETSKETCH HID TABLET DRIVER
>>>  M:   Hans de Goede <hdegoede@redhat.com>
>>> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
>>> index f88395ea3376..9ceae50f8b4e 100644
>>> --- a/drivers/platform/arm64/Kconfig
>>> +++ b/drivers/platform/arm64/Kconfig
>>> @@ -49,4 +49,16 @@ config EC_LENOVO_YOGA_C630
>>>
>>>         Say M or Y here to include this support.
>>>
>>> +config EC_LENOVO_YOGA_SLIM7X
>>> +     tristate "Lenovo Yoga Slim 7x Embedded Controller driver"
>>> +     depends on ARCH_QCOM || COMPILE_TEST
>>> +     depends on I2C
>>> +     help
>>> +       Select this option to enable driver for the EC found in the Lenovo
>>> +       Yoga Slim 7x.
>>> +
>>> +       This driver currently supports reporting input event for microphone
>>> +       mute button, and reporting device suspend to the EC so it can take
>>> +       appropriate actions.
>>> +
>>>  endif # ARM64_PLATFORM_DEVICES
>>> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
>>> index b2ae9114fdd8..70dfc1fb979d 100644
>>> --- a/drivers/platform/arm64/Makefile
>>> +++ b/drivers/platform/arm64/Makefile
>>> @@ -7,3 +7,4 @@
>>>
>>>  obj-$(CONFIG_EC_ACER_ASPIRE1)        += acer-aspire1-ec.o
>>>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
>>> +obj-$(CONFIG_EC_LENOVO_YOGA_SLIM7X) += lenovo-yoga-slim7x.o
>>> diff --git a/drivers/platform/arm64/lenovo-yoga-slim7x.c b/drivers/platform/arm64/lenovo-yoga-slim7x.c
>>> new file mode 100644
>>> index 000000000000..8f6d523395bc
>>> --- /dev/null
>>> +++ b/drivers/platform/arm64/lenovo-yoga-slim7x.c
>>> @@ -0,0 +1,202 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> +/*
>>> + * Copyright (c) 2024 Maya Matuszczyk <maya.matuszczyk@gmail.com>
>>> + */
>>> +#include <linux/auxiliary_bus.h>
>>> +#include <linux/cleanup.h>
>>> +#include <linux/device.h>
>>> +#include <linux/err.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/irqreturn.h>
>>> +#include <linux/lockdep.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mutex.h>
>>> +#include <linux/notifier.h>
>>> +#include <linux/slab.h>
>>> +#include <linux/input.h>
>>> +//#include <linux/platform_data/lenovo-yoga-slim7x.h>
>>> +
>>> +// These are the registers that i know about available from SMBUS
>>> +#define EC_IRQ_REASON_REG 0x05
>>> +#define EC_SUSPEND_RESUME_REG 0x23
>>> +#define EC_IRQ_ENABLE_REG 0x35
>>> +#define EC_BACKLIGHT_STATUS_REG 0x83
>>> +#define EC_MIC_MUTE_LED_REG 0x84
>>> +#define EC_AC_STATUS_REG 0x90
>>> +
>>> +// Valid values for EC_SUSPEND_RESUME_REG
>>> +#define EC_NOTIFY_SUSPEND_ENTER 0x01
>>> +#define EC_NOTIFY_SUSPEND_EXIT 0x00
>>> +#define EC_NOTIFY_SCREEN_OFF 0x03
>>> +#define EC_NOTIFY_SCREEN_ON 0x04
>>> +
>>> +// These are the values in EC_IRQ_REASON_REG that i could find in DSDT
>>> +#define EC_IRQ_MICMUTE_BUTTON 0x04
>>> +#define EC_IRQ_FAN1_STATUS_CHANGE 0x30
>>> +#define EC_IRQ_FAN2_STATUS_CHANGE 0x31
>>> +#define EC_IRQ_FAN1_SPEED_CHANGE 0x32
>>> +#define EC_IRQ_FAN2_SPEED_CHANGE 0x33
>>> +#define EC_IRQ_COMPLETED_LUT_UPDATE 0x34
>>> +#define EC_IRQ_COMPLETED_FAN_PROFILE_SWITCH 0x35
>>> +#define EC_IRQ_THERMISTOR_1_TEMP_THRESHOLD_CROSS 0x36
>>> +#define EC_IRQ_THERMISTOR_2_TEMP_THRESHOLD_CROSS 0x37
>>> +#define EC_IRQ_THERMISTOR_3_TEMP_THRESHOLD_CROSS 0x38
>>> +#define EC_IRQ_THERMISTOR_4_TEMP_THRESHOLD_CROSS 0x39
>>> +#define EC_IRQ_THERMISTOR_5_TEMP_THRESHOLD_CROSS 0x3a
>>> +#define EC_IRQ_THERMISTOR_6_TEMP_THRESHOLD_CROSS 0x3b
>>> +#define EC_IRQ_THERMISTOR_7_TEMP_THRESHOLD_CROSS 0x3c
>>> +#define EC_IRQ_RECOVERED_FROM_RESET 0x3d
>>> +#define EC_IRQ_LENOVO_SUPPORT_KEY 0x90
>>> +#define EC_IRQ_FN_Q 0x91
>>> +#define EC_IRQ_FN_M 0x92
>>> +#define EC_IRQ_FN_SPACE 0x93
>>> +#define EC_IRQ_FN_R 0x94
>>> +#define EC_IRQ_FNLOCK_ON 0x95
>>> +#define EC_IRQ_FNLOCK_OFF 0x96
>>> +#define EC_IRQ_FN_N 0x97
>>> +#define EC_IRQ_AI 0x9a
>>> +#define EC_IRQ_NPU 0x9b
>>> +
>>> +struct yoga_slim7x_ec {
>>> +     struct i2c_client *client;
>>> +     struct input_dev *idev;
>>> +     struct mutex lock;
>>> +};
>>> +
>>> +static irqreturn_t yoga_slim7x_ec_irq(int irq, void *data)
>>> +{
>>> +     struct yoga_slim7x_ec *ec = data;
>>> +     struct device *dev = &ec->client->dev;
>>> +     int val;
>>> +
>>> +     guard(mutex)(&ec->lock);
>>> +
>>> +     val = i2c_smbus_read_byte_data(ec->client, EC_IRQ_REASON_REG);
>>> +     if (val < 0) {
>>> +             dev_err(dev, "Failed to get EC IRQ reason: %d\n", val);
>>> +             return IRQ_HANDLED;
>>> +     }
>>> +
>>> +     switch (val) {
>>> +     case EC_IRQ_MICMUTE_BUTTON:
>>> +             input_report_key(ec->idev, KEY_MICMUTE, 1);
>>> +             input_sync(ec->idev);
>>> +             input_report_key(ec->idev, KEY_MICMUTE, 0);
>>> +             input_sync(ec->idev);
>>> +             break;
>>> +     default:
>>> +             dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);
>>> +     }
>>
>> I strongly suggest to use include/linux/input/sparse-keymap.h functionality
>> here. This will make adding new keys a lot easier and will allow re-mapping
>> codes from userspace.
>>
>> E.g. replace the whole switch-case with:
>>
>>         if (!sparse_keymap_report_event(ec->idev, val, 1, true))
>>                 dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);
>>
>> This takes care of mapping val -> KEY_MICMUTE, and doing all
>> the reporting (after calling sparse_keymap_setup() with an appropriate
>> keymap from probe())
> 
> Thank you for the suggestion. I'm not sure how to handle the non-key
> related IRQs, like fan status changes.
> Do you think they should be filtered out like this:
> if (val == 0x04 || (val >= 0x90 && val <= 0x97))

Yes drivers like this typically first check for special values
like above and then either do an early "return" or have
a structure like this:

	if (val == special)
		...
	else if (val == other-special)
		...
	else {
	        if (!sparse_keymap_report_event(ec->idev, val, 1, true))
	                dev_info(dev, "Unhandled EC IRQ reason: %d\n", val);	
	}

The top-level if () ... else if () ... else may also
be replaced with a switch () { case : ... case : ... }.

Note that if you just want to ignore the values you can also
do this in the keymap and generally speaking that is better,
only adding special cases like above if the driver actually
needs to undertake some special action in response to the IRQ.

static const struct key_entry keymap[] = {
	{ KE_KEY, EC_IRQ_MICMUTE_BUTTON, { KEY_MICMUTE } },
	{ KE_IGNORE, 0x04, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x90, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x91, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x92, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x93, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x94, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x95, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x96, { KEY_RESERVED } }, /* Fan status change */
	{ KE_IGNORE, 0x97, { KEY_RESERVED } }, /* Fan status change */
	{ KE_END }
};

In this case with the 0x90 - 0x97 range that is not really pretty,
but it probably still is best to keep the code consistent.

Regards,

Hans



