Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A69222AB1
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Jul 2020 20:13:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728237AbgGPSNA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Jul 2020 14:13:00 -0400
Received: from mga06.intel.com ([134.134.136.31]:38536 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728182AbgGPSNA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Jul 2020 14:13:00 -0400
IronPort-SDR: Hi+DaGbFQWkalU7O5LXobYg3/t46Bmv/WfU2stc3pN8FQPMzSqA8DqFk6z/Yghep7rHFWnkV6Q
 9CWU7omUjJAQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9684"; a="211005472"
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; 
   d="scan'208";a="211005472"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2020 11:12:58 -0700
IronPort-SDR: ea0eVAhDm8fB8NlEE1HeIg9vQS2pUPUGuhvPr3PCD+omQGtA4/TJwb/9ZlaPmrEcywuBIXf07a
 Iwsqr+3B2qUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,360,1589266800"; 
   d="scan'208";a="300319444"
Received: from orsmsx102.amr.corp.intel.com ([10.22.225.129])
  by orsmga002.jf.intel.com with ESMTP; 16 Jul 2020 11:12:57 -0700
Received: from orsmsx116.amr.corp.intel.com (10.22.240.14) by
 ORSMSX102.amr.corp.intel.com (10.22.225.129) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 16 Jul 2020 11:12:56 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.11.31]) by
 ORSMSX116.amr.corp.intel.com ([169.254.7.172]) with mapi id 14.03.0439.000;
 Thu, 16 Jul 2020 11:12:56 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "andy@infradead.org" <andy@infradead.org>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select second pull request
 for 5.9-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select second pull
 request for 5.9-rc1
Thread-Index: AQHWW5y6p9O5/Pp4A0ueTOtmRcDL0Q==
Date:   Thu, 16 Jul 2020 18:12:56 +0000
Message-ID: <c5ba130fdaac43bd812e2c3e0b3daa6486e18395.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.255.228.15]
Content-Type: text/plain; charset="utf-8"
Content-ID: <3742BE8B0E879245849EF7E92706D70C@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

VGhlIGZvbGxvd2luZyBpcyBvbiB0b3Agb2YNCmh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51
eC1wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQvc2hvcnRsb2cvcmVmcy9oZWFkcy9mb3ItbmV4dA0K
DQoNClRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQNCmY5ZTExMDQzNjdjNTdmMmUw
M2E2YjVlNmU5NjM3ZmEyYjlmZjU2Mjc6DQoNCiAgcGxhdGZvcm0veDg2OiBtbHgtcGxhdGZvcm06
IEV4dGVuZCBGQU4gcGxhdGZvcm0gZGF0YSBkZXNjcmlwdGlvbg0KKDIwMjAtMDctMTUgMTI6NDU6
MDcgKzAzMDApDQoNCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Og0KDQog
IGh0dHBzOi8vZ2l0aHViLmNvbS9zcGFuZHJ1dmFkYS9saW51eC1rZXJuZWwuZ2l0IGZvci1uZXh0
DQoNCmZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0bw0KZjY1ZTEzMTFlOWM2YzY5YmI4ODZi
ZDMzMzM1NzdmODVkOWVlZGRiYzoNCg0KICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2Vs
ZWN0OiBVcGRhdGUgdmVyc2lvbiBmb3IgdjUuOSAoMjAyMC0wNy0NCjE2IDEwOjE4OjA2IC0wNzAw
KQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tDQpTcmluaXZhcyBQYW5kcnV2YWRhICg1KToNCiAgICAgIHRvb2xzL3Bvd2Vy
L3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IENoYW5nZSBwYXRoIGZvciBjYWNoaW5nDQp0b3BvbG9n
eSBpbmZvDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBJZ25vcmUg
LW8gb3B0aW9uIHByb2Nlc3NpbmcNCm9uIGVycm9yDQogICAgICB0b29scy9wb3dlci94ODYvaW50
ZWwtc3BlZWQtc2VsZWN0OiBBZGQgb3B0aW9uIHRvIGRlbGF5IG1ib3gNCmNvbW1hbmRzDQogICAg
ICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBBZGQgcmV0cmllcyBmb3IgbWFp
bCBib3gNCmNvbW1hbmRzDQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0
OiBVcGRhdGUgdmVyc2lvbiBmb3IgdjUuOQ0KDQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVk
LXNlbGVjdC9pc3N0LWNvbmZpZy5jIHwgODENCisrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0NCiAxIGZpbGUgY2hhbmdlZCwgNjEgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo=
