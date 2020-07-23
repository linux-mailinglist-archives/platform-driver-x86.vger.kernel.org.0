Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E563722A4A6
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Jul 2020 03:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387414AbgGWBgp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jul 2020 21:36:45 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:15074 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728914AbgGWBgo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jul 2020 21:36:44 -0400
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N1Sbws002234;
        Wed, 22 Jul 2020 21:36:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=A+jRJE+hk7dB79fh8tfsU7d4iI3LFrrKrCQvLs2RHJg=;
 b=gw5QFdG5Raxkvv0bl7pT+oaTgCaD5ZCH6e6bq9dVu1ONNk8p2uCp1NuiFKVE4lNcO9Su
 0VQ8M8a30ypoxJDOOQJBFFfw2i1xaAXgNVbcllBWso29hDIL2Dl0G2J12hldx7dLj3tX
 MPMjgpV2ALzxVjn+Bqb19RvRasRvmGcQvVHwQ9iytZSnrNFABJghlUx+aTLXJB5UsZVg
 +IfTx6hw0KhpUeu+JIB8cFKVDM/DtBK+bg3Q/iXKi65cyBakGvpU0qdPoGmcN5wiieuo
 t1GaTd9AWFCPLKI6rjIR9sr14xO991xsJ8cNL8iaKadrF9UOhxI5uyZRvugthuEWzLkq 1g== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 32bvwxy5a3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Jul 2020 21:36:22 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N1ZcT9162971;
        Wed, 22 Jul 2020 21:36:21 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
        by mx0b-00154901.pphosted.com with ESMTP id 32ey0mh9hf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jul 2020 21:36:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1EyZZjAJKhhtcjJVYsMpyxgWvT+cMWP7agKnv5Fgy4IFJfdzTW03kBN89k0CCe/IoJjuuv8Eaz2glu81DAHch2S5k9f+6/3zvjjBGS7GAh9XjBIGjNQJOTLRvsiy8mi7Baxy0PlnUbOMEZneWOgUHfPKSMq4NM/p3xlRhcXPg6RXR05EMcUW85Z1hWLlE18t87arH3deo3vEKvnLP1pS/Tobsizjd3K5ZBEcLmX0plaNsdxAl4NYMtRGVdUFlGK4mZVloXZ6Qgq3sMHBvs5y0OzxghbmYd1feKYk4gthXyA2z8jk0LnD5C4VBVwRZ3+AYwgjr8cRqnKX80Pwd0VMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+jRJE+hk7dB79fh8tfsU7d4iI3LFrrKrCQvLs2RHJg=;
 b=NcKQbq/ptKVJk2R30FnMo7BmZ1NssuOQE1k1EA5hnMHFrsSr2dUI6Dd5ynuqb4kEVm5oRNct8ZUgiOdCXfVtKB94h5YwbodfbTuSj0I36GLvoMWXsJX9O5kDzhoInegALzbEU6iMemDGp5V4P1iH1h+gZ1cLa1jp6cc37dtVJy2oyny2QBYp8X1NW4Ouh9SV1PSiRVmC+fVm8wymRZSpVsv7hI+u/cBBNf9X47PQY3m1bAWMdV4lDlUQmMUp6Jq9N1GzbcQTS7DvJygSOA7fTSvRnoors0Iz4uYNi/YZki9P50P433RoJSNX6TCuGLrPEh1g13sNl+qBH0mEIVRIgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A+jRJE+hk7dB79fh8tfsU7d4iI3LFrrKrCQvLs2RHJg=;
 b=SFaMT9yO4VVyA6qIKoDgzDiteZGIyUCFJIijXCHW9lCHYslsQrEuXmDo7et5EjFwayCEFgjWjzmEkTxDWnBZ2uCsn/v58GsDzR8w42IbA/j9T1KSq2F/+PicdNZQouHd3Na/LG4uHvtehsoHg06OSSnOnGQjMhqrwL8iMlKOEmk=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM5PR19MB1163.namprd19.prod.outlook.com (2603:10b6:3:bc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3216.20; Thu, 23 Jul 2020 01:36:19 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3195.022; Thu, 23 Jul 2020
 01:36:19 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     Mark Pearson <markpearson@lenovo.com>
CC:     "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "bnocera@redhat.com" <bnocera@redhat.com>,
        "bberg@redhat.com" <bberg@redhat.com>,
        Nitin Joshi <njoshi1@lenovo.com>
Subject: RE: [External] RE: [PATCH] platform/x86: thinkpad_acpi: performance
 mode interface
Thread-Topic: [External] RE: [PATCH] platform/x86: thinkpad_acpi: performance
 mode interface
Thread-Index: AQHWYEtB2AZ16m+5BkiCkmlUDRcurKkT57IggAAUiICAAACUUIAAVMMAgAAO5CA=
Date:   Thu, 23 Jul 2020 01:36:19 +0000
Message-ID: <DM6PR19MB2636F2A87EE2DF8BD2B9A879FA760@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200722171108.65185-1-markpearson@lenovo.com>
 <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b79e0359-536d-f496-a01e-fe4c4b7796cc@lenovo.com>
 <DM6PR19MB26360DE8FCA56BC132644F98FA790@DM6PR19MB2636.namprd19.prod.outlook.com>
 <e14aa227-493b-4206-eaef-81874512166f@lenovo.com>
In-Reply-To: <e14aa227-493b-4206-eaef-81874512166f@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-07-23T01:36:17.7518891Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=994503a8-7c59-4edc-ad44-5b7c4d79484a;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c444679e-f29a-4249-be73-08d82ea8ccdd
x-ms-traffictypediagnostic: DM5PR19MB1163:
x-microsoft-antispam-prvs: <DM5PR19MB1163F53D64DC2152ED4B6AABFA760@DM5PR19MB1163.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cTNkV6AaFHrAuYhytRts+ZKqp/07KXLvwIypaa4OYIhruIPO5fSxLpdOd4svLVpS57Ro3d7QcomscoXYyrzXlU//OxSjUZU8wUKrYA152wlZ7BVCWX4YioP09gE0cTdC/xMVJL9Sqa1d4R+Vobdy9wj4xZeZEjD21m2AI8Mal+CGdHWs+Jw7vCmnKv4Bcw3NgeJevuKTaRnyJ9Im2CDgW6+6dVchOA8wYdYs8iFuu3dwGKqHODPrImjI0e+GLaJntjJd7YeDTalZ3OIqb8K3+JxRRgp8yUIoiWrZWR9IX/BNTV57s34q2XloqOb+4kYe3CVwaG+a1LxSkJxEiQFk0g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(376002)(396003)(346002)(136003)(366004)(6916009)(71200400001)(86362001)(6506007)(9686003)(55016002)(66946007)(7696005)(186003)(52536014)(76116006)(8936002)(4326008)(26005)(83380400001)(8676002)(2906002)(786003)(33656002)(316002)(478600001)(5660300002)(66476007)(66556008)(64756008)(54906003)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GGkLtfxBdq8H0wVqmUKGrRMhZfe7pAzslmxMrUgz2vQa5wuTVKTVddd0I3LTh2PijdmPTa6WoEfncHZ0jqvc1ld7NlXO3igum+aGf+sGwiV8ZMRLjiGw/BFMSs+lr6+MHPLzjWL28hFTtAyzbdJONLDkz78WEcmXpZnERj1+L7/lCnAJy0NbNhQzIlutOh/hdWgDqH89gxDm6D0QQfDGXiAIeFqYDzhOWQOQNVbOipvPY2TUG8DSinjlUqNwDemDbXgcaa8MCXv5bApzal9mu5XA0WJyuH/aEZRmBR0uDE7+i47Tvsxm+yUJ4A7NNr+Ws334NV8pf1kZI7+WE/3+gN885b83GRdCmm2aRiUVZa88E4pMyTIjsbCCpALxT0Nrwl/qQln/N2WWaYhM7erZovbj0QknHNEP0LfrQjn16626DYD00O0ha1nTkfA/XeRNmy+IDsachZfpoXj9gUFnBI+uosK5KbwbIegyqBZbgERuBcwsaAz9+PuZMQY87edW
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c444679e-f29a-4249-be73-08d82ea8ccdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2020 01:36:19.8503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vkFal0o3ke7nMa54qrzyCbM3NQ1VnizQq6Jhi9VOZs8j4XEXtL+U7dSSpBB+eVC7BJVaRovSDV90Lr+fA+n5IG2U/iK4gGMMao5rBIhhj68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR19MB1163
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230009
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230009
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiA+DQo+ID4gU2luY2UgaXQncyBub3QgbWVudGlvbmVkIEkgY2FuIG9ubHkgZ3Vlc3MgeW91ciBm
aXJtd2FyZSBpbXBsZW1lbnRhdGlvbg0KPiBhc3NvY2lhdGVkDQo+ID4gd2l0aCB0aGlzIGNvZGUu
ICBJIHdvdWxkIHRoaW5rIGZvciBleGFtcGxlIHRoYXQgdG91Y2hpbmcgc29tZSBQTHggcmVsYXRl
ZA0KPiBNU1Igb3INCj4gPiBwb3NzaWJseSBSQVBMIGludGVyZmFjZSBtaWdodCBjYXVzZSB1bmV4
cGVjdGVkIGJlaGF2aW9ycy4NCj4gPg0KPiA+IEFzc3VtaW5nIHRoYXQncyByaWdodCBrZXJuZWwg
bG9ja2Rvd24gbWlnaHQgcHJldmVudCBzb21lIG9mIHRoZSBNU1IsIGJ1dA0KPiBpZiB5b3UgcmVh
bGx5DQo+ID4gd2FudCB1c2VyIGZ1bGx5IGluIGNvbnRyb2wgb2YgdGhpcyBkZWNpc2lvbiBieSBv
bmUga25vYiwgeW91IHNob3VsZG4ndA0KPiBsZXQgY29tbW9uDQo+ID4gdXNlcnNwYWNlIHRvb2xz
IGxpa2UgdGhlcm1hbGQsIHR1bmVkLCB0bHAgb3IgdGhlIGxpa2UgdG91Y2ggdGhlIHJlbGF0ZWQN
Cj4gb2JqZWN0cy4NCj4gPg0KPiBIbW1tIC0gSSB0aGluayBJIGRpc2FncmVlIGhlcmUuDQo+IA0K
PiBJIGRvbid0IHRoaW5rIHRoaXMgc2hvdWxkIGNvbnRyb2wgd2hhdCBvdGhlciB1c2Vyc3BhY2Ug
dG9vbHMgKGxpa2UNCj4gdGhlcm1hbGQpIHdhbnQgdG8gZG8gd2l0aCB0aGUgQ1BVIHJlZ2lzdGVy
cy4gQWRkaW5nIGhvb2tzIGludG8gdGhvc2UNCj4gb3RoZXIgcGllY2VzIG9mIGNvZGUgYWxzbyBz
ZWVtcyB0byBtZSB0byBiZSBjb21wbGljYXRlZCBhbmQgdW5uZWNlc3NhcnkNCj4gaW4gdGhlIGtl
cm5lbCAoYW5kIHdheSBiZXlvbmQgdGhlIHNjb3BlIG9mIHRoaXMgcGF0Y2gpLiBBcyBhbiBhc2lk
ZSAtIG15DQo+IGV4cGVyaWVuY2UgZnJvbSB0ZXN0aW5nIGlzIHRoYXQgdGhlcm1hbGQgd2lsbCBv
dmVycmlkZSB3aGF0IHRoZSBmaXJtd2FyZQ0KPiBpcyBkb2luZyBhbnl3YXkuDQoNCkknbSBhY3R1
YWxseSBpbiBhZ3JlZW1lbnQgaXQgaXMgcG90ZW50aWFsbHkgcXVpdGUgY29tcGxpY2F0ZWQgYW5k
IHNob3VsZG4ndCBiZSBpbg0KdGhpcyBzcGVjaWZpYyBwYXRjaC4gIEkgd2FzIGdvaW5nIHRvIHN1
Z2dlc3QgaXQgc2hvdWxkIGVpdGhlciBjb21lIGFzIG90aGVyDQpwYXRjaGVzLCBvciBwZXJoYXBz
IGluIGRvY3VtZW50YXRpb24gYWxvbmcgdGhlIGxpbmVzIG9mICJVc2VycyB1c2luZyB0aGlzIGlu
dGVyZmFjZQ0Kc2hvdWxkIG5vdCB1c2Ugb3RoZXIgdG9vbHMgdG8gbW9kaWZ5IFgsIFkgYW5kIFoi
LiAgTm8gbmVlZCB0byBtZW50aW9uIHRoZSBhY3R1YWwNCnRvb2xzLCBidXQgeW91IHNob3VsZCB0
cnkgdG8gaGVscCBwcmV2ZW50IHVzZXJzIHNob290aW5nIHRoZW1zZWx2ZXMgaW4gdGhlIGZvb3QN
CnVuaW50ZW50aW9uYWxseS4NCg0KPiANCj4gSSBjYW4gc2VlIHRoZSB2YWx1ZSBvZiBhZGRpbmcg
YSBmZWF0dXJlIHRvICpkaXNhYmxlKiB0aGUgTGVub3ZvIGZpcm13YXJlDQo+IGltcGxlbWVudGF0
aW9uIGFzIHRoYXQgZG9lc24ndCBjdXJyZW50bHkgZXhpc3QuIEkgd2lsbCB0YWxrIHRvIHRoZQ0K
PiBmaXJtd2FyZSB0ZWFtIGFuZCBzZWUgd2hhdCBjYW4gYmUgZG9uZSBhbmQgdGFrZSB0aGF0IG9u
IGFzIGEgc2VwYXJhdGUNCj4gdGFzay4gSWYgdGhlcmUncyBhIG1lY2hhbmlzbSB0byBkbyB0aGF0
IGFscmVhZHkgaW4gYSBzYWZlIHdheSB0aGVuIEknbGwNCj4gYWRkIHRoYXQgdG8gdGhpcy4NCg0K
VGhpcyBpcyBhY3R1YWxseSBldmVuIGJldHRlciB0byBtZS4gIEJhY2sgdG8gdGhlIEgvTS9MIGFw
cHJvYWNoIGlmIHlvdSBjYW4gaGF2ZQ0KYW4gZXh0cmEgb25lIGZvciAib2ZmIiB0aGVuIHVzZXJz
cGFjZSB0b29scyB0aGF0IHdhbnQgdG8gY29udHJvbCB0aGUgc2FtZSBsZXZlcnMNCmNhbiB0dXJu
IHRoaXMgb2ZmIHdoZW4gdGhleSBhcmUgdGFraW5nIGNvbnRyb2wuDQoNCg==
