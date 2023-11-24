Return-Path: <platform-driver-x86+bounces-55-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8627F7987
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 17:40:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 22845B20EBE
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Nov 2023 16:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F331935EFB;
	Fri, 24 Nov 2023 16:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dividebyzero.it header.i=@dividebyzero.it header.b="cigupOXD"
X-Original-To: platform-driver-x86@vger.kernel.org
X-Greylist: delayed 1980 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 24 Nov 2023 08:40:14 PST
Received: from ar2.dbzero.it (unknown [IPv6:2a00:6d41:10:195b::1])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D8281FF1;
	Fri, 24 Nov 2023 08:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=dividebyzero.it; s=20160415; h=Message-ID:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	 bh=/1PJqNlvUrXMhjcRuqsGR/kEthoX6oT6N4TqHJqMfZ4=; b=cigupOXD6g1ALihWD0X1EyXGA
	0u2uRLi7Qq1CQz8moCG0+HaMJcZxajSuxeHMQRBiwG/LLa3+uxtLpHpbLM3rOH67EYPEPPrSCp+1d
	Movy2Nx7rnX1xeP9naX2hiXT78kSF4SQISq5GgicEuioHqparr/DbEFPRsJ/ojAIiPGFs=;
Received:  by ar2.dbzero.it with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(Authenticated user: juri@dividebyzero.it)
	(envelope-from <juri@dividebyzero.it>)
	id 1r6Yhc-00088M-V4; Fri, 24 Nov 2023 17:06:48 +0100
From: Juri Vitali <juri@dividebyzero.it>
To: James John <me@donjajo.com>, Corentin Chary <corentin.chary@gmail.com>,
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-kernel@vger.kernel.org
Subject:
 Re: PROBLEM: asus_nb_wmi sends KEY_BRIGHTNESSDOWN on pressing CAPS Lock and
 PrntScrn on Zenbook S 13 UX5304VA
Date: Fri, 24 Nov 2023 16:54:36 +0100
In-Reply-To: <024c4ad4-1a73-8c24-5e6f-f8c9f2f7b98f@redhat.com>
References:
 <a2c441fe-457e-44cf-a146-0ecd86b037cf@donjajo.com>
 <39b5f902-3a7e-fc04-254e-776bf61f57e2@redhat.com>
 <024c4ad4-1a73-8c24-5e6f-f8c9f2f7b98f@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Message-ID: <1884918.tdWV9SEqCh@dividebyzero.it>
X-Original-Message-ID: <1884918.tdWV9SEqCh@arch-zenbook>

Hi,
Unfortunately those patches have broken the backlight reporting on older 
laptops, which do rely on the old mechanism.

For instance, on my Asus UX32A/VD when pressing the backlight up/down button 
the backlight changes accordingly, but the event is not caught by the system 
(more precisely, dmesg is complaining of unknown key codes):

> [ 3167.842213] asus_wmi: Unknown key code 0x29
> [ 3168.105096] asus_wmi: Unknown key code 0x28
> [ 3168.142526] asus_wmi: Unknown key code 0x27
> [ 3168.178860] asus_wmi: Unknown key code 0x26
> [ 3168.216027] asus_wmi: Unknown key code 0x25
> [ 3168.256511] asus_wmi: Unknown key code 0x24
> [ 3168.292907] asus_wmi: Unknown key code 0x23
> [ 3168.329704] asus_wmi: Unknown key code 0x22
> [ 3168.366554] asus_wmi: Unknown key code 0x21
> [ 3168.406681] asus_wmi: Unknown key code 0x20
> [ 3168.443330] asus_wmi: Unknown key code 0x20
> [ 3168.480900] asus_wmi: Unknown key code 0x20
> [ 3168.516326] asus_wmi: Unknown key code 0x20
> [ 3168.554006] asus_wmi: Unknown key code 0x20
> [ 3168.593320] asus_wmi: Unknown key code 0x20
> [ 3168.630108] asus_wmi: Unknown key code 0x20
> [ 3168.670110] asus_wmi: Unknown key code 0x20
> [ 3168.943217] asus_wmi: Unknown key code 0x11
> [ 3169.203349] asus_wmi: Unknown key code 0x12
> [ 3169.243239] asus_wmi: Unknown key code 0x13
> [ 3169.279881] asus_wmi: Unknown key code 0x14
> [ 3169.316311] asus_wmi: Unknown key code 0x15
> [ 3169.352887] asus_wmi: Unknown key code 0x16
> [ 3169.392806] asus_wmi: Unknown key code 0x17
> [ 3169.429301] asus_wmi: Unknown key code 0x18
> [ 3169.465843] asus_wmi: Unknown key code 0x19
> [ 3169.502404] asus_wmi: Unknown key code 0x1a
> [ 3169.542308] asus_wmi: Unknown key code 0x1a
> [ 3169.578938] asus_wmi: Unknown key code 0x1a
> [ 3169.615506] asus_wmi: Unknown key code 0x1a
> [ 3169.652002] asus_wmi: Unknown key code 0x1a
> [ 3169.692280] asus_wmi: Unknown key code 0x1a

In this case it seems that the backlight-down codes go from 0x20 to 0x29 while 
the -up from 0x11 to 0x1a, so assuming they are not clamped somewhere else 
they should not conflict with the ones used on newer models.

By the way, I only found those codes to be reported by asus-wmi, while other 
inputs remain silent while pressing those keys.

Let me know if I can help with some logs or anything.

Regards,

Juri




