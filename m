Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD948319CC8
	for <lists+platform-driver-x86@lfdr.de>; Fri, 12 Feb 2021 11:45:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhBLKnk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 12 Feb 2021 05:43:40 -0500
Received: from mail-eopbgr1310117.outbound.protection.outlook.com ([40.107.131.117]:55390
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230300AbhBLKm1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Feb 2021 05:42:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TR8YCJIHS1NEpX/Jew9mkwtmyKyFT9KUkLkvI2hLvd9MpMtYB3hhTID9MRiY9KQN5yUgGrMd7+rYj2o1Xj0Jfpc7iTYAA4p0/GisdSU/0FQKzGYzmpi0K8r1mcr5OXqp7sG+3SS8TXOJxH0OLyKbj5NyNb6ebQR4qgFFdL8H1YCZA7Y/A6EXytEWH2mszsGNG1LoOdQ6XpXCt4DHFltDAdtjJpm+pb3B+V9muAeuy64Ei8hc8Sa3df4k8MsmKDDkdyZpDd3FvKPsx0g7MIQtyq/q4gw3FKfauqAzdqhYg6YVmOGzNHw0XnvTyGISThF9JmT0mXiq7G6OVbEhDDj4Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dv+OC4Kh4k+YFDJo1qHx2pURW04d2s5wAuCUV3zeOpI=;
 b=adcgQl5GXF0iMwVAVniGhdLuRikMLAjFeVswOBbpMSuTNNVuIDHtC2hCoAkRLwy10MXNy5fVN6FieqICopMR6/WPny4+yZRcurJDcqMaJnz6DhG3grfuubDNqJgDdPync6Y1S88ViheQ03GslDON7G6KB3b4BjVkiBcD1lWFYxu8Pr6aiH3kBW9a5TftkSfFAJ+MX2yweIEss1bYuUOBAVpnnY4jOR3an7Tl/XucyG+GCXFxzLszLPAXsXhN8MgsPuBwmQKTsGtoVB4dYMjpPLKknU+xd0ix+JMJ1bGK+o4tIG/OaeVUUIYTRuKOUo0BRHjenGsDj/5DG1sX8GGyLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dv+OC4Kh4k+YFDJo1qHx2pURW04d2s5wAuCUV3zeOpI=;
 b=Nc5bH3OTDfMe4a60QBa1PlELgFeY6LARdJSpwuABCxaMP+X0PT8JJMO1H7ExMDmUt9F1iM9rrstmgqTMf0397k65O2CAj6kKKAnPD1p/zYfO4DMkhQLau6OjRqxxEaNJRCtdPsbtFfQYJrzWR530M7vmJ5nK0uOCTmqryGZZg5s=
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com (2603:1096:404:3f::21)
 by TYZPR03MB5263.apcprd03.prod.outlook.com (2603:1096:405:6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.12; Fri, 12 Feb
 2021 10:40:40 +0000
Received: from TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::51c4:f02c:2dd9:a1c2]) by TY2PR03MB3645.apcprd03.prod.outlook.com
 ([fe80::51c4:f02c:2dd9:a1c2%7]) with mapi id 15.20.3868.015; Fri, 12 Feb 2021
 10:40:40 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     =?utf-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Nitin Joshi <nitjoshi@gmail.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Mark RH Pearson <markpearson@lenovo.com>
Subject: RE: [External]  Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs
 interface to reduce wlan tx power
Thread-Topic: [External]  Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs
 interface to reduce wlan tx power
Thread-Index: AQHXAR0Qnksn6pTMBEuZSmutfDsi9KpUPnNw
Date:   Fri, 12 Feb 2021 10:40:40 +0000
Message-ID: <TY2PR03MB3645FAF0AAB573298D0AC47E8C8B9@TY2PR03MB3645.apcprd03.prod.outlook.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com>
 <E3f2ByroNWD6igc0zIeWthnZ0NztA6QT_Uvg_wgS912Bq03401uE2ieeXM-WRLezCsBNgesU0myH-69IuKVkXbmtp5jkb30Vd6Rv6E3rld8=@protonmail.com>
In-Reply-To: <E3f2ByroNWD6igc0zIeWthnZ0NztA6QT_Uvg_wgS912Bq03401uE2ieeXM-WRLezCsBNgesU0myH-69IuKVkXbmtp5jkb30Vd6Rv6E3rld8=@protonmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: protonmail.com; dkim=none (message not signed)
 header.d=none;protonmail.com; dmarc=none action=none header.from=lenovo.com;
x-originating-ip: [114.164.25.243]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a79f79a7-bffb-439e-6491-08d8cf42a46a
x-ms-traffictypediagnostic: TYZPR03MB5263:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYZPR03MB5263C5787F5E8233CF035A8E8C8B9@TYZPR03MB5263.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 43OI3qXptKzk+Aif4gokaRONrffjjsYcyMolJNa2+Eqiak66NRMAc7zdeTNs/04KDbbsT/4KH0mJ/4GAasyqvSE1d1gFLMolsif1/X0ruj9QA5J+Ko0ctKf7q/kdiOhlQpcqjZacQbd5665M8xBtMXe7EZZeSuSrOMvb6p1LlDigu1Y8XnpS6KBGbUhi+GFAsuCnXIboRnm07/qVM9lVkoYHlCxMZ4Czi2Hr0k0r4+yZi903DDa95OhkLtCrEdUStE4T1pv6XL0Vrss0KMNCxHxgV0umO7o4Cpnt7I8Sfl9WiUB1RxlDqnH3Dbb1ZQVfW27Nhv7B31U8u/IxB9lqO6AqMbBoH2tNO5CQbZH74AUSikhyCspMWUD5Cpt+PpT0MPxXtKoJp0GoJWQqIKsX5FnetzsSG0bpfy978ajlnTSVxRaIzRN2x6H0ItLk/RdQS8Z478FvX33gG2thAHTkJjLwZOE7iCN2akUSrSsmWyXb5OWTxdAncMybRZb9uJv8PEaXw+81V4uUZqSQtdlc6TlaVLfwoBrCNZ7Eowe/H0rmoMVdFukSmCxKEFtyKrOkvoRIBbH9/B75Err3cZVvIYJe9NnxOb7WAkQDBmYhleU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR03MB3645.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(9686003)(71200400001)(8936002)(26005)(33656002)(478600001)(55016002)(83380400001)(8676002)(66574015)(7696005)(86362001)(5660300002)(107886003)(52536014)(966005)(66476007)(66556008)(64756008)(66446008)(110136005)(54906003)(316002)(2906002)(76116006)(66946007)(4326008)(186003)(6506007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZzNjL04zUERGZEtNUE1UZjlBazhwL1E3Z080OUJLSjljQ3BEc25LNldtVG1z?=
 =?utf-8?B?MmJwMExnYWxuTGlGakR4dFVKVmx4bldvK2tCbmdsbHBtMU51MUhPd3JuUjlD?=
 =?utf-8?B?WEI1NzdwelB1VXJCNmVNQ1RVN0RydVhWbERwTFRBb1R2cElja2JxSkdQU3hK?=
 =?utf-8?B?SHQ3RHJ2NzNlb3VvUU9zSTFsYWkySU9vVW8zQ2xlRVpCZC9RMEQ1NVFEcUlQ?=
 =?utf-8?B?SzdlLzRMaGJlK0Q4VzE2V2ZZYzVQcXBNK0F2QzRWT3NaeHdLbnN0S0UrbkEy?=
 =?utf-8?B?S1IrcGFpR0pkVi9Vcm5iMDZLWVF5MVpyTExEK2M5QlhVU09HN0k1UlZnK2lk?=
 =?utf-8?B?TXQ5d0ZQY01QNlhlVDdJWlFqaVo3dW9EeUwrV0lSNzVLWTFJTEwzajdBUEFn?=
 =?utf-8?B?bE0yNkVJVE80c01pb2wxUXI3SmI3am1Bb2R1d0plNWI5eVhLeE5DWldiM25E?=
 =?utf-8?B?SmZCZ2tQS3dTTlErcWZrdjV0V3FBdi9WUjhRblJGeWJNdHVOTXR4T0p3SXEv?=
 =?utf-8?B?czFUVFFieDZxTzhkNTBYaWxhTXpyMmtCa1Q2cWgvY1hob2RCZnZmMkFDVmRQ?=
 =?utf-8?B?Q05jb1dFcGVnYUJaSkh0K1JwWGxTOGpCd2pJdmI4Mmo0SGpwclEvQUlyVHBM?=
 =?utf-8?B?ZVYzdEdZYkJ6ZWpxVVNMc213aWdvc1hPekF6TlZGdXpXWVZMZGtpazV2aXor?=
 =?utf-8?B?ODBXRmQ3UjJXbEF4TmFwWGxHMTlFUzFwUC9Lb0REdUZxbGFNeG56K0JCSFpj?=
 =?utf-8?B?UWR6TzRiWnFNWDI3ek5GTTBKMG9iNjUyeVFISXRnL1JNcGtHaE9JUWxHYm4r?=
 =?utf-8?B?Ukl1R3RFdUtGeW9OMHUvd2xZYkkzUThaRWY2UzZtcFlybGFWRHdoTVk1SVVZ?=
 =?utf-8?B?dGhoVXcvWXR5MFJ6SEU0WXJkaXBIcHpMNzNsaW9MMFpOcmh0MXpQN3BCUWcy?=
 =?utf-8?B?UmxvTVR0U2pGODh2NXZBajhRQ1hadldlWEY1c2ZieE1BNDFWdjA4cEl3cmdR?=
 =?utf-8?B?cC9tMGNidmc4bFpvNXdtd0R3bVVWR0tuZlBnOS95Ry82THZNWnJQUkpPWEw4?=
 =?utf-8?B?RksySVo4Q2ppWUhRUGtnKzU2eVJWcWNraXp3T0pObWhkdTkzOTRrSG9YMldh?=
 =?utf-8?B?d0p1UkxBNmlRVG4vZWNEY2ttU1dSNnE0blFHUnlmdzdsb1pTRkRiR2wraFNJ?=
 =?utf-8?B?ZTh6d1JveFcvbTBWR1Zoc2xud2VHbmxpMk9wY0FmUmdwZmhhL1JUVk1BaFBW?=
 =?utf-8?B?QmxHQ0tiMXFWOTJYVUV6ZmRuY01STjBCd1NVdm52cUJrYVU2NG9sYkhvRDZZ?=
 =?utf-8?B?VjVTTnZiR2l3Qk5ScWVZbXQwS0p5TEJXN3pmZEdXbmZiSk9kL0Z2U0hHRzQz?=
 =?utf-8?B?UVRiY1JKY29maUErQkJ5RzZhMTFuMlNvTmRleXg4Q3NGalgzQ2tLSXVPL0JH?=
 =?utf-8?B?S0w2OHB2bFhyMFZUdll5S1lmZ0w4WEoxWlB5d2liMHhBVE5wZGZsTU41a2U3?=
 =?utf-8?B?RGZuVmRPR2wrNENHWTJEVlVmSE84aWY3ZU5TTEcwQjNaTmVwU0hIN1BadSts?=
 =?utf-8?B?aVY0cXVvZ09URm80N0dBaG9GNG15MDllTVNBcnV3aXZZUGI2a1c5U2FSeDQv?=
 =?utf-8?B?bExUZ2tMWUhCMk4wYWRLNUFBMHVhdnFUNENJSzhOZHFOczN6aXFsRG41SEpN?=
 =?utf-8?B?UjU0VVlIc1FVRkg1bEc4SjJMQXBBT1RCUzhHYTY4VDRGNUhTeWtDSXNWMy9w?=
 =?utf-8?Q?9Fqs+P02UCci4H0YM/MBEzHJziIi57+K+6kxcWX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lenovo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR03MB3645.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a79f79a7-bffb-439e-6491-08d8cf42a46a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2021 10:40:40.5072
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CN/Wc3uBc6SGWarEroYc59z7QH19OJTFcpOK7kYuc8K2HiDmqECplr6X/qxy0lVyIEoXY3pCyScy35zpbSQsWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB5263
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGksDQoNClRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cy4NCg0KPi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+RnJvbTogQmFybmFiw6FzIFDFkWN6ZSA8cG9icm5AcHJvdG9ubWFpbC5jb20+
DQo+U2VudDogRnJpZGF5LCBGZWJydWFyeSAxMiwgMjAyMSA1OjU2IFBNDQo+VG86IE5pdGluIEpv
c2hpIDxuaXRqb3NoaUBnbWFpbC5jb20+DQo+Q2M6IGhkZWdvZWRlQHJlZGhhdC5jb207IGlibS1h
Y3BpLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgcGxhdGZvcm0tDQo+ZHJpdmVyLXg4NkB2
Z2VyLmtlcm5lbC5vcmc7IE5pdGluIEpvc2hpMSA8bmpvc2hpMUBsZW5vdm8uY29tPjsgTWFyayBS
SA0KPlBlYXJzb24gPG1hcmtwZWFyc29uQGxlbm92by5jb20+DQo+U3ViamVjdDogW0V4dGVybmFs
XSBSZTogW1BBVENIIDEvMl0gcGxhdG9ybS94ODY6IHRoaW5rcGFkX2FjcGk6IHN5c2ZzDQo+aW50
ZXJmYWNlIHRvIHJlZHVjZSB3bGFuIHR4IHBvd2VyDQo+DQo+SGkNCj4NCj4NCj4yMDIxLiBmZWJy
dcOhciAxMi4sIHDDqW50ZWsgNjo1OCBrZWx0ZXrDqXNzZWwsIE5pdGluIEpvc2hpIMOtcnRhOg0K
Pg0KPj4gU29tZSBuZXdlciBUaGlua3BhZHMgaGF2ZSB0aGUgV0xBTiBhbnRlbm5hIHBsYWNlZCBj
bG9zZSB0byB0aGUgV1dBTg0KPj4gYW50ZW5uYS4gSW4gdGhlc2UgY2FzZXMgRkNDIGNlcnRpZmlj
YXRpb24gcmVxdWlyZXMgdGhhdCB3aGVuIFdXQU4gaXMNCj4+IGFjdGl2ZSB3ZSByZWR1Y2UgV0xB
TiB0cmFuc21pc3Npb24gcG93ZXIuIEEgbmV3IER5bmFtaWMgUG93ZXINCj4+IFJlZHVjdGlvbiBD
b250cm9sIChEUFJDKSBtZXRob2QgaXMgYXZhaWxhYmxlIGZyb20gdGhlIEJJT1Mgb24gdGhlc2UN
Cj4+IHBsYXRmb3JtcyB0byByZWR1Y2Ugb3IgcmVzdG9yZSBXTEFOIFR4IHBvd2VyLg0KPj4NCj4+
IFRoaXMgcGF0Y2ggcHJvdmlkZXMgYSBzeXNmcyBpbnRlcmZhY2UgdGhhdCB1c2Vyc3BhY2UgY2Fu
IHVzZSB0byBhZGp1c3QNCj4+IHRoZSBXTEFOIHBvd2VyIGFwcHJvcHJpYXRlbHkuDQo+Pg0KPj4g
UmV2aWV3ZWQtYnk6IE1hcmsgUGVhcnNvbiA8bWFya3BlYXJzb25AbGVub3ZvLmNvbT4NCj4+IFNp
Z25lZC1vZmYtYnk6IE5pdGluIEpvc2hpIDxuam9zaGkxQGxlbm92by5jb20+DQo+PiAtLS0NCj4+
ICAuLi4vYWRtaW4tZ3VpZGUvbGFwdG9wcy90aGlua3BhZC1hY3BpLnJzdCAgICAgfCAgMTggKysr
DQo+PiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jICAgICAgICAgIHwgMTM2
ICsrKysrKysrKysrKysrKysrKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMTU0IGluc2VydGlvbnMo
KykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9sYXB0b3Bz
L3RoaW5rcGFkLWFjcGkucnN0DQo+PiBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbGFwdG9w
cy90aGlua3BhZC1hY3BpLnJzdA0KPj4gaW5kZXggNWZlMWFkZTg4YzE3Li4xMDQxMDgxMWI5OTAg
MTAwNjQ0DQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2xhcHRvcHMvdGhpbmtw
YWQtYWNwaS5yc3QNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUvbGFwdG9wcy90
aGlua3BhZC1hY3BpLnJzdA0KPj4gQEAgLTUxLDYgKzUxLDcgQEAgZGV0YWlsZWQgZGVzY3JpcHRp
b24pOg0KPj4gIAktIFVXQiBlbmFibGUgYW5kIGRpc2FibGUNCj4+ICAJLSBMQ0QgU2hhZG93IChQ
cml2YWN5R3VhcmQpIGVuYWJsZSBhbmQgZGlzYWJsZQ0KPj4gIAktIExhcCBtb2RlIHNlbnNvcg0K
Pj4gKwktIFdMQU4gdHJhbnNtaXNzaW9uIHBvd2VyIGNvbnRyb2wNCj4+DQo+PiAgQSBjb21wYXRp
YmlsaXR5IHRhYmxlIGJ5IG1vZGVsIGFuZCBmZWF0dXJlIGlzIG1haW50YWluZWQgb24gdGhlIHdl
Yg0KPj4gc2l0ZSwgaHR0cDovL2libS1hY3BpLnNmLm5ldC8uIEkgYXBwcmVjaWF0ZSBhbnkgc3Vj
Y2VzcyBvciBmYWlsdXJlIEBADQo+PiAtMTQ0Nyw2ICsxNDQ4LDIzIEBAIHRoZXkgZGlmZmVyIGJl
dHdlZW4gZGVzayBhbmQgbGFwIG1vZGUuDQo+PiAgVGhlIHByb3BlcnR5IGlzIHJlYWQtb25seS4g
SWYgdGhlIHBsYXRmb3JtIGRvZXNuJ3QgaGF2ZSBzdXBwb3J0IHRoZQ0KPj4gc3lzZnMgIGNsYXNz
IGlzIG5vdCBjcmVhdGVkLg0KPj4NCj4+ICtXTEFOIHRyYW5zbWlzc2lvbiBwb3dlciBjb250cm9s
DQo+PiArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICsNCj4+ICtzeXNmczog
d2xhbl90eF9zdHJlbmd0aF9yZWR1Y2UNCj4+ICsNCj4+ICtTb21lIG5ld2VyIFRoaW5rcGFkcyBo
YXZlIHRoZSBXTEFOIGFudGVubmEgcGxhY2VkIGNsb3NlIHRvIHRoZSBXV0FODQo+YW50ZW5uYS4N
Cj4+ICtUaGlzIGludGVyZmFjZSB3aWxsIGJlIHVzZWQgYnkgdXNlcnNwYWNlIHRvIHJlZHVjZSB0
aGUgV0xBTiBUeCBwb3dlcg0KPj4gK3N0cmVuZ3RoIHdoZW4gV1dBTiBpcyBhY3RpdmUsIGFzIGlz
IHJlcXVpcmVkIGZvciBGQ0MgY2VydGlmaWNhdGlvbi4NCj4+ICsNCj4+ICtUaGUgYXZhaWxhYmxl
IGNvbW1hbmRzIGFyZTo6DQo+PiArDQo+PiArICAgICAgICBlY2hvICcwJyA+DQo+L3N5cy9kZXZp
Y2VzL3BsYXRmb3JtL3RoaW5rcGFkX2FjcGkvd2xhbl90eF9zdHJlbmd0aF9yZWR1Y2UNCj4+ICsg
ICAgICAgIGVjaG8gJzEnID4NCj4+ICsgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3RoaW5rcGFkX2Fj
cGkvd2xhbl90eF9zdHJlbmd0aF9yZWR1Y2UNCj4+ICsNCj4+ICtUaGUgZmlyc3QgY29tbWFuZCBy
ZXN0b3JlcyB0aGUgd2xhbiB0cmFuc21pc3Npb24gcG93ZXIgYW5kIHRoZSBsYXR0ZXINCj4+ICtv
bmUgcmVkdWNlcyB3bGFuIHRyYW5zbWlzc2lvbiBwb3dlci4NCj4+ICsNCj4+ICBFWFBFUklNRU5U
QUw6IFVXQg0KPj4gIC0tLS0tLS0tLS0tLS0tLS0tDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvcGxhdGZvcm0veDg2L3RoaW5rcGFkX2FjcGkuYw0KPj4gYi9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni90aGlua3BhZF9hY3BpLmMNCj4+IGluZGV4IGYzZThlY2E4ZDg2ZC4uNmRiYmQ0YTE0MjY0IDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvdGhpbmtwYWRfYWNwaS5jDQo+PiAr
KysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni90aGlua3BhZF9hY3BpLmMNCj4+IEBAIC05OTgzLDYg
Kzk5ODMsMTM4IEBAIHN0YXRpYyBzdHJ1Y3QgaWJtX3N0cnVjdCBwcm94c2Vuc29yX2RyaXZlcl9k
YXRhDQo+PSB7DQo+PiAgCS5leGl0ID0gcHJveHNlbnNvcl9leGl0LA0KPj4gIH07DQo+Pg0KPj4N
Cj4rLyoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKg0KPioqKioqDQo+PiArKioqKioNCj4+ICsgKiBEUFJDKER5bmFtaWMgUG93ZXIg
UmVkdWN0aW9uIENvbnRyb2wpIHN1YmRyaXZlciwgZm9yIHRoZSBMZW5vdm8NCj4+ICtXV0FODQo+
PiArICogYW5kIFdMQU4gZmVhdHVyZS4NCj4+ICsgKi8NCj4+ICsjZGVmaW5lIERQUkNfR0VUX1dM
QU5fU1RBVEUgICAgICAgICAgICAgMHgyMDAwMA0KPj4gKyNkZWZpbmUgRFBSQ19TRVRfV0xBTl9Q
T1dFUl9SRURVQ0UgICAgICAweDAwMDMwMDEwDQo+PiArI2RlZmluZSBEUFJDX1NFVF9XTEFOX1BP
V0VSX0ZVTEwgICAgICAgIDB4MDAwMzAxMDANCj4+ICtzdGF0aWMgaW50IGhhc193bGFudHhyZWR1
Y2U7DQo+DQo+SSB0aGluayBgYm9vbGAgd291bGQgYmUgYmV0dGVyLg0KDQpBY2sgLiBJIHdpbGwg
bW9kaWZ5ICBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4NCj4NCj4+ICtzdGF0aWMgaW50IHdsYW5f
dHhyZWR1Y2U7DQo+PiArDQo+PiArc3RhdGljIGludCBkcHJjX2NvbW1hbmQoaW50IGNvbW1hbmQs
IGludCAqb3V0cHV0KSB7DQo+PiArCWFjcGlfaGFuZGxlIGRwcmNfaGFuZGxlOw0KPj4gKw0KPj4g
KwlpZiAoQUNQSV9GQUlMVVJFKGFjcGlfZ2V0X2hhbmRsZShoa2V5X2hhbmRsZSwgIkRQUkMiLA0K
PiZkcHJjX2hhbmRsZSkpKSB7DQo+PiArCQkvKiBQbGF0Zm9ybSBkb2Vzbid0IHN1cHBvcnQgRFBS
QyAqLw0KPj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiArCX0NCj4+ICsNCj4+ICsJaWYgKCFhY3Bp
X2V2YWxmKGRwcmNfaGFuZGxlLCBvdXRwdXQsIE5VTEwsICJkZCIsIGNvbW1hbmQpKQ0KPj4gKwkJ
cmV0dXJuIC1FSU87DQo+PiArDQo+PiArCS8qDQo+PiArCSAqIE1FVEhPRF9FUlIgZ2V0cyByZXR1
cm5lZCBvbiBkZXZpY2VzIHdoZXJlIGZldyBjb21tYW5kcyBhcmUNCj5ub3Qgc3VwcG9ydGVkDQo+
PiArCSAqIGZvciBleGFtcGxlIFdMQU4gcG93ZXIgcmVkdWNlIGNvbW1hbmQgaXMgbm90IHN1cHBv
cnRlZCBvbg0KPnNvbWUgZGV2aWNlcy4NCj4+ICsJICovDQo+PiArCWlmICgqb3V0cHV0ICYgTUVU
SE9EX0VSUikNCj4+ICsJCXJldHVybiAtRU5PREVWOw0KPj4gKw0KPj4gKwlyZXR1cm4gMDsNCj4+
ICt9DQo+PiArDQo+PiArc3RhdGljIGludCBnZXRfd2xhbl9zdGF0ZShpbnQgKmhhc193bGFudHhy
ZWR1Y2UsIGludCAqd2xhbl90eHJlZHVjZSkNCj4+ICt7DQo+PiArCWludCBvdXRwdXQsIGVycjsN
Cj4+ICsNCj4+ICsJLyogR2V0IGN1cnJlbnQgV0xBTiBQb3dlciBUcmFuc21pc3Npb24gc3RhdGUg
Ki8NCj4+ICsJZXJyID0gZHByY19jb21tYW5kKERQUkNfR0VUX1dMQU5fU1RBVEUsICZvdXRwdXQp
Ow0KPj4gKwlpZiAoZXJyKQ0KPj4gKwkJcmV0dXJuIGVycjsNCj4+ICsNCj4+ICsJaWYgKG91dHB1
dCAmIEJJVCg0KSkNCj4NCj5JIGJlbGlldmUgaXQnZCBiZSBwcmVmZXJhYmxlIHRvIG5hbWUgYEJJ
VCg0KWAgYW5kIGBCSVQoOClgLiBFLmcuOg0KPg0KPiAgI2RlZmluZSBEUFJDX0dFVF9XTEFOX1NU
QVRFX1JFU19SRURVQ0VEIEJJVCg0KQ0KPiAgI2RlZmluZSBEUFJDX0dFVF9XTEFOX1NUQVRFX1JF
U19GVUxMICAgIEJJVCg4KQ0KPg0KPihvciBhbnkgbmFtZSB5b3UgbGlrZSkuDQo+DQpBY2sgLiBJ
IHdpbGwgbW9kaWZ5ICBpdCBpbiBuZXh0IHZlcnNpb24uDQoNCj4NCj4+ICsJCSp3bGFuX3R4cmVk
dWNlID0gMTsNCj4+ICsJZWxzZSBpZiAob3V0cHV0ICYgQklUKDgpKQ0KPj4gKwkJKndsYW5fdHhy
ZWR1Y2UgPSAwOw0KPj4gKwllbHNlDQo+PiArCQkqd2xhbl90eHJlZHVjZSA9IC0xOw0KPg0KPkNh
biB5b3UgZWxhYm9yYXRlIHdoYXQgLTEgbWVhbnMgaGVyZT8gVW5rbm93bi9ub3QNCj5hdmFpbGFi
bGUvaW52YWxpZC9lcnJvcj8NCg0KLTEgbWVhbnMgImVycm9yIiAuDQpJIGhhZCBmb3VuZCB0aGF0
IHdoZW4gIkRQUkMiIG1ldGhvZCByZXR1cm4gTUVUSE9EX0VSUiBpLmUgQklUKDMxKSBhcyAwIHRo
ZW4gaXQgZ29lcyB0byB0aGlzIGNvbmRpdGlvbi4NClNvICwgdGhlcmVmb3JlIEkgaGFkIGFkZGVk
IE1FVEhPRF9FUlIgY2hlY2sgaW4gZHByY19jb21tYW5kKCkgYW5kIG5vdyAsIHRoaXMgZG9lc25v
dCBnb2VzIGhlcmUuDQpCdXQsIEkgaGF2ZSBzdGlsbCBrZXB0IGl0IGhlcmUgLCBqdXN0IGluIGNh
c2UgaWYgYW55IG90aGVyIGVycm9yIG9jY3VycmVkIC4gDQpDYW4geW91IHBsZWFzZSBzdWdnZXN0
ICwgaWYgSSBzaG91bGQgcmVtb3ZlIGl0IChpLmUgcmVtb3ZlICp3bGFuX3R4cmVkdWNlID0gLTE7
ICk/ICBhcyBJIHN0aWxsIHRoaW5rLCB0aGVyZSBpcyBubyBoYXJtIGtlZXBpbmcgbGlrZSB0aGlz
Lg0KIA0KPg0KPg0KPj4gKw0KPj4gKwkqaGFzX3dsYW50eHJlZHVjZSA9IDE7DQo+DQo+SXMgaXQg
bmVjZXNzYXJ5IGZvciB0aGUgZ2V0dGVyIHRvIHNldCB0aGlzPyBDb3VsZG4ndCBpdCBiZSBzZXQg
aW4NCj5gdHBhY3BpX2RwcmNfaW5pdCgpYCBvbmNlIGR1cmluZyBpbml0aWFsaXphdGlvbj8NCg0K
QWN0dWFsbHksIHllcyB3ZSBjYW4ga2VlcCBpdCBpbiBpbml0IGZ1bmN0aW9uIGFsc28gYnV0IEkg
aGF2ZSBub3Qga2VwdCBpdCBiZWNhdXNlIG9mIG90aGVyIHBhdGNoIChQQVRDSCAyLzIpDQp3aGlj
aCBJIGhhZCBzZW50IC4gcGF0Y2ggMSAodGhpcyBwYXRjaCkgYW5kIHBhdGNoIDIgKCBvdGhlciBw
YXRjaCB3aGljaCBjcmVhdGUgc3lzZnMgb2YgV1dXQU4gQW50ZW5uYSB0eXBlKQ0KYm90aCB1c2Vz
ICJEUFJDIiBtZXRob2QgLiBTbyAsIHdlIHdpbGwgbmVlZCBhIGZsYWcgdG8gY3JlYXRlIHN5c2Zz
IGJlY2F1c2UgZmV3IHN5c3RlbSB3aWxsIG5vdCBoYXZlIHRoaXMgIndsYW4gdHggcmVkdWNlIg0K
ZXZlbiBpZiBpdCBoYXMgIkRQUkMiIG1ldGhvZCBleGlzdHMgYW5kIHZpY2UgdmVyc2EgLiANClNv
ICwgaW4gdGhpcyBjYXNlLCB3ZSBuZWVkIHRvIGV4cGxpY2l0bHkgY2hlY2sgd2hldGhlciBpdCBy
ZXF1aXJlIHRvIGNyZWF0ZSBjb3JyZXNwb25kaW5nIHN5c2ZzICBvciBub3QuDQoNCj4NCj4NCj4+
ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4gKy8qIHN5c2ZzIHdsYW4gZW50cnkgKi8NCj4+
ICtzdGF0aWMgc3NpemVfdCB3bGFuX3R4X3N0cmVuZ3RoX3JlZHVjZV9zaG93KHN0cnVjdCBkZXZp
Y2UgKmRldiwNCj4+ICsJCQkJc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+PiArCQkJ
CWNoYXIgKmJ1ZikNCj4NCj5QbGVhc2UgYWxpZ24gdGhlIGFyZ3VtZW50czoNCj4NCj4gIC4uLl9z
aG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gICAgICAgICAgIHN0cnVjdCBkZXZpY2VfYXR0cmli
dXRlIC4uLg0KPiAgICAgICAgICAgLi4uKTsNCj4NCkFjayAuIEkgd2lsbCBtb2RpZnkgIGl0IGlu
IG5leHQgdmVyc2lvbi4NCkFsc28gLCBJIHdpbGwgY29ycmVjdCBpdCBpbiBteSBvdGhlciBwYXRj
aChQQVRDSCAyLzIpIGFsc28uDQoNCj4NCj4+ICt7DQo+PiArCWludCBlcnI7DQo+PiArDQo+PiAr
CWVyciA9IGdldF93bGFuX3N0YXRlKCZoYXNfd2xhbnR4cmVkdWNlLCAmd2xhbl90eHJlZHVjZSk7
DQo+PiArCWlmIChlcnIpDQo+PiArCQlyZXR1cm4gZXJyOw0KPj4gKw0KPg0KPldvdWxkbid0IGl0
IGJlIGJldHRlciB0byByZXR1cm4gLUVOT0RBVEEgb3Igc29tZXRoaW5nIHNpbWlsYXIgd2hlbg0K
PmB3bGFuX3R4cmVkdWNlYCA9PSAtMT8NCg0KQWNrIC4gSSB0aGluayBFT1BOT1RTVVBQIHdpbGwg
YmUgYmV0dGVyID8gcmVhc29uIGlzIHRoYXQgIkRQUkMiIG1ldGhvZCBpcyBhdmFpbGFibGUgYnV0
IHRoZXJlIGlzIGVycm9yIC4gU28gLCBpdHMgbW9yZSBsaWtlbHkgdGhhdCBjb21tYW5kIGlzIG5v
dCBzdXBwb3J0ZWQuDQpIb3dldmVyLCBJIHdpbGwgbW9kaWZ5IGl0IGFmdGVyIEkgZ2V0IGZlZWRi
YWNrIGFib3V0IG15IHByZXZpb3VzIGNvbW1lbnQuDQoNCj4NCj4NCj4+ICsJcmV0dXJuIHN5c2Zz
X2VtaXQoYnVmLCAiJWRcbiIsIHdsYW5fdHhyZWR1Y2UpOyB9DQo+PiArDQo+PiArc3RhdGljIHNz
aXplX3Qgd2xhbl90eF9zdHJlbmd0aF9yZWR1Y2Vfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0K
Pj4gKwkJCQlzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4+ICsJCQkJY29uc3QgY2hh
ciAqYnVmLCBzaXplX3QgY291bnQpDQo+DQo+U2FtZSBoZXJlLg0KPg0KQWNrIC4gSSB3aWxsIG1v
ZGlmeSAgaXQgaW4gbmV4dCB2ZXJzaW9uLg0KPg0KPj4gK3sNCj4+ICsJaW50IG91dHB1dCwgZXJy
Ow0KPj4gKwl1bnNpZ25lZCBsb25nIHQ7DQo+PiArDQo+PiArCWlmIChwYXJzZV9zdHJ0b3VsKGJ1
ZiwgMSwgJnQpKQ0KPg0KPk1heWJlIGBrc3RydG9ib29sYD8NCg0KVGhhbmsgeW91IGZvciB5b3Vy
IHN1Z2dlc3Rpb24uDQpJIGNhbiB1c2UgJ2tzdHJ0b2Jvb2wnIGFuZCB3aWxsIG1vZGlmeSBvbiBt
eSBuZXh0IHZlcnNpb24uDQoNCj4NCj4NCj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4g
Kwl0cGFjcGlfZGlzY2xvc2VfdXNlcnRhc2soYXR0ci0+YXR0ci5uYW1lLA0KPj4gKwkJCQkiV0xB
TiB0eCBzdHJlbmd0aCByZWR1Y2VkICVsdVxuIiwgdCk7DQo+PiArDQo+PiArCXN3aXRjaCAodCkg
ew0KPj4gKwljYXNlIDA6DQo+PiArCQllcnIgPSBkcHJjX2NvbW1hbmQoRFBSQ19TRVRfV0xBTl9Q
T1dFUl9GVUxMLA0KPiZvdXRwdXQpOw0KPj4gKwkJYnJlYWs7DQo+PiArCWNhc2UgMToNCj4+ICsJ
CWVyciA9IGRwcmNfY29tbWFuZChEUFJDX1NFVF9XTEFOX1BPV0VSX1JFRFVDRSwNCj4mb3V0cHV0
KTsNCj4+ICsJCWJyZWFrOw0KPj4gKwlkZWZhdWx0Og0KPj4gKwkJZXJyID0gLUVJTlZBTDsNCj4+
ICsJCWRldl9lcnIoJnRwYWNwaV9wZGV2LT5kZXYsICJVbmtub3duIG9wZXJhdGluZyBtb2RlLg0K
Pklnbm9yaW5nXG4iKTsNCj4+ICsJCWJyZWFrOw0KPj4gKwl9DQo+PiArDQo+DQo+SWYgSSdtIG5v
dCBtaXN0YWtlbiwgYGVycmAgaXMgbmV2ZXIgcmV0dXJuZWQsIHNvIHRoZSB3cml0ZSgpIHdpbGwg
YWx3YXlzIHNlZW0gdG8NCj5zdWNjZWVkLg0KDQpZZXMgLCBpdHMgY29ycmVjdCAuIEkgd2lsbCB1
c2UgJ2tzdHJ0b2Jvb2wnIGFuZCB3aWxsIGRyb3AgdGhpcyA6ICJlcnIgPSAtRUlOVkFMOyINCklz
IGl0IE9rID8NCg0KPg0KPg0KPj4gKwlzeXNmc19ub3RpZnkoJnRwYWNwaV9wZGV2LT5kZXYua29i
aiwgTlVMTCwNCj4id2xhbl90eF9zdHJlbmd0aF9yZWR1Y2UiKTsNCj4+ICsJcmV0dXJuIGNvdW50
Ow0KPj4gK30NCj4+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcod2xhbl90eF9zdHJlbmd0aF9yZWR1
Y2UpOw0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgdHBhY3BpX2RwcmNfaW5pdChzdHJ1Y3QgaWJtX2lu
aXRfc3RydWN0ICppaWJtKSB7DQo+PiArCWludCB3bGFudHhfZXJyLCBlcnI7DQo+PiArDQo+PiAr
CXdsYW50eF9lcnIgPSBnZXRfd2xhbl9zdGF0ZSgmaGFzX3dsYW50eHJlZHVjZSwgJndsYW5fdHhy
ZWR1Y2UpOw0KPj4gKwkvKg0KPj4gKwkgKiBJZiBzdXBwb3J0IGlzbid0IGF2YWlsYWJsZSAoRU5P
REVWKSBmb3IgYm90aCBkZXZpY2VzIHRoZW4gcXVpdCwgYnV0DQo+PiArCSAqIGRvbid0IHJldHVy
biBhbiBlcnJvci4NCj4+ICsJICovDQo+PiArCWlmICh3bGFudHhfZXJyID09IC1FTk9ERVYpDQo+
PiArCQlyZXR1cm4gMDsNCj4+ICsJLyogT3RoZXJ3aXNlLCBpZiB0aGVyZSB3YXMgYW4gZXJyb3Ig
cmV0dXJuIGl0ICovDQo+PiArCWlmICh3bGFudHhfZXJyICYmICh3bGFudHhfZXJyICE9IC1FTk9E
RVYpKQ0KPj4gKwkJcmV0dXJuIHdsYW50eF9lcnI7DQo+PiArDQo+PiArCWlmIChoYXNfd2xhbnR4
cmVkdWNlKSB7DQo+PiArCQllcnIgPSBzeXNmc19jcmVhdGVfZmlsZSgmdHBhY3BpX3BkZXYtPmRl
di5rb2JqLA0KPj4gKwkJCQkmZGV2X2F0dHJfd2xhbl90eF9zdHJlbmd0aF9yZWR1Y2UuYXR0cik7
DQo+DQo+SSBiZWxpZXZlIGBkZXZpY2VfY3JlYXRlX2ZpbGUoKWAgd291bGQgYmUgYmV0dGVyLg0K
Pg0KU2luY2UsIGZpbGUgd2lsbCBiZSBjcmVhdGVkIGluIC9zeXMvIGRpcmVjdG9yeSAsIGhlbmNl
IEkgdGhpbmsgaXRzIGJldHRlciB0byB1c2Ugc3lzZnNfY3JlYXRlX2ZpbGUuDQpBbHNvLCBieSBj
aGVja2luZyBpbiB0aGlzICBmaWxlLCBpdCBsb29rcyBsaWtlIHN5c2ZzX2NyZWF0ZV9maWxlIHdp
bGwgYmUgbW9yZSByZWFzb25hYmxlIHRvIGRvIC4NCg0KUGxlYXNlIGxldCBtZSBrbm93LCBpZiBp
dHMgT2sgdG8gY29udGludWUgdXNpbmcgc3lzZnNfY3JlYXRlX2ZpbGUgb3IgeW91IHN0aWxsIGZl
ZWwuIHdlIG5lZWQgdG8gdXNlIA0KZGV2aWNlX2NyZWF0ZV9maWxlKCkgIGFsc28gZmVlbCBmcmVl
IHRvIGNvcnJlY3QgbWUsIGlmIEkgYW0gd3JvbmcuDQogDQo+DQo+PiArCQlpZiAoZXJyKQ0KPj4g
KwkJCXJldHVybiBlcnI7DQo+PiArCX0NCj4+ICsJcmV0dXJuIDA7DQo+PiArfQ0KPj4gKw0KPj4g
K3N0YXRpYyB2b2lkIGRwcmNfZXhpdCh2b2lkKQ0KPj4gK3sNCj4+ICsJaWYgKGhhc193bGFudHhy
ZWR1Y2UpDQo+PiArCQlzeXNmc19yZW1vdmVfZmlsZSgmdHBhY3BpX3BkZXYtPmRldi5rb2JqLA0K
Pj4gKyZkZXZfYXR0cl93bGFuX3R4X3N0cmVuZ3RoX3JlZHVjZS5hdHRyKTsNCj4NCj5BbmQgc2lt
aWxhcmx5LCBgZGV2aWNlX3JlbW92ZV9maWxlKClgLg0KDQpTYW1lIGNvbW1lbnQgYXMgYWJvdmUg
LiBJIGZlZWwsIHN5c2ZzX3JlbW92ZV9maWxlIGlzIG1vcmUgcmVhc29uYWJsZSB0byBkby4NCj4N
Cj4NCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCBpYm1fc3RydWN0IGRwcmNfZHJpdmVy
X2RhdGEgPSB7DQo+PiArCS5uYW1lID0gImRwcmMiLA0KPj4gKwkuZXhpdCA9IGRwcmNfZXhpdCwN
Cj4+ICt9Ow0KPj4gKw0KPj4NCj4vKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKg0KPioqKioqKioqKioqKg0KPj4NCj4qKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
Kg0KPioqKioqKioqKioqDQo+PiAgICoNCj4+IEBAIC0xMDQ3NSw2ICsxMDYwNywxMCBAQCBzdGF0
aWMgc3RydWN0IGlibV9pbml0X3N0cnVjdCBpYm1zX2luaXRbXQ0KPl9faW5pdGRhdGEgPSB7DQo+
PiAgCQkuaW5pdCA9IHRwYWNwaV9wcm94c2Vuc29yX2luaXQsDQo+PiAgCQkuZGF0YSA9ICZwcm94
c2Vuc29yX2RyaXZlcl9kYXRhLA0KPj4gIAl9LA0KPj4gKwl7DQo+PiArCQkuaW5pdCA9IHRwYWNw
aV9kcHJjX2luaXQsDQo+PiArCQkuZGF0YSA9ICZkcHJjX2RyaXZlcl9kYXRhLA0KPj4gKwl9LA0K
Pj4gIH07DQo+Pg0KPj4gIHN0YXRpYyBpbnQgX19pbml0IHNldF9pYm1fcGFyYW0oY29uc3QgY2hh
ciAqdmFsLCBjb25zdCBzdHJ1Y3QNCj4+IGtlcm5lbF9wYXJhbSAqa3ApDQo+PiAtLQ0KPj4gMi4y
NS4xDQo+DQo+DQo+UmVnYXJkcywNCj5CYXJuYWLDoXMgUMWRY3plDQoNClRoYW5rcyAmIFJlZ2Fy
ZHMsDQpOaXRpbiBKb3NoaSANCg==
