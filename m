Return-Path: <platform-driver-x86+bounces-6317-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 691F49B16A0
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Oct 2024 11:56:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9D171B21608
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Oct 2024 09:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5371C7B7C;
	Sat, 26 Oct 2024 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dWETGBV3"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B385318562F
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729936590; cv=none; b=p56mM5doQGbtEYyvHsmCbSz6e2rYiQTrfuxyjNcsApLJa8t9Vku/Cxc4e/uKbwd6bIxAoua2V6R3CMukDaqUL+03H4FPSpSwNb681KsPN8b/q7wxqo6vB+EyjLN0ipUDkAPF7o2Ztqyl4fUR52q+VmiYCNPY1N4CaIgqi6zDC6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729936590; c=relaxed/simple;
	bh=Ij2h4cxPpJUPnK3mFJh+MkItSnLUfM33b4V8V7PH6DE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jIXTnVAYlR1/8rCvkwjItjJthq9i1Ng2Jvjh92cgjYhOPSJ7UzJN+53Ogc7FViIka4qXCG4pBSKOn269kBfdFbAq0VnlDdOWFERZXXrDuN5YhZcw2Gz2Gt/0kVRP8xkEquBn+f6jUMjU7JKf7zfIqCZJ/+ImsYAZgtdcvbKix5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dWETGBV3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729936586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ElUHKRYMA2G86ApDdMhWAtBMG6+2RNeDVc5o5oBv4Qo=;
	b=dWETGBV3kCtc+MbkgPcJxAmYUrXEW0Kem8Zx+e/PjaSaGVKBZ0dXlngy1vA0BbI6B7a8hL
	W4JXlhfeWxXs3mqUeEIri8kClaHOuk9jDTEmcjh7v8F7/pcw11FiCva/aZoo3jDS8aFbYx
	FTwhYww0eRYqDXxh7tvEX/6ADZip8xA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-wmFJs-NaMla-TSpCfTkr-w-1; Sat, 26 Oct 2024 05:56:24 -0400
X-MC-Unique: wmFJs-NaMla-TSpCfTkr-w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99fff1ad9cso207831866b.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 02:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729936583; x=1730541383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ElUHKRYMA2G86ApDdMhWAtBMG6+2RNeDVc5o5oBv4Qo=;
        b=aUpMCDa0FOhKfCMaYlgvss9cOFuY9lCoTLWJ/20qAubs2fHs86GkbX0IvfQP3gjv4j
         Lod81VvzztqEjRSbVJwvnmLdN3RYzNAupdaATnQwoLZ3fuw4FFtTS8lNDsEMMD8JWkQh
         KKOAvPHRGVAmUEPwT3ZWx6kYbHhhZuxYidac7+pV0vMPsPU+y5yiKbckCuQWlnrcNIBM
         JPGCkY7deLniVxeEPx+J5XUVSIZv31zmupwjk/jTq+vfj5pVyAwJEyFV8Eb06N67hjUq
         ulkjgIbIFIon5NDf3y2/tp9KhS/OqBL3e67RSQn5BARgLjq4EeaMGTsY2jUdvQQwuxmG
         LfVw==
X-Forwarded-Encrypted: i=1; AJvYcCVvj7c+bPGVw2jFH3BjR3h7Xx0qYZMEuJ78eLs8wHXWih2CzV3BBRstvP7hT62m2HlFEfmcXB4ZpuaHk2tVXcumOsmd@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/U4dHGBFDHidMrAnzB2KsoIFhpLfV7c40Nnncd7eJXmCjc0R5
	605n4w6SZRsxnZgrxIvx+ZaPrVhHMplPWAr3MCN8OhVkA+0n2sWp6C56ZVO5M9CTUnhDqpPzIjD
	98FMSnPR6ps1A4jUzsnDCdday9BAr9UI8aWR8cPiej1GJd7u4AakG7iH1GSe4SZoZAANkckc=
X-Received: by 2002:a17:907:7fa5:b0:a99:fb10:1285 with SMTP id a640c23a62f3a-a9de5ce252dmr148097966b.20.1729936583304;
        Sat, 26 Oct 2024 02:56:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKxU1ftxQXKVLf+6jze8roAFctV/Q/2zZMbP+AVuSy6VZC+oXV8s5QLZNUY4aoyyRPcYl8nA==
X-Received: by 2002:a17:907:7fa5:b0:a99:fb10:1285 with SMTP id a640c23a62f3a-a9de5ce252dmr148096666b.20.1729936582848;
        Sat, 26 Oct 2024 02:56:22 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a086f6dsm156994566b.214.2024.10.26.02.56.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 02:56:22 -0700 (PDT)
Message-ID: <42e023e9-3d7c-40c4-b547-829d6ec8d7fc@redhat.com>
Date: Sat, 26 Oct 2024 11:56:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: asus-wmi: Fix inconsistent use of
 thermal policies
To: Armin Wolf <W_Armin@gmx.de>, corentin.chary@gmail.com, luke@ljones.dev,
 mohamed.ghanmi@supcom.tn
Cc: srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 Michael@phoronix.com, casey.g.bowman@intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241025191514.15032-1-W_Armin@gmx.de>
 <20241025191514.15032-3-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241025191514.15032-3-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 25-Oct-24 9:15 PM, Armin Wolf wrote:
> When changing the thermal policy using the platform profile API,
> a Vivobook thermal policy is stored in throttle_thermal_policy_mode.
> 
> However everywhere else a normal thermal policy is stored inside this
> variable, potentially confusing the platform profile.

You say "potentially confusing the platform profile", but did you
spot any actual issues when reviewing the code ?

> Fix this by always storing normal thermal policy values inside
> throttle_thermal_policy_mode and only do the conversion when writing
> the thermal policy to hardware.
> 
> Fixes: bcbfcebda2cb ("platform/x86: asus-wmi: add support for vivobook fan profiles")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

The problem with this approach is that it changes the order in which
we step through the modes in throttle_thermal_policy_switch_next()
after this change we have:

Normal Asus: balanced -> performance -> silent -> balanced -> etc.
Vivobook:    balanced -> silent -> performance -> balanced -> etc.

where if we see "silent" as lower performance then the other 2,
the vivobook order is a bit weird.

I wonder if this is a big enough issue to really worry about it
though; and I do like the cleanup / simpler code.

Note that this also causes a behavior change in
fan_curve_get_factory_default() as I mentioned in my cover-letter.

I think that that behavior change might be a good thing to do actually,
but at a minimum it needs to be documented in the commit msg.

Regards,

Hans






> ---
>  drivers/platform/x86/asus-wmi.c | 64 +++++++++++----------------------
>  1 file changed, 21 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index ab9342a01a48..ce60835d0303 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -3696,10 +3696,28 @@ static int asus_wmi_custom_fan_curve_init(struct asus_wmi *asus)
>  /* Throttle thermal policy ****************************************************/
>  static int throttle_thermal_policy_write(struct asus_wmi *asus)
>  {
> -	u8 value = asus->throttle_thermal_policy_mode;
>  	u32 retval;
> +	u8 value;
>  	int err;
> 
> +	if (asus->throttle_thermal_policy_dev == ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO) {
> +		switch (asus->throttle_thermal_policy_mode) {
> +		case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
> +			value = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT_VIVO;
> +			break;
> +		case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
> +			value = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST_VIVO;
> +			break;
> +		case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
> +			value = ASUS_THROTTLE_THERMAL_POLICY_SILENT_VIVO;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else {
> +		value = asus->throttle_thermal_policy_mode;
> +	}
> +
>  	err = asus_wmi_set_devstate(asus->throttle_thermal_policy_dev,
>  				    value, &retval);
> 
> @@ -3804,46 +3822,6 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
>  static DEVICE_ATTR_RW(throttle_thermal_policy);
> 
>  /* Platform profile ***********************************************************/
> -static int asus_wmi_platform_profile_to_vivo(struct asus_wmi *asus, int mode)
> -{
> -	bool vivo;
> -
> -	vivo = asus->throttle_thermal_policy_dev == ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO;
> -
> -	if (vivo) {
> -		switch (mode) {
> -		case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
> -			return ASUS_THROTTLE_THERMAL_POLICY_DEFAULT_VIVO;
> -		case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
> -			return ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST_VIVO;
> -		case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
> -			return ASUS_THROTTLE_THERMAL_POLICY_SILENT_VIVO;
> -		}
> -	}
> -
> -	return mode;
> -}
> -
> -static int asus_wmi_platform_profile_mode_from_vivo(struct asus_wmi *asus, int mode)
> -{
> -	bool vivo;
> -
> -	vivo = asus->throttle_thermal_policy_dev == ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_VIVO;
> -
> -	if (vivo) {
> -		switch (mode) {
> -		case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT_VIVO:
> -			return ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
> -		case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST_VIVO:
> -			return ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
> -		case ASUS_THROTTLE_THERMAL_POLICY_SILENT_VIVO:
> -			return ASUS_THROTTLE_THERMAL_POLICY_SILENT;
> -		}
> -	}
> -
> -	return mode;
> -}
> -
>  static int asus_wmi_platform_profile_get(struct platform_profile_handler *pprof,
>  					enum platform_profile_option *profile)
>  {
> @@ -3853,7 +3831,7 @@ static int asus_wmi_platform_profile_get(struct platform_profile_handler *pprof,
>  	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
>  	tp = asus->throttle_thermal_policy_mode;
> 
> -	switch (asus_wmi_platform_profile_mode_from_vivo(asus, tp)) {
> +	switch (tp) {
>  	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
>  		*profile = PLATFORM_PROFILE_BALANCED;
>  		break;
> @@ -3892,7 +3870,7 @@ static int asus_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>  		return -EOPNOTSUPP;
>  	}
> 
> -	asus->throttle_thermal_policy_mode = asus_wmi_platform_profile_to_vivo(asus, tp);
> +	asus->throttle_thermal_policy_mode = tp;
>  	return throttle_thermal_policy_write(asus);
>  }
> 
> --
> 2.39.5
> 


