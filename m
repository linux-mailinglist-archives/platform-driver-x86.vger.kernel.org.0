Return-Path: <platform-driver-x86+bounces-2315-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DE088D83C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 09:00:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E29CC2A3704
	for <lists+platform-driver-x86@lfdr.de>; Wed, 27 Mar 2024 08:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37211495CC;
	Wed, 27 Mar 2024 07:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGeKM79S"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAED47F4B
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711526284; cv=none; b=Uyh3H6RJkQXUZgVALhe0lTusodVY+RkMJA8FUS87jg2jKg8jJgbcR4cIJ/IWWlppavUmpROQw6d4go88kQKOeRI8nYsGVY2QtDASXtyr86Vh46J9YMQbuNcxLPwh/8YCc7qwUJuqxuR7RJd7dxsQTTcOaJ2BuKFi0mpNf3dNt3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711526284; c=relaxed/simple;
	bh=+jMhjERTTtRLM0KWZ1Ds1bG7HJxMTKBPNk0QcjknlfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtHR46ehV2dplvjqUeCRvhZE1YxHDy7qxH1AZaVThBwoT/hr4f9Fi0c4oLUGigby0rX1ptFrpv1Kv5vIl3+nOOeaGvVZXBrUR3J+l3aP1rjLp2tHVPC66EeSY1/L3iinaqVzkaHrfgbQIftwupKCiY2DeGNz1gRgJwyC/Ii2WZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGeKM79S; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711526281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FvCZIXlyJ0i9W5y1NVajdFVbSmQI+ddDaK6Um2GHqYw=;
	b=QGeKM79SYM2frmbmt2fxZHlTNPc5Oc842ZXIV9fYAHyaizqKZdm6AQwbQ2/i7sBfZ6yLBG
	/3zjToBOF6R5v9/jolUeie+s7O0lGrLHanmRp8WfGz9AHCuTQt4iVPqe1SUqo5L+iRAxdS
	JXhpwPhJDXSNffPjD54Q6jbnEfn3mdQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-s2A9rkUkPLGZ6NJ9UxCa0g-1; Wed, 27 Mar 2024 03:57:59 -0400
X-MC-Unique: s2A9rkUkPLGZ6NJ9UxCa0g-1
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-5cfc2041cdfso3641227a12.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 00:57:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711526279; x=1712131079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvCZIXlyJ0i9W5y1NVajdFVbSmQI+ddDaK6Um2GHqYw=;
        b=Wgs3D1puT8XiDr5YZ7cMB34MppxsOgfXKFQWRQIewAorw3e4ppnbDf/dlsZ68EGH4N
         9KUERDsjLZlYILJDR0GDPacAaIIl8ZoK1Rv9BdTAM2w47IHDSjeCfEATyxpmKrduZOUB
         uEeS8atlr+Gtze9d2mj3+nsJQGcDUxbfDoFm0pv9RFhwKe7SNEVujggPyLZHjfBrUVxI
         z/2pmJCcmS+HXFBndQcAjXMwXxmJW/bXYstw5QtpdeJ+o3M1x+D6Eyv87rYhMHvCBpr1
         QdWuHjxeP+QBAyXB5vI39xrZTdkJn/TmBq9/tKzuwJgG4UB9DftZit2+96wTdcGIX1TZ
         /gHw==
X-Forwarded-Encrypted: i=1; AJvYcCXIV5xO/SBD33/UhglNdOw5P6IvsFXLaQBS1buBV2jioPm4PfUMq2oSnx3l3M8gZ6n4u1RBDXKe+blSWhL6cjwdQ6zxjb6XSXCZ13YI0o2O76S4mg==
X-Gm-Message-State: AOJu0Yy2RIgYsXowQinCvSE5ulTfAH6MzYp4CcyLhr8pm60YkWzFfDDK
	ar+uw2zYilyG1GS23pA6xVigxsDksN9VqxkqcmECECDqCG/Hz6bAOlaCNjupc+olIt0XD/rX9Sl
	YJH8D82vm/ES7you+rfOuGQe3xx28+BWh4v+MI/3ceKCSsG6vTl43qsLaUhWAdTCc87NeAAZqCU
	1mT4KibtWSHBVZpLPyztkX+PxMmXKifho7h6gLT9Tj/4ov6A==
X-Received: by 2002:a05:6a21:78a1:b0:1a3:5440:520 with SMTP id bf33-20020a056a2178a100b001a354400520mr2261627pzc.1.1711526278844;
        Wed, 27 Mar 2024 00:57:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+Q9fuG8yTs+ELOSdaWHYwqpSczYEeTI5UtBaHspHNLcfSZRVndgU5mB3Z2zq0Hcih2Q+cX9I9biaM+ykuO08=
X-Received: by 2002:a05:6a21:78a1:b0:1a3:5440:520 with SMTP id
 bf33-20020a056a2178a100b001a354400520mr2261613pzc.1.1711526278530; Wed, 27
 Mar 2024 00:57:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240324150107.976025-1-hpa@redhat.com> <20240324150107.976025-2-hpa@redhat.com>
 <CAHp75Ve5201KNdjvDZYq_unHTKp9wZXPWZXDgStP8y+XjtnWWg@mail.gmail.com>
In-Reply-To: <CAHp75Ve5201KNdjvDZYq_unHTKp9wZXPWZXDgStP8y+XjtnWWg@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Wed, 27 Mar 2024 15:57:47 +0800
Message-ID: <CAEth8oG7_qFuUrL+kX3ezNatWqKPqT-qiaO5NGY-N3F3ufQL9w@mail.gmail.com>
Subject: Re: [PATCH v5 RESEND 1/6] platform: x86-android-tablets: other: Add
 swnode for Xiaomi pad2 indicator LED
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for reviewing it.

On Mon, Mar 25, 2024 at 3:30=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Mar 24, 2024 at 5:02=E2=80=AFPM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > There is a KTD2026 LED controller to manage the indicator LED for Xiaom=
i
> > pad2. The ACPI for it is not properly made so the kernel can't get
> > a correct description of it.
> >
> > This work add a description for this RGB LED controller and also set a
>
> adds
> sets
>
> > trigger to indicate the chaging event (bq27520-0-charging). When it is
>
> charging
>
> > charging, the indicator LED will be turn on.
>
> turned
>
> ...
>
> > +/* main fwnode for ktd2026 */
> > +static const struct software_node ktd2026_node =3D {
> > +       .name =3D "ktd2026"
>
> Leave a comma, this is not a terminator.
>
> > +};
>
> When I asked about the name I relied on the fact that you have an idea
> how it works. So, assuming my understanding is correct, this platform
> may not have more than a single LED of this type. Dunno if we need a
> comment about this.

I'll make a comment to describe the configuration.
This LED controller can be configured to an RGB LED like this. Also,
it can be configured as three single-color (RGB) LEDs to show red,
green, and blue only.
I think the name can be "ktd2026-multi-color". Is it good for you?


>
> ...
>
> > +static int __init xiaomi_mipad2_init(void)
> > +{
> > +       return software_node_register_node_group(ktd2026_node_group);
> > +}
> > +
> > +static void xiaomi_mipad2_exit(void)
>
> __exit ?
No need.
x86-andriod-tablet is based on platform_driver and platform_device so
it doesn't need __exit.

I put __exit and the compiler complained about the warning.
=3D=3D=3D
WARNING: modpost:
drivers/platform/x86/x86-android-tablets/x86-android-tablets: section
mismatch in reference: xiaomi_mipad2_info+0x50 (section: .init.rodata)
-> xiaomi_mipad2_exit (section: .exit.text)
=3D=3D=3D
>
> > +{
> > +       software_node_unregister_node_group(ktd2026_node_group);
> > +}
>
> --
> With Best Regards,
> Andy Shevchenko
>

I'll propose the v6 patch to fix them according to your comments.

--
BR,
Kate


