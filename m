Return-Path: <platform-driver-x86+bounces-3638-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 951588D57B1
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 May 2024 03:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B93421C235F1
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 May 2024 01:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D00613D;
	Fri, 31 May 2024 01:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b="t7LL0MZv";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X3q6euZd"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC2163C7;
	Fri, 31 May 2024 01:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717118390; cv=none; b=jPj8bH4wIEMF0ubQdklTI2zFOoaLPkZpBkjyzFXRr7IEjTjPAwZqsj6QF28IaAonSM+3cLKgd5EIUNhgkcLGS8iv8M0z9K+mkAnrtyKoSmzxOKOiT/ys5ebghbE6X+dWfaxXAk7/Mw8GaElOX5bk98ONrCfxsqnKGMxPcJa+PgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717118390; c=relaxed/simple;
	bh=e5/NKjsM5ULYOYhot/Kcrf0uXGGr7Q2ErMsxZ8AbhNg=;
	h=Date:From:Subject:To:Cc:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eSH09g6xHRB+UmglkbjgROtsciolwWNZuJpKBP7a1bIy5sU4QsjD49TVH/ctrn5dVi+9HOoGxRbtAgLcK7lBfIfTvz/uEkbug/mrPDBUn0i/IBNazILk2pXhmOGDI6Qv2+UlQnbM8CB2gzXOaKoP1PYteXhMf+gdrGkCGDFvJko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca; spf=pass smtp.mailfrom=lyndeno.ca; dkim=pass (2048-bit key) header.d=lyndeno.ca header.i=@lyndeno.ca header.b=t7LL0MZv; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X3q6euZd; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lyndeno.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lyndeno.ca
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 450861140183;
	Thu, 30 May 2024 21:19:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute7.internal (MEProxy); Thu, 30 May 2024 21:19:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lyndeno.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1717118387;
	 x=1717204787; bh=5yJmV879YPZ2+qzVIS5sOrVKm0uZoMEEXgLMCx1poD4=; b=
	t7LL0MZvW1jNfL47fgQk0BtOskjZFYY4xsj2o4QysAQA6CxHmsSn3Qp8sraA31Wm
	82rJTaX0BmsADgS4jjebsMOsW2oWyZc6z/mVYDpbTu6s0Ius6l2xryFtDdh1vERG
	/oE5MGMcI+n4dGqcxbQVEewkASakh0Lz/gsvRaSFg17gTX9gnCvUZQFD1qOOnt9G
	1PVQjYy5yKTb0UghisAqYAkjzATCz3Hu67degCdAeoPTNr1fN0xdHUlKxJ/VvP1s
	4KodTbTh2l2THRoWuDgMqi1YrH5HJMHw2SfuXjuzujL5X6YIS1CxigYb6tF88TY9
	HMsqi2h9bIvfyrvmLMSn2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1717118387; x=
	1717204787; bh=5yJmV879YPZ2+qzVIS5sOrVKm0uZoMEEXgLMCx1poD4=; b=X
	3q6euZdRcSJ9L82NWcjjmlvOUHNeTNGeUlCTiYlv+aYkSY1CgNmNKulQ1J42aKWT
	tfJnEoMkvCFWCeOLYrgddNoj5zQQzrkh91H/O6hk7Th+Xaioq/bJHnjjl0yRQXzA
	cYdHSOrnrtnJFiAGmRAPKG+Uum6/qcqj8cCZRNsw0VINH8cYkzMlD2DhH2sfqRVu
	x3XVbm/1J5ddIO/D5dk2jWm/gZ4Cuxh/m3m3WzrwnDVgu9H7oHo57ncXtsUlcm1+
	KVOISrZPxADh/7uI1Pw37iMsJWoVlFyNhlFc0A/oCzPTCMP+KWdfkhwY217VVy0s
	OCJEfh58wwBW0wfj4ps7w==
X-ME-Sender: <xms:siVZZjWxe6P1aqiXVIfF48_IZTo2a1YXZCvgrj-paahP-42B4K0KfA>
    <xme:siVZZrktsld1OtgJjDSqZJ_B94rytQkIHHROpI2xs1UTa9ZQSlZmpHuoxu6e3Qpxg
    7Z3QjRYypiB5H5_mRA>
X-ME-Received: <xmr:siVZZvYF3vdW9lRkyRnjAu68DMX79zJEgJIO1HShsHEpPyPUdtvJKQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekhedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhuffvvefkjghfofggtgfgsehtqhertdertddunecuhfhrohhmpefnhihn
    ughonhcuufgrnhgthhgvuceolhhsrghntghhvgeslhihnhguvghnohdrtggrqeenucggtf
    frrghtthgvrhhnpedtvdefvdetfeeggeejgeejvdevteejvdehhedtueeugfelhfeuieff
    ieehffetheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehlshgrnhgthhgvsehlhihnuggvnhhordgtrg
X-ME-Proxy: <xmx:siVZZuX5jhqfQLr1QqWzbt7Ah025Pmtag-r-O9UaKe1UB_LQ_wvb9g>
    <xmx:siVZZtnow_TRZRrhr1sWLuMDeLzqH5Jqsx_KdhWHMctQEXqs54PkUQ>
    <xmx:siVZZre2j5ECAOlqWuWgd_9gGuHKphodRk687MOR9eVQiQGsJ3KsYg>
    <xmx:siVZZnHHqq3CADkutlUm9FeNh6oaJrtPFQHanlupiWdcv-ckhDljdw>
    <xmx:syVZZtmVuUgtuHs-7GMhWRF36Cf_-lkiT-rQ7sIWkuBGknk4Wl3o7DAh>
Feedback-ID: i1719461a:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 May 2024 21:19:44 -0400 (EDT)
Date: Thu, 30 May 2024 19:19:36 -0600
From: Lyndon Sanche <lsanche@lyndeno.ca>
Subject: Re: [PATCH v8 3/3] platform/x86: dell-pc: Implement platform_profile
To: Ilpo =?iso-8859-1?q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: mario.limonciello@amd.com, pali@kernel.org, W_Armin@gmx.de,
	srinivas.pandruvada@linux.intel.com, lkp@intel.com, Hans de Goede
	<hdegoede@redhat.com>, Yijun.Shen@dell.com, Matthew Garrett
	<mjg59@srcf.ucam.org>, Vegard Nossum <vegard.nossum@oracle.com>, AceLan Kao
	<acelan.kao@canonical.com>, Heiner Kallweit <hkallweit1@gmail.com>, LKML
	<linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Message-Id: <O0TBES.JKXVC38VSDID@lyndeno.ca>
In-Reply-To: <db3191b5-2f42-5075-a493-dedb34e578ad@linux.intel.com>
References: <20240425172758.67831-1-lsanche@lyndeno.ca>
	<20240529174843.13226-1-lsanche@lyndeno.ca>
	<20240529174843.13226-4-lsanche@lyndeno.ca>
	<db3191b5-2f42-5075-a493-dedb34e578ad@linux.intel.com>
X-Mailer: geary/44.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable



On Thu, May 30 2024 at 11:39:27 AM +03:00:00, Ilpo J=E4rvinen=20
<ilpo.jarvinen@linux.intel.com> wrote:
> Thanks for the update. I've now applied this into review-ilpo branch.
>=20
> I reordered those headers into alphabetical order while applying. In
> future, when adding new headers, try adhere to the alphabetical order.
>=20
> --
>  i.

Thank you for taking the time to review. Also thank you for letting me=20
know about the header order, I will note that for next time.

Please let me know if you need anything else on my end.

Thank you,

Lyndon Sanche



