Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D58BE6C5A3C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Mar 2023 00:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbjCVXWU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Mar 2023 19:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjCVXWS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 19:22:18 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C2B10250
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 16:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679527333; x=1711063333;
  h=from:to:cc:subject:date:message-id:content-id:
   content-transfer-encoding:mime-version;
  bh=dXI3baJ7wWbl0PacMDcWFaRND1asLBu1vIHH1YgW56g=;
  b=AyKUSmLuUH3O/HP1c5IF7juVwRPMiIxxRtX6Ev9xZbJuPjCEMw8ReRrR
   +zz2Dr7Wt7upQkRTqUvmtqRAhGtjJT3iRK8XO6udu2GZ5TgAX6/So7gcH
   No6UDYH//iCTxqJ+X9qiRhZTXjbRXEsrdAse+q2K90I4D9IdDlyCmdmCa
   D6Jhyz23rUCOfzN3Od7kRDls87DL3mTDhlRPaFG9s+Xx3h2HCHqtteMQ0
   MOMWQhxTWCzuYaezRVXXJ4CDcdUJe5p5EdWOYO4PjvJpU7X5y2D0VpSr4
   TSlsTkL7gyX4ja/nDdqlM/OA9bi29VJ7eflaPfU9q4IOT6l28na+QuQZq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="336860373"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="336860373"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 16:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="1011547973"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="1011547973"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2023 16:22:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 16:22:13 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 22 Mar 2023 16:22:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 22 Mar 2023 16:22:12 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 22 Mar 2023 16:22:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nlbdkC0FDJlH8XKQhfubqqZZzfa0Qxzw9u7zZCvQUynSxGLuJk6JtbKny7sfhSvmpPwSG0SbeAeU8xGHDJPho8zqGIEfr1rIvRxKiDQaf+OIUmmA4QnRTgMXZ5A+JxP9DpDuPWgmrtZie1cghS8Zjw8I7hz/rlzgE3dOrcvSKfO3/AWU5C8ycxEgpHLMNMASY3JG3fnGBE+jBbu1TIlWkqKTBV9JQiMrj93GuquR5NdlDd9Zj3UhU1LhmAVU68suDJaeJ6sXYNdXrZUhLSlzllHiUVHjesd5tQq7IyShosKAVpJUjfRcr/FUrSKG1hHvc5geTUGlHquAmY7rQO0lZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXI3baJ7wWbl0PacMDcWFaRND1asLBu1vIHH1YgW56g=;
 b=mNggv3GbGUZblMklihUMQ0kppCF+xbwgmFmLRQPLUr1CAA4HcttEZz7P/ArqERNKa6gs5khTSEP2HWVfPDULuZnuOlNI4oFpvQKRnT4cEIAT4DkqxUl+A7LcE/a4eSyiW5htbY/wCzes1wOR+zg3Y3BIm6iXJBUMEJyqaFEHfluHFeUHZ9y+FOUSK2bBDgTbwgALF1yU7bpPwxxM7lvr+8A6j1QKm2B5QpSxmiKQbU5YjEvdtf7gK24kgovhME6IqRk+Nhs52dL6Kd9VBpUs7AqOvfH8jz87aPaBT8mdI2p9aeSoIQCt6gQw3dAKlMBNGyTfyj+sO4mdeIRnLhI9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5592.namprd11.prod.outlook.com (2603:10b6:8:35::6) by
 PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Wed, 22 Mar
 2023 23:22:10 +0000
Received: from DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::e9c0:eeac:5553:aba5]) by DM8PR11MB5592.namprd11.prod.outlook.com
 ([fe80::e9c0:eeac:5553:aba5%5]) with mapi id 15.20.6178.038; Wed, 22 Mar 2023
 23:22:09 +0000
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
CC:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.4-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.4-rc1
Thread-Index: AQHZXRUf7uXDe6F9nkW3MhSUEV0tzA==
Date:   Wed, 22 Mar 2023 23:22:09 +0000
Message-ID: <c05d53c61c4b491e4ffe3ac159031aae31b1e98b.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5592:EE_|PH7PR11MB6449:EE_
x-ms-office365-filtering-correlation-id: 5e4f0fb4-ce81-4c3f-1dea-08db2b2c425f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W/da/n40pja0e8jSDL8ghnzs7awtZRutmDzbJ1PAHXglD3+GDtNIBWa256Kw1MutHl9QXw9Ap/qCdQSDs6FFP5UMWWSvnLhcDir/5SHZi0QFs68V2wwbXtp1sGWGEixX1aN49z/xbpcWbe0u4Q4ge0m9OzpsAgR8+0ezqwV865KZh7BosAUOrsfSmsmhTjMJULDTb3NrhvIVHLBB1lF1AaTjBdpFsyCqFAaC8Qo4BD44R/soQpZBXYOdIF1/J6gK1LgHyy6AWxktnJG3ZmpThs+EL1mBdfohJLTG706fZ16cItLhz1mBfMBdfU932OMYmjky8WdQFEvdoNGfpHLXk65Y2Oe11OS7xiDprjR63Yfqp2NdIHh0QFVEqg79PjgMIMoa5lo1d3RBi81AHQlZpps7EC3yb7nLnaKyIyYcTRNP/NroCkckh28UTXR17x8Yt9dwToB4vHJpIBt1ccZsGFFaEnGEPhTaq6iecyIIUrV4AM6WByu6sY+BV3Sj0MnLRY07QwWMqwiKYfZILftJt6dgmdk0VnjwJxCrPpsdXGanKdjk13lBVkll+mkpHHLwwb1bRE0zzjAPJR2vYaCR5Tj55/hShiyt4GgG2ndOATTtFFHiA+xY4RYG3wNqzUbIXdilcqHk8Vx2XunQ22I6C3v7bDq4TmOmu5yd9S8Ojc3ENaaIjtxuAvD2oaF8BwqRdxbWXoi32sEhtVDmWI2oBv4XoWnLPfv27IZnmAhMf58=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5592.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(366004)(376002)(136003)(39850400004)(451199018)(86362001)(5660300002)(122000001)(41300700001)(38100700002)(38070700005)(8936002)(2906002)(82960400001)(64756008)(6486002)(186003)(6506007)(66556008)(83380400001)(91956017)(66446008)(76116006)(66946007)(4326008)(8676002)(478600001)(66476007)(110136005)(2616005)(966005)(316002)(36756003)(71200400001)(54906003)(6512007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MURXNjM3OUFrNlBDeEp2aUp2RXAxcWhDMlJlSSt2Z0ZKY2FlZDMxQ1RlTFBY?=
 =?utf-8?B?R0RjSDV4Z0JtTi90ZGNUSnUyZFJlaU1iS1VGV3VHeWNvR0I4VGpWTmtzZDJB?=
 =?utf-8?B?dFhJU2lUSmQ5dGF1MFg3czExOUpqMnpwSWl1bThaMGttZ3JLUDNNbWRnMGhS?=
 =?utf-8?B?WHY0Tjd5Q3plKzIwbGViVXFIVjRPZ0NCQjRybGlnK1JhMUl5S2V5ZXQ1ZFM5?=
 =?utf-8?B?TUhjdWQ2ajgyOFZzRkN2YmwrdlFYTkN0cnlaV2ZUWHNRanNVYTNKbjUwY0VH?=
 =?utf-8?B?NWx5azRHd2I4ek5FTnZMTkRIcDEyTFlsc1JOREJOcnQ4YTlVdmNSekU1b2Qz?=
 =?utf-8?B?UGY0ZFhUb2tiMXhaUkF1Z25WQ0RaOFoxeFBQampTYllLZ1Y4MmRSMEJWTElV?=
 =?utf-8?B?S09BYUhUck9MaVdQcS81cXN1TjFmaWxCTitUblNZaDJSOHVqc2NYQmU3N09i?=
 =?utf-8?B?cEtLSnZDbE5YdDFCRXFCNGZWZUhFMnZxL1E2d0d2N0RaMmlSSGFnSUxXRDFK?=
 =?utf-8?B?ckE2M2l2aWlQTkRieDFHRTZKd2dNVVZiRzVqeFJ0L3NJWll2QlJOQ1FTdEZF?=
 =?utf-8?B?Z3RjUGlXNmR6SE5kSW9EcE5CUzNjUFdyRmhSUEh1d2VEMGw3ZkQ3RzRBUGVE?=
 =?utf-8?B?WU9ucjRiKzlnWmJnZG5HUkkzUWpxNUNKelNWL1RYUDFsdWlJTmU5MWJHNUk5?=
 =?utf-8?B?Q3QzZjZ1dW9jcHd1ZHlVVHkybjR5Yy96dFV1T0pqY0h3cm5MajhYNmNpSUNZ?=
 =?utf-8?B?VUhzT2NwM1IzYkdENFJ5bzhHR1JMK2FIY25udC9za3FHUGlYczE3NlRiTVhG?=
 =?utf-8?B?bW82c1lXeUlRS2EvOUZqa3UzQ1o5YkJkQitlbXU4ZVQrSEUzQmZMR1Eyd2Yw?=
 =?utf-8?B?UUY0TDFrSHhTclNwdFhtZnNTbzJkM1hMV2tUUzhiVFJlbDBCb3p1ZjJBNVV1?=
 =?utf-8?B?N2Y4eUpEcWg4WXEyZFYxSFhRQStubkFLbElRM2p0VThUakgrUnQwbXkxcHlG?=
 =?utf-8?B?d1lHRDdqbkUyR2ZGTkVtb0dhbnhONkxPeUlWbm5LaUZ6V0RRK1h6MUszUjA0?=
 =?utf-8?B?SXF2OWx0cFFsbFN4Q1h3WTNEUUNkSlhCblA1bm1QT1hkV3hvTHRFejdJQUh3?=
 =?utf-8?B?UnBocFNITFFtR0xkd3l6dkhuQXhOeERnSHIyODlZbTVPOUV3Rm5hd2puUWhZ?=
 =?utf-8?B?MU5ja1U1cElYQzhaZWlFZGZvV0czNjdtYXBlKy9LUkpHWjV3S3JwcEhDVk9h?=
 =?utf-8?B?cHVTdDRnb0ZYVC9Ib0FKYjdLNVFGSlhla1oyb2hmQ1UvYXM1UDlhdlJXMEkr?=
 =?utf-8?B?eTJGSityN01tSERWSVhneHJFYmlYd0NRNkl0ZUFRMksycWxpWG5MdWk4ZDdC?=
 =?utf-8?B?ZjYreEJKQWRPaEhLV0VhMWVBaWFUTzY3TDBFY0FLcnY0bjFjSnpKRllIWkhp?=
 =?utf-8?B?M2hlWnRNem9GT2UvcWt0a1RYNDRLeENiWE1SQWp5bEFPV2Z1dDZvYklsS2FE?=
 =?utf-8?B?Smd2RjBrbEpSY1JnTy9GSU5NRzhMVVdXTmZVSWlBMDJPNy9FWnJEVXN0Qksv?=
 =?utf-8?B?YXVtZXRhYS9IRitUSnVJdUZJSTE0dGdSYXVIaE1OenNTZ2RaNWhZZDdRejF3?=
 =?utf-8?B?cTY0b0RlWG53QmN2SXlOY09FbENocDdxNEE5dmdLMXRrVzA4MjNyU0NVUDlr?=
 =?utf-8?B?ckZReDhINGZXQzVDRExEN3NOUmszYXR4NDUvN3ZyWkpzMWhtaXg1VnZCTDVQ?=
 =?utf-8?B?TVN5SEd2SU1ZNVZ4TFdOYWo4bkpxMUUwR2FlSm9CR0lxdUk0V0NiUE1RbUkv?=
 =?utf-8?B?RzArWnd1V0NiUTAwcmxtdjcveXoyZ21uVlBpNkgxTGpVcE5VRVhqcnpUblVq?=
 =?utf-8?B?eVQwdURSUGlNUlJyb0lvR3djZGp4bFkwMXRvZDVGNDN3RjJQOXluYzQ1NEJa?=
 =?utf-8?B?UkN0RksrWEV6TFI1N2h2amRZVytZMG5GQmxmTXdMMktKTW5oc0hQM3g2K3Bo?=
 =?utf-8?B?cGVURzVsaXFENXlCMGNrQjlCRlR6ZmNoREFBRS9QRm1sa0ZuRFFRck0wU0tM?=
 =?utf-8?B?MjgxZjJMbmFub0hTUzZDN3czNzVHbjNTNVVWczhBT1lMWVdBM1JXODk3ZVRn?=
 =?utf-8?B?QU5NOEtMeGpXWnNuUGJqcytLcUpRR0VHWVBhTDBFeU9lTUlrM05WZ2Y5c2hz?=
 =?utf-8?B?QVNqOVFuYUFpYXRTYkgwK0pUZjllNGhBMzRnTlRSRkF5d3RLYnNGZnFXZUhn?=
 =?utf-8?Q?d14dy27E9aIefTskCRAMhuaKFKc9xRhuS/aTyF7mZc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0194654F7C8DFD46A7E86A3F2FA57B1E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5592.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4f0fb4-ce81-4c3f-1dea-08db2b2c425f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 23:22:09.4517
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MtEyCIkxtJJcjp/Sjg7wm9ecWlPb14xaXOtuEYcDbjEVdGFT3xuo9+fPSpJ8W4In2VMj1PPKAJqdu5mbpHhaMCR9xWBrgPTUWyDzXZeGfB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkgSGFucywNCg0KUHVsbCByZXF1ZXN0IGZvciBJbnRlbCBTcGVlZCBTZWxlY3QgdmVyc2lvbiB2
MS4xNToNCg0KU3VtbWFyeSBvZiBjaGFuZ2VzOg0KDQpUaWxsIHRoZSBjb21taXQ6DQoidG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogR2V0IHB1bml0IGNvcmUgbWFwcGluZw0KaW5m
b3JtYXRpb24iDQoNCkFsbCBwYXRjaGVzIGp1c3QgbGF5cyBmb3VuZGF0aW9uIGZvciBhZGRpbmcg
bmV3IGhhcmR3YXJlIGludGVyZmFjZQ0KaW4gYWRkaXRpb24gdG8gZXhpc3RpbmcgTVNSL01NSU8g
aW50ZXJmYWNlLg0KDQpBbGwgcGF0Y2hlcyBwcmVmaXhlZCB3aXRoICJBYnN0cmFjdCIganVzdCBh
ZGRzIGluZGl2aWR1YWwgaGFyZHdhcmUNCmNhbGxiYWNrIGZvciBmdW5jdGlvbnMgY2FsbGVkIGZy
b20gdGhlIGNvcmUgcHJvY2Vzc2luZy4NCg0KVGhlIG1haWxib3ggcHJvY2Vzc2luZyBpcyBhYnN0
cmFjdGVkIHRvIGEgbmV3IGZpbGUgd2l0aCBjYWxsYmFja3MuDQoNCkluIGFkZGl0aW9uIHNvbWUg
Y2hhbmdlcyB0byByZWR1Y2UgZHVwbGljYXRlZCBjb2RlIGZvciBkaXNwbGF5DQpvZiBUUkwgbGV2
ZWwuDQoNClBhdGNoICJJbnRyb2R1Y2UgUHVuaXQgSUQgY29uY2VwdCBhbmQgYWRkIHJlbGF0ZWQg
QVBJIiBhZGQgZnVydGhlcg0KYWJzdHJhY3Rpb24gaW4gYWRkaXRpb24gdG8gZXhpc3RpbmcgcGFj
a2FnZSBhbmQgZGllIHNjb3BlLg0KDQotLS0tLS0tLS0tLQ0KdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdDogR2V0IHB1bml0IGNvcmUgbWFwcGluZyBpbmZvcm1hdGlvbg0KLUFkZHMg
YSBuZXcgd2F5IHRvIGdldCBwYWNrYWdlL2RpZS9wdW5pdCBpbmZvcm1hdGlvbiBmb3IgZWFjaCBD
UFUuDQotLS0tLS0tLS0tLQ0KDQpJbnRyb2R1Y2UgVFBNSSBpbnRlcmZhY2Ugc3VwcG9ydA0KLSBJ
bXBsZW1lbnQgYWxsIGFic3RyYWN0ZWQgY2FsbGJhY2tzIGFib3ZlIHRvIHVzZSBUUE1JIElPQ1RM
IGludGVyZmFjZS4NCi0tLS0tLS0tLS0tDQoNCnRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3Q6IERpc3BsYXkgcHVuaXQgaW5mbw0KLSBXaXRoIFRQTUkgdGhlIGdyYW51bGFyaXR5IGlz
IHBlciBwdW5pdCwgd2hpY2ggY2FuIGJlIG11bHRpcGxlIGluIGENCnBhY2thZ2UvZGllLg0KLS0t
LS0tLS0tLQ0KDQp0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBSZW1vdmUgY3B1
IG1hc2sgZGlzcGxheSBmb3Igbm9uLWNwdQ0KcG93ZXIgZG9tYWluDQp0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0OiBEaXNwbGF5IGZhY3QgaW5mbyBmb3Igbm9uLWNwdSBwb3dlcg0K
ZG9tYWluDQotVGhlcmUgYXJlIHNvbWUgcG93ZXIgZG9tYWlucyB3aXRoIG5vIENQVXMsIHRoZSBh
Ym92ZSBwYXRjaGVzIGFkZHMgQ1BVDQphcyBpbnZhbGlkDQpmb3IgdGhlc2UgZG9tYWlucw0KLS0t
LS0tLS0tLQ0KDQp0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBVc2UgY2dyb3Vw
IHYyIGlzb2xhdGlvbg0KLSBBZGRzIG5ldyBvcHRpb24gdG8gdXNlIENncm91cCBDUFUgaXNvbGF0
aW9uIGluc3RlYWQgb2Ygb2ZmbGluZSBvZg0KQ1BVcw0KLS0tLS0tLS0tLQ0KDQp0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBDaGFuZ2UgVFJMIGRpc3BsYXkgZm9yIEVtZXJhbGQN
ClJhcGlkcw0KLSBFbWVyYWxkIFJhcGlkIGhhcyBtdWx0aXBsZSBUUkwgbGV2ZWxzIGFuZCBtb3Zl
cyBhd2F5IGZyb20gVFJMIGxldmVsDQpiYXNlZCBvbiBpbnN0cnVjdGlvbiB0eXBlDQoNCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNClRoZSBiYXNlIGJyYW5jaCBmb3Ig
dGhlc2UgY2hhbmdlcyANCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3BkeDg2L3BsYXRmb3JtLWRyaXZlcnMteDg2LmdpdA0KYnJhbmNoOiByZXZpZXctaGFu
cw0KDQogDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQo2ZjU2MTY3N2MyZjIz
NGJjZjIxNTM1MGI3NmYyYTJmZWE5NWZiZWJmOg0KDQogIHBsYXRmb3JtL3g4Ni9pbnRlbDogdnNl
YzogVXNlIGludGVsX3ZzZWNfZGV2X3JlbGVhc2UoKSB0byBzaW1wbGlmeQ0KaW5pdCgpIGVycm9y
IGNsZWFudXAgKDIwMjMtMDMtMjAgMTU6MjA6MDUgKzAxMDApDQoNCmFyZSBhdmFpbGFibGUgaW4g
dGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFk
YS9saW51eC1rZXJuZWwuZ2l0IGludGVsLXNzdA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMg
dXAgdG8NCjE5Nzk5ZDNhZTJlZGVjOTk0MzViNzkyY2ZlNzZiMWNiYTc0NjY1ZmU6DQoNCiAgdG9v
bHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogVXBkYXRlIHZlcnNpb24gKDIwMjMtMDMt
MjINCjEzOjQxOjE3IC0wNzAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpTcmluaXZhcyBQYW5kcnV2YWRhICg2KToN
CiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEdldCBwdW5pdCBjb3Jl
IG1hcHBpbmcNCmluZm9ybWF0aW9uDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0OiBBZGQgbWlzc2luZyBmcmVlIGNwdXNldA0KICAgICAgdG9vbHMvcG93ZXIveDg2L2lu
dGVsLXNwZWVkLXNlbGVjdDogVXNlIGNncm91cCB2MiBpc29sYXRpb24NCiAgICAgIHRvb2xzL3Bv
d2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IERpc3BsYXkgQU1YIGJhc2UgZnJlcXVlbmN5DQog
ICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBJZGVudGlmeSBFbWVyYWxk
IFJhcGlkcw0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQ2hhbmdl
IFRSTCBkaXNwbGF5IGZvcg0KRW1lcmFsZCBSYXBpZHMNCg0KWmhhbmcgUnVpICg1NSk6DQogICAg
ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBVbmlmeSBUUkwgbGV2ZWxzDQog
ICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGb2xsb3cgVFJMIG5hbWVp
bmcgZm9yIEZBQ1QNCmluZm8NCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxl
Y3Q6IEludHJvZHVjZSBwdW5pdCB0byBpc3N0X2lkDQogICAgICB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0OiBJbnRyb2R1Y2UNCmlzc3RfaXNfcHVuaXRfdmFsaWQoKQ0KICAgICAg
dG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogSW50cm9kdWNlIHN1cHBvcnQgZm9y
IG11bHRpLQ0KcHVuaXQNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6
IFJlbmFtZQ0KZm9yX2VhY2hfb25saW5lX3BhY2thZ2VfaW5fc2V0DQogICAgICB0b29scy9wb3dl
ci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBJbXByb3ZlDQppc3N0X3ByaW50X2V4dGVuZGVkX3Bs
YXRmb3JtX2luZm8NCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IE1v
dmUgbWJveCBmdW5jdGlvbnMgdG8gaXNzdC0NCmNvcmUuYw0KICAgICAgdG9vbHMvcG93ZXIveDg2
L2ludGVsLXNwZWVkLXNlbGVjdDogSW50cm9kdWNlDQppc3N0X2dldF9kaXNwX2ZyZXFfbXVsdGlw
bGllcg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQWx3YXlzIGlu
dm9rZQ0KaXNzdF9maWxsX3BsYXRmb3JtX2luZm8NCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRl
bC1zcGVlZC1zZWxlY3Q6IEludHJvZHVjZSBpc3N0LWNvcmUtbWJveC5jDQogICAgICB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCBpc19wdW5pdF92YWxpZA0KICAg
ICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQWJzdHJhY3QgZ2V0X2NvbmZp
Z19sZXZlbHMNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFic3Ry
YWN0IGdldF9jdGRwX2NvbnRyb2wNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1z
ZWxlY3Q6IEFic3RyYWN0IGdldF90ZHBfaW5mbw0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdDogQWJzdHJhY3QgZ2V0X3B3cl9pbmZvDQogICAgICB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBNb3ZlIGNvZGUgcmlnaHQgYmVmb3JlIGl0cw0KY2FsbGVy
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCBnZXRf
dGptYXhfaW5mbw0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQWJz
dHJhY3QgZ2V0X2NvcmVtYXNrX2luZm8NCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3Q6IEFic3RyYWN0IGdldF9nZXRfdHJsDQogICAgICB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCBnZXRfdHJsX2J1Y2tldF9pbmZvDQogICAgICB0b29s
cy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCBzZXRfdGRwX2xldmVsDQog
ICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCBnZXRfcGJm
X2luZm8NCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFJlbW92ZQ0K
aXNzdF9nZXRfcGJmX2luZm9fY29tcGxldGUNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3Q6IEFic3RyYWN0IHNldF9wYmZfZmFjdF9zdGF0dXMNCiAgICAgIHRvb2xzL3Bv
d2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFic3RyYWN0IGdldF9mYWN0X2luZm8NCiAgICAg
IHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFic3RyYWN0DQpnZXRfdW5jb3Jl
X3AwX3AxX2luZm8NCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEVu
aGFuY2UgZ2V0X3RkcF9pbmZvDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0OiBBYnN0cmFjdCBnZXRfZ2V0X3RybHMNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3Q6IEFic3RyYWN0IGdldF9jbG9zX2luZm9ybWF0aW9uDQogICAgICB0b29scy9w
b3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCBwbV9xb3NfY29uZmlnDQogICAg
ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCBwbV9nZXRfY2xv
cw0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQWJzdHJhY3Qgc2V0
X2Nsb3MNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEFic3RyYWN0
DQpjbG9zX2dldF9hc3NvY19zdGF0dXMNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3Q6IEFic3RyYWN0IGNsb3NfYXNzb2NpYXRlDQogICAgICB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0OiBBYnN0cmFjdCByZWFkX3BtX2NvbmZpZw0KICAgICAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQWJzdHJhY3QgYWRqdXN0X3VuY29yZV9mcmVx
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBNb3ZlIHNlbmRfbWJv
eF9jbWQgdG8gaXNzdC0NCmNvcmUtbWJveC5jDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwt
c3BlZWQtc2VsZWN0OiBBbGxvdyBhcGlfdmVyc2lvbiBiYXNlZA0KcGxhdGZvcm0gY2FsbGJhY2tz
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBJbnRyb2R1Y2UgaXNf
ZGVidWdfZW5hYmxlZCgpDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0
OiBTdXBwb3J0IGxhcmdlIGNsb3NfbWluL21heA0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVs
LXNwZWVkLXNlbGVjdDogSW50cm9kdWNlIGFwaV92ZXJzaW9uIGhlbHBlcg0KICAgICAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogSW50cm9kdWNlIFRQTUkgaW50ZXJmYWNlDQpz
dXBwb3J0DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBEaXNwbGF5
IHB1bml0IGluZm8NCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IERp
c3BsYXkgYW14X3AxIGFuZA0KY29vbGluZ190eXBlDQogICAgICB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0OiBBbGxvdyBkaXNwbGF5IG5vbi1jcHUgcG93ZXINCmRvbWFpbiBpbmZv
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBQcmV2ZW50IGNwdSBj
bG9zIGNvbmZpZyBmb3INCm5vbi1jcHUgcG93ZXIgZG9tYWluDQogICAgICB0b29scy9wb3dlci94
ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBTaG93IGxldmVsIDAgbmFtZSBmb3IgbmV3DQphcGlfdmVy
c2lvbg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRGlzcGxheSBm
YWN0IGluZm8gZm9yIG5vbi1jcHUNCnBvd2VyIGRvbWFpbg0KICAgICAgdG9vbHMvcG93ZXIveDg2
L2ludGVsLXNwZWVkLXNlbGVjdDogSGlkZSBpbnZhbGlkIFRSTCBsZXZlbA0KICAgICAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogUmVtb3ZlIGNwdSBtYXNrIGRpc3BsYXkgZm9y
DQpub24tY3B1IHBvd2VyIGRvbWFpbg0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVk
LXNlbGVjdDogQXZvaWQgc2V0dGluZyBkdXBsaWNhdGUgdGRwDQpsZXZlbA0KICAgICAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQWRkIGNwdSBpZCBjaGVjaw0KICAgICAgdG9v
bHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRml4IGNsb3MtbWF4IGRpc3BsYXkgd2l0
aA0KVFBNSSBJL0YNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IFVw
ZGF0ZSB2ZXJzaW9uDQoNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L0J1aWxk
ICAgICAgICAgICAgfCAgICAyICstDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dC9pc3N0LWNvbmZpZy5jICAgIHwgIDc2OQ0KKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1jb3JlLW1ib3guYyB8
IDEwNjYNCisrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCiB0b29s
cy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29yZS10cG1pLmMgfCAgNzg3DQor
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1z
cGVlZC1zZWxlY3QvaXNzdC1jb3JlLmMgICAgICB8ICA4NDYgKysrKysrLS0tLS0NCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0
LWRhZW1vbi5jICAgIHwgICAzOCArLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxl
Y3QvaXNzdC1kaXNwbGF5LmMgICB8ICAyNDUgKysrKystLS0tLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9p
bnRlbC1zcGVlZC1zZWxlY3QvaXNzdC5oICAgICAgICAgICB8ICAgOTYgKystLQ0KIDggZmlsZXMg
Y2hhbmdlZCwgMjYxNyBpbnNlcnRpb25zKCspLCAxMjMyIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtY29yZS1t
Ym94LmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNl
bGVjdC9pc3N0LWNvcmUtdHBtaS5jDQoNClRoYW5rcywNClNyaW5pdmFzDQo=
