Return-Path: <platform-driver-x86+bounces-4029-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97F913B68
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2024 15:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 409961C209A0
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2024 13:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EF719B3E1;
	Sun, 23 Jun 2024 13:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xh1NOM0E"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EB119AA53
	for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 13:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719150335; cv=none; b=Iw9TOxQpHCKJTU2k5cw4KsfzYtSSYfmBDToLOZ3li4SEtyvMBERlX+b0tTeKEjha71x4R3gbsnRsypJJmSDvmHYq2YsgbvT+RMHQ5DEYe55yQckg280nWZ6Lt0aXut9Jx7LRLVIpellb5Udf/JHUtKHzq8OjeYp2xs2Vo1ogqGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719150335; c=relaxed/simple;
	bh=MpAc++c+m47Jic3K7YqmbjVe+SJS4IdaFj6KE+Q7SZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hqt9TuP7OpZ+rW+1Bv+cL66sgrPHvK6BYsbHnF0itkjy3BeBfZdlk+PsNYnQ2BMjFe+FZlrDkmKNszxhSp1rBM92CEaxd6WgpFexlwbARNOcEKyQtX4dKUGg83eq9K1TioyixdnfTCVsR4nh0j+wPmBi+uLhNYGAUF6GbundHFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xh1NOM0E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719150333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1V/luBKanM2MdbsO+c33o4el8NIsRhD3mo7fwNnwRA=;
	b=Xh1NOM0E/a3tElpuKOKWV/1ZVhVoniV8c8V86nVWIfshge2k+rV8ocAZWhDEE9zsL0uloF
	9WHHW9ubdfKi9FTfUnkepDTAqoHj4MrFHrQLTSUvI5RIATf0hUr9wFbZCeC4umqTLZWPY3
	34J9bbVkLebse9yaQUUTturiQStRzZo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-k14p_3JwOiOXnujANVOPKg-1; Sun, 23 Jun 2024 09:45:30 -0400
X-MC-Unique: k14p_3JwOiOXnujANVOPKg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a7240b92b4dso42129766b.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Jun 2024 06:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719150329; x=1719755129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1V/luBKanM2MdbsO+c33o4el8NIsRhD3mo7fwNnwRA=;
        b=EBO81mkDVIgAWyVcaORyoFHYenYjpmjZD1kUF/rFVo+h86zbd0ODUmm2VdRogcLoB4
         +CqEUDxuxm10HaxEYgo997Mf+mmXOZQXkMmya75TYXVTHYxtcEEzbwLCTg3uXZn6NAul
         vA09pMa2KJTTYeRzG7jjlxnGMp3x3FccdhZLCS0mK7g/kU/6zckRsMgHsYyp5zopWoOk
         TcxT7RQaRQ5wi2IIbWStLOlQ+KRRirfv7755oGDgDhqtBpP7AwMawmSXxarl9M5x0G0R
         4EEebG9hvw3x4A0XB9trGGXa73RlL4s6FYgD/7mIrDqV3eRacg4mOqdrElTWvYxkUjTk
         Gt+w==
X-Forwarded-Encrypted: i=1; AJvYcCUcmUh3cWMc7QcgTXfpsQDicSAS+ijhfB6dquTdNyp3qJ+TXlGPLjPudS7WH/kXezsICh82bwYLT9dzDbv8hod56jpmQn1B2EeNy+x2wzIWLYJYgg==
X-Gm-Message-State: AOJu0Yw789KPyu9KVlbneyDezJSh1iOE0GQKxfhozclTR6H8gNDpr1QM
	8Hwbvyx4ni6GyXOgzFK3i5qK1ou7Q8bc6KmzZZVw5Bnyw9QjruauPGwX4WU7wM2iG3PbRzKjWNM
	UlDVoSeTsONtuSQs7mH40Jlu0oowirVnSPc7sNrRjwvLZvlUYTA9os2VRz5A0apwJtchRwJ4=
X-Received: by 2002:a17:906:1153:b0:a6f:e2a3:cd0 with SMTP id a640c23a62f3a-a7242c4df85mr168754366b.9.1719150329419;
        Sun, 23 Jun 2024 06:45:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuCBRE7ce/FfYZOlEeQ/3BV94W6sQX8Z/TNy2ExKEsFaWIoWR9A3pCvsWv04xvp/a7DzdqVA==
X-Received: by 2002:a17:906:1153:b0:a6f:e2a3:cd0 with SMTP id a640c23a62f3a-a7242c4df85mr168753166b.9.1719150328913;
        Sun, 23 Jun 2024 06:45:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7245c37d9esm103381466b.154.2024.06.23.06.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 06:45:28 -0700 (PDT)
Message-ID: <cbb89baf-7c22-4c1e-93dd-fadf475792f3@redhat.com>
Date: Sun, 23 Jun 2024 15:45:27 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Wolfram Sang <wsa@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240621122503.10034-1-hdegoede@redhat.com>
 <20240621122503.10034-4-hdegoede@redhat.com>
 <20240622153541.6mqmgyqtexjtxhda@pali>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240622153541.6mqmgyqtexjtxhda@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6/22/24 5:35 PM, Pali Rohár wrote:
> On Friday 21 June 2024 14:24:58 Hans de Goede wrote:
>> +static void smo8800_instantiate_i2c_client(struct work_struct *work)
>> +{
>> +	struct smo8800_device *smo8800 =
>> +		container_of(work, struct smo8800_device, i2c_work);
>> +	const struct dmi_system_id *lis3lv02d_dmi_id;
>> +	struct i2c_board_info info = { };
>> +	struct i2c_adapter *adap = NULL;
>> +
>> +	if (smo8800->i2c_dev)
>> +		return;
>> +
>> +	bus_for_each_dev(&i2c_bus_type, NULL, &adap, smo8800_find_i801);
>> +	if (!adap)
>> +		return;
>> +
>> +	lis3lv02d_dmi_id = dmi_first_match(smo8800_lis3lv02d_devices);
> 
> Result of this function call is always same. You can call it just once,
> e.g. in module __init section and store cached result.

This function will only run when a new main i2c-i801 adapter shows up.
Which normally only happens once per boot, so there is no need to
make things more complex to optimize this.

Regards,

Hans


> 
>> +	if (!lis3lv02d_dmi_id)
>> +		goto out_put_adapter;
>> +
>> +	info.addr = (long)lis3lv02d_dmi_id->driver_data;
>> +	strscpy(info.type, "lis3lv02d", I2C_NAME_SIZE);
>> +
>> +	smo8800->i2c_dev = i2c_new_client_device(adap, &info);
>> +	if (IS_ERR(smo8800->i2c_dev)) {
>> +		dev_err(smo8800->dev, "error %ld registering %s i2c_client\n",
>> +			PTR_ERR(smo8800->i2c_dev), info.type);
>> +		smo8800->i2c_dev = NULL;
>> +	} else {
>> +		dev_dbg(smo8800->dev, "registered %s i2c_client on address 0x%02x\n",
>> +			info.type, info.addr);
>> +	}
>> +
>> +out_put_adapter:
>> +	i2c_put_adapter(adap);
>> +}
> 


