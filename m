Return-Path: <platform-driver-x86+bounces-14943-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59129C0A276
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Oct 2025 05:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39C021891B59
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Oct 2025 04:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0F0A1E5205;
	Sun, 26 Oct 2025 04:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FFrEbDiz"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295561D90DF
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 04:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761453573; cv=none; b=dL0OY/gHWOQijy/P5OlSH67/RSK1YR8rWf1INDZYu0MQwSrYuSXwamYuQfyW6blCjg41RXISQlUliiAmYt+oMagZbd1+X4pvKo02vChjlQg2hIoL/nH/L/XRnLIrz3RH9jod2NSodRI23vqf55Eevd99OtvVFW49d+6WAEW0hGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761453573; c=relaxed/simple;
	bh=vy5Ll0U3YbQyrkACgE52PX3IgmUHRgbRz926G0fQUbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K1cUqYJpFeOLT1OkyFu0BNf3XleJKqrBXPLdd0TEUx+7PqvycGn6y11ful8a73XrHyvZiRbGZTtKNAk0cW/nAo+vG54Q8bVCewgoZrVS/TVVLzAWGOxSX9mcyIY8Aimng0m79sUrtRE07+rDOsYhSMuqlaZwkZma/uX06FzthJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FFrEbDiz; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4eba67d4b1bso11825821cf.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Oct 2025 21:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761453571; x=1762058371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzNBy14nkOw/dB7piX3Hy0f3suS2Ffjp6ed0FqlTWN0=;
        b=FFrEbDizYcYQXrXTCB40m234l9thWm8De0B984BBu8FOlDoc1N9y378nJivBZ9f+j5
         7MwFSw6F6oudMjFQY+TXsojLr5kY4Pi2oQjwlnv6R5igxTeCjI9Wp3vvhZOFMbk9LUDR
         zK9QMvDdjDuk1tXcvedcgoKXh5Yw7qQrBjw2qXYk4hhuYL8VQKGBGFpLQ71BozBvk3e5
         Bkz4d0lKjRZ+qXhl9xdaAgFFl9sunDVeVMu0a4uuiGS6Mokrupyi6jrkJwQ5lRX3OSHK
         klL/PgUFwR4MdDdeeumvQeGuIQS+HYLejW2hiuM074zkrRGLBS8Qi9armgbvNiGv/Qv8
         6xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761453571; x=1762058371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzNBy14nkOw/dB7piX3Hy0f3suS2Ffjp6ed0FqlTWN0=;
        b=Q39Vko20HFvcITEStpmvpaPFGrGBzPZe9O5JHwSJQBX0yTvoyy3L+uKtYGXmMY23g9
         KJ+rzymQRtI5GeyZrq0l0K8DOTzEE+IGfV98bWvdSJnhpTJWq3w6K9NOTbEfCMCt2NAu
         iq3uNZ4ck1EebuurAPI4nppew5IT6tYvsXqRuE8nAVAZZRk3UFQ/ylrwky9rtWXYNIR0
         6bpRryjJoj12ji4wTrENk3Ltz/9lg6GSkSC7eQspPYjerDsu4ZfussEO70vNBAoTULtn
         7ODrW+7IsxypQYkzwiF1YJk9aU7lIfl3L8PeYjsyT9zJuw7FueN5ldYh5WgLlhjtQDc8
         YOww==
X-Forwarded-Encrypted: i=1; AJvYcCX2PyzCIfR+H+8W4wfmintaMoaT0iJVymncVrzM6JzA9WWgG49YOwP8aNplMiz15p8ThtlnY8Y3qzo8NRqKU6OvGPWy@vger.kernel.org
X-Gm-Message-State: AOJu0YwyB8py6YuZlD86XKE6dq0r1z5n70eylW0yO2scbqG5JXgtPtyz
	iedagbqEXYLkzbYztZaUlA4Gv97vuGwNEUP6zBL8YeJ3P+hZ4Hg2bka7IV4eUyC6Z4JNTPyie8V
	igb1yUX1NWRV06QmDqLYkhcsZOhqNkXs=
X-Gm-Gg: ASbGnctHhv6oDBL0e+Vq5shpfUjAuamqwjgQ2Hq1mpTvyYV/igQMEaWFCm83O4ZxxKV
	GHCGyJymI6Uf6PuOIa+UV2Pu+yiOah7nj8KNWUUU3TaDtAALS+kEQ9WlKYvhFeZob1RPVZQnHTu
	h2eruRY8gpRyMr/j3u41IJ+lcJFkv2K70U+nBam/7mRZ6FTCwyhIJG1CFwLUDV8r6mZlGzBGJdE
	z/BiFfpuKXrSKP7wPHRoYLwnPY6J6KQGdTZjltgvKvghAeqdJ56upux8q2z9f+jN8ZFieqt
X-Google-Smtp-Source: AGHT+IEePRJIChmr7Nbfg/5hSN4J3EvnJhbGxzJiKb29WiBVfr4CZE7zQb1z1WDIkxp0P7UbkfzSOlj646+w1Eg72rA=
X-Received: by 2002:ac8:5e14:0:b0:4e8:9eec:3a91 with SMTP id
 d75a77b69052e-4eb940f0b2emr81094931cf.26.1761453570970; Sat, 25 Oct 2025
 21:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251019210450.88830-1-i@rong.moe>
In-Reply-To: <20251019210450.88830-1-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 25 Oct 2025 21:39:20 -0700
X-Gm-Features: AWmQ_blNweRWEnJyzm71NgB5DybncgYqy6Cjc9ibrZM10MakZmaDOcTATakkos4
Message-ID: <CAFqHKTkBbtSHfu1bXn8tyjvPSmCOMoWdLyNMv=DRQke679SEPA@mail.gmail.com>
Subject: Re: [PATCH 0/6] platform/x86: lenovo-wmi-{capdata,other}: Add HWMON
 for fan speed
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 2:05=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Lenovo WMI Other Mode interface also supports querying or setting fan
> speed RPM. This capability is decribed by LENOVO_CAPABILITY_DATA_00.
> Besides, LENOVO_FAN_TEST_DATA provides reference data for self-test of
> cooling fans, including minimum and maximum fan speed RPM.
>
> This patchset turns lenovo-wmi-capdata01 into a unified driver (now
> named lenovo-wmi-capdata) for LENOVO_CAPABILITY_DATA_{00,01} and
> LENOVO_FAN_TEST_DATA; then adds HWMON support for lenovo-wmi-other:
>
>  - fanX_enable: enable/disable the fan (tunable)
>  - fanX_input: current RPM
>  - fanX_max: maximum RPM
>  - fanX_min: minimum RPM
>  - fanX_target: target RPM (tunable)
>
> This implementation doesn't require all capability data to be available,
> and is capable to expose interfaces accordingly:
>
>  - Having LENOVO_CAPABILITY_DATA_00: exposes fanX_{enable,input,target}
>  - Having LENOVO_CAPABILITY_DATA_01: exposes firmware_attributes
>  - Having LENOVO_FAN_TEST_DATA: exposes fanX_{max,min}
>
> Rong Zhang (6):
>   platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
>   platform/x86: lenovo-wmi-{capdata,other}: Support multiple Capability
>     Data
>   platform/x86: lenovo-wmi-capdata: Add support for Capability Data 00
>   platform/x86: lenovo-wmi-other: Add HWMON for fan speed RPM
>   platform/x86: lenovo-wmi-capdata: Add support for Fan Test Data
>   platform/x86: lenovo-wmi-other: Report min/max RPM and hide dummy fans
>
>  .../wmi/devices/lenovo-wmi-other.rst          |  32 +
>  drivers/platform/x86/lenovo/Kconfig           |   5 +-
>  drivers/platform/x86/lenovo/Makefile          |   2 +-
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 545 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  46 ++
>  drivers/platform/x86/lenovo/wmi-capdata01.c   | 302 ----------
>  drivers/platform/x86/lenovo/wmi-capdata01.h   |  25 -
>  drivers/platform/x86/lenovo/wmi-other.c       | 422 +++++++++++++-
>  8 files changed, 1028 insertions(+), 351 deletions(-)
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.c
>  create mode 100644 drivers/platform/x86/lenovo/wmi-capdata.h
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.c
>  delete mode 100644 drivers/platform/x86/lenovo/wmi-capdata01.h
>
>
> base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> --
> 2.51.0
>

The series' intention looks good overall. The composable methods for
additional capdata interfaces is a welcome change. I have a few
comments I'll add for a couple of the patches. My apologies for the
slow review timeline, I've been on travel and wanted to test the
changes before submitting a review.

For testing I'm using my Legion Go 2. It apparently doesn't have the
FAN_TEST_DATA GUID, and the hwmon interface errors on all inputs
despite being visible. I know for the Legion Go series they use a fan
table with 10 auto_set points in the Other Method interface tied to
the platform profile, but the documentation I have says the methods
you're adding here should be available on all models, so that is a bit
strange.

dmesg output:
[    3.995549] lenovo_wmi_cd 362A3AFE-3D96-4665-8530-96DAD5BB300E-13:
registered LENOVO_CAPABILITY_DATA_00 with 33 items
[    4.000266] lenovo_wmi_cd 7A8F5407-CB67-4D6E-B547-39B3BE018154-9:
registered LENOVO_CAPABILITY_DATA_01 with 80 items
[    4.005603] lenovo_wmi_other
DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: bound
362A3AFE-3D96-4665-8530-96DAD5BB300E-13 (ops lwmi_cd_component_ops
[lenovo_wmi_capdata])
[    4.005611] lenovo_wmi_other
DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: bound
7A8F5407-CB67-4D6E-B547-39B3BE018154-9 (ops lwmi_cd_component_ops
[lenovo_wmi_capdata])
[    4.005614] lenovo_wmi_other
DC2A8805-3A8C-41BA-A6F7-092E0089CD3B-3: fan capdata unavailable

Testing results:
(deck@lego2 hwmon5)$ ls
device  fan1_enable  fan1_input  fan1_target  name  power  subsystem  ueven=
t
(deck@lego2 hwmon5)$ cat fan1_enable
cat: fan1_enable: No data available
(1)(deck@lego2 hwmon5)$ echo 1 | sudo tee fan1_enable
[sudo] password for deck:
1
tee: fan1_enable: Input/output error
(1)(deck@lego2 hwmon5)$ echo 0 | sudo tee fan1_enable
0
tee: fan1_enable: Input/output error
(1)(deck@lego2 hwmon5)$ echo 3000 | sudo tee fan1_target
3000
tee: fan1_target: Input/output error
(1)(deck@lego2 hwmon5)$ cat fan1_input
cat: fan1_input: No such device or address

Thanks,
Derek

