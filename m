Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC15022EC8A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 14:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgG0Mtc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 08:49:32 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.114]:25631 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728128AbgG0Mtb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 08:49:31 -0400
Received: from [100.112.6.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-c.us-east-1.aws.symcld.net id 75/8F-12867-85DCE1F5; Mon, 27 Jul 2020 12:49:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOJsWRWlGSWpSXmKPExsWS8eIht27EWbl
  4g2MX2CwezE23mH3YxmLOs7WMFqv3vGB2YPH4fYDRY/eCz0we7/ddZfP4vEkugCWKNTMvKb8i
  gTXj+puTjAWTuSsajj1kaWBs4O5i5OIQEmhgktj44Dw7hPOKUaJjbwszXKbjxXPGLkZOIOc3o
  8TiD2kgCUaBpcwSs2Z/BEswChxjkfiyigcisYFRovvXZ0YQh0VgN7PEiacXWSBmzWSSmPzjF9
  Tg+4wSq/9/ZgHpZxNQl3h18CobiC0CZH/pnAbWziywgUni1rszYAlhgUKJ+30rGCGKiiQOLZ0
  PZVtJtLevBrNZBFQl2hd8A6vnFYiR2NH4AGr1IiaJ9xc/gm3jFPCUWDH1HxPE5WIS30+tAbOZ
  BcQlbj2ZD2ZLCAhILNlznhnCFpV4+fgfK0R9D6PE7zlsEHElic3bm9khbFmJS/O7GSFsX4nWp
  ROg4loSB+ZvhbJtJI4+XwB0AweQrSLx71AlRDhbYs3HJewTGI1nIbliFlAVs4CmxPpd+hBhRY
  kp3Q/ZZ4F9JihxcuYTlgWMLKsYTZOKMtMzSnITM3N0DQ0MdA0NjXTNdU0s9RKrdJP1Sot1UxO
  LS3QN9RLLi/WKK3OTc1L08lJLNjECU1JKAbvhDsbFbz7oHWKU5GBSEuX9t1guXogvKT+lMiOx
  OCO+qDQntfgQowwHh5IE7/3TQDnBotT01Iq0zBxgeoRJS3DwKInwcp0BSvMWFyTmFmemQ6ROM
  YZzTHg5dxEzx+Xr84Dks7VLgOSRuUuB5IZ5IPL/3btAsn/BwdXMHDfbD61mFmLJy89LlRLntQ
  QZJwAyLqM0D24ZLP1fYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMewBkCk9mXgncTcC0DfS
  pCG/jcVmQc0sSEVJSDUxLbBfpPNg/U9XH0DXj7p/Yxiz7t+lXlkl11Li1Papwc9287tuX6bvc
  eJdfFG5cuYzN56AS82HN5rQLl92+7+GbXzflesSDg3IiDCUKr75kSWSpHH17x3ivhKa3atzEq
  BKT+Qzn3/vIdO08P/Nmh2TRfmmN72/6WFN3HrG/Imw7M9x/x2rfhjfWvgZHlfcEHz5rH3chsG
  35yUB+m9NPdqRJrfnau6Sm/cLqi/nTX/lP52ExmPY5Z57vnH694p13fD7eecW7Qejdn9oXs+1
  fP06ObX0bsTm4MPPvtYjwAr8nlU2y6+XPeV48f8FK9ZPql+lXlqtFyE3l2LM6XfrnJZc/gm6q
  yw3CPvxdaT9fQ8dYiaU4I9FQi7moOBEAfgWS5XoEAAA=
X-Env-Sender: njoshi1@lenovo.com
X-Msg-Ref: server-7.tower-416.messagelabs.com!1595854167!216185!1
X-Originating-IP: [104.232.225.11]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19988 invoked from network); 27 Jul 2020 12:49:28 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.11)
  by server-7.tower-416.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Jul 2020 12:49:28 -0000
Received: from HKGWPEMAIL02.lenovo.com (unknown [10.128.3.70])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id F347277920D57921E9E6;
        Mon, 27 Jul 2020 08:49:26 -0400 (EDT)
Received: from HKGWPEMAIL04.lenovo.com (10.128.3.72) by
 HKGWPEMAIL02.lenovo.com (10.128.3.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1913.5; Mon, 27 Jul 2020 20:49:24 +0800
Received: from HKEXEDGE02.lenovo.com (10.128.62.72) by HKGWPEMAIL04.lenovo.com
 (10.128.3.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5 via Frontend
 Transport; Mon, 27 Jul 2020 20:50:13 +0800
Received: from APC01-HK2-obe.outbound.protection.outlook.com (104.47.124.55)
 by mail.lenovo.com (10.128.62.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 27 Jul
 2020 20:50:13 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gBcA5Jdjy6P3C9hOfOw8BemRvgNRS+2XkvvVSDZ8480uj2fqtSs4KOMkCj0KR59GIZTGaS5/UkCnmA3xRbtj/H8bTlmVfWRJs3RWY5oLUP7i516KGl6Bv8P3rFbEVu0OjonI9w2sda/YHvGf6qBtWNG6O93H9Nt+Vho+AxIlQ05g2VmB1LA3Lm3WSMiIfM8IjMt9qX/zAJry3QpBwFUe7PsiLWFM3S0jBK52Jo1mC0IfCr+1TyXrczMLkQSfYACzMXym43nPaL5Sl9lyiGfS6PfeH1U24WoNnXRLxunbdakHRjXG/cdrNvpK7edEkjQLNcGW9WM14OppANQsewJswQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNjL15XsgJRvFWd0K7QwGIj7bc4rKMYa5yvbYhBRog8=;
 b=gjmZJoDazWyu8oy/5NdDGaG0cE+CxTsgdOiaxYJAnZWQyLgUrOcPRRNSW2IjkMryybj9C3EwoTd+HKekkBC2s7mvxQutQDdk4vli7znfFC+RzDJOZkeC46BZsWxxC0KuAx7cVV9z3iw4dkdC4All58TorRkwQ1g3q7ZN7GbDjrQnXe3hp0mtWYcPGZ89GPS+ZdoVug70Pfe1kaMugpjmg9X6gSe5jnN3CF1nXM68aJkGQ1bsIiaUH8kiXj7eCPmyGR7SsaQNJPtOGcxB7nDM4oJtAwa6zFNEJs4LFL8r4JXFW6cgEMFeOWcJp9pSSRtIU1lWJjLaddsBu10/5Cdk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lenovo.com; dmarc=pass action=none header.from=lenovo.com;
 dkim=pass header.d=lenovo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=LenovoBeijing.onmicrosoft.com; s=selector2-LenovoBeijing-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xNjL15XsgJRvFWd0K7QwGIj7bc4rKMYa5yvbYhBRog8=;
 b=OE8RGg/p+aBnMkCgkTkYzlAIqaED7YdfNmaaPECC/ryKmHtHRtsvaW0sb7Mhrkd5ArIYwognOsF4HiBW5CDLn5RZG/sc5ZdKXsu9Vkm3wofLYvOTgzwJF2L2ixzUKf8s/eRR7IocUfWDgVRSeBmbSu7GKxU4gAFw4XAgu23oR+Y=
Received: from SG2PR03MB2718.apcprd03.prod.outlook.com (2603:1096:3:1e::22) by
 SG2PR03MB2717.apcprd03.prod.outlook.com (2603:1096:3:21::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.9; Mon, 27 Jul 2020 12:49:22 +0000
Received: from SG2PR03MB2718.apcprd03.prod.outlook.com
 ([fe80::1145:fb6f:aa6a:4398]) by SG2PR03MB2718.apcprd03.prod.outlook.com
 ([fe80::1145:fb6f:aa6a:4398%5]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 12:49:22 +0000
From:   Nitin Joshi1 <njoshi1@lenovo.com>
To:     Bastien Nocera <bnocera@redhat.com>
CC:     Mark RH Pearson <markpearson@lenovo.com>,
        Sugumaran Lacshiminarayanan <slacshiminar@lenovo.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [External]  Re: [ibm-acpi-devel] [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Thread-Topic: [External]  Re: [ibm-acpi-devel] [PATCH v4] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Thread-Index: AQHWY8DIP68AvAZQjE24ENYf+sTd3Jx998kljJ1n11A=
Date:   Mon, 27 Jul 2020 12:49:21 +0000
Message-ID: <SG2PR03MB2718BD5C540321CAE069A7A38C720@SG2PR03MB2718.apcprd03.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200629191748.3859-1-markpearson@lenovo.com>
 <732277929.1313334.1593596757447.JavaMail.zimbra@redhat.com>
 <SG2PR03MB2718DFC08C4ECF7816D1B4E48C720@SG2PR03MB2718.apcprd03.prod.outlook.com>
 <321690127.4797880.1595847834329.JavaMail.zimbra@redhat.com>
In-Reply-To: <321690127.4797880.1595847834329.JavaMail.zimbra@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.165.32.192]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1988add5-28c5-48f7-ad12-08d8322b7c28
x-ms-traffictypediagnostic: SG2PR03MB2717:
x-ld-processed: 5c7d0b28-bdf8-410c-aa93-4df372b16203,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR03MB2717C6C533A648717D7E27428C720@SG2PR03MB2717.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dNPHCXnK3FrJoTX6zcSRd9hnCsyVUUK+45OhZh/u28cI6lAm1E1E8ueclcNSgWzRvfAuBj3AmgMF4hp6MK5OHXmvtQIHN3grY0vSpBkpHkdQkWWSosLJ6t1USnL+D7OoczAXdQnaiTWnrhTIBr5PaE9U+HdcavFsVqIUtqeCkV21sd3OZJUVzfo/Ioc0wStQrEzOSq2zqDM5la4ZyMeycxtDmT5myqTmfcuJzMdKcrqlAxTFhUHB/iC/bWS3TVGLVSRE2iFabN/NbGvBVLv/ZpkhLNIs97qQ81rEVA8sD7IKBqktHZIV81QDSkAe+Y9eHWGGBi0obiJKMCEyToDWhNsxozleQkHD2i3wcmE95kQy21oaESR4ym9qE3Lu3DK/8M4GyEle+MoHc94rm4VJtg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SG2PR03MB2718.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(346002)(376002)(396003)(39860400002)(366004)(136003)(4326008)(7696005)(8936002)(966005)(9686003)(186003)(6916009)(8676002)(26005)(55016002)(6506007)(86362001)(33656002)(54906003)(2906002)(316002)(5660300002)(478600001)(83380400001)(4744005)(66946007)(66446008)(64756008)(66556008)(66476007)(76116006)(71200400001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: +jRaKZGnxKUscz7fYiQ1+Wiu17ef1Qiz2B8ku3zIqowZm02ASj0lgDV8bHPISt/76HeH8KZRdfJ3Ouef/IeMAysLIGgc/VzDwLZNpToDHCPevgNLqnd+uXVeSvJm4EqWLwaFI9HOJTI5ElFYrKS4BTk4hlnBLDGGzVEt7M05hY+3TeNoC5TExMBwL5TMUJ6lbO9+8mnA+nCQLeIQAMyzTJ/sb91y9w7JtZQe2lqE7U/pT8dTTe0k15sJ3+amZJi3gQuK2yU88PQuiaDjn6I5TBtr8DyAKkH51W1S5hgcPxv5FtJBuZ3ZR3EiXMlkQqV+g8oUo0FubvAldfvR7zyq3xzoksmtsiOGrRRKtKjJDTE5mNYibeNqdtOR43lN/hsEEB4zrhR32166azLCkEXzHh01ahAmBzwDYckLqKCFx8ZFDS16b7oxJv8KM6M3uLTMMDr+yemi8x62v4lWkaQtZdPg38xA1EY/GDmOWy0khmAoHkmP7o9Fgbp6CaHkRXvVEi69P7xamme2kf4xINW763nV4b61p6cf5l21XqpUo2JFrWhnG/+GMH0++F78y3kh859zPeRciPbYqEjYyyUqXpdDaQZ28rJtQN66cDkVDUliISYuH5MoS5ECFA+rjqzSLx+Zsfj9CoArtNr+jcjvIg==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB2718.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1988add5-28c5-48f7-ad12-08d8322b7c28
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2020 12:49:21.9589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7d0b28-bdf8-410c-aa93-4df372b16203
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ucxzb+XLRj+wCHG2x6kcKeg9qsXYdabcEv7pvXC9MlGGnnc6TSVqgSzf1HCGiZ3TdO0W2At+VGaeruPu9hhaAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR03MB2717
X-OriginatorOrg: lenovo.com
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQmFzdGllbiBOb2NlcmEgPGJub2Nl
cmFAcmVkaGF0LmNvbT4NCj5TZW50OiBNb25kYXksIEp1bHkgMjcsIDIwMjAgODowNCBQTQ0KPlRv
OiBOaXRpbiBKb3NoaTEgPG5qb3NoaTFAbGVub3ZvLmNvbT4NCj4+ID4+DQo+PiA+PiBDby1kZXZl
bG9wZWQtYnk6IE5pdGluIEpvc2hpIDxuam9zaGkxQGxlbm92by5jb20+DQo+PiA+PiBTaWduZWQt
b2ZmLWJ5OiBOaXRpbiBKb3NoaSA8bmpvc2hpMUBsZW5vdm8uY29tPg0KPj4gPj4gUmV2aWV3ZWQt
Ynk6IFN1Z3VtYXJhbiA8c2xhY3NoaW1pbmFyQGxlbm92by5jb20+DQo+PiA+PiBTaWduZWQtb2Zm
LWJ5OiBNYXJrIFBlYXJzb24gPG1hcmtwZWFyc29uQGxlbm92by5jb20+DQo+PiA+DQo+PiA+DQo+
PiA+WW91IGNhbiBhZGQgbXk6DQo+PiA+UmV2aWV3ZWQtYnk6IEJhc3RpZW4gTm9jZXJhIDxibm9j
ZXJhQHJlZGhhdC5jb20+DQo+Pg0KPj4gSXQncyBhbHJlYWR5IGFkZGVkIGluIGxhdGVzdCBwYXRj
aCBhbmQgY3VycmVudGx5IGluICJmb3ItbmV4dCINCj4+IGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9y
Zy9saW51eC1wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQvY29tbWl0L2FjZjdmNGENCj4+IDU5MTE0
NDcxYzM5NjRmMTE4NTY0ZmU4ZTdhNmYzNGJiOA0KPg0KPkkgc2VudCBteSBtZXNzYWdlIG5lYXJs
eSBhIG1vbnRoIGFnbywgMiBkYXlzIGJlZm9yZSB0aGUgYXV0aG9yaW5nIGRhdGUgb2YNCj50aGUg
cGF0Y2ggdGhhdCB3YXMgbWVyZ2VkLCBzbyBJJ20gbm90IHN1cmUgd2hhdCB5b3UncmUgdHJ5aW5n
IHRvIHRlbGwgbWUNCj5oZXJlIDopDQoNClNvcnJ5ICwgcGxlYXNlIGlnbm9yZSB0aGlzIGUtbWFp
bCAuIERvbuKAmXQga25vdyB3aHkgaXQgY2FtZSB1cCBvbiBteSBtYWlsYm94IHRvZGF5IC4gQnV0
IGl0cyBteSBtaXN0YWtlICwgSSB3b3VsZCBoYXZlIHNlZW4gZGF0ZSB3aGVuIHRoaXMgZS1tYWls
IHdhcyBzZW50IDopIA0KQXBvbG9naXplIGZvciBpbmNvbnZlbmllbmNlIGNhdXNlZC4NCg0KVGhh
bmtzICYgUmVnYXJkcywNCk5pdGluIEpvc2hpDQo=
