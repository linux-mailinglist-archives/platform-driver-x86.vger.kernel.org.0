Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5457722E41B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 04:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgG0CvR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 22:51:17 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.4]:51039 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbgG0CvQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 22:51:16 -0400
Received: from [100.112.2.140] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-east-1.aws.symcld.net id A1/27-37342-2214E1F5; Mon, 27 Jul 2020 02:51:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMJsWRWlGSWpSXmKPExsWS8eIhl66io1y
  8wfFeDYsHc9MtZh+2sZjzbC2jxeo9L5gdWDx+H2D02L3gM5PH+31X2Tw+b5ILYIlizcxLyq9I
  YM2YvHcCW0ELe8XtyzdYGxi72boYuTiEBBqYJB5vfMUI4bxilOj8OocFwmlkkji3dC1U2W9Gi
  Wm3O8DKGAWWMkv0H7vHDuEcY5F4e3gDVGYDo0T3r89gDovAbmaJ7fuWsUMMmMkkMWP9FKhp9x
  klfm9cCrSHk4NNQF3i1cGrbCC2iECQxLuPJ5hBipgF2pgkTvTOZgVJCAsUStzvW8EIUVQkcWj
  pfChbT2Lvnb9gzSwCqhIT520Daubg4BWIkfj8NANi2SRGiX89newgNZwCnhJ9d3aC1TMKiEl8
  P7WGCcRmFhCXuPVkPpgtISAgsWTPeWYIW1Ti5eN/rBD1PUBXz2GDiCtJbN7ezA5hy0pcmt/NC
  LJXQsBX4sp5dwhTS6L9lTlEhY3E0ecLWCDCKhL/DlVChLMldkxexDqB0XgWkhsgbB2JBbs/sU
  HY2hLLFr5mBrF5BQQlTs58wrKAkWUVo2lSUWZ6RkluYmaOrqGBga6hoZGuoa6FpV5ilW6SXmm
  xbmpicYmuoV5iebFecWVuck6KXl5qySZGYEpKKWCM3MG47/UHvUOMkhxMSqK8h1jk4oX4kvJT
  KjMSizPii0pzUosPMcpwcChJ8Mo6AOUEi1LTUyvSMnOA6REmLcHBoyTCO9UeKM1bXJCYW5yZD
  pE6xWjMMeHl3EXMHJevz1vELMSSl5+XKiXOOxukVACkNKM0D24QLG1fYpSVEuZlZGBgEOIpSC
  3KzSxBlX/FKM7BqCTMGw5yD09mXgncPmC6BfpChLfxuCzIKSWJCCmpBiaRjvvCPkarzxrOjqk
  q5P/fc9u/WSr11LXmvTveGsm/cn2vwctk96Ur/cgcJvWi9R+cOri/pKbFTZ5suKF8HXPu09pP
  Z/29vX70lry079qn/45LzjP41r9dz7jOvnt3UTzykaLFp+0vS8pEjr0++8p9FdtvjhyfDftrb
  zyM6j30qW1a0cefTfocRqUMunMVa1a02b0SaeJb6G6qXXYvUeK3t9XBd7stg77/SuKx3li56a
  2gwRrriPXnt4Wde5JzYmOoV3HXUZdladlnS43iGPV8a64+va+oKK73IOuX7YJ/eclz+HZaO+6
  af8zgaWrULql3Hj88z7b9+B7SH6wfWMl4TfxxiNWpJNOknwdUmpVYijMSDbWYi4oTAR14yNdW
  BAAA
X-Env-Sender: njoshi1@lenovo.com
X-Msg-Ref: server-5.tower-396.messagelabs.com!1595818273!2896717!1
X-Originating-IP: [104.232.225.10]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12662 invoked from network); 27 Jul 2020 02:51:13 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.10)
  by server-5.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Jul 2020 02:51:13 -0000
Received: from HKGWPEMAIL04.lenovo.com (unknown [10.128.3.72])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 7E4D0C17FBEA2D9D0B86;
        Sun, 26 Jul 2020 22:51:12 -0400 (EDT)
Received: from HKGWPEMAIL01.lenovo.com (10.128.3.69) by
 HKGWPEMAIL04.lenovo.com (10.128.3.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Mon, 27 Jul 2020 10:52:00 +0800
Received: from HKGWPEXCH02.lenovo.com (10.128.62.31) by
 HKGWPEMAIL01.lenovo.com (10.128.3.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5
 via Frontend Transport; Mon, 27 Jul 2020 10:51:11 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.57)
 by mail.lenovo.com (10.128.62.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 27 Jul
 2020 10:51:59 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNOFDQBKFYoNYRhP+QEPlrwiwK7wLsGVbk35C8dpJlWypCk30V8R/DcR+6h2dHlLnREGIhUrg2TTDqQQX7M3SlVE4RK37pkY5rAXRvG0Y9lRdfUf1aD7XUUigtfVUQDmU7rxprW6qgB7Gbuq9O4VgcFn6yh05L3bL2IHp0VZfe2eGnVWOUstGTVbdECEGer6EZMfM6r0i1PqQUucRSvrSYEd5DuOQkH2OjaQyPMfFCVw97bzOpcPIXhF2ECCNEEm1kyCxREbr1XOrsnAWF2e22WLeq50aRKXo8KhHxYANe/hWBESUE4d5WSLdgDf6bIMTdzhcV4n8EvuJ3wmyPzRmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+G6S6ukN+ZGgNOSKj4iLW081sHlTYJJ2XwhS2DLzrQ=;
 b=HZfeuzQEYLihgLo4zc896rIUw/AyfDccX1rmvgOSHVC091M7yh25dGisNlF5d+ey6oEVtTeTYFcKxdow6L39UNTRBINEZOMoycO2cgN7aeLJBEcCyl3OF/VyMX153NbDrnjzBLIezPy5FbOX5ygOd5mI1eirJWmj/LcuxFVTumlxtArcr2WRgv0UrsnWgbK+OdiCeWm1gmCHeTm+/p658yZeuIkZ50dq4bt0AofVGe8e83Ib74pnaRafeTWXSSZYQ3KelAmq2KkH5J26GziScw750HYla0XNFYbwLEupihah4HHzQAWwI3aaI1Hr5W5ku0Av1HMFEl+2vTk9va4oLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+G6S6ukN+ZGgNOSKj4iLW081sHlTYJJ2XwhS2DLzrQ=;
 b=jO9Cqoyzx6omZIMNLq4/wAsJ/AdgIoEWFJbvR1OK7cA6zjG6f68qIbuJMYJahN776BIJtbcQ+fbUA/2NUFnvD5xKeMGP7QNEWqmf19hoRdCROzt84wHwRXQ32kHUvyUdIyzuxXiMC6kH5GYGJfO5Iw70ZEd0uU7FbI+gdic18sk=
Received: from SG2PR03MB2718.apcprd03.prod.outlook.com (2603:1096:3:1e::22) by
 SG2PR03MB3900.apcprd03.prod.outlook.com (2603:1096:4:45::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9; Mon, 27 Jul 2020 02:51:09 +0000
Received: from SG2PR03MB2718.apcprd03.prod.outlook.com
 ([fe80::1145:fb6f:aa6a:4398]) by SG2PR03MB2718.apcprd03.prod.outlook.com
 ([fe80::1145:fb6f:aa6a:4398%5]) with mapi id 15.20.3216.031; Mon, 27 Jul 2020
 02:51:09 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     Bastien Nocera <bnocera@redhat.com>,
        Mark RH Pearson <markpearson@lenovo.com>
CC:     Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [External]  Re: [ibm-acpi-devel] [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Thread-Topic: [External]  Re: [ibm-acpi-devel] [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Thread-Index: AQHWY8DIP68AvAZQjE24ENYf+sTd3A==
Date:   Mon, 27 Jul 2020 02:51:09 +0000
Message-ID: <SG2PR03MB2718DFC08C4ECF7816D1B4E48C720@SG2PR03MB2718.apcprd03.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200629191748.3859-1-markpearson@lenovo.com>
 <732277929.1313334.1593596757447.JavaMail.zimbra@redhat.com>
In-Reply-To: <732277929.1313334.1593596757447.JavaMail.zimbra@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.165.32.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d27b2284-112e-4db0-d9a8-08d831d7eac1
x-ms-traffictypediagnostic: SG2PR03MB3900:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB390014ED9F16EE7FE55D1AD68C720@SG2PR03MB3900.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QXx/E6PouRC4eteJG4/me4UaUw9kwvyTV61Gf38JRE/tWv9Poj+bIDdnEgqKWWyGVyHdPMkZUjN4MVdFQQyO/IG5J+BUMUtujvuioxwUsyuGCJhl250zv4ZG4WmCQ/wdsaPp4CUWIe+B48p/SD7/qVCNK9i7ru2QtjgC8+YN7DxoR9PsYl3TiUpWf8MQj166zAtApGma9XiWtfK7HnqzHzTChE1k3cFjKXo0hR/kksdnOt1Mge7xMMzu7R0wmWWTnN5jbwTVi8dzcTThoTrevpYw9qaQ8hiyREY2LIzL6+ZEt+SrPsuDok9+ffXekylM1Pwxtir8Z8KvWeqDD6h+BCfsnBXrKEIzg7xqSd/ubxS68tgi2ZfJA0EeiYNVD1E+oDgy1kZqOE5XgnODB+g0Mg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB2718.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(366004)(346002)(39860400002)(396003)(4744005)(4326008)(316002)(54906003)(8676002)(110136005)(86362001)(8936002)(66476007)(26005)(55016002)(66946007)(66556008)(52536014)(2906002)(33656002)(7696005)(478600001)(186003)(5660300002)(9686003)(76116006)(6506007)(83380400001)(71200400001)(966005)(66446008)(64756008)(6636002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: uH5WynwpUcf4p2Z8X+QfyNmQaTE1aoVlXwCAaVrK0CBT5pBCmtcqIdYbMzmLez7LV4Oxm+PhQNpO9m0OErciAMEtYYfXhCf3GaWoYMx5CsMNahLwyjZnzOaBvXiseSPNwQxALVfMV/1EsYZ6nkiNRuO0P1ffz4G/sLC40qV5tVWmsB39hYhCrc0euuvEvrR507/3jJ1hNuUJG2EOLAHtUbap5xtQlCgSMqX+c7n0rBFbmYmRmOKk8DtB6pAJE/HBOvFRNIb1OfqJuy3KYeOiw8y/267HFM3FL4+l6jXtX6uWID3Wwe9T+7yrvd7bLP4Yv5N6Stg29bQRn7sk8IUf0yaEa0por/UD2FGBwr3p+Hzqf2EILa720i0CVCU/KhIGSQa+4s6IcgtiTkSthL+xP2QT3ydj0Umr+51tOojBxNalndStPyKnbvwQtBtmOYTco73A6aEYkq/CuZL7wZ/zSQVWjZjLrnRq24ecwIA7g5gugpPS4zN++H1MLOgW3Xbt/OYc+j63GFrpYNhoAVL323gpqRVIuxDwMQ6xeCUJS6kvWlAni4UDK1Eo2LzB9FrTgOrxYRoq0eTnbI3bFtpwxb5TZax/b49WnokJeVsJZ47+B6WXIl4YkHFj314fnSsZd9H4nWH8OcIXnggGsZzMFQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB2718.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d27b2284-112e-4db0-d9a8-08d831d7eac1
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 02:51:09.7228
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tYeAbCtdi2BlK14XeQ5vTSwgiM/aahhVbTAvLhcROpksbM6DEBKcDql1Rzc37VuYA8SLr7AYnABZ6RETSKt5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB3900
X-OriginatorOrg: lenovo.com
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Bastien

>-----Original Message-----
>From: Bastien Nocera <bnocera@redhat.com>

>----- Original Message -----
>> Newer Lenovo Thinkpad platforms have support to identify whether the
>>   system is on-lap or not using an ACPI DYTC event from the firmware.
>>
>>   This patch provides the ability to retrieve the current mode via sysfs
>>   entrypoints and will be used by userspace for thermal mode and WWAN
>>   functionality
>>
>> Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
>> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
>> Reviewed-by: Sugumaran <slacshiminar@lenovo.com>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>
>
>You can add my:
>Reviewed-by: Bastien Nocera <bnocera@redhat.com>

It's already added in latest patch and currently in "for-next"
http://git.infradead.org/linux-platform-drivers-x86.git/commit/acf7f4a59114=
471c3964f118564fe8e7a6f34bb8

Thanks=20
