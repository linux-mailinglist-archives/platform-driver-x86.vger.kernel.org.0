Return-Path: <platform-driver-x86+bounces-867-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 616DE82707B
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 15:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B1E1C2181F
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 14:00:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1036B4652E;
	Mon,  8 Jan 2024 14:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FDINmzAj"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE9C4644A
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 14:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704722411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C4Jpu1x2ehrCuoX9MkyxWci4WQ2RVknzin0m1bbF2hU=;
	b=FDINmzAj6TZ5JgNWbljZEbSCtcnKV6bIDsxA3OBckHvDP7wwet8exdjnHapE2g1NXBj/5N
	zCyePO6n/GtYdFcCNVprHSSopGMrdceJ1qh1KwtqLIBzblf/ZJT/IYhCEgS8+Yt8LZukiQ
	s2l49hh2irQrAxk9ZaZzzK0ZDd3h+t0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-6WAd9RToMK-PCzoipAT9tQ-1; Mon, 08 Jan 2024 09:00:10 -0500
X-MC-Unique: 6WAd9RToMK-PCzoipAT9tQ-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a28102bc0f1so89749266b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Jan 2024 06:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704722409; x=1705327209;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4Jpu1x2ehrCuoX9MkyxWci4WQ2RVknzin0m1bbF2hU=;
        b=eMY0JBuNZVE9ZX4DWjyTN34Tc9BNtZQckn8Njn/DUPyWIamnHaVeXAGIi3UPGk3WDF
         x1mkftvpNLHEqKYTqeBSN/btRN/ftr9SFDe8CeqmuRokw2iySRtRghzb44m1VH1Gr0KH
         Du9Xrpefy9P1NgED27pnAUj2jJ6Gu+lDfmG0FPOzm0oCoZlUzAWcL+DxxzUmRCNLy8qq
         0eWftY9mo6D3lOd8Abkw1wIO8REEh4RtRZs0wmccSEsfOyeMwKGuDbQagGc/Xz3JnMj8
         RDDFxO5u3MsNZWneOGQrbCp23iuZmPuJxefJQvPZbDCUlyvOSAsIqswF6Q6ePmTCQ/Uf
         yy3w==
X-Gm-Message-State: AOJu0YzQchh6QGt1FBTYWmg0y14TFg/271pffDwJUFbdF3wNC9E4r5DD
	iSFSneANmYSfnViTxY8yNRiCU5XOMs3RvddUktM15GaA3wfxLJ5hYz9xMeC2c7dIGkM0+XZ/5S0
	laSRUb/xNv9UseLJ639WAJHaoHkhGVHJGr8tApYaGfg==
X-Received: by 2002:a17:907:7ba8:b0:a23:5684:6106 with SMTP id ne40-20020a1709077ba800b00a2356846106mr2133706ejc.89.1704722408962;
        Mon, 08 Jan 2024 06:00:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4No11lPmZnFvtmK2lxp+FCee/JUuvx1qPGlAV9y5g0OMkS4X3iFzu6Luyujgjn/ClJgpiqQ==
X-Received: by 2002:a17:907:7ba8:b0:a23:5684:6106 with SMTP id ne40-20020a1709077ba800b00a2356846106mr2133695ejc.89.1704722408612;
        Mon, 08 Jan 2024 06:00:08 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p23-20020a170906785700b00a2b10e20292sm166122ejm.215.2024.01.08.06.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 06:00:07 -0800 (PST)
Message-ID: <6a56b575-6f08-45bc-801c-54ca01384a20@redhat.com>
Date: Mon, 8 Jan 2024 15:00:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] platform/x86: wmi: Event handling fixes
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240103192707.115512-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240103192707.115512-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 1/3/24 20:27, Armin Wolf wrote:
> This patch series contains various fixes for the handling of
> WMI events. The first patch fixes an issue where the WMI core
> would return an error even when a legacy WMI notify handler
> was installed successfully.
> 
> The second patch cleans up the last remains of
> commit 58f6425eb92f ("WMI: Cater for multiple events with same GUID"),
> which is useless now that legacy WMI handlers cannot see duplicated
> GUIDS. This however might highlight a potential problem:
> 
> In the email thread concerning aforementioned commit, a (now legacy)
> WMI driver was mentioned which depended on this functionality.
> I believe this driver is the dell-wmi-aio driver, so this driver is
> likely already broken for some time and should be converted to the
> new bus-based interface.
> 
> The next patch decouples the legacy WMI notify handlers from the
> wmi_block_list, while the last patch fixes a race condition when a
> notify callback is called by the WMI core.
> 
> All patches have been tested on a Dell Inspiron 3505 and a
> Acer Aspire E1-731.

Thank you for your patch series, I've applied this series to
my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this series in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> Armin Wolf (4):
>   platform/x86: wmi: Fix error handling in legacy WMI notify handler
>     functions
>   platform/x86: wmi: Return immediately if an suitable WMI event is
>     found
>   platform/x86: wmi: Decouple legacy WMI notify handlers from
>     wmi_block_list
>   platform/x86: wmi: Fix notify callback locking
> 
>  drivers/platform/x86/wmi.c | 179 +++++++++++++++++++++++--------------
>  1 file changed, 111 insertions(+), 68 deletions(-)
> 
> --
> 2.39.2
> 


