Return-Path: <platform-driver-x86+bounces-3590-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEECE8D28DF
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2024 01:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9559F288635
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 May 2024 23:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B4D13FD8B;
	Tue, 28 May 2024 23:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+jw15C8"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D3813E029
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 23:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716940271; cv=none; b=u6XHQEK3yWKET6sc/+bqBzEY+nZW5vETu42ReYFT8lgHCCcFfrAM1lefjfjlJWtcPonAlClNeCWwP71eTe+OeHFH4semwPin9k3IOWK9gUAKdL3EjrBmynlB/ELcxT2MEotmBwUEgNmRAFnw8z6/tXUhQEhQr52PjKNmHqNfZps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716940271; c=relaxed/simple;
	bh=U6rd2u/yCnU0MQ4VXeRi1hcrtx+O94VJz7DpKLJXgOg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOeURW2I5Q1RJrB/fT2f08v3DZwrpZDaP/vu7EmO7DLQwkI9Y/EbUsYoU284ayuJP554F+j7Ynof59vlgJewrCTA3UX1K12fOVOmJLrHkmiV9Mfv9DXoaUrt3mejnad9R0NTRsp2Xe2VDbI982IE2h9wu0829nuUUhiFw/iVy+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V+jw15C8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42120e3911eso9621815e9.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 May 2024 16:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716940267; x=1717545067; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dnSBP1y73hXcLVKI9OFBOJOQjY/3gyc0Iux1Jkwjjpo=;
        b=V+jw15C8+aar+vke7hh19d3HSdFtotGesTwDabLAiIWPpsYkyOmbqFNVoK1LTc6ski
         8ONRe5Qv5OnVBg6Ci/T2Esy6t3OiQLX/ugXiHJDzLeiIE2ebVDSElwjQ3EfpYwnUZ1re
         dpkYlTrWCaO34j8keqaXwCZKx7iqMRsIUt5QhvGXFbAfJLejjXlY0baSaHpNUn34Jc5m
         ctAeevP8knFXDO4ZDVgwnKdzdqmmJl+W0+qrNXXhBr50UAqIOmQfrPLksTvM5M6a3zyE
         VzakXif8U9hpDuX2lsPRoXHKGdQOwOHScUWQxr9Rc9RCrnwaymXVh2VF3LD3yiVQENix
         /z2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716940267; x=1717545067;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dnSBP1y73hXcLVKI9OFBOJOQjY/3gyc0Iux1Jkwjjpo=;
        b=J9WUj5A/Dj9GFyZawiPMUqXLrqWLSOVYaPqTDQTATxZLN/EqQIMAEFMuyQ+1xaNgLe
         mA2VnWQYxU2I8jy08RD5fqc8FMSt7eA+YT/X3yj92rLL0Nge8mPrTg6jCUu3GxYgk+Sb
         8f4kDjg1QItyLVm2wvmdWakR8h7bEpgw8vXYUpegLTFQqhoHA9p/wMlEu9HiYTJKqDF8
         26fbtHrTO8U3cUfO8iahFIb0BQKZo3PGv/GYcti96Qi0kaXEPRxnmP0mz42vdQqBPSHs
         IVtJVEmZTzeNkvuNc6Uud7OqY0JR+Pq1wiQtkb4x+VvpBRPpeIC9MwBnkMsGtSxke2kQ
         ffHA==
X-Forwarded-Encrypted: i=1; AJvYcCV9TCEvxWSoTHz3CLkcR27ERilc1Nq+YFqUvBRYmdF0zrCKgVtpieC7HT/+PgDMUWWmSz6JJxHWj7d1tCMQNlfjGKAcww194++mD5vVEs7pOQyN2Q==
X-Gm-Message-State: AOJu0YxuAUCwB9gCi+AaQ51PLvtmPqAyFZo71eRePkxNkevGZuAR5jqZ
	ZVIFBc2eoVCuVSXh30hlC7LcnjlOIl36kJflx0fuLFfz9cEyTC2QYDEmuX0saio=
X-Google-Smtp-Source: AGHT+IGW+PMxhqpCnMYFAJtAcLClSa/LPe6M4D7yxH9tVsegfjt88HkF3gmo6+nhSpDmBiJRq2Ux+g==
X-Received: by 2002:a05:600c:3595:b0:41a:c170:701f with SMTP id 5b1f17b1804b1-421089f9828mr115015805e9.38.1716940266996;
        Tue, 28 May 2024 16:51:06 -0700 (PDT)
Received: from [192.168.0.23] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100eeb962sm193040335e9.1.2024.05.28.16.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 16:51:06 -0700 (PDT)
Message-ID: <2b76f27e-f223-4ff9-880e-9e232ce9ddc6@linaro.org>
Date: Wed, 29 May 2024 00:51:04 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] platform: arm64: add Lenovo Yoga C630 WOS EC
 driver
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Nikita Travkin <nikita@trvn.ru>
References: <20240528-yoga-ec-driver-v4-0-4fa8dfaae7b6@linaro.org>
 <20240528-yoga-ec-driver-v4-2-4fa8dfaae7b6@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240528-yoga-ec-driver-v4-2-4fa8dfaae7b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/05/2024 21:44, Dmitry Baryshkov wrote:
> Lenovo Yoga C630 WOS is a laptop using Snapdragon 850 SoC. Like many
> laptops it uses embedded controller (EC) to perform various platform

an embedded controller

> operations, including, but not limited, to Type-C port control or power
> supply handlng.
> 
> Add the driver for the EC, that creates devices for UCSI and power
> supply devices.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/platform/arm64/Kconfig                 |  14 ++
>   drivers/platform/arm64/Makefile                |   1 +
>   drivers/platform/arm64/lenovo-yoga-c630.c      | 279 +++++++++++++++++++++++++
>   include/linux/platform_data/lenovo-yoga-c630.h |  42 ++++
>   4 files changed, 336 insertions(+)
> 
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 8fdca0f8e909..8c103b3150d1 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -32,4 +32,18 @@ config EC_ACER_ASPIRE1
>   	  laptop where this information is not properly exposed via the
>   	  standard ACPI devices.
>   
> +config EC_LENOVO_YOGA_C630
> +	tristate "Lenovo Yoga C630 Embedded Controller driver"
> +	depends on I2C
> +	help
> +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> +	  Lenovo Yoga C630, which provides battery and power adapter
> +	  information.
> +
> +	  This driver provides battery and AC status support for the mentioned
> +	  laptop where this information is not properly exposed via the
> +	  standard ACPI devices.
> +
> +	  Say M or Y here to include this support.
> +
>   endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 4fcc9855579b..b2ae9114fdd8 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -6,3 +6,4 @@
>   #
>   
>   obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> +obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/lenovo-yoga-c630.c
> new file mode 100644
> index 000000000000..3d1d5acde807
> --- /dev/null
> +++ b/drivers/platform/arm64/lenovo-yoga-c630.c
> @@ -0,0 +1,279 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022-2024, Linaro Ltd
> + * Authors:
> + *    Bjorn Andersson
> + *    Dmitry Baryshkov
> + */
> +#include <linux/auxiliary_bus.h>
> +#include <linux/i2c.h>
> +#include <linux/module.h>
> +#include <linux/notifier.h>
> +#include <linux/platform_data/lenovo-yoga-c630.h>
> +
> +#define LENOVO_EC_RESPONSE_REG		0x01
> +#define LENOVO_EC_REQUEST_REG		0x02
> +
> +#define LENOVO_EC_UCSI_WRITE		0x20
> +#define LENOVO_EC_UCSI_READ		0x21
> +
> +#define LENOVO_EC_READ_REG		0xb0
> +#define LENOVO_EC_REQUEST_NEXT_EVENT	0x84
> +
> +struct yoga_c630_ec {
> +	struct i2c_client *client;
> +	struct mutex lock;
> +	struct blocking_notifier_head notifier_list;
> +};
> +
> +static int yoga_c630_ec_request(struct yoga_c630_ec *ec, u8 *req, size_t req_len,
> +				u8 *resp, size_t resp_len)
> +{
> +	int ret;
> +
> +	WARN_ON(!mutex_is_locked(&ec->lock));
> +
> +	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_REQUEST_REG,
> +					     req_len, req);
> +	if (ret < 0)
> +		return ret;
> +
> +	return i2c_smbus_read_i2c_block_data(ec->client, LENOVO_EC_RESPONSE_REG,
> +					     resp_len, resp);
> +}
> +
> +int yoga_c630_ec_read8(struct yoga_c630_ec *ec, u8 addr)
> +{
> +	u8 req[2] = { LENOVO_EC_READ_REG, };
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&ec->lock);
> +	req[1] = addr;
> +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &val, 1);
> +	mutex_unlock(&ec->lock);
> +
> +	return ret < 0 ? ret : val;
> +}
> +EXPORT_SYMBOL_GPL(yoga_c630_ec_read8);
> +
> +int yoga_c630_ec_read16(struct yoga_c630_ec *ec, u8 addr)
> +{
> +	u8 req[2] = { LENOVO_EC_READ_REG, };
> +	int ret;
> +	u8 msb;
> +	u8 lsb;
> +
> +	mutex_lock(&ec->lock);
> +
> +	req[1] = addr;
> +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &lsb, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	req[1] = addr + 1;
> +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &msb, 1);
> +
> +out:
> +	mutex_unlock(&ec->lock);
> +
> +	return ret < 0 ? ret : msb << 8 | lsb;
> +}
> +EXPORT_SYMBOL_GPL(yoga_c630_ec_read16);
> +
> +u16 yoga_c630_ec_ucsi_get_version(struct yoga_c630_ec *ec)
> +{
> +	u8 req[3] = { 0xb3, 0xf2, 0x20};

You have a define above for the read_reg and write_reg commands, could 
you not define 0xb3 as LENOVO_EC_GET_VERSION ?

All of the other commands here seem to have a named define.

> +	int ret;
> +	u8 msb;
> +	u8 lsb;
> +
> +	mutex_lock(&ec->lock);
> +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &lsb, 1);
> +	if (ret < 0)
> +		goto out;
> +
> +	req[2]++;

why not set reg[2] = 0x21;

also is req[2] some kind of address ?

> +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &msb, 1);
> +
> +out:
> +	mutex_unlock(&ec->lock);
> +
> +	return ret < 0 ? ret : msb << 8 | lsb;
> +}
> +EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_get_version);
> +
> +int yoga_c630_ec_ucsi_write(struct yoga_c630_ec *ec,
> +			    const u8 req[YOGA_C630_UCSI_WRITE_SIZE])
> +{
> +	int ret;
> +
> +	mutex_lock(&ec->lock);
> +	ret = i2c_smbus_write_i2c_block_data(ec->client, LENOVO_EC_UCSI_WRITE,
> +					     YOGA_C630_UCSI_WRITE_SIZE, req);
> +	mutex_unlock(&ec->lock);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_write);
> +
> +int yoga_c630_ec_ucsi_read(struct yoga_c630_ec *ec,
> +			   u8 resp[YOGA_C630_UCSI_READ_SIZE])
> +{
> +	int ret;
> +
> +	mutex_lock(&ec->lock);
> +	ret = i2c_smbus_read_i2c_block_data(ec->client, LENOVO_EC_UCSI_READ,
> +					    YOGA_C630_UCSI_READ_SIZE, resp);
> +	mutex_unlock(&ec->lock);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +EXPORT_SYMBOL_GPL(yoga_c630_ec_ucsi_read);
> +
> +static irqreturn_t yoga_c630_ec_intr(int irq, void *data)
> +{
> +	u8 req[] = { LENOVO_EC_REQUEST_NEXT_EVENT };
> +	struct yoga_c630_ec *ec = data;
> +	u8 event;
> +	int ret;
> +
> +	mutex_lock(&ec->lock);
> +	ret = yoga_c630_ec_request(ec, req, sizeof(req), &event, 1);
> +	mutex_unlock(&ec->lock);
> +	if (ret < 0)
> +		return IRQ_HANDLED;
> +
> +	pr_info("NOTIFY %x\n", event);

why not dev_info() ?

---
bod

