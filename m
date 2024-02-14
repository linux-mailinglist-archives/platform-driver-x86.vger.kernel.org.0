Return-Path: <platform-driver-x86+bounces-1367-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 045E8854D17
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Feb 2024 16:40:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80F1B1F211E1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 14 Feb 2024 15:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 434DC5D729;
	Wed, 14 Feb 2024 15:40:14 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832095CDC0
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707925214; cv=none; b=gmRT5yVaNjB2vvaDaKwxjmCAdNAcIN54NGXTJl3Qwzw9Wj72rto5wjV0OXn633RdrH4cdfIYb8kGKUSxsftXIhrCpU2vj0NihDN82seQK44cojisdxFDsrJILLXjCkZx0VInuudkefzgZDuFg5KIBzgPV8YLzWHuRv/GB1Ky6Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707925214; c=relaxed/simple;
	bh=IJtX05QW0nQKRcPnm3iLNiCzyKEnHL7imlVUc5FCkQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z8crOVg8qw+4/79iHryHGghLPls9cl0DfZfPjzGAxnPk5Dx3e7WRnwUI2n/4TG0peWocgvR99qiovjKG12C2riCLAM8rX3zRgcSCZHB3gOpBIZC3GZfqH7ucQMYaHNGymiYaErthb6CBXsIQmVp6cHWh4TeQMXi08P2SflUrCbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raHMY-0002r6-Qc; Wed, 14 Feb 2024 16:39:54 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raHMX-000iZF-Ji; Wed, 14 Feb 2024 16:39:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raHMX-004ljH-1g;
	Wed, 14 Feb 2024 16:39:53 +0100
Date: Wed, 14 Feb 2024 16:39:53 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pwm@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v6 067/164] pwm: lpss-*: Make use of devm_pwmchip_alloc()
 function
Message-ID: <hxw7ux7itwwjxibabdsvv6aeqwy5g3ukulga4yopedcsyzzx2c@luxwe252wi67>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
 <b567ab5dd992e361eb884fa6c2cac11be9c7dde3.1707900770.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uu6npquqlmcaxxi"
Content-Disposition: inline
In-Reply-To: <b567ab5dd992e361eb884fa6c2cac11be9c7dde3.1707900770.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: platform-driver-x86@vger.kernel.org


--4uu6npquqlmcaxxi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 14, 2024 at 10:31:54AM +0100, Uwe Kleine-K=F6nig wrote:
> @@ -256,9 +257,10 @@ struct pwm_lpss_chip *devm_pwm_lpss_probe(struct dev=
ice *dev, void __iomem *base
>  	if (WARN_ON(info->npwm > LPSS_MAX_PWMS))
>  		return ERR_PTR(-ENODEV);
> =20
> -	lpwm =3D devm_kzalloc(dev, sizeof(*lpwm), GFP_KERNEL);
> -	if (!lpwm)
> +	chip =3D devm_pwmchip_alloc(dev, info->npwm, sizeof(*lpwm));
> +	if (!chip)
>  		return ERR_PTR(-ENOMEM);

while adapting the patch for Andy's feedback I noticed this being wrong,
devm_pwmchip_alloc() returns an error pointer and not NULL on failure.
I'll squash the following change into the commit:

diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index 3247b420b67a..867e2bc8c601 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -258,8 +258,8 @@ struct pwm_chip *devm_pwm_lpss_probe(struct device *dev=
, void __iomem *base,
 		return ERR_PTR(-ENODEV);
=20
 	chip =3D devm_pwmchip_alloc(dev, info->npwm, sizeof(*lpwm));
-	if (!chip)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(chip))
+		return chip;
 	lpwm =3D to_lpwm(chip);
=20
 	lpwm->regs =3D base;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4uu6npquqlmcaxxi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXM3sgACgkQj4D7WH0S
/k6FEAf/WJitLmiyFH9mVDvuHkRvEHuk4HsFnvpbkfUfEPhHbZuwZ9vlBzV9jktB
Y/9q2HuFvlHWFUJGeL2HsXvDNyzCt3pLMy2jLBrIKgx0Gzr0pKQITRk2t4QTSmnw
yjGYIA5lg7MGAT5MllxF8Cfh3+YlTdDmLjSSoukgFmicjQ22y0nx4V9g5+9PS2az
c/EKU3Oc066slUwFJxIwFI/vqHECpfXK3ijatZU4XHVpmRTXRc3beX3bV2aGpRRL
37b8b9xiqlkNfOuX9MSGiXwM973JwufUV6NQwqGf/Obm9D3xx8RIblcZzd2DbH89
dPql5W1S5c+c6ZVocb5MSPJKKwdp/g==
=Mu9B
-----END PGP SIGNATURE-----

--4uu6npquqlmcaxxi--

