Return-Path: <platform-driver-x86+bounces-15082-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D69DC22EE3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Oct 2025 02:58:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22F0C189CCA0
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Oct 2025 01:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0110A26ED2C;
	Fri, 31 Oct 2025 01:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyLxOOFH"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991D1A0BD6
	for <platform-driver-x86@vger.kernel.org>; Fri, 31 Oct 2025 01:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761875879; cv=none; b=Y3z6Gq9vol6jU5nI/Bv0NpytJw2gIaN+502bsWbNeipMjmlvVqfOQ6/MqNSNAg0QegqzuGmnpZtJxgn241X+XNdm7XUlRyfrFqi7aNW9G0yxNlcfrcVIr2pTJPnNdsWvuGhvmjPRFTQpdZOw7vdcpYN8tzH++/S5WN5R+zHg6EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761875879; c=relaxed/simple;
	bh=yr8MP7p+jjdx+agjZ8FgrTQ5C2twERW6EBC0sYxV41I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PYCqrDpahNIz+nyH2Lovc7qeWZWenmk4g6EHRdqB1v/e0+Y9a3JvTdOfj8mJd3j63o0z1dvh8Xv3bw8YjpRsKjJ5L+gjYUV/R9pPfmj/fXDGWtUC6v2zATJcH1BnpYaN3j6kCdUl9pJwYhAivr5sWWx5V0zPam1oguYZM77I+5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyLxOOFH; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-88025eb208bso10040606d6.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Oct 2025 18:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761875876; x=1762480676; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NydIUUPp7RjIJEi6qKcWiWxm+IyecLnbv0JjDYqVLc=;
        b=KyLxOOFHRMlGipTF4HFXeJSzV1Wu45TPYyrhlhRNVZTVmSyClDO5OW5gLZH68Q5rTG
         xX1/I1JJijN2rYYCCcSo85IgGcDNrvcorNK15ON+N+YPZBZGgP6U86q5SDFMcb5sR/IQ
         j/Bnc+Rv24qxCQdig65mQ8T3uEzZrhajwTezqxdaEq62mDTLS+K4ybO8AoYmgaa1H7FM
         6ODoH+HyyCZnWB2Kd0smvyl73Wv4dM455cBX4jZCgpRRuW418Kas9XCy5sh4G93aLLNa
         abqPhYjdcpyh6pJxAJ3qsmvT90KKHr9+UqpC2ZmNTcf0oq0Fiyw+fhN6p+aC9C4bbCin
         lh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761875876; x=1762480676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NydIUUPp7RjIJEi6qKcWiWxm+IyecLnbv0JjDYqVLc=;
        b=cgKZ0us3mvwqMWs6KHZ+QKM7nKfXPwcom7FnLvicPu6AnIl7GYcGIOBBtmozy2HC/m
         jL950EUdOUNTDYove7hlfhl2pthcqACSMq0hPRYHwKbjkcSsHpLY7LkSRShwKZkB0BA1
         9QGSagpKzyUwR97nPu913YwB2zSCpc1CVsCM/eMuS/oZrtb8S/zODTYrMtgH/8mTEPTR
         l5bwXOMrdMhK9lX3RDqXcFhzDKMYG2/KIyoj9b+cR5Gia9AP1V53y5uZl7JBh3ZsUB4+
         nUfsrkzlVeI7HtD8rgzXZ9KfKm6Q0uxULLjVi7ZLbZTQMeY1g7nlsdTjFIwcdhvPDsyF
         yAPg==
X-Forwarded-Encrypted: i=1; AJvYcCUjYh4lHfIo+cB7n587rvcxgzCdfX0zCR377VJTDN7JWVk3XFFWPq/Y+Q4kj+RxODfFH/JTdNSEelSvBKS/FahEgkhu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyug1B7v6YRi/u4Bz5BMWpNrC1zjdaY+6HVzOIPE/V252zMwxB1
	v1c9wGrR40luwhD2QRQDeQ40MFe/4Q1bDYLHsu7Gix6tmHrOm7cVcVSLCbAlb923TTBXJxhzaxE
	Dp9sZi2bjeivmDDcgmOy5MZyShuWcnZk=
X-Gm-Gg: ASbGncsdNPCtrcmqN/O/FaqA6ogobotyrZIMKIm7/igGUT8ETNrxu0a+Yyjn+5Sm+wN
	OJjKzp1iFvV7f9Am4JORNa7mqTfUzdMhNCJTuTjtmPnhLRWMI14sC7EZwYchQ0G1bvyTgwsx7ui
	r6A0IkkY/gL2uUhHWUG+jVAtaz7bSBQLGNL0DZ2atmRJ6/pQS0vma4Dj4WWNjVnsDGxDcNJ+yE4
	j9+hvf77e+W39WvKq6S+QI72eulI+lpaDFpzV0i4d0zlA/U4ASA7SmycSnwhhlN68IFEhdG
X-Google-Smtp-Source: AGHT+IHlr3c2W0lDagr2M9e9A/fEv0AO197t6FvrREVHzEb08Z7OXctzJJcLEmBJ5EevKoMSC2Wv/nj0njWCWZfvo/E=
X-Received: by 2002:a05:6214:e45:b0:87c:20b5:6685 with SMTP id
 6a1803df08f44-8802f4f8ea0mr23984976d6.55.1761875875667; Thu, 30 Oct 2025
 18:57:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030193955.107148-1-i@rong.moe> <20251030193955.107148-5-i@rong.moe>
In-Reply-To: <20251030193955.107148-5-i@rong.moe>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Thu, 30 Oct 2025 18:57:43 -0700
X-Gm-Features: AWmQ_bn-AIi4gE6Y-Pb2E0kg3kci2PE35xtLOckfD8iQ3HAPH4jqsW5Ib1S7Ldw
Message-ID: <CAFqHKTnNvjdQRGe6n_vEzO6b=cSyZUWmSe=5TrAby9KfcynH9w@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] platform/x86: lenovo-wmi-capdata: Add support for
 Capability Data 00
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 30, 2025 at 12:40=E2=80=AFPM Rong Zhang <i@rong.moe> wrote:
>
> Add support for LENOVO_CAPABILITY_DATA_00 WMI data block that comes on
> "Other Mode" enabled hardware. Provides an interface for querying if a
> given attribute is supported by the hardware, as well as its default
> value.
>
> Signed-off-by: Rong Zhang <i@rong.moe>
> ---
> Changes in v2:
> - Reword documentation (thanks Derek J. Clark)
> ---
>  .../wmi/devices/lenovo-wmi-other.rst          | 15 ++++++++++---
>  drivers/platform/x86/lenovo/wmi-capdata.c     | 21 +++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-capdata.h     |  8 +++++++
>  3 files changed, 41 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentati=
on/wmi/devices/lenovo-wmi-other.rst
> index d7928b8dfb4b5..fcad595d49af2 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -31,13 +31,22 @@ under the following path:
>
>    /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>=
/
>
> +LENOVO_CAPABILITY_DATA_00
> +-------------------------
> +
> +WMI GUID ``362A3AFE-3D96-4665-8530-96DAD5BB300E``
> +
> +The LENOVO_CAPABILITY_DATA_00 interface provides various information tha=
t
> +does not rely on the gamezone thermal mode.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>
>  WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
>
> -The LENOVO_CAPABILITY_DATA_01 interface provides information on various
> -power limits of integrated CPU and GPU components.
> +The LENOVO_CAPABILITY_DATA_01 interface provides various information tha=
t
> +relies on the gamezone thermal mode, including power limits of integrate=
d
> +CPU and GPU components.
>
>  Each attribute has the following properties:
>   - current_value
> @@ -48,7 +57,7 @@ Each attribute has the following properties:
>   - scalar_increment
>   - type
>
> -The following attributes are implemented:
> +The following firmware-attributes are implemented:
>   - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
>   - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
>   - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.c b/drivers/platform=
/x86/lenovo/wmi-capdata.c
> index 1f7fc09b7c3f3..e8ec30701d883 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.c
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.c
> @@ -5,6 +5,9 @@
>   * Lenovo Capability Data provides information on tunable attributes use=
d by
>   * the "Other Mode" WMI interface.
>   *
> + * Capability Data 00 includes if the attribute is supported by the hard=
ware,
> + * and the default_value. All attributes are independent of thermal mode=
s.
> + *
>   * Capability Data 01 includes if the attribute is supported by the hard=
ware,
>   * and the default_value, max_value, min_value, and step increment. Each
>   * attribute has multiple pages, one for each of the thermal modes manag=
ed by
> @@ -36,12 +39,14 @@
>
>  #include "wmi-capdata.h"
>
> +#define LENOVO_CAPABILITY_DATA_00_GUID "362A3AFE-3D96-4665-8530-96DAD5BB=
300E"
>  #define LENOVO_CAPABILITY_DATA_01_GUID "7A8F5407-CB67-4D6E-B547-39B3BE01=
8154"
>
>  #define ACPI_AC_CLASS "ac_adapter"
>  #define ACPI_AC_NOTIFY_STATUS 0x80
>
>  enum lwmi_cd_type {
> +       LENOVO_CAPABILITY_DATA_00,
>         LENOVO_CAPABILITY_DATA_01,
>  };
>
> @@ -57,6 +62,7 @@ static const struct lwmi_cd_info {
>         const char *name;
>         enum lwmi_cd_type type;
>  } lwmi_cd_table[] =3D {
> +       LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_00),
>         LWMI_CD_TABLE_ITEM(LENOVO_CAPABILITY_DATA_01),
>  };
>
> @@ -72,6 +78,7 @@ struct cd_list {
>         u8 count;
>
>         union {
> +               DECLARE_FLEX_ARRAY(struct capdata00, cd00);
>                 DECLARE_FLEX_ARRAY(struct capdata01, cd01);
>         };
>  };
> @@ -95,6 +102,9 @@ static int lwmi_cd_component_bind(struct device *cd_de=
v,
>         struct lwmi_cd_binder *binder =3D data;
>
>         switch (priv->list->type) {
> +       case LENOVO_CAPABILITY_DATA_00:
> +               binder->cd00_list =3D priv->list;
> +               break;
>         case LENOVO_CAPABILITY_DATA_01:
>                 binder->cd01_list =3D priv->list;
>                 break;
> @@ -136,6 +146,9 @@ static const struct component_ops lwmi_cd_component_o=
ps =3D {
>                 return -EINVAL;                                          =
                       \
>         }
>
> +DEF_LWMI_CDXX_GET_DATA(cd00, LENOVO_CAPABILITY_DATA_00, struct capdata00=
);
> +EXPORT_SYMBOL_NS_GPL(lwmi_cd00_get_data, "LENOVO_WMI_CD");
> +
>  DEF_LWMI_CDXX_GET_DATA(cd01, LENOVO_CAPABILITY_DATA_01, struct capdata01=
);
>  EXPORT_SYMBOL_NS_GPL(lwmi_cd01_get_data, "LENOVO_WMI_CD");
>
> @@ -154,6 +167,10 @@ static int lwmi_cd_cache(struct lwmi_cd_priv *priv)
>         void *p;
>
>         switch (priv->list->type) {
> +       case LENOVO_CAPABILITY_DATA_00:
> +               p =3D &priv->list->cd00[0];
> +               size =3D sizeof(priv->list->cd00[0]);
> +               break;
>         case LENOVO_CAPABILITY_DATA_01:
>                 p =3D &priv->list->cd01[0];
>                 size =3D sizeof(priv->list->cd01[0]);
> @@ -199,6 +216,9 @@ static int lwmi_cd_alloc(struct lwmi_cd_priv *priv, e=
num lwmi_cd_type type)
>         count =3D wmidev_instance_count(priv->wdev);
>
>         switch (type) {
> +       case LENOVO_CAPABILITY_DATA_00:
> +               list_size =3D struct_size(list, cd00, count);
> +               break;
>         case LENOVO_CAPABILITY_DATA_01:
>                 list_size =3D struct_size(list, cd01, count);
>                 break;
> @@ -346,6 +366,7 @@ static void lwmi_cd_remove(struct wmi_device *wdev)
>         .context =3D &lwmi_cd_table[_type]
>
>  static const struct wmi_device_id lwmi_cd_id_table[] =3D {
> +       { LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_00) },
>         { LWMI_CD_WDEV_ID(LENOVO_CAPABILITY_DATA_01) },
>         {}
>  };
> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platform=
/x86/lenovo/wmi-capdata.h
> index 1e5fce7836cbf..a6f0cb006e745 100644
> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> @@ -11,6 +11,12 @@ struct component_match;
>  struct device;
>  struct cd_list;
>
> +struct capdata00 {
> +       u32 id;
> +       u32 supported;
> +       u32 default_value;
> +};
> +
>  struct capdata01 {
>         u32 id;
>         u32 supported;
> @@ -21,9 +27,11 @@ struct capdata01 {
>  };
>
>  struct lwmi_cd_binder {
> +       struct cd_list *cd00_list;
>         struct cd_list *cd01_list;
>  };
>
> +int lwmi_cd00_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata00 *output);
>  int lwmi_cd01_get_data(struct cd_list *list, u32 attribute_id, struct ca=
pdata01 *output);
>  void lwmi_cd_match_add_all(struct device *master, struct component_match=
 **matchptr);
>
> --
> 2.51.0
>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>

Thanks,
Derek

