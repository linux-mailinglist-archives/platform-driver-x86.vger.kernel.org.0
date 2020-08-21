Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405EE24E1B9
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Aug 2020 22:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726816AbgHUUBK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Aug 2020 16:01:10 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:37226 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727786AbgHUUBF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Aug 2020 16:01:05 -0400
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07LK08tK009244;
        Fri, 21 Aug 2020 16:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=MQysOCfjervxiusmdJwatlyL7u5Mi30uxEYW/mISirc=;
 b=sgyNyqcOKhLhKZ9JOt+rWKYc7lKo9oQbY+Sy8NSKmK+Ao9hEO9CqdPhKTzbGAHL6QTDX
 ILjxyJUp6+nxmDHD8g4Gee92HID67u8dj6Yfw1mCvlBXqf5p0Ox2u00GtSYddWhuWBKy
 CgrqhAH0doANQlyJiNLjiSmc3OfC4koW2hG8YcDBIHWwL9p+nPYrTZgkmQDQqyVQQoP/
 c97xlNWZg3lODpkgJFDkPBJnZ6vRKAAu2DbRwOb37CZoaRU9JShhL4fapcuckWguWIii
 0OAka5mjYAGEtgYOlUGqmuJH8Lqd8w6T/M/LhMj44eWIwceEXY8tOSYf5UBy/DmwKSyc HQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 3304j0qy4v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Aug 2020 16:00:41 -0400
Received: from pps.filterd (m0144104.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07LJvtSv048791;
        Fri, 21 Aug 2020 16:00:40 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by mx0b-00154901.pphosted.com with ESMTP id 332er65sbk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Aug 2020 16:00:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpIeTV5r8sBo/DSn+/xPr0cJ3q0cqcsRh95V9C6mhjrIGosbjSebecjVuFdH07vscL9fd3UkAf7YW3HUXWFFF7rvHIP1m7sBSTwz8dCaK32OMFHENL3hDJDv8DKZbxTCkfP2tydP8lbb3/lbHaJ43UyIaC14X3ab8/33tMdwUlrvG4Mvmfj8EXDQpcdQQKLZwepHEDLmZ7nQI/uF+B9H07+LKc4TYV1oIXaCNw+mgQL/wsTrqpHTYqdm9Hk0B7gHZQfj1oH4RNOd0BvKfI+0FvoO/heblNN5hAGovGvEexsZhwCrwUegpbt0ChHm5GfsOhSJv1JjVYiKTJB95HJwzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQysOCfjervxiusmdJwatlyL7u5Mi30uxEYW/mISirc=;
 b=hKj6Dx4G5+bQFvjo7sql9VmGLp19jSD8tpPc6a9vjE0LYHsLvkUUzsXsjgjeuhQTm+qAhshuQdDAW0ZIodxvqCS3OPW0E07h1oaXKlq6yYw6f3aaKtibMxqOSM8YSxRQ31Kv+zgSfNks6eJqBfNV1fuvX2YU54bZ4OtHeCbIPJXH1wlfQSgA+VGGrOafv5xLSaBZwx16/1WSYVs0akvC+DoBP6ugVXL4VJ5ZXJtmTz3u8HbGJtfsV9jzpV+oJrl2IdJjyQjIpid5eQ3eTLr2NrgH971dRmUIPfID571Vmr2jRJhRyHEBEK+9TGqXtHHQbHUxCBpXBqNNFWFx/7F4vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQysOCfjervxiusmdJwatlyL7u5Mi30uxEYW/mISirc=;
 b=KO0Wxr2FHTN5Rw7Te8xdmAKupdA1rqr8YF88eIV6uy68lIt0EW6z3tJI+urz9eTNWpA5i6YPn4tWKzQf4jI2J+aiD4cCAHuftmWES+fvIBwhre+7vMJ+nCcfKjII83KQ1edMVNoOrmryhRjwQ4hr+yvpIhHD8sSY2sPNlQwVcF8=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB4168.namprd19.prod.outlook.com (2603:10b6:5:2b8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.15; Fri, 21 Aug
 2020 20:00:38 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 20:00:38 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mark Pearson <markpearson@lenovo.com>
CC:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "bnocera@redhat.com" <bnocera@redhat.com>,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: RE: [External] RE: [PATCH v2] platform/x86: thinkpad_acpi:
 performance mode interface
Thread-Topic: [External] RE: [PATCH v2] platform/x86: thinkpad_acpi:
 performance mode interface
Thread-Index: AQHWd+QBvbgdvM4ZREOC8jacDgPt5KlC7TcAgAAHfwCAAAZQ8A==
Date:   Fri, 21 Aug 2020 20:00:38 +0000
Message-ID: <DM6PR19MB26369308415B8235B3C9997EFA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
 <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <1806c4ec-6788-bcc7-7e09-8e5274d2b9d5@lenovo.com>
In-Reply-To: <1806c4ec-6788-bcc7-7e09-8e5274d2b9d5@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-08-21T20:00:36.7397944Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=4f5a3238-6067-47a5-8188-c72510cede96;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d3cc383-67fa-4b47-9c7c-08d8460cdfe2
x-ms-traffictypediagnostic: DM6PR19MB4168:
x-microsoft-antispam-prvs: <DM6PR19MB416816D6C88621E84CBC7474FA5B0@DM6PR19MB4168.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: avOZonMfP90GAmk/E9dKxNm3SREePruASECIfnMWWTpDIgZ8EX0VuYdWrIoUdkSBA3+Iu22AyJ6jmdfms1sYYWwF57aWwWIDeiHQgNQXFQl3oh0gHMPGqaYk+nh6WCLnaXDebC5Nt7HSNZ5Bt22IXpKShfcSW2oJq611SREfZ4WCL6fAzwvBTNHAWQory4sqUkYTo4Y5JANx53RSeQ3FbnuxOyal7QZG4Ro48P/WlaOFCO/S862spvu/Ry7itQ+qo7Y+lo5WIEgcdnSWNBT+dcsXgNz+Dsz/xXyCLsiUpQrWldJQy7dorr+UQ+e45SiMIsFVZmsT39T71gs/qdpKjA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(136003)(366004)(39860400002)(396003)(6506007)(64756008)(53546011)(8936002)(2906002)(7696005)(5660300002)(6916009)(186003)(52536014)(54906003)(33656002)(4326008)(26005)(316002)(83380400001)(66556008)(66946007)(71200400001)(55016002)(86362001)(66476007)(66446008)(786003)(478600001)(76116006)(8676002)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: SZRaR04SKSi55eWcf8l9VnoUtdRiHO4IeJMTcfFVsvcs/rW6f5LZVAsdC72ybMlDflAJwQFW3wDN4c6gopPi9TNIyZ3hW6dx8y0BofJ5jM8qRETkDGWqZg3tB8ClbQ1eQa+iPoRvzhMY8lCJ2Eoz2Aa2dSrBzzlCoVD2P9D75NbYk/8AaTl6IBe1pwl9MznVxXZCb217QWTD4KavLtR23UN2TXTCxyNbSvaFZ8sI549qEcdfepN5oQKpWDyoELfrf/FV0a/74lR7zyn6WmR5TacEBJ/Ymbx4feEysLF6HUcWwA2X8/Z0W73bLlZPGGWCJNCGF6boKmmp3ZwJV7dfE11S1rBfukYJtdTxZ7LwHr3iWAgr3J9Dhqm2NcWlC5fZiagucDu/owc6VSzjcfls8d2lyTjiYBJZP0HQuAzjJDMGcdCNmRtc+6uNtI+YE2nmjLM6iX/BdN1CHqRFwqr3mf9xH8Rd41JYJkbb8ckKvz45AP5AgTqmKFeQXvggMPfiBrojGTQHcGkflVacJDLA/5SXBZ01vdJZo5vmrywpRUF7nZm9+lE7DENZ6U3YbPqWTyRFAXF4A0MtL578Di4BoUwqzCN1ADQLSZEcYYsZDx2EuS9N3kgY4S7ZSf1cX+58MDsgxeryWBDopV8p1pJ1rw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d3cc383-67fa-4b47-9c7c-08d8460cdfe2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 20:00:38.1618
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jJhOpyBkjlBdGLZXMhlTLxNZ2QWgckxA7/3jsrOAYHvQWUuBQtfnYMf8N9cSBaAPAlW0nAYomvCURMTS6g0NZG9RXz2uzbstEcdazvftveY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB4168
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-21_09:2020-08-21,2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210187
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210187
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBwbGF0Zm9ybS1kcml2ZXIteDg2
LW93bmVyQHZnZXIua2VybmVsLm9yZyA8cGxhdGZvcm0tZHJpdmVyLXg4Ni0NCj4gb3duZXJAdmdl
ci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgTWFyayBQZWFyc29uDQo+IFNlbnQ6IEZyaWRheSwg
QXVndXN0IDIxLCAyMDIwIDE0OjM2DQo+IFRvOiBMaW1vbmNpZWxsbywgTWFyaW8NCj4gQ2M6IGli
bS1hY3BpLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldDsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2
Z2VyLmtlcm5lbC5vcmc7DQo+IGlibS1hY3BpQGhtaC5lbmcuYnI7IGJub2NlcmFAcmVkaGF0LmNv
bTsgTml0aW4gSm9zaGkNCj4gU3ViamVjdDogUmU6IFtFeHRlcm5hbF0gUkU6IFtQQVRDSCB2Ml0g
cGxhdGZvcm0veDg2OiB0aGlua3BhZF9hY3BpOg0KPiBwZXJmb3JtYW5jZSBtb2RlIGludGVyZmFj
ZQ0KPiANCj4gDQo+IFtFWFRFUk5BTCBFTUFJTF0NCj4gDQo+IEhpIE1hcmlvDQo+IA0KPiBPbiA4
LzIxLzIwMjAgMzoxNSBQTSwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOg0KPiA+Pg0KPiA8c25p
cD4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgYWRhcHRpbmcgYSBsb3Qgb2YgbXkgZmVlZGJhY2ssIHRo
aXMgbG9va3MgbXVjaCBiZXR0ZXIgdG8gbWUuDQo+ID4NCj4gTm8gcHJvYmxlbXMgYW5kIGdlbnVp
bmVseSB0aGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4gU29ycnkgaXQgdG9vayBzbw0KPiBsb25n
IHRvIGdldCB0aGlzIHVwZGF0ZSBvdXQgLSBQVE8gYW5kIG90aGVyIHRoaW5ncyBnb3QgaW4gdGhl
IHdheSA6KQ0KPiANCj4gPj4NCj4gPHNuaXA+DQo+ID4+ICsNCj4gPj4gK1RoZSBzeXNmcyBlbnRy
eSBwcm92aWRlcyB0aGUgYWJpbGl0eSB0byByZXR1cm4gdGhlIGN1cnJlbnQgc3RhdHVzIGFuZCB0
bw0KPiBzZXQNCj4gPj4gdGhlDQo+ID4+ICtkZXNpcmVkIG1vZGUuIEZvciBleGFtcGxlOjoNCj4g
Pj4gKw0KPiA+PiArICAgICAgICBlY2hvIEggPiAvc3lzL2RldmljZXMvcGxhdGZvcm0vdGhpbmtw
YWRfYWNwaS9keXRjX3BlcmZtb2RlDQo+ID4+ICsgICAgICAgIGVjaG8gTSA+IC9zeXMvZGV2aWNl
cy9wbGF0Zm9ybS90aGlua3BhZF9hY3BpL2R5dGNfcGVyZm1vZGUNCj4gPj4gKyAgICAgICAgZWNo
byBMID4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3RoaW5rcGFkX2FjcGkvZHl0Y19wZXJmbW9kZQ0K
PiA+PiArDQo+ID4NCj4gPiBJIHdhcyB0aGlua2luZyBhYm91dCB0aGlzIHNvbWUgbW9yZSwgZG8g
eW91IGFjdHVhbGx5IHdhbnQgYW5vdGhlciBtb2RlIHRoYXQNCj4gImRpc2FibGVzIg0KPiA+IHRo
aXMgZmVhdHVyZT8gICBJRSAiTyIgdHVybnMgaXQgb2ZmIGFuIGNhbGxzIERZVENfRElTQUJMRV9D
UUwuDQo+ID4NCj4gPiBGb3IgZXhhbXBsZSBpZiBhIHVzZXIgd2FudGVkIHRvIHRlc3QgdGhlIHJl
Y2VudGx5IGxhbmRlZCBjb2RlIGluIHRoZXJtYWxkDQo+IDIuMw0KPiA+IGFuZCBjb21wYXJlIHBl
cmZvcm1hbmNlIGJldHdlZW4gdGhlIHR3byBpdCBzZWVtcyBsaWtlIHRoaXMgYW5kIHRoYXQgIm1p
Z2h0Ig0KPiBmaWdodC4NCj4gPiBBcyBhbiBvdXRzaWRlciBsb29raW5nIGluIC0gSSBvZiBjb3Vy
c2UgbWF5IGJlIHdyb25nIHRvbyBoZXJlLg0KPiA+DQo+ID4gSWYgYXQgc29tZSBwb2ludCBpbiB0
aGUgZnV0dXJlIHRoZXJtYWxkIGRvZXMgYSBiZXR0ZXIgam9iIHRoYW4gdGhpcw0KPiBpbXBsZW1l
bnRhdGlvbiB5b3UNCj4gPiBtaWdodCBhbHNvIHdhbnQgYW4gIm91dCIgdG8gbGV0IHRoZXJtYWxk
IG9yIGFub3RoZXIgcGllY2Ugb2YgdXNlcmxhbmQgdHVybg0KPiB0aGlzIG9mZg0KPiA+IGlmIGl0
J3MgaW4gdGhlIHBpY3R1cmUuDQo+ID4NCj4gSSdtIHN0aWxsIGRpZ2dpbmcgaW50byB0aGlzIG9u
ZS4gUmlnaHQgbm93IEkgaGF2ZW4ndCBmb3VuZCBhIGdvb2QgY2xlYW4NCj4gd2F5IG9mIGp1c3Qg
ZGlzYWJsaW5nIHRoZSBmaXJtd2FyZS4gQ3VycmVudGx5IHdoZW4gdGhlcm1hbGQgZ29lcyBpbiBh
bmQNCj4gdHdlYWtzIHRoZSBDUFUgcG93ZXIgcmVnaXN0ZXJzIGl0IGhhcyB0aGUgZWZmZWN0IG9m
IG92ZXJyaWRpbmcgdGhlIEZXDQo+IGFueXdheSAtIGJ1dCBJIGFwcHJlY2lhdGUgdGhhdCdzIG5v
dCBxdWl0ZSB0aGUgc2FtZSBhcyBhY3R1YWxseSBkb2luZyBpdA0KPiBleHBsaWNpdGx5Lg0KPiAN
Cg0KV2hhdCBhYm91dCBhIG1vZHByb2JlIHBhcmFtZXRlciB0byBkaXNhYmxlIGF0IGxlYXN0PyAg
VGhhdCB3b3VsZCBhdCBsZWFzdA0KbWFrZSBpdCBwcmV0dHkgZWFzeSB0byBtYWtlIGEgY2hhbmdl
LCByZWJvb3QgYW5kIGNvbXBhcmUgd2l0aCB0aGVybWFsZCAob3INCm90aGVyIHNvZnR3YXJlKSB3
aXRob3V0IGRpc2FibGluZyB0aGUgcmVzdCBvZiB0aGUgZnVuY3Rpb25hbGl0eSBvZiB0aGUNCnRo
aW5rcGFkX2FjcGkgZHJpdmVyLg0KDQo+IEknbSBzdGlsbCBkaXNjdXNzaW5nIHdpdGggdGhlIEJJ
T1MgdGVhbSBob3cgdG8gaW1wbGVtZW50IHRoaXMgLSB0aGVzZQ0KPiBjb252ZXJzYXRpb25zIHRh
a2UgdGltZS4uLi4gSSBzdXNwZWN0IEknbGwgbmVlZCBhIG5ldyBCSU9TIEFQSSB3aGljaA0KPiB3
aWxsIHRha2UgYSB3aGlsZSB0byBpbXBsZW1lbnQgYW5kIGdldCByb2xsZWQgb3V0LiBJIGRpZG4n
dCB3YW50IHRvIGhvbGQNCj4gdXAgdGhpcyBwYXRjaCBhcyB0aGVyZSBhcmUgYmVuZWZpdHMgZm9y
IHVzZXJzIGluIHRoZSBtZWFudGltZSBhbmQgTGVub3ZvDQo+IGRvIHBsYW4gb24gc3VwcG9ydGlu
ZyB0aGUgdGhlcm1hbCBzb2Z0d2FyZSBnb2luZyBmb3J3YXJkcy4gSSdtIG5vdCBub3QNCj4gZHJv
cHBpbmcgdGhlIHBsYW4gdG8gaGF2ZSBhIGRpc2FibGUgZnVuY3Rpb24gYXMgSSBjYW4gc2VlIHRo
ZSBiZW5lZml0cy4NCj4gDQoNCg0KWXVwLCB3ZWxsIGF3YXJlIGhvdyB0aGVzZSB0eXBlcyBvZiB0
aGluZ3MgZ28uDQoNCj4gVGhhbmtzIGZvciB0aGUgaW5wdXQuIExldCBtZSBrbm93IGlmIHlvdSB3
YW50IGEgcmV2aWV3ZWQtYnkgdGFnIGFkZGVkLiBJDQo+IHRoaW5rIGl0J3Mga2luZGEgYXdlc29t
ZSBoYXZpbmcgaW5wdXQgZnJvbSBhIERlbGwgZW5naW5lZXIgb24gYSBMZW5vdm8NCj4gcmVsYXRl
ZCBkcml2ZXIgYW5kIEkgaG9wZSBpbiB0aGUgZnV0dXJlIEkgY2FuIHByb3ZpZGUgdGhlIHNhbWUg
aGVscCA7KQ0KPiBPcGVuIHNvdXJjZSBpcyBhd2Vzb21lLg0KPiANCj4gTWFyaw0KDQrwn5iKDQo=
