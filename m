Return-Path: <platform-driver-x86+bounces-5799-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6CE991DEE
	for <lists+platform-driver-x86@lfdr.de>; Sun,  6 Oct 2024 12:46:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA338B2117C
	for <lists+platform-driver-x86@lfdr.de>; Sun,  6 Oct 2024 10:45:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34938171675;
	Sun,  6 Oct 2024 10:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I24dnczx"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5C32F2E
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Oct 2024 10:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728211555; cv=none; b=V8gWs3SIz4fmm03AgKJsnll+8zzXjFJ8OetMphfZAhZpEMLCNUTJFzgz6Ia826Z9d2n/HCdME0AurMF2zmd6FBXA2FclAnigdbJrz5aAZaTwi0uPg/RBMppysXlaXGhpvkzpx5ow+9LYgencS+MmyoEkoIGJmhNwoizJVfn9EHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728211555; c=relaxed/simple;
	bh=NxoBYzed9QV7Gs0mlBSEYmLYwhxHfzaS8p3y7IH3PVw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=bnoE8Cmzl8xaWIBEkFBUQWz6byYlWDjEoRIPXqrz+fmOcbBofX1mR7EaMiJGk7DaTMWEaRNuqmpwG329CIBjM/dQ/pqb4Y27k5XEDw8YgmPh3EdzpI+vLMzZzGvspOArzelqH3uLrsW7hFXS4zRYEKpatVbLbChee02ApMapwiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I24dnczx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728211552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upnpD2Vznm6LXgIWJ/r2IQjqA0ut7a98xGC7ojy9xnU=;
	b=I24dnczxu1rpruHsYDCoY5U18fTSrSGh35wepVwhilZjf3oDngNBB61ePqJsnLf2D478FU
	LmzAECNyZB76YCDUMjxp4mmbW5oPP2koR/y/CnboAbvgE64MrX5K6dZ08GADzlkNDQhxso
	3s5u8ULFgTYy44GwHQJz+EZSGxPwe6E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-bIgPRAPNNfilsGUy3vObQw-1; Sun, 06 Oct 2024 06:45:51 -0400
X-MC-Unique: bIgPRAPNNfilsGUy3vObQw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a994dfbb8b9so54049666b.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 06 Oct 2024 03:45:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728211550; x=1728816350;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upnpD2Vznm6LXgIWJ/r2IQjqA0ut7a98xGC7ojy9xnU=;
        b=qUc3m3pAFR0Z7fHMvlPZaA6PUt/+GIq1tHMg1UifUA0oAda+Ft9N5ytMSPd2SfmF8N
         sdRdZVzZj+dCNdT451bhTCDmunP2JG3Yw4gSpWwJa1OviOsNWXIHtfRcqthSWx2jc1h5
         /Z8HcgOc5wzl64EaUcjTdmMrPVQ7RqOtU3PhQ3aO0eI2/qxIGK7TE4smGkQjGWj43pk+
         cL1EnubeU+4L+fXqn3GPkgV5acuRhsFFef/nEzbY30FVPHFBgj8l2XZ5hvMSKzbXtDeK
         abx0St/dTOGlcHzeT1LTByeaZeUMNNhQDxWchoPp+lXx01Iw5EDQP7dnPYWp7s2JnptO
         quBg==
X-Forwarded-Encrypted: i=1; AJvYcCXV83PBQSNKa9Yq5i5oPdWJfDnn9+SqYE5JIHNa0sQ4TDek3H5I+ezqwuyj/Ivah54UdQGQDc7nfQTfZpWHPPIddVn3@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc7cCXCxy8Ji46JKyq6HTWfopfoQjJQm/5swHOvefot8ObkqKx
	kKhPmFudYKVhqLQ3aC0aXEPjlrqwcaMufOqShwB6VCI9yw4NUW6ySMv5ntchooQKYP3jwZM3NQY
	ZA/a70CmPS+vXdTi7tos0A1WftSwusnwOd6JSAb3jQQRwqvKUSw50XSWZGWNSr/o1xQ7kfLc=
X-Received: by 2002:a17:907:26c1:b0:a86:8ff8:1dd8 with SMTP id a640c23a62f3a-a991c02863dmr994079766b.46.1728211549967;
        Sun, 06 Oct 2024 03:45:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkg3ZoYI206VHtmuk3XW9A/zCqOHaQlSnlegPKTDxkKSDtXiKQ7tR1wjXBdX9nPPbyRO5A2w==
X-Received: by 2002:a17:907:26c1:b0:a86:8ff8:1dd8 with SMTP id a640c23a62f3a-a991c02863dmr994078166b.46.1728211549598;
        Sun, 06 Oct 2024 03:45:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9945ce60ccsm116600466b.67.2024.10.06.03.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Oct 2024 03:45:49 -0700 (PDT)
Message-ID: <a014ab86-0767-4ef7-805c-5250e239f4c8@redhat.com>
Date: Sun, 6 Oct 2024 12:45:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv4 1/1] platform/x86: dell-sysman: add support for
 alienware products
From: Hans de Goede <hdegoede@redhat.com>
To: Crag Wang <crag0715@gmail.com>, mario.limonciello@amd.com,
 Prasanth Ksr <prasanth.ksr@dell.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: crag.wang@dell.com, Crag Wang <crag_wang@dell.com>,
 Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241004152826.93992-1-crag_wang@dell.com>
 <8f45a215-1126-41c4-b4dd-92ad04ea5a8b@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <8f45a215-1126-41c4-b4dd-92ad04ea5a8b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6-Oct-24 12:43 PM, Hans de Goede wrote:
> Hi,
> 
> On 4-Oct-24 5:27 PM, Crag Wang wrote:
>> Alienware supports firmware-attributes and has its own OEM string.
>>
>> Signed-off-by: Crag Wang <crag_wang@dell.com>
> 
> Thank you for your patch/series, I've applied this patch
> (series) to my review-hans branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
> 
> Note it will show up in the pdx86 review-hans branch once I've
> pushed my local branch there, which might take a while.
> 
> I will include this patch in my next fixes pull-req to Linus
> for the current kernel development cycle.

Running checkpatch after applying show:

WARNING: From:/Signed-off-by: email address mismatch: 'From: Crag Wang <crag0715@gmail.com>' != 'Signed-off-by: Crag Wang <crag_wang@dell.com>'

I have fixed this by running:

git commit --amend --author="Crag Wang <crag_wang@dell.com>"

So that things match now. Next time please try to use your Dell
email for submitting the patches instead of gmail.

Regards,

Hans



