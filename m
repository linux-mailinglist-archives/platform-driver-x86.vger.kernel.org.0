Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25C911CC31A
	for <lists+platform-driver-x86@lfdr.de>; Sat,  9 May 2020 19:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728219AbgEIRMa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 9 May 2020 13:12:30 -0400
Received: from mga01.intel.com ([192.55.52.88]:20792 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726013AbgEIRMa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 May 2020 13:12:30 -0400
IronPort-SDR: IrScUjL1/szWfQcVDjyangPMGr0Z+VYOuGd55PatZJPzvi4abrEPdNN2f8yVXWjPNWyIXi8pw5
 hWJCFxHZg2dA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2020 10:12:29 -0700
IronPort-SDR: PSeT8DIOkPlLQ50fQRG4Nktn5QIH4J2lznlZoFsDEy+rm9pGMEg8tzNsbApTndQRmpSIPwLP5Z
 zByeOvcuoW2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,372,1583222400"; 
   d="scan'208";a="252227319"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by fmsmga008.fm.intel.com with ESMTP; 09 May 2020 10:12:29 -0700
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 9 May 2020 10:12:29 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.11.125]) by
 ORSMSX115.amr.corp.intel.com ([169.254.4.83]) with mapi id 14.03.0439.000;
 Sat, 9 May 2020 10:12:29 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select for 5.8-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select for 5.8-rc1
Thread-Index: AQHWJiUE+2bHpNbggkiS0a+R6EZelQ==
Date:   Sat, 9 May 2020 17:12:29 +0000
Message-ID: <5adc631c1016d5d35171713a3d7c15ad34041c9b.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.2 (3.34.2-1.fc31) 
x-originating-ip: [10.54.75.21]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E8ED81F9A295848A5D5CDE228F516D6@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

T24gdG9wIG9mDQpnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1wbGF0Zm9ybS1kcml2ZXJz
LXg4Ni5naXQgcmV2aWV3LWFuZHkNCg0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29t
bWl0DQpjNTI4ZjMzNDFjMTQwZjE2ZGM5MWY4NzMxMTQyYmU1ODA3NjRmNjNkOg0KDQogIHBsYXRm
b3JtL3g4Njogc29ueS1sYXB0b3A6IE1ha2UgcmVzdW1pbmcgdGhlcm1hbCBwcm9maWxlIHNhZmVy
ICgyMDIwLQ0KMDUtMDcgMjE6MTY6MDIgKzAzMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdp
dCByZXBvc2l0b3J5IGF0Og0KDQogIGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51
eC1rZXJuZWwuZ2l0IHNzdC1wdWxsLXJlcQ0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8NCjY2MDQ3ZjQ0NDVlMWY5M2NjZWFhOGQyYzZkOWZjODBkN2Q2N2MwNWM6DQoNCiAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogVXBkYXRlIHZlcnNpb24gKDIwMjAtMDUtMDgN
CjExOjQ3OjA4IC0wNzAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpQcmFyaXQgQmhhcmdhdmEgKDIpOg0KICAgICAg
dG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRml4IENMWC1OIHBhY2thZ2UgaW5m
b3JtYXRpb24NCm91dHB1dA0KICAgICAgdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVj
dDogRml4IHNwZWVkLXNlbGVjdC1iYXNlLWZyZXEtDQpwcm9wZXJ0aWVzIG91dHB1dCBvbiBDTFgt
Tg0KDQpTcmluaXZhcyBQYW5kcnV2YWRhICg0KToNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRl
bC1zcGVlZC1zZWxlY3Q6IENoYW5nZSBkZWJ1ZyB0byBlcnJvcg0KICAgICAgdG9vbHMvcG93ZXIv
eDg2L2ludGVsLXNwZWVkLXNlbGVjdDogQ2hlY2sgc3VwcG9ydCBzdGF0dXMgYmVmb3JlDQplbmFi
bGUNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEVuYWJsZSBjbG9z
IGZvciB0dXJiby1mcmVxDQplbmFibGUNCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVl
ZC1zZWxlY3Q6IFVwZGF0ZSB2ZXJzaW9uDQoNCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQt
c2VsZWN0L2lzc3QtY29uZmlnLmMgIHwgNDUNCisrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLQ0KIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNz
dC1jb3JlLmMgICAgfCAgNiArKystLS0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0L2lzc3QtZGlzcGxheS5jIHwgIDIgKy0NCiAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pDQo=
