Return-Path: <platform-driver-x86+bounces-9200-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A748AA268CD
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Feb 2025 01:45:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70BE21883307
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Feb 2025 00:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D71C202C4D;
	Tue,  4 Feb 2025 00:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b="hRUcsxdy"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from so254-32.mailgun.net (so254-32.mailgun.net [198.61.254.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7434204C21
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Feb 2025 00:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.61.254.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629682; cv=none; b=t/5LBLvkRMwrZjAa/WI0G6KHGimKm9AjiiWV74iB8ht6bWyPjG8J7UQHh7QgCAKt1vjTiN5aEM8V7XEarnMV52QwD7nZniulL5nsX2PkD2UWEHtIrEaC+U3PTulG4qkOeEuCrMj4N4dFo1pX/S2VdFlAEo7vSWS9V5V3xx+77TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629682; c=relaxed/simple;
	bh=6Ljhb/l5cuzFKG1hXUzN2XVip9+IRIDVeEsVro7oKzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=api2s/dw2qfnjNE9XorLSj7nx1yjm/IHQ8WiecMxq/5N9dIJRsCVQwRCHdCFALcLqb3ITBbw+B5DoEdInaC+JiTN9pyVtg9JWNDiCT27Z8UIGF9SzrMiTrGPjDedTARbXYY2BpxkcpmY5z9CXbbanyK3uDBNVjj0qDLKOXSwY6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech; spf=pass smtp.mailfrom=equiv.tech; dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b=hRUcsxdy; arc=none smtp.client-ip=198.61.254.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=mx; t=1738629678; x=1738636878;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=ggcwfyqRfyHYBb0dqYboatBmMxLglcl8RWmU//+wvXM=;
 b=hRUcsxdyU9UHIbEJkjIeToFgmMskMLJTjVOPSXsyWYCmHN+uQv4/m9kkwCs6wmvu0ZrTWoLXJpdJ1iBZF+NzIwAQAi77AwQf8Pg00SrSkSNLTR4e7xeN53WVf/i4wC3UqPvKLQtMX9PyxOJLuLSG2KZ63Gi+ZGNFwNE0i421OfGkuIhwFtxoQfm7kKDRt7zemsbVOWGoujEPjxAJI3u6gCWx6cvGPgSRqzVnNr5z6TwPD9SjiCKYWW1XbqlyEQ86S6m7Ssolc03vNp9DK7c7T6UKwHmOgppgTdvh+UQi3FOZxPWbzA48/7QDb+mtDgLyKMRhvrOgHmyWfFtQvHGsJQ==
X-Mailgun-Sending-Ip: 198.61.254.32
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyI0MzAwNyIsInBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnIiwiOTNkNWFiIl0=
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 09e3f01714c1 with SMTP id
 67a1622e14383b735a52af43 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Feb 2025 00:41:18 GMT
Sender: james@equiv.tech
Date: Mon, 3 Feb 2025 16:41:17 -0800
From: James Seo <james@equiv.tech>
To: Armin Wolf <W_Armin@gmx.de>
Cc: markpearson@lenovo.com, jorge.lopez2@hp.com, jdelvare@suse.com,
	linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
	corbet@lwn.net, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/7] hwmon: (hp-wmi-sensors) Use the WMI bus API when
 accessing sensors
Message-ID: <Z6FiLeldpQXvnO6B@equiv.tech>
References: <20250203182322.384883-1-W_Armin@gmx.de>
 <20250203182322.384883-2-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250203182322.384883-2-W_Armin@gmx.de>

On Mon, Feb 03, 2025 at 07:23:16PM +0100, Armin Wolf wrote:
> Since the driver already binds to HP_WMI_NUMERIC_SENSOR_GUID, using
> wmidev_block_query() allows for faster sensor access.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/hp-wmi-sensors.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
> index d6bdad26feb1..03c684ba83bd 100644
> --- a/drivers/hwmon/hp-wmi-sensors.c
> +++ b/drivers/hwmon/hp-wmi-sensors.c
> @@ -1197,7 +1197,7 @@ static int hp_wmi_update_info(struct hp_wmi_sensors *state,
>  	if (time_after(jiffies, info->last_updated + HZ)) {
>  		mutex_lock(&state->lock);
> 
> -		wobj = hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, instance);
> +		wobj = wmidev_block_query(state->wdev, instance);
>  		if (!wobj) {
>  			ret = -EIO;
>  			goto out_unlock;
> @@ -1745,7 +1745,7 @@ static int init_numeric_sensors(struct hp_wmi_sensors *state,
>  		return -ENOMEM;
> 
>  	for (i = 0, info = info_arr; i < icount; i++, info++) {
> -		wobj = hp_wmi_get_wobj(HP_WMI_NUMERIC_SENSOR_GUID, i);
> +		wobj = wmidev_block_query(state->wdev, i);
>  		if (!wobj)
>  			return -EIO;
> 
> --
> 2.39.5
>
Works on a HP Z420.

Reviewed-by: James Seo <james@equiv.tech>

