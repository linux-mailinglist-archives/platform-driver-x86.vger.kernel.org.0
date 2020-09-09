Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0372630AC
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Sep 2020 17:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730386AbgIIPhb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 9 Sep 2020 11:37:31 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:38705 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730374AbgIIPgo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Sep 2020 11:36:44 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id AE9DA5C01AE;
        Wed,  9 Sep 2020 10:59:03 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Wed, 09 Sep 2020 10:59:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=C7NkQjJDBqpCq2eQ9vtKO6ihDWwbvUNnkQSP25C9S
        yU=; b=F/N3ySDJgEt9BQU1bxLDxoP2fwdX1xjLynbLIK0jrm8/iHN/WX0ufYFS1
        Vgae7nkE5N5QdDj1IR0uevVbD5J+/buqUpzs2AGpk4PeRghZUQCpFjuLAj9kUFl4
        /A9MQMYeKVf/14hUnucSt9Pqq6QNTZhuJK4/Qw8BYHo96L2WMXrEXbmDMa2Im7jV
        4QGn9KZR7HlTvnnJ9NPDGq9hfSL5+8dPUQb1iQ3nNDQ7otWGrgLFHg645LuhPJGN
        c1nDUJ8TrBNa1Q5yyxGJm9J/iiU9p3c1B34emLTjNAn5ectcOsEHeSjs8sT3BThK
        DORXf/OFzKwqgkknJigIjOQfJ23VA==
X-ME-Sender: <xms:t-1YX6sy_bZsGBJYB1w7s0Vp0HTSc4dtpWzxmRtSntyU4HZIijMcjQ>
    <xme:t-1YX_dQ7qwlVRopu3OEAkya1xXG_xHcAZ3Asi_nawWzfQyI-h-OA4Rt_wAYWkEZJ
    gvUwRMli0z0eIHXwQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrudehhedgjeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
    hqredtreerjeenucfhrhhomhepfdflvghrvghmhicuufholhhlvghrfdcuoehjvghrvghm
    hiesshihshhtvghmjeeirdgtohhmqeenucggtffrrghtthgvrhhnpedthedvfffggedvie
    euffelffekgeeltdetffelveeuudeljeeufeefhfekvefhgfenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjvghrvghmhiesshihshhtvghmje
    eirdgtohhm
X-ME-Proxy: <xmx:t-1YX1y7Sov7eQieEDID869DMKHHsbjIZNZ9Nm9iO8lFSmzOZjgBjg>
    <xmx:t-1YX1Pa2TjsvsQMsy0zjdR9w4LrCBFcHe4X9r1IN_iuyRO6o5IZ-g>
    <xmx:t-1YX69LsGkj8sDdKwP1ujGssDHTza3apzZGRcMUZbMoU9h3kY-z7A>
    <xmx:t-1YX_Fnmb9JXPn8YTlMq5sd2manQCMKkv2S5woQqpuP20-MLny40w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 3A1AFE00A9; Wed,  9 Sep 2020 10:59:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-259-g88fbbfa-fm-20200903.003-g88fbbfa3
Mime-Version: 1.0
Message-Id: <e0de2828-c374-4fe4-b802-e755b001f60b@www.fastmail.com>
In-Reply-To: <ExXpTGiXzjPu4heSLv0yKPDi0nqcealPWHV_kid9zBw--uILyb4WVmxNEcdTRW9rfXAaDi_-2b3yGRx5jLiyw4ssWkDY8wTfghjdABTDB6c=@protonmail.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
 <ExXpTGiXzjPu4heSLv0yKPDi0nqcealPWHV_kid9zBw--uILyb4WVmxNEcdTRW9rfXAaDi_-2b3yGRx5jLiyw4ssWkDY8wTfghjdABTDB6c=@protonmail.com>
Date:   Wed, 09 Sep 2020 08:58:41 -0600
From:   "Jeremy Soller" <jeremy@system76.com>
To:     =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>
Subject: Re: [PATCH 1/2] platform/x86: system76_acpi: Add hwmon driver
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for the comments. I was off for a few days, but will work to addr=
ess them today.

> Hi,
>=20
> I have a couple minor comments.
>=20
>=20
> > [...]
> > +// Get a System76 ACPI device value by name with index
>=20
> Shouldn't the comments be the original C-style?
>=20
>=20
> > +static int system76_get_index(struct system76_data *data, char *met=
hod, int index)
> > +{
> > +	union acpi_object obj;
> > +	struct acpi_object_list obj_list;
> > +	acpi_handle handle;
> > +	acpi_status status;
> > +	unsigned long long ret =3D 0;
>=20
> Minor thing, but isn't this initialization unnecessary?
True, I will remove it
>=20
>=20
> > +
> > +	obj.type =3D ACPI_TYPE_INTEGER;
> > +	obj.integer.value =3D index;
> > +	obj_list.count =3D 1;
> > +	obj_list.pointer =3D &obj;
> > +	handle =3D acpi_device_handle(data->acpi_dev);
> > +	status =3D acpi_evaluate_integer(handle, method, &obj_list, &ret);=

> > +	if (ACPI_SUCCESS(status))
> > +		return (int)ret;
> > +	else
> > +		return -1;
>=20
> I'd personally return -EIO or something similar here. And possibly use=

> acpi_handle_err() + acpi_format_exception().
Yes, I will return a better error value
>=20
>=20
> > +}
> > +
> > +// Get a System76 ACPI device object by name
> > +static int system76_get_object(struct system76_data *data, char *me=
thod, union acpi_object **obj)
> > +{
> > +	acpi_handle handle;
> > +	acpi_status status;
> > +	struct acpi_buffer buf =3D { ACPI_ALLOCATE_BUFFER, NULL };
> > +
> > +	handle =3D acpi_device_handle(data->acpi_dev);
> > +	status =3D acpi_evaluate_object(handle, method, NULL, &buf);
> > +	if (ACPI_SUCCESS(status)) {
> > +		*obj =3D (union acpi_object *)buf.pointer;
>=20
> Casting from 'void*' is redundant.
I will remove the cast
>=20
>=20
> > +		return 0;
> > +	} else {
> > +		return -1;
>=20
> Same here: I'd return -EIO or something similar.
I will return a better error here
>=20
>=20
> > +	}
> > +}
> > +
> > [...]
> > +
> > +static int thermal_read(
> > +	struct device *dev,
> > +	enum hwmon_sensor_types type,
> > +	u32 attr,
> > +	int channel,
> > +	long *val)
> > +{
> > +	struct system76_data *data =3D dev_get_drvdata(dev);
> > +	int raw;
> > +
> > +	if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input) {
> > +		raw =3D system76_get_index(data, "GFAN", channel);
> > +		if (raw >=3D 0) {
> > +			*val =3D (long)((raw >> 8) & 0xFFFF);
> > +			return 0;
> > +		}
> > +	} else if (type =3D=3D hwmon_pwm && attr =3D=3D hwmon_pwm_input) {=

> > +		raw =3D system76_get_index(data, "GFAN", channel);
> > +		if (raw >=3D 0) {
> > +			*val =3D (long)(raw & 0xFF);
> > +			return 0;
> > +		}
> > +	} else if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input)=
 {
> > +		raw =3D system76_get_index(data, "GTMP", channel);
> > +		if (raw >=3D 0) {
> > +			*val =3D (long)(raw * 1000);
> > +			return 0;
> > +		}
> > +	}
> > +	return -EINVAL;
>=20
> It's a minor thing, but this function returns EINVAL even if the ACPI=20=

> call failed.
I will return the error from the system76_get_index call in those cases
>=20
>=20
> > +}
> > +
> > [...]
> > +
> > +// Allocate up to 8 fans and temperatures
> > +static const struct hwmon_channel_info *thermal_channel_info[] =3D =
{
> > +	HWMON_CHANNEL_INFO(fan,
> > +		HWMON_F_INPUT | HWMON_F_LABEL,
> > +		HWMON_F_INPUT | HWMON_F_LABEL,
> > +		HWMON_F_INPUT | HWMON_F_LABEL,
> > +		HWMON_F_INPUT | HWMON_F_LABEL,
> > +		HWMON_F_INPUT | HWMON_F_LABEL,
> > +		HWMON_F_INPUT | HWMON_F_LABEL,
> > +		HWMON_F_INPUT | HWMON_F_LABEL,
> > +		HWMON_F_INPUT | HWMON_F_LABEL),
> > +	HWMON_CHANNEL_INFO(pwm,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT,
> > +			HWMON_PWM_INPUT),
> > +	HWMON_CHANNEL_INFO(temp,
> > +			HWMON_T_INPUT | HWMON_T_LABEL,
> > +			HWMON_T_INPUT | HWMON_T_LABEL,
> > +			HWMON_T_INPUT | HWMON_T_LABEL,
> > +			HWMON_T_INPUT | HWMON_T_LABEL,
> > +			HWMON_T_INPUT | HWMON_T_LABEL,
> > +			HWMON_T_INPUT | HWMON_T_LABEL,
> > +			HWMON_T_INPUT | HWMON_T_LABEL,
> > +			HWMON_T_INPUT | HWMON_T_LABEL),
>=20
> Any reason why the last two channels are indented +1 tabs?
No reason, I will fix the indentation
>=20
>=20
> > +	NULL
> > +};
> > +
> > +static const struct hwmon_chip_info thermal_chip_info =3D {
> > +	.ops =3D &thermal_ops,
> > +	.info =3D thermal_channel_info,
> > +};
> > +
> >  // Handle ACPI notification
> >  static void system76_notify(struct acpi_device *acpi_dev, u32 event=
)
> >  {
> > @@ -346,6 +513,17 @@ static int system76_add(struct acpi_device *acp=
i_dev)
> >  			return err;
> >  	}
> >
> > +	system76_get_object(data, "NFAN", &data->nfan);
> > +	system76_get_object(data, "NTMP", &data->ntmp);
>=20
> Shouldn't the return values be checked? (At least using WARN_ON[_ONCE]=
?)
On these calls, the firmware may or may not have NFAN or NTMP. Not havin=
g them
indicates there is no firmware API for reading fan and temperature value=
s, which is
not an error. So, we ignore errors from these calls, and allow nfan and =
ntmp to be
set to NULL in the case there is an error.
>=20
>=20
> > +	data->therm =3D devm_hwmon_device_register_with_info(
> > +		&acpi_dev->dev,
> > +		"system76_acpi",
> > +		data,
> > +		&thermal_chip_info,
> > +		NULL);
> > +	if (IS_ERR(data->therm))
> > +		return PTR_ERR(data->therm);
> > +
> >  	return 0;
> >  }
> > [...]
>=20
>=20
>=20
> Barnab=C3=A1s P=C5=91cze
>
