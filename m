Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F6BF4DC792
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Mar 2022 14:28:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232441AbiCQNaH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 17 Mar 2022 09:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231908AbiCQNaG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Mar 2022 09:30:06 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam07on2086.outbound.protection.outlook.com [40.107.95.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B93911CF79
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Mar 2022 06:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCwTxxpEgdB4U0lasE/ao5Oky1dqj+czkSdCzTqRMYWLzjIZhiJEcWVluNterDnmgx5y0ik7ThpcpQH8zObBHZO+4kKtfU435Rnhcp+Cs+R2gfw5fAtdws/7bfAHx6BK6FTtorayugjDu8aKSXXb4132coxVUHEgGYjvU0nb0eXnUBMhhWIvqXQKRDB17IlI6jizqHAW+0sDArGAj9gUHuDknTXfkjsJR8QEx55Ik9+gfig8nMVWDPnCX4lcHIiP/seoDF2j1YP9kQck3DjA0aouIIeie3kMgsB3MtyDF4qR0up31PrwbOBEMTrsyc4iE5zIZJlOI+Ey+LsEMqoncg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2JNUUBNuDgR1mftOsB08mYggGJs0RlAng9na+M2ju4=;
 b=eG++g/ZnPhtqCFlvbQj/CuC5FSmCRLqFmWuVkXFTN4rmqzF0LTHCaV0R7CPA6lrITlLJpQyszYkWI+Hyv0gPj5RCOLvXFt4bKDi6wmLqtDIaDABJJK/756/y1JeEGRfNwjHC3uqOHfA53QG44LQluC2WOiyLpfDB9ZqmCzScmyxAFz1MYXPIBLK+gRT4PSKlIudzIIiJOKKgGCiA6qmMENN2oWM8UDYW8k3YFfhFxheMKrAUg/GOhm2wjGQqfsWqurQ+orOkJjGu+n7rbGMWE9LzEcikawRMflZo/pXMI7ZjGmbFKeIc7KSabS/ZznfXDKiJQHw3r6jxQAVC+yysiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2JNUUBNuDgR1mftOsB08mYggGJs0RlAng9na+M2ju4=;
 b=lSBK4cFfR1bqI2KKUSzfp5Vp4yd1bb1cCyhoPCpdwIy15Sb1U9rMn0nywBEi1SY/HC/5zQZssyRV2Qzn/vQhw+Jk7WyOnWaoD4VH0IwnK27OkLtz7HrsuWtfDQzhN2OwTMJEkTzPMXEPiftepXJBr6q20/0t2bZBSrZBDLrXcGGSjzqXncyN7sptG9aeL/FJCHNfozWC8IyeuctlIOiU2gS/kp8YJs5P4gZQKN3gJ0x4sTSJpMy7a/Dt/FXGQY7f669AAV7H3UPfYTY8Zph4g3dgRqWaruUKKg99NPWkjIRBqyMQBFE4dHkNQjKWSJSr6SSpeQT3UuXAQahuMdcckA==
Received: from BYAPR12MB2760.namprd12.prod.outlook.com (2603:10b6:a03:72::16)
 by BN8PR12MB4595.namprd12.prod.outlook.com (2603:10b6:408:72::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.15; Thu, 17 Mar
 2022 13:28:47 +0000
Received: from BYAPR12MB2760.namprd12.prod.outlook.com
 ([fe80::e15d:79e3:9f44:6624]) by BYAPR12MB2760.namprd12.prod.outlook.com
 ([fe80::e15d:79e3:9f44:6624%6]) with mapi id 15.20.5081.017; Thu, 17 Mar 2022
 13:28:46 +0000
From:   Daniel Dadap <ddadap@nvidia.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "Mario.Limonciello@amd.com" <Mario.Limonciello@amd.com>,
        Alexandru Dinu <alex.dinu07@gmail.com>
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Thread-Topic: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused
 firmware
Thread-Index: AQHYOXVLtURHpxADJ0mmhLsy8HyBxqzDfxMAgAAT3XA=
Date:   Thu, 17 Mar 2022 13:28:46 +0000
Message-ID: <D7458E1F-6F4F-48E6-B100-B4B9B1226BCF@nvidia.com>
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com>
 <100e0cb5-98c4-cdd9-cfc7-4b76edef8950@redhat.com>
In-Reply-To: <100e0cb5-98c4-cdd9-cfc7-4b76edef8950@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 549eee25-ddd2-4685-e1af-08da081a1076
x-ms-traffictypediagnostic: BN8PR12MB4595:EE_
x-microsoft-antispam-prvs: <BN8PR12MB459566541BEE860DDD7AED48BC129@BN8PR12MB4595.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8IESe4iwz61Pi/6WWqSg6q1orhCj+DYSCwZW6NdDBDu1NqlHmSNoi9Mdu4u8UZdBxkX3Qinr1tUIaZ5S32jA1bLCQFFGWiZgL3T0lMz1kLEEkFJ6ph2qXr9ERtNEmhbE3N0iqi8WYXJtfcRKyx634psh4X+LrKgjEr3qYe1G7l5e4ac2b8BBmCphVEL4PCsKfrb1nXz/XTKr0fzILGv2NC7EYH/Z1AmRyyoT+4oOmoifCKgFAquSnIKHDuxOrlhk1SjfiIBosPFzR2TRX2ijLvLpel5WW7ui3G8I9DA7v5JGd/VVcbpkT8fVLbvAEgLW6PDCjnjLjlDsm10RoSWTbF8CYkKZfkqH60ijOjmr/KOGGxvXySFgBJCfopOl+yRGrEKxHl5antwIXzb4fzvmVU7ai9E/Bd+wDY1T86wzxz06ZWgWbgAIXoRXeFMJnwqH4ldU/Y/UVaOWIjM2m/BIzkgEih1WfnKMw9Ygme+ziSFfOHw5hLWw0Z8955nGqsbpKHynbxQFf0SF1dF9t36zi2LEjKhOLHrpBWTUpWdkhEbGpfjhet91GMDP6GsthB+7moVNq35qvMZ/IQnZh1HTNo8748IJ9H9LAa8a/qJzk8zBNFHe9M+nqoxtOmP1Bpf13XbP8df58smYF166LPA2n04mjzKNQtZ4zkTFN8huW9lAzvm/wVup9umOZnQDxnq/RxtJKhpKLQ/bq2wwjCwRtq3jJyR2dnh4sWE7qx8iNzg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB2760.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66574015)(38070700005)(83380400001)(186003)(26005)(38100700002)(122000001)(54906003)(8936002)(5660300002)(30864003)(66446008)(8676002)(64756008)(4326008)(2906002)(76116006)(508600001)(66946007)(53546011)(2616005)(6512007)(316002)(91956017)(71200400001)(6486002)(6916009)(33656002)(86362001)(6506007)(36756003)(66556008)(66476007)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0VRRDdvRXExRFVlN1pUYkV5TGVIcXNibTRjRUw0V0pleDk1VTBjdlZaZmZJ?=
 =?utf-8?B?S295dzUwVmpHaGpJSU8wMDdVTGFTckpWUkR0citoYzFrVkpGMjM3bmFqVGtw?=
 =?utf-8?B?Zm5ldkNOMXdVZEY2RXF5SG02eDdFUW0vZ09hRGNyVjlVQlFNbWxtc1cwTTlq?=
 =?utf-8?B?TTVPMFVqYTAzVTNHOUVZRGg1TFdTWWxzTHFYOENUUnNKZEt0b0R0WHVRZ2JN?=
 =?utf-8?B?ekExdXg3QzlHUy8zTW1lZkE0VVVERm90TDI0NnNEYi80N0NKK2dNUFFwQXRX?=
 =?utf-8?B?enV2U0N2cVFsWlZ0TVg3c0x6bTJxdERjMlZKdTYxT0R0QTJLZEN2cjJqUWpU?=
 =?utf-8?B?ZXNlYWY5Q1BrYWI2ZHd5MFJEZXI4M25PMVBjejcrWnlZWFhXM1RVNXo1eFN0?=
 =?utf-8?B?QUlSa1VhODRDbjk4alduY3FLZC9jbW9pQTJYcUdyRzl0ZWZiZ0E3eVFoc1A0?=
 =?utf-8?B?YUVqbEpFaVJXV1BjU1Nyb2lVUWZuMGx3R01iTWp2OE94Q0NwOHZzcm1DdlEz?=
 =?utf-8?B?WFBJSjFmS3ljTmVLSlJNTy80eFBoY1NTMjJDR0lnc0pPUks4Y3hVL2NzUGU3?=
 =?utf-8?B?ZHAvRStseDJCTmdIM3JJc09vNXoxdHRxdEZQUGRUREZMKy9aVzlWZjdsWHpU?=
 =?utf-8?B?UlZZZzlzVSs4eEhPdFoxQ2dBeGUyRGVpSGRRZjJWNFpHSjFkanJmWmhYcmVK?=
 =?utf-8?B?V044eWdQaUxJT1JMYlp5RWsyNGFOSGEwM0RES3JiendjQ2dpV2FjN00ySnlN?=
 =?utf-8?B?UzlReVU5UlpQRCtKclcwNmgvdkNURWtWckR6UEh3aFQvK0RyL3Z6WmwrSFF4?=
 =?utf-8?B?N1FjSytrL2orNG1xL1JmbkZjOS8zRCtUTU9OTy9LdGt6YVNlYjA4R3RuMFkv?=
 =?utf-8?B?Z2dlY1ZoQ2pGTVgrYjV3SEJZWUp3ZCtaQk9kcWZLbVBaK0xOT2twa3g4eWE4?=
 =?utf-8?B?ZDJHa0dpR0FZM3p1bjBOMGk4eGV3Wi9KOXhHZklGMEk5UE1NbXBZL0dGaTVZ?=
 =?utf-8?B?OERFRU1NUGQ0cnNkK3g5U3NPTHIxY0Y3cVRFLzlKUVRwM20vQjJUVzdpTFRT?=
 =?utf-8?B?aUd4VUVsNWd2cEhuRkZDMkdlcHhKdFBHV0g0aDBPZWNTNWJTb1FYbGpNQ0RQ?=
 =?utf-8?B?ZWFST0NGMVkxVmFaa0FhelBSV2xmV2Y1MWZ2MHh0TlNLeEpGVFBzeFRnUFAv?=
 =?utf-8?B?RVc2cjZNZXlBSzBvTG9mb1JpU0pqTUF1NXBHSjdDV1lWYitWdDM0NTc2TTR1?=
 =?utf-8?B?TWZwQm5LK0NiaG50TTIzSjhyLzc5bFFVREJTdFh2SmM5ZDBrSHNmYmtEYVVF?=
 =?utf-8?B?TWxlWStaRmhyS3FsLzRCSG1qVmlKdnBNcGpmZWxTSm5jNTBQb1JxK0ZWODIy?=
 =?utf-8?B?WTh2RlJZWEMydmRXRDJPZU9obElzbFJ1ZUVmKzJuakFpZDFyejRMVWVkVENX?=
 =?utf-8?B?WWcyQ2w2VzZIdVd1ZjFUaC9qT3U5eFBaaEFNWHRMT0FlTmpHMEw0SFFqNWJO?=
 =?utf-8?B?TzZiRzdlU2lXaDBOWGFPdnhjaStEdmpjeTU5N3BvRWx1VEVnVmdOc0NUTkJH?=
 =?utf-8?B?b1A4WElmQS94YVhYK1hBcTRCZVZGdnVWdU05TEI5UDdTdVVIeXEvSWpYMStr?=
 =?utf-8?B?TkdQbFZqNWd1a1FZVTN5OTlzcFU3Zmt1dC9DaDlnMTRwUEppelNFdFRiaUhG?=
 =?utf-8?B?NnBqbVo3bWwwNlYvSlM1TXI3MkVqR2M3TnNUUVhRdnRGN08zN0JhTFlvUlNK?=
 =?utf-8?B?NlVEOUF6VTFQc2VKdDNhQktqRkllUlR5ek1lOEt6VDZjcWJYL0RiQnJndTY3?=
 =?utf-8?B?dnNBYW1pa1V1RjdMUVp3eWVmOVFHUTFjQkMxbnNVT29Pc013V21ocHg4anpP?=
 =?utf-8?B?NSt1S3lUdUY0K3k3Zi9ab3FKK0FIbmZ0UkpodDRUK3Z0UlhXbFJycVlGMG01?=
 =?utf-8?Q?FOatmmXSGBMWjBy0QVoBmrljAnQvWCus?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB2760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 549eee25-ddd2-4685-e1af-08da081a1076
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2022 13:28:46.3807
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1FQGnafXcuaOueoN3z4hUeZd6hL1AuSqsDHct2ZvqidzPKlMfdwjpbqzzFFMNoLfDZyrHo/XaUTk27JONzYOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB4595
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

DQo+IE9uIE1hciAxNywgMjAyMiwgYXQgMDc6MTcsIEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+IHdyb3RlOg0KPiANCj4g77u/SGksDQo+IA0KPj4gT24gMy8xNi8yMiAyMTozMywg
RGFuaWVsIERhZGFwIHdyb3RlOg0KPj4gU29tZSBub3RlYm9vayBzeXN0ZW1zIHdpdGggRUMtZHJp
dmVuIGJhY2tsaWdodCBjb250cm9sIGFwcGVhciB0byBoYXZlIGENCj4+IGZpcm13YXJlIGJ1ZyB3
aGljaCBjYXVzZXMgdGhlIHN5c3RlbSB0byB1c2UgR1BVLWRyaXZlbiBiYWNrbGlnaHQgY29udHJv
bA0KPj4gdXBvbiBhIGZyZXNoIGJvb3QsIGJ1dCB0aGVuIHN3aXRjaGVzIHRvIEVDLWRyaXZlbiBi
YWNrbGlnaHQgY29udHJvbA0KPj4gYWZ0ZXIgY29tcGxldGluZyBhIHN1c3BlbmQvcmVzdW1lIGN5
Y2xlLiBBbGwgdGhlIHdoaWxlLCB0aGUgZmlybXdhcmUNCj4+IHJlcG9ydHMgdGhhdCB0aGUgYmFj
a2xpZ2h0IGlzIHVuZGVyIEVDIGNvbnRyb2wsIHJlZ2FyZGxlc3Mgb2Ygd2hhdCBpcw0KPj4gYWN0
dWFsbHkgY29udHJvbGxpbmcgdGhlIGJhY2tsaWdodCBicmlnaHRuZXNzLg0KPj4gDQo+PiBUaGlz
IGxlYWRzIHRvIHRoZSBmb2xsb3dpbmcgYmVoYXZpb3I6DQo+PiANCj4+ICogbnZpZGlhLXdtaS1l
Yy1iYWNrbGlnaHQgZ2V0cyBwcm9iZWQgb24gYSBmcmVzaCBib290LCBkdWUgdG8gdGhlDQo+PiAg
V01JLXdyYXBwZWQgQUNQSSBtZXRob2QgZXJyb25lb3VzbHkgcmVwb3J0aW5nIEVDIGNvbnRyb2wu
DQo+PiAqIG52aWRpYS13bWktZWMtYmFja2xpZ2h0IGRvZXMgbm90IHdvcmsgdW50aWwgYWZ0ZXIg
YSBzdXNwZW5kL3Jlc3VtZQ0KPj4gIGN5Y2xlLCBkdWUgdG8gdGhlIGJhY2tsaWdodCBjb250cm9s
IGFjdHVhbGx5IGJlaW5nIEdQVS1kcml2ZW4uDQo+PiAqIEdQVSBkcml2ZXJzIGFsc28gcmVnaXN0
ZXIgdGhlaXIgb3duIGJhY2tsaWdodCBoYW5kbGVyczogaW4gdGhlIGNhc2UNCj4+ICBvZiB0aGUg
bm90ZWJvb2sgc3lzdGVtIHdoZXJlIHRoaXMgYmVoYXZpb3IgaGFzIGJlZW4gb2JzZXJ2ZWQsIGJv
dGgNCj4+ICBhbWRncHUgYW5kIHRoZSBOVklESUEgcHJvcHJpZXRhcnkgZHJpdmVyIHJlZ2lzdGVy
IGJhY2tsaWdodCBoYW5kbGVycy4NCj4+ICogVGhlIEdQVSB3aGljaCBoYXMgYmFja2xpZ2h0IGNv
bnRyb2wgdXBvbiBhIGZyZXNoIGJvb3QgKGFtZGdwdSBpbiB0aGUNCj4+ICBjYXNlIG9ic2VydmVk
IHNvIGZhcikgY2FuIHN1Y2Nlc3NmdWxseSBjb250cm9sIHRoZSBiYWNrbGlnaHQgdGhyb3VnaA0K
Pj4gIGl0cyBiYWNrbGlnaHQgZHJpdmVyJ3Mgc3lzZnMgaW50ZXJmYWNlLCBidXQgc3RvcHMgd29y
a2luZyBhZnRlciB0aGUNCj4+ICBmaXJzdCBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4NCj4+ICogbnZp
ZGlhLXdtaS1lYy1iYWNrbGlnaHQgaXMgdW5hYmxlIHRvIGNvbnRyb2wgdGhlIGJhY2tsaWdodCB1
cG9uIGENCj4+ICBmcmVzaCBib290LCBidXQgYmVnaW5zIHRvIHdvcmsgYWZ0ZXIgdGhlIGZpcnN0
IHN1c3BlbmQvcmVzdW1lIGN5Y2xlLg0KPj4gKiBUaGUgR1BVIHdoaWNoIGRvZXMgbm90IGhhdmUg
YmFja2xpZ2h0IGNvbnRyb2wgKE5WSURJQSBpbiB0aGlzIGNhc2UpDQo+PiAgaXMgbm90IGFibGUg
dG8gY29udHJvbCB0aGUgYmFja2xpZ2h0IGF0IGFueSBwb2ludCB3aGlsZSB0aGUgc3lzdGVtDQo+
PiAgaXMgaW4gb3BlcmF0aW9uLiBPbiBzaW1pbGFyIGh5YnJpZCBzeXN0ZW1zIHdpdGggYW4gRUMt
Y29udHJvbGxlZA0KPj4gIGJhY2tsaWdodCwgYW5kIEFNRC9OVklESUEgaUdQVS9kR1BVLCB0aGUg
TlZJRElBIHByb3ByaWV0YXJ5IGRyaXZlcg0KPj4gIGRvZXMgbm90IHJlZ2lzdGVyIGl0cyBiYWNr
bGlnaHQgaGFuZGxlci4gSXQgaGFzIG5vdCBiZWVuIGRldGVybWluZWQNCj4+ICB3aGV0aGVyIHRo
ZSBub24tZnVuY3Rpb25hbCBoYW5kbGVyIHJlZ2lzdGVyZWQgYnkgdGhlIE5WSURJQSBkcml2ZXIN
Cj4+ICBpcyBkdWUgdG8gYW5vdGhlciBmaXJtd2FyZSBidWcsIG9yIGEgYnVnIGluIHRoZSBOVklE
SUEgZHJpdmVyLg0KPj4gDQo+PiBTaW5jZSBudmlkaWEtd21pLWVjLWJhY2tsaWdodCByZWdpc3Rl
cnMgYXMgYSBCQUNLTElHSFRfRklSTVdBUkUgdHlwZQ0KPj4gZGV2aWNlLCBpdCB0YWtlcyBwcmVj
ZWRlbmNlIG92ZXIgdGhlIEJBQ0tMSUdIVF9SQVcgZGV2aWNlcyByZWdpc3RlcmVkDQo+PiBieSB0
aGUgR1BVIGRyaXZlcnMuIFRoaXMgaW4gdHVybiBsZWFkcyB0byBiYWNrbGlnaHQgY29udHJvbCBh
cHBlYXJpbmcNCj4+IHRvIGJlIG5vbi1mdW5jdGlvbmFsIHVudGlsIGFmdGVyIGNvbXBsZXRpbmcg
YSBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4NCj4+IEhvd2V2ZXIsIGl0IGlzIHN0aWxsIHBvc3NpYmxl
IHRvIGNvbnRyb2wgdGhlIGJhY2tsaWdodCB0aHJvdWdoIGRpcmVjdA0KPj4gaW50ZXJhY3Rpb24g
d2l0aCB0aGUgd29ya2luZyBHUFUgZHJpdmVyJ3MgYmFja2xpZ2h0IHN5c2ZzIGludGVyZmFjZS4N
Cj4+IA0KPj4gVGhlc2Ugc3lzdGVtcyBhbHNvIGFwcGVhciB0byBoYXZlIGEgc2Vjb25kIGZpcm13
YXJlIGJ1ZyB3aGljaCByZXNldHMNCj4+IHRoZSBFQydzIGJyaWdodG5lc3MgbGV2ZWwgdG8gMTAw
JSBvbiByZXN1bWUsIGJ1dCBsZWF2ZXMgdGhlIHN0YXRlIGluDQo+PiB0aGUga2VybmVsIGF0IHRo
ZSBwcmUtc3VzcGVuZCBsZXZlbC4gVGhpcyBjYXVzZXMgYXR0ZW1wdHMgdG8gc2F2ZQ0KPj4gYW5k
IHJlc3RvcmUgdGhlIGJhY2tsaWdodCBsZXZlbCBhY3Jvc3MgdGhlIHN1c3BlbmQvcmVzdW1lIGN5
Y2xlIHRvDQo+PiBmYWlsLCBkdWUgdG8gdGhlIGxldmVsIGFwcGVhcmluZyBub3QgdG8gY2hhbmdl
IGV2ZW4gdGhvdWdoIGl0IGRpZC4NCj4+IA0KPj4gSW4gb3JkZXIgdG8gd29yayBhcm91bmQgdGhl
c2UgaXNzdWVzLCBhZGQgYSBxdWlyayB0YWJsZSB0byBkZXRlY3QNCj4+IHN5c3RlbXMgdGhhdCBh
cmUga25vd24gdG8gc2hvdyB0aGVzZSBiZWhhdmlvcnMuIFNvIGZhciwgdGhlcmUgaXMNCj4+IG9u
bHkgb25lIGtub3duIHN5c3RlbSB0aGF0IHJlcXVpcmVzIHRoZXNlIHdvcmthcm91bmRzLCBhbmQg
Ym90aA0KPj4gaXNzdWVzIGFyZSBwcmVzZW50IG9uIHRoYXQgc3lzdGVtLCBidXQgdGhlIHF1aXJr
cyBhcmUgdHJhY2tlZA0KPj4gc2VwYXJhdGVseSB0byBtYWtlIGl0IGVhc2llciB0byBhZGQgdGhl
bSB0byBvdGhlciBzeXN0ZW1zIHdoaWNoDQo+PiBtYXkgZXhoaWJpdCBvbmUgb2YgdGhlIGJ1Z3Ms
IGJ1dCBub3QgdGhlIG90aGVyLiBUaGUgb3JpZ2luYWwgc3lzdGVtcw0KPj4gdGhhdCB0aGlzIGRy
aXZlciB3YXMgdGVzdGVkIG9uIGR1cmluZyBkZXZlbG9wbWVudCBkbyBub3QgZXhoaWJpdA0KPj4g
ZWl0aGVyIG9mIHRoZXNlIHF1aXJrcy4NCj4+IA0KPj4gSWYgYSBzeXN0ZW0gd2l0aCB0aGUgIkdQ
VSBkcml2ZXIgaGFzIGJhY2tsaWdodCBjb250cm9sIiBxdWlyayBpcw0KPj4gZGV0ZWN0ZWQsIG52
aWRpYS13bWktZWMtYmFja2xpZ2h0IHdpbGwgZ3JhYiBhIHJlZmVyZW5jZSB0byB0aGUgd29ya2lu
Zw0KPj4gKHdoZW4gZnJlc2hseSBib290ZWQpIEdQVSBiYWNrbGlnaHQgaGFuZGxlciBhbmQgcmVs
YXlzIGFueSBiYWNrbGlnaHQNCj4+IGJyaWdodG5lc3MgbGV2ZWwgY2hhbmdlIHJlcXVlc3RzIGRp
cmVjdGVkIGF0IHRoZSBFQyB0byBhbHNvIGJlIGFwcGxpZWQNCj4+IHRvIHRoZSBHUFUgYmFja2xp
Z2h0IGludGVyZmFjZS4gVGhpcyBsZWFkcyB0byByZWR1bmRhbnQgdXBkYXRlcw0KPj4gZGlyZWN0
ZWQgYXQgdGhlIEdQVSBiYWNrbGlnaHQgZHJpdmVyIGFmdGVyIGEgc3VzcGVuZC9yZXN1bWUgY3lj
bGUsIGJ1dA0KPj4gaXQgZG9lcyBhbGxvdyB0aGUgRUMgYmFja2xpZ2h0IGNvbnRyb2wgdG8gd29y
ayB3aGVuIHRoZSBzeXN0ZW0gaXMNCj4+IGZyZXNobHkgYm9vdGVkLg0KPiANCj4gVWdoLCBJJ20g
cmVhbGx5IG5vdCBhIGZhbiBvZiB0aGUgYmFja2xpZ2h0IHByb3h5IHBsYW4gaGVyZS4gSSBoYXZl
DQo+IHBsYW5zIHRvIGNsZWFuLXVwIHRoZSB3aG9sZSB4ODYgYmFja2xpZ2h0IG1lc3Mgc29vbiBh
bmQgYW4gaW1wb3J0YW50IHBhcnQNCj4gb2YgdGhhdCBpcyB0byBzdG9wIHJlZ2lzdGVyaW5nIG11
bHRpcGxlIGJhY2tsaWdodCBpbnRlcmZhY2VzIGZvciB0aGUNCj4gc2FtZSBwYW5lbC9zY3JlZW4u
DQo+IA0KPiBXaGVyZSBhcyBnb2luZyB3aXRoIHRoaXMgd29ya2Fyb3VuZCByZXF1aXJlcyB1cyB0
byBoYXZlIDIgYWN0aXZlDQo+IGJhY2tsaWdodCBpbnRlcmZhY2VzIGFjdGl2ZS4gQWxzbyB0aGlz
IHdpbGwgdmVyeSBsaWtlbHkgd29yayB0bw0KPiAoc3VidGx5KSBkaWZmZXJlbnQgYmFja2xpZ2h0
IGJlaGF2aW9yIGJlZm9yZSBhbmQgYWZ0ZXIgdGhlIGZpcnN0DQo+IHN1c3BlbmQvcmVzdW1lLg0K
DQpJIHVuZGVyc3RhbmQuIEhhdmluZyBtdWx0aXBsZSBiYWNrbGlnaHQgZGV2aWNlcyBmb3IgdGhl
IHNhbWUgcGFuZWwgaXMgaW5kZWVkIGFubm95aW5nLiBPdXQgb2YgY3VyaW9zaXR5LCB3aGF0IGlz
IHRoZSBwbGFuIGZvciBkZXRlcm1pbmluZyB0aGF0IG11bHRpcGxlIGJhY2tsaWdodCBpbnRlcmZh
Y2VzIGFyZSBhbGwgc3VwcG9zZWQgdG8gY29udHJvbCB0aGUgc2FtZSBwYW5lbD8gSeKAmW0gbm90
IHN1cmUgSeKAmW0gYXdhcmUgb2YgYW55IGRyaXZlci1hZ25vc3RpYyB3YXlzIG9mIGlkZW50aWZ5
aW5nIGEgcGFydGljdWxhciBwYW5lbCBpbnN0YW5jZSB1bmlxdWVseSwgYW5kIGlmIHRoZXJlIGlz
IG9uZSwgdGhhdCB3b3VsZCBhY3R1YWxseSBoZWxwIHdpdGggc29tZXRoaW5nIGVsc2UgSeKAmW0g
d29ya2luZyBvbiBhdCB0aGUgbW9tZW50LiBJZiB0aGUgaWRlYSBpbnZvbHZlcyBlLmcuIHRoZSBF
RElELCB0aGF0IGNvdWxkIGJlIHRyb3VibGVzb21lIGZvciBiYWNrbGlnaHQgZHJpdmVycyBzdWNo
IGFzIHRoaXMgb25lIHdoaWNoIGFyZW7igJl0IGFzc29jaWF0ZWQgd2l0aCBhbnkgR1BVLg0KDQpU
aGlzIGFsc28gZ2l2ZXMgbWUgYW4gaWRlYSBmb3IgYW5vdGhlciBleHBlcmltZW50IEkgZGlkbuKA
mXQgdGhpbmsgdG8gdHJ5IGVhcmxpZXIuIEFsZXg6IHdoYXQgaGFwcGVucyBpZiB5b3UgaGFjayBh
bWRncHVfYXRvbWJpb3NfZW5jb2Rlcl9pbml0X2JhY2tsaWdodCgpIGluIHRoZSBhbWRncHUgZHJp
dmVyIHRvIGp1c3QgcmV0dXJuIHJpZ2h0IGF3YXk/IEkgd29uZGVyIGlmIHRoZSBBTUQgR1BV4oCZ
cyBhdHRlbXB0IHRvIHRha2Ugb3ZlciBiYWNrbGlnaHQgY29udHJvbCBpcyB3aGF0IG1ha2VzIHRo
ZSBmaXJtd2FyZSBnaXZlIGNvbnRyb2wgdG8gdGhlIEdQVSByYXRoZXIgdGhhbiB0aGUgRUMgaW5p
dGlhbGx5Lg0KDQpSZWdhcmRsZXNzIG9mIHRoZSBiYWNrbGlnaHQgcHJveHkgd29ya2Fyb3VuZCwg
ZG9lcyB0aGUgZm9yY2UgcmVmcmVzaCBvbmUgc2VlbSByZWFzb25hYmxlPyBUaGF0IG9uZSBhdCBs
ZWFzdCBhZGRyZXNzZXMgYSBjb25kaXRpb24gdGhhdCBoYXBwZW5zIGF0IGV2ZXJ5IHN1c3BlbmQv
cmVzdW1lIGN5Y2xlLg0KDQo+IElzIHRoZXJlIG5vIG90aGVyIHdheSB0byBzb2x2ZSB0aGlzIGlz
c3VlPyBNYXliZSB3ZSBuZWVkIHRvIHBva2UNCj4gdmdhc3dpdGNoZXJvbyB0byBzZXQgdGhlIGN1
cnJlbnQgR1BVIG1vZGUgZXZlbiB0aG91Z2ggdGhpcyBpcw0KPiBhbHJlYWR5IHJlcG9ydGVkIGFz
IGFjdGl2ZSB0byBnZXQgdGhpbmdzIHRvIHN3aXRjaCB0byB0aGUgRUNzDQo+IGNvbnRyb2wgcmln
aHQgYXdheSA/DQoNClRoZXJlIGlzbuKAmXQgYSB2Z2Fzd2l0Y2hlcm9vIGhhbmRsZXIgZm9yIHRo
aXMgcGFydGljdWxhciBtdXggZGV2aWNlICh5ZXQpLCBidXQgdGhlcmUgYXJlIHNlcGFyYXRlIEFD
UEkgaW50ZXJmYWNlcyBmb3IgdGhlIG11eCBpdHNlbGYuIFBva2luZyB0aGUgbXV4ICpzaG91bGRu
4oCZdCogaGF2ZSBhbnkgZWZmZWN0IG9uIHdoYXQgZGV2aWNlIGlzIGNvbnRyb2xsaW5nIHRoZSBi
YWNrbGlnaHQgZm9yIHRoZSBwYW5lbCwgc2luY2Ugd2hlbiB0aGUgc3lzdGVtIGlzIGluIGR5bmFt
aWMgbXV4IG1vZGUgdGhlIEVDIGlzIGFsd2F5cyBzdXBwb3NlZCB0byBiZSBpbiBjb250cm9sLCBi
dXQgdGhpcyBzeXN0ZW0gaXMgYWxyZWFkeSBzaG93aW5nIHNvbWUgd2VpcmQgYmVoYXZpb3IsIHNv
IGl0IGRvZXNu4oCZdCBodXJ0IHRvIHRyeS4NCg0KPiBJJ20gcHJldHR5IGNlcnRhaW4gdGhhdCBX
aW5kb3dzIGlzIG5vdCBkb2luZyB0aGlzIGJhY2tsaWdodCBwcm94eWluZywNCj4gSU1ITyB3ZSBu
ZWVkIHRvIGZpZ3VyZSBvdXQgd2hhdCBjYXVzZXMgdGhlIHN3aXRjaCBhZnRlciBzdXNwZW5kL3Jl
c3VtZQ0KPiBhbmQgdGhlbiBkbyB0aGF0IHRoaW5nIGF0IGJvb3QuDQoNCknigJlsbCBwdXQgdG9n
ZXRoZXIgYW4gaW5zdHJ1bWVudGVkIGRyaXZlciBmb3IgQWxleCB0byB0cnkgb24gaGlzIHN5c3Rl
bSwgdG8gY2FwdHVyZSBzb21lIG1vcmUgZGF0YSBhbmQgc2VlIGlmIEkgY2FuIGdldCBzb21lIG1v
cmUgaW5zaWdodCBpbnRvIHRoYXQuIEkgYWxzbyBoYXZlIGEgZHVtcCBvZiBoaXMgQUNQSSB0YWJs
ZXMsIGFuZCBjYW4gY2hlY2sgdGhlcmUgZm9yIHNvbWUgb3RoZXIgcG90ZW50aWFsIGxlYWRzLiBI
b3BlZnVsbHkgd2hhdGV2ZXIgY2hhbmdlcyB0aGUgc3RhdGUgYWNyb3NzIHRoZSBzdXNwZW5kL3Jl
c3VtZSBjeWNsZSBpcyByZXNwb25zZSB0byBzb21ldGhpbmcgdGhhdCBMaW51eCBkb2VzIG9yIGRv
ZXNu4oCZdCBkbywgYW5kIG5vdCBzb21lIHN0YXRlIHRoYXQgaXMgb25seSBoYW5kbGVkIGludGVy
bmFsbHkgd2l0aGluIHRoZSBmaXJtd2FyZS4NCg0KPiBSZWdhcmRzLA0KPiANCj4gSGFucw0KPiAN
Cj4gDQo+IA0KPj4gDQo+PiBJZiBhIHN5c3RlbSB3aXRoIHRoZSAiYmFja2xpZ2h0IGxldmVsIHJl
c2V0IHRvIGZ1bGwgb24gcmVzdW1lIiBxdWlyaw0KPj4gaXMgZGV0ZWN0ZWQsIG52aWRpYS13bWkt
ZWMtYmFja2xpZ2h0IHdpbGwgcmVnaXN0ZXIgYSBQTSBub3RpZmllciB0bw0KPj4gcmVzZXQgdGhl
IGJhY2tsaWdodCB0byB0aGUgcHJldmlvdXMgbGV2ZWwgdXBvbiByZXN1bWUuDQo+PiANCj4+IFRo
ZXNlIHdvcmthcm91bmRzIGFyZSBhbHNvIHBsdW1iZWQgdGhyb3VnaCB0byBrZXJuZWwgbW9kdWxl
IHBhcmFtZXRlcnMsDQo+PiB0byBtYWtlIGl0IGVhc2llciBmb3IgdXNlcnMgd2hvIHN1c3BlY3Qg
dGhleSBtYXkgYmUgYWZmZWN0ZWQgYnkgb25lIG9yDQo+PiBib3RoIG9mIHRoZXNlIGJ1Z3MgdG8g
dGVzdCB3aGV0aGVyIHRoZXNlIHdvcmthcm91bmRzIGFyZSBlZmZlY3RpdmUgb24NCj4+IHRoZWly
IHN5c3RlbXMgYXMgd2VsbC4NCj4+IA0KPj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIERhZGFwIDxk
ZGFkYXBAbnZpZGlhLmNvbT4NCj4+IFRlc3RlZC1ieTogQWxleGFuZHJ1IERpbnUgPGFsZXguZGlu
dTA3QGdtYWlsLmNvbT4NCj4+IC0tLQ0KPj4gTm90ZTogdGhlIFRlc3RlZC1ieTogbGluZSBhYm92
ZSBhcHBsaWVzIHRvIHRoZSBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoaXMNCj4+IHBhdGNoOyBhbiBl
eHBsaWNpdCBBQ0sgZnJvbSB0aGUgdGVzdGVyIGlzIHJlcXVpcmVkIGZvciBpdCB0byBhcHBseSB0
bw0KPj4gdGhlIGN1cnJlbnQgdmVyc2lvbi4NCj4+IA0KPj4gdjI6DQo+PiAqIEFkZCByZWFkYWJs
ZSBzeXNmcyBmaWxlcyBmb3IgbW9kdWxlIHBhcmFtcywgdXNlIGxpbmVhciBpbnRlcnBvbGF0aW9u
DQo+PiAgIGZyb20gZml4cC1hcml0aC5oLCBmaXggcmV0dXJuIHZhbHVlIG9mIG5vdGlmaWVyIGNh
bGxiYWNrLCB1c2UgZGV2bV8qKCkNCj4+ICAgZm9yIGt6YWxsb2MgYW5kIHB1dF9kZXZpY2UuIChC
YXJuYWLDoXMgUMWRY3plIDxwb2JybkBwcm90b25tYWlsLmNvbT4pDQo+PiAqIEFkZCBjb21tZW50
IHRvIGRlbm90ZSBrbm93biBmaXJtd2FyZSB2ZXJzaW9ucyB0aGF0IGV4aGliaXQgdGhlIGJ1Z3Mu
DQo+PiAgIChNYXJpbyBMaW1vbmNpZWxsbyA8TWFyaW8uTGltb25jaWVsbG9AYW1kLmNvbT4pDQo+
PiAqIFVuaWZ5IHNlcGFyYXRlIHBlci1xdWlyayB0YWJsZXMuIChIYW5zIGRlIEdvZWRlIDxoZGVn
b2VkZUByZWRoYXQuY29tPikNCj4+IA0KPj4gLi4uL3BsYXRmb3JtL3g4Ni9udmlkaWEtd21pLWVj
LWJhY2tsaWdodC5jICAgIHwgMTk2ICsrKysrKysrKysrKysrKysrLQ0KPj4gMSBmaWxlIGNoYW5n
ZWQsIDE5NCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4gDQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvbnZpZGlhLXdtaS1lYy1iYWNrbGlnaHQuYyBiL2RyaXZl
cnMvcGxhdGZvcm0veDg2L252aWRpYS13bWktZWMtYmFja2xpZ2h0LmMNCj4+IGluZGV4IDYxZTM3
MTk0ZGY3MC4uOTVlMWRkZjc4MGZjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94
ODYvbnZpZGlhLXdtaS1lYy1iYWNrbGlnaHQuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94
ODYvbnZpZGlhLXdtaS1lYy1iYWNrbGlnaHQuYw0KPj4gQEAgLTMsOCArMywxMiBAQA0KPj4gICog
Q29weXJpZ2h0IChjKSAyMDIwLCBOVklESUEgQ09SUE9SQVRJT04uICBBbGwgcmlnaHRzIHJlc2Vy
dmVkLg0KPj4gICovDQo+PiANCj4+ICsjZGVmaW5lIHByX2ZtdChmKSBLQlVJTERfTU9ETkFNRSAi
OiAiIGYgIlxuIg0KPj4gKw0KPj4gI2luY2x1ZGUgPGxpbnV4L2FjcGkuaD4NCj4+ICNpbmNsdWRl
IDxsaW51eC9iYWNrbGlnaHQuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvZG1pLmg+DQo+PiArI2lu
Y2x1ZGUgPGxpbnV4L2ZpeHAtYXJpdGguaD4NCj4+ICNpbmNsdWRlIDxsaW51eC9tb2RfZGV2aWNl
dGFibGUuaD4NCj4+ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4+ICNpbmNsdWRlIDxsaW51
eC90eXBlcy5oPg0KPj4gQEAgLTc1LDYgKzc5LDczIEBAIHN0cnVjdCB3bWlfYnJpZ2h0bmVzc19h
cmdzIHsNCj4+ICAgIHUzMiBpZ25vcmVkWzNdOw0KPj4gfTsNCj4+IA0KPj4gKy8qKg0KPj4gKyAq
IHN0cnVjdCBudmlkaWFfd21pX2VjX2JhY2tsaWdodF9wcml2IC0gZHJpdmVyIHByaXZhdGUgZGF0
YQ0KPj4gKyAqIEBibF9kZXY6ICAgICAgIHRoZSBhc3NvY2lhdGVkIGJhY2tsaWdodCBkZXZpY2UN
Cj4+ICsgKiBAcHJveHlfdGFyZ2V0OiBiYWNrbGlnaHQgZGV2aWNlIHdoaWNoIHJlY2VpdmVzIHJl
bGF5ZWQgYnJpZ2h0bmVzcyBjaGFuZ2VzDQo+PiArICogQG5vdGlmaWVyOiAgICAgbm90aWZpZXIg
YmxvY2sgZm9yIHJlc3VtZSBjYWxsYmFjaw0KPj4gKyAqLw0KPj4gK3N0cnVjdCBudmlkaWFfd21p
X2VjX2JhY2tsaWdodF9wcml2IHsNCj4+ICsgICAgc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJs
X2RldjsNCj4+ICsgICAgc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKnByb3h5X3RhcmdldDsNCj4+
ICsgICAgc3RydWN0IG5vdGlmaWVyX2Jsb2NrIG5iOw0KPj4gK307DQo+PiArDQo+PiArc3RhdGlj
IGNoYXIgKmJhY2tsaWdodF9wcm94eV90YXJnZXQ7DQo+PiArbW9kdWxlX3BhcmFtKGJhY2tsaWdo
dF9wcm94eV90YXJnZXQsIGNoYXJwLCAwNDQ0KTsNCj4+ICtNT0RVTEVfUEFSTV9ERVNDKGJhY2ts
aWdodF9wcm94eV90YXJnZXQsICJSZWxheSBicmlnaHRuZXNzIGNoYW5nZSByZXF1ZXN0cyB0byB0
aGUgbmFtZWQgYmFja2xpZ2h0IGRyaXZlciwgb24gc3lzdGVtcyB3aGljaCBlcnJvbmVvdXNseSBy
ZXBvcnQgRUMgYmFja2xpZ2h0IGNvbnRyb2wuIik7DQo+PiArDQo+PiArc3RhdGljIGludCBtYXhf
cmVwcm9iZV9hdHRlbXB0cyA9IDEyODsNCj4+ICttb2R1bGVfcGFyYW0obWF4X3JlcHJvYmVfYXR0
ZW1wdHMsIGludCwgMDQ0NCk7DQo+PiArTU9EVUxFX1BBUk1fREVTQyhtYXhfcmVwcm9iZV9hdHRl
bXB0cywgIkxpbWl0IG9mIHJlcHJvYmUgYXR0ZW1wdHMgd2hlbiByZWxheWluZyBicmlnaHRuZXNz
IGNoYW5nZSByZXF1ZXN0cy4iKTsNCj4+ICsNCj4+ICtzdGF0aWMgYm9vbCByZXN0b3JlX2xldmVs
X29uX3Jlc3VtZTsNCj4+ICttb2R1bGVfcGFyYW0ocmVzdG9yZV9sZXZlbF9vbl9yZXN1bWUsIGJv
b2wsIDA0NDQpOw0KPj4gK01PRFVMRV9QQVJNX0RFU0MocmVzdG9yZV9sZXZlbF9vbl9yZXN1bWUs
ICJSZXN0b3JlIHRoZSBiYWNrbGlnaHQgbGV2ZWwgd2hlbiByZXN1bWluZyBmcm9tIHN1c3BlbmQs
IG9uIHN5c3RlbXMgd2hpY2ggcmVzZXQgdGhlIEVDJ3MgYmFja2xpZ2h0IGxldmVsIG9uIHJlc3Vt
ZS4iKTsNCj4+ICsNCj4+ICsvKiBCaXQgZmllbGQgdmFsdWVzIGZvciBxdWlya3MgdGFibGUgKi8N
Cj4+ICsNCj4+ICsjZGVmaW5lIE5WSURJQV9XTUlfRUNfQkFDS0xJR0hUX1FVSVJLX1JFU1RPUkVf
TEVWRUxfT05fUkVTVU1FICAgQklUKDApDQo+PiArDQo+PiArLyogYml0cyAxLTc6IHJlc2VydmVk
IGZvciBmdXR1cmUgcXVpcmtzOyBiaXRzIDgrOiBwcm94eSB0YXJnZXQgZGV2aWNlIG5hbWVzICov
DQo+PiArDQo+PiArI2RlZmluZSBOVklESUFfV01JX0VDX0JBQ0tMSUdIVF9RVUlSS19QUk9YWV9U
T19BTURHUFVfQkwxICAgICAgIEJJVCg4KQ0KPj4gKw0KPj4gKyNkZWZpbmUgUVVJUksobmFtZSkg
TlZJRElBX1dNSV9FQ19CQUNLTElHSFRfUVVJUktfIyNuYW1lDQo+PiArI2RlZmluZSBIQVNfUVVJ
UksoZGF0YSwgbmFtZSkgKCgobG9uZykgZGF0YSkgJiBRVUlSSyhuYW1lKSkNCj4+ICsNCj4+ICtz
dGF0aWMgaW50IGFzc2lnbl9xdWlya3MoY29uc3Qgc3RydWN0IGRtaV9zeXN0ZW1faWQgKmlkKQ0K
Pj4gK3sNCj4+ICsgICAgaWYgKEhBU19RVUlSSyhpZC0+ZHJpdmVyX2RhdGEsIFJFU1RPUkVfTEVW
RUxfT05fUkVTVU1FKSkNCj4+ICsgICAgICAgIHJlc3RvcmVfbGV2ZWxfb25fcmVzdW1lID0gMTsN
Cj4+ICsNCj4+ICsgICAgLyogSWYgdGhlIG1vZHVsZSBwYXJhbWV0ZXIgaXMgc2V0LCBvdmVycmlk
ZSB0aGUgcXVpcmtzIHRhYmxlICovDQo+PiArICAgIGlmICghYmFja2xpZ2h0X3Byb3h5X3Rhcmdl
dCkgew0KPj4gKyAgICAgICAgaWYgKEhBU19RVUlSSyhpZC0+ZHJpdmVyX2RhdGEsIFBST1hZX1RP
X0FNREdQVV9CTDEpKQ0KPj4gKyAgICAgICAgICAgIGJhY2tsaWdodF9wcm94eV90YXJnZXQgPSAi
YW1kZ3B1X2JsMSI7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIHRydWU7DQo+PiAr
fQ0KPj4gKw0KPj4gKyNkZWZpbmUgUVVJUktfRU5UUlkodmVuZG9yLCBwcm9kdWN0LCBxdWlya3Mp
IHsgICAgICAgICAgXA0KPj4gKyAgICAuY2FsbGJhY2sgPSBhc3NpZ25fcXVpcmtzLCAgICAgICAg
ICAgICAgICAgICAgICBcDQo+PiArICAgIC5tYXRjaGVzID0geyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgICAgIERNSV9NQVRDSChETUlfU1lTX1ZFTkRPUiwg
dmVuZG9yKSwgICAgICBcDQo+PiArICAgICAgICBETUlfTUFUQ0goRE1JX1BST0RVQ1RfVkVSU0lP
TiwgcHJvZHVjdCkgXA0KPj4gKyAgICB9LCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcDQo+PiArICAgIC5kcml2ZXJfZGF0YSA9ICh2b2lkICopKHF1aXJrcykg
ICAgICAgICAgICAgICAgIFwNCj4+ICt9DQo+PiArDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBk
bWlfc3lzdGVtX2lkIHF1aXJrc190YWJsZVtdID0gew0KPj4gKyAgICBRVUlSS19FTlRSWSgNCj4+
ICsgICAgICAgIC8qIFRoaXMgcXVpcmsgaXMgcHJlc2V0IGFzIG9mIGZpcm13YXJlIHJldmlzaW9u
IEhBQ04zMVdXICovDQo+PiArICAgICAgICAiTEVOT1ZPIiwgIkxlZ2lvbiBTNyAxNUFDSDYiLA0K
Pj4gKyAgICAgICAgUVVJUksoUkVTVE9SRV9MRVZFTF9PTl9SRVNVTUUpIHwgUVVJUksoUFJPWFlf
VE9fQU1ER1BVX0JMMSkNCj4+ICsgICAgKSwNCj4+ICsgICAgeyB9DQo+PiArfTsNCj4+ICsNCj4+
IC8qKg0KPj4gICogd21pX2JyaWdodG5lc3Nfbm90aWZ5KCkgLSBoZWxwZXIgZnVuY3Rpb24gZm9y
IGNhbGxpbmcgV01JLXdyYXBwZWQgQUNQSSBtZXRob2QNCj4+ICAqIEB3OiAgICBQb2ludGVyIHRv
IHRoZSBzdHJ1Y3Qgd21pX2RldmljZSBpZGVudGlmaWVkIGJ5ICVXTUlfQlJJR0hUTkVTU19HVUlE
DQo+PiBAQCAtMTE5LDkgKzE5MCwzMCBAQCBzdGF0aWMgaW50IHdtaV9icmlnaHRuZXNzX25vdGlm
eShzdHJ1Y3Qgd21pX2RldmljZSAqdywgZW51bSB3bWlfYnJpZ2h0bmVzc19tZXRobw0KPj4gICAg
cmV0dXJuIDA7DQo+PiB9DQo+PiANCj4+ICsvKiBTY2FsZSB0aGUgY3VycmVudCBicmlnaHRuZXNz
IGxldmVsIG9mICdmcm9tJyB0byB0aGUgcmFuZ2Ugb2YgJ3RvJy4gKi8NCj4+ICtzdGF0aWMgaW50
IHNjYWxlX2JhY2tsaWdodF9sZXZlbChjb25zdCBzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqZnJv
bSwNCj4+ICsgICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICp0
bykNCj4+ICt7DQo+PiArICAgIGludCBmcm9tX21heCA9IGZyb20tPnByb3BzLm1heF9icmlnaHRu
ZXNzOw0KPj4gKyAgICBpbnQgZnJvbV9sZXZlbCA9IGZyb20tPnByb3BzLmJyaWdodG5lc3M7DQo+
PiArICAgIGludCB0b19tYXggPSB0by0+cHJvcHMubWF4X2JyaWdodG5lc3M7DQo+PiArDQo+PiAr
ICAgIHJldHVybiBmaXhwX2xpbmVhcl9pbnRlcnBvbGF0ZSgwLCAwLCBmcm9tX21heCwgdG9fbWF4
LCBmcm9tX2xldmVsKTsNCj4+ICt9DQo+PiArDQo+PiBzdGF0aWMgaW50IG52aWRpYV93bWlfZWNf
YmFja2xpZ2h0X3VwZGF0ZV9zdGF0dXMoc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJkKQ0KPj4g
ew0KPj4gICAgc3RydWN0IHdtaV9kZXZpY2UgKndkZXYgPSBibF9nZXRfZGF0YShiZCk7DQo+PiAr
ICAgIHN0cnVjdCBudmlkaWFfd21pX2VjX2JhY2tsaWdodF9wcml2ICpwcml2ID0gZGV2X2dldF9k
cnZkYXRhKCZ3ZGV2LT5kZXYpOw0KPj4gKyAgICBzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqcHJv
eHlfdGFyZ2V0ID0gcHJpdi0+cHJveHlfdGFyZ2V0Ow0KPj4gKw0KPj4gKyAgICBpZiAocHJveHlf
dGFyZ2V0KSB7DQo+PiArICAgICAgICBpbnQgbGV2ZWwgPSBzY2FsZV9iYWNrbGlnaHRfbGV2ZWwo
YmQsIHByb3h5X3RhcmdldCk7DQo+PiArDQo+PiArICAgICAgICBpZiAoYmFja2xpZ2h0X2Rldmlj
ZV9zZXRfYnJpZ2h0bmVzcyhwcm94eV90YXJnZXQsIGxldmVsKSkNCj4+ICsgICAgICAgICAgICBw
cl93YXJuKCJGYWlsZWQgdG8gcmVsYXkgYmFja2xpZ2h0IHVwZGF0ZSB0byBcIiVzXCIiLA0KPj4g
KyAgICAgICAgICAgICAgICBiYWNrbGlnaHRfcHJveHlfdGFyZ2V0KTsNCj4+ICsgICAgfQ0KPj4g
DQo+PiAgICByZXR1cm4gd21pX2JyaWdodG5lc3Nfbm90aWZ5KHdkZXYsIFdNSV9CUklHSFRORVNT
X01FVEhPRF9MRVZFTCwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgV01JX0JS
SUdIVE5FU1NfTU9ERV9TRVQsDQo+PiBAQCAtMTQ3LDEzICsyMzksNzggQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBiYWNrbGlnaHRfb3BzIG52aWRpYV93bWlfZWNfYmFja2xpZ2h0X29wcyA9IHsNCj4+
ICAgIC5nZXRfYnJpZ2h0bmVzcyA9IG52aWRpYV93bWlfZWNfYmFja2xpZ2h0X2dldF9icmlnaHRu
ZXNzLA0KPj4gfTsNCj4+IA0KPj4gK3N0YXRpYyBpbnQgbnZpZGlhX3dtaV9lY19iYWNrbGlnaHRf
cG1fbm90aWZpZXIoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9uZyBldmVu
dCwgdm9pZCAqZCkNCj4+ICt7DQo+PiArDQo+PiArICAgIC8qDQo+PiArICAgICAqIE9uIHNvbWUg
c3lzdGVtcywgdGhlIEVDIGJhY2tsaWdodCBsZXZlbCBnZXRzIHJlc2V0IHRvIDEwMCUgd2hlbg0K
Pj4gKyAgICAgKiByZXN1bWluZyBmcm9tIHN1c3BlbmQsIGJ1dCB0aGUgYmFja2xpZ2h0IGRldmlj
ZSBzdGF0ZSBzdGlsbCByZWZsZWN0cw0KPj4gKyAgICAgKiB0aGUgcHJlLXN1c3BlbmQgdmFsdWUu
IFJlZnJlc2ggdGhlIGV4aXN0aW5nIHN0YXRlIHRvIHN5bmMgdGhlIEVDJ3MNCj4+ICsgICAgICog
c3RhdGUgYmFjayB1cCB3aXRoIHRoZSBrZXJuZWwncy4NCj4+ICsgICAgICovDQo+PiArICAgIGlm
IChldmVudCA9PSBQTV9QT1NUX1NVU1BFTkQpIHsNCj4+ICsgICAgICAgIHN0cnVjdCBudmlkaWFf
d21pX2VjX2JhY2tsaWdodF9wcml2ICpwOw0KPj4gKyAgICAgICAgaW50IHJldDsNCj4+ICsNCj4+
ICsgICAgICAgIHAgPSBjb250YWluZXJfb2YobmIsIHN0cnVjdCBudmlkaWFfd21pX2VjX2JhY2ts
aWdodF9wcml2LCBuYik7DQo+PiArICAgICAgICByZXQgPSBiYWNrbGlnaHRfdXBkYXRlX3N0YXR1
cyhwLT5ibF9kZXYpOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKHJldCkNCj4+ICsgICAgICAgICAg
ICBwcl93YXJuKCJmYWlsZWQgdG8gcmVmcmVzaCBiYWNrbGlnaHQgbGV2ZWw6ICVkIiwgcmV0KTsN
Cj4+ICsNCj4+ICsgICAgICAgIHJldHVybiBOT1RJRllfT0s7DQo+PiArICAgIH0NCj4+ICsNCj4+
ICsgICAgcmV0dXJuIE5PVElGWV9ET05FOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBw
dXRkZXYodm9pZCAqZGF0YSkNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IGRh
dGE7DQo+PiArDQo+PiArICAgIHB1dF9kZXZpY2UoZGV2KTsNCj4+ICt9DQo+PiArDQo+PiBzdGF0
aWMgaW50IG52aWRpYV93bWlfZWNfYmFja2xpZ2h0X3Byb2JlKHN0cnVjdCB3bWlfZGV2aWNlICp3
ZGV2LCBjb25zdCB2b2lkICpjdHgpDQo+PiB7DQo+PiArICAgIHN0cnVjdCBiYWNrbGlnaHRfZGV2
aWNlICpiZGV2LCAqdGFyZ2V0ID0gTlVMTDsNCj4+ICsgICAgc3RydWN0IG52aWRpYV93bWlfZWNf
YmFja2xpZ2h0X3ByaXYgKnByaXY7DQo+PiAgICBzdHJ1Y3QgYmFja2xpZ2h0X3Byb3BlcnRpZXMg
cHJvcHMgPSB7fTsNCj4+IC0gICAgc3RydWN0IGJhY2tsaWdodF9kZXZpY2UgKmJkZXY7DQo+PiAg
ICB1MzIgc291cmNlOw0KPj4gICAgaW50IHJldDsNCj4+IA0KPj4gKyAgICAvKg0KPj4gKyAgICAg
KiBDaGVjayBxdWlya3MgdGFibGVzIHRvIHNlZSBpZiB0aGlzIHN5c3RlbSBuZWVkcyBhbnkgb2Yg
dGhlIGZpcm13YXJlDQo+PiArICAgICAqIGJ1ZyB3b3JrYXJvdW5kcy4NCj4+ICsgICAgICovDQo+
PiArICAgIGRtaV9jaGVja19zeXN0ZW0ocXVpcmtzX3RhYmxlKTsNCj4+ICsNCj4+ICsgICAgaWYg
KGJhY2tsaWdodF9wcm94eV90YXJnZXQgJiYgYmFja2xpZ2h0X3Byb3h5X3RhcmdldFswXSkgew0K
Pj4gKyAgICAgICAgc3RhdGljIGludCBudW1fcmVwcm9iZV9hdHRlbXB0czsNCj4+ICsNCj4+ICsg
ICAgICAgIHRhcmdldCA9IGJhY2tsaWdodF9kZXZpY2VfZ2V0X2J5X25hbWUoYmFja2xpZ2h0X3By
b3h5X3RhcmdldCk7DQo+PiArDQo+PiArICAgICAgICBpZiAodGFyZ2V0KSB7DQo+PiArICAgICAg
ICAgICAgcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KCZ3ZGV2LT5kZXYsIHB1dGRldiwN
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnRhcmdldC0+ZGV2KTsNCj4+ICsg
ICAgICAgICAgICBpZiAocmV0KQ0KPj4gKyAgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4g
KyAgICAgICAgfSBlbHNlIHsNCj4+ICsgICAgICAgICAgICAvKg0KPj4gKyAgICAgICAgICAgICAq
IFRoZSB0YXJnZXQgYmFja2xpZ2h0IGRldmljZSBtaWdodCBub3QgYmUgcmVhZHk7DQo+PiArICAg
ICAgICAgICAgICogdHJ5IGFnYWluIGFuZCBkaXNhYmxlIGJhY2tsaWdodCBwcm94eWluZyBpZiBp
dA0KPj4gKyAgICAgICAgICAgICAqIGZhaWxzIHRvbyBtYW55IHRpbWVzLg0KPj4gKyAgICAgICAg
ICAgICAqLw0KPj4gKyAgICAgICAgICAgIGlmIChudW1fcmVwcm9iZV9hdHRlbXB0cyA8IG1heF9y
ZXByb2JlX2F0dGVtcHRzKSB7DQo+PiArICAgICAgICAgICAgICAgIG51bV9yZXByb2JlX2F0dGVt
cHRzKys7DQo+PiArICAgICAgICAgICAgICAgIHJldHVybiAtRVBST0JFX0RFRkVSOw0KPj4gKyAg
ICAgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgICAgICBwcl93YXJuKCJVbmFibGUgdG8gYWNx
dWlyZSAlcyBhZnRlciAlZCBhdHRlbXB0cy4gRGlzYWJsaW5nIGJhY2tsaWdodCBwcm94eS4iLA0K
Pj4gKyAgICAgICAgICAgICAgICBiYWNrbGlnaHRfcHJveHlfdGFyZ2V0LCBtYXhfcmVwcm9iZV9h
dHRlbXB0cyk7DQo+PiArICAgICAgICB9DQo+PiArICAgIH0NCj4+ICsNCj4+ICAgIHJldCA9IHdt
aV9icmlnaHRuZXNzX25vdGlmeSh3ZGV2LCBXTUlfQlJJR0hUTkVTU19NRVRIT0RfU09VUkNFLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgV01JX0JSSUdIVE5FU1NfTU9ERV9HRVQs
ICZzb3VyY2UpOw0KPj4gICAgaWYgKHJldCkNCj4+IEBAIC0xODgsNyArMzQ1LDQxIEBAIHN0YXRp
YyBpbnQgbnZpZGlhX3dtaV9lY19iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHdtaV9kZXZpY2UgKndk
ZXYsIGNvbnN0IHZvaWQgKmN0DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgJndkZXYtPmRl
diwgd2RldiwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAmbnZpZGlhX3dtaV9lY19iYWNr
bGlnaHRfb3BzLA0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgICZwcm9wcyk7DQo+PiAtICAg
IHJldHVybiBQVFJfRVJSX09SX1pFUk8oYmRldik7DQo+PiArDQo+PiArICAgIGlmIChJU19FUlIo
YmRldikpDQo+PiArICAgICAgICByZXR1cm4gUFRSX0VSUihiZGV2KTsNCj4+ICsNCj4+ICsgICAg
cHJpdiA9IGRldm1fa3phbGxvYygmd2Rldi0+ZGV2LCBzaXplb2YoKnByaXYpLCBHRlBfS0VSTkVM
KTsNCj4+ICsgICAgaWYgKCFwcml2KQ0KPj4gKyAgICAgICAgcmV0dXJuIC1FTk9NRU07DQo+PiAr
DQo+PiArICAgIHByaXYtPmJsX2RldiA9IGJkZXY7DQo+PiArDQo+PiArICAgIGRldl9zZXRfZHJ2
ZGF0YSgmd2Rldi0+ZGV2LCBwcml2KTsNCj4+ICsNCj4+ICsgICAgaWYgKHRhcmdldCkgew0KPj4g
KyAgICAgICAgaW50IGxldmVsID0gc2NhbGVfYmFja2xpZ2h0X2xldmVsKHRhcmdldCwgYmRldik7
DQo+PiArDQo+PiArICAgICAgICBpZiAoYmFja2xpZ2h0X2RldmljZV9zZXRfYnJpZ2h0bmVzcyhi
ZGV2LCBsZXZlbCkpDQo+PiArICAgICAgICAgICAgcHJfd2FybigiVW5hYmxlIHRvIGltcG9ydCBp
bml0aWFsIGJyaWdodG5lc3MgbGV2ZWwgZnJvbSAlcy4iLA0KPj4gKyAgICAgICAgICAgICAgICBi
YWNrbGlnaHRfcHJveHlfdGFyZ2V0KTsNCj4+ICsgICAgICAgIHByaXYtPnByb3h5X3RhcmdldCA9
IHRhcmdldDsNCj4+ICsgICAgfQ0KPj4gKw0KPj4gKyAgICBpZiAocmVzdG9yZV9sZXZlbF9vbl9y
ZXN1bWUpIHsNCj4+ICsgICAgICAgIHByaXYtPm5iLm5vdGlmaWVyX2NhbGwgPSBudmlkaWFfd21p
X2VjX2JhY2tsaWdodF9wbV9ub3RpZmllcjsNCj4+ICsgICAgICAgIHJlZ2lzdGVyX3BtX25vdGlm
aWVyKCZwcml2LT5uYik7DQo+PiArICAgIH0NCj4+ICsNCj4+ICsgICAgcmV0dXJuIDA7DQo+PiAr
fQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIG52aWRpYV93bWlfZWNfYmFja2xpZ2h0X3JlbW92ZShz
dHJ1Y3Qgd21pX2RldmljZSAqd2RldikNCj4+ICt7DQo+PiArICAgIHN0cnVjdCBudmlkaWFfd21p
X2VjX2JhY2tsaWdodF9wcml2ICpwcml2ID0gZGV2X2dldF9kcnZkYXRhKCZ3ZGV2LT5kZXYpOw0K
Pj4gKw0KPj4gKyAgICBpZiAocHJpdi0+bmIubm90aWZpZXJfY2FsbCkNCj4+ICsgICAgICAgIHVu
cmVnaXN0ZXJfcG1fbm90aWZpZXIoJnByaXYtPm5iKTsNCj4+IH0NCj4+IA0KPj4gI2RlZmluZSBX
TUlfQlJJR0hUTkVTU19HVUlEICI2MDNFOTYxMy1FRjI1LTQzMzgtQTNEMC1DNDYxNzc1MTZEQjci
DQo+PiBAQCAtMjA0LDYgKzM5NSw3IEBAIHN0YXRpYyBzdHJ1Y3Qgd21pX2RyaXZlciBudmlkaWFf
d21pX2VjX2JhY2tsaWdodF9kcml2ZXIgPSB7DQo+PiAgICAgICAgLm5hbWUgPSAibnZpZGlhLXdt
aS1lYy1iYWNrbGlnaHQiLA0KPj4gICAgfSwNCj4+ICAgIC5wcm9iZSA9IG52aWRpYV93bWlfZWNf
YmFja2xpZ2h0X3Byb2JlLA0KPj4gKyAgICAucmVtb3ZlID0gbnZpZGlhX3dtaV9lY19iYWNrbGln
aHRfcmVtb3ZlLA0KPj4gICAgLmlkX3RhYmxlID0gbnZpZGlhX3dtaV9lY19iYWNrbGlnaHRfaWRf
dGFibGUsDQo+PiB9Ow0KPj4gbW9kdWxlX3dtaV9kcml2ZXIobnZpZGlhX3dtaV9lY19iYWNrbGln
aHRfZHJpdmVyKTsNCj4gDQo=
