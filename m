Return-Path: <platform-driver-x86+bounces-5177-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA1968645
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2024 13:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3BF11C21A28
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Sep 2024 11:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4134187550;
	Mon,  2 Sep 2024 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZW3K45ER"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB504185B5B
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Sep 2024 11:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725276759; cv=none; b=geU0RC7+tUlbPck0kNLvmFte66IUr8RWTA/hkh5qvq64oQ4OI7qKBqQCNJSGTMbVVq5fpxTC/jBRkf+P7BoQfb+o91asnF/M0aAycjRT6LcAXFdvGi1Rz0zhXqvqwwBCk5oSk/lpMOZ6EN72j1sj1CmiVplJ+dOZ9amv4QTaTCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725276759; c=relaxed/simple;
	bh=ORpmli+FVv2i+RHT+F99q3bG19xmjOpVDpiQ0Io+Cg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tufMv9zCVG5eJKnTLuaKLXXXiXnvF7XkC7+F+XimG6KMhfx96s2sbPxS0IYS9eLO1W5kX1ESx3iAVeFuuUg0PdIIDVX6B6U2nnztiYabwYVWaThybLnuw6/1gy/XRvZcFvU6vR0QIl/gxP7OD9mmGs8H9OfIvA8yTiS8uBT9a0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZW3K45ER; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1725276755;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7XiR/49Pk1yBWAqQwAojDlW2jogofRu0IdtrIYLHINU=;
	b=ZW3K45ERAzPW8ZOay348VzJq+K9bh1LdGsqw/LiuDm4IJPZ0FcGozs0VaITko11g/XjVLA
	P7Fw9dSJ+W85WPPfnTVFfXbnq8pqRoNPlXwbCMjs/9jnTs3lL4LdW6HJcRjQMorJaCaJjg
	C7WlYUWFD3K4Rv/0umeAcnaIxf9bMUY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-Igorvez7OkCdi6pEXJYnxw-1; Mon, 02 Sep 2024 07:32:34 -0400
X-MC-Unique: Igorvez7OkCdi6pEXJYnxw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-374c9b0daf3so610864f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Sep 2024 04:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725276753; x=1725881553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XiR/49Pk1yBWAqQwAojDlW2jogofRu0IdtrIYLHINU=;
        b=RXh1/rNZZpnvS1n/leY/qAMKepgw4g3fIfnt9FOD/5Ho7nZzk0wylOG15Z16uNOV5L
         ZRQdnnk6p9pFwEL2u0WKK65frQLdBtCWcNnIl3HgH3Uq9DzhOm1CusLJW5OSGaJPXfth
         9XnXhDseCNH0YwEc+3U4muj669SzYRQPH6vlaXa0pKTi3O03W+oEDLB6aWZWFXQYkQER
         /KYstjQu+0P9vI7nuQRi1WwHYarOqACJM/wCv/r8vZqPgn7RQg+o7InfGn5Uc8hgtvpX
         ilOYG02P/UNpo22Qsx51Po85zk16dLQQdmI+bwVLES6l6rSMrgHdr6DxA4hVEqVJO+M8
         MbAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRrBzfgLzefG6jvuLx+Zr7oCLtLOtfeYP8VqSDfPgxgfJvOudIJvA7omw5MTBHwDtMt8ROM6p3dOHZ3fXwAZ4NuKgl@vger.kernel.org
X-Gm-Message-State: AOJu0YxprzwGAlzleyJg/8gFqOg4BfUV47fswRQsGkzoCPGqvgNBP/wz
	UTcBLs/MQPODyPlc6X6ZycF+flW5bcYsTUfgFXyNmssemiEINTaYL/GYXoGgDW8m7gdudQXAYRA
	gBvD84khJmZmk8xaPK6lmxMgOkDv7IyHzV2MdIUriCh0Gu5Y8s0kcVULM7rsZelMxyQ7OX2U=
X-Received: by 2002:adf:fb11:0:b0:371:8845:a3af with SMTP id ffacd0b85a97d-3749b57f2f1mr8821974f8f.39.1725276753553;
        Mon, 02 Sep 2024 04:32:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSIAleFibg0AjuBBMWFVZJrhOx02h+A1epo6llXeIA5ANk4lTGumX8cxBM2JVgfsN6Db7o8Q==
X-Received: by 2002:adf:fb11:0:b0:371:8845:a3af with SMTP id ffacd0b85a97d-3749b57f2f1mr8821943f8f.39.1725276752965;
        Mon, 02 Sep 2024 04:32:32 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8989230a9dsm540663966b.224.2024.09.02.04.32.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 04:32:32 -0700 (PDT)
Message-ID: <5882a3b1-f99a-4cd4-8eab-42eefdc18eba@redhat.com>
Date: Mon, 2 Sep 2024 13:32:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe()
 usage
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: oe-kbuild@lists.linux.dev, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Scally <djrscally@gmail.com>
References: <20240822130722.1261891-3-andriy.shevchenko@linux.intel.com>
 <20dd56f0-78ea-4255-86ac-32151160b83d@stanley.mountain>
 <ZtWQzwvo7f0QfeCI@smile.fi.intel.com>
 <6be0acdb-6b4a-4330-929a-2e319075b3c6@stanley.mountain>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <6be0acdb-6b4a-4330-929a-2e319075b3c6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/2/24 1:23 PM, Dan Carpenter wrote:
> On Mon, Sep 02, 2024 at 01:17:51PM +0300, Andy Shevchenko wrote:
>> On Sat, Aug 31, 2024 at 11:31:53AM +0300, Dan Carpenter wrote:
>>> Hi Andy,
>>>
>>> kernel test robot noticed the following build warnings:
>>>
>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>
>>> url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/driver-core-Ignore-0-in-dev_err_probe/20240826-113856
>>> base:   driver-core/driver-core-testing
>>> patch link:    https://lore.kernel.org/r/20240822130722.1261891-3-andriy.shevchenko%40linux.intel.com
>>> patch subject: [PATCH v2 2/4] platform/x86: int3472: Simplify dev_err_probe() usage
>>> config: i386-randconfig-141-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310807.sNPe5Mr2-lkp@intel.com/config)
>>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>>>
>>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>>> the same patch/commit), kindly add following tags
>>> | Reported-by: kernel test robot <lkp@intel.com>
>>> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> | Closes: https://lore.kernel.org/r/202408310807.sNPe5Mr2-lkp@intel.com/
>>>
>>> smatch warnings:
>>> drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() error: uninitialized symbol 'err_msg'.
>>> drivers/platform/x86/intel/int3472/discrete.c:292 skl_int3472_handle_gpio_resources() warn: passing zero to 'dev_err_probe'
>>
>> Okay, I might agree on the err_msg, which is good to have to be passed anyway.
>> In such a case it might be good to have a dev_dbg() in the dev_err_probe() to
>> say that it is likely a bug in the code.
>>
>> Would you accept that approach?
> 
> ret is 1.  We have to revert this patch.

Note this was never applied, so no need to revert.

I'll apply patch 3/4 when I get around to it.

If some agreement is reached on patch 1/2 the new version of those can
be applied later.

Regards,

Hans


