Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86D54D1AF7
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Mar 2022 15:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347614AbiCHOvV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Mar 2022 09:51:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234882AbiCHOvU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Mar 2022 09:51:20 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2046.outbound.protection.outlook.com [40.107.93.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BDCC3FDB5;
        Tue,  8 Mar 2022 06:50:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b1mhAO7/C33/uk9DXExIh4e6Ic1BtL5nbB6u6uR7VKTLcxfz3JREWpbozIxS91dre1HbDjuXCoHd1Yi8+V1+klZ3sCE7jdMkIGcnjLxZvTypEwGc9/DwQcQCiswEeIadzuw0xgR9vBKWovHPePOWL/+ELIay5KwFA8o0Og0/qTijBaivfcvSLRtOLoP0RMzzGOnJhAUXTsoYZNvAgK64jIenfMLpZR9ZhaD3pPU+acmi2nDMsZ9kANNqYFZE725sQ9hkzEQo9c7h/hwQbJCuoh07cK24VyvDBz0bkFNFabsHqo6rM3aGac/DMqYDF12loFqatYY+cfJMCqHkjsoJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0/9dZ84VX8whkUUjN0tKhoGf4FeifOlH26mqn8FG8s=;
 b=gjOo8vdVPKXYctA5CuvlZurDBYYcxAmcMdvgsh21hSBXCf9dJxrNn4w8l6hTjnVpw0Uwxh8UijjFd+YXS4mIO3yK7lNYpDRu8MMa1/YzwXhZZ41VBuHhTTw8oJMEQaIOo74ObSmLvw1gmY/HajpNT/45llmEAebumd6hZl3nSyCZb4PS42QO7L4r5sPZt1R+DH039OZEX8lSTJm8Lc8slTPMUFLIINJ8j82dFRZ7Ug0bCxsfYPV1UPoXw9Qs1+DIP4ZFR/cYXEAQQuaQWwdHXihfqXqzWJ3t9rf22p84pGthoUOkxXBD7JaqC+8YJK/2+vAIdYwIbjcaWCMPmpoG6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0/9dZ84VX8whkUUjN0tKhoGf4FeifOlH26mqn8FG8s=;
 b=d3cop6g2mrTV3UhE1ZIvBgf0+7zHOszbPRZesIMvk0o2+yWqjUnmLSENRXZxJa1GNK3z7IqBMwJ6m/i5Qrhol+UvNmg/7jOgiVYl67RWYj31Ild2COsUSQnLnseUBqqR/BBetZ0fXi8meBHmHAl1UJiODSbAyRQhDNCZOt0zeRs=
Received: from BL1PR12MB5157.namprd12.prod.outlook.com (2603:10b6:208:308::15)
 by MN2PR12MB3006.namprd12.prod.outlook.com (2603:10b6:208:cd::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 8 Mar
 2022 14:50:18 +0000
Received: from BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08]) by BL1PR12MB5157.namprd12.prod.outlook.com
 ([fe80::692d:9532:906b:2b08%5]) with mapi id 15.20.5038.027; Tue, 8 Mar 2022
 14:50:18 +0000
From:   "Limonciello, Mario" <Mario.Limonciello@amd.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>
CC:     "rafael@kernel.org" <rafael@kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: RE: [RFC] ACPI: platform-profile: support for AC vs DC modes
Thread-Topic: [RFC] ACPI: platform-profile: support for AC vs DC modes
Thread-Index: AQHYMvpOgF/dWfErcUSFT4Dgm8wHfqy1kShQ
Date:   Tue, 8 Mar 2022 14:50:18 +0000
Message-ID: <BL1PR12MB5157CDB77675859B7F279578E2099@BL1PR12MB5157.namprd12.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20220301201554.4417-1-markpearson@lenovo.com>
 <65d8cf3b-0eea-0583-fa23-e2c71287fb85@redhat.com>
In-Reply-To: <65d8cf3b-0eea-0583-fa23-e2c71287fb85@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2022-03-08T14:50:15Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=d98b93a4-ebbe-40a3-864e-da5de2777f8d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_enabled: true
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_setdate: 2022-03-08T14:50:16Z
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_method: Privileged
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_name: Public-AIP 2.0
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_actionid: 944c16dc-3fc0-4b14-bf36-7f4eb430bcbc
msip_label_d4243a53-6221-4f75-8154-e4b33a5707a1_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5aa65242-4a38-4ce3-204e-08da0112f6ca
x-ms-traffictypediagnostic: MN2PR12MB3006:EE_
x-microsoft-antispam-prvs: <MN2PR12MB3006875CAE999B0D7FA8DBC5E2099@MN2PR12MB3006.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1JSxHbIAVSv1ktkGOp5frDxug7W4GkIQyLz3aR8d6M4HHfHyCvgxv7HE96j+/YMgi2ckYrZKj1JDmtGZrP/6ZXw8Y6xGUcKOR1MLnZjTTmD8dgl7qxjyWBb77qQflmDK9XRX9BJk7vodZAUhbBo2THZoxQvtdX0lVi8MGoA5o5yfWTYSA41SOiMxk9LkkhOPm9gaU2orAq7cyB6R++TN+BJhYVpiZysN9DdaN/lUjgyXltsybfqH3PBIef9XiB89yxcqykdpn0YqE0y7veEZpUwpdNPNEZOXJwWgOJ2DucLDdNC5mdsWSAPe/IeplmoHn7K171pyAPqDqyFTCBn/UTpGKOzrQ/cP3i5v/RUZiJPnS78CtUk+3HM95NCSriiQJA7fZqvICw1KjzrznO4h14Oi9PC7Mnuuy+uyAGlsdAjAUPKx17PfR4CtAjknPHNAg85kBr4gIt6/it69fFB5a/7jjVCAoqQtv/qLZi8Fkj8fEl+NDEI5ACGg/UL2nLc4x32FPOnti47sMvyhWt5vBLJmwEDltICofoHLyj8HHf2mlnLeEVF1OBknovFCbk1s7j991vj0hHfS6COSX10vjrAo8ba5vX/4na/K6bbud5gia9FNHDCxfI0W76TCJE9c/4YFyYvQyn0kLENO49jO/56UoKhr4daSjZuYA2Hdt8NIL4O87JUxHahjIeg8jzGgReVXCbPrmP671f1hQjygpQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5157.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(5660300002)(6506007)(7696005)(53546011)(33656002)(52536014)(8936002)(30864003)(508600001)(9686003)(76116006)(2906002)(186003)(26005)(4326008)(8676002)(64756008)(66476007)(66946007)(66556008)(66446008)(38100700002)(110136005)(38070700005)(122000001)(55016003)(316002)(71200400001)(54906003)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0F6Q1VuMEkrbUFXWEhYdWZ4d2R1UVgwT3JESmpaM051azc3UUd3RW5SM0J2?=
 =?utf-8?B?ZHN5NmZ6QWdlSzZmeGE5RnM4RjluTStxVW5kWDFvN0JaenNlSkZZY2lQUGZI?=
 =?utf-8?B?cThtWXc2dHovVkpqQ1BMRUpTR1E0ZUlHaFRhWEdFSUdPd2xvMlVSeDdNUjls?=
 =?utf-8?B?TmhCZkdLTE9TVVp5ZzRRK2FCNzJwdHdpRXVZcC9yb29LU2J3OVBDVzZFcFZo?=
 =?utf-8?B?QWkxTzNTUElUekR5TytRdEtmNmJ5SUs5VWNSRnQ1N2h1VHVTOEhoQk1yMG1z?=
 =?utf-8?B?YjRhZmNCYjczckRtT2pDczAxR2l6WEgrZzR2L2ZUbUFXNUJxRytvYnNveXBu?=
 =?utf-8?B?dW1RL1BFR3NRMFZXWUorSW5XZDZQRHViQzRxYWo2RkVGbFhTdXVDUXM0M00x?=
 =?utf-8?B?U2oxa0pWVWFGWkRRdzZDZVE4em1mcHkzUisxZTVKMzM4Z1UzS01EN1ljSUtw?=
 =?utf-8?B?anh6Wjh1N2x2U2J2N2h3TC9uSW5kakczeDNSU092M2Z3aUg4OW9ZcFV0TjhV?=
 =?utf-8?B?eGJHV1JMRE5Cc2ZXdVFhMzd4V24rZHd1WVhWWjhFU3V5TzFTRFJrVmxueUdT?=
 =?utf-8?B?K0NwMlF5Ri9iaEUzemJCOXB1MHdTNFptTUZyc2J2TkhCdlJSbW9oY29oVlVK?=
 =?utf-8?B?OXdjTUNaR0FObmlPT3Z6ZUJCNnNIeEhrc0diMmRySDFXR1Zyd0ZyWCt2QjA1?=
 =?utf-8?B?NFdmNlJwSnp6QzJUc1h3ZzNpOGpLMGJPendZNzYrZjVJNmkzTlIvOVYwaGdV?=
 =?utf-8?B?UVlpb3U5RzFmaTN2dkVRL0I0RzgyNUo0dkl3SW50OUFIZitKS0RORnUzM1gr?=
 =?utf-8?B?MUdnNStONVJ6UGtlRnYrNVc1MnVXazUwVDI2MWEweXV2OFR2WE5TUXZsSVY4?=
 =?utf-8?B?NDFZMXBmQUdIZVoxY0xVZUpsOEtDa2ROcVkxK1cvblR0Q0JwZzFoV3NnSWNS?=
 =?utf-8?B?QnBWN3RXeXVNYTV4cTVKZXZGbVo1L1JyeUlVZE5Da1NPZHNSTER4RlhiUU5N?=
 =?utf-8?B?NDd2blJnbE5FZjFBaWNLNHNPdWIwVmV2MTNkZUd2Y3Yyd1I0RUo1TzlIN2NM?=
 =?utf-8?B?QmpyZTVNRWhVQnB3VnhJTHl4ZHZTOUxvYzBCVXFuT0hqWmM2ZEYxOVB5YWxa?=
 =?utf-8?B?V0VVS2JnMUJnc0ZlazVoUDd6OTEzSENFOUg5TEpNQlNnSEtRcFgzcW11ZGFB?=
 =?utf-8?B?T2Urb1p3djBoTHN6bXIrcHlWTG9mWlFoT1Yva1YvejNka3FLSnJmaHV2YVNy?=
 =?utf-8?B?c3dOWUlFOURwSVpPa3VWUTRGZWtHdkJTTzZvbmd1SWNIc1hxVHR4cDFWNk5a?=
 =?utf-8?B?eGd4L0dJWTZFRCtBYndISlRTSFF3bkowcGFFRjA1SCtuNldQN3JDdi9NaXBD?=
 =?utf-8?B?VUF1cXZIbCtia0owMVZ2TzJnVGxCRjZUVG4vL0s5bkZPbUFXU1JLTDZETWtn?=
 =?utf-8?B?cHJaUm1MWW5HWGs0b084QWVoVm13YVphTXdzNHNwcWxhU3gwdnJqQnNsakhL?=
 =?utf-8?B?MjNuaGRwWUpsUUhKWHZ2bFBuN2Y0NGJvcjFOVEpDSk5wQWQ3UFhITG00STg1?=
 =?utf-8?B?UUtSdytWT2pPL2VoWTRsM0FKblR6WmNQd2VKLzlXWjhaVzJiZFN2UFg4NGpM?=
 =?utf-8?B?TCswRXlzZ3JnbDJYcWNzYzNVc2lVN0NYc1Y0d3MwNThtcllUK2NsWXB3N3dk?=
 =?utf-8?B?aWJUeHJHY2FFN1hOaG8yWFBBTUJ2L3lPazY1dDUzVEhlN0hLSkRHbldDODFE?=
 =?utf-8?B?bFJLOVlIb3V2WUU2RENFdlVBRG15dUNRRi91UlpKaGdWR3ZCb3pIRHNpMy9R?=
 =?utf-8?B?Qjc1ZitzeVVzTXVGM09QTDB4U1ZoNVg5QUI0QnU4K0ZQQ3RNSzRvSEZDUE03?=
 =?utf-8?B?U0dDUVEwR29NckFRYXE3ZGdqYTZvaWoyS1FLRGNoVGNkK2t0b1IrWTA2ci8z?=
 =?utf-8?B?d0dCelk4ZFJvVEVBSkcxK2JOUzMxam5aNHNaQXprb2c5bUJZZEVhMTB6ODNO?=
 =?utf-8?B?NkxMd3FZZHdSYU0vRENqQUpWcnlBNlZaaURuajF6TVVlRVl6cEZDYmNEUzlQ?=
 =?utf-8?B?UmZNb2hVSDNXN2ZYalNhRFNoNG84WDlITnpnR1I4Y3NOR2NOSGY4TFdxNlJH?=
 =?utf-8?B?c0p1QnBWdVRzclRNWHpmOVZPM25GRWQvT1ZuTnBpemVjOWRtWDVFK2VKOWpQ?=
 =?utf-8?Q?sl939qHRmZAmaPu5Fe8mTN0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5157.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa65242-4a38-4ce3-204e-08da0112f6ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2022 14:50:18.7358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z1/uj5qauUM14U93uUUvDj31A7WLY9rYwid1RlRTK7+wXE9FnKCBYJfX1wN6QbU7C/pruMlyexGNFnjkYUxmiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3006
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

W1B1YmxpY10NCg0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSGFu
cyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWFyY2gg
OCwgMjAyMiAwODozOQ0KPiBUbzogTWFyayBQZWFyc29uIDxtYXJrcGVhcnNvbkBsZW5vdm8uY29t
Pg0KPiBDYzogcmFmYWVsQGtlcm5lbC5vcmc7IGxpbnV4LWFjcGlAdmdlci5rZXJuZWwub3JnOyBw
bGF0Zm9ybS1kcml2ZXItDQo+IHg4NkB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6IFtS
RkNdIEFDUEk6IHBsYXRmb3JtLXByb2ZpbGU6IHN1cHBvcnQgZm9yIEFDIHZzIERDIG1vZGVzDQo+
IA0KPiBIaSBNYXJrLA0KPiANCj4gT24gMy8xLzIyIDIxOjE1LCBNYXJrIFBlYXJzb24gd3JvdGU6
DQo+ID4gTG9va2luZyBmb3IgZmVlZGJhY2sgb24gdGhpcyBmZWF0dXJlLiBXaGV0aGVyIGl0IGlz
IHdvcnRoDQo+ID4gcHVyc3VpbmcgYW5kIGFueSBjb25jZXJucyB3aXRoIHRoZSBnZW5lcmFsIGlt
cGxlbWVudGF0aW9uLg0KPiA+DQo+ID4gSSd2ZSByZWNlbnRseSBiZWVuIHdvcmtpbmcgb24gUFND
IHBsYXRmb3JtIHByb2ZpbGUgbW9kZSBzdXBwb3J0DQo+ID4gZm9yIExlbm92byBBTUQgcGxhdGZv
cm1zIChwYXRjaCBwcm9wb3NlZCB1cHN0cmVhbSBsYXN0IHdlZWspLg0KPiA+IE9uZSBvZiB0aGUg
aW50ZXJlc3RpbmcgcGllY2VzIHdpdGggdGhlIExlbm92byBQU0MgaW1wbGVtZW50YXRpb24NCj4g
PiBpcyBpdCBzdXBwb3J0cyBkaWZmZXJlbnQgcHJvZmlsZXMgZm9yIEFDIChwbHVnZ2VkIGluKSB2
cyBEQw0KPiA+IChydW5uaW5nIGZyb20gYmF0dGVyeSkuDQo+IA0KPiBOaXRwaWNrOiB0aGUgcG93
ZXIgZ29pbmcgdG8gdGhlIGxhcHRvcCBoYXMgbG9uZyBiZWVuIGNvbnZlcnRlZA0KPiB0byBEQyB3
aGVuIGl0IGdvZXMgaW50byB0aGUgbGFwdG9wIGFuZCB3aGVuIGUuZy4gY2hhcmdpbmcNCj4gd2l0
aCBhIGNhci1saWdodGVyLWNvbm5lY3Rpb24tdG8tdHlwZS1jIGNvbnZlcnRvciBpdCBoYXMgbmV2
ZXINCj4gbm90IGJlZW4gREMuDQo+IA0KPiBJTUhPIGV4dGVybmFsX3Bvd2VyIHZzIGJhdHRlcnkg
d291bGQgYmUgYmV0dGVyIG5hbWVzLg0KPiANCj4gPiBJIHdhcyB0aGlua2luZyBvZiBhZGRpbmcg
dGhpcyBzdXBwb3J0IGluIHRoZSB0aGlua3BhZF9hY3BpIGRyaXZlciwNCj4gPiBidXQgaXQgc2Vl
bXMgaXQgd291bGQgYmUgbmljZXIgdG8gbWFrZSB0aGlzIGdlbmVyYWxseSBhdmFpbGFibGUgZm9y
DQo+ID4gYWxsIHBsYXRmb3JtcyB0aGF0IG9mZmVyIHByb2ZpbGUgc3VwcG9ydC4NCj4gPg0KPiA+
IFRoaXMgaW1wbGVtZW50YXRpb24gYWxsb3dzIHRoZSB1c2VyIHRvIHNldCBvbmUgcHJvZmlsZSBm
b3Igd2hlbiBhDQo+ID4gc3lzdGVtIGlzIHBsdWdnZWQgaW4sIGFuZCBhIGRpZmZlcmVudCBwcm9m
aWxlIGZvciB3aGVuIHRoZXkgYXJlDQo+ID4gdW5wbHVnZ2VkLiBJIGltYWdpbmUgdGhpcyB3b3Vs
ZCBiZSB1c2VkIHNvIHRoYXQgcGVyZm9ybWFuY2UgbW9kZQ0KPiA+IGlzIHVzZWQgd2hlbiBwbHVn
Z2VkIGluIGFuZCBsb3ctcG93ZXIgdXNlZCB3aGVuIHVucGx1Z2dlZCAoYXMgYW4NCj4gPiBleGFt
cGxlKS4gVGhlIHVzZXIgY291bGQgY29uZmlndXJlIGl0IHRvIG1hdGNoIHRoZWlyIHByZWZlcmVu
Y2UuDQo+ID4NCj4gPiBJZiB0aGUgdXNlciBkb2Vzbid0IGNvbmZpZ3VyZSBhIERDIHByb2ZpbGUg
aXQgYmVoYXZlcyB0aGUgc2FtZSBhcw0KPiA+IHByZXZpb3VzbHkgYW5kIGFueSBBQ1BJIHBvd2Vy
IGV2ZW50cyB3aWxsIGJlIGlnbm9yZWQuIElmIHRoZSB1c2VyDQo+ID4gY29uZmlndXJlcyBhIERD
IHByb2ZpbGUgdGhlbiB3aGVuIGEgc3lzdGVtIGlzIHVucGx1Z2dlZCBpdCB3aWxsDQo+ID4gYXV0
b21hdGljYWxseSBjb25maWd1cmUgdGhpcyBzZXR0aW5nLg0KPiA+DQo+ID4gSSd2ZSBhZGRlZCBw
bGF0Zm9ybV9wcm9maWxlX2FjIGFuZCBwbGF0Zm9ybV9wcm9maWxlX2RjIHN5c2ZzIG5vZGVzLg0K
PiA+IFRoZSBwbGF0Zm9ybV9wcm9maWxlIGFuZCBwbGF0Zm9ybV9wcm9maWxlX2FjIG5vZGVzIHdp
bGwgYmVoYXZlIHRoZQ0KPiA+IHNhbWUgd2hlbiBzZXR0aW5nIGEgcHJvZmlsZSB0byBtYWludGFp
biBiYWNrd2FyZHMgY29tcGF0aWJpbGl0eS4NCj4gPg0KPiA+IElmIHlvdSByZWFkIHRoZSBwbGF0
Zm9ybV9wcm9maWxlIGl0IHdpbGwgcmV0dXJuIHRoZSBjdXJyZW50bHkNCj4gPiBhY3RpdmUgcHJv
ZmlsZS4NCj4gPiBJZiB5b3UgcmVhZCB0aGUgcGxhdGZvcm1fcHJvZmlsZV9hYyBvciBwbGF0Zm9y
bV9wcm9maWxlX2RjIG5vZGUgaXQNCj4gPiB3aWxsIHJldHVybiB0aGUgY29uZmlndXJlZCBwcm9m
aWxlLiBUaGlzIGlzIHNvbWV0aGluZyBtaXNzaW5nIGZyb20NCj4gPiB0aGUgY3VycmVudCBpbXBs
ZW1lbnRhdGlvbiB0aGF0IEkgdGhpbmsgaXMgYSBuaWNlIGJvbnVzLg0KPiA+DQo+ID4gVXNlciBz
cGFjZSBpbXBsZW1lbnRhdGlvbiBjb3VsZCBwb3RlbnRpYWxseSBiZSB1c2VkIHRvIGRvIHRoZSBz
YW1lDQo+ID4gaWRlYSwgYnV0IGhhdmluZyB0aGlzIGF2YWlsYWJsZSBhbGxvd3MgdXNlcnMgdG8g
Y29uZmlndXJlIGZyb20NCj4gPiBjbWRsaW5lIG9yIHVzZSBzY3JpcHRzIHNlZW1lZCB2YWx1YWJs
ZS4NCj4gPg0KPiA+IE5vdGUgLSBJJ20gYXdhcmUgdGhhdCBJIHN0aWxsIG5lZWQgdG86DQo+ID4g
IDEpIFVwZGF0ZSB0aGUgQVBJIGRvY3VtZW50YXRpb24gZmlsZQ0KPiA+ICAyKSBJbXBsZW1lbnQg
YSBkaXNhYmxlL3VuY29uZmlndXJlIG9uIHRoZSBwcm9maWxlX2RjIHNldHRpbmcNCj4gPiBCdXQg
SSBmaWd1cmVkIHRoaXMgd2FzIGZhciBlbm91Z2ggYWxvbmcgdGhhdCBpdCB3b3VsZCBiZSBnb29k
IHRvIGdldA0KPiA+IGNvbW1lbnRzLg0KPiA+DQo+ID4gVGhhbmtzIGluIGFkdmFuY2UgZm9yIGFu
eSBmZWVkYmFjay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IE1hcmsgUGVhcnNvbiA8bWFya3Bl
YXJzb25AbGVub3ZvLmNvbT4NCj4gDQo+IElmIEkgdW5kZXJzdGFuZCB0aGluZ3MgY29ycmVjdGx5
LCB0aGVuIHRoZXJlIGlzIG5vIGRpZmZlcmVuY2UNCj4gYmV0d2VlbiBlLmcuIHBlcmZvcm1hbmNl
IG9uIEFDIHZzIG9uIGJhdHRlcnksIHRoaXMgaXMganVzdA0KPiBhdXRvbWF0aWMgc3dpdGNoaW5n
IHRoZSBwcm9maWxlcyB3aGVuIGNvbm5lY3RpbmcvZGlzY29ubmVjdGluZw0KPiB0aGUgY2hhcmdl
ciwgY29ycmVjdD8NCj4gDQo+IElmIEkgZ290IHRoYXQgY29ycmVjdCwgdGhlcmUgaXMgbm8gcmVh
c29uIHdoeSB1c2Vyc3BhY2UgY291bGQNCj4gbm90IGRvIHRoaXMgaXRzZWxmIGFuZCBpbXBsZW1l
bnRpbmcgdGhpcyBpbiB1c2Vyc3BhY2UgaGFzIHRoZQ0KPiBhZHZhbnRhZ2UgdGhhdCBpdCB3aWxs
IHdvcmsgZXZlcnl3aGVyZSBpbmNsdWRpbmcgb24gbm9uDQo+IFBTQyBUaGlua1BhZHMNCg0KSSBk
b24ndCB0aGluayB0aGF0J3MgcmlnaHQgZm9yIHRoZSBQU0MgVGhpbmtwYWRzLiAgVGhleSBoYXZl
IGRlZGljYXRlZA0KZGlmZmVyZW50IHR1bmluZ3MgZm9yIGVhY2ggb2YgdGhlIHNsaWRlciBwb3Np
dGlvbnMgb24gQUMgdnMgREMuDQoNClNvICJiYWxhbmNlZCIgb24gQUMgd2lsbCBub3QgYmUgdGhl
IHNhbWUgYXMgImJhbGFuY2VkIiBvbiBEQy4NCg0KPiANCj4gVGhlIGhhcmRlc3QgcGFydCBvZiBp
bXBsZW1lbnRpbmcgc29tZXRoaW5nIGxpa2UgdGhpcyB3b3VsZA0KPiBiZSB0aGUgdXNlcnNwYWNl
IFVJIGRlc2lnbiBhbmQgYW55IHBvbGljeSBkZWNpc2lvbnMgc3Vycm91bmRpbmcNCj4gdGhpcywg
aWYgd2Ugc3BlbmQgdGltZSBvbiBpbXBsZW1lbnRpbmcgdGhvc2UgdGhlbiBtYWtpbmcgdXNlcnNw
YWNlDQo+IGRvIHRoZSBhY3R1YWwgc3dpdGNoaW5nIG9mIHRoZSBwcm9maWxlcyBpcyBwcmV0dHkg
dHJpdmlhbCBpbg0KPiBjb21wYXJpc29uIGFuZCBhcyBzYWlkIHdvdWxkIGJlIGEgbXVjaCBtb3Jl
IHVuaXZlcnNhbCB3YXkNCj4gdG8gaW1wbGVtZW50IHRoaXMuDQo+IA0KPiBTbyBJTUhPIGV2ZW4g
dGhvdWdoIHNvbWUgaGFyZHdhcmUgbWF5IG9mZmVyIHRoaXMgZnVuY3Rpb25hbGl0eSwNCj4gdGhp
cyBpcyBiZXN0IGxlZnQgdG8gYW4gdW5pdmVyc2FsICB1c2Vyc3BhY2UgaW1wbGVtZW50YXRpb24u
DQo+IA0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiANCj4gDQo+ID4gLS0tDQo+ID4gIGRyaXZl
cnMvYWNwaS9wbGF0Zm9ybV9wcm9maWxlLmMgIHwgMTMwICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0NCj4gPiAgaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9wcm9maWxlLmggfCAgIDEgKw0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDEyNSBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0K
PiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNwaS9wbGF0Zm9ybV9wcm9maWxlLmMgYi9k
cml2ZXJzL2FjcGkvcGxhdGZvcm1fcHJvZmlsZS5jDQo+ID4gaW5kZXggZDQxODQ2MmFiNzkxLi5l
NDI0NmU2NjMyY2YgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9hY3BpL3BsYXRmb3JtX3Byb2Zp
bGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvYWNwaS9wbGF0Zm9ybV9wcm9maWxlLmMNCj4gPiBAQCAt
Nyw2ICs3LDcgQEANCj4gPiAgI2luY2x1ZGUgPGxpbnV4L2luaXQuaD4NCj4gPiAgI2luY2x1ZGUg
PGxpbnV4L211dGV4Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbGF0Zm9ybV9wcm9maWxlLmg+
DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9wb3dlcl9zdXBwbHkuaD4NCj4gPiAgI2luY2x1ZGUgPGxp
bnV4L3N5c2ZzLmg+DQo+ID4NCj4gPiAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9wcm9maWxlX2hh
bmRsZXIgKmN1cl9wcm9maWxlOw0KPiA+IEBAIC0yMiw2ICsyMyw1MSBAQCBzdGF0aWMgY29uc3Qg
Y2hhciAqIGNvbnN0IHByb2ZpbGVfbmFtZXNbXSA9IHsNCj4gPiAgfTsNCj4gPiAgc3RhdGljX2Fz
c2VydChBUlJBWV9TSVpFKHByb2ZpbGVfbmFtZXMpID09IFBMQVRGT1JNX1BST0ZJTEVfTEFTVCk7
DQo+ID4NCj4gPiArc3RhdGljIHN0cnVjdCBub3RpZmllcl9ibG9jayBhY19uYjsNCj4gPiArc3Rh
dGljIGludCBjdXJfcHJvZmlsZV9hYzsNCj4gPiArc3RhdGljIGludCBjdXJfcHJvZmlsZV9kYzsN
Cj4gPiArDQo+ID4gK3N0YXRpYyBpbnQgcGxhdGZvcm1fcHJvZmlsZV9zZXQodm9pZCkNCj4gPiAr
ew0KPiA+ICsJaW50IHByb2ZpbGUsIGVycjsNCj4gPiArDQo+ID4gKwlpZiAoY3VyX3Byb2ZpbGVf
ZGMgPT0gUExBVEZPUk1fUFJPRklMRV9VTkNPTkZJR1VSRUQpDQo+ID4gKwkJcHJvZmlsZSA9IGN1
cl9wcm9maWxlX2FjOw0KPiA+ICsJZWxzZSB7DQo+ID4gKwkJaWYgKHBvd2VyX3N1cHBseV9pc19z
eXN0ZW1fc3VwcGxpZWQoKSA+IDApDQo+ID4gKwkJCXByb2ZpbGUgPSBjdXJfcHJvZmlsZV9hYzsN
Cj4gPiArCQllbHNlDQo+ID4gKwkJCXByb2ZpbGUgPSBjdXJfcHJvZmlsZV9kYzsNCj4gPiArCX0N
Cj4gPiArDQo+ID4gKwllcnIgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnByb2ZpbGVfbG9j
ayk7DQo+ID4gKwlpZiAoZXJyKQ0KPiA+ICsJCXJldHVybiBlcnI7DQo+ID4gKw0KPiA+ICsJZXJy
ID0gY3VyX3Byb2ZpbGUtPnByb2ZpbGVfc2V0KGN1cl9wcm9maWxlLCBwcm9maWxlKTsNCj4gPiAr
CWlmIChlcnIpDQo+ID4gKwkJcmV0dXJuIGVycjsNCj4gPiArDQo+ID4gKwlzeXNmc19ub3RpZnko
YWNwaV9rb2JqLCBOVUxMLCAicGxhdGZvcm1fcHJvZmlsZSIpOw0KPiA+ICsJbXV0ZXhfdW5sb2Nr
KCZwcm9maWxlX2xvY2spOw0KPiA+ICsJcmV0dXJuIDA7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0
YXRpYyBpbnQgcGxhdGZvcm1fcHJvZmlsZV9hY3BpX2V2ZW50KHN0cnVjdCBub3RpZmllcl9ibG9j
ayAqbmIsDQo+ID4gKwkJCQkJdW5zaWduZWQgbG9uZyB2YWwsDQo+ID4gKwkJCQkJdm9pZCAqZGF0
YSkNCj4gPiArew0KPiA+ICsJc3RydWN0IGFjcGlfYnVzX2V2ZW50ICplbnRyeSA9IChzdHJ1Y3Qg
YWNwaV9idXNfZXZlbnQgKilkYXRhOw0KPiA+ICsNCj4gPiArCVdBUk5fT04oY3VyX3Byb2ZpbGVf
ZGMgPT0gUExBVEZPUk1fUFJPRklMRV9VTkNPTkZJR1VSRUQpOw0KPiA+ICsNCj4gPiArCS8qIGlm
IHBvd2VyIHN1cHBseSBjaGFuZ2VkLCB0aGVuIHVwZGF0ZSBwcm9maWxlICovDQo+ID4gKwlpZiAo
c3RyY21wKGVudHJ5LT5kZXZpY2VfY2xhc3MsICJhY19hZGFwdGVyIikgPT0gMCkNCj4gPiArCQly
ZXR1cm4gcGxhdGZvcm1fcHJvZmlsZV9zZXQoKTsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4g
PiArfQ0KPiA+ICsNCj4gPiAgc3RhdGljIHNzaXplX3QgcGxhdGZvcm1fcHJvZmlsZV9jaG9pY2Vz
X3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICAJCQkJCXN0cnVjdCBkZXZpY2VfYXR0cmli
dXRlICphdHRyLA0KPiA+ICAJCQkJCWNoYXIgKmJ1ZikNCj4gPiBAQCAtNzcsOSArMTIzLDM0IEBA
IHN0YXRpYyBzc2l6ZV90IHBsYXRmb3JtX3Byb2ZpbGVfc2hvdyhzdHJ1Y3QgZGV2aWNlDQo+ICpk
ZXYsDQo+ID4gIAlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlc1xuIiwgcHJvZmlsZV9uYW1lc1tw
cm9maWxlXSk7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgc3NpemVfdCBwbGF0Zm9ybV9wcm9m
aWxlX3N0b3JlKHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiArc3RhdGljIHNzaXplX3QgY29uZmln
dXJlZF9wcm9maWxlX3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICAJCQkgICAgc3RydWN0
IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ID4gLQkJCSAgICBjb25zdCBjaGFyICpidWYsIHNp
emVfdCBjb3VudCkNCj4gPiArCQkJICAgIGNoYXIgKmJ1ZiwgaW50IHByb2ZpbGUpDQo+ID4gK3sN
Cj4gPiArCWlmIChwcm9maWxlID09IFBMQVRGT1JNX1BST0ZJTEVfVU5DT05GSUdVUkVEKQ0KPiA+
ICsJCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIk5vdC1jb25maWd1cmVkXG4iKTsNCj4gPiArDQo+
ID4gKwkvKiBDaGVjayB0aGF0IHByb2ZpbGUgaXMgdmFsaWQgaW5kZXggKi8NCj4gPiArCWlmIChX
QVJOX09OKChwcm9maWxlIDwgMCkgfHwgKHByb2ZpbGUgPj0gQVJSQVlfU0laRShwcm9maWxlX25h
bWVzKSkpKQ0KPiA+ICsJCXJldHVybiAtRUlPOw0KPiA+ICsJcmV0dXJuIHN5c2ZzX2VtaXQoYnVm
LCAiJXNcbiIsIHByb2ZpbGVfbmFtZXNbcHJvZmlsZV0pOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICtz
dGF0aWMgc3NpemVfdCBwbGF0Zm9ybV9wcm9maWxlX2FjX3Nob3coc3RydWN0IGRldmljZSAqZGV2
LA0KPiA+ICsJCQkJCXN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRyLA0KPiA+ICsJCQkJCWNo
YXIgKmJ1ZikNCj4gPiArew0KPiA+ICsJcmV0dXJuIGNvbmZpZ3VyZWRfcHJvZmlsZV9zaG93KGRl
diwgYXR0ciwgYnVmLCBjdXJfcHJvZmlsZV9hYyk7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRp
YyBzc2l6ZV90IHBsYXRmb3JtX3Byb2ZpbGVfZGNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+
ID4gKwkJCQkJc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ID4gKwkJCQkJY2hhciAq
YnVmKQ0KPiA+ICt7DQo+ID4gKwlyZXR1cm4gY29uZmlndXJlZF9wcm9maWxlX3Nob3coZGV2LCBh
dHRyLCBidWYsIGN1cl9wcm9maWxlX2RjKTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIGlu
dCBwcm9maWxlX3NlbGVjdChjb25zdCBjaGFyICpidWYpDQo+ID4gIHsNCj4gPiAgCWludCBlcnIs
IGk7DQo+ID4NCj4gPiBAQCAtMTA1LDExICsxNzYsNTAgQEAgc3RhdGljIHNzaXplX3QgcGxhdGZv
cm1fcHJvZmlsZV9zdG9yZShzdHJ1Y3QgZGV2aWNlDQo+ICpkZXYsDQo+ID4gIAkJcmV0dXJuIC1F
T1BOT1RTVVBQOw0KPiA+ICAJfQ0KPiA+DQo+ID4gLQllcnIgPSBjdXJfcHJvZmlsZS0+cHJvZmls
ZV9zZXQoY3VyX3Byb2ZpbGUsIGkpOw0KPiA+IC0JaWYgKCFlcnIpDQo+ID4gLQkJc3lzZnNfbm90
aWZ5KGFjcGlfa29iaiwgTlVMTCwgInBsYXRmb3JtX3Byb2ZpbGUiKTsNCj4gPiAtDQo+ID4gIAlt
dXRleF91bmxvY2soJnByb2ZpbGVfbG9jayk7DQo+ID4gKwlyZXR1cm4gaTsNCj4gPiArfQ0KPiA+
ICsNCj4gPiArc3RhdGljIHNzaXplX3QgcGxhdGZvcm1fcHJvZmlsZV9zdG9yZShzdHJ1Y3QgZGV2
aWNlICpkZXYsDQo+ID4gKwkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4g
PiArCQkJICAgIGNvbnN0IGNoYXIgKmJ1Ziwgc2l6ZV90IGNvdW50KQ0KPiA+ICt7DQo+ID4gKwlp
bnQgcHJvZmlsZSwgZXJyOw0KPiA+ICsNCj4gPiArCXByb2ZpbGUJPSBwcm9maWxlX3NlbGVjdChi
dWYpOw0KPiA+ICsJaWYgKHByb2ZpbGUgPCAwKQ0KPiA+ICsJCXJldHVybiBwcm9maWxlOw0KPiA+
ICsNCj4gPiArCWN1cl9wcm9maWxlX2FjID0gcHJvZmlsZTsNCj4gPiArCWVyciA9IHBsYXRmb3Jt
X3Byb2ZpbGVfc2V0KCk7DQo+ID4gKwlpZiAoZXJyKQ0KPiA+ICsJCXJldHVybiBlcnI7DQo+ID4g
KwlyZXR1cm4gY291bnQ7DQo+ID4gK30NCj4gPiArDQo+ID4gK3N0YXRpYyBzc2l6ZV90IHBsYXRm
b3JtX3Byb2ZpbGVfYWNfc3RvcmUoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsJCQkgICAgc3Ry
dWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsDQo+ID4gKwkJCSAgICBjb25zdCBjaGFyICpidWYs
IHNpemVfdCBjb3VudCkNCj4gPiArew0KPiA+ICsJcmV0dXJuIHBsYXRmb3JtX3Byb2ZpbGVfc3Rv
cmUoZGV2LCBhdHRyLCBidWYsIGNvdW50KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiArc3RhdGljIHNz
aXplX3QgcGxhdGZvcm1fcHJvZmlsZV9kY19zdG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4g
KwkJCSAgICBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAqYXR0ciwNCj4gPiArCQkJICAgIGNvbnN0
IGNoYXIgKmJ1Ziwgc2l6ZV90IGNvdW50KQ0KPiA+ICt7DQo+ID4gKwlpbnQgcHJvZmlsZSwgZXJy
Ow0KPiA+ICsNCj4gPiArCXByb2ZpbGUgPSBwcm9maWxlX3NlbGVjdChidWYpOw0KPiA+ICsJaWYg
KHByb2ZpbGUgPCAwKQ0KPiA+ICsJCXJldHVybiBwcm9maWxlOw0KPiA+ICsNCj4gPiArCS8qIFdl
IG5lZWQgdG8gcmVnaXN0ZXIgZm9yIEFDUEkgZXZlbnRzIG5vdyAqLw0KPiA+ICsJaWYgKGN1cl9w
cm9maWxlX2RjID09IFBMQVRGT1JNX1BST0ZJTEVfVU5DT05GSUdVUkVEKQ0KPiA+ICsJCXJlZ2lz
dGVyX2FjcGlfbm90aWZpZXIoJmFjX25iKTsNCj4gPiArDQo+ID4gKwljdXJfcHJvZmlsZV9kYyA9
IHByb2ZpbGU7DQo+ID4gKwllcnIgPSBwbGF0Zm9ybV9wcm9maWxlX3NldCgpOw0KPiA+ICAJaWYg
KGVycikNCj4gPiAgCQlyZXR1cm4gZXJyOw0KPiA+ICAJcmV0dXJuIGNvdW50Ow0KPiA+IEBAIC0x
MTcsMTAgKzIyNywxNCBAQCBzdGF0aWMgc3NpemVfdCBwbGF0Zm9ybV9wcm9maWxlX3N0b3JlKHN0
cnVjdCBkZXZpY2UNCj4gKmRldiwNCj4gPg0KPiA+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8ocGxh
dGZvcm1fcHJvZmlsZV9jaG9pY2VzKTsNCj4gPiAgc3RhdGljIERFVklDRV9BVFRSX1JXKHBsYXRm
b3JtX3Byb2ZpbGUpOw0KPiA+ICtzdGF0aWMgREVWSUNFX0FUVFJfUlcocGxhdGZvcm1fcHJvZmls
ZV9hYyk7DQo+ID4gK3N0YXRpYyBERVZJQ0VfQVRUUl9SVyhwbGF0Zm9ybV9wcm9maWxlX2RjKTsN
Cj4gPg0KPiA+ICBzdGF0aWMgc3RydWN0IGF0dHJpYnV0ZSAqcGxhdGZvcm1fcHJvZmlsZV9hdHRy
c1tdID0gew0KPiA+ICAJJmRldl9hdHRyX3BsYXRmb3JtX3Byb2ZpbGVfY2hvaWNlcy5hdHRyLA0K
PiA+ICAJJmRldl9hdHRyX3BsYXRmb3JtX3Byb2ZpbGUuYXR0ciwNCj4gPiArCSZkZXZfYXR0cl9w
bGF0Zm9ybV9wcm9maWxlX2FjLmF0dHIsDQo+ID4gKwkmZGV2X2F0dHJfcGxhdGZvcm1fcHJvZmls
ZV9kYy5hdHRyLA0KPiA+ICAJTlVMTA0KPiA+ICB9Ow0KPiA+DQo+ID4gQEAgLTE2MSw3ICsyNzUs
OSBAQCBpbnQgcGxhdGZvcm1fcHJvZmlsZV9yZWdpc3RlcihzdHJ1Y3QNCj4gcGxhdGZvcm1fcHJv
ZmlsZV9oYW5kbGVyICpwcHJvZikNCj4gPiAgCX0NCj4gPg0KPiA+ICAJY3VyX3Byb2ZpbGUgPSBw
cHJvZjsNCj4gPiArCWN1cl9wcm9maWxlX2FjID0gY3VyX3Byb2ZpbGVfZGMgPQ0KPiBQTEFURk9S
TV9QUk9GSUxFX1VOQ09ORklHVVJFRDsNCj4gPiAgCW11dGV4X3VubG9jaygmcHJvZmlsZV9sb2Nr
KTsNCj4gPiArCWFjX25iLm5vdGlmaWVyX2NhbGwgPSBwbGF0Zm9ybV9wcm9maWxlX2FjcGlfZXZl
bnQ7DQo+ID4gIAlyZXR1cm4gMDsNCj4gPiAgfQ0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQTChwbGF0
Zm9ybV9wcm9maWxlX3JlZ2lzdGVyKTsNCj4gPiBAQCAtMTY5LDYgKzI4NSw4IEBAIEVYUE9SVF9T
WU1CT0xfR1BMKHBsYXRmb3JtX3Byb2ZpbGVfcmVnaXN0ZXIpOw0KPiA+ICBpbnQgcGxhdGZvcm1f
cHJvZmlsZV9yZW1vdmUodm9pZCkNCj4gPiAgew0KPiA+ICAJc3lzZnNfcmVtb3ZlX2dyb3VwKGFj
cGlfa29iaiwgJnBsYXRmb3JtX3Byb2ZpbGVfZ3JvdXApOw0KPiA+ICsJaWYgKGN1cl9wcm9maWxl
X2RjICE9IFBMQVRGT1JNX1BST0ZJTEVfVU5DT05GSUdVUkVEKQ0KPiA+ICsJCXVucmVnaXN0ZXJf
YWNwaV9ub3RpZmllcigmYWNfbmIpOw0KPiA+DQo+ID4gIAltdXRleF9sb2NrKCZwcm9maWxlX2xv
Y2spOw0KPiA+ICAJY3VyX3Byb2ZpbGUgPSBOVUxMOw0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L3BsYXRmb3JtX3Byb2ZpbGUuaCBiL2luY2x1ZGUvbGludXgvcGxhdGZvcm1fcHJvZmls
ZS5oDQo+ID4gaW5kZXggZTVjYmI2ODQxZjNhLi4zNDU2NjI1NmJiNjAgMTAwNjQ0DQo+ID4gLS0t
IGEvaW5jbHVkZS9saW51eC9wbGF0Zm9ybV9wcm9maWxlLmgNCj4gPiArKysgYi9pbmNsdWRlL2xp
bnV4L3BsYXRmb3JtX3Byb2ZpbGUuaA0KPiA+IEBAIC0xNSw2ICsxNSw3IEBADQo+ID4gICAqIElm
IG1vcmUgb3B0aW9ucyBhcmUgYWRkZWQgcGxlYXNlIHVwZGF0ZSBwcm9maWxlX25hbWVzIGFycmF5
IGluDQo+ID4gICAqIHBsYXRmb3JtX3Byb2ZpbGUuYyBhbmQgc3lzZnMtcGxhdGZvcm1fcHJvZmls
ZSBkb2N1bWVudGF0aW9uLg0KPiA+ICAgKi8NCj4gPiArI2RlZmluZSBQTEFURk9STV9QUk9GSUxF
X1VOQ09ORklHVVJFRCAtMQ0KPiA+DQo+ID4gIGVudW0gcGxhdGZvcm1fcHJvZmlsZV9vcHRpb24g
ew0KPiA+ICAJUExBVEZPUk1fUFJPRklMRV9MT1dfUE9XRVIsDQo=
