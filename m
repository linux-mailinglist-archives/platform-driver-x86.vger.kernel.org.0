Return-Path: <platform-driver-x86+bounces-952-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5B98361F6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 12:37:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7237F1C264E7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 22 Jan 2024 11:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F09B405CA;
	Mon, 22 Jan 2024 11:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pnl8Rgoo"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A368D3B295
	for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 11:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922902; cv=none; b=FYSM5Ixw7u0lBT3HjEuhuomHE9VA1FwaEeUpM522bRlCwW7Xvm7lx/6GV++mzfdzCKKx5M9T1y6kAHX6mXs6tr41bqvOzMvHVs4E1F8c+698DW5zJqvX+7mjkehDRBdj7fXIKhsPzHItK2PKB+cR0Xgu3NkW1Qwdp0bC7Mh9hRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922902; c=relaxed/simple;
	bh=+P/PxxB9xXCSENlP/VU3mHAi0Q3gkIF8SmyqvXOjVrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gwntGA2UrQCZLOA6cCFpoamvr7lZoa8HhvzSZKHLzLmnufS6lvjIH8nVesF4X1AFpFIv0BwnOEnCBM1CP/k/HLvM01c/LZooXo0CwKlPC9NeQ45RlSap240GPGftLG7J9VjSeL2eAc461pqxoe/SyCCyGpOEA0JMnTl5PQR79ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pnl8Rgoo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705922899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MnMtinosHpLnbII+9S7MEoYav8UQT9UmvvoZomxIxQs=;
	b=Pnl8Rgoo+f3QjipQiodJQcgpxvvNtU12iSjTTiK0qNHam0RlWSs14BG0fI0hPT4mG69u9U
	OmnIZv7UEcYxs8TwT3X6NQzeRB291IABZSlFxjALOqXblgt/zZ1uM/2019IdVO9ZFhwg9x
	ZrKOBFJfBjWwYvPdF4w8z+UuX6EeTyE=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-6nXfcsCEMZehTESxkobiew-1; Mon, 22 Jan 2024 06:28:18 -0500
X-MC-Unique: 6nXfcsCEMZehTESxkobiew-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2cdeb4f9a80so15844181fa.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 22 Jan 2024 03:28:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922897; x=1706527697;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MnMtinosHpLnbII+9S7MEoYav8UQT9UmvvoZomxIxQs=;
        b=rI1UIAhYQS2624yoSe6kCClZCNMFdbNonAE5ivGZFCfZj2CN6SjB5Nyd5ZNBx0fyTA
         3olRvhF31LtGlWl5cHkgYvwUhr5ISgFIiW64wQuIB+yMTJ9+58qyAekvmxSIqj/YWFhS
         ZQn3s51UDXqr4vGR6Y7LJmdt7/BYuA+aaAQokRtBtz19tw9ffZBnXyoe3ZI3PKcs8Pq6
         qwuM0BhLI018/41wLoUqHgXp/UyFWkK0k5acB+s2V4ekVNNNycjGXrKUG1Wz023d88bf
         2cLatr1MM4bUGYcCtIY6Zo5HVyAkrSDdkfy6txnd/XQ1jvLJpYcNZdv43726MtcmM/RK
         8gNA==
X-Gm-Message-State: AOJu0YxAE4IOaawSTurvbXFjHPE6tE1V12ZQUQxE2hBMHuVFDxVDzWxO
	kuPQFscD7J6Goz4vZQqSzKRfSPshUoDDLllx8YMqp+l4FWI9KgZ5dQaVZCiWBDZp1HqFRJ+WYuS
	3OQwArw1MTZ9+3OqSsyuuzwM+lUqhg4EVJioh9vxOlwEIuC4K7qnaWIP63cgZCevZ0wn00VY=
X-Received: by 2002:a05:6512:220f:b0:50e:aee2:d55e with SMTP id h15-20020a056512220f00b0050eaee2d55emr1139739lfu.100.1705922896871;
        Mon, 22 Jan 2024 03:28:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1Mt20VKTIGU4mltb75bJnFQEqGLue7NfdlRCFFijVXPfAH78mnMOrL2wKHEc+FjiUHwDVTg==
X-Received: by 2002:a05:6512:220f:b0:50e:aee2:d55e with SMTP id h15-20020a056512220f00b0050eaee2d55emr1139736lfu.100.1705922896543;
        Mon, 22 Jan 2024 03:28:16 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id fj12-20020a1709069c8c00b00a3076eec436sm423813ejc.5.2024.01.22.03.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 03:28:16 -0800 (PST)
Message-ID: <729d7887-7681-476b-9b5f-c498d78df2cb@redhat.com>
Date: Mon, 22 Jan 2024 12:28:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Support for mode FN key
Content-Language: en-US, nl
To: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: corbet@lwn.net, ilpo.jarvinen@linux.intel.com,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <mpearson-lenovo@squebb.ca>
 <20240120232949.317337-1-mpearson-lenovo@squebb.ca>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240120232949.317337-1-mpearson-lenovo@squebb.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/21/24 00:29, Mark Pearson wrote:
> New Thinkpads have added a 'Mode' Function key that on Windows allows
> you to choose the active profile (low-power, balanced, performance)
> 
> Added suppoort for this hotkey (F8), and have it cycle through the
> options available.
> 
> Tested on X1 Carbon G12.
> 
> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  7 ++++++-
>  drivers/platform/x86/thinkpad_acpi.c          | 20 ++++++++++++++++++-
>  2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 98d304010170..7f674a6cfa8a 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -444,7 +444,9 @@ event	code	Key		Notes
>  
>  0x1008	0x07	FN+F8		IBM: toggle screen expand
>  				Lenovo: configure UltraNav,
> -				or toggle screen expand
> +				or toggle screen expand.
> +				On newer platforms (2024+)
> +				replaced by 0x131f (see below)
>  
>  0x1009	0x08	FN+F9		-
>  
> @@ -504,6 +506,9 @@ event	code	Key		Notes
>  
>  0x1019	0x18	unknown
>  
> +0x131f	...	FN+F8	        Platform Mode change.
> +				Implemented in driver.
> +
>  ...	...	...
>  
>  0x1020	0x1F	unknown
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c4895e9bc714..ceb22f8d8442 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -166,6 +166,7 @@ enum tpacpi_hkey_event_t {
>  	TP_HKEY_EV_VOL_MUTE		= 0x1017, /* Mixer output mute */
>  	TP_HKEY_EV_PRIVACYGUARD_TOGGLE	= 0x130f, /* Toggle priv.guard on/off */
>  	TP_HKEY_EV_AMT_TOGGLE		= 0x131a, /* Toggle AMT on/off */
> +	TP_HKEY_EV_PROFILE_TOGGLE	= 0x131f, /* Toggle platform profile */
>  
>  	/* Reasons for waking up from S3/S4 */
>  	TP_HKEY_EV_WKUP_S3_UNDOCK	= 0x2304, /* undock requested, S3 */
> @@ -3731,6 +3732,7 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
>  	switch (hkey) {
>  	case TP_HKEY_EV_PRIVACYGUARD_TOGGLE:
>  	case TP_HKEY_EV_AMT_TOGGLE:
> +	case TP_HKEY_EV_PROFILE_TOGGLE:
>  		tpacpi_driver_event(hkey);
>  		return true;
>  	}
> @@ -11118,7 +11120,23 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>  		else
>  			dytc_control_amt(!dytc_amt_active);
>  	}
> -
> +	if (hkey_event == TP_HKEY_EV_PROFILE_TOGGLE) {
> +		switch (dytc_current_profile) {
> +		case PLATFORM_PROFILE_LOW_POWER:
> +			dytc_profile_set(NULL, PLATFORM_PROFILE_BALANCED);
> +			break;
> +		case PLATFORM_PROFILE_BALANCED:
> +			dytc_profile_set(NULL, PLATFORM_PROFILE_PERFORMANCE);
> +			break;
> +		case PLATFORM_PROFILE_PERFORMANCE:
> +			dytc_profile_set(NULL, PLATFORM_PROFILE_LOW_POWER);
> +			break;
> +		default:
> +			pr_warn("Profile HKEY unexpected profile %d", dytc_current_profile);
> +		}
> +		/* Notify user space the profile changed */
> +		platform_profile_notify();
> +	}
>  }
>  
>  static void hotkey_driver_event(const unsigned int scancode)


