Return-Path: <platform-driver-x86+bounces-4374-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 591A79317D2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2024 17:45:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E20D7B21BD5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2024 15:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1B518FC72;
	Mon, 15 Jul 2024 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dEI5idEK"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DF718C165
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 15:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721058299; cv=none; b=WiiaK1VFQN/csPhM8Nqw6XPUG9ctqtEClwFuxS9V1Wkn2lvIxNSvHSaamZXdIMWSZtVkcTCARvO+DoWA/Yg5XaXQW+7I3UeYexBaqpe9s8fRUdDeFBVqu+Jzcep/DhAthfkkPadxuYjSaXmD0qhePQewMV729XLlSPK5bG+1QgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721058299; c=relaxed/simple;
	bh=V4i9Y72ygbi3jOnQ26pocIAnFEUoTLTrmCCoMTUYFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NSmQNIkF2KvdEdZvwSMympMnf50cIK3MMW6TGGeXG58Egw5ysIyob+fq7FbQmgganuE4JYkVIjrMWD7SDw3hRnNXSdaRJ50+SibiO7fyxAXCtyKi2lO5BSiZWLaE8SmmSn94sZIVv2d6DAuI17wzNRmdJH1wHlwBjZr3eO2fSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dEI5idEK; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-70448cae1e0so2542022a34.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2024 08:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721058295; x=1721663095; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pAuoAPVtDn5NEi6WB4DvRUg0IfWdqRt5barySy1Fzh0=;
        b=dEI5idEKVQSrXxSqT3IIadVd4yeZKCjkmZ8ZvXI1ap+Hjs7dr9jRnKVxvkXJcV5G2m
         duLplIlGGEqrRX2QrjRdfy++D+/0QIjE9+YCEOUukW3nan22VlFTxhEp5iJKXl0kWAXR
         6U2wDzrHX4uY2/Ie4f7qvk1AXGN1y96SuofHSSkN4C1QcyCWCeFYK0PkhAKEHeSokKMd
         aNaTMrfa2UJ7ulPqJS2cyXlyrj+5tXCFc92AtWEG7d5cgA6nhRwO7l1k5rBfaVFI3soj
         Y/TVEdXVQ4QTbDJBNVSIquQNlJhIHVVe92inZ+yvZWOs3FIXxj2VaSs9nWRqrqIM0AFq
         ac+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721058295; x=1721663095;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pAuoAPVtDn5NEi6WB4DvRUg0IfWdqRt5barySy1Fzh0=;
        b=Rw3FatZmlxNi+uYbMg02IJ5vXUMbaiQv4UDgmQBe6vkKE46XmZ9E7xPKkLRQFWzpvn
         EdzPpAyr5mvEiKaPcRLQZM9585bpq8uqAjdFg8kNPAZ477Moz+XuSltACswVkJ87ojbV
         wWn9OJdFA98bUDaiCN5JZZotDFqA/68v87cyvlOkItUutAzM2BjzdeifWD4wrva00eNe
         t37vKAnGu9WqRpaj/FidWOjRwdBA/7cLIkR2weV7rTwT/xLUtym9fsesImFTCRGVqX3C
         ZYzI17zhJbviGDqjys5aRfY9QUvbvxyp+DDwx51uR1a+IYjBXQPIrhRwHhVk5fbJ+PKr
         0KJg==
X-Forwarded-Encrypted: i=1; AJvYcCULGua3UjfgTdSYVys69hbSgUefRK/oWnnC/HdqgUchinbiss+jYEF4ycCmm8pw8w2TKkGCsbfPekAmW7Sjc+4iuhQSQt3PoS3rpglbsp086GoRYQ==
X-Gm-Message-State: AOJu0YzPdNxV7oO2OTQCz311w7ZrTycYKXejVoa9osU2/Idiks10QEd/
	osfRPANCRluy3oatuUrBHPu/RJGKBhYlJc3hwqW/9yIvIt5q4uu4L4BIo2y+ZEA=
X-Google-Smtp-Source: AGHT+IHv5RoP8rbG/BgCJi5p+sb+fDQFciWX94XX4Trb6B1Dt48Wwt2QAbCP9vRkfv0v5DCxmtw61w==
X-Received: by 2002:a05:6830:280c:b0:703:6076:a47 with SMTP id 46e09a7af769-708d83927e7mr27584a34.23.1721058293674;
        Mon, 15 Jul 2024 08:44:53 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:358f:3413:c118:4021])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-708c0c53e58sm956120a34.16.2024.07.15.08.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 08:44:53 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:44:51 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Tero Kristo <tero.kristo@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] platform/x86/intel/tpmi/plr: Uninitialized variable in
 plr_print_bits()
Message-ID: <428d4e27-6970-45d8-a7b9-7bf6af95c91a@suswa.mountain>
References: <8ccfab0c-3c11-4168-a383-19895ae60022@stanley.mountain>
 <1467f140-c035-cb2a-20d9-b5910971cb56@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1467f140-c035-cb2a-20d9-b5910971cb56@linux.intel.com>

On Mon, Jul 15, 2024 at 12:25:21PM +0300, Ilpo J�rvinen wrote:
> On Fri, 12 Jul 2024, Dan Carpenter wrote:
> 
> > Initialize the "str" pointer to NULL.  There is a test later for if "str"
> > is NULL but in the original code it was either valid or uninitialized.
> > 
> > Fixes: 9e9397a41b7b ("platform/x86/intel/tpmi/plr: Add support for the plr mailbox")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > Almost everyone automatically initializes stack variables to zero these days so
> > bugs like this don't show up in testing and we disabled GCC's uninitialized
> > variable warning so it's easy to miss.
> > 
> >  drivers/platform/x86/intel/intel_plr_tpmi.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/intel/intel_plr_tpmi.c b/drivers/platform/x86/intel/intel_plr_tpmi.c
> > index c1aa52c23d25..2725a1ddba92 100644
> > --- a/drivers/platform/x86/intel/intel_plr_tpmi.c
> > +++ b/drivers/platform/x86/intel/intel_plr_tpmi.c
> > @@ -162,7 +162,7 @@ static int plr_clear_cpu_status(struct tpmi_plr_die *plr_die, int cpu)
> >  static void plr_print_bits(struct seq_file *s, u64 val, int bits)
> >  {
> >  	const unsigned long mask[] = { BITMAP_FROM_U64(val) };
> > -	const char *str;
> > +	const char *str = NULL;
> >  	int bit, index;
> >  
> >  	for_each_set_bit(bit, mask, bits) {
> 
> This fix looks slightly incorrect.

s/slightly/totally/.

I'll resend.

regards,
dan carpenter


