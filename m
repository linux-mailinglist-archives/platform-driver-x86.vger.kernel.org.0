Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DEE0C24E08D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Aug 2020 21:15:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbgHUTP5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Aug 2020 15:15:57 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:3708 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725850AbgHUTPx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Aug 2020 15:15:53 -0400
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07LIubAK029617;
        Fri, 21 Aug 2020 15:15:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=0xja3VcrVDxf+69zrVf4WdOM5U6DmMBZE4tkr4tmKco=;
 b=rGGD41S6tWenSkIZMrbn143s8vKwPgDYwfJj0G3uAJ+Sg5xenPCBXnq1+TaZGQCoBZTq
 jdB0w+jL29lqekmTZvDh8Ig9LON5UPLTi1rUgFEKoaHPrxFEN9iu2KaBAo+ImZNxVfb5
 LbyofYNl/VBLCtHW+vdt+IFrTwXX8xxJNcuzPjl5hfuOJDLjS/WarrsZV3yoXCF/uD2B
 y+75VwhnSVdgPJjgxqXwfF/MVz7H+lnD2HfBqCuIvADIOhthpXBBLspdMAb0L8fwqZmr
 wwKSeTwCSaoeHvJCA/2c7ccOcvUy7cwZV0UMOd/OK8Mo2M76eN1u6T6I+8t2trCX8yko fQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 3304jcqvs0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Aug 2020 15:15:29 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07LJDlvd124200;
        Fri, 21 Aug 2020 15:15:28 -0400
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2054.outbound.protection.outlook.com [104.47.44.54])
        by mx0b-00154901.pphosted.com with ESMTP id 332jdcsf7u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Aug 2020 15:15:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lceo5CYnQrOy+YPhQTCpWl/2PvZPGTs8IEVzTKPzRN0aaEdBwy/bsl7ITJECIic0OCN++a/QgtUP6iE/dyKVZnE1KKyHO3Q+jEOOTTvue7u1CvSKelNZ2E9AtQ7VWHHPdsoC+5IdqhpK7+45v3odHFFv19juO/UOKo9QJ4YsiC3y7x/v/dz2maetHfU9c3+MF7/BnuTaWclPz3MDd/paiZGAxQeAbc5TgqB4pF1Gb44s/3dMMWgDjtM8t3udmOq0DVask1WRIaV+/BewhoybFbN4ameMvkmGSPW+XL9jQBWUY9hNPHkidXKzTO94iRVFdB+5DkqwHf+xuO6f73WrMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xja3VcrVDxf+69zrVf4WdOM5U6DmMBZE4tkr4tmKco=;
 b=VWnaWPuciU8tu79rhlNsYmBO7lEqSdD7uL1FxW9GSwQfTy7QNGEUnbmJl0NkRTtECIfd3K+j8YBkg/dkfNm1U2ZRwiihVutR/pG2GqtGKnJdgIPBj2NyJXIYOyPUGAWm+af8+rnadiM+gt5z5f3ykL0UdcM6DUJwfqjtKk2bI2De4+8QzXpku3Dn4vHWmgXFAIqKRHxKXKd1H6gl0l/pUmBxl3QIQu2qsyU0H/ycQg3vGekGBOXwTvoljPWuBREchyEIk3kQxIalFL2pFK9xktyqRv9igXra/ZTXJCpVBJRe7laD51i/W50JaoRPQG8Xm1QlOelqHI+m9vy07Pu8vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0xja3VcrVDxf+69zrVf4WdOM5U6DmMBZE4tkr4tmKco=;
 b=AYVXH+V4jbeYYlw+HhqT2t5vcrT/mKVQzuaClyBmZi6jtPWSd88WD1VN7hnj67kJIRHLHOw63LmdeJ5X/bH3dHGLoPkz35bkeFZY7nqDbwEP160/Rvkw6KEVkRhrt7Wssia8Jhs4ONx//1/evtAW58h3ev1SAqP6cjNH8wAwU5o=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB3932.namprd19.prod.outlook.com (2603:10b6:5:22b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24; Fri, 21 Aug
 2020 19:15:26 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 19:15:26 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mark Pearson <markpearson@lenovo.com>
CC:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "bnocera@redhat.com" <bnocera@redhat.com>,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: RE: [PATCH v2] platform/x86: thinkpad_acpi: performance mode
 interface
Thread-Topic: [PATCH v2] platform/x86: thinkpad_acpi: performance mode
 interface
Thread-Index: AQHWd+QBvbgdvM4ZREOC8jacDgPt5KlC7TcA
Date:   Fri, 21 Aug 2020 19:15:26 +0000
Message-ID: <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
In-Reply-To: <20200821175310.335873-1-markpearson@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-08-21T19:13:37.2980809Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=df529500-2aee-4651-879e-e1278043e91a;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 510b6711-9f0a-4ac4-8820-08d846068fa5
x-ms-traffictypediagnostic: DM6PR19MB3932:
x-microsoft-antispam-prvs: <DM6PR19MB3932D7CF24848A5F896BB3F4FA5B0@DM6PR19MB3932.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W1jqkZ0agJPPz88ExgFGrJi/XJE9HuUZPvGIRmjy+O4pdbnbAsUEIlGllN6Eo8R7x1qDWo31GbMYtsds/+/ojC/oG79SzJlhsChWTDiB8xhXpu8TLPJcEskQuFWerq3uf0bUQh+MCTFxtlKFI3N+ktNzKIW8cKYaMTAmY4tH5aLkcw7D8X2mlzaO3xlvDFWouZdDkW4hL9JuQowAd2+/xSH4Z0NXHDKRg+19xgBeoOOSvPArCHUe8N073E0qBR7cziaEsB8qDWFt/p4Io30/sVwkJFR3KmeRZQ7BNzRVZkqKc2WraqEL+MmOgxZkCv1sO38aK+3xrHqSIpAsXgd/R5s8K0p7+kRL7iJ5X4OrGOFGrOH4uXINL1V6rs0sdjg3vEDad3JCFbFiaju2END6rw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(376002)(39860400002)(396003)(55016002)(6916009)(30864003)(83380400001)(2906002)(8676002)(54906003)(6506007)(8936002)(9686003)(786003)(66446008)(64756008)(52536014)(966005)(66476007)(26005)(478600001)(71200400001)(186003)(33656002)(66556008)(5660300002)(7696005)(86362001)(76116006)(66946007)(316002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 3ySx6NVuedRw88A2n/v7JInxPwVVU436sb89E+cmUsH8DHM90iwGA8x7U/hw7SC9LgiTNy0Z5UcqUaZwCRttmsRB+EOSprbIFdQeAxqiCKoFTpyIVta1d7IH+isTQaEUj5oAMzbBAoqFM4yWOrEbabTju+SbCWmaod4PF1PLnyVZVVO/si4ZYsmMS4ugWlIaFFUZio6gDBc2pnOOWShtlQcem1hT3xHw+nzcaz8WwPRmnsru6Qnn/+n6iou389y7m8SagnB7HBApXFZvbBCnU3YGKJKRu7oC3B2988FF04ploMxj+xE/xM0xrzo9r/IqEVSyXDGMapBxnCiqBF0w2sMcx2rHh7I+hnNFlgw1KF0KtpEKVJnAMNH1THsTUYW4/MqU+KDgfLYplcSNKJr00LFRbJaki8T5s1tVdgq5ETSPByfafCgZr2IbnP74KAmKvQCyX/uAM7/h5mEd43q80AIMpfwEvyraRooekooPthTzBaCEMAJjABuSA69hAOSaX6STnTCzyR+XANGDMLS/+I2zDcfgOBolfaSRK0LHoqDkZs+ofejaUtU6Ucw6BQB+b2kpzLqc2Z1q4j4m/8kkBvdxCyFbD3g+1aaDqzte1A6nYRSTBi+9RQQSEstOpuRvBWjfj93GGf05SrTfuR3OOg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 510b6711-9f0a-4ac4-8820-08d846068fa5
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 19:15:26.4854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bwRa2ngZIypkDqleV1ZhkA8O9w4qrnypSODND1rQpdXwfSXRWFwxGySDP9q0slYmh7fNeuXsI0ESyvp2KmPvtSGUoh280oZrnOoEjC38uNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3932
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-21_09:2020-08-21,2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1011 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210179
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008210178
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
> Changes in v2:
>  - Add userspace notification to hkey event handler. Note this got
>    somewhat more complicated than expected as retrieving the performance
>    mode when in lapmode generates an event itself; added a flag to
>    ignore these known events.
>  - Updated the values returned to be simpler (H/M*/M/L) as suggested.
>  - Added ABI documentation as requested. Lap and palm sensor details
>    added whilst I was doing this.
>  - Cleaned up code based on recommendations as well as feedback received
>    from other patch reviews.
>  - Based on discussion with firmware team the lapmode sensor should only
>    be made available for DYTC v5 and later. Added this to init logic.

Thanks for adapting a lot of my feedback, this looks much better to me.

>=20
>  .../sysfs-devices-platform-thinkpad_acpi      |  34 +++
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  35 +++
>  drivers/platform/x86/thinkpad_acpi.c          | 267 ++++++++++++++++--
>  3 files changed, 310 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-devices-platform-
> thinkpad_acpi
>=20
> diff --git a/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_ac=
pi
> b/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi
> new file mode 100644
> index 000000000000..28f07753a889
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-platform-thinkpad_acpi
> @@ -0,0 +1,34 @@
> +What:		/sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +Date:		August 2020
> +Contact:	Mark Pearson <markpearson@lenovo.com>
> +Description:
> +		Reads return the current performance mode setting configured in
> firmware using
> +		the below nomenclature.
> +
> +		Writes configure the performance mode setting by using the below
> nomenclature.
> +
> +		H  - High performance mode. Maximum power and temperature
> available.
> +		M* - High performance mode but performance is limited to medium as
> system is
> +		     in lapmode. Power and temperature maximums reduced to a safe
> threshold.
> +		M  - Medium performance mode (aka 'balance'). Lower maximum power
> and temperatures
> +		     but better battery life.
> +		L  - Low performance mode (aka 'quiet'). Reduced power setting
> gives lower
> +		     temperatures and extended battery life. Fans run quieter.
> +
> +What:		/sys/devices/platform/thinkpad_acpi/dytc_lapmode
> +Date:		August 2020
> +Contact:	Mark Pearson <markpearson@lenovo.com>
> +Description:
> +		Reads returns the current value of the lapmode sensor.
> +
> +		0 - desk mode is detected
> +		1 - lap mode is detected
> +
> +What:		/sys/devices/platform/thinkpad_acpi/psensor_state
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
>=20
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1465,6 +1466,40 @@ Note - some platforms have a limitation whereby th=
e EC
> firmware cannot
>  determine if the sensor is installed or not. On these platforms the psen=
sor
>  state will always be reported as true to avoid high power being used
> incorrectly.
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
> +operating mode between three different modes. This sysfs node provides a
> better
> +interface for user space to use.
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
> +the device will be cooler and quieter.
> +
> +Note: High performance mode is only available when the device is in
> 'deskmode'. If
> +the device detects that it is on a lap then it will automatically drop i=
nto
> medium
> +mode to maintain a safer operating temperature.
> +
> +The sysfs entry provides the ability to return the current status and to=
 set
> the
> +desired mode. For example::
> +
> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> +

I was thinking about this some more, do you actually want another mode that=
 "disables"
this feature?   IE "O" turns it off an calls DYTC_DISABLE_CQL.

For example if a user wanted to test the recently landed code in thermald 2=
.3
and compare performance between the two it seems like this and that "might"=
 fight.
As an outsider looking in - I of course may be wrong too here.

If at some point in the future thermald does a better job than this impleme=
ntation you
might also want an "out" to let thermald or another piece of userland turn =
this off
if it's in the picture.

>  EXPERIMENTAL: UWB
>  -----------------
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 41b75dd4755c..8fcb660aa5a2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9817,18 +9817,43 @@ static struct ibm_struct lcdshadow_driver_data =
=3D {
>  };
>=20
>  /***********************************************************************=
**
> - * DYTC subdriver, for the Lenovo lapmode feature
> + * DYTC subdriver, for the Lenovo lap and performance mode feature
>   */
>=20
> +#define DYTC_CMD_QUERY        0 /* To get DYTC status - enable/revision =
*/
> +#define DYTC_CMD_SET          1 /* To enable/disable IC function mode */
>  #define DYTC_CMD_GET          2 /* To get current IC function and mode *=
/
> -#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
> +#define DYTC_CMD_RESET    0x1ff /* To reset back to default */
>=20
> -static bool dytc_lapmode;
> +#define DYTC_QUERY_ENABLE_BIT 8  /* Bit 8 - 0 =3D disabled, 1 =3D enable=
d */
> +#define DYTC_QUERY_SUBREV_BIT 16 /* Bits 16 - 27 - sub revisision */
> +#define DYTC_QUERY_REV_BIT    28 /* Bits 28 - 31 - revision */
>=20
> -static void dytc_lapmode_notify_change(void)
> -{
> -	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> -}
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
> +
> +#define DYTC_DISABLE_CQL ((DYTC_MODE_BALANCE << DYTC_SET_MODE_BIT) | \
> +		(DYTC_FUNCTION_CQL << DYTC_SET_FUNCTION_BIT) | \
> +		DYTC_CMD_SET)
> +#define DYTC_ENABLE_CQL (DYTC_DISABLE_CQL | (1 << DYTC_SET_VALID_BIT))
> +
> +static bool dytc_lapmode;
> +static int  dytc_perfmode;
> +static bool dytc_available;
> +static bool dytc_ignore_next_event;
>=20
>  static int dytc_command(int command, int *output)
>  {
> @@ -9843,6 +9868,87 @@ static int dytc_command(int command, int *output)
>  	return 0;
>  }
>=20
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
> +		 * We can't get the mode when in CQL mode - so we disable CQL
> +		 * mode retrieve the mode and then enable it again.
> +		 * As disabling/enabling CQL triggers an event we set a flag to
> +		 * ignore these events. This will be cleared by the event handler
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
>=20
> -static void dytc_lapmode_refresh(void)
> +static void dytc_refresh(void)
>  {
> -	bool new_state;
> +	bool lapmode;
> +	int perfmode, funcmode;
>  	int err;
>=20
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
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
> +	}
> +	err =3D dytc_perfmode_get(&perfmode, &funcmode);
> +	if (err)
> +		return;
> +	if (perfmode !=3D dytc_perfmode) {
> +		dytc_perfmode =3D perfmode;
> +		sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_perfmode");
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
>=20
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
>=20
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
> +				"Performance mode set to %c\n", buf[0]);
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
>=20
>  static DEVICE_ATTR_RO(dytc_lapmode);
>=20
> -static struct attribute *dytc_attributes[] =3D {
> +static struct attribute *dytc_lap_attributes[] =3D {
>  	&dev_attr_dytc_lapmode.attr,
> -	NULL,
> +	NULL
>  };
>=20
> -static const struct attribute_group dytc_attr_group =3D {
> -	.attrs =3D dytc_attributes,
> +static const struct attribute_group dytc_lap_attr_group =3D {
> +	.attrs =3D dytc_lap_attributes
>  };
>=20
>  static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>  {
> -	int err;
> +	int err, output;
>=20
> -	err =3D dytc_lapmode_get(&dytc_lapmode);
> -	/* If support isn't available (ENODEV) then don't return an error
> -	 * but just don't create the sysfs group
> +	err =3D dytc_command(DYTC_CMD_QUERY, &output);
> +	/*
> +	 * If support isn't available (ENODEV) then don't return an error
> +	 * just don't create the sysfs group
>  	 */
>  	if (err =3D=3D -ENODEV)
>  		return 0;
> @@ -9900,14 +10091,38 @@ static int tpacpi_dytc_init(struct ibm_init_stru=
ct
> *iibm)
>  	if (err)
>  		return err;
>=20
> -	/* Platform supports this feature - create the group */
> -	err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
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
> +				   "DYTC version %d: thermal mode available\n",
> dytc_version);
> +			dytc_available =3D true;
> +			/* Platform supports this feature - create the group */
> +			err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj,
> &dytc_perf_attr_group);
> +			if (err)
> +				return err;
> +
> +			err =3D dytc_lapmode_get(&dytc_lapmode);
> +			if (err)
> +				return err;
> +			err =3D sysfs_create_group(&tpacpi_pdev->dev.kobj,
> &dytc_lap_attr_group);
> +		}
> +	}
>  	return err;
>  }
>=20
>  static void dytc_exit(void)
>  {
> -	sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
> +	if (dytc_available) {
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_lap_attr_group);
> +		sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_perf_attr_group);
> +	}
>  }
>=20
>  static struct ibm_struct dytc_driver_data =3D {
> @@ -10057,7 +10272,7 @@ static void tpacpi_driver_event(const unsigned in=
t
> hkey_event)
>  	}
>=20
>  	if (hkey_event =3D=3D TP_HKEY_EV_THM_CSM_COMPLETED)
> -		dytc_lapmode_refresh();
> +		dytc_refresh();
>=20
>  	if ((hkey_event =3D=3D TP_HKEY_EV_PALM_DETECTED) ||
>  		(hkey_event =3D=3D TP_HKEY_EV_PALM_UNDETECTED))
> --
> 2.26.2

