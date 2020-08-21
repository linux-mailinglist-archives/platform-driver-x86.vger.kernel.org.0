Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92E6F24E236
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Aug 2020 22:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHUUnz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Aug 2020 16:43:55 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:65402 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725831AbgHUUnw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Aug 2020 16:43:52 -0400
Received: from pps.filterd (m0170391.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07LKfif5001973;
        Fri, 21 Aug 2020 16:43:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=Y1CPZbiRJiX+yhWf78NUN6jkCg327QMsWBFENi2Tsx0=;
 b=GP8VBlt5pFgIpZZczt/1Wuqj+Z3OjMMpkJjSGoaNH+iDKG2PyaeoPZ/3eaLNAfkhizip
 GivTE4D+ke7WnRqsc201XnlULhDT7HFdO0cMimkoVNQQ08ChgfR4YyM7a1xkbD+7MCMB
 2MNBJ51zOk0HFjGdcNvK2NwRSWKZTfE/yiTYGWLRHY3XBnatd4C/x9Ya8795e3dwU/6n
 C1LtRpj4ISMYlRXzUdkA5b/CWv4Qm4/4Am5wYw+USM28pRcQ87gf/M/H36cpe1uDXAr0
 xiZvhJy2H+zu7FsZ/t8MlBus8jxGFbpgOoCIo+JboJEsGNWdovI8HCievgQV2ch0uJwX Vg== 
Received: from mx0a-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 3304fsg4ck-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 21 Aug 2020 16:43:26 -0400
Received: from pps.filterd (m0089484.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07LKc3CM005889;
        Fri, 21 Aug 2020 16:43:25 -0400
Received: from nam04-sn1-obe.outbound.protection.outlook.com (mail-sn1nam04lp2050.outbound.protection.outlook.com [104.47.44.50])
        by mx0b-00154901.pphosted.com with ESMTP id 332fk5wcx7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Aug 2020 16:43:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TymZr5qkZLxt2WixNnX97clZiCaeEIrnv+rtmrr9wH89fYBnz8lGnldx4maAbDOmI6s3Gvgsu2oq2LAz1/Zzz94AxphZ9XYZDoOZkWz1+dKkjYNYndkpT3Y520BJabznujETk7PuJ+KxkH/J7iG/sp01072EkEazVg6GN0AKAjeGqa8hHBtpxWcI/8OqWNk43lphiYA7N/ZtLt98YKAkhaJ25pBB4T3THmXQBomIzpJYq7Oqgi4hL1d9vzUUxxXJEidkjaF4N4S25U9bJMA6uZy3tZFIX2AoOEoO9Yp+HxPdKqZcA0lrXgpXP61kdUa6f9UVhaOIDFthSd41j7PsjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1CPZbiRJiX+yhWf78NUN6jkCg327QMsWBFENi2Tsx0=;
 b=I/cgkynrL77pNGFcJyz/xkTRfCPqgfhsbLiBHIEsTAfCIzRMhFE697gKHEckpzbnweY/0EUokMVGltz1bECY+DjIF9mlPzL561QD2YAt+81BGZhTost6kqHid4OpxUo6smJgVxnip03O7sfHUisfCixUkzYXC/bLlqQtYnQbYe9elTnzxuH8ioVIh1cYa/MKMr+AqsX6BWfHYB9RXaimjFpUrgod3kMaip4sJ8ml4FpDZTH2c93Kiy/yhLOSoiTOoJJn9dQiX12vS/TnjzdzNr5zDhanSar7iDSb289XTUlqyrN+OGhX/nTqOi9aPdIsTH7p33/npAp4Dutwu1ez0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1CPZbiRJiX+yhWf78NUN6jkCg327QMsWBFENi2Tsx0=;
 b=CWqKREKS7CHg9q7c+DcndtOdxAnXc+K8WRwd96PUvStk6VPwaC1IGdExdCfddl16NG/IFx02AZnOAxknAz65/PnwudBwozkQn1aYMjo8dxcirRNpoHkVtwQz6Lzopfj1RuWQcTsqaXmEYerUMKCpD1OoNeBjujjJGxWR6G5ePU8=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB3146.namprd19.prod.outlook.com (2603:10b6:5:6::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.25; Fri, 21 Aug 2020 20:43:24 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3305.024; Fri, 21 Aug 2020
 20:43:24 +0000
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
Thread-Index: AQHWd+QBvbgdvM4ZREOC8jacDgPt5KlC7TcAgAAHfwCAAAZQ8IAAAi4AgAAB9yA=
Date:   Fri, 21 Aug 2020 20:43:24 +0000
Message-ID: <DM6PR19MB263621A07F59D91C8E2F7205FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
 <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <1806c4ec-6788-bcc7-7e09-8e5274d2b9d5@lenovo.com>
 <DM6PR19MB26369308415B8235B3C9997EFA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <9e0c14a9-3b24-4b64-6d9e-b312d28dfd44@lenovo.com>
In-Reply-To: <9e0c14a9-3b24-4b64-6d9e-b312d28dfd44@lenovo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-08-21T20:43:22.9250893Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=d4b8ace1-ae17-4b24-ad5d-335e93279632;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: lenovo.com; dkim=none (message not signed)
 header.d=none;lenovo.com; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14a4d8fe-5e86-4d8d-8cf0-08d84612d97e
x-ms-traffictypediagnostic: DM6PR19MB3146:
x-microsoft-antispam-prvs: <DM6PR19MB3146CF78DCFE171BFEC29C16FA5B0@DM6PR19MB3146.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QjWCcvCOIf6c+NZyw8VH0KvftD3rejEiIiFF8O0gFjnOfz/RxihHXesVkeS+wB4tqVgZvV3C6mHCQ00bNQBGiO2PoGu1kYK51cEQ5cDDfK0YkacNCAgMzfcc79CpJUmw31h//+2nFIsKz7Z2eXixrbMTllKnjbNuqyPbYZxMJJEnLarneWIxTM7/jjGPC5pbg8yjgqm0nCHrxsmysDV+MdcVyB+yYA1HBxaJasNHaSOHT5tEALJMLiuIuBcvpS+JBuLyZjfTg8DbT++ZGyBM+P9ZV3bXUXPynebn64Nfwcl642sFo95hN/YkI9/yxCyjAve+GIiGX/KlqRrybCKh7A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(376002)(136003)(396003)(366004)(316002)(26005)(8936002)(86362001)(33656002)(71200400001)(478600001)(186003)(9686003)(55016002)(786003)(54906003)(76116006)(64756008)(66446008)(66556008)(52536014)(4326008)(66946007)(8676002)(2906002)(6916009)(53546011)(7696005)(66476007)(6506007)(83380400001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: t7uj+Tku8umN9EUkl/eMvjzEJo9LyUu2KVuxFgOTzkxxrn+Z9o6LKveXqu+6wfWeiCFwYKuuiluur/E+ohjl5Cln+3Hl0FWMBqJeR74nRdowWavVx4WVaE5IKSGtf7v1JYeZ6lYTJctB+ZkUGPItf4OootJ0byADtOJpPIe56CeyWT57vAafHFXcNv52ZJZH3bGfaqS3VHOODZhMBXHNWmly6sX2KsMAoNCywAlfeouTKqEnzp6kfzPcQcmv4rCqBSYwAfLpgiZTeKeQvwGLkP737UqUrv7GqG0GljanO0OHzPbajvfxbTdhHM36yFYj0EoN1OjZZyZ4UUrUzYsRFAp52rjfYr66ISXfjTUEYO4IqGnlNus4pUork67XpKq8i9twX2RXjONA3zQpDgkyAdTPQx9M7purcCRo5arEe56IvB1UMh22gH0uB4snJfP+om7AWUnudId+N9PfO0pqo3sUBlGA2lgGn1HuI0C3A5V3h8BmtntTlajZmsMPfkZP3aRSUIZted+7qgCdbh33G1+HKqYcVzMcR1QVP8DYJ7/3P0MN++HVQ2XCzOMxZ5/vKo6fq3pm5p7ZpTKnGoqmzZ6fiTufMpfaTWzMCGOrEkjRTYkkdq0AxlBN5ysvdsx86gVgHUp6CQiUfYNM5+0WzQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a4d8fe-5e86-4d8d-8cf0-08d84612d97e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2020 20:43:24.3741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iBZnc6iqFvJU37efwwqrQt1WX/vG3D9s7on+xZX4POH4m4UlSIznDlW0L2xqHOk7ZW3PLTfIRxdgFvQ7+1DiGVk9pxNZBiX/j1OZ9nxj6h0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3146
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-21_10:2020-08-21,2020-08-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008210192
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008210193
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJrIFBlYXJzb24gPG1hcmtw
ZWFyc29uQGxlbm92by5jb20+DQo+IFNlbnQ6IEZyaWRheSwgQXVndXN0IDIxLCAyMDIwIDE1OjA2
DQo+IFRvOiBMaW1vbmNpZWxsbywgTWFyaW8NCj4gQ2M6IGlibS1hY3BpLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldDsgcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGli
bS1hY3BpQGhtaC5lbmcuYnI7IGJub2NlcmFAcmVkaGF0LmNvbTsgTml0aW4gSm9zaGkNCj4gU3Vi
amVjdDogUmU6IFtFeHRlcm5hbF0gUkU6IFtQQVRDSCB2Ml0gcGxhdGZvcm0veDg2OiB0aGlua3Bh
ZF9hY3BpOg0KPiBwZXJmb3JtYW5jZSBtb2RlIGludGVyZmFjZQ0KPiANCj4gDQo+IFtFWFRFUk5B
TCBFTUFJTF0NCj4gDQo+IE9uIDgvMjEvMjAyMCA0OjAwIFBNLCBMaW1vbmNpZWxsbywgTWFyaW8g
d3JvdGU6DQo+IDxzbmlwPg0KPiA+Pj4+ICsgK1RoZSBzeXNmcyBlbnRyeSBwcm92aWRlcyB0aGUg
YWJpbGl0eSB0byByZXR1cm4gdGhlIGN1cnJlbnQNCj4gPj4+PiBzdGF0dXMgYW5kIHRvIHNldA0K
PiA+Pj4+IHRoZSArZGVzaXJlZCBtb2RlLiBGb3IgZXhhbXBsZTo6ICsgKyAgICAgICAgZWNobyBI
ID4NCj4gPj4+PiAvc3lzL2RldmljZXMvcGxhdGZvcm0vdGhpbmtwYWRfYWNwaS9keXRjX3BlcmZt
b2RlICsgICAgICAgIGVjaG8NCj4gPj4+PiBNID4gL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3RoaW5r
cGFkX2FjcGkvZHl0Y19wZXJmbW9kZSArDQo+ID4+Pj4gZWNobyBMID4gL3N5cy9kZXZpY2VzL3Bs
YXRmb3JtL3RoaW5rcGFkX2FjcGkvZHl0Y19wZXJmbW9kZSArDQo+ID4+Pg0KPiA+Pj4gSSB3YXMg
dGhpbmtpbmcgYWJvdXQgdGhpcyBzb21lIG1vcmUsIGRvIHlvdSBhY3R1YWxseSB3YW50IGFub3Ro
ZXINCj4gPj4+IG1vZGUgdGhhdCAiZGlzYWJsZXMiDQo+ID4+PiB0aGlzIGZlYXR1cmU/ICAgSUUg
Ik8iIHR1cm5zIGl0IG9mZiBhbiBjYWxscyBEWVRDX0RJU0FCTEVfQ1FMLg0KPiA+Pj4NCj4gPj4+
IEZvciBleGFtcGxlIGlmIGEgdXNlciB3YW50ZWQgdG8gdGVzdCB0aGUgcmVjZW50bHkgbGFuZGVk
IGNvZGUgaW4NCj4gPj4+IHRoZXJtYWxkIDIuMw0KPiA+Pj4gYW5kIGNvbXBhcmUgcGVyZm9ybWFu
Y2UgYmV0d2VlbiB0aGUgdHdvIGl0IHNlZW1zIGxpa2UgdGhpcyBhbmQNCj4gPj4+IHRoYXQgIm1p
Z2h0IiBmaWdodC4NCj4gPj4+IEFzIGFuIG91dHNpZGVyIGxvb2tpbmcgaW4gLSBJIG9mIGNvdXJz
ZSBtYXkgYmUgd3JvbmcgdG9vIGhlcmUuDQo+ID4+Pg0KPiA+Pj4gSWYgYXQgc29tZSBwb2ludCBp
biB0aGUgZnV0dXJlIHRoZXJtYWxkIGRvZXMgYSBiZXR0ZXIgam9iIHRoYW4NCj4gPj4+IHRoaXMg
aW1wbGVtZW50YXRpb24geW91DQo+ID4+PiBtaWdodCBhbHNvIHdhbnQgYW4gIm91dCIgdG8gbGV0
IHRoZXJtYWxkIG9yIGFub3RoZXIgcGllY2Ugb2YNCj4gPj4+IHVzZXJsYW5kIHR1cm4gdGhpcyBv
ZmYgaWYgaXQncyBpbiB0aGUgcGljdHVyZS4NCj4gPj4+DQo+ID4+IEknbSBzdGlsbCBkaWdnaW5n
IGludG8gdGhpcyBvbmUuIFJpZ2h0IG5vdyBJIGhhdmVuJ3QgZm91bmQgYSBnb29kDQo+ID4+IGNs
ZWFuIHdheSBvZiBqdXN0IGRpc2FibGluZyB0aGUgZmlybXdhcmUuIEN1cnJlbnRseSB3aGVuIHRo
ZXJtYWxkDQo+ID4+IGdvZXMgaW4gYW5kIHR3ZWFrcyB0aGUgQ1BVIHBvd2VyIHJlZ2lzdGVycyBp
dCBoYXMgdGhlIGVmZmVjdCBvZg0KPiA+PiBvdmVycmlkaW5nIHRoZSBGVyBhbnl3YXkgLSBidXQg
SSBhcHByZWNpYXRlIHRoYXQncyBub3QgcXVpdGUgdGhlDQo+ID4+IHNhbWUgYXMgYWN0dWFsbHkg
ZG9pbmcgaXQgZXhwbGljaXRseS4NCj4gPj4NCj4gPg0KPiA+IFdoYXQgYWJvdXQgYSBtb2Rwcm9i
ZSBwYXJhbWV0ZXIgdG8gZGlzYWJsZSBhdCBsZWFzdD8gIFRoYXQgd291bGQgYXQNCj4gPiBsZWFz
dCBtYWtlIGl0IHByZXR0eSBlYXN5IHRvIG1ha2UgYSBjaGFuZ2UsIHJlYm9vdCBhbmQgY29tcGFy
ZSB3aXRoDQo+ID4gdGhlcm1hbGQgKG9yIG90aGVyIHNvZnR3YXJlKSB3aXRob3V0IGRpc2FibGlu
ZyB0aGUgcmVzdCBvZiB0aGUNCj4gPiBmdW5jdGlvbmFsaXR5IG9mIHRoZSB0aGlua3BhZF9hY3Bp
IGRyaXZlci4NCj4gPg0KPiBUaGUgcHJvYmxlbSBpcyBJIGRvbid0IGhhdmUgYSBnb29kIHdheSB0
byBkaXNhYmxlIHRoZSBmaXJtd2FyZSAodGhhdCBJDQo+IGtub3cgb2YgeWV0KSBzbyBhIG1vZHBy
b2JlIHBhcmFtZXRlciB3b3VsZG4ndCByZWFsbHkgZG8gbXVjaC4gSSBndWVzcyBpdA0KPiBjb3Vs
ZCBza2lwIHByb3ZpZGluZyB0aGUgc3lzZnMgZW50cnkgcG9pbnRzIC0gYnV0IHRoZSBGVyB3aWxs
IHN0aWxsIGJlDQo+IHRoZXJlIGRvaW5nIGl0J3MgdGhpbmcsIHNvIEknbSBub3Qgc3VyZSBJIHNl
ZSB0aGUgYmVuZWZpdCBvZiB0aGF0LiBBdA0KPiBsZWFzdCB0aGUgc3lzZnMgZW50cnkgcG9pbnQg
Z2l2ZXMgYSBiaXQgbW9yZSBpbnNpZ2h0IGludG8gd2hhdCBpcyBnb2luZyBvbi4NCj4gTGV0IG1l
IGtub3cgaWYgSSdtIG1pc3Npbmcgc29tZXRoaW5nIG9idmlvdXMuDQo+IA0KDQpPaCBzbyBpdCdz
IG5vdCBhY3R1YWxseSB0aGUgZHJpdmVyIGxvYWRpbmcgdGVsbHMgdGhlIGZpcm13YXJlIGl0J3Mg
c3VwcG9zZWQNCnRvIHdvcmsgdGhpcyB3YXkuICBUaGUgZmlybXdhcmUgYWN0dWFsbHkgZGV0ZWN0
cyAiSSdtIHJ1bm5pbmcgb24gTGludXgsIHNvIEknbGwNCmRvIHRoaXMgZGlmZmVyZW50bHkiPw0K
DQoNCg==
