Return-Path: <platform-driver-x86+bounces-10003-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA07A55B2E
	for <lists+platform-driver-x86@lfdr.de>; Fri,  7 Mar 2025 00:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C768A7A2848
	for <lists+platform-driver-x86@lfdr.de>; Thu,  6 Mar 2025 23:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F07263F2C;
	Thu,  6 Mar 2025 23:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtPhR7Ue"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78A1200BB2;
	Thu,  6 Mar 2025 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741305454; cv=none; b=rKpvj1fIL/aJMgcDwKYURlDnie1IKQsW+MtGTg894tlMmpjMrf3Z0SK8+GxP6OvRnIwUkE5DJ3IlzB7BUyOAjaMo7RdBSWccPux3LY8nOcuBFdO8xOSEyRF+PViaMNgHfCbFx0UPRfvVUpyD4uxZnPRTKZXu3pVXlpHOnuvI2gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741305454; c=relaxed/simple;
	bh=2++OQEP4uQAaJ8d8AboWSY6yPvVoJM50nxpJLHppZLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tt9WQ6Fex47idMK4naXJb1Hp+/FQKoBFMx7d4CFQ+pG5rOo8E6MywGfrxruUUYidZorWvHdQkl6zIewiLUYaLEzSB2d0VP2E8/2jp724qMpalaNn+ALFpB5v0sZ0XQQGNxyq5SsFybcJuJMN1jOOvfwE3VDCMy237kUk5I09Q8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtPhR7Ue; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22374f56453so31862435ad.0;
        Thu, 06 Mar 2025 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741305452; x=1741910252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8ISUYW6E3JyjiOm+gjsreDqhcMofw1HmjYx4so36Vo=;
        b=mtPhR7UeaBOrKjbvTpoWhxfP0OAXsD46ObJe2QkNDD2Nn1++YZ6414/JUVhZWD+7TS
         5qQEFAyQGXe8e7TItk/XsjvVF1at/3Kzv3cwOjrc4XIVj68LUTHIwtr39qZRVruKzmto
         Za2IX5K4Tqo5xLPcwE+urSqxDM3vwz16qwDvhkufoKi7LYkPeyuMYDjgvAa9qcbuiAi1
         2ol/h7P3CiILPDGlJVMUGU4JjMu+cqxvgrZivbOtI7RR+pMth6ydi8Cd7lZqGndPM5TZ
         F5YK9PnMmGfJqT2TXMULF2F9wagTLnv/AULAqaHETt/5OfUOxYQOYgKNqkjmYq0/c4pk
         2TMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741305452; x=1741910252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8ISUYW6E3JyjiOm+gjsreDqhcMofw1HmjYx4so36Vo=;
        b=T0ZsAAb5fwTkKzGu1zsfNBdStXEqC5jAU6jtEk51hXsPmxBGQE8WgToemuDC3ITGvJ
         sQnN61j3hTds6BSkgqJaiwQLzWDMD6t/OWo2D5WdqwmxDGPYl5Az/6LdIFlX7QobIYzP
         u+wcs3dbAYgw26QeGEsScpDh/ItN4Oj9Ea1Q4UKXiqwesEmlEjR+CiuAAai+HHEi2L9s
         sGZbbYxb4J/7uXvLGRwKbpoY/rOzFGMUrCXrnU4TS4TLSfvE4ubdGIpBUZ1sSFwT6jr5
         ngPVGhzXSnda8c/C+Ng2EKTHqjVRdIkaI6KNTWmbX5uHbSen0mRrfjSKYSBUoxVyOBxn
         Yg5A==
X-Forwarded-Encrypted: i=1; AJvYcCWb2n9Rxi5N7BmPLy64bK+VGFvviD6T6a5ADhGZ29S4MSICIXB2QYY84IX604EY77Gumy8NwN40J3D+OrI=@vger.kernel.org, AJvYcCWfu1gfX7seR9EgRfWi6AofsKtg1UNjUSX8/U5GO8moBFavGU8jQkKC+8iSiMf54Ay/4x1Ji21slKv0ORK0pVSmL/DpAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5w73Hqn/sNP8rNHoV6UmUbDVR/lTQhYTyF+xhes08YrynKLjL
	6CNGRv8oNNlbGb8D0qoRHxTilAth71I1WMbLIW2o8Q1Bn2RV86klKw6Vwg==
X-Gm-Gg: ASbGnctRnqYHAUN8ojN3Ze4N0XzhteGofZS3LUwz2lzrfZ8BcRH6uyiFAAz1KAHAyGY
	EZQdQsAb+bY7M43+zo+3x83FYf8RaAm1JKnNH083jAPfrO3pFDjFe3fJtSy4aQzfhV2Os0zoMpF
	rCQ4UeZG4Fe+M3BaDCU4a2RRIM7Q8z82tZwi+C2p3FtEA5gNxHUXtMKXiQneWHZQG1uRFj90C56
	q6jdELHeo12s6/ofR/odeCSQu8JJ89oA7wRfh206Z4T7pad2YS4ZXpBF+IJ27C5Z6gRuQMvw2qT
	Xl3+A4AA1NZws8OhukEi7SfxsYFjp+BkfTDiBtDCNM51
X-Google-Smtp-Source: AGHT+IFpJmiU6+uBuLf8oGc4KgO8vDnQb5Yk7bSZ0PwJu5KpMS1t/D9XqZmL8mLYMaE6huLBzjVCzQ==
X-Received: by 2002:a17:902:d551:b0:224:1ec0:8a1a with SMTP id d9443c01a7336-22428ad54d8mr18475465ad.51.1741305451351;
        Thu, 06 Mar 2025 15:57:31 -0800 (PST)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109dd5f8sm18255275ad.52.2025.03.06.15.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 15:57:30 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id E47ED420A74B; Fri, 07 Mar 2025 06:57:26 +0700 (WIB)
Date: Fri, 7 Mar 2025 06:57:26 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kurt Borja <kuurtb@gmail.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 10/10] Documentation: wmi: Improve and update
 alienware-wmi documentation
Message-ID: <Z8o2ZkQmdHkdf13m@archie.me>
References: <20250305-hwm-v3-0-395e7a1407e2@gmail.com>
 <20250305-hwm-v3-10-395e7a1407e2@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cUeMf+BrXeRS+lLa"
Content-Disposition: inline
In-Reply-To: <20250305-hwm-v3-10-395e7a1407e2@gmail.com>


--cUeMf+BrXeRS+lLa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 07:57:01PM -0500, Kurt Borja wrote:
> diff --git a/Documentation/wmi/devices/alienware-wmi.rst b/Documentation/=
wmi/devices/alienware-wmi.rst
> index ddc5e561960e05fc7cffe700d7d278e32ff2e7b2..79238051b18bc5de9b5023250=
17cd5c5fcf41748 100644
> --- a/Documentation/wmi/devices/alienware-wmi.rst
> +++ b/Documentation/wmi/devices/alienware-wmi.rst
> @@ -11,7 +11,7 @@ The WMI device WMAX has been implemented for many Alien=
ware and Dell's G-Series
>  models. Throughout these models, two implementations have been identifie=
d. The
>  first one, used by older systems, deals with HDMI, brightness, RGB, ampl=
ifier
>  and deep sleep control. The second one used by newer systems deals prima=
rily
> -with thermal, overclocking, and GPIO control.
> +with thermal control and overclocking.
> =20
>  It is suspected that the latter is used by Alienware Command Center (AWC=
C) to
>  manage manufacturer predefined thermal profiles. The alienware-wmi driver
> @@ -69,9 +69,6 @@ data using the `bmfdec <https://github.com/pali/bmfdec>=
`_ utility:
>     [WmiMethodId(164), Implemented, read, write, Description("Tobii Camer=
a Power Off.")] void TobiiCameraPowerOff([out] uint32 argr);
>   };
> =20
> -Some of these methods get quite intricate so we will describe them using
> -pseudo-code that vaguely resembles the original ASL code.
> -
>  Methods not described in the following document have unknown behavior.
> =20
>  Argument Structure
> @@ -87,175 +84,133 @@ ID 0xA0, the argument you would pass to the method =
is 0xA001.
>  Thermal Methods
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> +WMI method GetFanSensors([in] uint32 arg2, [out] uint32 argr)
> +-------------------------------------------------------------
> +
> ++--------------------+------------------------------------+-------------=
-------+
> +| Operation (Byte 0) | Description                        | Arguments   =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| 0x01               | Get the number of temperature      | - Byte 1: Fa=
n ID   |
> +|                    | sensors related with a fan ID      |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x02               | Get the temperature sensor IDs     | - Byte 1: Fa=
n ID   |
> +|                    | related to a fan sensor ID         | - Byte 2: In=
dex    |
> ++--------------------+------------------------------------+-------------=
-------+
> +
>  WMI method Thermal_Information([in] uint32 arg2, [out] uint32 argr)
>  -------------------------------------------------------------------
> =20
> -::
> -
> - if BYTE_0(arg2) =3D=3D 0x01:
> -         argr =3D 1
> -
> - if BYTE_0(arg2) =3D=3D 0x02:
> -         argr =3D SYSTEM_DESCRIPTION
> -
> - if BYTE_0(arg2) =3D=3D 0x03:
> -         if BYTE_1(arg2) =3D=3D 0x00:
> -                 argr =3D FAN_ID_0
> -
> -         if BYTE_1(arg2) =3D=3D 0x01:
> -                 argr =3D FAN_ID_1
> -
> -         if BYTE_1(arg2) =3D=3D 0x02:
> -                 argr =3D FAN_ID_2
> -
> -         if BYTE_1(arg2) =3D=3D 0x03:
> -                 argr =3D FAN_ID_3
> -
> -         if BYTE_1(arg2) =3D=3D 0x04:
> -                 argr =3D SENSOR_ID_CPU | 0x0100
> -
> -         if BYTE_1(arg2) =3D=3D 0x05:
> -                 argr =3D SENSOR_ID_GPU | 0x0100
> -
> -         if BYTE_1(arg2) =3D=3D 0x06:
> -                 argr =3D THERMAL_MODE_QUIET_ID
> -
> -         if BYTE_1(arg2) =3D=3D 0x07:
> -                 argr =3D THERMAL_MODE_BALANCED_ID
> -
> -         if BYTE_1(arg2) =3D=3D 0x08:
> -                 argr =3D THERMAL_MODE_BALANCED_PERFORMANCE_ID
> -
> -         if BYTE_1(arg2) =3D=3D 0x09:
> -                 argr =3D THERMAL_MODE_PERFORMANCE_ID
> -
> -         if BYTE_1(arg2) =3D=3D 0x0A:
> -                 argr =3D THERMAL_MODE_LOW_POWER_ID
> -
> -         if BYTE_1(arg2) =3D=3D 0x0B:
> -                 argr =3D THERMAL_MODE_GMODE_ID
> -
> -         else:
> -                 argr =3D 0xFFFFFFFF
> -
> - if BYTE_0(arg2) =3D=3D 0x04:
> -         if is_valid_sensor(BYTE_1(arg2)):
> -                 argr =3D SENSOR_TEMP_C
> -         else:
> -                 argr =3D 0xFFFFFFFF
> -
> - if BYTE_0(arg2) =3D=3D 0x05:
> -         if is_valid_fan(BYTE_1(arg2)):
> -                 argr =3D FAN_RPM()
> -
> - if BYTE_0(arg2) =3D=3D 0x06:
> -         skip
> -
> - if BYTE_0(arg2) =3D=3D 0x07:
> -         argr =3D 0
> -
> - If BYTE_0(arg2) =3D=3D 0x08:
> -         if is_valid_fan(BYTE_1(arg2)):
> -                 argr =3D 0
> -         else:
> -                 argr =3D 0xFFFFFFFF
> -
> - if BYTE_0(arg2) =3D=3D 0x09:
> -         if is_valid_fan(BYTE_1(arg2)):
> -                 argr =3D FAN_UNKNOWN_STAT_0()
> -
> -         else:
> -                 argr =3D 0xFFFFFFFF
> -
> - if BYTE_0(arg2) =3D=3D 0x0A:
> -         argr =3D THERMAL_MODE_BALANCED_ID
> -
> - if BYTE_0(arg2) =3D=3D 0x0B:
> -         argr =3D CURRENT_THERMAL_MODE()
> -
> - if BYTE_0(arg2) =3D=3D 0x0C:
> -         if is_valid_fan(BYTE_1(arg2)):
> -                 argr =3D FAN_UNKNOWN_STAT_1()
> -         else:
> -                 argr =3D 0xFFFFFFFF
> -
> -Operation 0x02 returns a *system description* buffer with the following
> -structure:
> -
> -::
> -
> - out[0] -> Number of fans
> - out[1] -> Number of sensors
> - out[2] -> 0x00
> - out[3] -> Number of thermal modes
> -
> -Operation 0x03 list all available fan IDs, sensor IDs and thermal profile
> -codes in order, but different models may have different number of fans a=
nd
> -thermal profiles. These are the known ranges:
> -
> -* Fan IDs: from 2 up to 4
> -* Sensor IDs: 2
> -* Thermal profile codes: from 1 up to 7
> -
> -In total BYTE_1(ARG2) may range from 0x5 up to 0xD depending on the mode=
l.
> ++--------------------+------------------------------------+-------------=
-------+
> +| Operation (Byte 0) | Description                        | Arguments   =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| 0x01               | Unknown.                           | - None      =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x02               | Get system description number with | - None      =
       |
> +|                    | the following structure:           |             =
       |
> +|                    |                                    |             =
       |
> +|                    | - Byte 0: Number of fans           |             =
       |
> +|                    | - Byte 1: Number of temperature    |             =
       |
> +|                    |   sensors                          |             =
       |
> +|                    | - Byte 2: Unknown                  |             =
       |
> +|                    | - Byte 3: Number of thermal        |             =
       |
> +|                    |   profiles                         |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x03               | List an ID or resource at a given  | - Byte 1: In=
dex    |
> +|                    | index. Fan IDs, temperature IDs,   |             =
       |
> +|                    | unknown IDs and thermal profile    |             =
       |
> +|                    | IDs are listed in that exact       |             =
       |
> +|                    | order.                             |             =
       |
> +|                    |                                    |             =
       |
> +|                    | Operation 0x02 is used to know     |             =
       |
> +|                    | which indexes map to which         |             =
       |
> +|                    | resources.                         |             =
       |
> +|                    |                                    |             =
       |
> +|                    | **Returns:** ID at a given index   |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x04               | Get the current temperature for a  | - Byte 1: Se=
nsor   |
> +|                    | given temperature sensor.          |   ID        =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x05               | Get the current RPM for a given    | - Byte 1: Fa=
n ID   |
> +|                    | fan.                               |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x06               | Get fan speed percentage. (not     | - Byte 1: Fa=
n ID   |
> +|                    | implemented in every model)        |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x07               | Unknown.                           | - Unknown   =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x08               | Get minimum RPM for a given FAN    | - Byte 1: Fa=
n ID   |
> +|                    | ID.                                |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x09               | Get maximum RPM for a given FAN    | - Byte 1: Fa=
n ID   |
> +|                    | ID.                                |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x0A               | Get balanced thermal profile ID.   | - None      =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x0B               | Get current thermal profile ID.    | - None      =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x0C               | Get current `boost` value for a    | - Byte 1: Fa=
n ID   |
> +|                    | given fan ID.                      |             =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> =20
>  WMI method Thermal_Control([in] uint32 arg2, [out] uint32 argr)
>  ---------------------------------------------------------------
> =20
> -::
> -
> - if BYTE_0(arg2) =3D=3D 0x01:
> -         if is_valid_thermal_profile(BYTE_1(arg2)):
> -                 SET_THERMAL_PROFILE(BYTE_1(arg2))
> -                 argr =3D 0
> -
> - if BYTE_0(arg2) =3D=3D 0x02:
> -         if is_valid_fan(BYTE_1(arg2)):
> -                 SET_FAN_SPEED_MULTIPLIER(BYTE_2(arg2))
> -                 argr =3D 0
> -         else:
> -                 argr =3D 0xFFFFFFFF
> -
> -.. note::
> -   While you can manually change the fan speed multiplier with this meth=
od,
> -   Dell's BIOS tends to overwrite this changes anyway.
> ++--------------------+------------------------------------+-------------=
-------+
> +| Operation (Byte 0) | Description                        | Arguments   =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| 0x01               | Activate a given thermal profile.  | - Byte 1: Th=
ermal  |
> +|                    |                                    |   profile ID=
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x02               | Set a `boost` value for a given    | - Byte 1: Fa=
n ID   |
> +|                    | fan ID.                            | - Byte 2: Bo=
ost    |
> ++--------------------+------------------------------------+-------------=
-------+
> =20
>  These are the known thermal profile codes:
> =20
> -::
> ++------------------------------+----------+------+
> +| Thermal Profile              | Type     | ID   |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D+
> +| Custom                       | Special  | 0x00 |
> ++------------------------------+----------+------+
> +| G-Mode                       | Special  | 0xAB |
> ++------------------------------+----------+------+
> +| Quiet                        | Legacy   | 0x96 |
> ++------------------------------+----------+------+
> +| Balanced                     | Legacy   | 0x97 |
> ++------------------------------+----------+------+
> +| Balanced Performance         | Legacy   | 0x98 |
> ++------------------------------+----------+------+
> +| Performance                  | Legacy   | 0x99 |
> ++------------------------------+----------+------+
> +| Balanced                     | USTT     | 0xA0 |
> ++------------------------------+----------+------+
> +| Balanced Performance         | USTT     | 0xA1 |
> ++------------------------------+----------+------+
> +| Cool                         | USTT     | 0xA2 |
> ++------------------------------+----------+------+
> +| Quiet                        | USTT     | 0xA3 |
> ++------------------------------+----------+------+
> +| Performance                  | USTT     | 0xA4 |
> ++------------------------------+----------+------+
> +| Low Power                    | USTT     | 0xA5 |
> ++------------------------------+----------+------+
> =20
> - CUSTOM                         0x00
> +If a model supports the User Selectable Thermal Tables (USTT) profiles, =
it will
> +not support the Legacy profiles and vice-versa.
> =20
> - BALANCED_USTT                  0xA0
> - BALANCED_PERFORMANCE_USTT      0xA1
> - COOL_USTT                      0xA2
> - QUIET_USTT                     0xA3
> - PERFORMANCE_USTT               0xA4
> - LOW_POWER_USTT                 0xA5
> -
> - QUIET                          0x96
> - BALANCED                       0x97
> - BALANCED_PERFORMANCE           0x98
> - PERFORMANCE                    0x99
> -
> - GMODE                          0xAB
> -
> -Usually if a model doesn't support the first four profiles they will sup=
port
> -the User Selectable Thermal Tables (USTT) profiles and vice-versa.
> -
> -GMODE replaces PERFORMANCE in G-Series laptops.
> +Every model supports the CUSTOM (0x00) thermal profile. GMODE replaces
> +PERFORMANCE in G-Series laptops.
> =20
>  WMI method GameShiftStatus([in] uint32 arg2, [out] uint32 argr)
>  ---------------------------------------------------------------
> =20
> -::
> -
> - if BYTE_0(arg2) =3D=3D 0x1:
> -         TOGGLE_GAME_SHIFT()
> -         argr =3D GET_GAME_SHIFT_STATUS()
> -
> - if BYTE_0(arg2) =3D=3D 0x2:
> -         argr =3D GET_GAME_SHIFT_STATUS()
> ++--------------------+------------------------------------+-------------=
-------+
> +| Operation (Byte 0) | Description                        | Arguments   =
       |
> ++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D+
> +| 0x01               | Toggle *Game Shift*.               | - None      =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> +| 0x02               | Get *Game Shift* status.           | - None      =
       |
> ++--------------------+------------------------------------+-------------=
-------+
> =20
>  Game Shift Status does not change the fan speed profile but it could be =
some
>  sort of CPU/GPU power profile. Benchmarks have not been done.
> @@ -267,131 +222,27 @@ Thermal_Information does not list it.
>  G-key on Dell's G-Series laptops also changes Game Shift status, so both=
 are
>  directly related.
> =20
> -WMI method GetFanSensors([in] uint32 arg2, [out] uint32 argr)
> --------------------------------------------------------------
> -
> -::
> -
> - if BYTE_0(arg2) =3D=3D 0x1:
> -        if is_valid_fan(BYTE_1(arg2)):
> -                argr =3D 1
> -        else:
> -                argr =3D 0
> -
> - if BYTE_0(arg2) =3D=3D 0x2:
> -        if is_valid_fan(BYTE_1(arg2)):
> -                if BYTE_2(arg2) =3D=3D 0:
> -                        argr =3D=3D SENSOR_ID
> -                else
> -                        argr =3D=3D 0xFFFFFFFF
> -        else:
> -                argr =3D 0
> -
>  Overclocking Methods
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -.. warning::
> -   These methods have not been tested and are only partially reverse
> -   engineered.
> -
> -WMI method Return_OverclockingReport([out] uint32 argr)
> --------------------------------------------------------
> -
> -::
> -
> - CSMI (0xE3, 0x99)
> - argr =3D 0
> -
> -CSMI is an unknown operation.
> -
> -WMI method Set_OCUIBIOSControl([in] uint32 arg2, [out] uint32 argr)
> --------------------------------------------------------------------
> -
> -::
> -
> - CSMI (0xE3, 0x99)
> - argr =3D 0
> -
> -CSMI is an unknown operation.
> -
> -WMI method Clear_OCFailSafeFlag([out] uint32 argr)
> ---------------------------------------------------
> -
> -::
> -
> - CSMI (0xE3, 0x99)
> - argr =3D 0
> -
> -CSMI is an unknown operation.
> -
> -
>  WMI method MemoryOCControl([in] uint32 arg2, [out] uint32 argr)
>  ---------------------------------------------------------------
> =20
>  AWCC supports memory overclocking, but this method is very intricate and=
 has
>  not been deciphered yet.
> =20
> -GPIO methods
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> -
> -These methods are probably related to some kind of firmware update syste=
m,
> -through a GPIO device.
> -
> -.. warning::
> -   These methods have not been tested and are only partially reverse
> -   engineered.
> -
> -WMI method FWUpdateGPIOtoggle([in] uint32 arg2, [out] uint32 argr)
> -------------------------------------------------------------------
> -
> -::
> -
> - if BYTE_0(arg2) =3D=3D 0:
> -         if BYTE_1(arg2) =3D=3D 1:
> -                 SET_PIN_A_HIGH()
> -         else:
> -                 SET_PIN_A_LOW()
> -
> - if BYTE_0(arg2) =3D=3D 1:
> -         if BYTE_1(arg2) =3D=3D 1:
> -                 SET_PIN_B_HIGH()
> -
> -         else:
> -                 SET_PIN_B_LOW()
> -
> - else:
> -         argr =3D 1
> -
> -WMI method ReadTotalofGPIOs([out] uint32 argr)
> -----------------------------------------------
> -
> -::
> -
> - argr =3D 0x02
> -
> -WMI method ReadGPIOpPinStatus([in] uint32 arg2, [out] uint32 argr)
> -------------------------------------------------------------------
> -
> -::
> -
> - if BYTE_0(arg2) =3D=3D 0:
> -         argr =3D PIN_A_STATUS
> -
> - if BYTE_0(arg2) =3D=3D 1:
> -         argr =3D PIN_B_STATUS
> -
>  Other information Methods
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> =20
>  WMI method ReadChassisColor([out] uint32 argr)
>  ----------------------------------------------
> =20
> -::
> -
> - argr =3D CHASSIS_COLOR_ID
> +Returns the chassis color internal ID.
> =20
>  Acknowledgements
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =20
> -Kudos to `AlexIII <https://github.com/AlexIII/tcc-g15>`_ for documenting
> -and testing available thermal profile codes.
> +Kudos to `AlexIII <https://github.com/AlexIII/tcc-g15>`_ and
> +`T-Troll <https://github.com/T-Troll/alienfx-tools/>`_ for documenting a=
nd
> +testing some of this device's functionality, making it possible to gener=
alize
> +this driver.
>=20

Looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--cUeMf+BrXeRS+lLa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZ8o2XwAKCRD2uYlJVVFO
o17KAP9b/54r24fQ+UmehxvciPpB7urBYAK2rr6xb3qnJ1fP+AEA4bFPNPKx1GxF
rrnmoQw9jY8z7DuUojSen1ZnPKQpXAE=
=RzrT
-----END PGP SIGNATURE-----

--cUeMf+BrXeRS+lLa--

