Return-Path: <platform-driver-x86+bounces-6319-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8499B16D7
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Oct 2024 12:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BD0B2834A9
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Oct 2024 10:07:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE3E1D0DE7;
	Sat, 26 Oct 2024 10:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YvEKHBXy"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC11D0149
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 10:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729937224; cv=none; b=sZgqRgNhj9si4YxgJZ8j9EFXk9I9REmrK6fqlxLQp2qKSkZfFDGMBmamnzsnr7QJ2oU4TKfgnQ9baC23roOOGbtAl2naGuWLhb8WFqj6u/ReLWC4zgmF4K4GIT6j9+c1iUva9EkxJjs87gMztTeJXvyj13/dCdymE9LlGHr2lPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729937224; c=relaxed/simple;
	bh=Po2WhAGk+nn0G+JmrLGovSM4EdZzo3bdkB0GXDapSYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vE5gGmwZGUeXoI2oBKQO9yCkFTR3KiCpZItB5/8j9Vi1wjpNB6FNaFpz58SzWxUGvQ01q4sW9Bu5UrIfclD7RFHBU07K53HvrWDuyKfs9+BECoJes+JJgmcLmM0pXUg8faMYWAqAT89/o8wATZXZAB00abskFhIhxRYvWJsd+Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YvEKHBXy; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729937221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/f46nXkqUvA/6x0RaCqyiuYSQxfxcwYkp5yUsnCKJ8U=;
	b=YvEKHBXyrYR+yz5HHBtxn09wd+Ya1HcRS2jcwmcIe9nETbQGAVsBIEhsF1o0WOE8pXU6jp
	E+XD/aQ/ziS0fA87v+8enUBm48eo3vEawPoj6rJrzh+majV7ogvvtYU8nY2UIQjWLTvcHG
	9q/a8dQkjC3ekEqerNQTMIHV4Kc0sDs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-Bt9iUzaPO6uxjZmGU7OEQg-1; Sat, 26 Oct 2024 06:06:59 -0400
X-MC-Unique: Bt9iUzaPO6uxjZmGU7OEQg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a99fd71e777so220610566b.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 03:06:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729937218; x=1730542018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f46nXkqUvA/6x0RaCqyiuYSQxfxcwYkp5yUsnCKJ8U=;
        b=v3RIbtFwk3i2NPqOG+pU5Lc2OD0Q/sAGEYWNH85/stMiwQuvuxDVnXwa+OcItjhfMQ
         LTGr+FA0juMbNB3mHErozuJyjTGGeYKRVfmWwCK77HQtPiBXtxB8fyElJZh5wMg4J7oe
         cLdGYwmbqbBsINCsIW7DX8ZCcvwtQOzDpQ9zCGLTV1lsA+AH35BnpIGZpRKfrUUkbBOl
         3VKHnvo85dXzJzPpNdmwo2mQjWjqVdyd3ZPm6jb8528S8NqpoGYfc5F+gN0ilXjPT728
         JWw1PhBG1MhZYuwy6iwl4W6HRyl5LU+PN31T9C0BvH5jbLFGa3R3rrvB2JsLOobLP88t
         Jvsw==
X-Forwarded-Encrypted: i=1; AJvYcCUJIcB0onB8jMKVu9NcevO5QCm0xTLjv19zHyqEHxpb+VnVIF2EfmHc97HrXEbq+AZdmolTtCQ392BXBZsKzyF0hjiO@vger.kernel.org
X-Gm-Message-State: AOJu0YwmjwvDH5FXfXjgjtAOK8+TnGLi5UpX+UY58ZTmKzW8sKgOI/Di
	Oqr2vTVd8XRUbfvyHRReJ2Op+aP96L0rC5Qa5QQrAjW/OAbEpuAxwiMBhLO2dN5+qPWkKtoLxIG
	JUW9Oh94SlwXrlGjFAobQVL2vtCy6MCD9TFBvI3YUAcbgvIb6i0cNgCcFUDUrJpOxp7NOK4A=
X-Received: by 2002:a17:907:9495:b0:a9a:5d15:26c2 with SMTP id a640c23a62f3a-a9de619c888mr155002866b.45.1729937217915;
        Sat, 26 Oct 2024 03:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYMCrnHwyTvN8DPXvX36EqqcDSeIpa76Zk1xpz15ECT52CeCo+y+8lODC9roJOeWDkY6qDIQ==
X-Received: by 2002:a17:907:9495:b0:a9a:5d15:26c2 with SMTP id a640c23a62f3a-a9de619c888mr154999366b.45.1729937217426;
        Sat, 26 Oct 2024 03:06:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b3a08477bsm158255366b.201.2024.10.26.03.06.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 03:06:56 -0700 (PDT)
Message-ID: <4350a4f0-fa9d-43a6-bec5-68f752d1395c@redhat.com>
Date: Sat, 26 Oct 2024 12:06:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] platform/surface: aggregator: Add platform handler
 pointer to device
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>, Lee Chun-Yi <jlee@suse.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Ike Panhc <ike.pan@canonical.com>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Alexis Belmonte <alexbelm48@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ai Chao <aichao@kylinos.cn>, Gergo Koteles <soyer@irl.hu>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ACPI" <linux-acpi@vger.kernel.org>,
 "open list:MICROSOFT SURFACE PLATFORM PROFILE DRIVER"
 <platform-driver-x86@vger.kernel.org>,
 "open list:THINKPAD ACPI EXTRAS DRIVER"
 <ibm-acpi-devel@lists.sourceforge.net>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Matthew Schwartz <matthew.schwartz@linux.dev>
References: <20241025193055.2235-1-mario.limonciello@amd.com>
 <20241025193055.2235-3-mario.limonciello@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241025193055.2235-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 25-Oct-24 9:30 PM, Mario Limonciello wrote:
> To be able to reference the platform handler in remove, add
> a pointer to `struct ssam_device`.
> 
> Tested-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/surface/surface_platform_profile.c | 1 +
>  include/linux/surface_aggregator/device.h           | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
> index 61aa488a80eb5..958afd7bce223 100644
> --- a/drivers/platform/surface/surface_platform_profile.c
> +++ b/drivers/platform/surface/surface_platform_profile.c
> @@ -210,6 +210,7 @@ static int surface_platform_profile_probe(struct ssam_device *sdev)
>  		return -ENOMEM;
>  
>  	tpd->sdev = sdev;
> +	sdev->tpd = tpd;
>  
>  	tpd->handler.name = "Surface Platform Profile";
>  	tpd->handler.profile_get = ssam_platform_profile_get;
> diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
> index 8cd8c38cf3f30..6a72b5bdc8782 100644
> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -164,6 +164,7 @@ enum ssam_device_flags {
>   * @dev:   Driver model representation of the device.
>   * @ctrl:  SSAM controller managing this device.
>   * @uid:   UID identifying the device.
> + * @tpd:   Platform profile device data.
>   * @flags: Device state flags, see &enum ssam_device_flags.
>   */
>  struct ssam_device {
> @@ -171,6 +172,7 @@ struct ssam_device {
>  	struct ssam_controller *ctrl;
>  
>  	struct ssam_device_uid uid;
> +	struct ssam_platform_profile_device *tpd;
>  
>  	unsigned long flags;
>  };


