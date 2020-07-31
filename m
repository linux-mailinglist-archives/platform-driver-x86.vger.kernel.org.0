Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCB6234CCF
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 23:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbgGaVQj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 17:16:39 -0400
Received: from mail-40138.protonmail.ch ([185.70.40.138]:10807 "EHLO
        mail-40138.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbgGaVQi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 17:16:38 -0400
X-Greylist: delayed 1186 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 Jul 2020 17:16:37 EDT
Date:   Fri, 31 Jul 2020 20:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1596229010;
        bh=srsmv2VDD+mIDxcbcAKr5PMYdIbKQ0pqzSApRMoV1Wk=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=pS2PlitNQg/7uPEgEJ4HrnskhMh/v0n92ZfsZNZlAQJL/Itf0XExeK6HocWmYakYz
         P5o+5N1YeJM26/tR/E9I/heegjU7Jnl0Z4TA1uExLc5EzUqXfVbV3NuBiksHr9VgYB
         kVY+zThXwTv52TUuQiWyan558PHMuZK+CgmX6EP0=
To:     Daniel Dadap <ddadap@nvidia.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "mario.limonciello@dell.com" <mario.limonciello@dell.com>,
        "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "aplattner@nvidia.com" <aplattner@nvidia.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when no GUID is found
Message-ID: <fsd8MQGEGF_h1zzuA1-3WGloDVdnVydyrpBvaUzkXZsb6ert8azm82EXgKOI3kp7O3frRedkvguBCYCf6k-Jnk0kkaSNSH9Ga_FG6Yziq6E=@protonmail.com>
In-Reply-To: <20200731202154.11382-2-ddadap@nvidia.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com> <20200731202154.11382-1-ddadap@nvidia.com> <20200731202154.11382-2-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

2020. j=C3=BAlius 31., p=C3=A9ntek 22:21 keltez=C3=A9ssel, Daniel Dadap <dd=
adap@nvidia.com> =C3=ADrta:
> If a driver registers with WMI, and none of the GUIDs in its ID table
> is present on the system, then that driver will not be probed and
> automatically loaded. However, it is still possible to load such a
> driver explicitly on a system which doesn't include the relevant
> hardware.
>
> Update wmi_driver_register to test for the presence of at least one
> GUID from the driver's ID table at driver registration time, and
> fail registration if none are found.
>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  drivers/platform/x86/wmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 941739db7199..19aa23d1cf8e 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -130,6 +130,21 @@ static bool find_guid(const char *guid_string, struc=
t wmi_block **out)
>  =09return false;
>  }
>
> +static bool find_driver_guid(const struct wmi_driver *wdriver)
> +{
> +=09const struct wmi_device_id *id;
> +
> +=09if (wdriver =3D=3D NULL)
> +=09=09return false;
> +
> +=09for (id =3D wdriver->id_table; *id->guid_string; id++) {
> +=09=09if (find_guid(id->guid_string, NULL))
> +=09=09=09return true;
> +=09}
> +
> +=09return false;
> +}
> +
>  static const void *find_guid_context(struct wmi_block *wblock,
>  =09=09=09=09      struct wmi_driver *wdriver)
>  {
> @@ -1419,6 +1434,9 @@ static int acpi_wmi_probe(struct platform_device *d=
evice)
>  int __must_check __wmi_driver_register(struct wmi_driver *driver,
>  =09=09=09=09       struct module *owner)
>  {
> +=09if (!find_driver_guid(driver))
> +=09=09return -ENODEV;
> +
>  =09driver->driver.owner =3D owner;
>  =09driver->driver.bus =3D &wmi_bus_type;
>
> --
> 2.18.4



Can you elaborate as to why this change in behaviour of the wmi
driver is needed? If I understand it correctly you want to prevent
WMI drivers from successfully loading when there are no matching
GUIDs. Is that correct?


Barnab=C3=A1s P=C5=91cze

