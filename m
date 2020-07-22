Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6400C229F78
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jul 2020 20:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgGVSqe (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jul 2020 14:46:34 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:3680 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726564AbgGVSqe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jul 2020 14:46:34 -0400
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06MIdxWR025179;
        Wed, 22 Jul 2020 14:46:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=qEEC7MRKlPnzIgkvd74lB/Yqiq0cfMPkrcNgdsIpr9U=;
 b=djUiU4RWdKzlmDiiY/IsjwJ4Yk6ft1Nn664nz8K9g/9rNuPJuB/Zl13kac06AJYaxWDN
 Jfz6kzl5NXnX7P5+FOyFwqVj5u3Mtx+HCgiSv030VDSdxtw2Ve1TYivhD0uZbUJwc3Wf
 gYNzluy2LyrCjI9HpT+chnpCdHL3rdDLOwG9qF3HRo75AS+/Mo4Af/TJ4dNKG7jvA+rR
 /z9lf1rgmQi2VRKEBgVcoBh1W7Hje/UP4KZDuItM8LmoSkFvZ1vL7kR15sYQ4Gg81f+t
 WEXKj1w6rweDKVwimYpcqVXfjuKdFH5fDdPe2Gdd/s+FRELhTqa5XA0IXK47e+Q0XyLa UQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 32c1eawykh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Jul 2020 14:46:18 -0400
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06MIevGW195293;
        Wed, 22 Jul 2020 14:46:17 -0400
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
        by mx0a-00154901.pphosted.com with ESMTP id 32etpprb89-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jul 2020 14:46:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdONSu6JfYU7/6+wfIHKwJsnS/apYlWn6otlbLzt6OpLBFic8b1oqgiiudkkA7vjg8zirRKNNmjTwSyOwZZXgcZ16IIq/qKskE63A1eUsrpvqFn9/PK7ttLFB8I6fd1MmiVEBl5LsTnRySGHAf1fYGmUvkKfaIoAaEPE4sJz6BeAtjJJ6I22E5VvvBgne56V8z5QfVRQwFHMzK9Pv39alszeUbOzGTBY3+l5DkMCmvEqK4NZtaLsTbtyNiHOr8bkB3O9YvJ0mtqNeMG7c1h6OcX++xy/LFEjAt0erd6mlpkB+zkH9Zd8NE90mUoO9rLkKFlGppYP8J1AzRCMue8RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEEC7MRKlPnzIgkvd74lB/Yqiq0cfMPkrcNgdsIpr9U=;
 b=ZwtD6/x/M0v5ntVOo26MWzMZTfv0UZEbFqq1pggn4SY+4+9gUePWXRR5x8ypUuQV98wBAX38TZT06Jbdnp4lKQaovPKh92QhaL3AbA1V/4dP5kVutSVe1azF9XTTCl2icdADkyJ+F779OdLrzhDqxgSHfZQ8RyQm7NDQAjA2c0eteLpE8axftimgQt9+O4v79Gnghbf9UShwY2yz+Zf1MKIZt0prEQc1rq0T8DmXaeAJxxszaxkGe1SIQQwKH83QH1ui5tqKRuMg4jH7zvJzypx+11su1x2RdcItrofjlVd9FcdydjQMLckK1FycSfSkQnXrFxYd09I9wYsVSpGBtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEEC7MRKlPnzIgkvd74lB/Yqiq0cfMPkrcNgdsIpr9U=;
 b=Ty5Ox5VpiNnmKLACIiDkbweaXBIAnRbXrLADm9RBworMQij6w8ud/sT4XHxvTQR6sepWnJ1IKR+sa2N57t1IDqVKoN0YkLNsUL57uGQde5wKvVOAdW+hWcLpuzCHJbGS6G0njBHvoljBGlr6h2buznkwGOxnUnr/St2HsyJo3sc=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR1901MB2023.namprd19.prod.outlook.com (2603:10b6:4:a6::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.25; Wed, 22 Jul
 2020 18:46:15 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3195.022; Wed, 22 Jul 2020
 18:46:15 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mark Pearson <markpearson@lenovo.com>
CC:     "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "bnocera@redhat.com" <bnocera@redhat.com>,
        "bberg@redhat.com" <bberg@redhat.com>,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: RE: [PATCH] platform/x86: thinkpad_acpi: performance mode interface
Thread-Topic: [PATCH] platform/x86: thinkpad_acpi: performance mode interface
Thread-Index: AQHWYEtB2AZ16m+5BkiCkmlUDRcurKkT57Ig
Date:   Wed, 22 Jul 2020 18:46:15 +0000
Message-ID: <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200722171108.65185-1-markpearson@lenovo.com>
In-Reply-To: <20200722171108.65185-1-markpearson@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-07-22T18:20:22.4879601Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=1f61758f-9ff3-4dec-ac0e-4095e49ae597;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a4c1c79-1617-4c91-b42c-08d82e6f834f
x-ms-traffictypediagnostic: DM5PR1901MB2023:
x-microsoft-antispam-prvs: <DM5PR1901MB20232A0DE82C7BFD24DFAADAFA790@DM5PR1901MB2023.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qdcOTGz58J93ysK9TY6apG/tNgHbp6ZhlaDHltUfVsAqn7DQCFoXdQ40eYM7Hk9BX6oZ36NGEnPIGYDFrKA4JC4Cza1d0sO7USb7hkyTf1fXOLLFm+cC7uCfW2lH2FoYpRp0bASchkE2mKd9TilzLCEphYoUrh0xCSzPp6EbUbajWpRPh0fN0koxGC1v5RXcchqbG6unRnTuQ4DF7aiaEwzVJ1vK1r3Xp7e58iJGJChXOnWkK+9Nxj+98Vza6wKm4Nz2DF0Jxh9BIBeIkP2BUGvU3wtBSyZtwHy+yzLxJRWd96FIX41upYOigLE9ls7pw8EYYrEUGD1DbBIkoyLeP3wafyOGmRBFvO8EkcAULkYqC1SB2NwxAE1S4vbp/tSv7j/FeYfR8UmPsmQfIkvjGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(396003)(346002)(376002)(366004)(39860400002)(786003)(8936002)(316002)(54906003)(478600001)(71200400001)(52536014)(4326008)(186003)(2906002)(26005)(966005)(30864003)(9686003)(8676002)(64756008)(66556008)(66476007)(66946007)(76116006)(33656002)(6506007)(7696005)(83380400001)(55016002)(5660300002)(6916009)(86362001)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: VXfpZOeY9RPw5lH6pqsIRrq0ckLUWnyS0cNfPz+ShQ0QMgSW3Wu1kFH4VY5eNbFLq9AdIkPscjCOXz2SnUW4ppJXKP74kW4evLWe9ZarOj2CbP4Dr1+pn31k5MQcX3HlSHR2h3qUwJPGIu1dc1ZouEdzSpvwbl3jTKT/kM1iq1aroXm/rtc9JTm/bnstnfvCtewCuw+3QuC8vZuBl73y2/qEy2/CbDE1EZ5O8xFDVC1Eqxpb6xR/pNTvk67gDyojo5KeQg475H0Eyb1KCIk7+ZIZg/DNhRh6cS2aagjZ8YlEDziMAfOV3vfJ/Yp2kNkr2KA+QUc/nsptpWmnhHcN9PAPI9nBU5epf6GFFzpPn7SdlSyR2DisUMHl7KmKvvkhr3KwLQGoUsM1PXp53tA/u4GthceD0kRyS8cC0xou/mDW4undbJcbffEbh6p6GT60KoRMOBsHJ8f4mymlYBspxhNFeprGhYD3bN6FzJi3F54iXqZfEP0sPGKZISRwLHLa
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a4c1c79-1617-4c91-b42c-08d82e6f834f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 18:46:15.0692
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQ2vQzAqi0wEe+BaMPP2nhDoj/H/vcF8pG5oeV19mhIslni2CfJ+UtWQtcizXwTvlf9/2rRLbzJmwjAPNkPqFfXWcq5cof18RnsYikGBTB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1901MB2023
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_10:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220119
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220119
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>=20
> Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
> firmware to provide different performance/thermal modes.
>=20
> The modes can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch
> the operating mode between three different modes.
>=20
> H - High performance. Maximum power is available and the temperature is
> allowed to increase to the maximum for the platform.
> M - Medium performance (aka balance). In this mode power will be limited
> and the laptop will have a lower maximum temperature.
> L - Low performance (aka quiet). In this mode power consumption is reduce=
d
> and the device will be cooler.
>=20
> High performance mode is only available when the device is in 'desk mode'=
.
> If the device detects that it is on a lap then it will automatically drop
> into medium mode to maintain a safer operating temperature.
>=20
> This patch provides an interface to determine the current mode and to als=
o
> allow the setting of the mode through the dytc_perfmode sysfs entry. This
> can be used by userspace for improved control.
>=20
> Reviewed-by: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  35 +++
>  drivers/platform/x86/thinkpad_acpi.c          | 209 +++++++++++++++++-
>  2 files changed, 235 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index 2e9d62903ead..d5fef0bb562b 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -52,6 +52,7 @@ detailed description):
>  	- LCD Shadow (PrivacyGuard) enable and disable
>  	- Lap mode sensor
>          - Palm sensor (aka psensor)
> +        - Thermal mode status and control
>=20
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1466,6 +1467,40 @@ determine if the sensor is not installed or not. O=
n
> these platforms the
>  psensor state will always be reported as true to avoid high power being =
used
>  incorrectly.
>=20
> +DYTC Thermal mode status and control
> +------------------------------------
> +
> +sysfs: dytc_perfmode
> +
> +Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
> firmware to
> +provide improved performance control.
> +
> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch t=
he
> +operating mode between three different modes. This sysfs node provide a
> better
> +interface for user space to use

So is userspace also notified in some way when you use the hotkey to change=
, or
is the event usurped by the EC?  Is this by the event TP_HKEY_EV_THM_CSM_CO=
MPLETED?

You might consider to mention what other interfaces will conflict with this
and document them and/or artificially block them when this is loaded to pre=
vent
such a conflict.

> +
> +The modes available are:
> +
> +H - High performance. Maximum power is available and the temperature is
> +allowed to increase to the maximum for the platform.
> +
> +M - Medium performance (aka balance). In this mode power will be limited=
 and
> +the laptop will remain cooler.
> +
> +L - Low performance (aka quiet). In this mode power consumption is reduc=
ed
> and
> +the device will be cooler and quieter
> +
> +Note: High performance mode is only available when the device is in
> 'deskmode'. If
> +thde device detects that it is on a lap then it will automatically drop =
into

the

> medium
> +mode to maintain a safer operating temperature.

I don't see an explicit notification path for this, how will userspace know=
 about it?

Doesn't it need some sort of change uevent?
Or is this implied by the event TP_HKEY_EV_THM_CSM_COMPLETED?

> +
> +The sysfs entry provides the ability to return the current status and to=
 set
> the
> +desired mode. For example::
> +
> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode

Doesn't this need ABI documentation submitted as part of the patch?

> +
>  EXPERIMENTAL: UWB
>  -----------------
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 40f2e368fdf9..5aebaf1718b1 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9799,10 +9799,33 @@ static struct ibm_struct lcdshadow_driver_data =
=3D {
>   * DYTC subdriver, for the Lenovo lapmode feature
>   */
>=20
> +#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision =
*/
> +#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
>  #define DYTC_CMD_GET          2 /* To get current IC function and mode *=
/
> -#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> +#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
> +
> +#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 =3D disabled, 1 =3D enable=
d */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
> +
> +#define DYTC_GET_FUNCTION_BIT 8  /* Bits 8-11 - function setting */
> +#define DYTC_GET_MODE_BIT     12 /* Bits 12-15 - mode setting */
> +#define DYTC_GET_LAPMODE_BIT  17 /* Bit 17 - lapmode. Set when on lap */
> +
> +#define DYTC_SET_FUNCTION_BIT 12 /* Bits 12-15 - funct setting */
> +#define DYTC_SET_MODE_BIT     16 /* Bits 16-19 - mode setting */
> +#define DYTC_SET_VALID_BIT    20 /* Bit 20 - 1 =3D on, 0 =3D off */
> +
> +#define DYTC_FUNCTION_STD     0  /* Function =3D 0, standard mode */
> +#define DYTC_FUNCTION_CQL     1  /* Function =3D 1, lap mode */
> +#define DYTC_FUNCTION_MMC     11 /* Function =3D 11, desk mode */
> +
> +#define DYTC_MODE_PERFORM     2  /* High power mode aka performance */
> +#define DYTC_MODE_QUIET       3  /* low power mode aka quiet */
> +#define DYTC_MODE_BALANCE   0xF  /* default mode aka balance */
>=20
>  static bool dytc_lapmode;
> +static bool dytc_mode_available;
>=20
>  static void dytc_lapmode_notify_change(void)
>  {
> @@ -9822,7 +9845,81 @@ static int dytc_command(int command, int *output)
>  	return 0;
>  }
>=20
> +static int dytc_perfmode_get(int *perfmode, int *funcmode)
> +{
> +	int output, err;
> +
> +	if (!dytc_mode_available)
> +		return -ENODEV;
> +
> +	err =3D dytc_command(DYTC_CMD_GET, &output);
> +	if (err)
> +		return err;
> +	*funcmode =3D (output >> DYTC_GET_FUNCTION_BIT) & 0xF;
> +
> +	if (*funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +		int dummy;
> +		/* We can't get the mode when in CQL mode - so we disable CQL
> +		 * mode retrieve the mode and then enable it again.
> +		 */
> +		err =3D dytc_command(0x000F1001 /*Disable CQL*/, &dummy);
> +		if (err)
> +			return err;
> +		err =3D dytc_command(DYTC_CMD_GET, &output);
> +		if (err)
> +			return err;
> +		err =3D dytc_command(0x001F1001 /*Enable CQL*/, &dummy);
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
> +	if (!dytc_mode_available)
> +		return -ENODEV;
> +
> +	if (perfmode =3D=3D DYTC_MODE_BALANCE) {
> +		/* To get back to balance mode we just issue a reset command */
> +		err =3D dytc_command(DYTC_CMD_RESET, &output);
> +		if (err)
> +			return err;
> +	} else {
> +		/* Determine if we are in CQL mode. This alters the commands we do
> */
> +		err =3D dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
> +		if (err)
> +			return err;
> +
> +		if (cur_funcmode =3D=3D DYTC_FUNCTION_CQL) {
> +			/* To set the mode we need to disable CQL first*/
> +			err =3D dytc_command(0x000F1001 /*Disable CQL*/, &output);

Why not put 0x000F1001 and 0x001F1001 as defines at the top?

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
> +			err =3D dytc_command(0x001F1001 /*Enable CQL*/, &output);
> +			if (err)
> +				return err;
> +		}
> +	}
> +	return 0;
> +}
> +
>  static int dytc_lapmode_get(bool *state)
> +
>  {
>  	int output, err;
>=20
> @@ -9846,6 +9943,77 @@ static void dytc_lapmode_refresh(void)
>  	dytc_lapmode_notify_change();
>  }
>=20
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
> +
> +	switch (perfmode) {
> +	case DYTC_MODE_PERFORM:
> +		/* High performance is only available in deskmode */
> +		if (funcmode =3D=3D DYTC_FUNCTION_CQL)
> +			return snprintf(buf, PAGE_SIZE, "Medium (Reduced as lapmode
> active)\n");
> +		else
> +			return snprintf(buf, PAGE_SIZE, "High\n");
> +	case DYTC_MODE_QUIET:
> +		return snprintf(buf, PAGE_SIZE, "Low\n");
> +	case DYTC_MODE_BALANCE:
> +		return snprintf(buf, PAGE_SIZE, "Medium\n");
> +	default:
> +		return snprintf(buf, PAGE_SIZE, "Unknown (%d)\n", perfmode);
> +	}
> +}

I think it's pretty confusing that you write "H/M/L" into this file, but yo=
u
get back a full string.

> +
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

Shouldn't this be dev_err?

> +		break;
> +	}
> +	if (err)
> +		return err;
> +
> +	tpacpi_disclose_usertask(attr->attr.name,
> +				"Performance mode set to %c\n", buf[0]);
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(dytc_perfmode);
> +
> +static struct attribute *dytc_perfmode_attributes[] =3D {
> +	&dev_attr_dytc_perfmode.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group dytc_perf_attr_group =3D {
> +	.attrs =3D dytc_perfmode_attributes,
> +};
> +
>  /* sysfs lapmode entry */
>  static ssize_t dytc_lapmode_show(struct device *dev,
>  					struct device_attribute *attr,
> @@ -9856,22 +10024,22 @@ static ssize_t dytc_lapmode_show(struct device *=
dev,
>=20
>  static DEVICE_ATTR_RO(dytc_lapmode);
>=20
> -static struct attribute *dytc_attributes[] =3D {
> +static struct attribute *dytc_lap_attributes[] =3D {
>  	&dev_attr_dytc_lapmode.attr,
>  	NULL,
>  };
>=20
> -static const struct attribute_group dytc_attr_group =3D {
> -	.attrs =3D dytc_attributes,
> +static const struct attribute_group dytc_lap_attr_group =3D {
> +	.attrs =3D dytc_lap_attributes,
>  };
>=20
>  static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>  {
> -	int err;
> +	int err, output;
>=20
> -	err =3D dytc_lapmode_get(&dytc_lapmode);
> +	err =3D dytc_command(DYTC_CMD_QUERY, &output);
>  	/* If support isn't available (ENODEV) then don't return an error
> -	 * but just don't create the sysfs group
> +	 * just don't create the sysfs group
>  	 */
>  	if (err =3D=3D -ENODEV)
>  		return 0;
> @@ -9879,14 +10047,37 @@ static int tpacpi_dytc_init(struct ibm_init_stru=
ct
> *iibm)
>  	if (err)
>  		return err;
>=20
> +	/* Check DYTC is enabled and supports mode setting */
> +	dytc_mode_available =3D false;
> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
> +		/* Only DYTC v5.0 and later has this feature. */
> +		int dytc_version;
> +
> +		dytc_version =3D (output >> DYTC_QUERY_REV_BIT) & 0xF;
> +		if (dytc_version >=3D 5) {
> +			pr_info("DYTC thermal mode configuration available\n");

I would argue this isn't useful to most people.
1) You should decrease this to debug for use with dynamic debugging
2) Output in the log what integer value you returned back in case of a need
to identify future firmware bugs.

> +			dytc_mode_available =3D true;

I think you shouldn't set this flag until after the group is actually creat=
ed.

> +			/* Platform supports this feature - create the group */
> +			err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj,
> &dytc_perf_attr_group);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	err =3D dytc_lapmode_get(&dytc_lapmode);
> +	if (err)
> +		return err;
> +
>  	/* Platform supports this feature - create the group */
> -	err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group=
);
>  	return err;
>  }
>=20
>  static void dytc_exit(void)
>  {
> -	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
> +	if (dytc_mode_available)
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
>  }
>=20
>  static struct ibm_struct dytc_driver_data =3D {
> --
> 2.26.2

