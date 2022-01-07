Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C089E487CCB
	for <lists+platform-driver-x86@lfdr.de>; Fri,  7 Jan 2022 20:06:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbiAGTGo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 7 Jan 2022 14:06:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiAGTGn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Jan 2022 14:06:43 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60BBCC06173E
        for <platform-driver-x86@vger.kernel.org>; Fri,  7 Jan 2022 11:06:43 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id p14so5561118plf.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Jan 2022 11:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XK38nEWGLEzsJzXIOIBp5YxcT7fYEI7bXCyiq8VgcKc=;
        b=OVPh7S8sGehec+MAdzBQWqew/jRANKm1+rwmyXiVfIcyjX4DT4bWousALr3z0Ool5F
         w5tlIHIPz//xwzghHCP4cBulQ/pt/KwQVvHKWwsunavrFWQV9WV/+WdjlmzvfHoeRkVg
         3mlHw6e5HZAbxKVMqi1EjY3QSEXDAbDnE/oo9HafmoAVz5btTKFaFELQCNDTSY+jnmyG
         0i+0N1x7MtMiIG0Q9ut+LPkDujazGDC8rg5KsxKEt+Dn7nhkoQI4+U5QBSYwi79qGtxU
         LR2dCLh19XeV0t55NHm3kG6zAPcOI3QeLMR3ucRWrhE3A6heiHUpYUvbFG6WVEcIV6rx
         kMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XK38nEWGLEzsJzXIOIBp5YxcT7fYEI7bXCyiq8VgcKc=;
        b=7/x9mftcSQgeryA50K3dUhl5FYzig7GleQBoE6/e8aIvnZNZYVKnyN5ueriSuF8CiO
         p6omogiXNokKOGv6MoTtFctRtpZ8VTTW3DbFn58zL1Nf0ajVRWurLNOl2YyR9mdf5Len
         +tDL4bbI5gHBkMS+/eS2gLYEd/hRUCAe0Myx5+rSrY8bR9Q6nSkXp5j328NSoZmQkGcn
         YPCpCZi8L0+qISkdmA9EnKRBeQpnSf9g9L3guu64AEvTzgyM5gfRIkh++18Qxk4yBEG2
         l5nsXRFUwvzYp7ZrCQl/IYEbuWa8htgf2loUx+SqHJYE10oLtCU5T0Ix1XpEjESjtJP2
         hIhw==
X-Gm-Message-State: AOAM533cVTiSFTs6nOTqgb7QBrb58T6sOzypdYy1uJHdsajJgpNAIdej
        QPLRr5BYHjudexiZ2gT+fWemUQ==
X-Google-Smtp-Source: ABdhPJxFRkGo6DmstRkmZ95YMfcu+yAibwlcBaX0PWV0jE0cj0k6WskMbRCUQcUMunGNiD4jRsVIIQ==
X-Received: by 2002:a17:90a:7101:: with SMTP id h1mr17057285pjk.93.1641582402351;
        Fri, 07 Jan 2022 11:06:42 -0800 (PST)
Received: from google.com ([2620:15c:202:201:8eee:2063:e9f4:4418])
        by smtp.gmail.com with ESMTPSA id w8sm6846858pfu.162.2022.01.07.11.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 11:06:41 -0800 (PST)
Date:   Fri, 7 Jan 2022 11:06:34 -0800
From:   Benson Leung <bleung@google.com>
To:     Rajat Jain <rajatja@google.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Hans de Goede <hdegoede@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Benson Leung <bleung@chromium.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, gwendal@google.com,
        seanpaul@google.com, marcheu@google.com, dtor@google.com,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        rajatxjain@gmail.com
Subject: Re: [PATCH v5 3/3] drm/privacy_screen_x86: Add entry for ChromeOS
 privacy-screen
Message-ID: <YdiPOoU1JrqR7N6S@google.com>
References: <20220107190208.95479-1-rajatja@google.com>
 <20220107190208.95479-3-rajatja@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SAuPCbgy+7ZjMpqy"
Content-Disposition: inline
In-Reply-To: <20220107190208.95479-3-rajatja@google.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--SAuPCbgy+7ZjMpqy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rajat,=20

Thanks for your changes here.

On Fri, Jan 07, 2022 at 11:02:08AM -0800, Rajat Jain wrote:
> Add a static entry in the x86 table, to detect and wait for
> privacy-screen on some ChromeOS platforms.
>=20
> Please note that this means that if CONFIG_CHROMEOS_PRIVACY_SCREEN is
> enabled, and if "GOOG0010" device is found in ACPI, then the i915 probe
> shall return EPROBE_DEFER until a platform driver actually registers the
> privacy-screen: https://hansdegoede.livejournal.com/25948.html
>=20
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Hi Hans,

Since this change depends on the privacy screen changes staged for v5.17,
I'm OK as platform/chrome maintainer to have this go through the drm tree.

Acked-By: Benson Leung <bleung@chromium.org>


> ---
> v5: * Add Hans' "Reviewed by"
> v4: * Simplify the detect_chromeos_privacy_screen() function
>     * Don't change the existing print statement
> v3: * Remove the pr_info() from detect_chromeos_privacy_screen(), instead
>       enhance the one already present in drm_privacy_screen_lookup_init()
> v2: * Use #if instead of #elif
>     * Reorder the patches in the series.
>     * Rebased on drm-tip
>=20
>  drivers/gpu/drm/drm_privacy_screen_x86.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_privacy_screen_x86.c b/drivers/gpu/drm/d=
rm_privacy_screen_x86.c
> index a2cafb294ca6..88802cd7a1ee 100644
> --- a/drivers/gpu/drm/drm_privacy_screen_x86.c
> +++ b/drivers/gpu/drm/drm_privacy_screen_x86.c
> @@ -47,6 +47,13 @@ static bool __init detect_thinkpad_privacy_screen(void)
>  }
>  #endif
> =20
> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> +static bool __init detect_chromeos_privacy_screen(void)
> +{
> +	return acpi_dev_present("GOOG0010", NULL, -1);
> +}
> +#endif
> +
>  static const struct arch_init_data arch_init_data[] __initconst =3D {
>  #if IS_ENABLED(CONFIG_THINKPAD_ACPI)
>  	{
> @@ -58,6 +65,16 @@ static const struct arch_init_data arch_init_data[] __=
initconst =3D {
>  		.detect =3D detect_thinkpad_privacy_screen,
>  	},
>  #endif
> +#if IS_ENABLED(CONFIG_CHROMEOS_PRIVACY_SCREEN)
> +	{
> +		.lookup =3D {
> +			.dev_id =3D NULL,
> +			.con_id =3D NULL,
> +			.provider =3D "privacy_screen-GOOG0010:00",
> +		},
> +		.detect =3D detect_chromeos_privacy_screen,
> +	},
> +#endif
>  };
> =20
>  void __init drm_privacy_screen_lookup_init(void)
> --=20
> 2.34.1.575.g55b058a8bb-goog
>=20

--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org

--SAuPCbgy+7ZjMpqy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCYdiPOgAKCRBzbaomhzOw
wg8YAP4xrCF3D8eM0fsgcwvq+M2ayWQ5fm+3/zAIrfMylKaPQQD+OiNUiPRqDw0P
x1zbuO8yDt6RDSvJfvU6fABa2OXRRgk=
=b3qU
-----END PGP SIGNATURE-----

--SAuPCbgy+7ZjMpqy--
