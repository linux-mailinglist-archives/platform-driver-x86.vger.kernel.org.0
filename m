Return-Path: <platform-driver-x86+bounces-7045-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD179CFE4E
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Nov 2024 11:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 914CEB28C1D
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Nov 2024 10:43:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4C9A194AD7;
	Sat, 16 Nov 2024 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MeWQSxNV"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC58718A931
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731753820; cv=none; b=WbEPiGqsmBd8xDaJJDAPQjDmGzJMVr8lhVMGu5di6bwmafHDzw2wLCWOvxlu0YyaXexRtCYd0O+5ZKwPFj0sgNw8IWudkTwtQOrgTTW37ImXY3qRLy/nLVqzCoxdGudfHdAIUlLFT8/h9ew/vhsH1EcUe8xChScCpfaHFGJRHJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731753820; c=relaxed/simple;
	bh=kjk+3v5Y/1GXI1rVV2hj5frxGNVNRarI1Q0cTetzVZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RS44zVmPVf/0FvcBi2rP/lb/iZ7w2hs07aRvSDK+CN/sZkBuRHzYcswfAowhqMANQcWSDpT9XiFRy7kbIB+cPx6xngoRxNU6E+Cdmoc+8dINng28AXuIPE8BuDcW4a8Vfy1lz9CT486trAMhAvdoy9FtWWhXS6YUBVJcZdglKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MeWQSxNV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731753817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lgkpmPxBG0aTg3aGWwQ0D5/NyeWXzd+9Y9QxfhnYPWE=;
	b=MeWQSxNVxS6cfVevPZltaBySpyOoLBrKeQYe29KSjCobs5YMAjigUHqurq56NoAe49nSa0
	Mi5XfoTcEz9Qa157SVq+v/ndU+fGQYQ8Ea1fD9jvxyEB0Nxu2tUrFAaPRaiNxYN5ex1tOn
	priwjrZTB3RvcDtGF/6Ooj7l67dv/84=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-FZrs9rJ6Oym7resr8X5Owg-1; Sat, 16 Nov 2024 05:43:36 -0500
X-MC-Unique: FZrs9rJ6Oym7resr8X5Owg-1
X-Mimecast-MFC-AGG-ID: FZrs9rJ6Oym7resr8X5Owg
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a2593e9e9so31754266b.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 02:43:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731753815; x=1732358615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lgkpmPxBG0aTg3aGWwQ0D5/NyeWXzd+9Y9QxfhnYPWE=;
        b=Wo9dWYdcGGpHCIbfogHpuhqPi1GM1F6OGEiDEqKXGCqLH7MPkjmmmlJ5U+SwTOe6xP
         uZQDpVytyen0z3q48kOFHpJV3O6MSxuLxEBR1kQaOXLrRxruz6kgsyi9oSpyOW7ThVNu
         ATNje9OVlNZ3l4lfT9qVdiKv3S/A/nhIqMYGM4toZLZ6024RjVbxBRinDG40K79JR/4E
         +39uYTC7DG4uWvk/kQXg3cTuC1+KWzUvzlMOLdoZab/vZ6aq+jPuBtj2fbc6pMPaKoKB
         CfO3PBc9seFFwkTh3u5onJGaTl9yKgh3tO3HILnUioDQ2iC5CA/FnfCuXPQetBXdyhwK
         N53Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWVxvsmWc5ooWaqdZIL7y/HXezzT22fu0Td5veEukwFdZN0maPOKbVXm946cLMDc3gZbiK5aSRugBfWT0AmkfcxsU5@vger.kernel.org
X-Gm-Message-State: AOJu0YwqGmlf+GLZwH4P/af5T3SVXcfQQMyYbKpCXzqtjR2EhT7hGuw/
	MU2ca2Bv6uE/McKlnRCKAN3WCsOJrPdCsvZs/unFZvXSkctj1zSTV4k5HCHQqgX7bpcP593J3Tu
	AAc6VexUtRQVHvS8dj6gnFGZbFooQtkqFPws+34S7dYt6HnuO4y/e2t73xwvybOdcwD8eCH0=
X-Received: by 2002:a17:907:3e0f:b0:a99:8a0e:8710 with SMTP id a640c23a62f3a-aa48342150amr490839666b.14.1731753814815;
        Sat, 16 Nov 2024 02:43:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxPhQOkobuQKyTorxWn0xOeeBNX0GF2EKdVxhHtau6hXOkxkZ+c+iey8xNWiWIHBtbHuSRYg==
X-Received: by 2002:a17:907:3e0f:b0:a99:8a0e:8710 with SMTP id a640c23a62f3a-aa48342150amr490838166b.14.1731753814340;
        Sat, 16 Nov 2024 02:43:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cfaca26fdesm351899a12.47.2024.11.16.02.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 02:43:33 -0800 (PST)
Message-ID: <92301b83-b388-4559-bf26-3a2d281b0c5d@redhat.com>
Date: Sat, 16 Nov 2024 11:43:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add Vexia EDU ATLA
 10 EC battery driver
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
References: <20241104203555.61104-1-hdegoede@redhat.com>
 <20241104203555.61104-2-hdegoede@redhat.com>
 <CAHp75Vdkwg4pUs=k-GNv9wxuecVpMromh_F49bbfhYL7sxjwDg@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vdkwg4pUs=k-GNv9wxuecVpMromh_F49bbfhYL7sxjwDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Thank you for the reviews.

On 5-Nov-24 11:39 AM, Andy Shevchenko wrote:
> On Mon, Nov 4, 2024 at 10:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Vexia EDU ATLA 10 tablet has an embedded controller instead of
>> giving the os direct access to the charger + fuel-gauge ICs as is normal
>> on tablets designed for Android.
>>
>> There is ACPI Battery device in the DSDT using the EC which should work
>> expect that it expects the I2C controller to be enumerated as an ACPI
> 
> expect --> except
> 
>> device and the tablet's BIOS enumerates all LPSS devices as PCI devices
>> (and changing the LPSS BIOS settings from PCI -> ACPI does not work).
>>
>> Add a power_supply class driver for the Atla 10 EC to expert battery info
>> to userspace. This is made part of the x86-android-tablets directory and
>> Kconfig option because the i2c_client it binds to is instantiated by
>> the x86-android-tablets kmod.
> 
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> 
> ...
> 
>>  obj-$(CONFIG_X86_ANDROID_TABLETS) += x86-android-tablets.o
>> +obj-$(CONFIG_X86_ANDROID_TABLETS) += vexia_atla10_ec.o
> 
> This splits the original (compound) object lines, please move it
> either before (and this seems even better with ordering by name in
> mind) or after this block.
>>
> 
> Actually this blank line gives the false impression that the
> originally two lines are not related. I would drop this blank line as
> well.

Ack, both fixed for v2.

>>  x86-android-tablets-y := core.o dmi.o shared-psy-info.o \
>>                          asus.o lenovo.o other.o
> 
> ...
> 
>> +#include <linux/bits.h>
>> +#include <linux/devm-helpers.h>
> 
> + err.h
> 
>> +#include <linux/i2c.h>
>> +#include <linux/module.h>
>> +#include <linux/power_supply.h>
>> +#include <linux/types.h>
>> +#include <linux/workqueue.h>
>> +
>> +#include <asm/byteorder.h>
> 
> ...
> 
>> +/* From broken ACPI battery device in DSDT */
>> +#define ATLA10_EC_VOLTAGE_MIN_DESIGN           3750000
> 
> _uV ?
> 
> ...
> 
>> +struct atla10_ec_battery_state {
>> +       u8 len;                         /* Struct length excluding the len field, always 12 */
>> +       u8 status;                      /* Using ACPI Battery spec status bits */
>> +       u8 capacity;                    /* Percent */
>> +       __le16 charge_now;              /* mAh */
>> +       __le16 voltage_now;             /* mV */
>> +       __le16 current_now;             /* mA */
>> +       __le16 charge_full;             /* mAh */
>> +       __le16 temp;                    /* centi degrees celcius */
> 
> Celsius / celsius
> 
>> +} __packed;
>> +
>> +struct atla10_ec_battery_info {
>> +       u8 len;                         /* Struct length excluding the len field, always 6 */
>> +       __le16 charge_full_design;      /* mAh */
>> +       __le16 voltage_now;             /* mV, should be design voltage, but is not ? */
>> +       __le16 charge_full_design2;     /* mAh */
>> +} __packed;
> 
> Instead I would add the respective units to the variable names:
> _mAh
> _mV
> ...etc.
> 
> (* yes, with the capital letters to follow the proper spelling)

Done for v2.

> ...
> 
>> +static int atla10_ec_cmd(struct atla10_ec_data *data, u8 cmd, u8 len, u8 *values)
>> +{
>> +       struct device *dev = &data->client->dev;
>> +       int ret;
>> +
>> +       ret = i2c_smbus_read_i2c_block_data(data->client, cmd, len, values);
>> +       if (ret != len) {
>> +               dev_err(dev, "I2C command 0x%02x error: %d\n", cmd, ret);
>> +               return -EIO;
>> +       }
> 
>> +       if (values[0] != (len - 1)) {
> 
> Hmm... AFAIU this is part of SMBus protocol. Why do we need to care
> about this? Or is this an additional header on top of that?

Good point, I can indeed switch to i2c_smbus_read_block_data()
having it interpret the first read byte as len and drop the len field
from the struct definitions.

Done for v2.

>> +               dev_err(dev, "I2C command 0x%02x header length mismatch expected %u got %u\n",
>> +                       cmd, len - 1, values[0]);
>> +               return -EIO;
>> +       }
>> +
>> +       return 0;
>> +}
> 
> ...
> 
>> +               val->intval = min(charge_now, charge_full) * 1000;
> 
> MILLI (here and below)?

But this is not about converting from millis this is about going
from milles to micros.

Writing MILLI there is multiplying millis by milles_per_1 which
feels wrong. Now if there was a MILLIS_PER_MICRO that would make sense.

So I have kept this as is.

>> +               break;
>> +       case POWER_SUPPLY_PROP_VOLTAGE_NOW:
>> +               val->intval = le16_to_cpu(data->state.voltage_now) * 1000;
>> +               break;
>> +       case POWER_SUPPLY_PROP_CURRENT_NOW:
>> +               val->intval = le16_to_cpu(data->state.current_now) * 1000;
>> +               /*
>> +                * Documentation/ABI/testing/sysfs-class-power specifies
>> +                * negative current for discharing.
> 
> discharging

Ack.

Regards,

Hans




