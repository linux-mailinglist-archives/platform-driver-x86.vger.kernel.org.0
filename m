Return-Path: <platform-driver-x86+bounces-14944-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 066FAC0A282
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Oct 2025 05:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 05F674E19BF
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Oct 2025 04:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D4C23BF8F;
	Sun, 26 Oct 2025 04:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTwoRsME"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEE31E5205
	for <platform-driver-x86@vger.kernel.org>; Sun, 26 Oct 2025 04:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761453675; cv=none; b=HyFNd9NhYI9B9K5ImlBaxDhSero3H6Do7INkyQR8iOk8VffVQoYjnKh5q4LeB9vixYatHkk9Q50Ffyileqda5B76EF1vIGA7jJreSNsDwk7xRo2i5QetHIFsJK85BsL0PivqEL31Bn7PRx3jTB15SiosTBRLmHscCYQmNv6z08E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761453675; c=relaxed/simple;
	bh=fMZ5z7/C8Ytl8UF4bPFhUzZfbhzxIPDFd6LXoHLTQNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TPDFzo4dtY3UBIfxlOa+ZMaK2fufkk5+bgqbTskJABynWbcPVi+MxjBBXD0iQ3fOLjwFRSkXZzIyLS1BNiM9QSbOyN317E3ZojF9DU9+7hot0vzV2mEAGP2vEGeYnSxVjnR2W3QuyhO3sHRVPId0cdbQB+C/hLoOy8tnQto3ep4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTwoRsME; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-795be3a3644so19615406d6.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 25 Oct 2025 21:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761453671; x=1762058471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9EdmsxwcxuoP1gpE2yNrJl2j2OzYefC5t0vqX+8yGY=;
        b=JTwoRsME1Q9ri9B5U+8QiNb63XWvKGJ5u9g9+E8Zmqr47kd6U9FcPQOcZbykyDnQcU
         6cLhPUIgqzywn3+YDOC6TzxPIo13Bj2DXUNroN0ZrSmMvnn6ZkphmNVvG9W9jPYU4cQT
         RrQfEdNz9Bbhd6wcdyTZI/61WpNuzP00qghXaZ64IjuKhxS3C/lkmBm68JU+Nhqehg2t
         Km45Jon5ZPDuIXi0DPfYyDFzUBYMSpmTR+Yk+915gz63vNdoalvKFpq/VIwlvKtMWtAp
         vDMz1H78Cs0/o8vcxe/2mvlTwY3VZovZdUO6/tj39JEME9JCCX01F6lRipGj789qnUcF
         pAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761453671; x=1762058471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9EdmsxwcxuoP1gpE2yNrJl2j2OzYefC5t0vqX+8yGY=;
        b=j2r19PFDs5ku8bDVTXpzPdQ7wTv0r0iLke7g7ae6vKHVvtWaBYoC/OgH+KOdpT6dYt
         YRwMzFn+QYpJ0CywbyrOsyq8slIIQj0DuUH0NZW6hdY8U9j+L8d7BVnVShrr5Fe5UNWy
         2m4SwcCJlnsHD8+fHazE+twAdeJWquurD/XaGq5BAtFXfGF/WUthH/eKBSChbApkxtS9
         xgSq3iglIkfZ8OWz0goX0PLeohJlx46Hz2vuhxg+jA9B9zs7JsnevrJXpfKhnxIvfoyj
         HTCXMGprFqDWPSbkKT4HQVT6UqTXZqEkfOR0/gYnogayVj7Fz8VbgFVV1+D4FBO2twbd
         AoVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXh07RHtL/56XeLrmg8DIrZvcuJsAnoWlyX3BXa1/Ijv9qDWItlSlqDgP4cJlV2X/L4Lks/fGLi3o6IMgrcHBunAMMy@vger.kernel.org
X-Gm-Message-State: AOJu0YyhoYQ5EA4jdHlS/8H6Xmxzc8FeNKeCcOPN7RA+GZBlvaJcLBFs
	9IU0ViUKxRyItHkCKKypbWZ6BZ4YLJZURwjUTMbB0r5sKR1alzmOf/tBeCj9qhJecr3oIBmm/t3
	7ea4EHBZPltsLuM9SwSLZDem5ctEl1E4=
X-Gm-Gg: ASbGncsVwMxwVJjlBfDR7s0GYaVbv1X6jr3HiuvMsID+aWrW4DNP5+GLVLlwgKdXoTg
	YQBWcopl07CMPzOcm5pAN+71Tm2cTBuLRB1VYj7ucBH6xOf6s7AzJq/+jCgo4pvokXh7Blb+F7v
	Ic10w9sUGr/Hcb4DX3eDLbQzwmAcqshDJe2/7seYc6IwN+ofaec8lCIgDfGSlp+Ci833wGd/EAP
	O0mVAoH8MoDcpg+cn4pI/5z3umoOUxnS2TzdefuM1Tt1nNepI8NE6YiHasNZQ==
X-Google-Smtp-Source: AGHT+IFd5646VXZJxkrOMwN30PpAT2syjepohVvURTLv+hRFejGELtxIlAF4JjIv+jRy3LwnCbX3/xi1BFkZubympNo=
X-Received: by 2002:a05:6214:5287:b0:87c:d60:1017 with SMTP id
 6a1803df08f44-87c2057f338mr417717116d6.21.1761453671155; Sat, 25 Oct 2025
 21:41:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251019210450.88830-1-i@rong.moe> <20251019210450.88830-2-i@rong.moe>
In-Reply-To: <20251019210450.88830-2-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Sat, 25 Oct 2025 21:41:00 -0700
X-Gm-Features: AWmQ_bnFbXKOp88ZWZo4jhwhn_k1G_WucH1MYvOYqm_DwjSb1e0SFneX6VjzwnQ
Message-ID: <CAFqHKT=b7GSSSaGdFqzza+ECsTEpvPKyna=ux+assnOoQ+a2Qg@mail.gmail.com>
Subject: Re: [PATCH 1/6] platform/x86: Rename lenovo-wmi-capdata01 to lenovo-wmi-capdata
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 19, 2025 at 2:05=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Prepare for the upcoming changes to make it suitable to retrieve
> and provide other Capability Data as well.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
>  drivers/platform/x86/lenovo/Kconfig           |   4 +-
>  drivers/platform/x86/lenovo/Makefile          |   2 +-
>  .../lenovo/{wmi-capdata01.c =3D> wmi-capdata.c} | 124 +++++++++---------
>  .../lenovo/{wmi-capdata01.h =3D> wmi-capdata.h} |  10 +-
>  drivers/platform/x86/lenovo/wmi-other.c       |  11 +-
>  5 files changed, 78 insertions(+), 73 deletions(-)
>  rename drivers/platform/x86/lenovo/{wmi-capdata01.c =3D> wmi-capdata.c} =
(60%)
>  rename drivers/platform/x86/lenovo/{wmi-capdata01.h =3D> wmi-capdata.h} =
(60%)
>
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/l=
enovo/Kconfig
> index d22b774e0236f..fb96a0f908f03 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -233,7 +233,7 @@ config YT2_1380
>           To compile this driver as a module, choose M here: the module w=
ill
>           be called lenovo-yogabook.
>
> -config LENOVO_WMI_DATA01
> +config LENOVO_WMI_DATA
>         tristate
>         depends on ACPI_WMI
>
> @@ -264,7 +264,7 @@ config LENOVO_WMI_TUNING
>         tristate "Lenovo Other Mode WMI Driver"
>         depends on ACPI_WMI
>         select FW_ATTR_CLASS
> -       select LENOVO_WMI_DATA01
> +       select LENOVO_WMI_DATA
>         select LENOVO_WMI_EVENTS
>         select LENOVO_WMI_HELPERS
>         help
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/=
lenovo/Makefile
> index 7b2128e3a2142..29014d8c1376d 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -12,7 +12,7 @@ lenovo-target-$(CONFIG_LENOVO_YMC)    +=3D ymc.o
>  lenovo-target-$(CONFIG_YOGABOOK)       +=3D yogabook.o
>  lenovo-target-$(CONFIG_YT2_1380)       +=3D yoga-tab2-pro-1380-fastcharg=
er.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_CAMERA)      +=3D wmi-camera.o
> -lenovo-target-$(CONFIG_LENOVO_WMI_DATA01)      +=3D wmi-capdata01.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_DATA)                +=3D wmi-capdata.=
o
>  lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)      +=3D wmi-events.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)     +=3D wmi-helpers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)    +=3D wmi-gamezone.o
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.c b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.c
> similarity index 60%
> rename from drivers/platform/x86/lenovo/wmi-capdata01.c
> rename to drivers/platform/x86/lenovo/wmi-capdata.c
> index fc7e3454e71dc..c5e74b2bfeb36 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata01.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -1,14 +1,17 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Lenovo Capability Data 01 WMI Data Block driver.
> + * Lenovo Capability Data WMI Data Block driver.
>   *
> - * Lenovo Capability Data 01 provides information on tunable attributes =
used by
> - * the "Other Mode" WMI interface. The data includes if the attribute is
> - * supported by the hardware, the default_value, max_value, min_value, a=
nd step
> - * increment. Each attribute has multiple pages, one for each of the the=
rmal
> - * modes managed by the Gamezone interface.
> + * Lenovo Capability Data provides information on tunable attributes use=
d by
> + * the "Other Mode" WMI interface.
> + *
> + * Capability Data 01 includes if the attribute is supported by the hard=
ware,
> + * and the default_value, max_value, min_value, and step increment. Each
> + * attribute has multiple pages, one for each of the thermal modes manag=
ed by
> + * the Gamezone interface.
>   *
>   * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
> + *   - Initial implementation (formerly named lenovo-wmi-capdata01)
>   */
>
>  #include <linux/acpi.h>
> @@ -26,55 +29,55 @@
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>
> -#include "wmi-capdata01.h"
> +#include "wmi-capdata.h"
>
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
>
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
>
> -struct lwmi_cd01_priv {
> +struct lwmi_cd_priv {
>         struct notifier_block acpi_nb; /* ACPI events */
>         struct wmi_device *wdev;
> -       struct cd01_list *list;
> +       struct cd_list *list;
>  };
>
> -struct cd01_list {
> +struct cd_list {
>         struct mutex list_mutex; /* list R/W mutex */
>         u8 count;
>         struct capdata01 data[];
>  };
>
>  /**
> - * lwmi_cd01_component_bind() - Bind component to master device.
> - * @cd01_dev: Pointer to the lenovo-wmi-capdata01 driver parent device.
> + * lwmi_cd_component_bind() - Bind component to master device.
> + * @cd_dev: Pointer to the lenovo-wmi-capdata driver parent device.
>   * @om_dev: Pointer to the lenovo-wmi-other driver parent device.
> - * @data: capdata01_list object pointer used to return the capability da=
ta.
> + * @data: cd_list object pointer used to return the capability data.
>   *
> - * On lenovo-wmi-other's master bind, provide a pointer to the local cap=
data01
> - * list. This is used to call lwmi_cd01_get_data to look up attribute da=
ta
> + * On lenovo-wmi-other's master bind, provide a pointer to the local cap=
data
> + * list. This is used to call lwmi_cd*_get_data to look up attribute dat=
a
>   * from the lenovo-wmi-other driver.
>   *
>   * Return: 0
>   */
> -static int lwmi_cd01_component_bind(struct device *cd01_dev,
> -                                   struct device *om_dev, void *data)
> +static int lwmi_cd_component_bind(struct device *cd_dev,
> +                                 struct device *om_dev, void *data)
>  {
> -       struct lwmi_cd01_priv *priv =3D dev_get_drvdata(cd01_dev);
> -       struct cd01_list **cd01_list =3D data;
> +       struct lwmi_cd_priv *priv =3D dev_get_drvdata(cd_dev);
> +       struct cd_list **cd_list =3D data;
>
> -       *cd01_list =3D priv->list;
> +       *cd_list =3D priv->list;
>
>         return 0;
>  }
>
> -static const struct component_ops lwmi_cd01_component_ops =3D {
> -       .bind =3D lwmi_cd01_component_bind,
> +static const struct component_ops lwmi_cd_component_ops =3D {
> +       .bind =3D lwmi_cd_component_bind,
>  };
>
>  /**
>   * lwmi_cd01_get_data - Get the data of the specified attribute
> - * @list: The lenovo-wmi-capdata01 pointer to its cd01_list struct.
> + * @list: The lenovo-wmi-capdata pointer to its cd_list struct.
>   * @attribute_id: The capdata attribute ID to be found.
>   * @output: Pointer to a capdata01 struct to return the data.
>   *
> @@ -83,7 +86,7 @@ static const struct component_ops lwmi_cd01_component_o=
ps =3D {
>   *
>   * Return: 0 on success, or -EINVAL.
>   */
> -int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct =
capdata01 *output)
> +int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata01 *output)
>  {
>         u8 idx;
>
> @@ -97,17 +100,17 @@ int lwmi_cd01_get_data(struct cd01_list *list, u32 a=
ttribute_id, struct capdata0
>
>         return -EINVAL;
>  }
> -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD01");
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
>
>  /**
> - * lwmi_cd01_cache() - Cache all WMI data block information
> - * @priv: lenovo-wmi-capdata01 driver data.
> + * lwmi_cd_cache() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata driver data.
>   *
>   * Loop through each WMI data block and cache the data.
>   *
>   * Return: 0 on success, or an error.
>   */
> -static int lwmi_cd01_cache(struct lwmi_cd01_priv *priv)
> +static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>  {
>         int idx;
>
> @@ -131,17 +134,17 @@ static int lwmi_cd01_cache(struct lwmi_cd01_priv *p=
riv)
>  }
>
>  /**
> - * lwmi_cd01_alloc() - Allocate a cd01_list struct in drvdata
> - * @priv: lenovo-wmi-capdata01 driver data.
> + * lwmi_cd_alloc() - Allocate a cd_list struct in drvdata
> + * @priv: lenovo-wmi-capdata driver data.
>   *
> - * Allocate a cd01_list struct large enough to contain data from all WMI=
 data
> + * Allocate a cd_list struct large enough to contain data from all WMI d=
ata
>   * blocks provided by the interface.
>   *
>   * Return: 0 on success, or an error.
>   */
> -static int lwmi_cd01_alloc(struct lwmi_cd01_priv *priv)
> +static int lwmi_cd_alloc(struct lwmi_cd_priv *priv)
>  {
> -       struct cd01_list *list;
> +       struct cd_list *list;
>         size_t list_size;
>         int count, ret;
>
> @@ -163,28 +166,28 @@ static int lwmi_cd01_alloc(struct lwmi_cd01_priv *p=
riv)
>  }
>
>  /**
> - * lwmi_cd01_setup() - Cache all WMI data block information
> - * @priv: lenovo-wmi-capdata01 driver data.
> + * lwmi_cd_setup() - Cache all WMI data block information
> + * @priv: lenovo-wmi-capdata driver data.
>   *
> - * Allocate a cd01_list struct large enough to contain data from all WMI=
 data
> + * Allocate a cd_list struct large enough to contain data from all WMI d=
ata
>   * blocks provided by the interface. Then loop through each data block a=
nd
>   * cache the data.
>   *
>   * Return: 0 on success, or an error code.
>   */
> -static int lwmi_cd01_setup(struct lwmi_cd01_priv *priv)
> +static int lwmi_cd_setup(struct lwmi_cd_priv *priv)
>  {
>         int ret;
>
> -       ret =3D lwmi_cd01_alloc(priv);
> +       ret =3D lwmi_cd_alloc(priv);
>         if (ret)
>                 return ret;
>
> -       return lwmi_cd01_cache(priv);
> +       return lwmi_cd_cache(priv);
>  }
>
>  /**
> - * lwmi_cd01_notifier_call() - Call method for lenovo-wmi-capdata01 driv=
er notifier.
> + * lwmi_cd01_notifier_call() - Call method for cd01 notifier.
>   * block call chain.
>   * @nb: The notifier_block registered to lenovo-wmi-events driver.
>   * @action: Unused.
> @@ -199,17 +202,17 @@ static int lwmi_cd01_notifier_call(struct notifier_=
block *nb, unsigned long acti
>                                    void *data)
>  {
>         struct acpi_bus_event *event =3D data;
> -       struct lwmi_cd01_priv *priv;
> +       struct lwmi_cd_priv *priv;
>         int ret;
>
>         if (strcmp(event->device_class, ACPI_AC_CLASS) !=3D 0)
>                 return NOTIFY_DONE;
>
> -       priv =3D container_of(nb, struct lwmi_cd01_priv, acpi_nb);
> +       priv =3D container_of(nb, struct lwmi_cd_priv, acpi_nb);
>
>         switch (event->type) {
>         case ACPI_AC_NOTIFY_STATUS:
> -               ret =3D lwmi_cd01_cache(priv);
> +               ret =3D lwmi_cd_cache(priv);
>                 if (ret)
>                         return NOTIFY_BAD;
>
> @@ -230,10 +233,9 @@ static void lwmi_cd01_unregister(void *data)
>         unregister_acpi_notifier(acpi_nb);
>  }
>
> -static int lwmi_cd01_probe(struct wmi_device *wdev, const void *context)
> -
> +static int lwmi_cd_probe(struct wmi_device *wdev, const void *context)
>  {
> -       struct lwmi_cd01_priv *priv;
> +       struct lwmi_cd_priv *priv;
>         int ret;
>
>         priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> @@ -243,7 +245,7 @@ static int lwmi_cd01_probe(struct wmi_device *wdev, c=
onst void *context)
>         priv->wdev =3D wdev;
>         dev_set_drvdata(&wdev->dev, priv);
>
> -       ret =3D lwmi_cd01_setup(priv);
> +       ret =3D lwmi_cd_setup(priv);
>         if (ret)
>                 return ret;
>
> @@ -257,27 +259,27 @@ static int lwmi_cd01_probe(struct wmi_device *wdev,=
 const void *context)
>         if (ret)
>                 return ret;
>
> -       return component_add(&wdev->dev, &lwmi_cd01_component_ops);
> +       return component_add(&wdev->dev, &lwmi_cd_component_ops);
>  }
>
> -static void lwmi_cd01_remove(struct wmi_device *wdev)
> +static void lwmi_cd_remove(struct wmi_device *wdev)
>  {
> -       component_del(&wdev->dev, &lwmi_cd01_component_ops);
> +       component_del(&wdev->dev, &lwmi_cd_component_ops);
>  }
>
> -static const struct wmi_device_id lwmi_cd01_id_table[] =3D {
> +static const struct wmi_device_id lwmi_cd_id_table[] =3D {
>         { LENOVO_CAPABILITY_DATA_01_GUID, NULL },
>         {}
>  };
>
> -static struct wmi_driver lwmi_cd01_driver =3D {
> +static struct wmi_driver lwmi_cd_driver =3D {
>         .driver =3D {
> -               .name =3D "lenovo_wmi_cd01",
> +               .name =3D "lenovo_wmi_cd",
>                 .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>         },
> -       .id_table =3D lwmi_cd01_id_table,
> -       .probe =3D lwmi_cd01_probe,
> -       .remove =3D lwmi_cd01_remove,
> +       .id_table =3D lwmi_cd_id_table,
> +       .probe =3D lwmi_cd_probe,
> +       .remove =3D lwmi_cd_remove,
>         .no_singleton =3D true,
>  };
>
> @@ -290,13 +292,13 @@ static struct wmi_driver lwmi_cd01_driver =3D {
>   */
>  int lwmi_cd01_match(struct device *dev, void *data)
>  {
> -       return dev->driver =3D=3D &lwmi_cd01_driver.driver;
> +       return dev->driver =3D=3D &lwmi_cd_driver.driver;
>  }
> -EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD01");
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd01_match, "LENOVO_WMI_CD");
>
> -module_wmi_driver(lwmi_cd01_driver);
> +module_wmi_driver(lwmi_cd_driver);
>
> -MODULE_DEVICE_TABLE(wmi, lwmi_cd01_id_table);
> +MODULE_DEVICE_TABLE(wmi, lwmi_cd_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> -MODULE_DESCRIPTION("Lenovo Capability Data 01 WMI Driver");
> +MODULE_DESCRIPTION("Lenovo Capability Data WMI Driver");
>  MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata01.h b/drivers/platfo=
rm/x86/lenovo/wmi-capdata.h
> similarity index 60%
> rename from drivers/platform/x86/lenovo/wmi-capdata01.h
> rename to drivers/platform/x86/lenovo/wmi-capdata.h
> index bd06c5751f68b..2a4746e38ad43 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata01.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -2,13 +2,13 @@
>
>  /* Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
>
> -#ifndef _LENOVO_WMI_CAPDATA01_H_
> -#define _LENOVO_WMI_CAPDATA01_H_
> +#ifndef _LENOVO_WMI_CAPDATA_H_
> +#define _LENOVO_WMI_CAPDATA_H_
>
>  #include <linux/types.h>
>
>  struct device;
> -struct cd01_list;
> +struct cd_list;
>
>  struct capdata01 {
>         u32 id;
> @@ -19,7 +19,7 @@ struct capdata01 {
>         u32 max_value;
>  };
>
> -int lwmi_cd01_get_data(struct cd01_list *list, u32 attribute_id, struct =
capdata01 *output);
> +int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata01 *output);
>  int lwmi_cd01_match(struct device *dev, void *data);
>
> -#endif /* !_LENOVO_WMI_CAPDATA01_H_ */
> +#endif /* !_LENOVO_WMI_CAPDATA_H_ */
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x=
86/lenovo/wmi-other.c
> index 2a960b278f117..c6dc1b4cff841 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -34,7 +34,7 @@
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>
> -#include "wmi-capdata01.h"
> +#include "wmi-capdata.h"
>  #include "wmi-events.h"
>  #include "wmi-gamezone.h"
>  #include "wmi-helpers.h"
> @@ -74,7 +74,10 @@ enum attribute_property {
>
>  struct lwmi_om_priv {
>         struct component_master_ops *ops;
> -       struct cd01_list *cd01_list; /* only valid after capdata01 bind *=
/
> +
> +       /* only valid after capdata bind */
> +       struct cd_list *cd01_list;
> +
>         struct device *fw_attr_dev;
>         struct kset *fw_attr_kset;
>         struct notifier_block nb;
> @@ -576,7 +579,7 @@ static void lwmi_om_fw_attr_remove(struct lwmi_om_pri=
v *priv)
>  static int lwmi_om_master_bind(struct device *dev)
>  {
>         struct lwmi_om_priv *priv =3D dev_get_drvdata(dev);
> -       struct cd01_list *tmp_list;
> +       struct cd_list *tmp_list;
>         int ret;
>
>         ret =3D component_bind_all(dev, &tmp_list);
> @@ -657,7 +660,7 @@ static struct wmi_driver lwmi_other_driver =3D {
>
>  module_wmi_driver(lwmi_other_driver);
>
> -MODULE_IMPORT_NS("LENOVO_WMI_CD01");
> +MODULE_IMPORT_NS("LENOVO_WMI_CD");
>  MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");
>  MODULE_DEVICE_TABLE(wmi, lwmi_other_id_table);
>  MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
> --
> 2.51.0
>

Looks good.

Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Cheers,
Derek

