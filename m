Return-Path: <platform-driver-x86+bounces-4765-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074194F1E3
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2024 17:40:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCA37283984
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2024 15:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B03E7184524;
	Mon, 12 Aug 2024 15:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SFQGNcf3"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14674183CD7
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 15:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723477220; cv=none; b=fBv53mAyrl/3gc79g+C2rY/q8omyJSrElaSt+GkRXHG+ejn2PyhTnOUZzdeIh4tTMefjxCzMAu9wDKZI33XLTes5Z95xcT2Hi18e473I5DGQCfQec4TTztYtbo2z45ij0q8PYnp91YBhdNfTquQKvWQPIp6KjlMKUu83pQT9Ikc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723477220; c=relaxed/simple;
	bh=0OYeQ2fZ3PWhJcSem+khrvGeqAFHfT8q/YAWv+E7EUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N8oJV3S4EoiS6MDypFMzkcLaB0b60kRl9J0wyRRD6FNUilGgGDdix5R34WTohgbvXwj+wVSCZg8J+V/008OLgUdN/jsrGx2RNacMKykNDWpv8yM30Dwe25WfFy+CsxG8iw3l5E63v7oM005VTbkdSat8SbK0lGIr3+NK4gsJDmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SFQGNcf3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723477218;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsDajGJ5npBRUKxZy3yJy39+Yw8rcRxs978LRc3+/7c=;
	b=SFQGNcf3L0ZGL4RtzSnw0HUy9iJU4liLEwMoUd/usJpKc4oatmXgrOrocaBds9ZRvPqA3j
	lplNj4k6+DKv8UCaqCthMdTDjxz9B0y4QwDWrYVL+vC2g37Cyd6RgCZYWhqTBxb3csCGe1
	qbKL4Ln3EDPXMsXgEoOMMoYJBM9wORY=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-ESAznQYMPIudQXT1f3oWTA-1; Mon, 12 Aug 2024 11:40:16 -0400
X-MC-Unique: ESAznQYMPIudQXT1f3oWTA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52f0108a53dso5909843e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 08:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723477215; x=1724082015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsDajGJ5npBRUKxZy3yJy39+Yw8rcRxs978LRc3+/7c=;
        b=TzCnO6wyKGO8SOu1opfjazzfSSDoJosJ8qfzIa/jYc8zbIWKbV2HrUufwyVawyD7jH
         zaseZUQFDVt33cugo94S3PXrbyPGVIyB4Rs95bntjEekGE9RmM/ojoLp5b1zyitaEzkb
         SZofC9UbNUfA18+hXudHVdqOEkQEh+OMZlL6UzTPq1OzN3lbckDy7S3Y89vUXg6s2oid
         w9Huj0DULcp/e0neBiy8I9DbrdHm6QkSjtBQyOc4tmoF8bSmoHki5xATo5m/rmWoPhyG
         iG2UX4IVEvq90JkB9UYr8j2EjuL5eIzvbpx/CQRP0jAufi/gehRW+3RHl81mIXZc6Afv
         TN8A==
X-Forwarded-Encrypted: i=1; AJvYcCVrQfR6rohD/bXisVA5FQSr44p3MKv7NPl6EUiBclxDFtrhxf7agd8pRvql8av+XOsoDNJVQ3FIBHxdooHf6BZnk/Q1feDh6yI5sVCf1YzyhpH5Bw==
X-Gm-Message-State: AOJu0YycSAWiM+yky3kb1R84G+LdxcWR7vcqOKZQhpzlj50JAN/dLXUX
	fFSURHxR3ygGr1yM+gNqpoRnylzh/MUugJbrd7HkMEofBjWHJ4SHyRzoyuzbUVQ4QR8VodF8Oba
	QoL2XbX2jypR3OlOlIt5d2lthoH9n81cmser8dIgvMY3Xvio4wx2itJdiGkAND6Mgte0ORDU=
X-Received: by 2002:a05:6512:3b87:b0:52e:7448:e137 with SMTP id 2adb3069b0e04-5321364ba0dmr418516e87.6.1723477215104;
        Mon, 12 Aug 2024 08:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHqTTm4i3yqoXwWcafjzWggvBAabRk27LvUse2Kqz/vx+0uXL/DvRLAZpeNUfxBVdHPwqM8g==
X-Received: by 2002:a05:6512:3b87:b0:52e:7448:e137 with SMTP id 2adb3069b0e04-5321364ba0dmr418486e87.6.1723477214491;
        Mon, 12 Aug 2024 08:40:14 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bd190ac8b9sm2235220a12.23.2024.08.12.08.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Aug 2024 08:40:13 -0700 (PDT)
Message-ID: <4efba0de-bf41-4e53-899a-19a27f565249@redhat.com>
Date: Mon, 12 Aug 2024 17:40:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Add SBAF test to IFS
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Jithu Joseph <jithu.joseph@intel.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Ashok Raj <ashok.raj@intel.com>,
 Tony Luck <tony.luck@intel.com>, linux-trace-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org,
 Shankar Ravi V <ravi.v.shankar@intel.com>, linux-kernel@vger.kernel.org
References: <20240801051814.1935149-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240801051814.1935149-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/1/24 7:18 AM, Kuppuswamy Sathyanarayanan wrote:
> This patch series adds support for Structural Based Functional Test at
> Field (SBAF) in the IFS driver. SBAF is a new type of testing that
> provides comprehensive core test coverage, complementing existing IFS
> tests like Scan at Field (SAF) and ArrayBist. Granite Rapids (GNR) is
> the first platform that supports SBAF.
> 
> SBAF mimics the manufacturing screening environment and leverages the
> same test suite. It makes use of Design For Test (DFT) observation
> sites and features to maximize coverage in minimum time.
> 
> Similar to the SAF test, SBAF isolates the core under test from the
> rest of the system during execution. Upon completion, the core
> seamlessly resets to its pre-test state and resumes normal operation.
> Any machine checks or hangs encountered during the test are confined to
> the isolated core, preventing disruption to the overall system. Like
> SAF test, the SBAF test is also divided into multiple batches, and each
> batch test can take hundreds of milliseconds (100-200 ms) to complete.
> If such a lengthy interruption is undesirable, it is recommended to
> relocate the time-sensitive applications to other cores for the
> duration of the test.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> 
> Patch Details:
> 
> Patch 1/4: Refactors MSR usage in IFS image loading code to share the
>            code between SBAF and SAF tests.
> Patch 2/4: Leverages SAF image loading logic and adds SBAF image loading support.
> Patch 3/4: Adds support for user to trigger SBAF test.
> Patch 4/4: Adds trace support for SBAF tests.
> 
> This series is originally authored by Jithu Joseph. I have made cleanups
> related to code reuse between the SBAF and SAF tests and resubmitting it for
> review.



> 
> Changes since v3:
>  * Rebased on top of v6.11-rc1
>  * Added missing error return value in validate_ifs_metadata().
> 
> Changes since v2:
>  * Added Reviewed-by tags from Ilpo and Steven.
>  * Fixed minor issues raised by Ilpo.
> 
> Changes since v1:
>  * Addressed trace struct hole issue (Steven)
>  * Fixed initialization issue in ifs_sbaf_test_core() (Ilpo)
> 
> Jithu Joseph (3):
>   platform/x86/intel/ifs: Add SBAF test image loading support
>   platform/x86/intel/ifs: Add SBAF test support
>   trace: platform/x86/intel/ifs: Add SBAF trace support
> 
> Kuppuswamy Sathyanarayanan (1):
>   platform/x86/intel/ifs: Refactor MSR usage in IFS test code
> 
>  arch/x86/include/asm/msr-index.h         |   2 +
>  drivers/platform/x86/intel/ifs/ifs.h     |  92 ++++++++-
>  include/trace/events/intel_ifs.h         |  27 +++
>  drivers/platform/x86/intel/ifs/core.c    |  33 ++++
>  drivers/platform/x86/intel/ifs/load.c    |  40 ++--
>  drivers/platform/x86/intel/ifs/runtest.c | 233 +++++++++++++++++++++++
>  6 files changed, 412 insertions(+), 15 deletions(-)
> 


