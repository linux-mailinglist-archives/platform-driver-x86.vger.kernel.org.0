Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4969B22816C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jul 2020 15:56:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728469AbgGUN4p (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Jul 2020 09:56:45 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:56084 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726715AbgGUN4o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jul 2020 09:56:44 -0400
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06LDsPiM024665;
        Tue, 21 Jul 2020 09:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=C0pScKbq1J0bHGKvsy2cWu1zXhns9NLCQvy5WSAfIL0=;
 b=dOhjedQ2U/LXuafPDVKJIf+ZuFHT1KwEIRetfqGM3R0463RLGqzOKov3kHRd9wb3gCFD
 3augVFrrVc+D90TUKt7zIE6mrH/luRnQ2i6GIa0OhuSXCwYiJhQOBTllcp00TxEFrs5c
 8h/mvYaMZpiz8qIJJRROlqTeZs9BHL6fER7QDW2UDwGcM0ha6tZG1GqevOR9pxtmbPAi
 GR/rT0NN/XHdwgiEQ8uF0dY6/clb074/PvUHkd8SV55LiL8LMzEMn3Tu9RD0vzDTMwh5
 5JpPi3ErXMlcbseDvLWqK1CoEzUrDR57ppqXCDY7/mYnT+cX3HNKQAieXGWzZeM5fNBK pQ== 
Received: from mx0a-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 32bv8d8kmd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 21 Jul 2020 09:56:27 -0400
Received: from pps.filterd (m0142693.ppops.net [127.0.0.1])
        by mx0a-00154901.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06LDtSdj010876;
        Tue, 21 Jul 2020 09:56:26 -0400
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by mx0a-00154901.pphosted.com with ESMTP id 32e1p0r0tn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 21 Jul 2020 09:56:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDa2q6MgeeQuTj+UedINxubpHgy3EaZMQxlSwoMjinDxrhiJuZtU+/R+H6ywSPr2vybnlgLNm9JuUEeCMAjXzvTemRpEpdCmPcd+nAVLjjhBSaaaXJOUGhN+BCa9CJ+9RzxYOzGn93bDwuH6hJV9oO8oKqBBISl8sBvfyfD27OTcE/wzQB3879mMaH6DkVFvh/DBvLiI7uxzJDOOxPtNiXAZLqZVm+UphgjCofWVTbhwZhZ0cDn4JJlwul78IgC3jf9wDhtgk+/BmavKLeUG7Z3ecXtzfuYEBPJLSR2EBhaULz100MV0yhgLyG7y/Z05EJdEiOOYuONhtY8vsRESHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0pScKbq1J0bHGKvsy2cWu1zXhns9NLCQvy5WSAfIL0=;
 b=koGrSPjTayoQMAZ6QbyvrDVh8aKg15A5yq2y4UQ9iVAm0ClsJPjcjxbo6lkbN+tJf2AfESK/G0UEH/EjlCX0f2MnmGBmr4yknaZOlFcP9UmTmg/LNHOnQxetf/+YfaGh0bj4qhCYeOqmH2d1xc9Zo7LChhT/Vwu+pKxE5pRDmpLCFR/0IwwcYm3vcmuBnRZyQfJYJtUQMQ8/EQfKCW6urH/LtD4jFL1Qg/OaXXOs9BUvmAcMDpJ7hajY4tiO5lLh7/ktEtSKZdIoDwFCVTYyZiIyIz9KGSS/BtC8vFszzgvwyhsHH8IBLzkeyT2SY4z40XD28FFjafDuI/1ndM2A1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Dell.onmicrosoft.com;
 s=selector1-Dell-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0pScKbq1J0bHGKvsy2cWu1zXhns9NLCQvy5WSAfIL0=;
 b=Gnm5sJkv/fh8ihS2qWfjhFh746bb3++DZbpCXABsXirm8C8lGHV5n4+fgrHhc/p1LZ0a8tu3kqsWBSUOtlrOBKerQKUellRFCyG7UECKV0bQ0JOwTra7i5CqHS7/L/peJM4mAd9J+fXHtMioRs8GTX8L9bWCpiKKERG1JMv+XkI=
Received: from DM6PR19MB2636.namprd19.prod.outlook.com (2603:10b6:5:15f::15)
 by DM6PR19MB2329.namprd19.prod.outlook.com (2603:10b6:5:bf::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.23; Tue, 21 Jul
 2020 13:56:25 +0000
Received: from DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40]) by DM6PR19MB2636.namprd19.prod.outlook.com
 ([fe80::f1c7:5bf4:a3b:ff40%6]) with mapi id 15.20.3195.022; Tue, 21 Jul 2020
 13:56:25 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@dell.com>
To:     =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>,
        Paul Menzel <pmenzel@molgen.mpg.de>
CC:     Matthew Garrett <mjg59@srcf.ucam.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: RE: Fn + F8 to switch display/monitor configuration/output gives
 KEY_P
Thread-Topic: Fn + F8 to switch display/monitor configuration/output gives
 KEY_P
Thread-Index: AQHWXyx5JvhJ5M9Ty0GwfIheBHpAgakRpfkAgABnp3A=
Date:   Tue, 21 Jul 2020 13:56:25 +0000
Message-ID: <DM6PR19MB2636DD481253817B400CA848FA780@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <f5e31855-0f24-7edb-95e1-06fcbb2812c8@molgen.mpg.de>
 <20200721074010.baupznj6mstjuw4w@pali>
In-Reply-To: <20200721074010.baupznj6mstjuw4w@pali>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Mario_Limonciello@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2020-07-21T13:56:23.4116299Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=301d7db9-f057-4fff-a8cd-47b3dc73a98b;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=Dell.com;
x-originating-ip: [76.251.167.31]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6958a37-5e3c-48d8-114d-08d82d7ddbb7
x-ms-traffictypediagnostic: DM6PR19MB2329:
x-microsoft-antispam-prvs: <DM6PR19MB232988F40686C1E9A5CF1881FA780@DM6PR19MB2329.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g34wwD1dtIYEbfa0NWp8Rtwt2DMvqF0ZxBLfqdAQVpg8SPa6WqH2KgvT35z1ZLgbJ3nVX4VX+JSgT0zDp3+j6ZEBGKMIU80yZ8JPRhUKYN30PERo9P5hQuUptXHviA0D4LJOdv3O8aBhOLe7P4dn6RO/fyz5/M80R5jE12jw0lXdYJZZmjkM65bFdmupt1n01Bn/aCzcqSRwxRBzpVK/sMi6hdDoYyiE4XX0oXIQmCXuHXMX6GVD7kBa+hZ3TaJ1BVLW3WcvRELDShGyMkICY7iw3qhOBRZsRjgZh3WOWRfkdL8TYQcviNs/0gdnoSRrMhaqXy9GyK+wwP+BRX6gCw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR19MB2636.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(136003)(39860400002)(346002)(376002)(396003)(86362001)(53546011)(6506007)(66556008)(186003)(66476007)(64756008)(66946007)(4326008)(76116006)(66446008)(71200400001)(8936002)(26005)(55016002)(786003)(316002)(8676002)(52536014)(2906002)(7696005)(66574015)(33656002)(83380400001)(9686003)(5660300002)(110136005)(478600001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: j65D3+Q8jKUZTihtNtXCsV6rCYm7IBXFD1k6Jysind2u4bXG31JO1QJKpm0PBq1n/oYDOrtxZZCT16DRPnoFGltiCmGItwrRR4FRCkutftroAwcgzrNXIK0r9cnSlh7ucEDpNO1gDLWhnNwFr8NmSO3M/Dr1H0/qkbJEq5ww+BciS1AdBmeFNjxcVyEHErhXwSbaqWfjmEOQvc0PdEQSKzBuTyvVh7k3+PQRI+OMrseVv/hubzwwk7l0ql3xhVrmIegAszyv3QXajAKnrDfySxcYdgvqOfapuqbpoJ9N1rrppvbDO7wX6AMBO40YnzvXdITeW87at9P+V/At39/lh6dhAgDyOEhS/rSX7QRB63/A0bId9PKNbbxEYMu3M6gE04dqu4WQ7NT8peR+fhoBMbhRScc70RNnNXgxgOl5B/5e6kLE8jaloRoFmEA3Q2l7qwdtqxbZDyfa3oHefwk3L5Tbr5eH4bN6yY+lTClXlu9pfDW+38diqiZ+L2chsmfY
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR19MB2636.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6958a37-5e3c-48d8-114d-08d82d7ddbb7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2020 13:56:25.1895
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: spvvQq7uEHaXE2SW0h2EkZsebiZwQoJOkMl7zKPYiKvIDH3/mVFyK1PY0AI/yOJUOImUji+8TQCEBRQa07TA9yO8lCiLpPSeBHIaQ0iK8zg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB2329
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-21_09:2020-07-21,2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210101
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 phishscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007210101
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBwbGF0Zm9ybS1kcml2ZXIteDg2
LW93bmVyQHZnZXIua2VybmVsLm9yZyA8cGxhdGZvcm0tZHJpdmVyLXg4Ni0NCj4gb3duZXJAdmdl
ci5rZXJuZWwub3JnPiBPbiBCZWhhbGYgT2YgUGFsaSBSb2jDoXINCj4gU2VudDogVHVlc2RheSwg
SnVseSAyMSwgMjAyMCAyOjQwIEFNDQo+IFRvOiBQYXVsIE1lbnplbA0KPiBDYzogTWF0dGhldyBH
YXJyZXR0OyBMaW1vbmNpZWxsbywgTWFyaW87IHBsYXRmb3JtLWRyaXZlci0NCj4geDg2QHZnZXIu
a2VybmVsLm9yZzsgSGFucyBkZSBHb2VkZQ0KPiBTdWJqZWN0OiBSZTogRm4gKyBGOCB0byBzd2l0
Y2ggZGlzcGxheS9tb25pdG9yIGNvbmZpZ3VyYXRpb24vb3V0cHV0IGdpdmVzDQo+IEtFWV9QDQo+
IA0KPiANCj4gW0VYVEVSTkFMIEVNQUlMXQ0KPiANCj4gT24gVHVlc2RheSAyMSBKdWx5IDIwMjAg
MDg6NTg6NTEgUGF1bCBNZW56ZWwgd3JvdGU6DQo+ID4gRGVhciBMaW51eCBmb2xrcywNCj4gPg0K
PiA+DQo+ID4gT24gdGhlIERlbGwgTGF0aXR1ZGUgRTcyNTAgcnVubmluZyBEZWJpYW4gU2lkL3Vu
c3RhYmxlIHdpdGggTGludXggNS43LjYsDQo+ID4gcHJlc3NpbmcgRm4gKyBGOCB0byBzd2l0Y2gg
dGhlIGRpc3BsYXkvbW9uaXRvciBjb25maWd1cmF0aW9uIGRvZXMgbm90DQo+IHdvcmsuDQo+ID4g
SXQgb25seSBwcmludHMgYSAqcCouDQo+ID4NCj4gPiAgICAgJCBzdWRvIGxpYmlucHV0IGRlYnVn
LWV2ZW50cyAtLXNob3cta2V5Y29kZXMNCj4gPiAgICAgW+KApl0NCj4gPiAgICAgLWV2ZW50MCAg
IERFVklDRV9BRERFRCAgICAgQVQgVHJhbnNsYXRlZCBTZXQgMiBrZXlib2FyZCAgICAgIHNlYXQw
DQo+ID4gZGVmYXVsdCBncm91cDkgIGNhcDprDQo+ID4gICAgIFvigKZdDQo+ID4gICAgIC1ldmVu
dDAgICBLRVlCT0FSRF9LRVkgICAgICszLjYzNnMJS0VZX0xFRlRNRVRBICgxMjUpIHByZXNzZWQN
Cj4gPiAgICAgIGV2ZW50MCAgIEtFWUJPQVJEX0tFWSAgICAgKzE4LjU2NXMJS0VZX1AgKDI1KSBw
cmVzc2VkDQo+ID4gICAgICBldmVudDAgICBLRVlCT0FSRF9LRVkgICAgICsxOC43MDRzCUtFWV9Q
ICgyNSkgcmVsZWFzZWQNCj4gPiAgICAgIGV2ZW50MCAgIEtFWUJPQVJEX0tFWSAgICAgKzQuNzI3
cwlLRVlfTEVGVE1FVEEgKDEyNSkgcmVsZWFzZWQNCj4gPg0KPiA+IElzIHRoaXMgYSBrbm93biBw
cm9ibGVtPyBEbyB5b3UgdGhpbmsgaXQgY2FuIGJlIGZpeGVkPyBQbGVhc2UgZmluZCB0aGUNCj4g
PiBvdXRwdXQgb2YgYGRtZXNnYCBhdHRhY2hlZC4NCj4gDQo+IEkgdGhpbmsgdGhpcyBpcyBrbm93
biBmZWF0dXJlIG9mIGFsbCBtYWNoaW5lcyBjZXJ0aWZpY2F0ZWQgZm9yIFdpbmRvd3MNCj4gc3lz
dGVtcy4gVGhhdCBtb25pdG9yIHN3aXRjaCBzaG9ydCBrZXkgZ2VuZXJhdGVzIHNlcXVlbmNlOiB3
aW5rZXkgKyBQLg0KPiBBbmQgbm90IHNpbmdsZSBrZXkgcHJlc3MuDQo+IA0KPiBNYXliZSBNYXJp
byBjb3VsZCBoZWxwIGlmIHRoZXJlIGlzIHNvbWUgd2F5IGhvdyB0byBzd2l0Y2ggRGVsbCBFQyB0
bw0KPiByZWFsbHkgZ2VuZXJhdGUganVzdCBvbmUga2V5IHByZXNzIGZvciBtb25pdG9yIHN3aXRj
aCBzaG9ydGtleS4NCg0KRGVsbCdzIEVDIGlzIGNvbmZpZ3VyZWQgdG8gYmVoYXZlIGFzIGhhcyBi
ZWVuIGRlc2NyaWJlZCBpbiB0aGlzIHRocmVhZCAoZW1pdHRpbmcNCmEgc2VxdWVuY2Ugb2Ygc3Vw
ZXIgKyBwKSB3aXRoIG5vIGludGVyZmFjZSB0byBjaGFuZ2UgaXQgZm9yIGEgTGludXggc3BlY2lm
aWMNCmJlaGF2aW9yIG9mIGEgc2luZ2xlIGtleWNvZGUuDQo=
