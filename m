Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D20D1DEF1D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 May 2020 20:25:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730793AbgEVSZ2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 May 2020 14:25:28 -0400
Received: from mga12.intel.com ([192.55.52.136]:51991 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726373AbgEVSZ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 May 2020 14:25:26 -0400
IronPort-SDR: M6ld+3VklhGH8ihYF37F8tcDXBUjCXgrGmkglgi1ZL5gnjHsH4n5+JoEbqLCj83+g6Pxu7dQbL
 KSZMbVv4obDQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2020 11:25:15 -0700
IronPort-SDR: qMTinNh44ID1LJGRdoGnFCZFEZ9+wMZtesbSy5zXQcxoo3QxfFexlJqcx4oBJOaq6YGyWQ+FB3
 QhyCj9Hmmfew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,422,1583222400"; 
   d="scan'208";a="290191669"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
  by fmsmga004.fm.intel.com with ESMTP; 22 May 2020 11:25:15 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.11.113]) by
 ORSMSX110.amr.corp.intel.com ([169.254.10.119]) with mapi id 14.03.0439.000;
 Fri, 22 May 2020 11:25:14 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select second pull request
 for 5.8-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select second pull
 request for 5.8-rc1
Thread-Index: AQHWMGZW85r42s5l3k2sBnXBFIAYEQ==
Date:   Fri, 22 May 2020 18:25:14 +0000
Message-ID: <9a6b95c0ca0973cbfee87dc2e289eace12f4a409.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.254.101.173]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C4826E9532A5824D9938DE2EDC8E2E35@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

U29tZSBpbXBvcnRhbnQgZml4ZXMgYWZ0ZXIgdGhlIGZpcnN0IFBVTEwgcmVxdWVzdCBmb3IgNS44
Lg0KDQpPbiB0b3Agb2YgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvbGludXgtcGxhdGZvcm0tZHJp
dmVycy14ODYuZ2l0IGZvci0NCm5leHQNCg0KVGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNv
bW1pdA0KZjQ0MWQ2NmE2ZWU5OGU5N2JkOWIyNjI2N2JhNTY3ZjgwNTZmNDYxYzoNCg0KICBwbGF0
Zm9ybS94ODY6IGRlbGwtd21pOiBJZ25vcmUga2V5Ym9hcmQgYXR0YWNoZWQgLyBkZXRhY2hlZCBl
dmVudHMNCigyMDIwLTA1LTE1IDE1OjUzOjA2ICswMzAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRo
ZSBHaXQgcmVwb3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEv
bGludXgta2VybmVsLmdpdCBmb3ItbmV4dA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8NCjg3M2UzOTFmZjMzZTc0MjE4OWNkN2RhNWVkNGJmZDk0MWU4M2VkZDc6DQoNCiAgdG9vbHMv
cG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRml4IGludmFsaWQgY29yZSBtYXNrICgyMDIw
LTA1LTIyIA0KMTE6MTg6MTUgLTA3MDApDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NClByYXJpdCBCaGFyZ2F2YSAoMSk6
DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXgganNvbiBwZXJm
LXByb2ZpbGUgb3V0cHV0DQpvdXRwdXQNCg0KU3Jpbml2YXMgUGFuZHJ1dmFkYSAoMik6DQogICAg
ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBJbmNyZWFzZSBDUFUgY291bnQN
CiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IEZpeCBpbnZhbGlkIGNv
cmUgbWFzaw0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvbmZp
Zy5jICB8ICA0ICsrLS0NCiB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3Qt
ZGlzcGxheS5jIHwgMjYNCisrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQogdG9vbHMvcG93ZXIv
eDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LmggICAgICAgICB8ICAxICsNCiAzIGZpbGVzIGNo
YW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0K
