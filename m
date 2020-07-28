Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13D4C23005E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Jul 2020 05:51:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgG1Dv0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 23:51:26 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.4]:21753 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726797AbgG1DvZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 23:51:25 -0400
Received: from [100.112.1.169] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-4.bemta.az-b.us-east-1.aws.symcld.net id CC/88-37342-AB0AF1F5; Tue, 28 Jul 2020 03:51:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRWlGSWpSXmKPExsWS8eIhl+6uBfL
  xBi8eiVi8nHCY0WL2YRuLOc/WMlqs3vOC2YHFY+esu+wevw8weuxe8JnJ4/MmuQCWKNbMvKT8
  igTWjE1XNjIXzFeuONY1maWB8YlSFyMXh5BAA5PEzNNvGSGcV4wSM59NZuti5ITI/PxiApH4z
  Shxeto/NhCHUWAps0T7uY2sEM4xFonD+yaxQzgbGCW6f30GG8YisJtZ4nnnMnaIAfOZJCb19U
  M59xklHvR3MYKsYRNQl3h18CrYShGBKIkTn3+AtTMLTGSSWDtxJjtIQlggRGLum/XMEEWhEs9
  u/4FqsJI41XgDbBCLgKrEnuWfgOIcHLwCMRInzmlCLJvFKHF2+wawGk6BQInGPafB5jAKiEl8
  P7WGCcRmFhCXuPVkPpgtISAgsWTPeWYIW1Ti5eN/UJ92MUrsf7mbBSKhJLF5ezM7hC0rcWl+N
  yOE7StxZPECKFtH4v+kPjYI20bi6PMFLCDHSQioSPw7VAlh5kuc/xA9gdF4FpIrZgFlmAU0Jd
  bv0ocIK0pM6X7IDmLzCghKnJz5hGUBI8sqRtOkosz0jJLcxMwcXUMDA11DQyNdY11TE73EKt0
  kvdJi3dTE4hJdQ73E8mK94src5JwUvbzUkk2MwKSUUsBstoPx5+sPeocYJTmYlER5d0yXjxfi
  S8pPqcxILM6ILyrNSS0+xCjDwaEkwbt/LlBOsCg1PbUiLTMHmCBh0hIcPEoivO9A0rzFBYm5x
  ZnpEKlTjMYcE17OXcTMcWTu0kXMQix5+XmpUuK8bvOASgVASjNK8+AGwRL3JUZZKWFeRgYGBi
  GegtSi3MwSVPlXjOIcjErCvMXzgabwZOaVwO0DplugL0R4G4/LgpxSkoiQkmpgWnFnR+XCg2u
  iXSQWHrJSkA7Z9bRI2Y6h9545H7PWlWdTvBs8HOK5zPizFqV/TY/06tqedfWqsdTvFjWp+kip
  FO4be9aU/f/j+War8s7+w15/TpXkTnaP/7H0Ss9RnefF8tVGPp490jefPynwDr3EnhN3dnnFH
  EVekTwXqX8332usWCzwPnERi5Zjg8TUO0frFKY+K1h3PMdnSfPd9PWJVYdP6vr87/3dwR75d6
  rX3r/mkjWSs2U0zmgs0n7KccG+tveGyMWES18n/Wrt03wR+3CT36SHVxj5DnCxv5+2ZpXI1jL
  DwFePZ5S/PL3nXajVh4Q7d4T+L3r2IUJtTqXumfPbWXZy5ufsS1Dsi3t7VomlOCPRUIu5qDgR
  AA3A8zNXBAAA
X-Env-Sender: njoshi1@lenovo.com
X-Msg-Ref: server-29.tower-386.messagelabs.com!1595908282!160435!1
X-Originating-IP: [104.232.225.10]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5940 invoked from network); 28 Jul 2020 03:51:22 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.10)
  by server-29.tower-386.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Jul 2020 03:51:22 -0000
Received: from HKGWPEMAIL03.lenovo.com (unknown [10.128.3.71])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 37165A252BD9C4E7D101;
        Mon, 27 Jul 2020 23:51:21 -0400 (EDT)
Received: from HKGWPEMAIL03.lenovo.com (10.128.3.71) by
 HKGWPEMAIL03.lenovo.com (10.128.3.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Tue, 28 Jul 2020 11:52:09 +0800
Received: from HKEXEDGE02.lenovo.com (10.128.62.72) by HKGWPEMAIL03.lenovo.com
 (10.128.3.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5 via Frontend
 Transport; Tue, 28 Jul 2020 11:52:09 +0800
Received: from APC01-PU1-obe.outbound.protection.outlook.com (104.47.126.55)
 by mail.lenovo.com (10.128.62.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Tue, 28 Jul
 2020 11:52:08 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IswB3Z3EYsuoWrfKj6vMj4pm5jkw7QgvG2lrmW1x9FMMgH3R8jhI5d6DoNWS50aAAwY4VGK6OWQr3gQEx1b3O/ciMdv2C3bMtX+bhvFi2zNomdNl4B6LKYglvtbqsRquKPkH1VDbk/sCl+Xsx9mBGUwB/oIOoAOnjwsQ9k4Yb4mf5JjuxgOoZm6oNVsFtM3mYqd9+s5ywz9ZIEGfhynymhdzfHWIlIVkjZh3trMoUxNIKCM29q8emauKZy89/T0IVPc47jS3y+O74ebexdKUqiLMru3b715P3MIN8fmOXjvzCvcI9vbULNEz9NxwghB6iv15DVIlRZJLqcjLBXpKHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYx81NEKTGevz22Wruc7x19eCozIvKnMhUhlLgHvlto=;
 b=ENMkRKpihj65wNQkNsD1C8TW6IjT0uVGYdv5Kf7IWu32nvxBWrcUjMF8pZSGZgubcQFagw96qx5iZeIk/FUnjXdug59ngbvUnGjTXiQL8T15W8Rx469e86Xp75oHS68G0uQpTWQyIeVGqGODi8jYXAR8z7L7jAqYy25ScTSqohro6EmZtNcZc4acBDAHhAkT4ev7QN7zeRiawqDNxyg8Wwc1w7gnfjfrxM4pR5/AN/+yjkvzuhKQXmSUjFVwuUE5JAdm/HxGw0GqdZQQoqZ+yoWc2CYUpBE01qgEGrdYlIPB38SLQc23U4g4z17QvGyi4Gz9i4RbFRFJnZVEijT3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYx81NEKTGevz22Wruc7x19eCozIvKnMhUhlLgHvlto=;
 b=NEHw08tsvYKyTx3ZsU+bTIDLjlm1s3HWQ/ovN5SaWyZ9tTynBqn7Nu016ymwgk1yZfG3BWDZbqUiHocv2DQulYBZ9UmR++2FZe1mAoyaTJ4OuBtlEKQSHKCpjEv1vX+Cbkg+sxbOtE2LNlEQWjffk9n0jNjrqbKPYJKoKapQX90=
Received: from PU1PR03MB2716.apcprd03.prod.outlook.com (2603:1096:803:20::17)
 by PS1PR0302MB2443.apcprd03.prod.outlook.com (2603:1096:803:d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.9; Tue, 28 Jul
 2020 03:51:09 +0000
Received: from PU1PR03MB2716.apcprd03.prod.outlook.com
 ([fe80::d93d:a08d:f69a:c697]) by PU1PR03MB2716.apcprd03.prod.outlook.com
 ([fe80::d93d:a08d:f69a:c697%6]) with mapi id 15.20.3239.015; Tue, 28 Jul 2020
 03:51:09 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark RH Pearson <markpearson@lenovo.com>
CC:     Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        "Platform Driver" <platform-driver-x86@vger.kernel.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Tomoki Maruichi <maruichit@lenovo.com>,
        "Sugumaran Lacshiminarayanan" <slacshiminar@lenovo.com>
Subject: RE: [External]  Re: [PATCH] platform/x86: thinkpad_acpi: psensor
 interface
Thread-Topic: [External]  Re: [PATCH] platform/x86: thinkpad_acpi: psensor
 interface
Thread-Index: AQHWWwMHz3ST7j+TG06+0crDZ7YttqkbTR6AgAENKoA=
Date:   Tue, 28 Jul 2020 03:51:08 +0000
Message-ID: <PU1PR03MB2716FE7EF1BF12E5B9EC25188C730@PU1PR03MB2716.apcprd03.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200715235242.4934-1-markpearson@lenovo.com>
 <CAHp75Vcwg9aEpybYwEFvhYH4gpy7952i+zMs-2TKGPzkzuhO=g@mail.gmail.com>
In-Reply-To: <CAHp75Vcwg9aEpybYwEFvhYH4gpy7952i+zMs-2TKGPzkzuhO=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.165.32.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 98fe3eb9-21ac-4a21-3c57-08d832a9767f
x-ms-traffictypediagnostic: PS1PR0302MB2443:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <PS1PR0302MB2443BA2D0CE0E44DFE1FC3DB8C730@PS1PR0302MB2443.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iyjDwP11n+KtOSPUuXtW89QXCBMCfe38y1z68zhcFbTSFjod1Bg4FWd0NZnRMjSoDMT7YkiZ6MK46l23XdWfCJdOXvhVcYPBkKl3HYqXSOzjWCwgSEOxOwrV7MNXbkiD52KxAjtpOgxSm4mdrR0vtI2fcZ93+QHJfDHxwA/ht7elkdF556bvXAtkxJG99kEVIBIziAbS5Inqt4KoBTari1iM/qeptazPArxZV9kLdYkUqAOMCyCWMVO3ugO71verc6vTifVnmPB6kq8sap4Nt5FgEEsTRJpdzsYnZ3GiRBFVC2MSqbVIKcUUi21I7ha+tzecicNHnV5zPXmxEaNikg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU1PR03MB2716.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(8676002)(66476007)(71200400001)(33656002)(83380400001)(86362001)(8936002)(107886003)(2906002)(110136005)(7696005)(54906003)(5660300002)(186003)(66946007)(66446008)(9686003)(52536014)(64756008)(66556008)(316002)(55016002)(6506007)(76116006)(478600001)(26005)(6636002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: CbLl9BT02WDM4b+DQNpODdC0ATNdBAE8tnBVv/Hb4tgAeTJJLmup/p+2mjCEPNDa/iEkmQmQ/QIrGCPkiEZOGWnf9N6dYT3mtHWx1QpzCrJkq6rFjCwHMZrXqkguwSy6YUBM+wz4lCg90Zu5SRfc7bHEjeuBxfegonQJ6FA5MtzISrM++WiIUesw3FGBf8C4duup5BIB39GQE2Vv+A1Yi7YdIC69o2U7XZzyO7xkxnTvKu1YaMMylVGPjBNNIwqUVacT/pwPRdAOW+ojsQzmNDoJ5psKHMtyOkjE04VQv6yTcaQbMatbFZmAjetrHyhXcDIX0Mc5cQN02Xhv91Cr1JD7pti3ZEt+yQgSITDMWtK1yobFIOxrcv7AZDm3UEAy3OI5dQ9IzEkjL8KbK2bjhtwSHjqMZ7NP9R/3CKro1CEv0GljyyHD+dLez9+7unRLCkgC5u9ONaDV69d/AuqcEiAZeEl0FsJYPfnrbk+jfL63E4BE6dKnMk1Z2B6EEK3GYzWYalKQ/JRLxvfZXu4NCtwEv2TyLgS/Hje1scffYF+CNtpA22xqGKcWHL7O1+DVM8kMjcwMeY7EwNoaopRgSDhzFmvmZgWm2pCfKCbLN/+suZjpxhx+c5ywSBH3kO0NKvWoSLAWgzTFbVmFaVbnkQ==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PU1PR03MB2716.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fe3eb9-21ac-4a21-3c57-08d832a9767f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 03:51:09.0597
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KHvMNPXh1SUCbkTPzx5GwWJqV1hVr57xyjEaI2jryriS/CpLK2212zRt6Cyok0tv9P62fnJDB6Q/lYdSPN4wCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS1PR0302MB2443
X-OriginatorOrg: lenovo.com
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgQW5keSAsDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFuZHkgU2hl
dmNoZW5rbyA8YW5keS5zaGV2Y2hlbmtvQGdtYWlsLmNvbT4NCj5TZW50OiBNb25kYXksIEp1bHkg
MjcsIDIwMjAgNzozNSBQTQ0KPk9uIFRodSwgSnVsIDE2LCAyMDIwIGF0IDI6NTMgQU0gTWFyayBQ
ZWFyc29uIDxtYXJrcGVhcnNvbkBsZW5vdm8uY29tPg0KPndyb3RlOg0KPj4NCj4+ICAgICAgICAg
Y2FzZSBUUF9IS0VZX0VWX1BBTE1fREVURUNURUQ6DQo+PiAgICAgICAgIGNhc2UgVFBfSEtFWV9F
Vl9QQUxNX1VOREVURUNURUQ6DQo+PiAtICAgICAgICAgICAgICAgLyogcGFsbSBkZXRlY3RlZCBo
b3ZlcmluZyB0aGUga2V5Ym9hcmQsIGZvcndhcmQgdG8gdXNlci1zcGFjZQ0KPj4gLSAgICAgICAg
ICAgICAgICAqIHZpYSBuZXRsaW5rIGZvciBjb25zdW1wdGlvbiAqLw0KPj4gKyAgICAgICAgICAg
ICAgIC8qIHBhbG0gZGV0ZWN0ZWQgLSBwYXNzIG9uIHRvIGV2ZW50IGhhbmRsZXIgKi8NCj4+ICsg
ICAgICAgICAgICAgICB0cGFjcGlfZHJpdmVyX2V2ZW50KGhrZXkpOw0KPj4gICAgICAgICAgICAg
ICAgIHJldHVybiB0cnVlOw0KPg0KPkNvbW1lbnQgaGVyZSB0ZWxscyBzb21ldGhpbmcgYWJvdXQg
dGhlIG5ldGxpbmsgaW50ZXJmYWNlIHRvIHVzZXIgc3BhY2UuDQo+Q2FuIHlvdSBlbGFib3JhdGUg
d2h5IHdlIG5lZWQgc3lzZnMgbm93IGFuZCBob3cgaXQncyBhbGwgc3VwcG9zZWQgdG8NCj53b3Jr
Pw0KVXNpbmcgIG5ldGxpbmsgLCB3ZSB3ZXJlIGdldHRpbmcgcHJveGltaXR5IGV2ZW50cyBsaWtl
ICcweDYwYjAnIGFuZCAnMHg2MGIxJyBidXQgZm9yIG91ciBXV0FOIHJlcXVpcmVtZW50LCB3ZSBu
ZWVkIGRlZmF1bHQgYW5kIGN1cnJlbnQgDQpwLXNlbnNvciBzdGF0ZSB0b28gLiAgDQpTb21lIHRv
b2xzIGxpa2UgImFjcGktbGlzdGVuIiB1c2VzIG5ldGxpbmsgdG8gZGlzcGxheSBldmVudHMgYnV0
IHdlIG5lZWQgZGVmYXVsdCBhbmQgY3VycmVudCBwLXNlbnNvciBzdGF0ZSBhbHNvIGFzIHBlciBv
dXIgcmVxdWlyZW1lbnQuIA0KaGVuY2UgLCB3ZSBoYXZlIGFkZGVkIG5ldyBzeXNmcyB0byBnZXQg
Y3VycmVudCBwLXNlbnNvciBzdGF0ZSB1c2luZyAnR1BTUycgbWV0aG9kIGZyb20gQklPUyAuDQpU
aGlzIHdpbGwgYmUgdXNlZCBmb3IgaW1wbGVtZW50aW5nICJEeW5hbWljIHBvd2VyIHJlZHVjdGlv
biIgYXBwIHdoaWNoIGlzIHVzZWQgdG8gY29udHJvbCBCb2R5IFNBUiB2YWx1ZSBhcyBwZXIgRkND
IHJlcXVpcmVtZW50IC4NCldoZW4gQm9keSBvciBhbnkgb2JqZWN0IGlzIG5lYXIgb3IgYXdheSBm
cm9tIHAtc2Vuc29yIGxvY2F0aW9uIG9uIHRoaW5rcGFkIHN5c3RlbSAsIHRoZW4gc3lzZnMgd2ls
bCBiZSBzZXQgLg0KDQo+DQo+Li4uDQo+DQo+PiArc3RhdGljIGludCBwc2Vuc29yX2dldChib29s
ICpzdGF0ZSkNCj4+ICt7DQo+PiArICAgICAgIGFjcGlfaGFuZGxlIHBzZW5zb3JfaGFuZGxlOw0K
Pj4gKyAgICAgICBpbnQgb3V0cHV0Ow0KPj4gKw0KPj4gKyAgICAgICBpZiAoQUNQSV9GQUlMVVJF
KGFjcGlfZ2V0X2hhbmRsZShoa2V5X2hhbmRsZSwgIkdQU1MiLA0KPiZwc2Vuc29yX2hhbmRsZSkp
KQ0KPj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOw0KPj4gKw0KPj4gKyAgICAgICBp
ZiAoIWFjcGlfZXZhbGYocHNlbnNvcl9oYW5kbGUsICZvdXRwdXQsIE5VTEwsICJkIikpDQo+PiAr
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU87DQo+PiArDQo+PiArICAgICAgIC8qIENoZWNrIGlm
IHNlbnNvciBoYXMgYSBQc2Vuc29yICovDQo+PiArICAgICAgIGlmICghKG91dHB1dCAmIEJJVChQ
U0VOU09SX1BSRVNFTlRfQklUKSkpDQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9ERVY7
DQo+PiArDQo+PiArICAgICAgIC8qIFJldHVybiBpZiBwc2Vuc29yIGlzIHNldCBvciBub3QgKi8N
Cj4+ICsgICAgICAgKnN0YXRlID0gb3V0cHV0ICYgQklUKFBTRU5TT1JfT05fQklUKSA/IHRydWUg
OiBmYWxzZTsNCj4+ICsgICAgICAgcmV0dXJuIDA7DQo+PiArfQ0KPg0KPkl0IHJlbWluZHMgbWUg
b2YgYSBmdW5jdGlvbiB5b3UgY3JlYXRlZCBpbiBvbmUgb2YgdGhlIHByZXZpb3VzIGNoYW5nZXMu
IENhbg0KPnlvdSByYXRoZXIgY3JlYXRlIGEgcGFyYW1ldGVyaXplZCBoZWxwZXIgd2hpY2ggd2ls
bCBzZXJ2ZSBmb3IgYm90aD8NCg0KQWNrICwgd2Ugd2lsbCBjaGVjayBpdCAuDQoNCj4NCj4uLi4N
Cj4NCj4+ICsvKiBzeXNmcyBwc2Vuc29yIGVudHJ5ICovDQo+PiArc3RhdGljIHNzaXplX3QgcHNl
bnNvcl9zdGF0ZV9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaGFyICpidWYpIHsNCj4N
Cj4+ICsgICAgICAgcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiJWRcbiIsIHBzZW5z
b3Jfc3RhdGUpOw0KPg0KPldlIGtub3cgdGhhdCAlZCB0YWtlcyBtdWNoIGxlc3MgdGhhbiBQQUdF
X1NJWkUsIHVzZSBzcHJpbnRmKCkuDQo+DQo+PiArfQ0KPg0KPj4gKw0KPg0KPk5vIGJsYW5rIGxp
bmUgaGVyZS4NCj4NCkFjaw0KDQo+PiArc3RhdGljIERFVklDRV9BVFRSX1JPKHBzZW5zb3Jfc3Rh
dGUpOw0KPg0KPi4uLg0KPg0KPj4gK3N0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpwc2Vuc29yX2F0
dHJpYnV0ZXNbXSA9IHsNCj4+ICsgICAgICAgJmRldl9hdHRyX3BzZW5zb3Jfc3RhdGUuYXR0ciwN
Cj4NCj4+ICsgICAgICAgTlVMTCwNCj4NCj5ObyBjb21tYSBmb3IgdGVybWluYXRvciBsaW5lKHMp
Lg0KPg0KDQpBY2sgDQoNCj4+ICt9Ow0KPg0KPi4uLg0KPg0KPj4gKyAgICAgICAvKiBJZiBzdXBw
b3J0IGlzbid0IGF2YWlsYWJsZSAoRU5PREVWKSB0aGVuIGRvbid0IHJldHVybiBhbiBlcnJvcg0K
Pj4gKyAgICAgICAgKiBidXQganVzdCBkb24ndCBjcmVhdGUgdGhlIHN5c2ZzIGdyb3VwDQo+PiAr
ICAgICAgICAqLw0KPg0KPi8qDQo+ICogQ29uc2lkZXIgdG8gdXNlIGEgcHJvcGVyIG11bHRpLWxp
bmUgY29tbWVudCBzdHlsZS4NCj4gKiBMaWtlIGhlcmUuIChJdCdzIGFwcGxpY2FibGUgdG8gdGhl
IGVudGlyZSBwYXRjaCkgICovDQo+DQo+Li4uDQo+DQo+PiArICAgICAgIGVyciA9IHN5c2ZzX2Ny
ZWF0ZV9ncm91cCgmdHBhY3BpX3BkZXYtPmRldi5rb2JqLA0KPiZwc2Vuc29yX2F0dHJfZ3JvdXAp
Ow0KPj4gKyAgICAgICByZXR1cm4gZXJyOw0KPg0KPnJldHVybiBzeXNmcy4uLg0KQWNrIA0KDQpU
aGFua3MgJiBSZWdhcmRzLA0KTml0aW4gSm9zaGkNCg==
