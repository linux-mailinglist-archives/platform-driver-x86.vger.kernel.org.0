Return-Path: <platform-driver-x86+bounces-12917-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFB3AE63AB
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 13:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F31054C1438
	for <lists+platform-driver-x86@lfdr.de>; Tue, 24 Jun 2025 11:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3948D283FF4;
	Tue, 24 Jun 2025 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="by7cf22X"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C151B87D9;
	Tue, 24 Jun 2025 11:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765006; cv=none; b=iCGRCp0yOEp8qnpAXWa3xNCSPaf4RvF9jMi6pzOb5ddZatKrqIElMvqbuCNUNplz7euj4iuFYZhsxPA2BXyzrGVl0xtvs3Qr7EI133mprtgBsocuROFRa/8/nbJZT459/zAZB4OV3oRjYpAUHnnzJE7INyMORFhHan/fydKa3u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765006; c=relaxed/simple;
	bh=0QPLj8k1RfrRJykPno6tnMdX52dcMJxf3LHllaynLDw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iEdpCWnqJFDlFNJROpOR4TiIM5IxUlF2r2F/iVq7xdTo8UrMdPIeucMDD9aNHLCq8zx3F+64k1rf0YRY7vr5UvO2hFl38owik6yxXDTXU8fw8R064ckHb54+93W1AxO9aVCnZ+92hqoW4PxK2IrCD1b0IWvXIMyP/SKU4MRnrU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=by7cf22X; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750765005; x=1782301005;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=0QPLj8k1RfrRJykPno6tnMdX52dcMJxf3LHllaynLDw=;
  b=by7cf22XaEy+fw2+Lrqw6U3dTmwCd2mAXOkp9GpcSiaUa92m1nlI8+co
   kDFOygCGglG/c33BWFZpytdbwo5EzMLNqlcpG5epqpZ9UzEtf7FjuT0Vt
   faPSXLb/97Nn0SPHMKyxjhnvgLmAZ2ssrseJYVw1vNrsi10BGCjgKZpxX
   xjw3U3o512ns3DWiKSDrdh2t+WbgbhlcPOV1XV0oR6dw7+OoMsgWRxfp7
   K+nY+LAKaIuve4w9t3Q1YrOnzeWEMGz8sn3KBonvaIFTQRl6KxnIoOoNm
   S3ci+NU4eP6i3G/pNNtjWY2ZKKMCa0rKPVn2+SiXp9doGi7+4WwpCCJFu
   g==;
X-CSE-ConnectionGUID: q5UCm5PySaSvLiPLej/Jdg==
X-CSE-MsgGUID: j7TPNPFNR2+oOKVNnSVWPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="75537674"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="75537674"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:36:44 -0700
X-CSE-ConnectionGUID: ZHCD7C6DTR2lmQR8qI5exA==
X-CSE-MsgGUID: 7CPkk997S2yicYNRtR1V4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="156185875"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.16])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 04:36:37 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 24 Jun 2025 14:36:34 +0300 (EEST)
To: Thomas Zimmermann <tzimmermann@suse.de>
cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
    neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com, 
    maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com, 
    simona@ffwll.ch, fnkl.kernel@gmail.com, j@jannau.net, 
    Hans de Goede <hdegoede@redhat.com>, sven@kernel.org, alyssa@rosenzweig.io, 
    neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com, 
    duje.mihanovic@skole.hr, dri-devel@lists.freedesktop.org, 
    asahi@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 01/12] platform/x86: dell-uart-backlight: Use blacklight
 power constant
In-Reply-To: <20250618122436.379013-2-tzimmermann@suse.de>
Message-ID: <63e0be02-f7b5-2b14-d858-6b66d0a51bd2@linux.intel.com>
References: <20250618122436.379013-1-tzimmermann@suse.de> <20250618122436.379013-2-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-584399545-1750764994=:943"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-584399545-1750764994=:943
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 18 Jun 2025, Thomas Zimmermann wrote:

> The backlight subsystem has gotten its own power constants. Replace
> FB_BLANK_UNBLANK with BACKLIGHT_POWER_ON.
>=20
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/platform/x86/dell/dell-uart-backlight.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/pl=
atform/x86/dell/dell-uart-backlight.c
> index 8f868f845350..f323a667dc2d 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -305,7 +305,7 @@ static int dell_uart_bl_serdev_probe(struct serdev_de=
vice *serdev)
>  =09dev_dbg(dev, "Firmware version: %.*s\n", resp[RESP_LEN] - 3, resp + R=
ESP_DATA);
> =20
>  =09/* Initialize bl_power to a known value */
> -=09ret =3D dell_uart_set_bl_power(dell_bl, FB_BLANK_UNBLANK);
> +=09ret =3D dell_uart_set_bl_power(dell_bl, BACKLIGHT_POWER_ON);
>  =09if (ret)
>  =09=09return ret;

Acked-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-584399545-1750764994=:943--

