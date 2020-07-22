Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA3922A042
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jul 2020 21:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgGVTrJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jul 2020 15:47:09 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:36230 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726157AbgGVTrH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jul 2020 15:47:07 -0400
Received: from pps.filterd (m0170390.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06MJfcat009980;
        Wed, 22 Jul 2020 15:46:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=cQtrnplGg+Ow5+tF/vDqp1wtSCpcFCU9+x8MGIrFj0Q=;
 b=fu2osj1CbDACtMBZADVXj99zx0p4KV0257fF1PbNUdMjTisnIq7omlmqnzWVTSJwkuAi
 YMeQukxGMlqCjiEL5DcfmPahVTlzHNSBSYZXvwGDJrPAUQ7sipeNNL37VVq7pEVIzI9u
 jvbtbAOELc9WwECJ0M4knfxqkyZxeWHLcUl+JURjpKQAHNwWZVdBCTLYcPE8M+653QYL
 aHdSkqFrMVcCd+vYSWH/B97V39heZTgsRkST95t801EGNtjAHADz/AaNMPZfwK9Nizvg
 nB1bJTKysIfrKlNzypDIQmudF3ZIv+U+OBkDyRdWOSX9ddsy1GiZLbAJiFR1GH+o4GGp tw== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 32bv54pged-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Jul 2020 15:46:47 -0400
Received: from pps.filterd (m0134746.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06MJhLX8132466;
        Wed, 22 Jul 2020 15:46:47 -0400
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
        by mx0a-00154901.pphosted.com with ESMTP id 32eugw0c6c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 22 Jul 2020 15:46:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jvl75A7bJiObYtwzMcH2wV2vmc7FSchQmMMT1aeWUHrHoz/jh7bcAKG8jtsAbG49GR7tze7N54CB7Ajb9T6Ac4rJATMDQeWrxPPP8pDhtBeKJ7hI/M4KHZG6ah7Gdn2WacDQdwXj7JNVfkF6sq/3tysTpWWgFmRz68b/yBQmYpkzpo4vE+JWZ1aCXEeZkzUSAzC2+ocn+KFkesADffUxZRfcG80/XYhCg8BHVA8LdSOn1dSUAeLIE40EElXdApDkcRet/S1S2b+1/kSyhL1ksa3Lm3HDbAvZgTzjejrC0ucZHdnkkMlZULugOelpCrNU144hRDi7pwnAXO27KauA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQtrnplGg+Ow5+tF/vDqp1wtSCpcFCU9+x8MGIrFj0Q=;
 b=h6KCJq+Dh17efxSikzTBhkKZ1afICmqpPNz6GfAWn2JCy4eNN6A4XdLQl3/YYtMHL6MQMWV6NbLARYh82HacLu4E0oJpOOzgWrd4ofq2cuDTTalgoBetqPBDkt0CKdq3Q1lNh1KI0PXeUpDQOgFsGg7KToOL+TeHtXIB5Xz7NryZq/ZUnQkldsxSpENnGv1QeOav6kdnSTo+bangWjSS0i0VRt+GpLaKDmhWRuJHzX5z/sA+8uKzcFPKiTNEfqEP70zbVRnbWlnV2iZWvI+dOTarCYl5wLGcQ/AzP5NG23iNoLBmnC49ie6J5P7dO1k49Ua+148QBRLxAHIuL8pmqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQtrnplGg+Ow5+tF/vDqp1wtSCpcFCU9+x8MGIrFj0Q=;
 b=eJ/3W4AKjXqDs88SR4mVeOuMiap0nYXfxHv7RTiEntbxEHJGJPowF/v3AOqJTgRdd+I0VO3tgVVXaSGcKjDkHbxuiU9f9kSQZK8fIRJG00VAXpIzOmtEOgEcE72+ejJiBsfaAeEl3qpCpvm8xlODbsIouKu/VOzClV43TnTXsLs=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB3002.namprd19.prod.outlook.com (2603:10b6:5:15e::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Wed, 22 Jul
 2020 19:46:45 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3195.022; Wed, 22 Jul 2020
 19:46:45 +0000
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
Thread-Index: AQHWYEtB2AZ16m+5BkiCkmlUDRcurKkT57IggAAUiICAAACUUA==
Date:   Wed, 22 Jul 2020 19:46:45 +0000
Message-ID: <DM6PR19MB26360DE8FCA56BC132644F98FA790@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200722171108.65185-1-markpearson@lenovo.com>
 <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b79e0359-536d-f496-a01e-fe4c4b7796cc@lenovo.com>
In-Reply-To: <b79e0359-536d-f496-a01e-fe4c4b7796cc@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-07-22T19:44:02.7199229Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=1e81fbb1-7064-450d-aa62-65c1eb640132;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6a3e20c-040b-4002-3a79-08d82e77f714
x-ms-traffictypediagnostic: DM6PR19MB3002:
x-microsoft-antispam-prvs: <DM6PR19MB3002E9DEF6D8D976A8D2238BFA790@DM6PR19MB3002.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zKkgtuOr1DJyG2+SAbYVA74VKr1Tsq6yvttXcZ5uGFjPELs+WhprXQ2wvtEZR5APoh+wCc39e0PKI1cgMC4CmT5hFpFv0hK9UT54tMZjeqJBJjo8RhzMgQZ1FUDlV5uBi5Reqna5r6RasArVENOK2DrW1EZrQTeGzkJreM6k039aoydjBr/HT4OLMsogHEbO3WygsUpKweBF9PW60cL3mq9FQzcF+5VztnO2+p6diPvJ6gNPrQe9UIXIAZX0gr3NcLEdwNvE8vhJKUynuxNlSaNp72lvF1/V+/ZMdVMJlbRVu4TZjP6jwl2k08N+foLulX+zaLA8DNdFkxeNm6bNAg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(346002)(366004)(396003)(39860400002)(9686003)(66446008)(66476007)(52536014)(64756008)(66556008)(66946007)(76116006)(55016002)(186003)(26005)(5660300002)(2906002)(786003)(54906003)(33656002)(86362001)(71200400001)(478600001)(6506007)(53546011)(83380400001)(8936002)(4326008)(316002)(6916009)(7696005)(8676002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: s0dg1mFMZpA14LZe5iQSywcIhDJCp5CU5jB21r+3yGO/akTiOBqEUu+mrhTBM8yvJhG6az2WfDUfjksdZ8Awf9isapRQ6GwG2mapCoaBgqx2qcQTeabdvo3KL8Xw+dfQUUvpnDvu/595/hHCq87bV2C6nk4zlXNVvwle8/PugATMcnAlfSoSamKDhl4MAGJWP7mV1dwLqlKImFVjPdRFV0ABm13OZvCbxLt8zIxpMHz2uSum5y1irAwtN5sXfZAtcY0JBzwZ3TnUBpGjvN45ei+eMqO9ZXtNKjR8sQG84gMomcEOLVUfcppTcbewdX49qfrWxkgy93tdFiTzkpzkMkSM20aaFMD109EO/ZXjoKDEO+D5cCB3VDcd7kR8KR0YAcOnwikbHyBpTDxmodEv4GFPerAnVUmh4absimiNF366mExZhkbX4GFZ4ZtDV3XqNu8BjcyyIS+2HyFCqme+1FEiBUbRZBnAbbVLlhZWlXDZ/x0LSOFT1lM7PmR7LB1Z
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6a3e20c-040b-4002-3a79-08d82e77f714
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2020 19:46:45.2779
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZRXxFGEn0H2aK9Qc6xfn/h3SkraucQYrpG8Jx2yCkajsRd3hm8T0xsWPTXeVDEykfhFaJTKWb8lBP5SMWVfpAYGLJsCIJ/CEhoa9/u/wVe8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3002
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_13:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220124
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007220124
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiANCj4gT24gNy8yMi8yMDIwIDI6NDYgUE0sIExpbW9uY2llbGxvLCBNYXJpbyB3cm90ZToNCj4g
PHNuaXA+DQo+ID4+DQo+ID4+ICtEWVRDIFRoZXJtYWwgbW9kZSBzdGF0dXMgYW5kIGNvbnRyb2wN
Cj4gPj4gKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+PiArDQo+ID4+
ICtzeXNmczogZHl0Y19wZXJmbW9kZQ0KPiA+PiArDQo+ID4+ICtMZW5vdm8gVGhpbmtwYWQgcGxh
dGZvcm1zIHdpdGggRFlUQyB2ZXJzaW9uIDUgYW5kIG5ld2VyIGhhdmUgZW5oYW5jZWQNCj4gPj4g
ZmlybXdhcmUgdG8NCj4gPj4gK3Byb3ZpZGUgaW1wcm92ZWQgcGVyZm9ybWFuY2UgY29udHJvbC4N
Cj4gPj4gKw0KPiA+PiArVGhlIGZpcm13YXJlIGNhbiBiZSBjb250cm9sbGVkIGJ5IGhvdGtleXMg
KEZOK0gsIEZOK00sIEZOK0wpIHRvIHN3aXRjaCB0aGUNCj4gPj4gK29wZXJhdGluZyBtb2RlIGJl
dHdlZW4gdGhyZWUgZGlmZmVyZW50IG1vZGVzLiBUaGlzIHN5c2ZzIG5vZGUgcHJvdmlkZSBhDQo+
ID4+IGJldHRlcg0KPiA+PiAraW50ZXJmYWNlIGZvciB1c2VyIHNwYWNlIHRvIHVzZQ0KPiA+DQo+
ID4gU28gaXMgdXNlcnNwYWNlIGFsc28gbm90aWZpZWQgaW4gc29tZSB3YXkgd2hlbiB5b3UgdXNl
IHRoZSBob3RrZXkgdG8gY2hhbmdlLA0KPiBvcg0KPiA+IGlzIHRoZSBldmVudCB1c3VycGVkIGJ5
IHRoZSBFQz8gIElzIHRoaXMgYnkgdGhlIGV2ZW50DQo+IFRQX0hLRVlfRVZfVEhNX0NTTV9DT01Q
TEVURUQ/DQo+ID4NCj4gSSBoYXZlbid0IGFkZGVkIHRoYXQgeWV0IC0gbXkgYWltIHdpdGggdGhp
cyBwYXRjaCB3YXMgdG8gZ2V0IHRoZSBzeXNmcw0KPiBBUEkgYXZhaWxhYmxlLiBJJ2xsIGxvb2sg
YXQgYWRkaW5nIHRoZSBub3RpZmljYXRpb24uDQoNClllYWggSSBqdXN0IHRoaW5rIHRvdWNoIHRo
ZSBrZXJuZWwvdXNlciBBQkkgYXMgYXRvbWljYWxseSBhcyBwb3NzaWJsZQ0KdG8gYXZvaWQgdXNl
cnNwYWNlIHRvIGhhdmUgdG8ga25vdyA1LjkgYmVoYXZlcyB0aGlzIHdheSBhbmQgeW91IG5lZWQg
dG8gcG9sbCBmb3IgYSB2YWx1ZQ0KYW5kIDUuMTAgeW91IGdldCBhIG5vdGlmaWNhdGlvbiBldGMu
DQoNCj4gDQo+ID4gWW91IG1pZ2h0IGNvbnNpZGVyIHRvIG1lbnRpb24gd2hhdCBvdGhlciBpbnRl
cmZhY2VzIHdpbGwgY29uZmxpY3Qgd2l0aCB0aGlzDQo+ID4gYW5kIGRvY3VtZW50IHRoZW0gYW5k
L29yIGFydGlmaWNpYWxseSBibG9jayB0aGVtIHdoZW4gdGhpcyBpcyBsb2FkZWQgdG8NCj4gcHJl
dmVudA0KPiA+IHN1Y2ggYSBjb25mbGljdC4NCj4gSSdtIGFmcmFpZCBJIGRvbid0IGtub3cgd2hh
dCBvdGhlciBpbnRlcmZhY2Ugd2lsbCBiZSBjb25mbGljdGVkIHdpdGguIElzDQo+IHRoZXJlIGFu
eXRoaW5nIGluIHBhcnRpY3VsYXIgSSBzaG91bGQgYmUgbG9va2luZyBmb3I/IFdoYXQgZGlkIHlv
dSBoYXZlDQo+IGluIG1pbmQ/DQoNClNpbmNlIGl0J3Mgbm90IG1lbnRpb25lZCBJIGNhbiBvbmx5
IGd1ZXNzIHlvdXIgZmlybXdhcmUgaW1wbGVtZW50YXRpb24gYXNzb2NpYXRlZA0Kd2l0aCB0aGlz
IGNvZGUuICBJIHdvdWxkIHRoaW5rIGZvciBleGFtcGxlIHRoYXQgdG91Y2hpbmcgc29tZSBQTHgg
cmVsYXRlZCBNU1Igb3INCnBvc3NpYmx5IFJBUEwgaW50ZXJmYWNlIG1pZ2h0IGNhdXNlIHVuZXhw
ZWN0ZWQgYmVoYXZpb3JzLg0KDQpBc3N1bWluZyB0aGF0J3MgcmlnaHQga2VybmVsIGxvY2tkb3du
IG1pZ2h0IHByZXZlbnQgc29tZSBvZiB0aGUgTVNSLCBidXQgaWYgeW91IHJlYWxseQ0Kd2FudCB1
c2VyIGZ1bGx5IGluIGNvbnRyb2wgb2YgdGhpcyBkZWNpc2lvbiBieSBvbmUga25vYiwgeW91IHNo
b3VsZG4ndCBsZXQgY29tbW9uDQp1c2Vyc3BhY2UgdG9vbHMgbGlrZSB0aGVybWFsZCwgdHVuZWQs
IHRscCBvciB0aGUgbGlrZSB0b3VjaCB0aGUgcmVsYXRlZCBvYmplY3RzLg0KDQo+IA0KPiBUaGUg
ZmlybXdhcmUgaXMgb3BlcmF0aW5nIGJ5IGRlZmF1bHQgYW5kIHRoaXMgcGF0Y2ggaXMganVzdCBw
cm92aWRpbmcNCj4gdXNlciBzcGFjZSB3aXRoIGEgd2F5IG9mIGRldGVybWluaW5nIHRoZSBjdXJy
ZW50IG1vZGUgYW5kIGNoYW5naW5nIGl0IGJ5DQo+IGFuIGFsdGVybmF0ZSBtZWNoYW5pc20gdGhh
biBob3RrZXlzIChJIGtub3cgc29tZSBwZW9wbGUgZGlzbGlrZSB0aGUNCj4gaG90a2V5cy4uLikN
Cg0KSW4gd2hpY2ggY2FzZSBpZiB0aGUgZmlybXdhcmUgcHJlZmVyZW5jZSBpcyB0aGF0IGl0J3Mg
dXNlciBjb250cm9sLCBJIHRoaW5rIGFsbA0KdGhlIG1vcmUgcmVhc29uIHRvIGJsb2NrIG91dCB0
aG9zZSBvdGhlciB0aGluZ3Mgd2hpbGUgb2ZmZXJpbmcgdGhpcyBpbnRlcmZhY2UuDQoNCj4gDQo+
ID4NCj4gPHNuaXA+DQo+ID4+ICsNCj4gPj4gK1RoZSBzeXNmcyBlbnRyeSBwcm92aWRlcyB0aGUg
YWJpbGl0eSB0byByZXR1cm4gdGhlIGN1cnJlbnQgc3RhdHVzIGFuZCB0bw0KPiBzZXQNCj4gPj4g
dGhlDQo+ID4+ICtkZXNpcmVkIG1vZGUuIEZvciBleGFtcGxlOjoNCj4gPj4gKw0KPiA+PiArICAg
ICAgICBlY2hvIEggPiAvc3lzL2RldmljZXMvcGxhdGZvcm0vdGhpbmtwYWRfYWNwaS9keXRjX3Bl
cmZtb2RlDQo+ID4+ICsgICAgICAgIGVjaG8gTSA+IC9zeXMvZGV2aWNlcy9wbGF0Zm9ybS90aGlu
a3BhZF9hY3BpL2R5dGNfcGVyZm1vZGUNCj4gPj4gKyAgICAgICAgZWNobyBMID4gL3N5cy9kZXZp
Y2VzL3BsYXRmb3JtL3RoaW5rcGFkX2FjcGkvZHl0Y19wZXJmbW9kZQ0KPiA+DQo+ID4gRG9lc24n
dCB0aGlzIG5lZWQgQUJJIGRvY3VtZW50YXRpb24gc3VibWl0dGVkIGFzIHBhcnQgb2YgdGhlIHBh
dGNoPw0KPiBPSyAtIEknbGwgbmVlZCBzb21lIGhlbHAgaGVyZSBhcyBJJ20gbm90IHN1cmUgd2hh
dCBJIG1pc3NlZC4gSXNuJ3QgdGhhdA0KPiB3aGF0IHRoaXMgcGFydCBvZiB0aGUgcGF0Y2ggaXMg
Y292ZXJpbmc/IElmIHlvdSBjYW4gZ2l2ZSBtZSBzb21lDQo+IHBvaW50ZXJzIGZvciB3aGF0IEkg
c2hvdWxkIGJlIHB1dHRpbmcgd2hlcmUgSSdsbCBkbyB0aGF0Lg0KDQpJIHRoaW5rIGl0J3MgY29t
bW9uIHRvIGRvY3VtZW50IGhvdyB5b3VyIHN5c2ZzIGF0dHJpYnV0ZXMgd29yayBpbiBhIGZpbGUg
aW4NCkRvY3VtZW50YXRpb24vQUJJL3Rlc3RpbmcuICBZb3UgY2FuIGxvb2sgYXQgdGhlIGZvcm1h
dCBmb3Igc29tZSBvdGhlcnMNCmZvciBleGFtcGxlcy4NCg0KPiA+DQo+IDxzbmlwPg0KPiANCj4g
Pj4gKw0KPiA+PiArCWlmIChwZXJmbW9kZSA9PSBEWVRDX01PREVfQkFMQU5DRSkgew0KPiA+PiAr
CQkvKiBUbyBnZXQgYmFjayB0byBiYWxhbmNlIG1vZGUgd2UganVzdCBpc3N1ZSBhIHJlc2V0IGNv
bW1hbmQgKi8NCj4gPj4gKwkJZXJyID0gZHl0Y19jb21tYW5kKERZVENfQ01EX1JFU0VULCAmb3V0
cHV0KTsNCj4gPj4gKwkJaWYgKGVycikNCj4gPj4gKwkJCXJldHVybiBlcnI7DQo+ID4+ICsJfSBl
bHNlIHsNCj4gPj4gKwkJLyogRGV0ZXJtaW5lIGlmIHdlIGFyZSBpbiBDUUwgbW9kZS4gVGhpcyBh
bHRlcnMgdGhlIGNvbW1hbmRzIHdlIGRvDQo+ID4+ICovDQo+ID4+ICsJCWVyciA9IGR5dGNfcGVy
Zm1vZGVfZ2V0KCZjdXJfcGVyZm1vZGUsICZjdXJfZnVuY21vZGUpOw0KPiA+PiArCQlpZiAoZXJy
KQ0KPiA+PiArCQkJcmV0dXJuIGVycjsNCj4gPj4gKw0KPiA+PiArCQlpZiAoY3VyX2Z1bmNtb2Rl
ID09IERZVENfRlVOQ1RJT05fQ1FMKSB7DQo+ID4+ICsJCQkvKiBUbyBzZXQgdGhlIG1vZGUgd2Ug
bmVlZCB0byBkaXNhYmxlIENRTCBmaXJzdCovDQo+ID4+ICsJCQllcnIgPSBkeXRjX2NvbW1hbmQo
MHgwMDBGMTAwMSAvKkRpc2FibGUgQ1FMKi8sICZvdXRwdXQpOw0KPiA+DQo+ID4gV2h5IG5vdCBw
dXQgMHgwMDBGMTAwMSBhbmQgMHgwMDFGMTAwMSBhcyBkZWZpbmVzIGF0IHRoZSB0b3A/DQo+IEZh
aXIgcG9pbnQgLSBJIHdpbGwgZml4IHRoYXQuDQo+IA0KPiA+DQo+IDxzbmlwPg0KPiANCj4gPj4g
Kw0KPiA+PiArCXN3aXRjaCAocGVyZm1vZGUpIHsNCj4gPj4gKwljYXNlIERZVENfTU9ERV9QRVJG
T1JNOg0KPiA+PiArCQkvKiBIaWdoIHBlcmZvcm1hbmNlIGlzIG9ubHkgYXZhaWxhYmxlIGluIGRl
c2ttb2RlICovDQo+ID4+ICsJCWlmIChmdW5jbW9kZSA9PSBEWVRDX0ZVTkNUSU9OX0NRTCkNCj4g
Pj4gKwkJCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIk1lZGl1bSAoUmVkdWNlZCBh
cyBsYXBtb2RlDQo+ID4+IGFjdGl2ZSlcbiIpOw0KPiA+PiArCQllbHNlDQo+ID4+ICsJCQlyZXR1
cm4gc25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJIaWdoXG4iKTsNCj4gPj4gKwljYXNlIERZVENf
TU9ERV9RVUlFVDoNCj4gPj4gKwkJcmV0dXJuIHNucHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiTG93
XG4iKTsNCj4gPj4gKwljYXNlIERZVENfTU9ERV9CQUxBTkNFOg0KPiA+PiArCQlyZXR1cm4gc25w
cmludGYoYnVmLCBQQUdFX1NJWkUsICJNZWRpdW1cbiIpOw0KPiA+PiArCWRlZmF1bHQ6DQo+ID4+
ICsJCXJldHVybiBzbnByaW50ZihidWYsIFBBR0VfU0laRSwgIlVua25vd24gKCVkKVxuIiwgcGVy
Zm1vZGUpOw0KPiA+PiArCX0NCj4gPj4gK30NCj4gPg0KPiA+IEkgdGhpbmsgaXQncyBwcmV0dHkg
Y29uZnVzaW5nIHRoYXQgeW91IHdyaXRlICJIL00vTCIgaW50byB0aGlzIGZpbGUsIGJ1dCB5b3UN
Cj4gPiBnZXQgYmFjayBhIGZ1bGwgc3RyaW5nLg0KPiBUaGUgbWFpbiByZWFzb24gaGVyZSBmb3Ig
dGhlIHN0cmluZyBpcyB0aGUgbmVlZCB0byBsZXQgdGhlIHVzZXIga25vdw0KPiB0aGV5IGFyZSBv
cGVyYXRpbmcgaW4gbWVkaXVtIG1vZGUgZXZlbiB0aG91Z2ggaGlnaCBoYXMgYmVlbiBjb25maWd1
cmVkIC0NCj4gYmVjYXVzZSB0aGUgZGV2aWNlIGlzIG9uIHRoZWlyIGxhcC4NCj4gTXkgdGhpbmtp
bmcgd2FzIHlvdSBjYW4gcGFyc2UgdGhlIGZpcnN0IGxldHRlciB0byBnZXQgSC9NL0wgYnV0IG1v
cmUNCj4gaW5mb3JtYXRpb24gaXMgYXZhaWxhYmxlIGZvciB0aGUgc3VidGxldGllcy4NCj4gSSBj
b25zaWRlcmVkIGFub3RoZXIgbGV0dGVyIGJ1dCBjb3VsZG4ndCBkZXRlcm1pbmUgc29tZXRoaW5n
IHRoYXQgd2FzDQo+IG9idmlvdXMgdG8gYSB1c2VyIChMb3dlciBjYXNlICdoJyBpcyBteSBiZXN0
IGNhbmRpZGF0ZT8pIGFuZCBkZWNpZGVkIGENCj4gc3RyaW5nIHdhcyBuaWNlci4NCj4gDQo+IEkn
ZCBhcHByZWNpYXRlIGlucHV0IGZyb20gb3RoZXJzIGFzIHRvIHRoZSBiZXN0IHRoaW5nIHRvIHBy
b3ZpZGUgaGVyZS4NCg0KTXkgb3duIHBlcnNvbmFsIG9waW5pb24gKGFuZCB0aGVyZSBtYXkgYmUg
b3RoZXJzIHRoYXQgb2ZmZXIgZGlmZmVyZW50IHZpZXcNCnNvIGRvbid0IHRha2UgaXQgYXV0aG9y
aXRhdGl2ZSk6DQoNCklmIHlvdSdyZSBvZmZlcmluZyBIaWdoL01lZGl1bS9Mb3csIHlvdSBzaG91
bGQgYWNjZXB0IGFuIGlucHV0IG9mIEhpZ2gvTWVkaXVtL0xvdy4NCklmIHlvdSBvZmZlciBIL00v
TCB5b3Ugc2hvdWxkIGFjY2VwdCBIL00vTC4NCg0KQSBnb29kIHdheSB0byBpbmRpY2F0ZSB0aGUg
cmVkdWNlZCBtb2RlIHdvdWxkIGJlIHRvIGFkZCBhbiBhc3RlcmlzayBmb3IgbWVkaXVtLg0KU28g
aXQgY291bGQgYmU6DQpXcml0ZTogSC9NL0wNClJlYWQ6IEgvTSovTS9MDQoNClRoZSBhY3R1YWwg
ZGVjb2Rpbmcgb2YgdGhlIGluZm9ybWF0aW9uIGNhbiBiZSBwbGFjZWQgaW4gdGhhdCBEb2N1bWVu
dGF0aW9uIGZpbGUNCkkgbWVudGlvbmVkIGFib3ZlLiAgSW4gZ2VuZXJhbCBhIHVzZXJzcGFjZSB0
b29sIHdpbGwgYmUgbWFraW5nIHRoaXMgcHJldHR5IGFuZA0KdHJhbnNsYXRlZCBJIHdvdWxkIGd1
ZXNzLCBzbyBubyBuZWVkIHRvIGRvIEhpZ2ggdmVyc3VzIGhpZ2ggb3IgRm9vIChiYXIpIHdoZW4N
Cml0IGNvdWxkIGJlIEZvbyoNCg0KPiANCj4gPg0KPiA+PiArDQo+ID4+ICtzdGF0aWMgc3NpemVf
dCBkeXRjX3BlcmZtb2RlX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPj4gKwkJCQkgICBz
dHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gPj4gKwkJCQkgICBjb25zdCBjaGFyICpi
dWYsIHNpemVfdCBjb3VudCkNCj4gPj4gK3sNCj4gPj4gKwlpbnQgZXJyOw0KPiA+PiArDQo+ID4+
ICsJc3dpdGNoIChidWZbMF0pIHsNCj4gPj4gKwljYXNlICdsJzoNCj4gPj4gKwljYXNlICdMJzoN
Cj4gPj4gKwkJZXJyID0gZHl0Y19wZXJmbW9kZV9zZXQoRFlUQ19NT0RFX1FVSUVUKTsNCj4gPj4g
KwkJYnJlYWs7DQo+ID4+ICsJY2FzZSAnbSc6DQo+ID4+ICsJY2FzZSAnTSc6DQo+ID4+ICsJCWVy
ciA9IGR5dGNfcGVyZm1vZGVfc2V0KERZVENfTU9ERV9CQUxBTkNFKTsNCj4gPj4gKwkJYnJlYWs7
DQo+ID4+ICsJY2FzZSAnaCc6DQo+ID4+ICsJY2FzZSAnSCc6DQo+ID4+ICsJCWVyciA9IGR5dGNf
cGVyZm1vZGVfc2V0KERZVENfTU9ERV9QRVJGT1JNKTsNCj4gPj4gKwkJYnJlYWs7DQo+ID4+ICsJ
ZGVmYXVsdDoNCj4gPj4gKwkJZXJyID0gLUVJTlZBTDsNCj4gPj4gKwkJcHJfZXJyKCJVbmtub3du
IG9wZXJhdGluZyBtb2RlLiBJZ25vcmluZ1xuIik7DQo+ID4NCj4gPiBTaG91bGRuJ3QgdGhpcyBi
ZSBkZXZfZXJyPw0KPiBBY2sgLSBJIHdpbGwgY29ycmVjdA0KPiANCj4gPHNuaXA+DQo+ID4+DQo+
ID4+ICsJLyogQ2hlY2sgRFlUQyBpcyBlbmFibGVkIGFuZCBzdXBwb3J0cyBtb2RlIHNldHRpbmcg
Ki8NCj4gPj4gKwlkeXRjX21vZGVfYXZhaWxhYmxlID0gZmFsc2U7DQo+ID4+ICsJaWYgKG91dHB1
dCAmIEJJVChEWVRDX1FVRVJZX0VOQUJMRV9CSVQpKSB7DQo+ID4+ICsJCS8qIE9ubHkgRFlUQyB2
NS4wIGFuZCBsYXRlciBoYXMgdGhpcyBmZWF0dXJlLiAqLw0KPiA+PiArCQlpbnQgZHl0Y192ZXJz
aW9uOw0KPiA+PiArDQo+ID4+ICsJCWR5dGNfdmVyc2lvbiA9IChvdXRwdXQgPj4gRFlUQ19RVUVS
WV9SRVZfQklUKSAmIDB4RjsNCj4gPj4gKwkJaWYgKGR5dGNfdmVyc2lvbiA+PSA1KSB7DQo+ID4+
ICsJCQlwcl9pbmZvKCJEWVRDIHRoZXJtYWwgbW9kZSBjb25maWd1cmF0aW9uIGF2YWlsYWJsZVxu
Iik7DQo+ID4NCj4gPiBJIHdvdWxkIGFyZ3VlIHRoaXMgaXNuJ3QgdXNlZnVsIHRvIG1vc3QgcGVv
cGxlLg0KPiA+IDEpIFlvdSBzaG91bGQgZGVjcmVhc2UgdGhpcyB0byBkZWJ1ZyBmb3IgdXNlIHdp
dGggZHluYW1pYyBkZWJ1Z2dpbmcNCj4gPiAyKSBPdXRwdXQgaW4gdGhlIGxvZyB3aGF0IGludGVn
ZXIgdmFsdWUgeW91IHJldHVybmVkIGJhY2sgaW4gY2FzZSBvZiBhIG5lZWQNCj4gPiB0byBpZGVu
dGlmeSBmdXR1cmUgZmlybXdhcmUgYnVncy4NCj4gQWdyZWVkIG9uIGJvdGggZnJvbnRzLiBJIHdp
bGwgZml4Lg0KDQpTaW1pbGFyIHRvIHRoZSBwcl9lcnIgdnMgZGV2X2VyciwgbWFrZSBzdXJlIHlv
dSB1c2UgdGhlIGRldl9kYmcgaGVyZSBpbnN0ZWFkIG9mDQpwcl9kYmcuDQoNCj4gDQo+ID4NCj4g
Pj4gKwkJCWR5dGNfbW9kZV9hdmFpbGFibGUgPSB0cnVlOw0KPiA+DQo+ID4gSSB0aGluayB5b3Ug
c2hvdWxkbid0IHNldCB0aGlzIGZsYWcgdW50aWwgYWZ0ZXIgdGhlIGdyb3VwIGlzIGFjdHVhbGx5
DQo+IGNyZWF0ZWQuDQo+ID4NCj4gQWdyZWVkLiBJIHdpbGwgZml4DQo+IA0KPiBUaGFua3MgZm9y
IHRoZSBmZWVkYmFjayAtIHZlcnkgbXVjaCBhcHByZWNpYXRlZC4NCg0KU3VyZSB0aGluZy4NCg==
