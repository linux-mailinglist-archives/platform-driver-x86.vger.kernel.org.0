Return-Path: <platform-driver-x86+bounces-2886-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F48A9457
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Apr 2024 09:46:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2394A1C21207
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Apr 2024 07:46:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FE856E5EC;
	Thu, 18 Apr 2024 07:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Uw2ygL05"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D22576F
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713426384; cv=none; b=Fi/suCyvlz3DyPY0BiYWS/5TjbmB5wLNl/YyYQZ0pFI8UpAvceP1P7FDijrMhA5FjK9r5nKLBGwDym2Uxj53MhuBRC7EcH3Thd6dleTlUQht07HKuPwHcsO66amUDAokey+od21jOPIMgvIZ2403r0sRv1xmcySoQoLZA680flk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713426384; c=relaxed/simple;
	bh=llKGbsWJJugAlydvpNrlvNLT18fU0/e8MYbfh9aScqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AIKq+N0TbQgVRtuEWMbyAqmDQ0faDfUh+DEiTJoLU3jv9UL1KtPUlp7waeswvIVjxgzzkQts6kld9+TxDuQyhkiUNjsPElwZkFdRYPJ0nz8HQCyatJtWXLsii9NyqpBhHTa7hdTpZHkaGjaqVG6QEy6nO8chb46J2DczR4lHDkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Uw2ygL05; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713426381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8aynBx44eRT0HfwifIP95ObSSJcm85NJy67vieUQMc=;
	b=Uw2ygL05RIROcILC/gFvbhK39y8lbK1VGMd/7iDRTxHvsv2hYu0UnxEj8bt7IRilKFnehb
	LVhRQdvfw0xL76ktjugnK3ePuEEPYeRk/r6DG4k+/YR7fCIe4rXhDsMRhQIRGIkMZhyXpx
	Of7nKlqN3Glak8XpqQHZelRvOuqUlZA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-jb6LMPUmNSiZjZ6GdhsAIQ-1; Thu, 18 Apr 2024 03:46:19 -0400
X-MC-Unique: jb6LMPUmNSiZjZ6GdhsAIQ-1
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2a5d989e820so843296a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Apr 2024 00:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713426378; x=1714031178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8aynBx44eRT0HfwifIP95ObSSJcm85NJy67vieUQMc=;
        b=IytKyetaRQw+9ykapNoU7mRWzcaa+mxTVKMMD3oSdBeHYa6kkl/j/GSuQSbod5pt8m
         YDWaVY4XcoiJg6aopRrguZ02JICTG0spAuJTu0KunKXW5mMXilf31pgtkiuNtiFrtbFZ
         vJpEe0XoazonsGndU+tmwKHMsr2QxxW1ngC1ih9yO8grCDnKfbtY+S4dgaEg0Eq8fG/4
         LdrdKfdC/KvgsQuNjpRff7sC2ulPDXeEyL/x/b2iFFbiGxg2YvI30u9Df0HVQBiQWigq
         jnSE+S6JFAJKYfrpMxBQMKW7wYFF+7q9ztf4BHbZn//p8qkk+YH47SwjdLuG8+jBoJI0
         bSCA==
X-Forwarded-Encrypted: i=1; AJvYcCVxNBOj4ZQOXxRqvhQC9CIKyPs3IlrSMjgk8j1GI/O7gv32odLB21xlROA+H6Q/VV4Pdv68BLYHTuGgZu/IK5Go4P8GCwyyXarDvtMIlUlwya5pAQ==
X-Gm-Message-State: AOJu0YzwFnadWSIT9vSMmpBUA4hKc8iUe5FxgqsJBypARtRfFUPYqRVA
	9zxKd2zkQZbkxzOiV0wCUGFaKfaaRKKfvfDfvWuFr2kLz6lYwqCgUmN1tapwCey3idpE3m4pqk0
	qz4zWQpmRyrE3KniwVtrkwarLnvlypXsPm7MFBDtNO1g5SuHy+RGebW/2CegeD4dvF8FaPyzXKg
	AV4pKSwJARrT1IiWLgrRT4R8qajPpE+/pAFdUogC/7Kfz5aQ==
X-Received: by 2002:a17:90b:374c:b0:2ac:2b6:8d4f with SMTP id ne12-20020a17090b374c00b002ac02b68d4fmr212861pjb.45.1713426378240;
        Thu, 18 Apr 2024 00:46:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfqIf4uawCXSgXLqIrbzwcOfCcpO8u/zX70z+9Fok+E11Lzwon3KiW0+V16R2BfK3cXsls+i4CBab4pjMoDUQ=
X-Received: by 2002:a17:90b:374c:b0:2ac:2b6:8d4f with SMTP id
 ne12-20020a17090b374c00b002ac02b68d4fmr212852pjb.45.1713426377926; Thu, 18
 Apr 2024 00:46:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240416053909.256319-1-hpa@redhat.com> <20240416053909.256319-2-hpa@redhat.com>
 <CAHp75VeuXuD7USd=bS1X=HCtKRPYWZ7r1NApPfDFZ4RRCUSRLg@mail.gmail.com>
In-Reply-To: <CAHp75VeuXuD7USd=bS1X=HCtKRPYWZ7r1NApPfDFZ4RRCUSRLg@mail.gmail.com>
From: Kate Hsuan <hpa@redhat.com>
Date: Thu, 18 Apr 2024 15:46:07 +0800
Message-ID: <CAEth8oFvVtxpd1n9rjzCqgUfHKaNCCyni8=hK9M+HvVeraPk4Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] platform: x86-android-tablets: other: Add swnode
 for Xiaomi pad2 indicator LED
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

Thank you for reviewing.

On Tue, Apr 16, 2024 at 9:46=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 16, 2024 at 8:39=E2=80=AFAM Kate Hsuan <hpa@redhat.com> wrote=
:
> >
> > KTD2026 LED controller manages the indicator LED for Xiaomi pad2. The A=
CPI
> > for it is not properly made so the kernel can't get a correct descripti=
on.
> >
> > This work adds a description for this RGB LED controller and also sets =
a
> > trigger to indicate the changing event (bq27520-0-charging). When it is
> > charging, the indicator LED will be turned on.
>
> ...
>
> > +/*
> > + * The fwnode for ktd2026 on Xaomi pad2. It composed of a RGB LED node
>
> is composed

Okay.

>
> > + * with three subnodes for each color. The RGB LED node is named
> > + * "multi-led" to align with the name in the device tree.
> > + */
>
> ...
>
> > +static const struct software_node ktd2026_node =3D {
> > +       .name =3D "ktd2026"
>
> Please, leave a trailing comma as it's not a termination entry.

Okay.

>
> > +};
>
> (TBH I'm still unsure that having a name is a good idea even if it's
> supposed to be only a single device on the platform, but it's up to
> Hans who has an experience with those.)

Hans gave me an example without a name. I think, it can be dropped.
Moreover, Only one KTD2026 is on Xiaomi Pad2 so having a name is ok too.

>
> --
> With Best Regards,
> Andy Shevchenko
>


--=20
BR,
Kate


