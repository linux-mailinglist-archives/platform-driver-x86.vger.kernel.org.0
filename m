Return-Path: <platform-driver-x86+bounces-14896-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E31CC02E96
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Oct 2025 20:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CAAB44F768B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Oct 2025 18:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D98D234B41E;
	Thu, 23 Oct 2025 18:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSgrjqr/"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0022434B19C
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 18:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761243913; cv=none; b=fuoFMGfTfuxmHLdoD0phZ8udirS5BiT06i2NWJ0NyPAH/qjPNvQTHg3GIm4PePkEDG2g823CPD2GbfXkUxvyCMsnmZqg9e3OieMo5BPTMLNpL0U+aZ9bOu895Cdte9UIlliFtkQ60Ia9hr8U4JtQluPd4rWaLMwgJu1hWKs2VlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761243913; c=relaxed/simple;
	bh=OW9xtBE7QkQIpQ9a1bsU/na/56nDrQ0HQq9DCYmZMlo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0cPMz5m8tYhvbwDfauN62sXdAgVgg/wMu62oe63cpMcX6OQ9jlaSJqo6KmqCJ950KgTrKsRvqE+Mu19QiO8BDtV9UHdEaghdMsrwVGii9OyGojEBwath3erTwmeK6ZbSPWr9c03OctFRnvUaWNoxqrQ7DJ5Udg8mdYDVm16xbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSgrjqr/; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-591c74fd958so1298214e87.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Oct 2025 11:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761243910; x=1761848710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJdZsaxvrfD9mBzacOGMyfPJ9ejMpsnX7T8c3nx39O8=;
        b=lSgrjqr/FauM9qp6rax+CaoXdIQYFbK/KmpV+K3q96R8w5qbCVI/ExNalL2eeGgVGH
         jXVyoC0lh4YLPJ9MztM9J+kcmNmO1eVmiSC1fxH5KnipsyF8gqT0OkyXwVrCD9iynsOy
         zgx1R/i3Us6OJFBHHgtrmi0H7mEb7wDC/ctr1UwW4grYhbRLV05E9cC4gMsbgkNBbByz
         J0wJhnA/B/Xg4ho7qj/9px8lf+2LznYGTWXtwDrClkvGut1s8gUeqbcL4lcxNAYb7Fxj
         d9fL8KGDUKfh/bFfNF61pmgIO4i8/gz4IBgF+dHz+n2oWcK78oXE43VubQgo6HH0+Gvf
         f5ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761243910; x=1761848710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJdZsaxvrfD9mBzacOGMyfPJ9ejMpsnX7T8c3nx39O8=;
        b=ZoHo0oArMiMZY0GPfBf6XPiMjRavcrCZhjz/8bm2b9kPRoA0dZ1rt3Fb2HJdBzeurp
         VStmKl5R6eBupjeBQxfzpBd/lnzMGMqHz7jcQ8AzFJUvNBlJezCWPmUYFiOxu0T17hLt
         w2xVMCotzqsU/IXIWrpqnMQgBoSuc3ES5GP0OLSQB3F/Nux2wl63JDySF1MziSoiWj1z
         bWf90KzwNneihlc9JEHjv/iicqF6HKMBXnUaSryTKYcdL3y92X8NMcA+27KkjlU3FMwn
         aNNB05Xrc7ns5J3tgLAJEmszP+MruDdTMt1DuDTI7Ej+5jGeRZundsQIdFmxj601BP4T
         uEPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhYUEsET7i0T9Y92CHChXdJSiSeM7JB7X/i83Gsdf+js8aoiBDQuqHMWPltCjZMJhBtD02RcTLkWfsn3B62TRY0CPO@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ4L5wLfyWR2faA8r6l339SrQC8feBF/8n2+UMT9V/lSHXluMo
	8o+4FC5MMa1Ddzt8aHyPkrzFbfcXmLMQKNM5TQjeihRLj+WBu0TbWK7O
X-Gm-Gg: ASbGncs96wIka/Z6IK5b8bT8qKOfYGPisazGjp1Syqulll8muzV8hEbKzPkvWy2DNb0
	NWQPxgvD4p98htkBbiYJOPh1CXrhGFK1t/AQ8cJGK5NEKbRnUmxj21Qp2Wf4nS4l+LyH5ie5yPG
	tmEuLKSDWgWY8K/JAc+k/ZBJg/+mrSUW55gD2qXjTVT52mGBt436g6fYNFzijCKO130eR15NvTm
	Z6sHB9Yh2wO+TqCILnMNbZEeltLkIIq2mrAfn41e2kscEG0UkrCeRV6Eszork6JqPnUF4y6inNR
	2FvNNbLgQoXVpqrPdPr3vw+TP5Z+GqKERiLyjy4kXHIlLJGilPfnzuSQuGLiSWnyaWz6vWLvtmJ
	WWZ9y20Bdl4GpfPB2nkT9gVjFPS9nYtn3tyyAys2ykOhFcoIvcVL+gJwRHMzEX36n4WeGFg96cb
	I2oATx5OD8h+Ekh9wMOggvvXU84/65XlLqoGw7CA==
X-Google-Smtp-Source: AGHT+IE0DFfcemUtSg6UDp4QQqO5coJH36uQh9JRQkz1hQEF8PQOPqrf1u6yvwyTkEAqPB81Cen56A==
X-Received: by 2002:a05:6512:6d1:b0:592:f573:65d3 with SMTP id 2adb3069b0e04-592f5736dfamr993145e87.1.1761243909793;
        Thu, 23 Oct 2025 11:25:09 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4cd12e9sm919045e87.32.2025.10.23.11.25.07
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 23 Oct 2025 11:25:09 -0700 (PDT)
Date: Thu, 23 Oct 2025 20:25:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Shyam-sundar.S-k@amd.com, bhelgaas@google.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux-edac@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux@roeck-us.net, mario.limonciello@amd.com,
 naveenkrishna.chatradhi@amd.com, platform-driver-x86@vger.kernel.org,
 suma.hegde@amd.com, tony.luck@intel.com, x86@kernel.org
Subject: Re: [PATCH v3 06/12] x86/amd_nb: Use topology info to get AMD node
 count
Message-ID: <20251023202503.72987338.michal.pecio@gmail.com>
In-Reply-To: <20251023160906.GA730672@yaz-khff2.amd.com>
References: <20250107222847.3300430-7-yazen.ghannam@amd.com>
	<20251022011610.60d0ba6e.michal.pecio@gmail.com>
	<20251022133901.GB7243@yaz-khff2.amd.com>
	<20251022173831.671843f4.michal.pecio@gmail.com>
	<20251022160904.GA174761@yaz-khff2.amd.com>
	<20251022181856.0e3cfc92.michal.pecio@gmail.com>
	<20251023135935.GA619807@yaz-khff2.amd.com>
	<20251023170107.0cc70bad.michal.pecio@gmail.com>
	<20251023160906.GA730672@yaz-khff2.amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Oct 2025 12:09:06 -0400, Yazen Ghannam wrote:
> The kernel seems to think there are 6 CPUs on your system:
> 
> [    0.072059] CPU topo: Allowing 4 present CPUs plus 2 hotplug CPUs

I wonder if this code doesn't break systems which actually support
hotplug, when some sockets aren't populated at boot?


	amd_northbridges.num = amd_num_nodes();

This count apparently includes potential hotplug nodes.

	for (i = 0; i < amd_northbridges.num; i++) {
		node_to_amd_nb(i)->misc = amd_node_get_func(i, 3);

This is a wrapper around pci_get_domain_bus_and_slot(). Isn't this PCI
device part of CPU "uncore" and absent until a CPU is hotplugged?

		/*
		 * Each Northbridge must have a 'misc' device.
		 * If not, then uninitialize everything.
		 */
		if (!node_to_amd_nb(i)->misc) {

And if it's absent, all previously found northbridges are ignored.
BTW, kerneldoc seems to suggest pci_dev_put() should be here?

			amd_northbridges.num = 0;
			kfree(nb);
			return -ENODEV;
		}

		node_to_amd_nb(i)->link = amd_node_get_func(i, 4);
	}

Regards,
Michal

