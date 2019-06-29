Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F08DD5AC2E
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Jun 2019 17:37:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfF2Phv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Jun 2019 11:37:51 -0400
Received: from mail-eopbgr130044.outbound.protection.outlook.com ([40.107.13.44]:30819
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726819AbfF2Phv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Jun 2019 11:37:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vtwi/VRoQliHcdhMlD3b2M5FS3NX+kcPq4LtJjaoiR4=;
 b=ffRQ+fnlTi9rp4yBiETeWUew5tt0Oj4NEQRwRukzJW2M3Mubga8F53UI/YcZdz8Ztz6RwVvFRFtvh/jI/cbSx0nX8VFRfHTIlzfOsmiq231nM7razr1ZOD9OBkp9Ju3wWWckCJ539vl/aQjdbLTkRGhCZVAp15dvSCZtAJui9+A=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB4358.eurprd05.prod.outlook.com (52.135.162.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Sat, 29 Jun 2019 15:37:46 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::9c01:fb00:b03c:e594]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::9c01:fb00:b03c:e594%4]) with mapi id 15.20.2032.016; Sat, 29 Jun 2019
 15:37:46 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v1 platform-next 7/7] Documentation/ABI: Fix duplicated
 attribute for mlxreg-io sysfs interfaces
Thread-Topic: [PATCH v1 platform-next 7/7] Documentation/ABI: Fix duplicated
 attribute for mlxreg-io sysfs interfaces
Thread-Index: AQHVKb2MfmVeAkXoxEiWfvPMjpuPSKayt94AgAATetA=
Date:   Sat, 29 Jun 2019 15:37:46 +0000
Message-ID: <AM6PR05MB5224710500839EFCA22D9908A2FF0@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <20190623121630.17945-1-vadimp@mellanox.com>
 <20190623121630.17945-8-vadimp@mellanox.com>
 <CAHp75VfM59NHvKZyqKRzMwmKtM4EU4Ppv-A+UPBWybHH5OpVdg@mail.gmail.com>
In-Reply-To: <CAHp75VfM59NHvKZyqKRzMwmKtM4EU4Ppv-A+UPBWybHH5OpVdg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [84.108.218.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a990d2aa-46dc-4e52-4185-08d6fca7bc04
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:AM6PR05MB4358;
x-ms-traffictypediagnostic: AM6PR05MB4358:
x-microsoft-antispam-prvs: <AM6PR05MB435848880C7D42FC10892AF4A2FF0@AM6PR05MB4358.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0083A7F08A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(376002)(396003)(366004)(39840400004)(136003)(13464003)(199004)(189003)(476003)(14444005)(11346002)(446003)(74316002)(478600001)(256004)(66066001)(86362001)(2906002)(64756008)(66476007)(66946007)(73956011)(76116006)(52536014)(305945005)(33656002)(486006)(7736002)(66556008)(68736007)(66446008)(8676002)(6116002)(76176011)(6916009)(5660300002)(9686003)(3846002)(55016002)(102836004)(99286004)(53936002)(6246003)(53546011)(71200400001)(6506007)(25786009)(4326008)(26005)(71190400001)(6436002)(14454004)(316002)(7696005)(54906003)(229853002)(8936002)(81166006)(186003)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB4358;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: e4+waouwPSDulsk+KlhksREuDtUGRO5cSuyRhEV3Qd7wjycNCBQCgH5DiWnbum0pzBiQvgGx/2jvV6i2KliHOAL5J7bRKU4YMdgQ86q+qmBUJUoL6zXVohgV2dwcruzrebX6SpxBSbDgzuUbrMG3fyubQ7m0EokA1x2J1U1RUl5bxv/eGXn2vIhuQZ2f4sc0GWNxYZgadMdFDjf6Ctkae+scoKI7t3Wg3LGCEL6O0FVMkddfcdXFe7FiaFb4KfsZ2F62KWj1dIB8sJlSWQSykN0Fyg+dIaSYVt/TFv1g9aqKcjsLk/EBZ+QPg6sEGXeyMz44VGryNIqwNOPSVboGsoaNTS6QIO2h5LvsG5NPdIUMUxgV1YFSTiWhRbk1FZnqFIg/Sn7Ka6O6UPKiPnSEWNiY/wtXJI4qrjo/NDNLW50=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a990d2aa-46dc-4e52-4185-08d6fca7bc04
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2019 15:37:46.1998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vadimp@mellanox.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB4358
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5keSBTaGV2Y2hlbmtv
IDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPg0KPiBTZW50OiBTYXR1cmRheSwgSnVuZSAyOSwg
MjAxOSA1OjIwIFBNDQo+IFRvOiBWYWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBtZWxsYW5veC5jb20+
DQo+IENjOiBEYXJyZW4gSGFydCA8ZHZoYXJ0QGluZnJhZGVhZC5vcmc+OyBQbGF0Zm9ybSBEcml2
ZXIgPHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIua2VybmVsLm9yZz4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCB2MSBwbGF0Zm9ybS1uZXh0IDcvN10gRG9jdW1lbnRhdGlvbi9BQkk6IEZpeCBk
dXBsaWNhdGVkDQo+IGF0dHJpYnV0ZSBmb3IgbWx4cmVnLWlvIHN5c2ZzIGludGVyZmFjZXMNCj4g
DQo+IE9uIFN1biwgSnVuIDIzLCAyMDE5IGF0IDM6MTYgUE0gVmFkaW0gUGFzdGVybmFrIDx2YWRp
bXBAbWVsbGFub3guY29tPg0KPiB3cm90ZToNCj4gPg0KPiA+IFJlbW92ZSBkdXBsaWNhdGVkIGF0
dHJpYnV0ZSDigJhqdGFnX2Vu4oCZLCBhZGQgaW5zdGVhZCBtaXNzZWQgYXR0cmlidXRlDQo+ID4g
4oCYY3BsZDNfdmVyc2lvbuKAmS4NCj4gPg0KPiANCj4gVGhpcyBvbmUgZG9lc24ndCBhcHBseS4N
Cg0KSGkgQW5keSwNCg0KSSBzdXBwb3NlIHRoaXMgaXMgYmVjYXVzZQ0KW1BBVENIXSBBQkk6IHN5
c2ZzLWRyaXZlci1tbHhyZWctaW86IGZpeCB0aGUgd2hhdCBmaWVsZHMNCndhcyBub3QgYXBwbGll
ZCB0byBmb3ItbmV4dC4NCg0KQ291bGQgaXQgYmUgYXBwbGllZCBiZWZvcmUNCltQQVRDSCB2MSBw
bGF0Zm9ybS1uZXh0IDcvN10gRG9jdW1lbnRhdGlvbi9BQkk6IEZpeCBkdXBsaWNhdGVkIGF0dHJp
YnV0ZSBmb3IgbWx4cmVnLWlvIHN5c2ZzIGludGVyZmFjZXMNCg0KT3IgNy83IGp1c3QgY291bGQg
YmUgcmVtb3ZlZCBmcm9tIHRoZSBwYXRjaHNldCwgYW5kIEknbGwgcmUtc3VibWl0IGl0DQphZnRl
ciAnIEFCSTogc3lzZnMtZHJpdmVyLW1seHJlZy1pbzogZml4IHRoZSB3aGF0IGZpZWxkcycgd2ls
bCBiZSBpbj8NCg0KVGhhbmtzLA0KVmFkaW0uDQoNCj4gDQo+ID4gRml4ZXM6IDUyNjc1ZGExZDA4
N2YgKCJEb2N1bWVudGF0aW9uL0FCSTogQWRkIG5ldyBhdHRyaWJ1dGUgZm9yDQo+ID4gbWx4cmVn
LWlvIHN5c2ZzIGludGVyZmFjZXMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IFZhZGltIFBhc3Rlcm5h
ayA8dmFkaW1wQG1lbGxhbm94LmNvbT4NCj4gPiAtLS0NCj4gPiAgRG9jdW1lbnRhdGlvbi9BQkkv
c3RhYmxlL3N5c2ZzLWRyaXZlci1tbHhyZWctaW8gfCAyICstDQo+ID4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL0Rv
Y3VtZW50YXRpb24vQUJJL3N0YWJsZS9zeXNmcy1kcml2ZXItbWx4cmVnLWlvDQo+ID4gYi9Eb2N1
bWVudGF0aW9uL0FCSS9zdGFibGUvc3lzZnMtZHJpdmVyLW1seHJlZy1pbw0KPiA+IGluZGV4IDhj
YTQ5ODQ0N2FlYi4uNTQyMDI5NzVhYzNiIDEwMDY0NA0KPiA+IC0tLSBhL0RvY3VtZW50YXRpb24v
QUJJL3N0YWJsZS9zeXNmcy1kcml2ZXItbWx4cmVnLWlvDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlv
bi9BQkkvc3RhYmxlL3N5c2ZzLWRyaXZlci1tbHhyZWctaW8NCj4gPiBAQCAtMjksNyArMjksNyBA
QCBEZXNjcmlwdGlvbjogIFRoaXMgZmlsZSBzaG93cyB0aGUgc3lzdGVtIGZhbnMgZGlyZWN0aW9u
Og0KPiA+DQo+ID4gICAgICAgICAgICAgICAgIFRoZSBmaWxlcyBhcmUgcmVhZCBvbmx5Lg0KPiA+
DQo+ID4gLVdoYXQ6ICAgICAgICAgIC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS9tbHhwbGF0L21seHJl
Zy0NCj4gaW8vaHdtb24vaHdtb24qL2p0YWdfZW5hYmxlDQo+ID4gK1doYXQ6ICAgICAgICAgIC9z
eXMvZGV2aWNlcy9wbGF0Zm9ybS9tbHhwbGF0L21seHJlZy0NCj4gaW8vaHdtb24vaHdtb24qL2Nw
bGQzX3ZlcnNpb24NCj4gPg0KPiA+ICBEYXRlOiAgICAgICAgICBOb3ZlbWJlciAyMDE4DQo+ID4g
IEtlcm5lbFZlcnNpb246IDUuMA0KPiA+IC0tDQo+ID4gMi4xMS4wDQo+ID4NCj4gDQo+IA0KPiAt
LQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo=
