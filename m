Return-Path: <platform-driver-x86+bounces-677-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB781F657
	for <lists+platform-driver-x86@lfdr.de>; Thu, 28 Dec 2023 10:35:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8792B20A37
	for <lists+platform-driver-x86@lfdr.de>; Thu, 28 Dec 2023 09:35:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 811AE63B6;
	Thu, 28 Dec 2023 09:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hf4xRU7H"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25B36FA2
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703756111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8y5x4etC13LTF55/sJjtexRc2JV1Bac01jW/3OxAI+4=;
	b=Hf4xRU7H1ZqR1HKtrY+3ZtQmpHh2ZHv5G6RwsryO8fd8gch6PDqaB7zwL4/PAZxHFwYMkg
	YNc1h248wG4CTnihApBByVszX5T/+o8YqwoqDmZuozT3C08F3roqaNR9PLleE6Gu89nUxE
	J3IWI1Ndok2eiPbZrpPqnhmbVNPiasI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-TMgEgZubOOWjU2zkn_ePAQ-1; Thu, 28 Dec 2023 04:35:09 -0500
X-MC-Unique: TMgEgZubOOWjU2zkn_ePAQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-9fd0a58549bso642938366b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Dec 2023 01:35:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703756108; x=1704360908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8y5x4etC13LTF55/sJjtexRc2JV1Bac01jW/3OxAI+4=;
        b=dGnkvHeFmVB/lh0LPm2gfbo5ReChz4FN17v8moAmMMenMTYmqUpVlTkPcedveRaV3H
         pBV0RSIgR6GR6RGT6cYE2qcD0PlQ+/HDG3sFUfKp7xoMyae9ZTdHDXgfDfrYzFF+72qi
         p+ggE6u0FlsU2R3tdihpSwO1pKSH6vSZQlzgNydrxaKOIZxOLrv7qI4fGAeFiMCPo8ap
         GxXsLVWe1jbTJOTJNdgryeE9ATLGoBhV00p9XAvsk8IxXkVHxLOKrJ7J0dCshsRvVpU7
         K1jfmWeGw8t21SGxpi7L/eV9nP+mcjjg63Umqvharsn0yqvfJFV2QZIph6LMQsMIJkZr
         g+AA==
X-Gm-Message-State: AOJu0YxUKSUA9bjeHIaCeERBIWAb6bwHfhEj3vt+4uJQBm4gzfh8cztE
	TFf8uBYyY5mL06Ek6XCXRYkWVdRlreeUK//O4ShzKYBNhna4f5m1mT7BbDRSM6b1j3vx96z0GCF
	w12jghYsQiRLLjUBgqW9pvsOq9Z8JdZsh7Yt5ZMMP2w==
X-Received: by 2002:a17:906:ad7:b0:a26:ebab:d86e with SMTP id z23-20020a1709060ad700b00a26ebabd86emr6217613ejf.60.1703756108666;
        Thu, 28 Dec 2023 01:35:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGijQQAQLygMPWbZ1unqsukYWSk03jLQn/uyvmxnDsUmV65517LGVEkaims0CfCZDSWprolfg==
X-Received: by 2002:a17:906:ad7:b0:a26:ebab:d86e with SMTP id z23-20020a1709060ad700b00a26ebabd86emr6217601ejf.60.1703756108337;
        Thu, 28 Dec 2023 01:35:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id wh14-20020a170906fd0e00b00a233efe6aa7sm7242542ejb.51.2023.12.28.01.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Dec 2023 01:35:07 -0800 (PST)
Message-ID: <f51a4bc1-b38c-43c0-8e8a-28463c49c1f6@redhat.com>
Date: Thu, 28 Dec 2023 10:35:06 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] Intel PMC Core GBE LTR regression fix
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "David E. Box" <david.e.box@linux.intel.com>
Cc: rajvi.jingar@linux.intel.com, platform-driver-x86@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20231223032548.1680738-1-david.e.box@linux.intel.com>
 <652cf483-6098-5e0-94ef-fdca344fa2ac@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <652cf483-6098-5e0-94ef-fdca344fa2ac@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/27/23 19:14, Ilpo Järvinen wrote:
> On Fri, 22 Dec 2023, David E. Box wrote:
> 
>> This patch series addresses the network performance regression caused by
>> commit 804951203aa5 ("platform/x86:intel/pmc: Combine core_init() and
>> core_configure()").
>>
>> Unfortunately, the regression is included in the recent Lunar Lake and
>> Arrow Lake support patches in the review branch. Patches 1 and 2 remove the
>> LTR ignore without a fix. They may be folded into the respective enabling
>> patches indicated in the changelog. This is done so that the next patches
>> fixing the regression can be backported to stable kernels with fewer, if
>> any, conflicts.
>>
>> Patches 3 and 4 provide the support needed for Patch 5 to move the GBE LTR
>> ignore from probe-time to suspend/resume time. All three carry the same
>> Fixes tag so that the stable kernels can pick them up without causing a
>> separate suspend-time PC10 regression.
>>
>> Patches 6 and 7 then add the LTR suspend/resume fix for Arrow Lake and
>> Lunar Lake. Of course, they cannot be folded into the enabling patches
>> unless the LTR fixes (3-5) are applied before. Sorry about this :(.
> 
> Wow, this is messy...
> 
> So the best order would be placing 3-5 before these Arrow Lake and Lunar 
> Lake commits in for-next:
>   119652b855e6 ("platform/x86/intel/pmc: Add Lunar Lake M support to intel_pmc_core driver")
>   f34dcf397286 ("platform/x86/intel/pmc: Add Arrow Lake S support to intel_pmc_core driver")
> ? And then folding 1-2 and 6-7 into those respective commits?
> 
> It makes me wonder though why those two commits couldn't have been delayed 
> slightly to get these fixes included first... :-/

To untangle this mess I have squashed patches 1-2 into the original
commits in for-next, so that there won't be a conflict
between next and fixes when merging patches 3-5 into fixes.

Ilpo can you pick-up patches 3-5 for the fixes branch ?

And maybe also "platform/x86: p2sb: Allow p2sb_bar() calls during PCI
device probe" fix ? I know you have a small review comment on this patch,
but IMHO waiting for the small unrelated cleanup to be split out is not
worth delaying this deadlock fix. As for the missing fixes tag I believe
that should be:

Fixes: 9745fb07474f ("platform/x86/intel: Add Primary to Sideband (P2SB) bridge support")

And then do one more fixes pull-request for the GBT LTR fixes +
the P2SB deadlock fix ?

I know it is the holiday season, but if you feel up to it,
it would be nice to get those fixes on their way to Linus
and the stable kernels a bit earlier then before 6.8-rc1 .

I'll merge patches 6-8 into for-next then after back-merging
the fixes.

Regards,

Hans



