Return-Path: <platform-driver-x86+bounces-790-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A847825934
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Jan 2024 18:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0502D1F2427D
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Jan 2024 17:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E68F2E822;
	Fri,  5 Jan 2024 17:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Bo9JZa2p"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2048.outbound.protection.outlook.com [40.107.100.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DCE321AD;
	Fri,  5 Jan 2024 17:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ht5911HSZOiW8gjiPGWFRPtDaNDGUYONQUcBS7kB/dXIgdNhEKYRzuYdjgJkKBFH/Z3kWlbEvvMem95vacVItjIUWrIJ3W+1DpWRCPvietzuo1j6ndv2+BAW/EFKtGHW1CaAqOyr0mYVdd2ozich3GOBmFlqS6LZT709+irabQO6ni/RJR+cBHyWdgzkNRtrfbXiHKz/LrvqcliiLdUTjWNHtBXJmUdnKDucJZe7ShgBsvJFHZt8G8dKWwWiFKvu49QETOSY1A6V+tVaQVxOpni+myuvi5lCwgmEi9PslFWUBMbUjy2L5dT3uRB2G1S1XooH3JDPdBCca1GcisKsxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1gkNcnKhQ8zpCfqcBJL+17dFHPePvKm63C1FXthAy4=;
 b=dytSyNQBFHntisY1dx+PjtZJlUqxu9AFcr6UwqHFp6tlPV3NINfYFWjRG5r8+wyvzGrVYQLSGnsg+hYLL//vEDGVzvcLaMqUMbCJQvIkjc9dKDxcV54ZQ4DpkzG14emZ33CgXXdMnIwlXzjqmoMLZtVyCAHlAJl9DLGiZSjVAXHqgiXm6mOFLw0InZ+XxdZr2bnkNG4ynTe3nMfF5tlJVhnoo/Z7NFY+8CuJZUSzdRfgWR/1ZF7Da1D/JBKYtaedhwyOFDf1eM7Oy/qjVErkvHXLnhyq3mQzf517kqyIQtlf1ChRLPUJHB1Z6Nl0HmP3n3+fyWPGCdRPwIAadnaz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1gkNcnKhQ8zpCfqcBJL+17dFHPePvKm63C1FXthAy4=;
 b=Bo9JZa2peEJbkyd/RkI/W0w05sb80Tk8DgtOxeLu5KQ6mbLwEmathqWJiKGbjag+aHf4v0nIPtL4Ak7VaY1yT7GvaVN8TC0Xv78CUj8l0WJGr9Z5/VTJRzgaZKlt54P2jM5NzBr+XU5rA/NFwjrS+6VcDYqLVCXXIPSolEHvnnldaEZFkc+DTIi9zysBkzLvlfk6z2lcWgAtI2jiGBAQrSZ805fOErbGcQrZYSb2Ml0dbXkQ4O47EUeLvPj2BuyQjIA8PZXGuk9jQm1Ut6GWIzG8Dtxvs5RKZHSs6UiXnM/lcpnPevPEFsPf8hRz/27wzuv26Jj+ZMzfCjlwHGAawA==
Received: from BN9PR12MB5068.namprd12.prod.outlook.com (2603:10b6:408:135::21)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.14; Fri, 5 Jan
 2024 17:40:02 +0000
Received: from BN9PR12MB5068.namprd12.prod.outlook.com
 ([fe80::e0a8:ea57:c1b2:28ab]) by BN9PR12MB5068.namprd12.prod.outlook.com
 ([fe80::e0a8:ea57:c1b2:28ab%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 17:40:02 +0000
From: Liming Sun <limings@nvidia.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Vadim Pasternak <vadimp@nvidia.com>, David Thompson
	<davthompson@nvidia.com>, Hans de Goede <hdegoede@redhat.com>, Mark Gross
	<markgross@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 1/1] Drop Tx network packet when Tx TmFIFO is full
Thread-Topic: [PATCH v2 1/1] Drop Tx network packet when Tx TmFIFO is full
Thread-Index: AQHaPyC5P7fD0yPdoEqpu5OIzX2cALDJ622AgAGRT2A=
Date: Fri, 5 Jan 2024 17:40:01 +0000
Message-ID:
 <BN9PR12MB5068662A46D3B8A23BFE5DA6D3662@BN9PR12MB5068.namprd12.prod.outlook.com>
References:
 <f250079635da4ba75c3a3a1d7c3820f48cfc3f06.1704380474.git.limings@nvidia.com>
 <02fd0faaa555d1914b6ff4bd4b0b294e16989cef.1704381197.git.limings@nvidia.com>
 <c510206b-1dbb-8f1-642d-7e1c8ac7a7c@linux.intel.com>
In-Reply-To: <c510206b-1dbb-8f1-642d-7e1c8ac7a7c@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR12MB5068:EE_|IA1PR12MB6067:EE_
x-ms-office365-filtering-correlation-id: 45ab737a-4a42-4724-886a-08dc0e155864
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DEzGQhBxU0LvqQlmMLm2/LUjnxmSA2s4J2fqmp20mcVGKjDHn4VKDK4gbIGPzFRpXj7+1iIE6LxbcgNbH7Ch6UV6aIoqljrqHAet+pNe/CZ7AKVpVVKWfJvyklHtKXY741l6BRRE1ehC9wCigJ0hiLEHhQwjgzN8jwO64TgqlVshh3Uby7TCTo0aomHm9/l0NMdkEwP1oVlqJGUAdCY7X/isPspW49zk5ayoVpJWJIrfNVloK4DptTB5GolSNl6H8yIAOneIBTRsbGjm9syTcCjEKXf7h4zC+FaaeJAKSqvDXn6L11vsOXCg5+0L9z4SWhKk2/00YjiM+m+oMojID9hna8lJw0Cd2TU0Fs9oMwSZThn6WlRJ6k49tAmuJmAdQ8yNZlntointRiLtvtU2Xf5mTndyYqHnVVP76WzG6z5xPuDStMWKrv799Iwh9CseSatlRWQ3vJWGvGpe1annUAU/mrWdPIQ6deYc4vaNdUzoJF994LcxHIjAZ0bVgliOaOWDkK38+Rc3byKCILSj+ayj2l59ywCyMSyEObZ0bXaFn/JLWGGVebyORle2PmS0+46oxUS5Jovh5CzrjVFEOkjxozn2Y1KOd9+vd0lZRBB2u6fdI6HbilapLvMEyc4IEJxqo/FAZi7VUGzYGCTlwRXRNFfpu17vHPXpHcb6+AWhhC3rB7V0ZuX64Ud74a1z
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5068.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(230273577357003)(230173577357003)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(66574015)(53546011)(83380400001)(9686003)(26005)(64756008)(7696005)(6506007)(122000001)(71200400001)(5660300002)(52536014)(41300700001)(2906002)(66476007)(478600001)(66946007)(6916009)(8936002)(54906003)(8676002)(66446008)(4326008)(76116006)(316002)(66556008)(33656002)(86362001)(38100700002)(38070700009)(55016003)(21314003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?T2EyQWFodW9FYmxzZDl2Tm1QYzExbnBxdDRhd29abHdWRHdUMWtwVHdQWklk?=
 =?utf-8?B?U0lDdUcybmsvSEhQbTcrRThaeEZ3VFVoVFpCbm5BdnNVTkU3UUJCeTd2QU1t?=
 =?utf-8?B?M1BIZDNKM09VcmZnMlQ3SDNFNE5xa1daeGw0bW9OdTY3ZzZleWJsWFdUWm40?=
 =?utf-8?B?UEtMakxQSEhoSm1CcVBBWENFUFdxUmV3Vnh2Y2c3UmkwT0p4SWRwREtnbWdX?=
 =?utf-8?B?UnFGV245VXN0VDVYYzNoRS95bFdmK1JmVEREZUhKTm1pT1kxeFRWVlF2RUtX?=
 =?utf-8?B?aFRoZWdwWWJsSjRydkhnTldOMlVMdTlJU2dFQ2xCekpoR3M2WEZZTVlGbUt4?=
 =?utf-8?B?TE1CNXJSTjdNUnhFOUJQdU8wSTNxdVBlZ0ZoWDRsbG9XNXZLZjdmWHNaMmxS?=
 =?utf-8?B?eDluK3V0OWNJbjEzMEtzTkV2RGlPQTlPM3dFbHBFTFp3dXdNaE5XMW80MG1M?=
 =?utf-8?B?bHVwQXUxNVg2NVlkY0hOdlRma3ExWmtDdTI5WG41aTV1TUI4L1ZzTFdyS1A5?=
 =?utf-8?B?TXY2czFMTnRFNVVFTmFWTW1HZEErYytSY1lJSW5UOG1EZy93OGdxMldiOWFq?=
 =?utf-8?B?Qm9teUZwbDNWU0FlUDlGVk5OSzEzMjhMUnUvd25BdlF0Tjl0QjhyVS90UG1a?=
 =?utf-8?B?RFhqQjQrVHI1T29LSFBlamRuMEFEZjNmeERMbTlxc2F1alN2enI5QnNhZ0ZL?=
 =?utf-8?B?eGpOMnBPZ0sydVNhbTgvdmFCN1lveThsV2RrZDhNNnlvTjhraU1jZ0h4MnR1?=
 =?utf-8?B?QW4xd1hPZkk4ZDJ0V0FRczc1ZkFoOFVueEJWcXl0SWxIM3VUWTEvWGZIM3o4?=
 =?utf-8?B?dlAwUklrSW1qRG1hYklCaGNETDE3UVRwaXZRTzRqQzZtSHhtTHd2S2pQc3Yy?=
 =?utf-8?B?TUZ5cFVvQ0pkdFBXdmpHeTM1ZlVwbHV2bzlndU9SanY5WWFxVHZjUFZLMnI2?=
 =?utf-8?B?U21DYmxYTVpiS0YzVnhOM1JUMGpVOVo3Q24vOWxGdEl0WjdyRG9kL0VBbE4y?=
 =?utf-8?B?b2ZudzJzQzdNekxaUlFpQ0pxK1o2TzZkWmRXVUhqRk5aTXd4Yjg2b2RqbkdX?=
 =?utf-8?B?dkc3bU44MVZwMzRzTCs2NTNsN1k5OUp0MDNVckQ0WVFmQ2JEblJTSWljZUVs?=
 =?utf-8?B?ZXZHNElqaFJwYnFTYkZXdFlrZ2xRU1IzUXZSTTBMNG5RZEIxdkFySm1IYlNJ?=
 =?utf-8?B?czhtWjUwVzZyWnJXdjViK3Q5c3dQSEpCbmFvK1c5eGtiRDN3d3VBQ3VSNXZt?=
 =?utf-8?B?b3MvWUVmYURDRE90b0lmNEFVSWdWMWQzbExJZ2JtL3Uxd0ZYTVNWcHMzaHg2?=
 =?utf-8?B?ZHVCaUVieEZ6VEpwTXUraTNKdm03UDhOTXh0S3BDSXliTUlMQk1GQjM0cDQ2?=
 =?utf-8?B?VW5KWjBzNnlZMGUzbEh3dVZiUkQ2dzUrY09HOXVLa0MxbUIxTjY2OTFOKzYv?=
 =?utf-8?B?SDB6N0xoc25kMGl2bFFzemdSMlFkU0tHWFdidUpDQnlITlZJaXFjeURQaTB6?=
 =?utf-8?B?dUtIQ0RJcCtkQXp5WS9nYTRWRk5XaXVjbFNOSjMvdlZnOTYya3g5ZDE5UHlY?=
 =?utf-8?B?emQvcWVaVGxvMW53STJkd2huYk5jVU9WNDN6VWxhSWxhUGlBZHdwVUdoNHZh?=
 =?utf-8?B?SnBObEVmWEFjY2VFRnl1NUhQK29zTFVJMTlQdEs4YVRoUGVrak9NZ2tFS1Vw?=
 =?utf-8?B?ZnM4RGtpNHhCQXd2S250NEN6WjZsNlpvYVVwUXd5U2hYV3ZTQXZ2QnhBd1ZY?=
 =?utf-8?B?ZE5RZDBBR2tYRUxubzVMdjVvZmFhN3p3N2VpY3E0NXF4S3ljVUFDZUNqWUY0?=
 =?utf-8?B?eHQyNUVYR3hLN1BWZXpiM0NjNndxcDhPbndwVUlLK0g2RCtWVVpVcXB2bEhC?=
 =?utf-8?B?OGxsSlZRNnNvKzVpNGNqZWFCc0puQUlRK3hyUHk5eWVFTktxdWpRaWVkOG44?=
 =?utf-8?B?L0x6Sm04WmlCTjNPSktDYmVLaHRyd1R2dUYyTEVSMVc2VmRlVW4wUms2OGh2?=
 =?utf-8?B?OGtTSnV2b01CdTdIU1A3Zkt2QVlNclpRblV0cTFRU0RQY083bUxBcnFsRTQ5?=
 =?utf-8?B?NWU2eTdVRm1PWWd4QWREczZhSG1NZkQzdEQyaEduTHZkOUlBL0NDMldLUjdF?=
 =?utf-8?Q?Yuls=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5068.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ab737a-4a42-4724-886a-08dc0e155864
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2024 17:40:01.9339
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xU7ElyclFKcXzRNvxZCVd3myL0yUhqFmMMuZPWZOqlgHEja8SfElK+H2AXXIFbdBUlRRLqkX2+/o/HgFA1RncQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4g
PGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSmFudWFy
eSA0LCAyMDI0IDEyOjM5IFBNDQo+IFRvOiBMaW1pbmcgU3VuIDxsaW1pbmdzQG52aWRpYS5jb20+
DQo+IENjOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPjsgRGF2aWQgVGhvbXBz
b24NCj4gPGRhdnRob21wc29uQG52aWRpYS5jb20+OyBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPjsNCj4gTWFyayBHcm9zcyA8bWFya2dyb3NzQGtlcm5lbC5vcmc+OyBEYW4gQ2Fy
cGVudGVyDQo+IDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+OyBwbGF0Zm9ybS1kcml2ZXIteDg2
QHZnZXIua2VybmVsLm9yZzsgTEtNTA0KPiA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz4N
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAxLzFdIERyb3AgVHggbmV0d29yayBwYWNrZXQgd2hl
biBUeCBUbUZJRk8gaXMgZnVsbA0KPiANCj4gT24gVGh1LCA0IEphbiAyMDI0LCBMaW1pbmcgU3Vu
IHdyb3RlOg0KPiANCj4gPiBTdGFydGluZyBmcm9tIExpbnV4IDUuMTYga2VybmVsLCBUeCB0aW1l
b3V0IG1lY2hhbmlzbSB3YXMgYWRkZWQNCj4gPiBpbnRvIHRoZSB2aXJ0aW9fbmV0IGRyaXZlciB3
aGljaCBwcmludHMgdGhlICJUeCB0aW1lb3V0IiBtZXNzYWdlDQo+ID4gd2hlbiBhIHBhY2tldCBp
cyBzdHVjayBpbiBUeCBxdWV1ZSBmb3IgdG9vIGxvbmcgd2hpY2ggY291bGQgaGFwcGVuDQo+ID4g
d2hlbiBleHRlcm5hbCBob3N0IGRyaXZlciBpcyBzdHVjayBvciBzdG9wcGVkIGFuZCBmYWlsZWQg
dG8gcmVhZA0KPiA+IHRoZSBGSUZPLg0KPiA+DQo+ID4gQmVsb3cgaXMgYW4gZXhhbXBsZSBvZiB0
aGUgcmVwb3J0ZWQgbWVzc2FnZToNCj4gPg0KPiA+ICJbNDk0MTA1LjMxNjczOV0gdmlydGlvX25l
dCB2aXJ0aW8xIHRtZmlmb19uZXQwOiBUWCB0aW1lb3V0IG9uDQo+ID4gcXVldWU6IDAsIHNxOiBv
dXRwdXQuMCwgdnE6IDDDlzEsIG5hbWU6IG91dHB1dC4wLCB1c2VjcyBzaW5jZQ0KPiA+IGxhc3Qg
dHJhbnM6IDMwNzk4OTIyNTYiLg0KPiA+DQo+ID4gVG8gYXZvaWQgc3VjaCAiVHggdGltZW91dCIg
bWVzc2FnZXMsIHRoaXMgY29tbWl0IGFkZHMgYSB0aW1lb3V0DQo+ID4gbWVjaGFuaXNtIHRvIGRy
b3AgYW5kIHJlbGVhc2UgdGhlIHBlbmRpbmcgVHggcGFja2V0IGlmIG5vdCBhYmxlIHRvDQo+ID4g
dHJhbnNtaXQgZm9yIHR3byBzZWNvbmRzIGR1ZSB0byBUeCBGSUZPIGZ1bGwuDQo+ID4NCj4gPiBU
aGlzIGNvbW1pdCBhbHNvIGhhbmRsZXMgdGhlIHNwZWNpYWwgY2FzZSB0aGF0IHRoZSBwYWNrZXQg
aXMgaGFsZi0NCj4gPiB0cmFuc21pdHRlZCBpbnRvIHRoZSBUeCBGSUZPLiBJbiBzdWNoIGNhc2Us
IHRoZSBwYWNrZXQgaXMgZGlzY2FyZGVkDQo+ID4gd2l0aCByZW1haW5pbmcgbGVuZ3RoIHN0b3Jl
ZCBpbiB2cmluZy0+cmVtX3BhZGRpbmcuIFNvIHBhZGRpbmdzIHdpdGgNCj4gPiB6ZXJvcyBjYW4g
YmUgc2VudCBvdXQgd2hlbiBUeCBzcGFjZSBpcyBhdmFpbGFibGUgdG8gbWFpbnRhaW4gdGhlDQo+
ID4gaW50ZWdyaXR5IG9mIHRoZSBwYWNrZXQgZm9ybWF0LiBUaGUgcGFkZGVkIHBhY2tldCB3aWxs
IGJlIGRyb3BwZWQgb24NCj4gPiB0aGUgcmVjZWl2aW5nIHNpZGUuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBMaW1pbmcgU3VuIDxsaW1pbmdzQG52aWRpYS5jb20+DQo+IA0KPiBUaGlzIGRvZXNu
J3QgcmVhbGx5IGV4cGxhaW4gaG93IGl0IGhlbHBzIChvdGhlciB0aGFuIGF2b2lkaW5nIHRoZQ0K
PiBtZXNzYWdlIHdoaWNoIHNvdW5kcyBsaWtlIGp1c3QgaGlkaW5nIHRoZSBpc3N1ZSkuIFRoYXQg
aXMsIGhvdyB0aGlzIGhlbHBzDQo+IHRvIHJlc3VtZSBUeD8gT3IgZG9lcyBUeCByZXN1bWU/IFRo
ZXJlJ3Mgbm90aGluZyB0byBpbmRpY2F0ZSBlaXRoZXIgd2F5Lg0KDQpBcyB0aGUgY29tbWl0IG1l
c3NhZ2UgbWVudGlvbmVkLCB0aGUgZXhwaXJlZCBwYWNrZXQgaXMgZGlzY2FyZGVkIGFuZCB0aGUN
CnBhY2tldCBidWZmZXIgaXMgcmVsZWFzZWQgKHNlZSBjaGFuZ2VzIG9mIGNhbGxpbmcgbWx4YmZf
dG1maWZvX3JlbGVhc2VfcGt0KCkpLg0KVGhlIFR4IHdpbGwgcmVzdW1lIGF1dG9tYXRpY2FsbHkg
b25jZSB0aGUgRklGTyBzcGFjZSBpcyBhdmFpbGFibGUsIHN1Y2ggYXMgd2hlbg0KZXh0ZXJuYWwg
aG9zdCBkcml2ZXIgc3RhcnRzIHRvIGRyYWluIHRoZSBUTUZJRk8uIE5vIG5lZWQgZm9yIGFueSBv
dGhlciBsb2dpYy4NCg0KPiANCj4gLS0NCj4gIGkuDQo+IA0KPiANCj4gPiAtLS0NCj4gPiAgZHJp
dmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhiZi10bWZpZm8uYyB8IDY3DQo+ICsrKysrKysrKysr
KysrKysrKysrKysrKw0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNjcgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4YmYtdG1maWZv
LmMNCj4gYi9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21seGJmLXRtZmlmby5jDQo+ID4gaW5k
ZXggNWM2ODNiNGVhZjEwLi5mMzliN2I5ZDJiZmUgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9w
bGF0Zm9ybS9tZWxsYW5veC9tbHhiZi10bWZpZm8uYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGxhdGZv
cm0vbWVsbGFub3gvbWx4YmYtdG1maWZvLmMNCj4gPiBAQCAtNDcsNiArNDcsOSBAQA0KPiA+ICAv
KiBNZXNzYWdlIHdpdGggZGF0YSBuZWVkcyBhdCBsZWFzdCB0d28gd29yZHMgKGZvciBoZWFkZXIg
JiBkYXRhKS4gKi8NCj4gPiAgI2RlZmluZSBNTFhCRl9UTUZJRk9fREFUQV9NSU5fV09SRFMJCTIN
Cj4gPg0KPiA+ICsvKiBUeCB0aW1lb3V0IGluIG1pbGxpc2Vjb25kcy4gKi8NCj4gPiArI2RlZmlu
ZSBUTUZJRk9fVFhfVElNRU9VVAkJCTIwMDANCj4gPiArDQo+ID4gIC8qIEFDUEkgVUlEIGZvciBC
bHVlRmllbGQtMy4gKi8NCj4gPiAgI2RlZmluZSBUTUZJRk9fQkYzX1VJRAkJCQkxDQo+ID4NCj4g
PiBAQCAtNjIsMTIgKzY1LDE0IEBAIHN0cnVjdCBtbHhiZl90bWZpZm87DQo+ID4gICAqIEBkcm9w
X2Rlc2M6IGR1bW15IGRlc2MgZm9yIHBhY2tldCBkcm9wcGluZw0KPiA+ICAgKiBAY3VyX2xlbjog
cHJvY2Vzc2VkIGxlbmd0aCBvZiB0aGUgY3VycmVudCBkZXNjcmlwdG9yDQo+ID4gICAqIEByZW1f
bGVuOiByZW1haW5pbmcgbGVuZ3RoIG9mIHRoZSBwZW5kaW5nIHBhY2tldA0KPiA+ICsgKiBAcmVt
X3BhZGRpbmc6IHJlbWFpbmluZyBieXRlcyB0byBzZW5kIGFzIHBhZGRpbmdzDQo+ID4gICAqIEBw
a3RfbGVuOiB0b3RhbCBsZW5ndGggb2YgdGhlIHBlbmRpbmcgcGFja2V0DQo+ID4gICAqIEBuZXh0
X2F2YWlsOiBuZXh0IGF2YWlsIGRlc2NyaXB0b3IgaWQNCj4gPiAgICogQG51bTogdnJpbmcgc2l6
ZSAobnVtYmVyIG9mIGRlc2NyaXB0b3JzKQ0KPiA+ICAgKiBAYWxpZ246IHZyaW5nIGFsaWdubWVu
dCBzaXplDQo+ID4gICAqIEBpbmRleDogdnJpbmcgaW5kZXgNCj4gPiAgICogQHZkZXZfaWQ6IHZy
aW5nIHZpcnRpbyBpZCAoVklSVElPX0lEX3h4eCkNCj4gPiArICogQHR4X3RpbWVvdXQ6IGV4cGly
ZSB0aW1lIG9mIGxhc3QgdHggcGFja2V0DQo+ID4gICAqIEBmaWZvOiBwb2ludGVyIHRvIHRoZSB0
bWZpZm8gc3RydWN0dXJlDQo+ID4gICAqLw0KPiA+ICBzdHJ1Y3QgbWx4YmZfdG1maWZvX3ZyaW5n
IHsNCj4gPiBAQCAtNzksMTIgKzg0LDE0IEBAIHN0cnVjdCBtbHhiZl90bWZpZm9fdnJpbmcgew0K
PiA+ICAJc3RydWN0IHZyaW5nX2Rlc2MgZHJvcF9kZXNjOw0KPiA+ICAJaW50IGN1cl9sZW47DQo+
ID4gIAlpbnQgcmVtX2xlbjsNCj4gPiArCWludCByZW1fcGFkZGluZzsNCj4gPiAgCXUzMiBwa3Rf
bGVuOw0KPiA+ICAJdTE2IG5leHRfYXZhaWw7DQo+ID4gIAlpbnQgbnVtOw0KPiA+ICAJaW50IGFs
aWduOw0KPiA+ICAJaW50IGluZGV4Ow0KPiA+ICAJaW50IHZkZXZfaWQ7DQo+ID4gKwl1bnNpZ25l
ZCBsb25nIHR4X3RpbWVvdXQ7DQo+ID4gIAlzdHJ1Y3QgbWx4YmZfdG1maWZvICpmaWZvOw0KPiA+
ICB9Ow0KPiA+DQo+ID4gQEAgLTgxOSw2ICs4MjYsNTAgQEAgc3RhdGljIGJvb2wgbWx4YmZfdG1m
aWZvX3J4dHhfb25lX2Rlc2Moc3RydWN0DQo+IG1seGJmX3RtZmlmb192cmluZyAqdnJpbmcsDQo+
ID4gIAlyZXR1cm4gdHJ1ZTsNCj4gPiAgfQ0KPiA+DQo+ID4gK3N0YXRpYyB2b2lkIG1seGJmX3Rt
Zmlmb19jaGVja190eF90aW1lb3V0KHN0cnVjdCBtbHhiZl90bWZpZm9fdnJpbmcNCj4gKnZyaW5n
KQ0KPiA+ICt7DQo+ID4gKwl1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+ICsNCj4gPiArCS8qIE9u
bHkgaGFuZGxlIFR4IHRpbWVvdXQgZm9yIG5ldHdvcmsgdmRldi4gKi8NCj4gPiArCWlmICh2cmlu
Zy0+dmRldl9pZCAhPSBWSVJUSU9fSURfTkVUKQ0KPiA+ICsJCXJldHVybjsNCj4gPiArDQo+ID4g
KwkvKiBJbml0aWFsaXplIHRoZSB0aW1lb3V0IG9yIHJldHVybiBpZiBub3QgZXhwaXJlZC4gKi8N
Cj4gPiArCWlmICghdnJpbmctPnR4X3RpbWVvdXQpIHsNCj4gPiArCQkvKiBJbml0aWFsaXplIHRo
ZSB0aW1lb3V0LiAqLw0KPiA+ICsJCXZyaW5nLT50eF90aW1lb3V0ID0gamlmZmllcyArDQo+ID4g
KwkJCW1zZWNzX3RvX2ppZmZpZXMoVE1GSUZPX1RYX1RJTUVPVVQpOw0KPiA+ICsJCXJldHVybjsN
Cj4gPiArCX0gZWxzZSBpZiAodGltZV9iZWZvcmUoamlmZmllcywgdnJpbmctPnR4X3RpbWVvdXQp
KSB7DQo+ID4gKwkJLyogUmV0dXJuIGlmIG5vdCB0aW1lb3V0IHlldC4gKi8NCj4gPiArCQlyZXR1
cm47DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICsJLyoNCj4gPiArCSAqIERyb3AgdGhlIHBhY2tldCBh
ZnRlciB0aW1lb3V0LiBUaGUgb3V0c3RhbmRpbmcgcGFja2V0IGlzDQo+ID4gKwkgKiByZWxlYXNl
ZCBhbmQgdGhlIHJlbWFpbmluZyBieXRlcyB3aWxsIGJlIHNlbnQgd2l0aCBwYWRkaW5nIGJ5dGUN
Cj4gMHgwMA0KPiA+ICsJICogYXMgYSByZWNvdmVyeS4gT24gdGhlIHBlZXIoaG9zdCkgc2lkZSwg
dGhlIHBhZGRpbmcgYnl0ZXMgMHgwMCB3aWxsIGJlDQo+ID4gKwkgKiBlaXRoZXIgZHJvcHBlZCBk
aXJlY3RseSwgb3IgYXBwZW5kZWQgaW50byBleGlzdGluZyBvdXRzdGFuZGluZw0KPiBwYWNrZXQN
Cj4gPiArCSAqIHRodXMgZHJvcHBlZCBhcyBjb3JydXB0ZWQgbmV0d29yayBwYWNrZXQuDQo+ID4g
KwkgKi8NCj4gPiArCXZyaW5nLT5yZW1fcGFkZGluZyA9IHJvdW5kX3VwKHZyaW5nLT5yZW1fbGVu
LCBzaXplb2YodTY0KSk7DQo+ID4gKwltbHhiZl90bWZpZm9fcmVsZWFzZV9wa3QodnJpbmcpOw0K
PiA+ICsJdnJpbmctPmN1cl9sZW4gPSAwOw0KPiA+ICsJdnJpbmctPnJlbV9sZW4gPSAwOw0KPiA+
ICsJdnJpbmctPmZpZm8tPnZyaW5nWzBdID0gTlVMTDsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJ
ICogTWFrZSBzdXJlIHRoZSBsb2FkL3N0b3JlIGFyZSBpbiBvcmRlciBiZWZvcmUNCj4gPiArCSAq
IHJldHVybmluZyBiYWNrIHRvIHZpcnRpby4NCj4gPiArCSAqLw0KPiA+ICsJdmlydGlvX21iKGZh
bHNlKTsNCj4gPiArDQo+ID4gKwkvKiBOb3RpZnkgdXBwZXIgbGF5ZXIuICovDQo+ID4gKwlzcGlu
X2xvY2tfaXJxc2F2ZSgmdnJpbmctPmZpZm8tPnNwaW5fbG9ja1swXSwgZmxhZ3MpOw0KPiA+ICsJ
dnJpbmdfaW50ZXJydXB0KDAsIHZyaW5nLT52cSk7DQo+ID4gKwlzcGluX3VubG9ja19pcnFyZXN0
b3JlKCZ2cmluZy0+Zmlmby0+c3Bpbl9sb2NrWzBdLCBmbGFncyk7DQo+ID4gK30NCj4gPiArDQo+
ID4gIC8qIFJ4ICYgVHggcHJvY2Vzc2luZyBvZiBhIHF1ZXVlLiAqLw0KPiA+ICBzdGF0aWMgdm9p
ZCBtbHhiZl90bWZpZm9fcnh0eChzdHJ1Y3QgbWx4YmZfdG1maWZvX3ZyaW5nICp2cmluZywgYm9v
bCBpc19yeCkNCj4gPiAgew0KPiA+IEBAIC04NDEsNiArODkyLDcgQEAgc3RhdGljIHZvaWQgbWx4
YmZfdG1maWZvX3J4dHgoc3RydWN0DQo+IG1seGJmX3RtZmlmb192cmluZyAqdnJpbmcsIGJvb2wg
aXNfcngpDQo+ID4gIAkJcmV0dXJuOw0KPiA+DQo+ID4gIAlkbyB7DQo+ID4gK3JldHJ5Og0KPiA+
ICAJCS8qIEdldCBhdmFpbGFibGUgRklGTyBzcGFjZS4gKi8NCj4gPiAgCQlpZiAoYXZhaWwgPT0g
MCkgew0KPiA+ICAJCQlpZiAoaXNfcngpDQo+ID4gQEAgLTg1MSw2ICs5MDMsMTcgQEAgc3RhdGlj
IHZvaWQgbWx4YmZfdG1maWZvX3J4dHgoc3RydWN0DQo+IG1seGJmX3RtZmlmb192cmluZyAqdnJp
bmcsIGJvb2wgaXNfcngpDQo+ID4gIAkJCQlicmVhazsNCj4gPiAgCQl9DQo+ID4NCj4gPiArCQkv
KiBJbnNlcnQgcGFkZGluZ3MgZm9yIGRpc2NhcmRlZCBUeCBwYWNrZXQuICovDQo+ID4gKwkJaWYg
KCFpc19yeCkgew0KPiA+ICsJCQl2cmluZy0+dHhfdGltZW91dCA9IDA7DQo+ID4gKwkJCXdoaWxl
ICh2cmluZy0+cmVtX3BhZGRpbmcgPj0gc2l6ZW9mKHU2NCkpIHsNCj4gPiArCQkJCXdyaXRlcSgw
LCB2cmluZy0+Zmlmby0+dHguZGF0YSk7DQo+ID4gKwkJCQl2cmluZy0+cmVtX3BhZGRpbmcgLT0g
c2l6ZW9mKHU2NCk7DQo+ID4gKwkJCQlpZiAoLS1hdmFpbCA9PSAwKQ0KPiA+ICsJCQkJCWdvdG8g
cmV0cnk7DQo+ID4gKwkJCX0NCj4gPiArCQl9DQo+ID4gKw0KPiA+ICAJCS8qIENvbnNvbGUgb3V0
cHV0IGFsd2F5cyBjb21lcyBmcm9tIHRoZSBUeCBidWZmZXIuICovDQo+ID4gIAkJaWYgKCFpc19y
eCAmJiBkZXZpZCA9PSBWSVJUSU9fSURfQ09OU09MRSkgew0KPiA+ICAJCQltbHhiZl90bWZpZm9f
Y29uc29sZV90eChmaWZvLCBhdmFpbCk7DQo+ID4gQEAgLTg2MCw2ICs5MjMsMTAgQEAgc3RhdGlj
IHZvaWQgbWx4YmZfdG1maWZvX3J4dHgoc3RydWN0DQo+IG1seGJmX3RtZmlmb192cmluZyAqdnJp
bmcsIGJvb2wgaXNfcngpDQo+ID4gIAkJLyogSGFuZGxlIG9uZSBkZXNjcmlwdG9yLiAqLw0KPiA+
ICAJCW1vcmUgPSBtbHhiZl90bWZpZm9fcnh0eF9vbmVfZGVzYyh2cmluZywgaXNfcngsICZhdmFp
bCk7DQo+ID4gIAl9IHdoaWxlIChtb3JlKTsNCj4gPiArDQo+ID4gKwkvKiBDaGVjayBUeCB0aW1l
b3V0LiAqLw0KPiA+ICsJaWYgKGF2YWlsIDw9IDAgJiYgIWlzX3J4KQ0KPiA+ICsJCW1seGJmX3Rt
Zmlmb19jaGVja190eF90aW1lb3V0KHZyaW5nKTsNCj4gPiAgfQ0KPiA+DQo+ID4gIC8qIEhhbmRs
ZSBSeCBvciBUeCBxdWV1ZXMuICovDQo+ID4NCg==

