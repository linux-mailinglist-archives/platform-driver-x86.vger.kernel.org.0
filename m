Return-Path: <platform-driver-x86+bounces-1613-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 101FF867D8A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 18:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A29431F29A6B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 17:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A52D8131740;
	Mon, 26 Feb 2024 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KO8t39yh"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F068F12FF98
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 16:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966640; cv=none; b=C5JmgfGYRFDa7k82JhvwP/4DKCbxPxk+pKFWluTqCdAQT9GmVp2xAr4aQvK/bpGNWIz/iaRmY2uvyMsruHLtL9kZhxtzrdTUpWG/5vfmJzkaQr4RJM1Y4k1OktyifUFLHq1DyPO/EJI96F3Sl5u5P8PiZOvLmP9Y8qwLwgwEoPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966640; c=relaxed/simple;
	bh=eacWoILJZ5o5Viqax6eA9ePbWI2MSS3L3kVbV7kHxlw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZI2GF6f15MItjAWiWqHJGwJoU2VsdJF6nzMC8W60ELY+Sy8VBu8XijKRKxit56yqeTztYcWGiKSE4WpEp4ei8wIIVT525kjLz6vk+HWW4EMh2UjOjOgOK1hGeqFUZ1Fqx0zG6OSSWMHWNPrzXSJvK6ZE63Bnt9c1yWNzT5mGDZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KO8t39yh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708966637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8c+aIKxEaZpezL+jzlJ7u2FhDbslxiLJ7vzY5ObQAVg=;
	b=KO8t39yhjisGVpC0rb/yLWSQ3G6wD0jd0QYy/gykNupcjK9sbLAMYIBPO2C4YlURkcAF2N
	Qg5lrnBHTawNTD2re7CcDsm7zllxXqPbqMatKmY1SSXlLRKxoZgPiOnaCnOkRnlfHLK0mY
	lhK8E1VR93rmXlXs3AERlam2u9JTzx0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-aLxPFy8aOWaruxbV1UnXZg-1; Mon, 26 Feb 2024 11:57:07 -0500
X-MC-Unique: aLxPFy8aOWaruxbV1UnXZg-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-512fe145c02so1302724e87.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 08:57:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708966623; x=1709571423;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8c+aIKxEaZpezL+jzlJ7u2FhDbslxiLJ7vzY5ObQAVg=;
        b=pvsrPV1MFwl6U7tkAjcB+j+CObbz5qwrCFCHJu54g8zpomf0i1yQuogGVAdRjSGnNP
         6N9m1zgO9IpxO+4CdbNXljXs2Q9Gc+Ek+fOCMYc/55p5C4LgWpEm4lqvUx6nnfrgaMvA
         xT+6tongJBLdpJzFkj75OnLXUvti05x+rXAuFAQfENXPjE4W2rIE3EdzyeJTeoeAG7NR
         DTprD3KTPXOuZSt2kboEsTFgf3yKB9uDi6/Q6havmhnICHQSmHmBkI7k2kQP0vsEpmco
         rbx4b00r1B4ymbT0vcjtZkSU5Cr/xqZcJ4E5CRiGPitc1RD8reuahRDDUBsGYgwoRsBu
         WGiw==
X-Forwarded-Encrypted: i=1; AJvYcCUcnDCKSmKGxwB07fjLk+5soCgUg16fkLH1DVoTwrLIvDzOfDLxMcakIBej3/fDS74HyvHJh14YeY73UmSSwiUy1SZs8tBBpnysqs8XabS6bCNWig==
X-Gm-Message-State: AOJu0YxYh+v5Db7IHwowFG7Hfwc240Xx8zZdmrKKlOBZk4CRMKJd8Clp
	OjREXRiiKlh/1jZ2GjtxI/EqhZiuVwN7OSXuR0s5yv0jsixazvvQxMkFLEI7OdNr++ssX9nGa9y
	Si/W0C7cC4uaiBqKpS0XuLPf4W0d0BHHPj6uBPoVZJIT8rIza0OIeh5HApGqxXGcgs0yHufo=
X-Received: by 2002:ac2:4288:0:b0:512:fdb3:7a9e with SMTP id m8-20020ac24288000000b00512fdb37a9emr1819836lfh.31.1708966623618;
        Mon, 26 Feb 2024 08:57:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IErYMtJMKxyV17XeAD60DbKw+SYc8okTK2r7tU7czsIcdBFoyqpwalN4Y46LherjciMy/pCzA==
X-Received: by 2002:ac2:4288:0:b0:512:fdb3:7a9e with SMTP id m8-20020ac24288000000b00512fdb37a9emr1819819lfh.31.1708966623192;
        Mon, 26 Feb 2024 08:57:03 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id tb16-20020a1709078b9000b00a42ea030a6esm2534364ejc.82.2024.02.26.08.57.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 08:57:02 -0800 (PST)
Message-ID: <eea32e56-2ea3-4a11-b1b9-8dd46dac7d72@redhat.com>
Date: Mon, 26 Feb 2024 17:57:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/mellanox: mlxbf-pmc: Fix module loading
To: Luiz Capitulino <luizcap@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: shravankr@nvidia.com, davthompson@nvidia.com, ndalvi@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org
References: <cover.1708635408.git.luizcap@redhat.com>
 <170895404513.2243.14840310263795846559.b4-ty@linux.intel.com>
 <def1a153-3cfb-431d-a7d2-a13bb7d65f4f@redhat.com>
 <29863354-4efe-d199-a9d4-7daf83f6cde9@linux.intel.com>
 <1608d86a-24e8-403b-b199-ce23f8411cfd@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <1608d86a-24e8-403b-b199-ce23f8411cfd@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Luiz,

On 2/26/24 17:10, Luiz Capitulino wrote:
> On 2024-02-26 11:04, Ilpo Järvinen wrote:
>> On Mon, 26 Feb 2024, Luiz Capitulino wrote:
>>
>>> On 2024-02-26 08:27, Ilpo Järvinen wrote:
>>>> On Thu, 22 Feb 2024 15:57:28 -0500, Luiz Capitulino wrote:
>>>>
>>>>> The mlxbf-pmc driver fails to load when the firmware reports a new but not
>>>>> yet implemented performance block. I can reproduce this today with a
>>>>> Bluefield-3 card and UEFI version 4.6.0-18-g7d063bb-BId13035, since this
>>>>> reports the new clock_measure performance block.
>>>>>
>>>>> This[1] patch from Shravan implements the clock_measure support and will
>>>>> solve the issue. But this series avoids the situation by ignoring and
>>>>> logging unsupported performance blocks.
>>>>>
>>>>> [...]
>>>>
>>>>
>>>> Thank you for your contribution, it has been applied to my local
>>>> review-ilpo branch. Note it will show up in the public
>>>> platform-drivers-x86/review-ilpo branch only once I've pushed my
>>>> local branch there, which might take a while.
>>>
>>> Thank you Ilpo and thanks Hans for the review.
>>>
>>> The only detail is that we probably want this merged for 6.8 since
>>> the driver doesn't currently load with the configuration mentioned above.
>>
>> Oh, sorry, I missed the mention in the coverletter.
>>
>> So you'd want I drop these from review-ilpo branch as there they end
>> up into for-next branch, and they should go through Hans instead who
>> handles fixes branch for this cycle?
> 
> If that's the path to get this series merged for this cycle then yes,
> but let's see if Hans agrees (sorry that I didn't know this before
> posting).

Hmm, new hw enablement typically goes through -next and not to
the current fixes branch. And AFAICT this is new hw enablement,
not a regression / bug-fix.

Is there any special reason why this needs to be in 6.8 ?

For RHEL kernels you can cherry-pick patches from -next
as necessary.

> One additional detail is that this series is on top of linux-next, which
> has two additional mlxbf-pmc changes:
> 
> * https://lore.kernel.org/lkml/39be055af3506ce6f843d11e45d71620f2a96e26.1707808180.git.shravankr@nvidia.com/
> * https://lore.kernel.org/lkml/d8548c70339a29258a906b2b518e5c48f669795c.1707808180.git.shravankr@nvidia.com/

Hmm, those are not small patches, any other reason
why this really should go to -next IMHO.

Regards,

Hans



