Return-Path: <platform-driver-x86+bounces-1612-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E456867B3E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 17:11:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6135E1C2A2F1
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 16:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6F412C532;
	Mon, 26 Feb 2024 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NW7GZUh6"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A1312BF1C
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 16:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708963862; cv=none; b=mtdhS0NSSZUauMJ+54kOxmZZmW+XnS/luELFZGEe+xNPMiDPH+MD0obL88fD7wyFY7YALwhaErgWOO7fcHJOznkCIucoksUY9HZXTQy/iFjn5TLW32/9OWvZfnNyHUpFn/ArhfxOVxmB0tWz3XYyYmgpaZkSWIl7qYLSN95plpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708963862; c=relaxed/simple;
	bh=IKJVu6wZV5ujTTsOPLBnVORIKgraqW10GdJ5zwhsGUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rOKYihYHvgsffkZ7r/ABqmB+JdfrWdjLLxeGSm4xuWu1eNBhQE9miuLWxaSZm9imR9SckFqv5qC6cAzOQUJPNPQZ2jbTiivfLpfP1gDmZWhkCmN5dcn6JcxF9/tduULK7YoaNRMC90Jkp5Cstxd3mY+6BSkh8WI3doOCG/fLpk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NW7GZUh6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708963859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=woAOThpj2J4tH7F5PzEED1AordU+F4q2bfJ28Y6keHE=;
	b=NW7GZUh6eEH0SbmQPomKUdt1P3N7WFWKGInK1VTjCzv9klUAhDM6aNOE+/7L96spLbiMO1
	mE68VubBdP6dpzBKA9KuwjmqSmbFo0vK9rY2QAdu8bksGxOa6OM0Kri8VT9WhdcpkVgNV+
	+5KlzKxQOJDo4jsHSOgJmeCV7JoaGG4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629--68-yNGdO7mOBNmeLZQYHg-1; Mon, 26 Feb 2024 11:10:58 -0500
X-MC-Unique: -68-yNGdO7mOBNmeLZQYHg-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-787988f273dso348894985a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 08:10:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708963857; x=1709568657;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woAOThpj2J4tH7F5PzEED1AordU+F4q2bfJ28Y6keHE=;
        b=bNLfep7ObjBnXCV9j29KuMQ+S9JF8HRwPCF577Br4M617yNJWukfJXuu5osDepDCFt
         4uNLVr+c12MEikbs9ukJekQL0g2lkrxO/i6Yq+qnR94i4v39cG7cCERYpApxhk+4VPpH
         Mpmoeh0JwQdxBibQ07GCEF1ULQS7N1fxH975LId59eq7P9Kbzz09ntrg4FIX42qqXc2r
         y27sODMUqXRiSuCoqART3I7HbKW9FZdGp9ilVnZTuxZL+qXg6DYnzmLl7Lm5jjINqjuK
         uIcga/rERwjUWeF4GNFjgEc02h5tjXNCTlSEowPEizldkghGSLCpkOQ9X9sQ6nMa6PV6
         8MNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNzaL8YYIxleb/7fB5PM0eqhm7JqIruAqCyUamJHiCS+f1W0ETPGOoIcwMgZ06T/7nlA7BmjJFLbWKSy5U0Bfx3m02s1cJKtxhym8J4GIfv8DVLA==
X-Gm-Message-State: AOJu0Yzj/bB6snVvCut2X1jtdxY0HXxI1Qjv44o2xNw323v5A9GbZWJB
	tZoJRyFL3WlGcdtPb2u0dTxVafXVVerGE7DcM6WWfSIGql0epMe5HDdAyMGay5LLwP7r/U4VCOU
	P6nyIomlcty5XBj9znhENWpar4wHzgWBCzEDUbV73kbUyziViK2yiuFJTOQkntoKJEt2VwaqEP+
	FHTLU=
X-Received: by 2002:a05:620a:2416:b0:785:635b:ac2b with SMTP id d22-20020a05620a241600b00785635bac2bmr8908514qkn.32.1708963857396;
        Mon, 26 Feb 2024 08:10:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2MFPYen/n2mShUieoTiLnUA52oBPxHFlEtD/wlll7mKSqVGE4XzC7iMVi6XaBW6A4YbRmcQ==
X-Received: by 2002:a05:620a:2416:b0:785:635b:ac2b with SMTP id d22-20020a05620a241600b00785635bac2bmr8908497qkn.32.1708963857151;
        Mon, 26 Feb 2024 08:10:57 -0800 (PST)
Received: from [10.0.0.33] (modemcable096.103-83-70.mc.videotron.ca. [70.83.103.96])
        by smtp.gmail.com with ESMTPSA id j22-20020a05620a147600b007876a732823sm2604968qkl.25.2024.02.26.08.10.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 08:10:56 -0800 (PST)
Message-ID: <1608d86a-24e8-403b-b199-ce23f8411cfd@redhat.com>
Date: Mon, 26 Feb 2024 11:10:55 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/mellanox: mlxbf-pmc: Fix module loading
Content-Language: en-US, en-CA
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: shravankr@nvidia.com, davthompson@nvidia.com, ndalvi@redhat.com,
 LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>
References: <cover.1708635408.git.luizcap@redhat.com>
 <170895404513.2243.14840310263795846559.b4-ty@linux.intel.com>
 <def1a153-3cfb-431d-a7d2-a13bb7d65f4f@redhat.com>
 <29863354-4efe-d199-a9d4-7daf83f6cde9@linux.intel.com>
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <29863354-4efe-d199-a9d4-7daf83f6cde9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-02-26 11:04, Ilpo Järvinen wrote:
> On Mon, 26 Feb 2024, Luiz Capitulino wrote:
> 
>> On 2024-02-26 08:27, Ilpo Järvinen wrote:
>>> On Thu, 22 Feb 2024 15:57:28 -0500, Luiz Capitulino wrote:
>>>
>>>> The mlxbf-pmc driver fails to load when the firmware reports a new but not
>>>> yet implemented performance block. I can reproduce this today with a
>>>> Bluefield-3 card and UEFI version 4.6.0-18-g7d063bb-BId13035, since this
>>>> reports the new clock_measure performance block.
>>>>
>>>> This[1] patch from Shravan implements the clock_measure support and will
>>>> solve the issue. But this series avoids the situation by ignoring and
>>>> logging unsupported performance blocks.
>>>>
>>>> [...]
>>>
>>>
>>> Thank you for your contribution, it has been applied to my local
>>> review-ilpo branch. Note it will show up in the public
>>> platform-drivers-x86/review-ilpo branch only once I've pushed my
>>> local branch there, which might take a while.
>>
>> Thank you Ilpo and thanks Hans for the review.
>>
>> The only detail is that we probably want this merged for 6.8 since
>> the driver doesn't currently load with the configuration mentioned above.
> 
> Oh, sorry, I missed the mention in the coverletter.
> 
> So you'd want I drop these from review-ilpo branch as there they end
> up into for-next branch, and they should go through Hans instead who
> handles fixes branch for this cycle?

If that's the path to get this series merged for this cycle then yes,
but let's see if Hans agrees (sorry that I didn't know this before
posting).

One additional detail is that this series is on top of linux-next, which
has two additional mlxbf-pmc changes:

* 
https://lore.kernel.org/lkml/39be055af3506ce6f843d11e45d71620f2a96e26.1707808180.git.shravankr@nvidia.com/
* 
https://lore.kernel.org/lkml/d8548c70339a29258a906b2b518e5c48f669795c.1707808180.git.shravankr@nvidia.com/

Maybe those two should be included for 6.8 as well?

- Luiz


