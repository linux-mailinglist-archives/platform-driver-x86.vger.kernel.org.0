Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2FDC7147CB
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 11:50:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726128AbfEFJu1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 05:50:27 -0400
Received: from mail-eopbgr10086.outbound.protection.outlook.com ([40.107.1.86]:47046
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726016AbfEFJu0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 05:50:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwceg82ELE9sYicmgpZBsfLbwJoYdumG1fxmYsSKcC8=;
 b=fS2AEWnRe42HJBXy+z4LYV/EGE6Ff/UmRtYIX1HREdjnUtyp/211T9Z9QTzYaaKCRIC+bC3P/1gsstoogC3PGO1/PJwmlyDw9DX/b8xshV/2UjVlNmQ0ea2PoWPQPQe3PLVu+/XgEg0+FRlD9xLrDXVO4LmHY8jWuTUW0tk18CE=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5752.eurprd05.prod.outlook.com (20.178.93.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 09:50:24 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56%2]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 09:50:24 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "michealsh@mellanox.com" <michealsh@mellanox.com>
Subject: RE: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new
 features
Thread-Topic: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new
 features
Thread-Index: AQHU3XmMCNo9QfDiZku9Fe0it2UAMqZeIyMAgAADT2A=
Date:   Mon, 6 May 2019 09:50:24 +0000
Message-ID: <AM6PR05MB522498F37724F8F82564BCF4A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20190318105823.2821-1-vadimp@mellanox.com>
 <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
In-Reply-To: <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a0462429-57de-4de3-11cb-08d6d20842c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB5752;
x-ms-traffictypediagnostic: AM6PR05MB5752:
x-microsoft-antispam-prvs: <AM6PR05MB57525F91AD423DEFCD3CEB54A2300@AM6PR05MB5752.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(346002)(376002)(396003)(136003)(39860400002)(366004)(189003)(199004)(13464003)(8676002)(486006)(7736002)(54906003)(26005)(305945005)(478600001)(9686003)(186003)(53936002)(6436002)(53546011)(6506007)(5660300002)(102836004)(6246003)(81156014)(256004)(14444005)(81166006)(2906002)(476003)(446003)(107886003)(11346002)(76176011)(86362001)(66556008)(66476007)(66946007)(64756008)(66446008)(76116006)(73956011)(33656002)(55016002)(74316002)(25786009)(66066001)(4326008)(99286004)(52536014)(68736007)(8936002)(14454004)(3846002)(229853002)(316002)(6116002)(6916009)(7696005)(71200400001)(71190400001);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5752;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Tnne6VCCbZsfo7G+awHOTFgPVwTPbBjnGuhzBZPQQYK0m8MU7IOrqhGUKqbSXDD9xzyr0uGj7h7zXyIw52Hvjx25HZWa89fZ9a+Gf+kjZRtiSQngeI9V1STfawnlTkxg08f2ffeDSJzB3Lwts9VtEzQxyXxUYc8XLPyOno3CpEA9TQyJ0N5t0Yq3fh+HkY2qT0M7sbEhaGNFsMLXYfqJgtbq01mjsrLtoS+J/Ff5z4BgOOfsWSlJ1dST+6qxxS/cqxFIgydfEPynVfcP8yHVgefk0m1TZXhGdreIlG63mLr0rfQ2+FAOlJlarsZjhJPgheDPb6SzAoE/veqlpS1UtIFDPUAZrXbbnGyn0ze6Z8XbLfRwaG3Nyc3mgy5CzSNBbSEVaC2UYWfR/5t4pTfYQnw+ExeLTT4IftgNo6kS4Pc=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0462429-57de-4de3-11cb-08d6d20842c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 09:50:24.1008
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5752
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAwNiwgMjAx
OSAxMjozNiBQTQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPg0K
PiBDYzogRGFycmVuIEhhcnQgPGR2aGFydEBpbmZyYWRlYWQub3JnPjsgUGxhdGZvcm0gRHJpdmVy
IDxwbGF0Zm9ybS1kcml2ZXItDQo+IHg4NkB2Z2VyLmtlcm5lbC5vcmc+OyBtaWNoZWFsc2hAbWVs
bGFub3guY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgcGxhdGZvcm0tbmV4dCAwLzJdIHBs
YXRmb3JtL3g4NjogTWVsbGFub3g6IGFkZCBuZXcNCj4gZmVhdHVyZXMNCj4gDQo+IE9uIE1vbiwg
TWFyIDE4LCAyMDE5IGF0IDEyOjU4IFBNIFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94
LmNvbT4NCj4gd3JvdGU6DQo+ID4NCj4gPiBUaGlzIHBhdGNoc2V0Og0KPiA+IC0gQWRkcyBzdXBw
b3J0IGZvciB0YWNob21ldGVyIHNwZWVkIGNhcGFiaWxpdHkgcmVnaXN0ZXIuDQo+ID4gLSBBZGRz
IHN1cHBvcnQgZm9yIE1lbGxhbm94IHdhdGNoZG9nIGRyaXZlciBhY3RpdmF0aW9uLg0KPiA+DQo+
IA0KPiBQdXNoZWQgdG8gbXkgcmV2aWV3IGFuZCB0ZXN0aW5nIHF1ZXVlLCB0aGFua3MhDQo+IA0K
PiBJIGhhdmUgYWRkZWQgb25lIHBhdGNoIG9uIHRvcCwgcGxlYXNlLCBjaGVjayBpZiBpdCdzIG9r
YXkgd2l0aCB5b3UuDQoNCkhpIEFuZHksDQoNClRoYW5rcy4NCg0KWW91IG1lYW4gb24gdG9wIG9m
IHBhdGNoDQoicGxhdGZvcm0vbWVsbGFub3g6IEFkZCBUbUZpZm8gZHJpdmVyIGZvciBNZWxsYW5v
eCBCbHVlRmllbGQgU29jIiA/DQoNCklmIHllcywgaXQncyBPSyB3aXRoIG1lLg0KDQpUaGFua3Ms
DQpWYWRpbQ0KDQo+IA0KPiA+IFZhZGltIFBhc3Rlcm5hayAoMik6DQo+ID4gICBwbGF0Zm9ybS94
ODY6IG1seC1wbGF0Zm9ybTogQWRkIHN1cHBvcnQgZm9yIHRhY2hvbWV0ZXIgc3BlZWQgcmVnaXN0
ZXINCj4gPiAgIHBsYXRmb3JtL3g4NjogbWx4LXBsYXRmb3JtOiBBZGQgbWx4LXdkdCBwbGF0Zm9y
bSBkcml2ZXIgYWN0aXZhdGlvbg0KPiA+DQo+ID4gIGRyaXZlcnMvcGxhdGZvcm0veDg2L21seC1w
bGF0Zm9ybS5jIHwgMjMyDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMjMwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+
ID4NCj4gPiAtLQ0KPiA+IDIuMTEuMA0KPiA+DQo+IA0KPiANCj4gLS0NCj4gV2l0aCBCZXN0IFJl
Z2FyZHMsDQo+IEFuZHkgU2hldmNoZW5rbw0K
