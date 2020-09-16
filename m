Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B2A26C09A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 11:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgIPJbv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 05:31:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:56987 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726369AbgIPJbZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 05:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600248680;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=bg9fHcU5a54AjLGu+3FPDu3LQsHTdhp0JEHRLYc9siA=;
        b=CWNKhoe9bghqNg7sE/pIloT/E/sNzzgC4Bac6GEiLsLtf2kG7eI1x1zS22fhsZYiabVUjZ
        ARqy4Vxi48kAuF4KA4xCVovCBS0zB1BhBUgRoa9Sjl9oIcsDa4IbrIj3b67vPGEcYGzxgB
        dCp9wc9a9nQdsyX/uS3d36GrahKsxL4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-pNLQrkmKMEOyvk8_umGEgA-1; Wed, 16 Sep 2020 05:31:16 -0400
X-MC-Unique: pNLQrkmKMEOyvk8_umGEgA-1
Received: by mail-wr1-f70.google.com with SMTP id i10so2311756wrq.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 02:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=bg9fHcU5a54AjLGu+3FPDu3LQsHTdhp0JEHRLYc9siA=;
        b=KIgeehSaXZC+baxRu1OnjTi8Q5m+mCEm4BkrJ5N3L+wB7JnH439bl511gY5sdYv2mq
         X/gLFsf8QjUzcZQ251y7mCxCEXOFl6lo2sARmC+sRG+XEsmRIZwYzZYsCx0/kVYjtKFS
         o1qApvdmbnxH2S87m3bPR/H3bQPrmvg4lf3MQXpZntAMNkrFPrF+k0KkxjBwFnfaD2Xe
         6mFcYYOkR00ToZ5CHrtLdRefafpVG2GROMARDNriV8CHVBegSSGya7g8yjs4xn1gHD8s
         xWzPXUK6518wUpdYzZInXUtCU0WhEzoeE1Zr7xrt5bsbJSIdcyoTCl4cfjfG2p1krD+e
         M3mg==
X-Gm-Message-State: AOAM532nPHabufYV2dnxrwq4bu5v9Af+RB8UjrT8NGEMXfFXcIz+wy8G
        cXFDu+PJq+HZM1jvt/dQvYAhsxeGd3dBXSuAH+TGr7y/GFUxrr/DIoKWzesT2Cw0bm8HP/eLkLJ
        k8IVKsgHnQmO8RWnrC9O4a45PZHJ39MK+YQ==
X-Received: by 2002:a05:600c:410e:: with SMTP id j14mr3914236wmi.13.1600248674294;
        Wed, 16 Sep 2020 02:31:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy3xbKmHPPW5XuLtaiIB0Hzey3PHfNgnFsX1W6gb2dry/KtSBlrVNYuXcD1FSkqgIc1LOKL6A==
X-Received: by 2002:a05:600c:410e:: with SMTP id j14mr3914192wmi.13.1600248673831;
        Wed, 16 Sep 2020 02:31:13 -0700 (PDT)
Received: from ben-x1c7.lan (200116b826556cf00000000000000185.dip.versatel-1u1.de. [2001:16b8:2655:6cf0::185])
        by smtp.gmail.com with ESMTPSA id t17sm7639440wrx.82.2020.09.16.02.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 02:31:13 -0700 (PDT)
Message-ID: <11594528cfb96e2eed8fe0f27a4ecc1d60803432.camel@redhat.com>
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: performance mode
 interface
From:   Benjamin Berg <bberg@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, ibm-acpi@hmh.eng.br,
        bnocera@redhat.com, mario.limonciello@dell.com,
        Nitin Joshi <njoshi1@lenovo.com>
Date:   Wed, 16 Sep 2020 11:31:04 +0200
In-Reply-To: <20200821175310.335873-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
         <20200821175310.335873-1-markpearson@lenovo.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-Eimsjun+JO+oL5GXfRGX"
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


--=-Eimsjun+JO+oL5GXfRGX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

On Fri, 2020-08-21 at 13:53 -0400, Mark Pearson wrote:
> +		H  - High performance mode. Maximum power and temperature available.
> +		M* - High performance mode but performance is limited to medium as sys=
tem is
> +		     in lapmode. Power and temperature maximums reduced to a safe thre=
shold.
> +		M  - Medium performance mode (aka 'balance'). Lower maximum power and =
temperatures
> +		     but better battery life.
> +		L  - Low performance mode (aka 'quiet'). Reduced power setting gives l=
ower
> +		     temperatures and extended battery life. Fans run quieter.

I tested the patch yesterday and I see some minor issues right now.

First, right now change notifications do not happen for a lapmode
change. The sysfs file will switch between "H" and "M*" without any
notification. This will be an easy fix.

Second, I personally see the current "M*" more as a degraded
performance mode rather than an effective balanced mode. For example, H
and M* match in the sense that the machine will be more noisy as fans
are turned on more aggressively.

Third, we still have a mismatch when writing the file. i.e. you write
"H" but you will read "M*".

So, I am thinking of using H* instead. That means we directly represent
the firmwares performance mode rather than making an interpretation
about an "effective" state. And with the * we continue to convey that
there is a major impact on performance due to other factors.

Benjamin

> +What:		/sys/devices/platform/thinkpad_acpi/dytc_lapmod
> e
> +Date:		August 2020
> +Contact:	Mark Pearson <markpearson@lenovo.com>
> +Description:
> +		Reads returns the current value of the lapmode sensor.
> +
> +		0 - desk mode is detected
> +		1 - lap mode is detected
> +
> +What:		/sys/devices/platform/thinkpad_acpi/psensor_sta
> te
> +Date:		August 2020
> +Contact:	Nitin Joshi <njoshi1@lenovo.com>
> +Description:
> +		Reads returns the current value of the palm sensor.
> +
> +		0 - palm not detected
> +		1 - palm detected
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 6b57c52d8f13..b98f0de9e063 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -52,6 +52,7 @@ detailed description):
>  	- LCD Shadow (PrivacyGuard) enable and disable
>  	- Lap mode sensor
>          - Palm sensor (aka psensor)
> +	- Thermal mode status and control
> =20
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1465,6 +1466,40 @@ Note - some platforms have a limitation
> whereby the EC firmware cannot
>  determine if the sensor is installed or not. On these platforms the
> psensor
>  state will always be reported as true to avoid high power being used
> incorrectly.
> =20
> +DYTC Thermal mode status and control
> +------------------------------------
> +
> +sysfs: dytc_perfmode
> +
> +Lenovo Thinkpad platforms with DYTC version 5 and newer have
> enhanced firmware to
> +provide improved performance control.
> +
> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to
> switch the
> +operating mode between three different modes. This sysfs node
> provides a better
> +interface for user space to use.
> +
> +The modes available are:
> +
> +H - High performance. Maximum power is available and the temperature
> is
> +allowed to increase to the maximum for the platform.
> +
> +M - Medium performance (aka balance). In this mode power will be
> limited and
> +the laptop will remain cooler.
> +
> +L - Low performance (aka quiet). In this mode power consumption is
> reduced and
> +the device will be cooler and quieter.
> +
> +Note: High performance mode is only available when the device is in
> 'deskmode'. If
> +the device detects that it is on a lap then it will automatically
> drop into medium
> +mode to maintain a safer operating temperature.
> +
> +The sysfs entry provides the ability to return the current status
> and to set the
> +desired mode. For example::
> +
> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +
>  EXPERIMENTAL: UWB
>  -----------------
> =20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 41b75dd4755c..8fcb660aa5a2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9817,18 +9817,43 @@ static struct ibm_struct
> lcdshadow_driver_data =3D {
>  };
> =20
>  /*******************************************************************
> ******
> - * DYTC subdriver, for the Lenovo lapmode feature
> + * DYTC subdriver, for the Lenovo lap and performance mode feature
>   */
> =20
> +#define DYTC_CMD_QUERY        0 /* To get DYTC status -
> enable/revision */
> +#define DYTC_CMD_SET          1 /* To enable/disable IC function
> mode */
>  #define DYTC_CMD_GET          2 /* To get current IC function and
> mode */
> -#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> +#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
> =20
> -static bool dytc_lapmode;
> +#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 =3D disabled, 1 =3D
> enabled */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> =20
> -static void dytc_lapmode_notify_change(void)
> -{
> -	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> -}
> +#define DYTC_GET_FUNCTION_BIT 8  /* Bits 8-11 - function setting */
> +#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> +#define DYTC_GET_LAPMODE_BIT  17 /* Bit 17 - lapmode. Set when on
> lap */
> +
> +#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - funct setting */
> +#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
> +#define DYTC_SET_VALID_BIT    20 /* Bit 20 - 1 =3D on, 0 =3D off */
> +
> +#define DYTC_FUNCTION_STD     0  /* Function =3D 0, standard mode */
> +#define DYTC_FUNCTION_CQL     1  /* Function =3D 1, lap mode */
> +#define DYTC_FUNCTION_MMC     11 /* Function =3D 11, desk mode */
> +
> +#define DYTC_MODE_PERFORM     2  /* High power mode aka performance
> */
> +#define DYTC_MODE_QUIET       3  /* low power mode aka quiet */
> +#define DYTC_MODE_BALANCE   0xF  /* default mode aka balance */
> +
> +#define DYTC_DISABLE_CQL ((DYTC_MODE_BALANCE << DYTC_SET_MODE_BIT) |
> \
> +		(DYTC_FUNCTION_CQL << DYTC_SET_FUNCTION_BIT) | \
> +		DYTC_CMD_SET)
> +#define DYTC_ENABLE_CQL (DYTC_DISABLE_CQL | (1 <<
> DYTC_SET_VALID_BIT))
> +
> +static bool dytc_lapmode;
> +static int  dytc_perfmode;
> +static bool dytc_available;
> +static bool dytc_ignore_next_event;
> =20
>  static int dytc_command(int command, int *output)
>  {
> @@ -9843,6 +9868,87 @@ static int dytc_command(int command, int
> *output)
>  	return 0;
>  }
> =20
> +static int dytc_perfmode_get(int *perfmode, int *funcmode)
> +{
> +	int output, err;
> +
> +	if (!dytc_available)
> +		return -ENODEV;
> +
> +	err =3D dytc_command(DYTC_CMD_GET, &output);
> +	if (err)
> +		return err;
> +	*funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +
> +	if (*funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +		int dummy;
> +		/*
> +		 * We can't get the mode when in CQL mode - so we
> disable CQL
> +		 * mode retrieve the mode and then enable it again.
> +		 * As disabling/enabling CQL triggers an event we set a
> flag to
> +		 * ignore these events. This will be cleared by the
> event handler
> +		 */
> +		dytc_ignore_next_event =3D true;
> +		err =3D dytc_command(DYTC_DISABLE_CQL, &dummy);
> +		if (err)
> +			return err;
> +		err =3D dytc_command(DYTC_CMD_GET, &output);
> +		if (err)
> +			return err;
> +		/* Again ignore this event */
> +		dytc_ignore_next_event =3D true;
> +		err =3D dytc_command(DYTC_ENABLE_CQL, &dummy);
> +		if (err)
> +			return err;
> +	}
> +	*perfmode =3D (output >> DYTC_GET_MODE_BIT) & 0xF;
> +	return 0;
> +}
> +
> +static int dytc_perfmode_set(int perfmode)
> +{
> +	int err, dytc_set;
> +	int output;
> +	int cur_perfmode, cur_funcmode;
> +
> +	if (!dytc_available)
> +		return -ENODEV;
> +
> +	if (perfmode =3D=3D DYTC_MODE_BALANCE) {
> +		/* To get back to balance mode we just issue a reset
> command */
> +		err =3D dytc_command(DYTC_CMD_RESET, &output);
> +		if (err)
> +			return err;
> +	} else {
> +		/* Determine if we are in CQL mode. This alters the
> commands we do */
> +		err =3D dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
> +		if (err)
> +			return err;
> +
> +		if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +			/* To set the mode we need to disable CQL
> first*/
> +			dytc_ignore_next_event =3D true; /*ignore event*/
> +			err =3D dytc_command(DYTC_DISABLE_CQL, &output);
> +			if (err)
> +				return err;
> +		}
> +		dytc_set =3D (1 << DYTC_SET_VALID_BIT) |
> +			(DYTC_FUNCTION_MMC << DYTC_SET_FUNCTION_BIT) |
> +			(perfmode << DYTC_SET_MODE_BIT) |
> +			DYTC_CMD_SET;
> +		err =3D dytc_command(dytc_set, &output);
> +		if (err)
> +			return err;
> +		if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +			dytc_ignore_next_event =3D true; /*ignore event*/
> +			err =3D dytc_command(DYTC_ENABLE_CQL, &output);
> +			if (err)
> +				return err;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static int dytc_lapmode_get(bool *state)
>  {
>  	int output, err;
> @@ -9854,45 +9960,130 @@ static int dytc_lapmode_get(bool *state)
>  	return 0;
>  }
> =20
> -static void dytc_lapmode_refresh(void)
> +static void dytc_refresh(void)
>  {
> -	bool new_state;
> +	bool lapmode;
> +	int perfmode, funcmode;
>  	int err;
> =20
> -	err =3D dytc_lapmode_get(&new_state);
> -	if (err || (new_state =3D=3D dytc_lapmode))
> +	err =3D dytc_lapmode_get(&lapmode);
> +	if (err)
> +		return;
> +	if (dytc_ignore_next_event) {
> +		dytc_ignore_next_event =3D false; /*clear setting*/
>  		return;
> +	}
> +	if (lapmode !=3D dytc_lapmode) {
> +		dytc_lapmode =3D lapmode;
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> "dytc_lapmode");
> +	}
> +	err =3D dytc_perfmode_get(&perfmode, &funcmode);
> +	if (err)
> +		return;
> +	if (perfmode !=3D dytc_perfmode) {
> +		dytc_perfmode =3D perfmode;
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> "dytc_perfmode");
> +	}
> +}
> +
> +/* sysfs perfmode entry */
> +static ssize_t dytc_perfmode_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buf)
> +{
> +	int err;
> +	int perfmode, funcmode;
> +
> +	err =3D dytc_perfmode_get(&perfmode, &funcmode);
> +	if (err)
> +		return err;
> =20
> -	dytc_lapmode =3D new_state;
> -	dytc_lapmode_notify_change();
> +	switch (perfmode) {
> +	case DYTC_MODE_PERFORM:
> +		/* High performance is only available in deskmode */
> +		if (funcmode =3D=3D DYTC_FUNCTION_CQL)
> +			return sprintf(buf, "M*\n");
> +		else
> +			return sprintf(buf, "H\n");
> +	case DYTC_MODE_QUIET:
> +		return sprintf(buf, "L\n");
> +	case DYTC_MODE_BALANCE:
> +		return sprintf(buf, "M\n");
> +	default:
> +		return sprintf(buf, "Unknown (%d)\n", perfmode);
> +	}
>  }
> =20
> +static ssize_t dytc_perfmode_store(struct device *dev,
> +				   struct device_attribute *attr,
> +				   const char *buf, size_t count)
> +{
> +	int err;
> +
> +	switch (buf[0]) {
> +	case 'l':
> +	case 'L':
> +		err =3D dytc_perfmode_set(DYTC_MODE_QUIET);
> +		break;
> +	case 'm':
> +	case 'M':
> +		err =3D dytc_perfmode_set(DYTC_MODE_BALANCE);
> +		break;
> +	case 'h':
> +	case 'H':
> +		err =3D dytc_perfmode_set(DYTC_MODE_PERFORM);
> +		break;
> +	default:
> +		err =3D -EINVAL;
> +		pr_err("Unknown operating mode. Ignoring\n");
> +		break;
> +	}
> +	if (err)
> +		return err;
> +
> +	tpacpi_disclose_usertask(attr->attr.name,
> +				"Performance mode set to %c\n",
> buf[0]);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dytc_perfmode);
> +
> +static struct attribute *dytc_perfmode_attributes[] =3D {
> +	&dev_attr_dytc_perfmode.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group dytc_perf_attr_group =3D {
> +	.attrs =3D dytc_perfmode_attributes
> +};
> +
>  /* sysfs lapmode entry */
>  static ssize_t dytc_lapmode_show(struct device *dev,
>  					struct device_attribute *attr,
>  					char *buf)
>  {
> -	return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
> +	return sprintf(buf, "%d\n", dytc_lapmode);
>  }
> =20
>  static DEVICE_ATTR_RO(dytc_lapmode);
> =20
> -static struct attribute *dytc_attributes[] =3D {
> +static struct attribute *dytc_lap_attributes[] =3D {
>  	&dev_attr_dytc_lapmode.attr,
> -	NULL,
> +	NULL
>  };
> =20
> -static const struct attribute_group dytc_attr_group =3D {
> -	.attrs =3D dytc_attributes,
> +static const struct attribute_group dytc_lap_attr_group =3D {
> +	.attrs =3D dytc_lap_attributes
>  };
> =20
>  static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>  {
> -	int err;
> +	int err, output;
> =20
> -	err =3D dytc_lapmode_get(&dytc_lapmode);
> -	/* If support isn't available (ENODEV) then don't return an
> error
> -	 * but just don't create the sysfs group
> +	err =3D dytc_command(DYTC_CMD_QUERY, &output);
> +	/*
> +	 * If support isn't available (ENODEV) then don't return an
> error
> +	 * just don't create the sysfs group
>  	 */
>  	if (err =3D=3D -ENODEV)
>  		return 0;
> @@ -9900,14 +10091,38 @@ static int tpacpi_dytc_init(struct
> ibm_init_struct *iibm)
>  	if (err)
>  		return err;
> =20
> -	/* Platform supports this feature - create the group */
> -	err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj,
> &dytc_attr_group);
> +	/* Check DYTC is enabled and supports mode setting */
> +	dytc_available =3D false;
> +	dytc_ignore_next_event =3D false;
> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
> +		/* Only DYTC v5.0 and later has this feature. */
> +		int dytc_version;
> +
> +		dytc_version =3D (output >> DYTC_QUERY_REV_BIT) & 0xF;
> +		if (dytc_version >=3D 5) {
> +			dbg_printk(TPACPI_DBG_INIT,
> +				   "DYTC version %d: thermal mode
> available\n", dytc_version);
> +			dytc_available =3D true;
> +			/* Platform supports this feature - create the
> group */
> +			err =3D sysfs_create_group(&tpacpi_pdev-
> >dev.kobj, &dytc_perf_attr_group);
> +			if (err)
> +				return err;
> +
> +			err =3D dytc_lapmode_get(&dytc_lapmode);
> +			if (err)
> +				return err;
> +			err =3D sysfs_create_group(&tpacpi_pdev-
> >dev.kobj, &dytc_lap_attr_group);
> +		}
> +	}
>  	return err;
>  }
> =20
>  static void dytc_exit(void)
>  {
> -	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	if (dytc_available) {
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj,
> &dytc_lap_attr_group);
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj,
> &dytc_perf_attr_group);
> +	}
>  }
> =20
>  static struct ibm_struct dytc_driver_data =3D {
> @@ -10057,7 +10272,7 @@ static void tpacpi_driver_event(const
> unsigned int hkey_event)
>  	}
> =20
>  	if (hkey_event =3D=3D TP_HKEY_EV_THM_CSM_COMPLETED)
> -		dytc_lapmode_refresh();
> +		dytc_refresh();
> =20
>  	if ((hkey_event =3D=3D TP_HKEY_EV_PALM_DETECTED) ||
>  		(hkey_event =3D=3D TP_HKEY_EV_PALM_UNDETECTED))

--=-Eimsjun+JO+oL5GXfRGX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEED2NO4vMS33W8E4AFq6ZWhpmFY3AFAl9h21gACgkQq6ZWhpmF
Y3BYNQ//f6O42u+UhtiSLSkzwLKSbRsHuL+L2XuBqej72oYc9knfz7cwwtkLb0qC
oNpTd7wknX3De/dbsNgU7ye4pacb3D2cuTvNjWalqNEfM9Can1/tw7h0hvCVk6rS
7qWDVt8UWtowkaXggz58bJFTJGlRWCrEbJGrbo51MWsCrVfUE+jjwjjZX7Ys4u55
gCV8fpN57gY4UjZ/Xk3eYek0VR670HiVqY7MNCgZ1wJJGDL4F+eOnJe4tGiAP0nM
dbj7Uo+WwZ5RBXkOl6q5mQstaK/mgehE4ILuzqtm1sB61Zfq9YUUGknw5tmCL2z2
SreYXfZE81pY+ROx9XpOIeTUn5gDGsZeEM4Hu/XglsOIbc8WJoNg6V+0+OJ9MPYh
aez4iXVOk9VzBwJM/pU0skXv+kEU6ZxMf55TZDUL3sUW/gAoFnqCDVZ150QuKn2e
u5ByGuYlLy0uPiMJwnredfjV8rwepl5d2TsH6wznXkWqwYcLJOTd2ghUduPnaqZC
a3wYcVpo9XW/BFPLB5tlYZXCo1WZafx4MGtprfohpdXv7qyfgOY0D1ho2QACzLao
AidbJyF64s6cVcFDgtYdLanzVyQI/oCO5aaxx5Zy7NNdv1P6QsxRza6FV//iVNAz
C0C/i66qSC7PoWQLATDXOVYMG/ALKrUi3NDq8AFSrhw+Vd8cefU=
=FzvG
-----END PGP SIGNATURE-----

--=-Eimsjun+JO+oL5GXfRGX--

