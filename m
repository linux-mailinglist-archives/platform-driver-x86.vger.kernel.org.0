Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5820E234C84
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 22:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgGaUvU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 16:51:20 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:59888 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727951AbgGaUvT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 16:51:19 -0400
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VKl64Z015485;
        Fri, 31 Jul 2020 16:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=exnF0N3w85mDb5a/QsPtM3TEQA4gWtrOYW9Qs2wQAzs=;
 b=gwK8Siox+VFG4SQ8c8+mpVCHvGnC9yr+i0CGRKMvnjzSaTRdCRbPHJQ6n0ts6m0IXpGb
 GTGKE9uLXMD/9fR/4PP/LihDYdwH/vfQoBYILXKBOcIlFOTvWa5cKZ353btNNObLMKp/
 bJSLH9bpusMHq7jundkemlO8kEKRadmZNKDQiSxmx7iJZDrvTbTUoR3ZXcgbYbaPTOEN
 kTHKDtzte00dNPsZubBOLS8SSOzR8NBV2ifG0+JughMS334UNhyFzkBnIcivNTpn8a4j
 VK4My1oXdF88ratfmGxDRUBZ24UWZ6zkxkJ4wx34Pj1FZOQdQFgF5rmsOTiZllTf0L7V Yw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 32jun1cg9p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Jul 2020 16:51:04 -0400
Received: from pps.filterd (m0142699.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VKlwPj162227;
        Fri, 31 Jul 2020 16:51:03 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by mx0a-00154901.pphosted.com with ESMTP id 32mt60g9y6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 31 Jul 2020 16:51:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PlFBIDbp1Sk+7Ewjx+geJKnGDdtLPCHADspl1DRe8CtV9TTwq0ef9HMn9v+fVbpJO20UPrQ/mypvI6HAZHGZrBoKdkJHjnPSAYkuL1pmmgRdpq9eth0/StFVGaj+agmQsygh+coZkKAfyFChfEBJ3hZVGqyqau8je2ZphxX1topjmVHXHmoNmuWW0qU6+weucCW5bDvvkSCl2eRkIK1EWR0CnAzMc3RGJbMR+DXl3jFVjKknlhImEC6YNPkPTF48g7Gd1CU8XyZUIKRBrPac2IxWgMbhq3bFGC7UwwcQFE8+8+HuRqB/LP0bw1XItA841Z3uaqMUk+nXFIeg+g0o4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exnF0N3w85mDb5a/QsPtM3TEQA4gWtrOYW9Qs2wQAzs=;
 b=ZnZzriMhipcgKqiifZ5Ldjlj6BQKx3eU0JEBYULYptHL027Lzi39b16YDcYXegDLT51qX14GAeIFkUYEouJi5TPeBBRO2RmY4CdTaGdO6fsUFakiAeJ171iErcuefQwIBq9ZiPo8MjS5OqrGq7Rt4/f7/hLssXtHsInpPv/gDQYfBS0UpnjeYp9RiSct/Cmb7a2B0F7fqx7E89qjN4DayL6onvFjI8BPz++KoHkpA4+L0OWbx4+YQYJ5R+kHEkaaVkgFd08uPBucqDNluLos9gxifQuTT317a9Vi1VJykTcwlRM3oglQwByNa63GnCksDwQUknRhhFQ6ephnaPkFfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exnF0N3w85mDb5a/QsPtM3TEQA4gWtrOYW9Qs2wQAzs=;
 b=DzXxC/I+WgPRhvo+QziUnv9dl898AwXA2SMnjz7r8k8xSWLCsEvjAN3OKBDDbNiAfvVFceRKrdfiaX0eYBFpDCNDN8ZzYrX6UMkuiX/GZGheQP485/NXswrm8s1GQuKl/tzfn0NWHuytYwxnZYtlWC94Cl7ycIAdNbsE0qaEi7Q=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB4262.namprd19.prod.outlook.com (2603:10b6:5:294::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 20:51:02 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 20:51:02 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Daniel Dadap <ddadap@nvidia.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>
CC:     "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "aplattner@nvidia.com" <aplattner@nvidia.com>
Subject: RE: [PATCH v2 1/2] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Thread-Topic: [PATCH v2 1/2] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Thread-Index: AQHWZ3gcuSG3oEcQH0ih1Qde7mwTtqkiKL4g
Date:   Fri, 31 Jul 2020 20:51:01 +0000
Message-ID: <DM6PR19MB2636962A4EE9208D0C84A97AFA4E0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
In-Reply-To: <20200731202154.11382-1-ddadap@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-07-31T20:50:58.3214856Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=23ce52fd-01b9-4301-af63-6998cd949c20;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3dc0fb29-b54c-4d13-17c5-08d835936f92
x-ms-traffictypediagnostic: DM6PR19MB4262:
x-microsoft-antispam-prvs: <DM6PR19MB42620BAA1E8A9A3EE1416666FA4E0@DM6PR19MB4262.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3xRbnLuey8pcbYNLSvF4PxO957gdm4rKurC3NCBTEYFs5iw7Roq3FR3F8Z5/fU2XRpbSnSma9aMxf/G3w1OzqtL1FKW5ZWrWbDAwSDQ4BSdIUQj7/4L60E43CV8TagzqxcVYq7795eVV/+ALRD89Edn/9QB2cq4ZZne6ckXBp0HDKwmwz9ZBmiBVZqs6I1tIPzy8LccMWfu9RXxNrSnMT3UWwHHPCmpIXXUn+XMozg/XyBLJO80SPwc1JBAKRLmDMvFi43REcO+PDAdgwTf3DNoK9R2CoLzr8Gxb0tyvze/FWEYbINaOeaYwRpbWRMDSHtGbX54JcU+PpVFQqF1ehi+SdpTGvhAVEiBo0r0Ch7r6hUHthWb5hOg3CsmHTtRotDDUmVDKUd5xGJj9oVu3Wmj1aeHyzypYcmYZth/OWXmORfpbs99SbytDyVDBANDk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(376002)(346002)(39860400002)(366004)(396003)(76116006)(66946007)(66556008)(66446008)(54906003)(83380400001)(66476007)(64756008)(316002)(4326008)(110136005)(55016002)(786003)(2906002)(33656002)(7696005)(86362001)(6506007)(52536014)(966005)(71200400001)(8676002)(8936002)(9686003)(26005)(5660300002)(478600001)(186003)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: yPH+MFZwcSLoy0sBcC+hTJIO1aIY62F55ttDlTGY8b+lPRPtYJF4xQvEOzhcWxhCCZxf789Qv+hdBQrQIclHiMHxDxDCabbvuVdw0LNJCiuypzHes7p7SKCzzmySxeuIgV10/aXAxNyebhWfR/+NJvuyJfnBqt/qpEqp61jDSYUaVUOeLRfTD0MZemPotvEHjOuSQD/d8pSAmeIycdK8hK9B9gAMrowC7p+EEm9fSAIu5jLwyipv+Avx1YE+iIV0E1RUhO/J3U+KOWCEwkV4XrI8dTGCChzBs00x8ZtJfic79RQ/rqL6nRhjvXM20/H5Y9XsMr7egEU4KbcUoDWezCPLZlRBJIDEMSumBv73U1vhX94zM62qYCb+zE2CVaIkeuakgHV2P60YlRkEDFMqSEONOXWiCeSTqq17o7SzwhXoZUyNaAm2h9SrLJqecGHP50Rq4sDdVNEhB5ByWRGCht9F6krg6ZdsUKu/hjn0lRPopJWsIuZaWVl7OCvzlFQ2ixb38lenzDQWpkGjzi6DTLfELEJVdC1mqw0Kyl+FuHgIiwMKvGb32pn/f5QqHwxDMTRXMtxcFdcLgDqytEw/sm80NHGRUxuGIMbLUWjtdA6eFKJH94dtaz+VF8s1DM/Z6HhGpTz0yaofxSzD5l+OMw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc0fb29-b54c-4d13-17c5-08d835936f92
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 20:51:02.0135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Yu5CQDYT2PvU2Vlq2oQCu6cssgovtkQuYD70FqKAhY5RfZR7ARxIIBhEojZtun5GVkh0MJL/PgalaCveR9LFKLXhlXHj2rvdpMpIp3RnHus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4262
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-31_09:2020-07-31,2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310148
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007310148
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dan,

> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  MAINTAINERS                               |   6 +
>  drivers/platform/x86/Kconfig              |  11 ++
>  drivers/platform/x86/Makefile             |   2 +
>  drivers/platform/x86/wmaa-backlight-wmi.c | 188 ++++++++++++++++++++++
>  4 files changed, 207 insertions(+)
>  create mode 100644 drivers/platform/x86/wmaa-backlight-wmi.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeff55560759..e5ce6544a3c8 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18249,6 +18249,12 @@ L:	linux-wireless@vger.kernel.org
>  S:	Odd fixes
>  F:	drivers/net/wireless/wl3501*
>=20
> +WMAA BACKLIGHT DRIVER
> +M:	Daniel Dadap <ddadap@nvidia.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Supported
> +F:	drivers/platform/x86/wmaa-backlight-wmi.c
> +
>  WOLFSON MICROELECTRONICS DRIVERS
>  L:	patches@opensource.cirrus.com
>  T:	git https://github.com/CirrusLogic/linux-drivers.git
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0ad7ad8cf8e1..db342e480aa9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1368,6 +1368,17 @@ config INTEL_TELEMETRY
>  	  directly via debugfs files. Various tools may use
>  	  this interface for SoC state monitoring.
>=20
> +config WMAA_BACKLIGHT_WMI
> +	tristate "ACPI WMAA Backlight Driver"
> +	depends on ACPI_WMI
> +	depends on ACPI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  This driver provides a sysfs backlight interface for notebook
> +	  systems which expose the WMAA ACPI method and an associated WMI
> +	  wrapper to drive LCD backlight levels through the system's
> +	  Embedded Controller.
> +
>  endif # X86_PLATFORM_DEVICES
>=20
>  config PMC_ATOM
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 53408d965874..fb6e16d62031 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)		+=3D
> intel_telemetry_core.o \
>  					   intel_telemetry_pltdrv.o \
>  					   intel_telemetry_debugfs.o
>  obj-$(CONFIG_PMC_ATOM)			+=3D pmc_atom.o
> +
> +obj-$(CONFIG_WMAA_BACKLIGHT_WMI)	+=3D wmaa-backlight-wmi.o
> diff --git a/drivers/platform/x86/wmaa-backlight-wmi.c
> b/drivers/platform/x86/wmaa-backlight-wmi.c
> new file mode 100644
> index 000000000000..65117082787d
> --- /dev/null
> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> @@ -0,0 +1,188 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * WMAA Backlight WMI driver
> + *
> + * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOU=
T
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/backlight.h>
> +#include <linux/wmi.h>
> +
> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
> +MODULE_LICENSE("GPL v2");
> +
> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> +
> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);

With switching to wmidev is MODULE_ALIAS actually still needed?

> +
> +struct wmi_wmaa_priv {
> +	struct backlight_device *backlight;
> +};
> +
> +enum wmaa_method {
> +	WMAA_BRIGHTNESS_LEVEL =3D 1,
> +	WMAA_BRIGHTNESS_SOURCE =3D 2,
> +};
> +
> +enum wmaa_get_or_set {
> +	WMAA_GET =3D 0,
> +	WMAA_SET =3D 1,
> +	WMAA_GET_MAX =3D 2, // for WMAA_BRIGHTNESS_LEVEL only
> +};
> +
> +enum wmaa_source {
> +	WMAA_SOURCE_CLEAR =3D 0,
> +	WMAA_SOURCE_GPU =3D 1,
> +	WMAA_SOURCE_EC =3D 2,
> +	WMAA_SOURCE_AUX =3D 3,
> +	WMAA_SOURCE_COUNT
> +};
> +
> +struct wmaa_args {
> +	u32 set;
> +	u32 val;
> +	u32 ret;
> +	u32 ignored[3];
> +};
> +
> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] =3D {
> +	{ .guid_string =3D WMAA_WMI_GUID },
> +	{ },
> +};
> +
> +static struct wmi_device *wdev;
> +
> +static int wmi_call_wmaa(enum wmaa_method method, enum wmaa_get_or_set s=
et,
> +			 u32 *val)
> +{
> +	struct wmaa_args args =3D {
> +		.set =3D set,
> +		.val =3D 0,
> +		.ret =3D 0,
> +	};
> +	struct acpi_buffer buf =3D { (acpi_size)sizeof(args), &args };
> +	acpi_status status;
> +
> +	if (set =3D=3D WMAA_SET)
> +		args.val =3D *val;
> +
> +	status =3D wmidev_evaluate_method(wdev, 0, method, &buf, &buf);
> +	if (ACPI_FAILURE(status)) {
> +		pr_err("ACPI WMAA failed with %s\n",
> +			acpi_format_exception(status));
> +		return -EIO;
> +	}
> +
> +	if (set !=3D WMAA_SET)
> +		*val =3D args.ret;
> +
> +	return 0;
> +}
> +
> +static int wmaa_get_brightness(u32 *level)
> +{
> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET, level);
> +}
> +
> +static int wmaa_set_brightness(u32 level)
> +{
> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_SET, &level);
> +}
> +
> +static int wmaa_backlight_update_status(struct backlight_device *bd)
> +{
> +	return wmaa_set_brightness(bd->props.brightness);
> +}
> +
> +static int wmaa_backlight_get_brightness(struct backlight_device *bd)
> +{
> +	u32 level;
> +	int ret =3D wmaa_get_brightness(&level);
> +
> +	WARN_ON(ret !=3D 0);
> +	return ret =3D=3D 0 ? level : 0;
> +}
> +
> +static const struct backlight_ops wmaa_backlight_ops =3D {
> +	.update_status =3D wmaa_backlight_update_status,
> +	.get_brightness =3D wmaa_backlight_get_brightness,
> +};
> +
> +static int wmaa_get_max_brightness(u32 *level)
> +{
> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_LEVEL, WMAA_GET_MAX, level);
> +}
> +
> +static int wmaa_get_brightness_source(u32 *source)
> +{
> +	return wmi_call_wmaa(WMAA_BRIGHTNESS_SOURCE, WMAA_GET, source);
> +}
> +
> +static int wmaa_backlight_wmi_probe(struct wmi_device *w, const void *ct=
x)
> +{
> +	struct wmi_wmaa_priv *priv;
> +	struct backlight_properties props =3D {0};
> +	u32 source;
> +
> +	priv =3D devm_kmalloc(&w->dev, sizeof(*priv), GFP_KERNEL);
> +	if(!priv)
> +		return -ENOMEM;
> +
> +	wdev =3D w;
> +
> +	if (wmaa_get_brightness_source(&source))
> +		return -EINVAL;
> +	if (source !=3D WMAA_SOURCE_EC)
> +		return -ENODEV;
> +
> +	// Register a backlight handler
> +	props.type =3D BACKLIGHT_PLATFORM;
> +	if (wmaa_get_max_brightness(&props.max_brightness) ||
> +	    wmaa_get_brightness(&props.brightness))
> +		return -EINVAL;
> +
> +	priv->backlight =3D backlight_device_register("wmaa_backlight",
> +		NULL, NULL, &wmaa_backlight_ops, &props);
> +	if (IS_ERR(priv->backlight))
> +		return PTR_ERR(priv->backlight);
> +
> +	dev_set_drvdata(&w->dev, priv);
> +
> +	return 0;
> +}
> +
> +static int wmaa_backlight_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct wmi_wmaa_priv *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	backlight_device_unregister(priv->backlight);
> +
> +	return 0;
> +}
> +
> +static struct wmi_driver wmaa_backlight_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "wmaa-backlight",
> +	},
> +	.probe =3D wmaa_backlight_wmi_probe,
> +	.remove =3D wmaa_backlight_wmi_remove,
> +	.id_table =3D wmaa_backlight_wmi_id_table,
> +};
> +
> +module_wmi_driver(wmaa_backlight_wmi_driver);
> --
> 2.18.4

