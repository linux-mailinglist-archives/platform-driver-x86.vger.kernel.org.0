Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D359234C85
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 22:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgGaUxC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 16:53:02 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:9058 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727892AbgGaUxC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 16:53:02 -0400
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VKgYhw002910;
        Fri, 31 Jul 2020 16:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=7g5fyUzgCneiTTSIIDlHf8BIkNPf872RREiaRyGIdgM=;
 b=ERmzjN+ixynA4NbxSjiKVpCfyg6xiJhsNe6AYUN8RxracukzaaNNv+4mc1nK6UwKldEg
 nV8nu3MQ9yfQeP13etMV2YjXgkVTdYxnUtvjXq0BH53uOoi6ktcPV2cUppHGHsiGeynP
 pRbsZxjg8ToI2xGECt1Luo/JULYsFr5VfDSX6G4Oe+5LdJ6ZpdqsnP49NlC8SHdo06Y6
 vRVNpBIHsJdifhhR1ouHVl+mu2XviOCYKHad1NiTnHDvNYfxkRmimCeqDnWsKmGk66gG
 GyF/vCIGpFdw06oESdeoiN5xXI7ritYyZBI/p2WMAikseGxq5TRi8Uk61eo3Eaaqv3S3 rg== 
Received: from mx0a-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 32jun14dna-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 31 Jul 2020 16:52:55 -0400
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06VKoK8M106088;
        Fri, 31 Jul 2020 16:52:55 -0400
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by mx0b-00154901.pphosted.com with ESMTP id 32mt3x0jme-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 31 Jul 2020 16:52:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hojg5jYiw6+yqGVUZWDNNtsVLGpD+r6j7AYTkwmD8OfEkTFIR4ShNnZZns40qsGUt+/7+SkLQo62RA+8E9L/M1fxkbGN6D7/rcYwWVCA3T4rtMvJBvrYreDQ9FFOBxb6VeR8dbzmPFmOXdV8qLrHOujhfyN3e0CgtWPqhT1jAESfJaupBcdmwJhRm0ErmNqn5r2cwlnO+c/9u3cfkw3vN4FkOliqTODwsk4US2u8VS/0wCOSbYS/vIG0SLpmVz05RhZBHU6J9KgVJpIxNf7B3mG2LPwSSDzuqG9KcrE9cGAsGVSTGaBF3NYY91Xgivz5ICQAolaWOf22uvVKNI/9aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g5fyUzgCneiTTSIIDlHf8BIkNPf872RREiaRyGIdgM=;
 b=dKGtPbWqcQhbCwxyEhq7qLSnMtTLz9DvJoNhfZaOQl6GYOcrJIgeEmnwMesXDfWDwpwK3b7/Y71ASbJYMSk9zTv/CWENoabodvySVLbLtSzPS4xVE8cm2raSx4sgR85ySJIeGyC2W0Z8hzT+td3SqfPlzDqpN461Ba5Rvy9lSdow5tWNV61EL+PiV50q6Fb4M9uoLaRl4r4g3g4y763pISaPwgJKact+A8apR9p9chphMAgoi9bql5wxXucJ86ZnMkPFWR8HIlMA154m4oJZi9m5kpJrugoJHEmGdAfWOi2qgFDlHgCrZ1HxoHUGwka+DDzXpvKRAhNo3A1/fOEutQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7g5fyUzgCneiTTSIIDlHf8BIkNPf872RREiaRyGIdgM=;
 b=fv7bu7Kx4aIDBlzyaOt8BQ9KydH9G3oT1QOHL7DPBi/6B7UA3iul658FuV5S7dAdYjZlCAmTnnkHLDSGBcYeBR3fL2Wft21yb6V8J4YxeEjWKkhG3ZqXTo6GfzdrUF5JacQog11nS3o+NgOyYeQzFC6s6+teQ1rJgt08MIU0dRE=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB2857.namprd19.prod.outlook.com (2603:10b6:5:141::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 20:52:53 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 20:52:53 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Daniel Dadap <ddadap@nvidia.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>
CC:     "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "aplattner@nvidia.com" <aplattner@nvidia.com>
Subject: RE: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when
 no GUID is found
Thread-Topic: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when
 no GUID is found
Thread-Index: AQHWZ3gnFUHTATHtVUOHlKc5eGcPsKkiKctA
Date:   Fri, 31 Jul 2020 20:52:53 +0000
Message-ID: <DM6PR19MB26369DD7B9037D6E2C91B33DFA4E0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
 <20200731202154.11382-2-ddadap@nvidia.com>
In-Reply-To: <20200731202154.11382-2-ddadap@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-07-31T20:52:48.6360370Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=966dd5a6-7067-4fc9-a452-48ee4e0a492e;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e033188-c2d6-4dbd-a175-08d83593b1ce
x-ms-traffictypediagnostic: DM6PR19MB2857:
x-microsoft-antispam-prvs: <DM6PR19MB2857B2CEB8C5979EB9218500FA4E0@DM6PR19MB2857.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BQSx9aZVHyKUE0itkT+n5daibVR5oUEMu1KZ29gd8zCmP3nYH/dRGGLDmdTDdSldijJdlfW+/iHq4aH1Zf9bXUyO9Mmd85Kq16WqMgKaWOdJ7koYAPC14aeZqRKXvIL2f2CtGX6cGdOPgj/N3WxB/2v+A0pQtyXSpbtw6JEgEfCc9Az+dMKWYSu7/dYCYs/2zGXFmylQhIgfoVcAgLSLmMAjqbCDZHjzOpi274tZDv4WYuKokOQfzVkYnVjBRWyisxBAf+2H710JxYCbmBI6wvoPZkbulMpe91ARNBwj3GstulCd27S5KKQmmFcaHJmWvXdUXBivGnlan8I6guC8GA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(346002)(376002)(366004)(136003)(396003)(76116006)(66556008)(786003)(8676002)(2906002)(66946007)(66446008)(66476007)(64756008)(71200400001)(83380400001)(7696005)(4326008)(55016002)(316002)(86362001)(53546011)(186003)(5660300002)(9686003)(26005)(52536014)(54906003)(8936002)(33656002)(478600001)(110136005)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: gp0hbLc3Uu/bq2zVSBWQp/M1a5S23tlhKi9qkucCYqkKlxJUOaSbmFLXW6EPj1p8Jn8bYpT5tLeBhdlJWqm9BbUUfeNYN5pat635oO3601kLR7Hcsgr+QE3sdNUjQAqj2rCiJSAzwpuZ5ysnLz4Q+B7ZrsnrBiY1AlCZu9zzRzNaXrYOmsGOhGyHyFSe74MgAsiVE9KuV3+qMABLTGBXGs4BBBPyAI6AsT6HrA34iNgmG3IF8F35v4/YV8PhhlNkyukgvQyhW6Esb25PsRo6IJ1WODv7c/Obfrd9Yy4EYgeeeXsuOgTrcJRUMzI1dypUVvB051+1zYP6lHCE1tyNEOmOGXo6X6vyIoHYkEXLSa4FPgTCQ2TThruzZo4mvfdX6qEjPyCvLZ48EY6/h+xbN6YD5035FW0FzxxmgbAXDNLSIl8oUQLUQEi1dx0M+VLIxkJVS5dbtlAIqCRtkuDy3MZcHQJ1feerA14O42xxfyT03Mx2JvbKD5XYOsv4B4HtB9OCjyZUyOrTxQDnv2vwYkheL3Wa9jyxdICQ084IPUx5rDOaB3HDVlGLTTrjnLi400xP63PIFzfoP6UApRrDT0XKZXyXB/TbWl0/WoHPOoHcf3t/Kjcv086LOkTmdJn0uiFcQaT2/pTvAz9e+UnHvg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e033188-c2d6-4dbd-a175-08d83593b1ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2020 20:52:53.1829
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AS+deeF5dZf3fpF5bLSTLLFxO8be2wbDP9ToHYSw6IvB+rNuoNSqKdAFrgP2rpenwGK19bZLYVfRUKhpPeIEbI12NDatkxz+rcm1fteeIMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB2857
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-31_09:2020-07-31,2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007310149
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007310148
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



> -----Original Message-----
> From: Daniel Dadap <ddadap@nvidia.com>
> Sent: Friday, July 31, 2020 3:22 PM
> To: platform-driver-x86@vger.kernel.org; Limonciello, Mario;
> pobrn@protonmail.com
> Cc: andy@infradead.org; dvhart@infradead.org; aplattner@nvidia.com; Danie=
l
> Dadap
> Subject: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when =
no
> GUID is found
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> If a driver registers with WMI, and none of the GUIDs in its ID table
> is present on the system, then that driver will not be probed and
> automatically loaded. However, it is still possible to load such a
> driver explicitly on a system which doesn't include the relevant
> hardware.
>=20
> Update wmi_driver_register to test for the presence of at least one
> GUID from the driver's ID table at driver registration time, and
> fail registration if none are found.
>=20
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  drivers/platform/x86/wmi.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 941739db7199..19aa23d1cf8e 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -130,6 +130,21 @@ static bool find_guid(const char *guid_string, struc=
t
> wmi_block **out)
>  	return false;
>  }
>=20
> +static bool find_driver_guid(const struct wmi_driver *wdriver)
> +{
> +	const struct wmi_device_id *id;
> +
> +	if (wdriver =3D=3D NULL)
> +		return false;
> +
> +	for (id =3D wdriver->id_table; *id->guid_string; id++) {
> +		if (find_guid(id->guid_string, NULL))
> +			return true;
> +	}
> +
> +	return false;
> +}
> +

As a point of preference, why not in this function return -ENODEV directly
rather than it be boolean and map all errors to -ENODEV?

>  static const void *find_guid_context(struct wmi_block *wblock,
>  				      struct wmi_driver *wdriver)
>  {
> @@ -1419,6 +1434,9 @@ static int acpi_wmi_probe(struct platform_device
> *device)
>  int __must_check __wmi_driver_register(struct wmi_driver *driver,
>  				       struct module *owner)
>  {
> +	if (!find_driver_guid(driver))
> +		return -ENODEV;
> +
Then the logic here can be something like:

ret =3D find_driver_guid(driver);
if (ret)
    return ret;

>  	driver->driver.owner =3D owner;
>  	driver->driver.bus =3D &wmi_bus_type;
>=20
> --
> 2.18.4

