Return-Path: <platform-driver-x86+bounces-5313-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51375971B2D
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Sep 2024 15:36:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BF5EB22C6B
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Sep 2024 13:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F901B81C7;
	Mon,  9 Sep 2024 13:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fnxLKG2E"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5211B4C4F
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Sep 2024 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725888984; cv=none; b=pctBbRFKjoRDnKKTtleLogng79+cl5tzT8CU65HINHcsYhBvqfjnMqM+eFq+MGRgjbqCp7Ayu0kGXazLj9/N9X9+ndoGrfnesofD9hAZo1ABzZDcJjT0sVAiodsAxIar9Dl5rv5aHN6bNBmvz5P9OdbmbP8B5SVldYg+CqTIrkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725888984; c=relaxed/simple;
	bh=BAuxzHPZw2jTXdKOWfhAsjcQsyTJAlXQRtg+AXUUzAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hk3/JXCIlR1n8zdJ1rduOhzKVTgP4bmRvxEZZMvIcT/bqzPmeYl1MoOu0AH7GqVW1C0SFbaUP1vLQI7NyEzpBKMj7kDUOA2XRbvEFDLfQEd5OxEMRWip9HL54QRl5HxMfEmseynX6vyzPKsZ43UvKheltMZ6edhh9SGiekGWQpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fnxLKG2E; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365aec6fc1so3478385e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Sep 2024 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725888981; x=1726493781; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/9m2ovgC3tbhBkWQoZgc0XfIdfEqtR0fYQGv/pk+TAE=;
        b=fnxLKG2E1mqsrWKm+uTY7yGsshcyA+41VdHPc1qv5m9JZbYUo/KDsEWKMaz+/KQDcS
         /MveOksDIeowZ0MuL838zFmLqVTCwrMXEp+uqcXueaF45UL+I62xSAgGpldlEQmuwCbH
         smJVMZ5TeOLZEcsK+iEJ9uiYT8snjaNLuTV8vymKn3ndBkOBwDPqhSl4UKDdjXwxGESk
         f4qvX3lpEeQW/s0gT8bOxET8HYM3izvQuYB9shgPaoW99dKtuIfjwUd3+wXh8heAr5xX
         +hcemq26z1NCilvhN653SOZs+jVKk+18/r1x/fDpQPuf6WVzNjQM67gBn6d5wnjH0FNH
         evXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725888981; x=1726493781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/9m2ovgC3tbhBkWQoZgc0XfIdfEqtR0fYQGv/pk+TAE=;
        b=rD9/a6egvNd4Md82n3niKBzE3E/kcXCpt2HKo7zP7DePJeueJHWxkFIKuZevEEgcLo
         TP5uyg6Ax7oe59X8+Dqrhxcy7yAFvc6lLgW2uOqzBuBu4dC+kFmY5k0Hk2TYmWVRphTd
         e3172YXdsf1bWtvYR4OelDkY0cCxmzcAZT2ziJ3M/kk2IJnUkM6KiLOTb0WCai4Ro2mW
         Har1xWxYVrAkCS8D/+IhFgOEh/zb0sNgl+1P3/36YNS/xjEYMWw3DPegimCtKO0FR7Ua
         60TzZcp8yKjkDFRlEu+zkhf2gb4CeFZHTXvzW1RgpSxKX5iptmNXnL8iyyD97xCmZOSW
         hzkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVow3bRe6zaU/HgHfhUlRYvg0tW+5FFzfKveoB3WeXwRftM0mCnFbhOq/RAQtzlK1C5oza9s4bBIleVqavqBz3iuLW/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Q/ibB5AyRXJgr5b2e+skWjPKjDazOd7SlyJ0BOGxqqNCBAkO
	Qk6ZTAwCfS+293ThAf3TNaSvOXACK6yJX/GqmxOX+MxHTyagOqjiOhhWxXhrWps=
X-Google-Smtp-Source: AGHT+IEVHV5pBqeCrHCSmVu+sTPke61MAJDc2DDaOV+NkRL25KMFkRrUsziZ3IFr3KZo/n2ZWdXQYA==
X-Received: by 2002:a05:6512:114f:b0:535:45d2:abf0 with SMTP id 2adb3069b0e04-536587f594amr7912890e87.39.1725888980028;
        Mon, 09 Sep 2024 06:36:20 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42caeb8b2f4sm77686825e9.45.2024.09.09.06.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 06:36:19 -0700 (PDT)
Message-ID: <c63fd548-4a50-4205-abb8-14f544b2431a@linaro.org>
Date: Mon, 9 Sep 2024 15:36:15 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86:intel/pmc: fix build regression with pmtimer
 turned off
To: Hans de Goede <hdegoede@redhat.com>, Arnd Bergmann <arnd@kernel.org>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Xi Pardee <xi.pardee@linux.intel.com>,
 Rajvi Jingar <rajvi.jingar@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>, Kane Chen
 <kane.chen@intel.com>, Marek Maslanka <mmaslanka@google.com>,
 Tony Luck <tony.luck@intel.com>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240909111644.248756-1-arnd@kernel.org>
 <43cd3e8e-4c99-4641-b55b-4b54a42b8e53@redhat.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <43cd3e8e-4c99-4641-b55b-4b54a42b8e53@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Hans,


On 09/09/2024 13:36, Hans de Goede wrote:

[ ... ]

> Thanks, patch looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> 
> Daniel, can you pick this one up?

Yes, sure


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


