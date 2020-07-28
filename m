Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37B0231368
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Jul 2020 22:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgG1UCW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Jul 2020 16:02:22 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:44096 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728175AbgG1UCV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jul 2020 16:02:21 -0400
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SK0tVe023328;
        Tue, 28 Jul 2020 16:02:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=r5MhQvcEb8BXetG+XB/4O1N036QfanzQo3qfvHbRd6M=;
 b=gS4zOhKjiYfTaV2gXVsvqNWA+hmJ7KE53nWIfz7RnliyjIWqNPBD+MCjzOI8Wp0y/wIE
 14CYOvZPe/2yZbq7LEwgLXZe4aNRNTea5ejoJ8bShiqF2fsUI1A1jVnVK5jU6Du2PEQm
 ZRxPvwZJGKFKFVB+KqT9YRcGtQG8xBy9UYcq1m1gXLrZ+JnMtM2wmKQKv+W3sio7AfVu
 RSRowDtoH4H4aStbzf4amKKsiw0IHypsj70A08XaQ/DgW7CN+O8DzpOkUaGeAjr5kR22
 uPtxLa2Eih/LbfhR1t5JLLfzq6bkoMTUvu3V0afOLNufQUNxjcZA2dh4u6X2CBAtDftk GQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 32gfa4mxg2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 28 Jul 2020 16:02:18 -0400
Received: from pps.filterd (m0144102.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06SJvKLL156043;
        Tue, 28 Jul 2020 16:02:17 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
        by mx0b-00154901.pphosted.com with ESMTP id 32jsvd0r83-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 28 Jul 2020 16:02:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+F+pakfnNiLwQyeIHDxH9m2obYvCBFBpm2w5FDrTs8riMJPKaZOQulVdRNB7jKB2jOPmFMWFXcdQLRn0xs068qKqNv2j+wmpNz3UBElAwzUDvGVkI0f2LPju0m3qJMc1Y3Lp44mjsUsEjuQtGsuCsG3vplWZl8F82wFEaEsKNVLJyBqFQDe/kYFxPYfqwGPPm5K2o5q/t5tims8TJ4vG9dSxQOWLgb+HvBDqGv4tZevXcK1IELdgK4glhfN0mTBCEd68Wrld3q8m51kmRKkHFNbrqzhu8D5mH6JwqwQkUH/TqdRN0Ot5y3ZUDR6Jek4a3OcHGPonA3LMsU08rOwqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5MhQvcEb8BXetG+XB/4O1N036QfanzQo3qfvHbRd6M=;
 b=HrhnAI4hlw4NvnIuGOfSOB/J5sl10LgZth/4KLB9UGsAswYEcfF28HTN6U4Eo7ogOEXiazSOb4pQia4HIJwF8pOS4ruTToMQrNNVXwA6SDag73qFHY98HHfmtf10CZVhNKYYx0jixHODHg/nQYL1M76IvtFY78OpXv/eBwZ7041o00AtPvT7XJ0w4Hfy03ky2UbjxF/ZPovVfxE0KnVXxK8ehVeYCRYZ8eSvH09f7iOc+Nd4EAWxGZUGWZq1iA/bGteihsEPlAwbdFiHsIog7ng+xnAlvCqSxvYfViMV08eyummDWpOlX6DO7ty5fFBmsaMGePJgwTch5PFwkTbiwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5MhQvcEb8BXetG+XB/4O1N036QfanzQo3qfvHbRd6M=;
 b=UmGqJlnv/wO4vrxRsyuLhqgEN6NaNTTfQkteTUCPx339QREmU6kdzbB7dyGMRHpEG7nn1OcTpJnXKeByBzbpvC6zoJGPvYAaqFFsp8zNMwSWgP1QGmaZPZw3UqfMkQgjhBAuizyPvb8qITN4do45rPNCE35kscVj7+OsRu4n/mk=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DS7PR19MB4392.namprd19.prod.outlook.com (2603:10b6:5:2c4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Tue, 28 Jul
 2020 20:02:16 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3195.032; Tue, 28 Jul 2020
 20:02:16 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Daniel Dadap <ddadap@nvidia.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     Aaron Plattner <aplattner@nvidia.com>
Subject: RE: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based backlight
 control
Thread-Topic: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
Thread-Index: AQHWZFhaeXc6p1iTaUy5Ftb5N9eQU6kdappA
Date:   Tue, 28 Jul 2020 20:02:16 +0000
Message-ID: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <20200727205703.28140-1-ddadap@nvidia.com>
In-Reply-To: <20200727205703.28140-1-ddadap@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-07-28T20:02:12.2276330Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=4040c94e-721d-41e1-80b6-c36a398b8bf6;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4481347a-0cf1-4daf-f1d9-08d83331204f
x-ms-traffictypediagnostic: DS7PR19MB4392:
x-microsoft-antispam-prvs: <DS7PR19MB439225C15227DA0F50D374E1FA730@DS7PR19MB4392.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mwX4m2xLZdRzaacVAkhzmDOWfmFoJP4/BIBX3Zc1ouzi43TNMrv8DJY/lGFSr+98RKhHtjG0TbZ91vN5bWDUSdOpKUZXj7+LTuLZMYu96E3XrfrjNYhcSWG4ANXCjsNHCMG9yeP2weFJ52Oo6Hc2QIX7o/nl1cuZmu4ZNsC0tinWpQTv+14sdWD5y7JEOhb3Hn06R4Aa4Mm7hWNH6NM9JRgAXTyZqgRILSwcDboPYFnC1avpT7XBA7OERKCibwK1jyPycKeUjKZ+B8XWPpLhGeD9hvSsBQwaMEDzRiHbkGWAIebOLpPVwZvkLdCt3obX7kDx5DDwyjCLnMp0B6NNfYeO6rtJxf6TKrp+hPi2x1QjFVlGWE3JE9x3xkZ8GoJnEOMv4RWJEqrHtpp2YcauBa/p76NMrfudP0MXBPM4b2IOmJxTezNluAq9D1oq6rNYEF0onkqC8BH46e8b7RvElA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(346002)(366004)(39860400002)(396003)(2906002)(55016002)(4326008)(966005)(6506007)(53546011)(9686003)(83380400001)(86362001)(478600001)(316002)(66556008)(66446008)(66476007)(52536014)(71200400001)(186003)(26005)(110136005)(8676002)(7696005)(5660300002)(786003)(33656002)(8936002)(76116006)(66946007)(64756008)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: s6IG7BT4nUMdLSUYnwQlQzByQQ0ai8Iakq4j2MZX0KSNI1pD2aNyCkrnRdEIoX+b7x/zDFiRY8ukoSUsIdFMHhKJEqSjFu5SlyNMacbTE+bObr76FksFCyj6rZRn8j2S8lA6x1dQkLomzxyCw0XrS6rPlijHrUosKZkQtT2uAw/+KC8u1PbTFRS+sYuhkeMA5elMfBy8PqFyn+5J77Urv9B2C2/anr9Qg2sgaYzNopn+pfMvcFUIyMJwzqQRlSfIHlggX8VPcUiYMX2Fw0CZHkMWnG0AjGwlxMchJg+rrDlWpF4FBBRO+sc6G1W8naBKEna9utNF38DgmLmcLeOTulTLHk9SacRnZkfkYJoNhkfrne8xfhZ/ziCwVLZAz0mClIkVbExQnNDAP7jy6IroTJfLEc8uUkRqWvKkxmCL1nTCfefGkdO2RUxVShxayhThsv3/wz3VsYEKE2JlZmcnrvjoE7JzDL/33CerW5emUKTzNolbkODH0P95CDeKXpxTNhA9ZGy+3OGVphuELDx1IbUIj1GEiKXKmdFhqltV7r2fYr4LsyzmJmf5hgtg7cZQrIsu1fp83mUgoEOEa9vcdsGp8nHg4sbvGqSCDpoNmpPb29hshpv0UW4aoB24ky/vbpDfcJr3inMMS+TnCDWWcw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4481347a-0cf1-4daf-f1d9-08d83331204f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 20:02:16.0609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82YUPBaWtJf2SMKR7sV5r7hB8kdqCg3/8cHUK0Is/z3yvlT5+hvTHPxMZbYFOWiB0RXPxv449XkD5dnKc7dRE5oiafuimBoBEo6Kl86ba4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4392
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-28_16:2020-07-28,2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280140
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007280141
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Daniel Dadap
> Sent: Monday, July 27, 2020 3:57 PM
> To: platform-driver-x86@vger.kernel.org
> Cc: Daniel Dadap; Aaron Plattner
> Subject: [PATCH] platform/x86: Add driver for ACPI WMAA EC-based backligh=
t
> control
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> A number of upcoming notebook computer designs drive the internal
> display panel's backlight PWM through the Embedded Controller (EC).
> This EC-based backlight control can be plumbed through to an ACPI
> "WMAA" method interface, which in turn can be wrapped by WMI with
> the GUID handle 603E9613-EF25-4338-A3D0-C46177516DB7.
>=20
> Add a new driver, aliased to the WMAA WMI GUID, to expose a sysfs
> backlight class driver to control backlight levels on systems with
> EC-driven backlights.
>=20
> Signed-off-by: Aaron Plattner <aplattner@nvidia.com>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  MAINTAINERS                               |   6 +
>  drivers/platform/x86/Kconfig              |  11 ++
>  drivers/platform/x86/Makefile             |   2 +
>  drivers/platform/x86/wmaa-backlight-wmi.c | 153 ++++++++++++++++++++++
>  4 files changed, 172 insertions(+)
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
> index 000000000000..890e9371f91a
> --- /dev/null
> +++ b/drivers/platform/x86/wmaa-backlight-wmi.c
> @@ -0,0 +1,153 @@
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
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/backlight.h>
> +
> +MODULE_AUTHOR("Aaron Plattner <aplattner@nvidia.com>");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> +MODULE_DESCRIPTION("WMAA Backlight WMI driver");
> +MODULE_LICENSE("GPL v2");
> +
> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> +
> +MODULE_ALIAS("wmi:"WMAA_WMI_GUID);
> +
> +static struct backlight_device *backlight;
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
> +	status =3D wmi_evaluate_method(WMAA_WMI_GUID, 0, method, &buf, &buf);
> +	if (ACPI_FAILURE(status))
> +		return status;
> +	if (set !=3D WMAA_SET)
> +		*val =3D args.ret;
> +	return status;

Could you talk a little bit about why wmidev_evaluate_method didn't work fo=
r you here?

I would expect that if you use wmidev in this code that there can be less b=
oilerplate
init code since more is handled by wmi.ko.


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
> +	return level;
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
> +static int __init wmaa_backlight_wmi_init(void)
> +{
> +	struct backlight_properties props;
> +	u32 source;
> +
> +	if (!wmi_has_guid(WMAA_WMI_GUID))
> +		return -ENODEV;
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
> +	backlight =3D backlight_device_register("wmaa_backlight", NULL, NULL,
> +					      &wmaa_backlight_ops, &props);
> +	if (IS_ERR(backlight))
> +		return PTR_ERR(backlight);
> +
> +	return 0;
> +}
> +
> +static void __exit wmaa_backlight_wmi_exit(void)
> +{
> +	backlight_device_unregister(backlight);
> +}
> +
> +module_init(wmaa_backlight_wmi_init);
> +module_exit(wmaa_backlight_wmi_exit);
> --
> 2.18.4

