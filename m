Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 917F11495C
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 14:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbfEFMNA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 08:13:00 -0400
Received: from mail-eopbgr80042.outbound.protection.outlook.com ([40.107.8.42]:30080
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725827AbfEFMNA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 08:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2BZBuP4rITobPW838lue/V4ZlZ4puBsvYaDox3tWn0Q=;
 b=Cssp+6ibmeGqLGlzO+X2ou15mXJA6mA6t3el48umgSk6DJLtL51KU0CwcdbB6BsRvyZeWE0u6k+36SAg8vbIHcrVRHj3slvT90KWqBO+pFyaYLGlFptG58n0tudzYR/LPi1/UvEbReENQ3em7ihN4NpJE4P44Ke1Gl3wpdZ3+b0=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5015.eurprd05.prod.outlook.com (20.177.36.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.11; Mon, 6 May 2019 12:12:57 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56%2]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 12:12:57 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "michealsh@mellanox.com" <michealsh@mellanox.com>
Subject: RE: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new
 features
Thread-Topic: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new
 features
Thread-Index: AQHU3XmMCNo9QfDiZku9Fe0it2UAMqZeIyMAgAADT2CAAAMPgIAAAd7ggAAiFYCAAAFpAA==
Date:   Mon, 6 May 2019 12:12:57 +0000
Message-ID: <AM6PR05MB52243E392EEA307176A75CCDA2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20190318105823.2821-1-vadimp@mellanox.com>
 <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
 <AM6PR05MB522498F37724F8F82564BCF4A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <CAHp75Veq4Xq_faPKMkdEmOmY5JHMms=4KX51GdM20DFPH_BzTg@mail.gmail.com>
 <AM6PR05MB5224A49FD6ED666D0033BB28A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <CAHp75VdY9AD2tOirX7b57f55=RbHJPjnJS2bV3gG1xs4B8z2zA@mail.gmail.com>
In-Reply-To: <CAHp75VdY9AD2tOirX7b57f55=RbHJPjnJS2bV3gG1xs4B8z2zA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 019c66ed-9c06-4c0e-0d6e-08d6d21c2cd2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB5015;
x-ms-traffictypediagnostic: AM6PR05MB5015:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR05MB5015805F9BBA6D07A8143AA6A2300@AM6PR05MB5015.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(396003)(376002)(39860400002)(346002)(136003)(199004)(189003)(13464003)(6306002)(66946007)(66476007)(9686003)(486006)(52536014)(66066001)(7696005)(478600001)(76176011)(64756008)(66446008)(55016002)(256004)(86362001)(6116002)(3846002)(7736002)(74316002)(99286004)(71190400001)(71200400001)(2906002)(76116006)(73956011)(305945005)(4326008)(6436002)(68736007)(11346002)(107886003)(25786009)(54906003)(186003)(33656002)(53936002)(66556008)(229853002)(6246003)(476003)(26005)(6916009)(446003)(5660300002)(102836004)(53546011)(8936002)(8676002)(6506007)(14454004)(81166006)(81156014)(316002)(966005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5015;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SsJdIRvgM53I0jtK2M5D8zSZUKtZFaoIk2aNRfA3yObzaaLrk10M3VgkpxlSctxfKUCdgenajHVwbJ6/Q5q6RUYNWTuVMzv+UdMBbAK+Yrjl7+RjwfybMSK6Vnt97gyjtKb9XDw8UWCO53ZSWWCNZ5+GSB08g5w32k3NGsbhXxf+HMG5pwRjo0bNpSGu1cPkD4AjczO1rkG6Z40f90Du4oPha3FkgTZRvD62C1BSMMT/bkwmNGVHe5UUbIcMxGNuWhHmFUjEQ2M4JTBDPkmQNGvdCqMKyPn/zMdLgywmTHsUwU15loCxc31nHry30auRRsMEc/1Stp9BFVwZRmUAfqt6yRYqlNI0qYjZ3wDl27XWjnbNfGsht7grKpaDZjLlFROZPsstf7eLC16wkgSrSKXivmynm/eeZ+5ZFdYKiP4=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019c66ed-9c06-4c0e-0d6e-08d6d21c2cd2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 12:12:57.1243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5015
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAwNiwgMjAx
OSAzOjA3IFBNDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBtZWxsYW5veC5jb20+DQo+
IENjOiBEYXJyZW4gSGFydCA8ZHZoYXJ0QGluZnJhZGVhZC5vcmc+OyBQbGF0Zm9ybSBEcml2ZXIg
PHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZz47IG1pY2hlYWxzaEBtZWxs
YW5veC5jb20NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MSBwbGF0Zm9ybS1uZXh0IDAvMl0gcGxh
dGZvcm0veDg2OiBNZWxsYW5veDogYWRkIG5ldw0KPiBmZWF0dXJlcw0KPiANCj4gT24gTW9uLCBN
YXkgNiwgMjAxOSBhdCAxOjEyIFBNIFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94LmNv
bT4NCj4gd3JvdGU6DQo+IA0KPiA+ID4gPiA+IEkgaGF2ZSBhZGRlZCBvbmUgcGF0Y2ggb24gdG9w
LCBwbGVhc2UsIGNoZWNrIGlmIGl0J3Mgb2theSB3aXRoIHlvdS4NCj4gDQo+ID4gPiBodHRwOi8v
Z2l0LmluZnJhZGVhZC5vcmcvbGludXgtcGxhdGZvcm0tZHJpdmVycy0NCj4gPiA+IHg4Ni5naXQv
Y29tbWl0Lzc3MWZiNjQzZjY2ODUyNzk4NWFkZGFkMmU0MGI0ZGMxN2JhYzkxNzANCj4gDQo+ID4g
SSBhbSBub3Qgc3VyZSBhYm91dCB0aGlzOg0KPiA+ICAgICAgICAgZm9yIChpID0gTUxYUExBVF9D
UExEX1dEX01BWF9ERVZTIC0gMTsgaSA+PSAwIDsgaS0tKSB7DQo+ID4gLSAgICAgICAgICAgICAg
IGlmIChtbHhwbGF0X3dkX2RhdGFbaV0pDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcGxh
dGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIocHJpdi0+cGRldl93ZFtpXSk7DQo+ID4gLSAgICAgICB9
DQo+ID4gKyAgICAgICAgICAgICAgIHBsYXRmb3JtX2RldmljZV91bnJlZ2lzdGVyKHByaXYtPnBk
ZXZfd2RbaV0pOw0KPiA+DQo+ID4gRm9yIHNvbWUgc3lzdGVtcyB3ZSBoYXZlIG9ubHkgb25lIHdh
dGNoZG9nIGluc3RhbmNlOg0KPiA+IG1seHBsYXRfd2RfZGF0YVswXSA9ICZtbHhwbGF0X21seGNw
bGRfd2Rfc2V0X3R5cGUxWzBdOyB3aGlsZSBmb3INCj4gPiBvdGhlcnMgdHdvIGluc3RhbmNlcw0K
PiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUobWx4cGxhdF9tbHhjcGxkX3dk
X3NldF90eXBlMik7IGkrKykNCj4gPiAgICAgICAgICAgICAgICAgbWx4cGxhdF93ZF9kYXRhW2ld
ID0gJm1seHBsYXRfbWx4Y3BsZF93ZF9zZXRfdHlwZTJbaV07DQo+ID4NCj4gPiBTbywgaW4gdGhl
IGZpcnN0IGNhc2Ugd2Ugd2lsbCBoYXZlIE5VTEwgZm9yDQo+ID4gcGxhdGZvcm1fZGV2aWNlX3Vu
cmVnaXN0ZXIocHJpdi0+cGRldl93ZFsxXSk7DQo+IA0KPiBUaGUgZm9sbG93aW5nIGNvbW1pdCBh
ZGRzIGFuIElTX0VSUigpIGNoZWNrIG9uIHRvcCBmb3IgbG9uZyBleGlzdGluZyBOVUxMDQo+IGNo
ZWNrLg0KPiBUaGUgbGF0dGVyIGlzIHdoYXQgeW91IGFyZSB0cnlpbmcgdG8gZG8gYW5kIGVmZmVj
dGl2ZWx5IG1lYW5zIGRvdWJsZSBjaGVjayBmb3INCj4gTlVMTC4NCj4gDQo+IGNvbW1pdCA5OWZl
ZjU4N2ZmOTg4OTQ0MjZkOWJmMWY1YjczMzYzNDUwNTJkNGIzDQo+IEF1dGhvcjogQW5keSBTaGV2
Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IERhdGU6ICAgTW9u
IERlYyAzIDIwOjIxOjQxIDIwMTggKzAyMDANCj4gDQo+ICAgIGRyaXZlciBjb3JlOiBwbGF0Zm9y
bTogUmVzcGVjdCByZXR1cm4gY29kZSBvZiBwbGF0Zm9ybV9kZXZpY2VfcmVnaXN0ZXJfZnVsbCgp
DQoNCk8sIHllcywgSSBzZWUuDQpTbyBhbGwgaXMgT0suDQoNCg0KPiANCj4gLS0NCj4gV2l0aCBC
ZXN0IFJlZ2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0K
