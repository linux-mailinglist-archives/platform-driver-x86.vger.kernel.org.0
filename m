Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C61BA14834
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 12:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725856AbfEFKNj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 06:13:39 -0400
Received: from mail-eopbgr130080.outbound.protection.outlook.com ([40.107.13.80]:25375
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725851AbfEFKNj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 06:13:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X9NO9BvY0oTaBBm+NxR7D36DE4ejorW3yvCDi8fepAE=;
 b=cRjEksy+lZCPmYd6ME2G8H17wt+iRs+Cr2JbK3MlcWenoRbDFldbnYvn8r/zzc7Ks1sobEMkmarYU17VdIpG7uomRkjnPJ72iQc6g3/aXJOFr9lfdpUAv5tNRN3XY1FI3HEXpiDLCk21zbyZTvitSmzZWHPEN8IqR1OVn2MrJDQ=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5491.eurprd05.prod.outlook.com (20.177.119.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 10:12:51 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::61f4:6de4:5401:5f56%2]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 10:12:51 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "michealsh@mellanox.com" <michealsh@mellanox.com>
Subject: RE: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new
 features
Thread-Topic: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new
 features
Thread-Index: AQHU3XmMCNo9QfDiZku9Fe0it2UAMqZeIyMAgAADT2CAAAMPgIAAAd7g
Date:   Mon, 6 May 2019 10:12:51 +0000
Message-ID: <AM6PR05MB5224A49FD6ED666D0033BB28A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20190318105823.2821-1-vadimp@mellanox.com>
 <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
 <AM6PR05MB522498F37724F8F82564BCF4A2300@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <CAHp75Veq4Xq_faPKMkdEmOmY5JHMms=4KX51GdM20DFPH_BzTg@mail.gmail.com>
In-Reply-To: <CAHp75Veq4Xq_faPKMkdEmOmY5JHMms=4KX51GdM20DFPH_BzTg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f005d12-c969-45e6-c4eb-08d6d20b65be
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB5491;
x-ms-traffictypediagnostic: AM6PR05MB5491:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <AM6PR05MB54911D55D2A81F854EFBD6E0A2300@AM6PR05MB5491.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(39860400002)(136003)(346002)(396003)(13464003)(189003)(199004)(25786009)(66066001)(55016002)(33656002)(74316002)(99286004)(53936002)(4326008)(86362001)(73956011)(76176011)(76116006)(66446008)(64756008)(66946007)(66476007)(66556008)(6916009)(71190400001)(71200400001)(7696005)(68736007)(3846002)(8936002)(52536014)(316002)(229853002)(6116002)(14454004)(9686003)(478600001)(305945005)(186003)(54906003)(966005)(26005)(8676002)(7736002)(486006)(476003)(446003)(2906002)(107886003)(11346002)(5660300002)(6506007)(53546011)(6246003)(102836004)(6436002)(6306002)(256004)(81156014)(81166006)(14444005);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5491;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: br4dkVpBUv6Ywbm1sP2QinA+d5IqF62mU8+eJNSLabA0/1Yj2eQrY96qQhpta0wKciRsE/ArS1Lzn/IpYAfHI+hU7ECw9iA0xqpseCkHzCNjkXkx+4PkE8vWtEBa2CXHbZFCrqIO7SZhLpzX9/FvJDdIL951Ep/fXCR4AFt0OCUYSZkk5NtG3K7Px8wH1xwizsIimS4AQp2i9uZ/kYRLOTJRpy75cnFKP4u+3dflufd2ZHNSr9WT/MEgAxr3MbkTSrX/nZcF6sDeWUyjvK8kgqFR5x5b0+kSUZ5D6Z9mbIXW4Uu6dH8kupBaSYRbSwuflq/5fvXWwaUNVq2DXPXQ7Sqy2vBiwY7B/cWAU5WQAMfhBq0sotH8E31lYMQKiGwnEsjFFw/5eeD5A3MctMDkpgiKBn1G80P7FYAG9+9gyFY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f005d12-c969-45e6-c4eb-08d6d20b65be
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 10:12:51.1947
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5491
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBNb25kYXksIE1heSAwNiwgMjAx
OSAxMjo1OCBQTQ0KPiBUbzogVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3guY29tPg0K
PiBDYzogRGFycmVuIEhhcnQgPGR2aGFydEBpbmZyYWRlYWQub3JnPjsgUGxhdGZvcm0gRHJpdmVy
IDxwbGF0Zm9ybS1kcml2ZXItDQo+IHg4NkB2Z2VyLmtlcm5lbC5vcmc+OyBtaWNoZWFsc2hAbWVs
bGFub3guY29tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgcGxhdGZvcm0tbmV4dCAwLzJdIHBs
YXRmb3JtL3g4NjogTWVsbGFub3g6IGFkZCBuZXcNCj4gZmVhdHVyZXMNCj4gDQo+IE9uIE1vbiwg
TWF5IDYsIDIwMTkgYXQgMTI6NTAgUE0gVmFkaW0gUGFzdGVybmFrIDx2YWRpbXBAbWVsbGFub3gu
Y29tPg0KPiB3cm90ZToNCj4gPg0KPiA+DQo+ID4NCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+ID4gPiBGcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFp
bC5jb20+DQo+ID4gPiBTZW50OiBNb25kYXksIE1heSAwNiwgMjAxOSAxMjozNiBQTQ0KPiA+ID4g
VG86IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG1lbGxhbm94LmNvbT4NCj4gPiA+IENjOiBEYXJy
ZW4gSGFydCA8ZHZoYXJ0QGluZnJhZGVhZC5vcmc+OyBQbGF0Zm9ybSBEcml2ZXINCj4gPiA+IDxw
bGF0Zm9ybS1kcml2ZXItIHg4NkB2Z2VyLmtlcm5lbC5vcmc+OyBtaWNoZWFsc2hAbWVsbGFub3gu
Y29tDQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxIHBsYXRmb3JtLW5leHQgMC8yXSBwbGF0
Zm9ybS94ODY6IE1lbGxhbm94Og0KPiA+ID4gYWRkIG5ldyBmZWF0dXJlcw0KPiA+ID4NCj4gPiA+
IE9uIE1vbiwgTWFyIDE4LCAyMDE5IGF0IDEyOjU4IFBNIFZhZGltIFBhc3Rlcm5haw0KPiA+ID4g
PHZhZGltcEBtZWxsYW5veC5jb20+DQo+ID4gPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4gVGhp
cyBwYXRjaHNldDoNCj4gPiA+ID4gLSBBZGRzIHN1cHBvcnQgZm9yIHRhY2hvbWV0ZXIgc3BlZWQg
Y2FwYWJpbGl0eSByZWdpc3Rlci4NCj4gPiA+ID4gLSBBZGRzIHN1cHBvcnQgZm9yIE1lbGxhbm94
IHdhdGNoZG9nIGRyaXZlciBhY3RpdmF0aW9uLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IFB1c2hl
ZCB0byBteSByZXZpZXcgYW5kIHRlc3RpbmcgcXVldWUsIHRoYW5rcyENCj4gPiA+DQo+ID4gPiBJ
IGhhdmUgYWRkZWQgb25lIHBhdGNoIG9uIHRvcCwgcGxlYXNlLCBjaGVjayBpZiBpdCdzIG9rYXkg
d2l0aCB5b3UuDQo+ID4NCj4gPiBIaSBBbmR5LA0KPiA+DQo+ID4gVGhhbmtzLg0KPiA+DQo+ID4g
WW91IG1lYW4gb24gdG9wIG9mIHBhdGNoDQo+ID4gInBsYXRmb3JtL21lbGxhbm94OiBBZGQgVG1G
aWZvIGRyaXZlciBmb3IgTWVsbGFub3ggQmx1ZUZpZWxkIFNvYyIgPw0KPiA+DQo+IA0KPiBJIG1l
YW50IHRoYXQgSSB3b3VsZCBsaWtlIHRvIGFtZW5kIHlvdXIgcGF0Y2gsIHNlZSB0aGlzIGZpeHVw
Og0KPiBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvbGludXgtcGxhdGZvcm0tZHJpdmVycy0NCj4g
eDg2LmdpdC9jb21taXQvNzcxZmI2NDNmNjY4NTI3OTg1YWRkYWQyZTQwYjRkYzE3YmFjOTE3MA0K
PiANCg0KQW5keSwNCg0KSSBhbSBub3Qgc3VyZSBhYm91dCB0aGlzOg0KICAgICAgICBmb3IgKGkg
PSBNTFhQTEFUX0NQTERfV0RfTUFYX0RFVlMgLSAxOyBpID49IDAgOyBpLS0pIHsNCi0gICAgICAg
ICAgICAgICBpZiAobWx4cGxhdF93ZF9kYXRhW2ldKQ0KLSAgICAgICAgICAgICAgICAgICAgICAg
cGxhdGZvcm1fZGV2aWNlX3VucmVnaXN0ZXIocHJpdi0+cGRldl93ZFtpXSk7DQotICAgICAgIH0N
CisgICAgICAgICAgICAgICBwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcihwcml2LT5wZGV2X3dk
W2ldKTsNCg0KRm9yIHNvbWUgc3lzdGVtcyB3ZSBoYXZlIG9ubHkgb25lIHdhdGNoZG9nIGluc3Rh
bmNlOg0KbWx4cGxhdF93ZF9kYXRhWzBdID0gJm1seHBsYXRfbWx4Y3BsZF93ZF9zZXRfdHlwZTFb
MF07DQp3aGlsZSBmb3Igb3RoZXJzIHR3byBpbnN0YW5jZXMNCglmb3IgKGkgPSAwOyBpIDwgQVJS
QVlfU0laRShtbHhwbGF0X21seGNwbGRfd2Rfc2V0X3R5cGUyKTsgaSsrKQ0KCQltbHhwbGF0X3dk
X2RhdGFbaV0gPSAmbWx4cGxhdF9tbHhjcGxkX3dkX3NldF90eXBlMltpXTsNCg0KU28sIGluIHRo
ZSBmaXJzdCBjYXNlIHdlIHdpbGwgaGF2ZSBOVUxMIGZvcg0KcGxhdGZvcm1fZGV2aWNlX3VucmVn
aXN0ZXIocHJpdi0+cGRldl93ZFsxXSk7DQoNCj4gPiBJZiB5ZXMsIGl0J3MgT0sgd2l0aCBtZS4N
Cj4gPg0KPiA+IFRoYW5rcywNCj4gPiBWYWRpbQ0KPiA+DQo+ID4gPg0KPiA+ID4gPiBWYWRpbSBQ
YXN0ZXJuYWsgKDIpOg0KPiA+ID4gPiAgIHBsYXRmb3JtL3g4NjogbWx4LXBsYXRmb3JtOiBBZGQg
c3VwcG9ydCBmb3IgdGFjaG9tZXRlciBzcGVlZCByZWdpc3Rlcg0KPiA+ID4gPiAgIHBsYXRmb3Jt
L3g4NjogbWx4LXBsYXRmb3JtOiBBZGQgbWx4LXdkdCBwbGF0Zm9ybSBkcml2ZXINCj4gPiA+ID4g
YWN0aXZhdGlvbg0KPiA+ID4gPg0KPiA+ID4gPiAgZHJpdmVycy9wbGF0Zm9ybS94ODYvbWx4LXBs
YXRmb3JtLmMgfCAyMzINCj4gPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
LQ0KPiA+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDIzMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KPiA+ID4gPg0KPiA+ID4gPiAtLQ0KPiA+ID4gPiAyLjExLjANCj4gPiA+ID4NCj4gPiA+
DQo+ID4gPg0KPiA+ID4gLS0NCj4gPiA+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiA+ID4gQW5keSBT
aGV2Y2hlbmtvDQo+IA0KPiANCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5
IFNoZXZjaGVua28NCg==
