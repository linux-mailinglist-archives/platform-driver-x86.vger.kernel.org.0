Return-Path: <platform-driver-x86+bounces-5233-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D85996C5CF
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Sep 2024 19:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FFD11C20D51
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Sep 2024 17:55:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5241E132C;
	Wed,  4 Sep 2024 17:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YFs/4z4N"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD56E2AE9F
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Sep 2024 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725472514; cv=none; b=CQ7Uw6rSwT9v8o66vXYLaISkzQAuTKI4d3dafd2h9B1JCsE/Tg/T2lJ6jyQ9oCFOHrhLp9Y4FfqyfaUIVLu4b3gRTSlH1sws/3eQvT9rmwGg0m17iJzZlOskU1lb/kx9LREDVQxY7qIMPZxoJ1WSCe4Hr+hYIb9SW/H6er5nm9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725472514; c=relaxed/simple;
	bh=VWzM6EtUmeeVBM+CvbOkVNtoVZCunbQNZn5u3JdbtV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzK2j38DY3fNHCfly1A5z3LuR5lEacN7UsUM9PjRwK6zGZdTPg38xRhQoKIeABqMRJZy8Nc3tnMi57VkM//DIUzOsotag8Ly14DyZBWMTqJbY717tBV85g7tkCw9SPvK1O6Loya4fwizwvrnVBbZoC90oe/qXSU/qfTckOps2R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YFs/4z4N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725472511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpULzeoOquLLnjVucbF5xnPEVwj274syMFrmrkoRAMM=;
	b=YFs/4z4NhjjgWUoXtCaUhLEVQV7WaFYP1Ohh6NATroLdj4/T30H97+n/GB2vnbTJkIJMcL
	8ubNIn+Jpgld/pgAPsZlQjD+IMjxkO12ROpqdwU6cJEN93p/siDVv3vN4B4V5M8FboE4mo
	T3bvFoOiqPz77pW0Swimib5WBNfqe1g=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-UiIEg7vINkK4g6FQk3V6vg-1; Wed, 04 Sep 2024 13:55:10 -0400
X-MC-Unique: UiIEg7vINkK4g6FQk3V6vg-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5c260907f5bso2458352a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Sep 2024 10:55:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725472509; x=1726077309;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EpULzeoOquLLnjVucbF5xnPEVwj274syMFrmrkoRAMM=;
        b=BqcUNPWHccackwViRuDRW/14fXqSa8HBSZJhlq/waymLI6HgHiH02zpk+i7MyRFjpX
         OAY4jwrybGogExO/vYdJFtEuhBVdNoca1M8gM0f1/BjCy+h69aW9E+JjwkzrpFKLY4u2
         7xHq1XAhC5IVd6kUftzQSv6CovfPJlMOVAdst+cms1PAtc27xS0FSi2tMfkea/mH4zSK
         O6WDn6RSSTG1Q1CU3lsdEprGtvgB1JHkCX6+iSEbZOwhGu7KJ6zGALsF7gQuJoX98Mtg
         LGXYpkar2J4rgguxe8a/CRqOo53MtopW4XJPlpDatBduj5bk4X2VI0voHZELlAMpRmlF
         wltw==
X-Forwarded-Encrypted: i=1; AJvYcCU/T/tNUid9HiscodcEgQE5lMnZmMcqpBHNLvQzZofXb07kFU97QvoAE6NXp9kDfjlnAM+M/bWqFjZlrMgjq/30JXv6@vger.kernel.org
X-Gm-Message-State: AOJu0YziXNcQjHf8YIqDUp9g4RJjuI0q1MCEYf9SImWgAE4XOEeAF/lK
	R2w6C6+toORdGplG0R0qlfw2KFrwkceH6aL7Smy4zH0odC5q676isr78P8y6L/oP+u1RxGm/STx
	PuOp0wTptDrpsRkv98LyoOV94eNH7UPUlIDR7UE3+1qzU/qDFPGQ9fXfNtHG/AK4wAhHEbNs=
X-Received: by 2002:a17:907:948f:b0:a86:a417:72d2 with SMTP id a640c23a62f3a-a8a1d32689cmr535399666b.35.1725472509346;
        Wed, 04 Sep 2024 10:55:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2LPU0ING+4KbER6sgAUpEBU4Mq4znqdOnm47Qu/gv2s5OprciWuiK45hfXxAt/jYUlq4jbQ==
X-Received: by 2002:a17:907:948f:b0:a86:a417:72d2 with SMTP id a640c23a62f3a-a8a1d32689cmr535397266b.35.1725472508858;
        Wed, 04 Sep 2024 10:55:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8a623c2b00sm18489466b.162.2024.09.04.10.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 10:55:08 -0700 (PDT)
Message-ID: <bf7910d7-395a-4d01-960e-46789d836da4@redhat.com>
Date: Wed, 4 Sep 2024 19:55:07 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] hwmon: (hp-wmi-sensors) Check if WMI event data
 exists
To: Guenter Roeck <linux@roeck-us.net>, Armin Wolf <W_Armin@gmx.de>
Cc: james@equiv.tech, jlee@suse.com, corentin.chary@gmail.com,
 luke@ljones.dev, matan@svgalib.org, coproscefalo@gmail.com,
 ilpo.jarvinen@linux.intel.com, jdelvare@suse.com, rafael@kernel.org,
 lenb@kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240901031055.3030-1-W_Armin@gmx.de>
 <20240901031055.3030-2-W_Armin@gmx.de>
 <e90b40e9-b3a5-4228-8f12-b02a77b7789d@roeck-us.net>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e90b40e9-b3a5-4228-8f12-b02a77b7789d@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi All,

On 9/2/24 4:28 PM, Guenter Roeck wrote:
> On Sun, Sep 01, 2024 at 05:10:51AM +0200, Armin Wolf wrote:
>> The BIOS can choose to return no event data in response to a
>> WMI event, so the ACPI object passed to the WMI notify handler
>> can be NULL.
>>
>> Check for such a situation and ignore the event in such a case.
>>
>> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Applied.

Thank you.

Unfortunately patch 2/5 touches the same part of the file,
so I cannot apply the rest of the series without first
bringing this patch into platform-drivers-x86/for-next .

Guenter, can you provide an immutable branch/tag with
this patch on it; or drop this patch that I merge
the entire series through platform-drivers-x86/for-next ?

Regards,

Hans



