Return-Path: <platform-driver-x86+bounces-8904-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CEAA187D9
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jan 2025 23:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF78B188B4F8
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jan 2025 22:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40CF21F8934;
	Tue, 21 Jan 2025 22:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k5vJlgkH"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4400B1F78E8
	for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737499606; cv=none; b=himH907of2zMgui8RWM4BTXxxW2pdHsUcuLKIAzgU2sXwCStDnpFMSiYCOl5XjOZn+6+xfvb0EQar/NhiN7BiUeDaEKL8iZisZg9eRoRNg73o7FlJzLSrKOS1LaNmpruw57cpbhcvpE+suvo24YusHTjHuYEZxEKXLFVFYoueqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737499606; c=relaxed/simple;
	bh=cchUDxLgaZgqrg5IdavzBbBrud0K8o1mfxpHf4FdIzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HX6TnjtKNEJlNfJu0LT8rT4zFk5Qs0QqNVlHWABNcdEobkITdprKPH9l9HV0Af4kQu4unr73kzPIzuHAiOTG1yO1EqTVWVzt6vSTu2m+wO1s1C1/XKsyqvJS9epF5CdutCt5PDH10dnZXgRPoxaKYFins+y+NpOgbNqZ0QVZuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k5vJlgkH; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401b7f7141so5601104e87.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2025 14:46:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737499602; x=1738104402; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueW7eUjPjy3W4d+buLXQsQex+GgJG2cqiwpbba6ZqaM=;
        b=k5vJlgkHazK3G4izUV3bm6Dhvb+ma1cPCU6E/Q9z2hybsE0E75qnXwsTR+4kAp95pK
         +pYRJ2spybab3o8ji/eqim+qkympI5u4SZq7Qn6d3+a11FEW5/O9zqLHKZFgA8FrNBht
         9g7KS2yqvxHiQ/2onbBVQ2RPeZnRBazBkMKnuCuvMtJkhe6XY2E229PSPpiV2ysnugtl
         l9y+TeCnrFy+DsE90w/YY1WQ1eeyW3+tMJ3qHg7+wJsDgwClqBytyf/UKK08GnZ3fg5S
         JTkYayen+eQ+NjJ0g5KdlXYwGcY272kdMOm00NNxBQ4i63pTM7b6yGsgn3ceXl4NPKds
         4J4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737499602; x=1738104402;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ueW7eUjPjy3W4d+buLXQsQex+GgJG2cqiwpbba6ZqaM=;
        b=nv/PyvrdPaREbP1YXeM6ft8EHOOL4++G/CAMR02OA+mveHGQ1LyJTWN7JzNTetfu3+
         bQPRog43JZ47r3PXb0x+0p8gJUB6M/qqcPJm5ILvF7+7Ym12mA3CVWS4N3idFm8ppIDD
         um+jMtSzjgQRDOq8rBdiJDME6gSpRDu34IWWTx4RTd6ct4igEURQQCRnrMkcGmae0hce
         F+iSXW2PRrrxb5qLDnW1zUgX2pmZq1UTMWZa/Dnz9raMXU210kdyxj2PGEVV9ym1dTyA
         aF13SfeocwN4grlRN8WNLbYpg8mcP9Zg7if17hZOigDy/IAsj+mlCQjpupRIlzyI/4he
         EN0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU6nlmz6HZ4vOoAAP2+Y3YNyILI7BqtMvZe3Ts6HLcMC7fRaJbPRoZsLFPsYw5qKksMZY9nITL6KhK4OYfkk2uQdSQY@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxOUCV2MmoMJLw3lZRqY/NUsV1ny/+BP1mKcTmXvGOkVdMEY5
	qfdXhHjlIdSk2LQEnTWhmySsO1i+MNGmv+/FJMP3eDlHqkAKNI3rZ6L+LcWWLgGXJly+THxKjrT
	Eh+56K/zSZayUwGmcRLR0HwZZ1Hc5m0B1u4qt6A==
X-Gm-Gg: ASbGncs1Mk5BYIXU0OEhoEMxk/Z3qj+HQ6tA8Llp5T43xhMclJs8XXk/EfaOjtDA64d
	Qr/XCxsb/vGsonMXJAtHVYh7FwzyzSwEx+p09ZLMRgrWHm8USvw==
X-Google-Smtp-Source: AGHT+IEH2jyoBhV/SK5lQRQDm7lzkjaNOHM97pS3ty1f8wVYFKlEYyxgzOmAVMMsZcT3pzYTriHKr1F8gqt4Je+Iy9k=
X-Received: by 2002:ac2:4e0e:0:b0:542:297f:4f68 with SMTP id
 2adb3069b0e04-5439c1b85fdmr7417123e87.0.1737499602318; Tue, 21 Jan 2025
 14:46:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1733245406.git.ukleinek@kernel.org> <3a99048a52aeee356d01dbf7f2f06e6e0826ed78.1733245406.git.ukleinek@kernel.org>
 <Z09YJGifvpENYNPy@smile.fi.intel.com> <ipkpvzuv7eogcfeamvkwxjsazg33umoykuij7zz3sfhlahtn2x@tr3gok7bbmco>
In-Reply-To: <ipkpvzuv7eogcfeamvkwxjsazg33umoykuij7zz3sfhlahtn2x@tr3gok7bbmco>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 21 Jan 2025 23:46:31 +0100
X-Gm-Features: AbW1kva7ncBM2IeIDV5HoVet9AYIR2oav9OGUDSRHE3DOyoTMfl974H2vwt4VHo
Message-ID: <CACRpkdYwhMa=obX1nqy1VAD93LPp6HkSvX9X2L-k6bOAORzBXQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pwm: lpss: Move namespace import into a header
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Thierry Reding <thierry.reding@gmail.com>, platform-driver-x86@vger.kernel.org, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 16, 2024 at 9:46=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:

> Andy and I disagree about this change. If you happen to not have the
> patch in your inbox, see
> https://lore.kernel.org/linux-pwm/3a99048a52aeee356d01dbf7f2f06e6e0826ed7=
8.1733245406.git.ukleinek@kernel.org/
>
> Would you please volunteer as the impartial judge here as you're the
> upstream maintainer of drivers/pinctrl/intel/pinctrl-intel.c?

What about those wise lines from Torvalds in
Documentation/process/management-style.rst:

  The name of the game is to **avoid** having to make a decision.  In
  particular, if somebody tells you "choose (a) or (b), we really need you
  to decide on this", you're in trouble as a manager.  The people you
  manage had better know the details better than you, so if they come to
  you for a technical decision, you're screwed.  You're clearly not
  competent to make that decision for them.

> The TL;DR; is: Do you prefer a single MODULE_IMPORT_NS() in a header, or
> should every consumer driver explicitly have its own MODULE_IMPORT_NS()
> invokation?

Intuitively I personally prefer using macros like that in every instance
(in every consumer driver). But it's not like I can give any good reason
for it, just intuition and what I would do.

Yours,
Linus Walleij

