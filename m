Return-Path: <platform-driver-x86+bounces-3159-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D68118B870D
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 May 2024 10:59:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5DFE1C2129F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  1 May 2024 08:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F36050283;
	Wed,  1 May 2024 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fcJ5SM/n"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C884D5BF
	for <platform-driver-x86@vger.kernel.org>; Wed,  1 May 2024 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714553939; cv=none; b=Z4eK243K+5C7ti4+9W3Pi17LG8obiPQALFg8rjUHk7nG3oS6esK0LyzN5YV2xjDAQNaqlvbrDKk9Ejrr+0vdSLCEbuwv3SLL2vgsHcc78YRjU1Swed9hAZp3rVosJ+5/fgb+3/7ThJnYvRHiAdwTDL8J3qgT5NvS/qDW5T3on4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714553939; c=relaxed/simple;
	bh=MV3Z+nLRxwsdv/sDrSvoVBbCbpxZjzDmz8ODuaHXP0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z2H4vrCfLhLKjSVF9pYTTGCKvPA+emFG27/NaTVb6SzF/Tzaf0bfK0xW/cNNXyLNq4Sz/B+NyP2BlsDMf6GAf08QK84pbaRWKHdZMTILWlCEZZLq3LAV+6rLrypNU4LccmDm1/w89xtGZvbCQQI0dqRPq5CSxtl1KxUCDrP8Ywk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fcJ5SM/n; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714553936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejafn+Ew0TRnL0PiMtQJJfBDd3DaPdR5gqikNXiZPCU=;
	b=fcJ5SM/nsj6rWbRlImj9s5a08TGBM+mNOXb6PHOQFdykWz/+yuGJ5rnXreAHaLHptZEMLJ
	95+jF2Kk1rG9JZHZ11xMtD7Etry2p0G8xRj64nt9gl7dzXxRD/sfPEVieJCx5PrYgQha3e
	2ih4PLsslFbH7btFzaxcwGX5LxlTRnE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-8vJn_2zwNHqKKnlVF66oAw-1; Wed, 01 May 2024 04:58:55 -0400
X-MC-Unique: 8vJn_2zwNHqKKnlVF66oAw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-34da8f1bf7cso768870f8f.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 May 2024 01:58:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714553934; x=1715158734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejafn+Ew0TRnL0PiMtQJJfBDd3DaPdR5gqikNXiZPCU=;
        b=LhV5dv2xL7Q5XmmlmvwQFfx3Xx9lbpT8e6y7tJDhCuJoPPWzeXQOjjxYVvJRSJC7gG
         j5XlQIoNnndw3ROFfLwgoJO1SnlMnTwlVKLZG6CU1jBN7cEkdlnVSx2DwEtj6N115X4J
         qlzXY+9jE1pPEdmyXL3LAu+mlAr3G5ykZS1QHuk16PKnIQMn5TR1eyAg06eGpSrN5ePe
         XM7HHEL2036vKJCceRZK07Gw3yy4BRrCq6HjjM6aHF5BgbV1z1mb3zPEYEKkqCYKxsAK
         Sj0q9XRql7WnHgoZYgDoj1Pa7BlahXw9qbrQ1ywi/w/+itqAKP4i17PKbseoMntBEnsG
         6J7A==
X-Forwarded-Encrypted: i=1; AJvYcCWIF660f5VQXqGtQk0H7MGpxyGxbYYz2s9lR5iLBwLbD21xvN0Xh9UlGsbKgnF6UOuQ/Z3d2K7cduk/gDHcFrGpVIh/BpF+0oaHiqoaedM22fulEQ==
X-Gm-Message-State: AOJu0Yygm4/maXhtX2lqTGXNoJZT72wC1qoBCn4t88j/PE/aBFWz2T1C
	uJDEz/9wEgv6uJ0cp7JJOI6zX5SCom79vfXWEMtIbXETUgQ+dxg02NR6BrEMjNHx9JWfzJrxQjn
	LaF9HNu/X6AvSuKZ2xDj7XAOvJDdB0mOtIcs5800ws7atV639dcCBRoCDlwSkaab0Cl5jwF8=
X-Received: by 2002:a5d:4584:0:b0:34d:707c:922a with SMTP id p4-20020a5d4584000000b0034d707c922amr1661834wrq.13.1714553934394;
        Wed, 01 May 2024 01:58:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfW47vm2Pj2MyGDfx7q0l6Yx/QHnpDF4xwrnDJtsdCYYQSojnWFleyeSX0DOWw0qFtz2v2nQ==
X-Received: by 2002:a5d:4584:0:b0:34d:707c:922a with SMTP id p4-20020a5d4584000000b0034d707c922amr1661816wrq.13.1714553934027;
        Wed, 01 May 2024 01:58:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id l9-20020a17090615c900b00a555be38aaasm15975786ejd.164.2024.05.01.01.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 01:58:53 -0700 (PDT)
Message-ID: <5337c72d-1642-4cee-88a6-db9df97a01f5@redhat.com>
Date: Wed, 1 May 2024 10:58:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/intel/ifs: Initialize AMX state for the
 scan test
To: "Chang S. Bae" <chang.seok.bae@intel.com>, linux-kernel@vger.kernel.org
Cc: x86@kernel.org, platform-driver-x86@vger.kernel.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 ilpo.jarvinen@linux.intel.com, tony.luck@intel.com, ashok.raj@intel.com,
 jithu.joseph@intel.com
References: <20240430212508.105117-1-chang.seok.bae@intel.com>
 <20240430212508.105117-3-chang.seok.bae@intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240430212508.105117-3-chang.seok.bae@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/30/24 11:25 PM, Chang S. Bae wrote:
> The scan test does not start when the AMX state remains active and is not
> re-initialized. With the extension of kernel_fpu_begin_mask(), the driver
> code can now initialize the state properly.
> 
> Introduce custom FPU handling wrappers to ensure compliant with the
> established FPU API semantics, as kernel_fpu_begin() exclusively sets
> legacy states. This follows the EFI case from commit b0dc553cfc9d
> ("x86/fpu: Make the EFI FPU calling convention explicit").
> 
> Then, use these wrappers to surround the MSR_ACTIVATE_SCAN write to
> minimize the critical section. To prevent unnecessary delays, invoke
> ifs_fpu_begin() before entering the rendezvous loop.
> 
> Signed-off-by: Chang S. Bae <chang.seok.bae@intel.com>
> Reviewed-by: Jithu Joseph <jithu.joseph@intel.com>
> Tested-by: Jithu Joseph <jithu.joseph@intel.com>

Thanks, the patch looks good to me.

I believe this is best merged through the tip/x86 tree together
with patch 1/2 :

Acked-by: Hans de Goede <hdegoede@redhat.com>

I have checked and this should not cause any conflicts with
the ifs changes current in platform-drivers-x86/for-next.

Regards,

Hans




> ---
>  drivers/platform/x86/intel/ifs/ifs.h     | 14 ++++++++++++++
>  drivers/platform/x86/intel/ifs/runtest.c |  6 ++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index 56b9f3e3cf76..71d8b50854b2 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -325,4 +325,18 @@ int do_core_test(int cpu, struct device *dev);
>  extern struct attribute *plat_ifs_attrs[];
>  extern struct attribute *plat_ifs_array_attrs[];
>  
> +static inline void ifs_fpu_begin(void)
> +{
> +	/*
> +	 * The AMX state must be initialized prior to executing In-Field
> +	 * Scan tests, according to Intel SDM.
> +	 */
> +	kernel_fpu_begin_mask(KFPU_AMX);
> +}
> +
> +static inline void ifs_fpu_end(void)
> +{
> +	kernel_fpu_end();
> +}
> +
>  #endif
> diff --git a/drivers/platform/x86/intel/ifs/runtest.c b/drivers/platform/x86/intel/ifs/runtest.c
> index 95b4b71fab53..a35eac7c0b44 100644
> --- a/drivers/platform/x86/intel/ifs/runtest.c
> +++ b/drivers/platform/x86/intel/ifs/runtest.c
> @@ -188,6 +188,9 @@ static int doscan(void *data)
>  	/* Only the first logical CPU on a core reports result */
>  	first = cpumask_first(cpu_smt_mask(cpu));
>  
> +	/* Prepare FPU state before entering the rendezvous loop*/
> +	ifs_fpu_begin();
> +
>  	wait_for_sibling_cpu(&scan_cpus_in, NSEC_PER_SEC);
>  
>  	/*
> @@ -199,6 +202,9 @@ static int doscan(void *data)
>  	 * are processed in a single pass) before it retires.
>  	 */
>  	wrmsrl(MSR_ACTIVATE_SCAN, params->activate->data);
> +
> +	ifs_fpu_end();
> +
>  	rdmsrl(MSR_SCAN_STATUS, status.data);
>  
>  	trace_ifs_status(ifsd->cur_batch, start, stop, status.data);


