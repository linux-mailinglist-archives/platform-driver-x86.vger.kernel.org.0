Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 836352500D7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Aug 2020 17:23:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726770AbgHXPXC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Aug 2020 11:23:02 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:29032 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727939AbgHXPV6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Aug 2020 11:21:58 -0400
Received: from pps.filterd (m0170396.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07OFCnXU012227;
        Mon, 24 Aug 2020 11:21:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=lY4v7iU703F48H/durzY48VlH9eE81bSmGxZ9TXn/RM=;
 b=bNcMMcMzvoECc+ayTH4cNUPSZniJccYypLX9qnu2qt7+7xvBzBy7ZAgM4g0hnzwlIDVf
 TwZ3VOY7xWRfNTKfu1uLAQxuBoH4xFkv0XSc599rT25O9UDc4mGedK8i9x8lfTCqqD/R
 FyGxP08CXiMFAsoC3zAzE1qRNL4wjjRm+rzsQHeTvIWidxwaHVk1nNGNOlbvNG2wnL2W
 w+DK4RHVE3pL8GLf/mP+kLaDu/uGCo19uTv8Wvh1lCNFvLCB+5h0lqcpOx+Z+y/hEncH
 xSv5VHm358CLGw0G9VQ3xochE44I/gwroL6vguKrgoc1XdvL/A1k0kYwpFisJyA4LUID eA== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 332y6ww563-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 24 Aug 2020 11:21:33 -0400
Received: from pps.filterd (m0090351.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07OFLTSc045111;
        Mon, 24 Aug 2020 11:21:32 -0400
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        by mx0b-00154901.pphosted.com with ESMTP id 3345rf8c90-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Aug 2020 11:21:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GiU2SmlCdnKz/xW6dQeIoSUCPYjeFWJkm8m43pmc1I+nAM1LxA9nIpEViTa9Gn2gIm14r2I+lww1qidnleImHKBcyI22OygQbd0bHBMlLwUUw2PG9zLKttvlwdHgk7B2sx/uW4SJJenvBiqZv/ZEOIBJArwZ/HSs0gc/C/jpaJey/tMv9uYrW48sPgSdsBYvE67SSescrpboMHTTDFAGmm0CfCmIVontcvGG360iuU+E7G82aiJJnu2yhZsIrDq/rZHjkAKtBSmM/POR4mkgjjjMgcoJqEDYCEtD9z5T2ibATvi+sYpMkgWu6WTdJXb66LegUSTHPgfJvlxHjcmeeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY4v7iU703F48H/durzY48VlH9eE81bSmGxZ9TXn/RM=;
 b=Dh6ePIswv6U7GRrfHGd5zBZIJ2y8gCbSnp9hyUB9qxvsTqKvwcMDP7ln+AwE9PyIlGVAVCCddoW+PITza/gSNQsDxelb+Wb8la94m7Op7NFibyhF8gA/YO6UZM1ZACw/HrRH8Pp9qtDouc3FJ0WlvbqbqoZlGY45E/ofzWORCappIS7yVkgn1La3ljZSps//3swi4FylW4LE2iXHGnCmyvQFTvzk4xIM6Ot53tfYtgbCDUKJmx+2xZKwx2oLFIq3juauhJsRITyg1M/eKQ1GhHpH0RmS3h++JaC9m4WMcz9ZHFehq8p/JekvmAupmz4INaREAM14GcT8ShB/NAwBLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lY4v7iU703F48H/durzY48VlH9eE81bSmGxZ9TXn/RM=;
 b=drJxGCeJJeSZfi7Du8pq2x867Ccy5zytVncsR66/6+HKjVK/N33RWPKE4DLDWRFzRBagNMPADCcibmbXt/ubDZdLfTTaL1iCiojpwIIU7BfhY9d1iEAyXZXnpdHrOpIvjfKJaq32ZEZifzpuQ49eSOMIGFdswEHMLu2MarQbQ4U=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB2716.namprd19.prod.outlook.com (2603:10b6:5:145::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Mon, 24 Aug
 2020 15:20:29 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3305.026; Mon, 24 Aug 2020
 15:20:29 +0000
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
Thread-Index: AQHWd+QBvbgdvM4ZREOC8jacDgPt5KlC7TcAgAAHfwCAAAZQ8IAAAi4AgAAB9yCAAFkHAIAECv6w
Date:   Mon, 24 Aug 2020 15:20:29 +0000
Message-ID: <DM6PR19MB26362A7F5A8749637EE8487EFA560@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
 <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <1806c4ec-6788-bcc7-7e09-8e5274d2b9d5@lenovo.com>
 <DM6PR19MB26369308415B8235B3C9997EFA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <9e0c14a9-3b24-4b64-6d9e-b312d28dfd44@lenovo.com>
 <DM6PR19MB263621A07F59D91C8E2F7205FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <52fc84b9-f87d-c91d-4d24-1db768c5c812@lenovo.com>
In-Reply-To: <52fc84b9-f87d-c91d-4d24-1db768c5c812@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-08-24T15:20:26.0779108Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=cdeac5e9-dadd-4229-95c3-963bc250438c;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 372fe41f-54db-4760-c063-08d848413c6f
x-ms-traffictypediagnostic: DM6PR19MB2716:
x-microsoft-antispam-prvs: <DM6PR19MB27168E808ED567CAFAAA4DA7FA560@DM6PR19MB2716.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gJ67O/kc/d+vMoOU7tZvlUCwSjKkqJi6yDzzqecDajnCq5YmO+ZRGvnfJRhrBN6T2jD0jlTF80fNxaID5iERWojYdDR7L6vkkUP2s7gypepkJNWaAMRozKazQdfZfkSBfjwrbKiDFbktpE44l9QTs9q/hf0NN+QtE8r3qYD0Xn2Tr06+uxBW8KZakLEe+6jFfnrzsKghoUp6ECzzg7/d2RMFRQrTW1bFES/KgWYJ0HyxYK//5SstOsBkCL4aI35muELYBrplIAdcGLpdchQw1kIFZ7OrnsZt36KVxA77FYoARUmJswwSByLpyjZH8epfEAHZgRtEPawDnD+9G+Hkew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(39860400002)(396003)(136003)(83380400001)(4326008)(76116006)(54906003)(478600001)(71200400001)(2906002)(66446008)(66556008)(9686003)(66946007)(8936002)(786003)(316002)(64756008)(8676002)(86362001)(66476007)(55016002)(6506007)(53546011)(52536014)(26005)(186003)(33656002)(5660300002)(7696005)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: BrajD5wv4QQHIcmG95ferr3IYQ9EaFP/qAS7Ku2JHcc2X2Ie1vrWEuNHzFf5x7sy9Zrnmz6r7Di0SSvy1KegFEghDqvkx3P91xpr1Wc6Cv1VbordG/IOEelM50SoMD1zb9VCBku81XKaOsWnDE8LrZ4H/IH4xc0BbSUx4blu6FJGf5nFC/X3leeuaz8mMBVXpKuqmanihtnunppNWWLxgAc3ZrSIOmIYZEhPjG+fmL8qOx8yrPMOH6VCp4X8V0I8alTMFqWO3UpbEOG1GGPAtFZiiBC8CtFGJ5zys8zpHuwYS9zyBhFoQoPm3qQ0ACTxromckLyUevHq/4DNovnVWPOQBr6Gyxlx5PZHeVVEJ2BaiwAKm1pO3e3R8Whofh3MM8yo+jBD4kZYurf3Lfa3I/eHlavc3r6B1cXTWKcI/lejhDKE5tG7MDBYGYEUUpF+U87u795IecfQpXIyXXmKO67+TvRoJROcRrH6N8t+XAOQsLxlIYRFutBYaIK1briCezTVn4CiS/maxReEBFDEGxdOrbo6vOrg6o7KnuslrKrp89OVCvRjstlY7yz+HepyjCZwLiyPa8nV4kr2VRqhSRa+/Djeo/rdSyotxGTueH1e06l5JQxN/9JvrQz75Fjysd044L/ScDAsXuCaUs5WnQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 372fe41f-54db-4760-c063-08d848413c6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Aug 2020 15:20:29.5206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zl2xNjPbUvCOY90Biy6jxN+vQZ+TFcTUijwW3l2UGwz9EFPFY0m2MTGOrnLCpajI0COYFlD5Uo3F6uo/kgcjCKkDx2hEcd2knIDQEiJl99k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB2716
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-24_12:2020-08-24,2020-08-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008240123
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008240123
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiBPbiA4LzIxLzIwMjAgNDo0MyBQTSwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOg0KPiA+PiAt
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLSBGcm9tOiBNYXJrIFBlYXJzb24NCj4gPj4gPG1hcmtw
ZWFyc29uQGxlbm92by5jb20+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDIxLCAyMDIwIDE1OjA2DQo+
ID4+DQo+ID4+IE9uIDgvMjEvMjAyMCA0OjAwIFBNLCBMaW1vbmNpZWxsbywgTWFyaW8gd3JvdGU6
IDxzbmlwPg0KPiA+Pj4+Pj4gKyArVGhlIHN5c2ZzIGVudHJ5IHByb3ZpZGVzIHRoZSBhYmlsaXR5
IHRvIHJldHVybiB0aGUNCj4gPj4+Pj4+IGN1cnJlbnQgc3RhdHVzIGFuZCB0byBzZXQgdGhlICtk
ZXNpcmVkIG1vZGUuIEZvciBleGFtcGxlOjoNCj4gPj4+Pj4+ICArICsgICAgICAgIGVjaG8gSCA+
DQo+ID4+Pj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vdGhpbmtwYWRfYWNwaS9keXRjX3BlcmZt
b2RlICsgZWNobyBNDQo+ID4+Pj4+Pj4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3RoaW5rcGFkX2Fj
cGkvZHl0Y19wZXJmbW9kZSArIGVjaG8NCj4gPj4+Pj4+IEwgPiAvc3lzL2RldmljZXMvcGxhdGZv
cm0vdGhpbmtwYWRfYWNwaS9keXRjX3BlcmZtb2RlICsNCj4gPj4+Pj4NCj4gPj4+Pj4gSSB3YXMg
dGhpbmtpbmcgYWJvdXQgdGhpcyBzb21lIG1vcmUsIGRvIHlvdSBhY3R1YWxseSB3YW50DQo+ID4+
Pj4+IGFub3RoZXIgbW9kZSB0aGF0ICJkaXNhYmxlcyIgdGhpcyBmZWF0dXJlPyAgIElFICJPIiB0
dXJucyBpdA0KPiA+Pj4+PiAgb2ZmIGFuIGNhbGxzIERZVENfRElTQUJMRV9DUUwuDQo+ID4+Pj4+
DQo+ID4+Pj4+IEZvciBleGFtcGxlIGlmIGEgdXNlciB3YW50ZWQgdG8gdGVzdCB0aGUgcmVjZW50
bHkgbGFuZGVkIGNvZGUNCj4gPj4+Pj4gaW4gdGhlcm1hbGQgMi4zIGFuZCBjb21wYXJlIHBlcmZv
cm1hbmNlIGJldHdlZW4gdGhlIHR3byBpdA0KPiA+Pj4+PiBzZWVtcyBsaWtlIHRoaXMgYW5kIHRo
YXQgIm1pZ2h0IiBmaWdodC4gQXMgYW4gb3V0c2lkZXINCj4gPj4+Pj4gbG9va2luZyBpbiAtIEkg
b2YgY291cnNlIG1heSBiZSB3cm9uZyB0b28gaGVyZS4NCj4gPj4+Pj4NCj4gPj4+Pj4gSWYgYXQg
c29tZSBwb2ludCBpbiB0aGUgZnV0dXJlIHRoZXJtYWxkIGRvZXMgYSBiZXR0ZXIgam9iDQo+ID4+
Pj4+IHRoYW4gdGhpcyBpbXBsZW1lbnRhdGlvbiB5b3UgbWlnaHQgYWxzbyB3YW50IGFuICJvdXQi
IHRvIGxldA0KPiA+Pj4+PiAgdGhlcm1hbGQgb3IgYW5vdGhlciBwaWVjZSBvZiB1c2VybGFuZCB0
dXJuIHRoaXMgb2ZmIGlmIGl0J3MNCj4gPj4+Pj4gIGluIHRoZSBwaWN0dXJlLg0KPiA+Pj4+Pg0K
PiA+Pj4+IEknbSBzdGlsbCBkaWdnaW5nIGludG8gdGhpcyBvbmUuIFJpZ2h0IG5vdyBJIGhhdmVu
J3QgZm91bmQgYQ0KPiA+Pj4+IGdvb2QgY2xlYW4gd2F5IG9mIGp1c3QgZGlzYWJsaW5nIHRoZSBm
aXJtd2FyZS4gQ3VycmVudGx5IHdoZW4NCj4gPj4+PiB0aGVybWFsZCBnb2VzIGluIGFuZCB0d2Vh
a3MgdGhlIENQVSBwb3dlciByZWdpc3RlcnMgaXQgaGFzIHRoZQ0KPiA+Pj4+ICBlZmZlY3Qgb2Yg
b3ZlcnJpZGluZyB0aGUgRlcgYW55d2F5IC0gYnV0IEkgYXBwcmVjaWF0ZSB0aGF0J3MNCj4gPj4+
PiBub3QgcXVpdGUgdGhlIHNhbWUgYXMgYWN0dWFsbHkgZG9pbmcgaXQgZXhwbGljaXRseS4NCj4g
Pj4+Pg0KPiA+Pj4NCj4gPj4+IFdoYXQgYWJvdXQgYSBtb2Rwcm9iZSBwYXJhbWV0ZXIgdG8gZGlz
YWJsZSBhdCBsZWFzdD8gIFRoYXQgd291bGQNCj4gPj4+ICBhdCBsZWFzdCBtYWtlIGl0IHByZXR0
eSBlYXN5IHRvIG1ha2UgYSBjaGFuZ2UsIHJlYm9vdCBhbmQNCj4gPj4+IGNvbXBhcmUgd2l0aCB0
aGVybWFsZCAob3Igb3RoZXIgc29mdHdhcmUpIHdpdGhvdXQgZGlzYWJsaW5nIHRoZQ0KPiA+Pj4g
cmVzdCBvZiB0aGUgZnVuY3Rpb25hbGl0eSBvZiB0aGUgdGhpbmtwYWRfYWNwaSBkcml2ZXIuDQo+
ID4+Pg0KPiA+PiBUaGUgcHJvYmxlbSBpcyBJIGRvbid0IGhhdmUgYSBnb29kIHdheSB0byBkaXNh
YmxlIHRoZSBmaXJtd2FyZQ0KPiA+PiAodGhhdCBJIGtub3cgb2YgeWV0KSBzbyBhIG1vZHByb2Jl
IHBhcmFtZXRlciB3b3VsZG4ndCByZWFsbHkgZG8NCj4gPj4gbXVjaC4gSSBndWVzcyBpdCBjb3Vs
ZCBza2lwIHByb3ZpZGluZyB0aGUgc3lzZnMgZW50cnkgcG9pbnRzIC0gYnV0DQo+ID4+ICB0aGUg
Rlcgd2lsbCBzdGlsbCBiZSB0aGVyZSBkb2luZyBpdCdzIHRoaW5nLCBzbyBJJ20gbm90IHN1cmUg
SSBzZWUNCj4gPj4gIHRoZSBiZW5lZml0IG9mIHRoYXQuIEF0IGxlYXN0IHRoZSBzeXNmcyBlbnRy
eSBwb2ludCBnaXZlcyBhIGJpdA0KPiA+PiBtb3JlIGluc2lnaHQgaW50byB3aGF0IGlzIGdvaW5n
IG9uLiBMZXQgbWUga25vdyBpZiBJJ20gbWlzc2luZw0KPiA+PiBzb21ldGhpbmcgb2J2aW91cy4N
Cj4gPj4NCj4gPg0KPiA+IE9oIHNvIGl0J3Mgbm90IGFjdHVhbGx5IHRoZSBkcml2ZXIgbG9hZGlu
ZyB0ZWxscyB0aGUgZmlybXdhcmUgaXQncw0KPiA+IHN1cHBvc2VkIHRvIHdvcmsgdGhpcyB3YXku
ICBUaGUgZmlybXdhcmUgYWN0dWFsbHkgZGV0ZWN0cyAiSSdtDQo+ID4gcnVubmluZyBvbiBMaW51
eCwgc28gSSdsbCBkbyB0aGlzIGRpZmZlcmVudGx5Ij8NCj4gPg0KPiBSaWdodC4gVGhpcyBwYXRj
aCBpcyBqdXN0IHByb3ZpZGluZyBhIG1vcmUgZnJpZW5kbHkgaW50ZXJmYWNlIHNvIHVzZXINCj4g
c3BhY2UgY2FuIHNlZSB3aGF0IGlzIGdvaW5nIG9uIGFuZCBiZSBhYmxlIHRvIGRvIGNvbnRyb2wg
b2YgdGhlDQo+IGRpZmZlcmVudCBtb2RlcyB3aXRob3V0IHRoZSBuZWVkIGZvciBob3RrZXlzLg0K
PiANCj4gQWZyYWlkIEkgZG9uJ3QgaGF2ZSBtdWNoIGluc2lnaHQgaW50byB0aGUgbml0dHkgZ3Jp
dHR5IGRldGFpbHMgb2YNCj4gZXhhY3RseSBob3cgdGhhdCB3b3JrcyAtIEkgYmVsaWV2ZSBpdCdz
IHJlbGF0ZWQgdG8gZGV0ZWN0aW5nIHRoZSB1c2Ugb2YNCj4gRFBURiBidXQgdGhlIGRldGFpbHMg
YXJlbid0IHNoYXJlZCB3aXRoIG1lIGJlY2F1c2Ugb2YgTkRBJ3MuIEFzIGENCj4gdGhvdWdodCBp
dCdzIHF1aXRlIHBvc3NpYmxlIChwcm9iYWJsZT8pIHRoYXQgaWYgdGhlcm1hbGQgaXMgdXNpbmcg
RFBURg0KPiB0aGUgZmlybXdhcmUgd2lsbCBhdXRvbWF0aWNhbGx5IGRpc2FibGUgaXRzZWxmLiBQ
cm92aW5nIHRoYXQgbWlnaHQgYmUNCj4gdHJpY2t5IC0gSSdsbCBzZWUgaWYgdGhlIGZpcm13YXJl
IHRlYW0gaGF2ZSBhbnkgaWRlYXMuDQo+IA0KDQpSaWdodCAtIGl0J3MgYSByZXZlcnNlIGVuZ2lu
ZWVyZWQgaW1wbGVtZW50YXRpb24gZG9uZSBpbiB0aGVybWFsZCBhbmQgdGhlcmUNCmFyZSBzdGls
bCBzb21lIG1pc3NpbmcgaXRlbXMuICBTbyB5b3VyIGNvbW1lbnQgbWFrZXMgcGVyZmVjdCBzZW5z
ZSB0byBtZSBub3csDQphbmQgaWYvd2hlbiB0aG9zZSBvdGhlciB0aGluZ3MgYXJlIGFkZGVkIHRo
aXMgbWF5IGNoYW5nZSBhbmQgaXQgd2lsbCBtYWtlDQpzZW5zZSB0byBvZmZlciBhIHdheSB0byB0
dXJuIHRoaXMgb2ZmIGF0IHRoYXQgdGltZS4NCg0K
