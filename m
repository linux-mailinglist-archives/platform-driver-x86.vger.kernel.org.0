Return-Path: <platform-driver-x86+bounces-1181-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD108453D8
	for <lists+platform-driver-x86@lfdr.de>; Thu,  1 Feb 2024 10:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67569283DE5
	for <lists+platform-driver-x86@lfdr.de>; Thu,  1 Feb 2024 09:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EF915B10E;
	Thu,  1 Feb 2024 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="TSr9Udjz"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3657A15AAB9
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Feb 2024 09:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706779601; cv=none; b=nJn5thO7r4PeluNaj8k4Oz3cMBLau+xS9D9rFuZusP5KesX19WJtDHuUnkiUt4rrPvMyt1NxZdW6GbV0SwGQcDAkF7mF2DM9VPckHrDfv6Wx7dmAT4p3OjnQiejxuoQGt+xXMN4y6iqSMGP2rFemKj1IFvussyeoXJeMYhxIP4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706779601; c=relaxed/simple;
	bh=Y8Jdx7/2I9eY+OOZmGYIEvoOpC8kaOBC/weV3+AMr9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZVnDzUod5Bv4jRX1/syeCpBIDSQTvtV6wRvADgicHaTIkmTks1VnXMZswFpXki069JwYONd/bYS2XPlVLOcIWANuKerLSf+TxiUKQcDxPh/nni/eKh8bsEw2HknO1CNj667P7PYn3UGDBAW9Dj38G1QyPch8KlaCO1CixXrnnGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=TSr9Udjz; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5112a04c7acso1014662e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Feb 2024 01:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1706779596; x=1707384396; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4j/OGysh1p00GXnu3jrZ8vayx12mGduG1dVSS/BJps=;
        b=TSr9UdjzL3/uShUlh5Q9Pm1eqnxQKOJ5mvZYFxXI7Y3Bg8Gbf4fji5Bv0FEgQVbvOC
         ZUtnwe2jfr6ylu39XGcDktVUlXp2yALByEtM6VLj9xR8f6vhx2j6rQPppk+xzh116B3a
         c0eyhbjSbTOwcDYExWBErjXjHIUQpo237iY8lNGIyN4JZQWBDhvm5+kC/6aDvnQ2uIjG
         bjGKJCif/2PzT3ahDNHlvel9xVH7r8Hg1A75hwV/xI4tKGlUrZ+EyaBt4NZnheAlrmCO
         FZO3owzvbksb6Ddw5SZaWR/pSX7t0kws/89pNZ/AbAiTs72ligbT6qTgJjvKPNkfrX3h
         jLyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706779596; x=1707384396;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q4j/OGysh1p00GXnu3jrZ8vayx12mGduG1dVSS/BJps=;
        b=VXto3roBl1zjNDvcHEO90PWCwBS5ssRoSaBkFu4jhSq5ZEyencflHupYlqcJMZJAyG
         jozOxetHiD6L13YyQW9GFPK3EVzkynNhpihfF91rCQ1ZVAwDQIMVwhBnkS5h0esnNBnd
         yCunZSnSYZ4vqk9urSOV71sSA8yKhDYbkMnMKGl8SoJQHTJiwHrcac4fZKh2TVpUvdKA
         erh73fOYApajAt9UwwyPINLL+YtsrdzJXzU6FEFHfeAdObSOx0NM5MXQwGj9Wth5G/cm
         h23WyaT8CMasCI3MzkHt46TQw2OVcjrc+qyN8liwptOyjikCXtvGJYVjq2nLzbL6wNEb
         ey2Q==
X-Gm-Message-State: AOJu0YxMZG5188Zgo5zQg2a6rVAOAytOQWXFp5AxVP0g00CW6RbEtmvV
	0Be0jAAUB8XqxvLxQoc0q/uI48qrJ+upNQr7cV2T1U9NvDkNPTwzfcP9/CBSdME=
X-Google-Smtp-Source: AGHT+IHkZoXz7mP0kGx60Jb5V+6DneyBwVY7J5CFTS4qFQs/LhONi8vuA4PHjnbxrDzRDBiIBcgzPg==
X-Received: by 2002:ac2:424f:0:b0:50f:1c90:d3d5 with SMTP id m15-20020ac2424f000000b0050f1c90d3d5mr1333532lfl.24.1706779596042;
        Thu, 01 Feb 2024 01:26:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWOtaVz8GM+WZvodVDKtJwSMAAPbO63TGVulAslgxR+dUVpDDXHlRASNIGqIiwCX5r+AkJvjQ9jcDZUYk+NBvOwBBn4urasN5u1nERxh8t7DM5R41WFIVhWWGl0DXOw8f5obg5IU05Mrty9pd+ldnJmLHlHc19PtPGmojDjQ2hxNTayxSQ3WNSYsWczro+NAMn/Zimg7yxKDA409qFsmdopS3mwK6OetTnl0vg0kMCUA/hCDvzq0k944bf1TEomKW8WPmR345ZNYAtibOWcxQ==
Received: from localhost ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id l13-20020a05600c4f0d00b0040efbdd2376sm3847555wmq.41.2024.02.01.01.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 01:26:35 -0800 (PST)
Date: Thu, 1 Feb 2024 10:26:32 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: "David E. Box" <david.e.box@linux.intel.com>
Cc: netdev@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/8] platform/x86/intel/sdsi: Add netlink SPDM transport
Message-ID: <ZbtjyOBHzVKXu_4H@nanopsycho>
References: <20240201010747.471141-1-david.e.box@linux.intel.com>
 <20240201010747.471141-5-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201010747.471141-5-david.e.box@linux.intel.com>

Thu, Feb 01, 2024 at 02:07:43AM CET, david.e.box@linux.intel.com wrote:

[...]


>+      -
>+        name: spdm-req
>+        type: binary
>+      -
>+        name: spdm-rsp
>+        type: binary

I don't understand the need to use netlink for this. Basically what you
do is you just use it to pass binary blobs to and from FW.
Advantages, like well-defined attributes, notifications etc, for which
it makes sense to use Netlink are not utilized at all.
Also, I don't thing it is good idea to have hw-driver-specific genl
family. I'm not aware of anything like that so far. Leave netlink
for use of generic and abstracted APIs.

Can't you just have a simple misc device for this?

Thanks.

>+      -
>+        name: spdm-rsp-size
>+        type: u32
>+      -
>+        name: spdm-req-size
>+        type: u32
>+  -

[...]

