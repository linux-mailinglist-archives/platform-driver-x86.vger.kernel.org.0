Return-Path: <platform-driver-x86+bounces-3167-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C358B9697
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 May 2024 10:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9A18A1C20FDD
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 May 2024 08:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020674206E;
	Thu,  2 May 2024 08:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwwYdYne"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61661364D2
	for <platform-driver-x86@vger.kernel.org>; Thu,  2 May 2024 08:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714639141; cv=none; b=fmSQ/moyif0gDHDcQwP6i7ob4QumwHTtqWYayeU2w5nfr9qofD/lY8F3+uau9PnFIrXKkY/kIwOy25PDwzliFsyNTLoKCa76Mwxx8aE+Q3UKHkfW0o3UdkHb/o15UcdL0LMADPOGZu858YGyJygNBCGRCumkPeqD33am5tRFnWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714639141; c=relaxed/simple;
	bh=ilrFFY6gpqsREXL0hStdjMoDt3s4SbHsDOogLS0qdRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1tvUE5pNWiu5tq5Q1+fGKKDrihqoHaWN90eIpP0ShKtIaJlky/VU4yYAONO1GY3o7LZ9xYEW4i4HO72wSGubGFX95W8gZ1UUIXOAAWLAYHLpW+3xM7dZW0apScI0GubIRZAdr0ZQt8K1qZa+aspaDmqeqCqjk0o460blgQRcEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwwYdYne; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714639139;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c31vrJZLeYpGeljEYJNMs2vOunRYlPKu2sBlSVFxYg8=;
	b=JwwYdYne29a+Tg3H+3XtR3IrvA/Ctl8qNAkr1dOkwKfgx1AJhFXfb5dChtBj+sbFkvbpkG
	QPLdv1u1W9TGJE0Lk0jfartjwoLaGW+f5+ZeNQUfl3+NA6gfHgjrnsKxlT5L+/s7y1i1mK
	HGHV0uu1dA6nQCc0JCZeE1mTTr+FUJs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-EUr2GPt0Pq2yOwP1jt_VNA-1; Thu, 02 May 2024 04:38:57 -0400
X-MC-Unique: EUr2GPt0Pq2yOwP1jt_VNA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a51eb0c14c8so272671366b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 May 2024 01:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714639137; x=1715243937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c31vrJZLeYpGeljEYJNMs2vOunRYlPKu2sBlSVFxYg8=;
        b=OcCK1JCvORnCWe6om04Y7sB5AUZ44ZfSdAVk9+pdC5FAyiF4z7QfPvJ6YsQgj+zSU3
         y64SriDzFTQsU0qwa+4zkIaUlUqYolqp1NHk33FhENtMYy+H8jgQJkZ6b7rUDFAddgnv
         xkWh9DsZBGwhTDxlaggMy4sSghOrfV3foNB1AUyzPV0X80O86vnX/Yc2yzL8DzJN14o+
         TSKfLjSjwZlekjGJcs8C8NSb1780LHzygv7+9oO7Ba/ZJRH3R5IMEO4GheBR8X4ze4XF
         ZNaqgkAo7z0UA2RgTQ0fuJ7P99WmebBExtw7bsq6E+JoCJHMYCeWbj86X5qO1FL18nFz
         ohBw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGhjwtNVIiJarF3SK8BQZhFQebdD74gtCIKFc3ffWDAc7YeNIG/EY8JQbyOnANcalzx5QFMB8JwDAelPu29XUvECAZT+bh/H2y1QJrAGHsquGug==
X-Gm-Message-State: AOJu0YxgpZOyAoWPH6VTKHAmrhcq14cgZqA02Qdb0rVdGWih62dv8wPZ
	RoUaoXis5XNsjIPHylbl+smbjAT1aZowtHCloC40Hg8hgVPG62DVvOl5TqnrayF17GOjLp6lKM6
	wypSDtLOXnPyFv0WD/CcQdW5SkxLve0fWNH80cPKw/1XvRJprVLuZXvHgn6Ek38auan/He5Q=
X-Received: by 2002:a17:907:760f:b0:a59:62f5:e81d with SMTP id jx15-20020a170907760f00b00a5962f5e81dmr1502922ejc.48.1714639136726;
        Thu, 02 May 2024 01:38:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFozuGaQ9i7FrTfhc8WZ9SlinQ341gN1S7oDrnyTC5jvrZ2XKSVrXXBUtT70huwAJT6mQwHng==
X-Received: by 2002:a17:907:760f:b0:a59:62f5:e81d with SMTP id jx15-20020a170907760f00b00a5962f5e81dmr1502909ejc.48.1714639136313;
        Thu, 02 May 2024 01:38:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v2-20020a17090606c200b00a5910978658sm277502ejb.208.2024.05.02.01.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 01:38:55 -0700 (PDT)
Message-ID: <b08a6155-0701-403a-9c33-b1e24fd99e42@redhat.com>
Date: Thu, 2 May 2024 10:38:55 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Defer probing of SAM if serdev device is not
 ready
To: Weifeng Liu <weifeng.liu.z@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org
Cc: Maximilian Luz <luzmaximilian@gmail.com>
References: <20240502040255.655957-2-weifeng.liu.z@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240502040255.655957-2-weifeng.liu.z@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Weifeng,

On 5/2/24 6:02 AM, Weifeng Liu wrote:
> Greetings,
> 
> This series is intended to remedy a race condition where surface
> aggregator module (SAM) which is a serdev driver could fail to probe if
> the underlying UART port is not ready to open.  In such circumstance,
> invoking serdev_device_open() gets errno -ENXIO, leading to failure in
> probing of SAM.  However, if the probe is retried in a short delay,
> serdev_device_open() would work as expected and everything just goes
> fine.  As a workaround, adding the serial driver (8250_dw) into
> initramfs or building it into the kernel image significantly mitigates
> the likelihood of encountering this race condition, as in this way the
> serial device would be initialized much earlier than probing of SAM.
> 
> However, IMO we should reliably avoid this sort of race condition.  A
> good way is returning -EPROBE_DEFER when serdev_device_open returns
> -ENXIO so that the kernel will be able to retry the probing later.  This
> is what the first patch tries to do.
> 
> Though this solution might be a good enough solution for this specific
> issue, I am wondering why this kind of race condition could ever happen,
> i.e., why a serdes device could be not ready yet at the moment the
> serdev driver gets called and tries to bind it.  And even if this is an
> expected behavior how serdev driver works, I do feel it a little bit
> weird that we need to identify serdev_device_open() returning -ENXIO as
> non-fatal error and thus return -EPROBE_DEFER manually in such case, as
> I don't see this sort of behavior in other serdev driver.  Maximilian
> and Hans suggested discussing the root cause of the race condition here.
> I will be grateful if you could provide some reasoning and insights on
> this.

Ack, I have no objection against the changes and if Maximilian is ok with
it I can merge these right away as an interim fix, but I would really
like to know why the serdev core / tty code is registering a serdev
device for a serial port before it is ready to have serdev_device_open()
called on it. To me it seems that the root cause is in somewhere in
the 8250_dw code or the serdev core code.

Resources sometimes not being ready is sometimes which drivers generally
speaking need to handle, but in this case the resource which is not
ready is the device the driver is binding to, so it seems that
the device is registered too soon.

If someone familiar with the serial / serdev code can provide some
insight here that would be great.

Regards,

Hans




> 
> Following is the code path when the issue occurs:
> 
> 	ssam_serial_hub_probe()
> 	serdev_device_open()
> 	ctrl->ops->open()	/* this callback being ttyport_open() */
> 	tty->ops->open()	/* this callback being uart_open() */
> 	tty_port_open()
> 	port->ops->activate()	/* this callback being uart_port_activate() */
> 	Find bit UPF_DEAD is set in uport->flags and fail with errno -ENXIO.
> 
> I notice that flag UPF_DEAD would be set in serial_core_register_port()
> during calling serial_core_add_one_port() but don't have much idea
> what's going on under the hood.
> 
> Additionally, add logs to the probe procedure of SAM in the second
> patch, hoping it could help provide context to user when something
> miserable happens.
> 
> Context of this series is available in [1].
> 
> Best regards,
> Weifeng
> 
> [1] https://github.com/linux-surface/kernel/pull/152
> 
> Weifeng Liu (2):
>   platform/surface: aggregator: Defer probing when serdev is not ready
>   platform/surface: aggregator: Log critical errors during SAM probing
> 
>  drivers/platform/surface/aggregator/core.c | 39 ++++++++++++++++++----
>  1 file changed, 32 insertions(+), 7 deletions(-)
> 


