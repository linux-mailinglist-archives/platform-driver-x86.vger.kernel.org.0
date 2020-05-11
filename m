Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70D491CE397
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 May 2020 21:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730999AbgEKTJq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 May 2020 15:09:46 -0400
Received: from mga17.intel.com ([192.55.52.151]:21295 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730974AbgEKTJp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 May 2020 15:09:45 -0400
IronPort-SDR: eg7FdtDexYLKRGTrZluP3kgCB2LTiLxPXZlP++Qc6BuArq/Q+Z0YSO+R/xlDCzWJLWGFJaWmzw
 vaUxx8LfqGtg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2020 12:09:45 -0700
IronPort-SDR: zmjr0FF4ZvmCH3IfMEYEjs3aN7mMnWB/uZQYtT6DuJR6fqErKhLkfHTFoZ30naIBvDLIko1tsG
 D1wQGLAvHWMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; 
   d="scan'208";a="297043938"
Received: from orsmsx106.amr.corp.intel.com ([10.22.225.133])
  by fmsmga002.fm.intel.com with ESMTP; 11 May 2020 12:09:45 -0700
Received: from orsmsx153.amr.corp.intel.com (10.22.226.247) by
 ORSMSX106.amr.corp.intel.com (10.22.225.133) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 11 May 2020 12:09:44 -0700
Received: from orsmsx109.amr.corp.intel.com ([169.254.11.125]) by
 ORSMSX153.amr.corp.intel.com ([169.254.12.53]) with mapi id 14.03.0439.000;
 Mon, 11 May 2020 12:09:44 -0700
From:   "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
To:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Subject: [GIT PULL]: tools/power/x86/intel-speed-select for 5.8-rc1
Thread-Topic: [GIT PULL]: tools/power/x86/intel-speed-select for 5.8-rc1
Thread-Index: AQHWJ8e6Gz+eyaB7u0ymesX0yts3jw==
Date:   Mon, 11 May 2020 19:09:43 +0000
Message-ID: <c9b8a34b0c22df67123665db3e6c3c6ea1a1523a.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
x-originating-ip: [10.213.161.240]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3E3F73CAF0429419E65D77C10E84FEE@intel.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

UmVzZW5kIHRvIHJlYmFzZSBvbiB0b3Agb2YgZm9yLW5leHQgYnJhbmNoDQoNCk9uIHRvcCBvZiBn
aXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy9saW51eC1wbGF0Zm9ybS1kcml2ZXJzLXg4Ni5naXQgZm9y
LQ0KbmV4dA0KDQpUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0DQpkMzA3ZjE3Mjkz
MjI2YTViZjIyY2JlNjdkOGI5NDllZmUxNDM5NTBlOg0KDQogIHBsYXRmb3JtL3g4NjogaW50ZWwt
dmJ0bjogRml4IHByb2JlIGZhaWx1cmUgb24gZGV2aWNlcyB3aXRoIG9ubHkNCnN3aXRjaGVzICgy
MDIwLTA1LTA3IDIwOjE5OjM3ICswMzAwKQ0KDQphcmUgYXZhaWxhYmxlIGluIHRoZSBHaXQgcmVw
b3NpdG9yeSBhdDoNCg0KICBodHRwczovL2dpdGh1Yi5jb20vc3BhbmRydXZhZGEvbGludXgta2Vy
bmVsLmdpdCBmb3ItbmV4dA0KDQpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8NCmIxNGNk
OWQ1OTgxYTI2YmRmZGRmMmJkN2VmZTZlZDUxMzdkZTAyODk6DQoNCiAgdG9vbHMvcG93ZXIveDg2
L2ludGVsLXNwZWVkLXNlbGVjdDogVXBkYXRlIHZlcnNpb24gKDIwMjAtMDUtMTENCjExOjMwOjU1
IC0wNzAwKQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tDQpQcmFyaXQgQmhhcmdhdmEgKDIpOg0KICAgICAgdG9vbHMvcG93
ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdDogRml4IENMWC1OIHBhY2thZ2UgaW5mb3JtYXRpb24N
Cm91dHB1dA0KICAgICAgaW50ZWwtc3BlZWQtc2VsZWN0OiBGaXggc3BlZWQtc2VsZWN0LWJhc2Ut
ZnJlcS1wcm9wZXJ0aWVzIG91dHB1dA0Kb24gQ0xYLU4NCg0KU3Jpbml2YXMgUGFuZHJ1dmFkYSAo
NCk6DQogICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBDaGFuZ2UgZGVi
dWcgdG8gZXJyb3INCiAgICAgIHRvb2xzL3Bvd2VyL3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3Q6IENo
ZWNrIHN1cHBvcnQgc3RhdHVzIGJlZm9yZQ0KZW5hYmxlDQogICAgICB0b29scy9wb3dlci94ODYv
aW50ZWwtc3BlZWQtc2VsZWN0OiBFbmFibGUgY2xvcyBmb3IgdHVyYm8tZnJlcQ0KZW5hYmxlDQog
ICAgICB0b29scy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0OiBVcGRhdGUgdmVyc2lvbg0K
DQogdG9vbHMvcG93ZXIveDg2L2ludGVsLXNwZWVkLXNlbGVjdC9pc3N0LWNvbmZpZy5jICB8IDQ1
DQorKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLQ0KIHRvb2xzL3Bvd2Vy
L3g4Ni9pbnRlbC1zcGVlZC1zZWxlY3QvaXNzdC1jb3JlLmMgICAgfCAgNiArKystLS0NCiB0b29s
cy9wb3dlci94ODYvaW50ZWwtc3BlZWQtc2VsZWN0L2lzc3QtZGlzcGxheS5jIHwgIDIgKy0NCiAz
IGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo=
