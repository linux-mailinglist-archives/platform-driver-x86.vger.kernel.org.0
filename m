Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67B4936BF93
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Apr 2021 09:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbhD0HCV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 27 Apr 2021 03:02:21 -0400
Received: from [58.211.163.100] ([58.211.163.100]:61312 "EHLO
        mail.advantech.com.cn" rhost-flags-FAIL-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S229578AbhD0HCU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Apr 2021 03:02:20 -0400
X-Greylist: delayed 603 seconds by postgrey-1.27 at vger.kernel.org; Tue, 27 Apr 2021 03:02:20 EDT
Received: from ACNMB1.ACN.ADVANTECH.CORP (unverified [172.21.128.147]) by ACNSWEEPER.acn.advantech.com.cn
 (Clearswift SMTPRS 5.6.0) with ESMTP id <Te6203905b0ac1580102738@ACNSWEEPER.acn.advantech.com.cn>;
 Tue, 27 Apr 2021 14:51:26 +0800
Received: from ACNMB2.ACN.ADVANTECH.CORP (172.21.128.148) by
 ACNMB1.ACN.ADVANTECH.CORP (172.21.128.147) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 27 Apr 2021 14:50:50 +0800
Received: from ACNMB2.ACN.ADVANTECH.CORP ([172.21.128.148]) by
 ACNMB2.ACN.ADVANTECH.CORP ([172.21.128.148]) with mapi id 15.00.1497.015;
 Tue, 27 Apr 2021 14:50:50 +0800
From:   =?gb2312?B?eXVlY2hhby56aGFvKNXU1L2zrCk=?= 
        <yuechao.zhao@advantech.com.cn>
To:     "345351830@qq.com" <345351830@qq.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
CC:     =?gb2312?B?SmlhLlN1aSi81u6hKQ==?= <Jia.Sui@advantech.com.cn>
Subject: =?gb2312?B?tPC4tDogW3YxLDEvMV0gYWR2X21peDk1NXggaXMgYSBzY2hlbWUgdGhhdCBt?=
 =?gb2312?Q?ultiplexes_PCA9554/PCA9555_into_LED_and_GPIO?=
Thread-Topic: [v1,1/1] adv_mix955x is a scheme that multiplexes
 PCA9554/PCA9555 into LED and GPIO
Thread-Index: AQHXOzGEPkh5RGdmkUeQztnm+lWZgarH7N+g
Date:   Tue, 27 Apr 2021 06:50:50 +0000
Message-ID: <e6ef68af9030441aab275a64bdd75d99@ACNMB2.ACN.ADVANTECH.CORP>
References: <tencent_E0743E52BCE5D0378CBBCB5150F3159A0F06@qq.com>
In-Reply-To: <tencent_E0743E52BCE5D0378CBBCB5150F3159A0F06@qq.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [172.21.188.84]
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

RnJvbTogWXVlY2hhbyBaaGFvIDx5dWVjaGFvLnpoYW9AYWR2YW50ZWNoLmNvbS5jbj4NCg0KV2l0
aCB0aGlzIGRyaXZlciwgd2UgY2FuIG11bHRpcGxleCBQQ0E5NTU0L1BDQTk1NTUgaW50byBMRUQg
YW5kIEdQSU8gYmFzZWQgb24gdGhlIEFDUEkgZGF0YSBvZiBCSU9TLg0KDQpTaWduZWQtb2ZmLWJ5
OiBZdWVjaGFvIFpoYW8gPHl1ZWNoYW8uemhhb0BhZHZhbnRlY2guY29tLmNuPg0KU2lnbmVkLW9m
Zi1ieTogU3VpIEppYSA8amlhLnN1aUBhZHZhbnRlY2guY29tLmNuPg0KLS0tDQogTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNiArDQogZHJpdmVycy9wbGF0Zm9ybS94ODYv
S2NvbmZpZyAgICAgICB8ICAxNCArDQogZHJpdmVycy9wbGF0Zm9ybS94ODYvTWFrZWZpbGUgICAg
ICB8ICAgMyArDQogZHJpdmVycy9wbGF0Zm9ybS94ODYvYWR2X21peDk1NXguYyB8IDcwMyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKw0KIDQgZmlsZXMgY2hhbmdlZCwgNzI2IGluc2VydGlv
bnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9wbGF0Zm9ybS94ODYvYWR2X21peDk1
NXguYw0KDQpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KaW5kZXggZDky
Zjg1Y2E4MzFkLi4zODcxYzBkM2JjNmEgMTAwNjQ0DQotLS0gYS9NQUlOVEFJTkVSUw0KKysrIGIv
TUFJTlRBSU5FUlMNCkBAIC05MjEwLDYgKzkyMTAsMTIgQEAgUzoJTWFpbnRhaW5lZA0KIEY6CWFy
Y2gveDg2L2luY2x1ZGUvYXNtL2ludGVsX3RlbGVtZXRyeS5oDQogRjoJZHJpdmVycy9wbGF0Zm9y
bS94ODYvaW50ZWxfdGVsZW1ldHJ5Kg0KIA0KK0FEVkFOVEVDSCBNSVg5OTVYIERSSVZFUg0KK006
CVl1ZWNoYW8gWmhhbyA8eXVlY2hhby56aGFvQGFkdmFudGVjaC5jb20uY24+DQorTToJU3VpIEpp
YSA8amlhLnN1aUBhZHZhbnRlY2guY29tLmNuPg0KK1M6CU1haW50YWluZWQNCitGOglkcml2ZXJz
L3BsYXRmb3JtL3g4Ni9hZHZfbWl4OTU1eC5jDQorDQogSU5URUwgVU5DT1JFIEZSRVFVRU5DWSBD
T05UUk9MDQogTToJU3Jpbml2YXMgUGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51
eC5pbnRlbC5jb20+DQogTDoJcGxhdGZvcm0tZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmcNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9LY29uZmlnIGIvZHJpdmVycy9wbGF0Zm9y
bS94ODYvS2NvbmZpZyBpbmRleCBhZDRlNjMwZTczZTIuLmNjZWFkNzVjNzY0YiAxMDA2NDQNCi0t
LSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L0tjb25maWcNCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L0tjb25maWcNCkBAIC0xMjg0LDYgKzEyODQsMjAgQEAgY29uZmlnIElOVEVMX1RFTEVNRVRS
WQ0KIAkgIGRpcmVjdGx5IHZpYSBkZWJ1Z2ZzIGZpbGVzLiBWYXJpb3VzIHRvb2xzIG1heSB1c2UN
CiAJICB0aGlzIGludGVyZmFjZSBmb3IgU29DIHN0YXRlIG1vbml0b3JpbmcuDQogDQorY29uZmln
IEFEVl9NSVg5NTVYDQorICAgIHRyaXN0YXRlICJBZHZhbnRlY2ggTEVEcyBhbmQgR1BJT3MgRHJp
dmVyIg0KKyAgICBkZXBlbmRzIG9uIFg4Nl82NA0KKyAgICBkZXBlbmRzIG9uIEFDUEkgJiYgR1BJ
T0xJQg0KKyAgICBzZWxlY3QgTEVEU19DTEFTUw0KKyAgICBzZWxlY3QgTEVEU19UUklHR0VSUw0K
KyAgICBoZWxwDQorICAgICAgVGhpcyBkcml2ZXIgaXMgYmFzZWQgb24gdGhlIGtlcm5lbCBkcml2
ZXIgbGVkcy1wY2E5NTV4DQorICAgICAgYW5kIGdwaW8tcGNhOTUzeCBidXQgcmV3cml0ZSBmb3Ig
UENBOTU1NC9QQ0E5NTU1Lg0KKyAgICAgIFRoaXMgZHJpdmVyIHJlcXVpcmVzIExFRCBkYXRhIHdo
aWNoIGlzIGRlZmluZWQgaW5zaWRlDQorICAgICAgQUNQSSBEU0RUIG9yIGRldmljZXRyZWUuDQor
ICAgICAgSW4gYWRkaXRpb24sIHRoZSBwaW4gdGhhdCBpcyBub3QgZGVmaW5lZCBhcyBMRUQgd2ls
bA0KKyAgICAgIGJlIGRlY2xhcmVkIGFzIEdQSU8uDQorDQogZW5kaWYgIyBYODZfUExBVEZPUk1f
REVWSUNFUw0KIA0KIGNvbmZpZyBQTUNfQVRPTQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZv
cm0veDg2L01ha2VmaWxlIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvTWFrZWZpbGUgaW5kZXggNjBk
NTU0MDczNzQ5Li41ZWNhZDBhZTkyNWUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9NYWtlZmlsZQ0KKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvTWFrZWZpbGUNCkBAIC0xMzgs
MyArMTM4LDYgQEAgb2JqLSQoQ09ORklHX0lOVEVMX1RFTEVNRVRSWSkJCSs9IGludGVsX3RlbGVt
ZXRyeV9jb3JlLm8gXA0KIAkJCQkJICAgaW50ZWxfdGVsZW1ldHJ5X3BsdGRydi5vIFwNCiAJCQkJ
CSAgIGludGVsX3RlbGVtZXRyeV9kZWJ1Z2ZzLm8NCiBvYmotJChDT05GSUdfUE1DX0FUT00pCQkJ
Kz0gcG1jX2F0b20ubw0KKw0KKyMgQWR2YW50ZWNoDQorb2JqLSQoQ09ORklHX0FEVl9NSVg5NTVY
KQkJKz0gYWR2X21peDk1NXgubw0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2Fk
dl9taXg5NTV4LmMgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hZHZfbWl4OTU1eC5jDQpuZXcgZmls
ZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMDAwLi45OWZjMTQyN2Q0ZDkNCi0tLSAvZGV2
L251bGwNCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2Fkdl9taXg5NTV4LmMNCkBAIC0wLDAg
KzEsNzAzIEBADQorLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb3ItbGF0ZXIN
CisvKg0KKyAqIENvcHlyaWdodCAyMDE5IEFkdmFudGVjaCBDb3JwLg0KKyAqDQorICogQXV0aG9y
Og0KKyAqCUppYSBTdWkgPGppYS5zdWlAYWR2YW50ZWNoLmNvbS5jbj4NCisgKglZdWVjaGFvIFpo
YW8gPHl1ZWNoYW8uemhhb0BhZHZhbnRlY2guY29tLmNuPg0KKyAqDQorICogQSBkcml2ZXIgZm9y
IEFNSVg5NTU8WD4oQWR2YW50ZWNoIG1peGVkIGRldmljZSBiYXNlZCBvbiBQQ0E5NTVYKS4NCisg
KiBUaGlzIGRyaXZlciBwcm92aWRlcyBMRUQgYW5kIEdQSU8gZnVuY3Rpb25zLg0KKyAqDQorICog
U3VwcG9ydGVkIGRldmljZXM6DQorICoNCisgKglEZXZpY2UJCUFDUElfREVWSUNFX0lECURlc2Ny
aXB0aW9uCTctYml0IHNsYXZlIGFkZHJlc3MNCisgKgktLS0tLS0tLQktLS0tLS0tLS0tLS0tLQkt
LS0tLS0tLS0tLS0tLS0JLS0tLS0tLS0tLS0tLS0tLS0tLQ0KKyAqCUFNSVg5NTU0CUFIQzAzMjAJ
CUJhc2Ugb24gUENBOTU1NAkweDIwIC4uIDB4MjcNCisgKglBTUlYOTU1NQlBSEMwMzIxCQlCYXNl
IG9uIFBDQTk1NTUJMHgyMCAuLiAweDI3DQorICovDQorDQorI2luY2x1ZGUgPGxpbnV4L2kyYy5o
Pg0KKyNpbmNsdWRlIDxsaW51eC9sZWRzLmg+DQorI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0K
KyNpbmNsdWRlIDxsaW51eC92ZXJzaW9uLmg+DQorI2luY2x1ZGUgPGxpbnV4L2Z3bm9kZS5oPg0K
KyNpbmNsdWRlIDxsaW51eC9hY3BpLmg+DQorI2luY2x1ZGUgPGxpbnV4L2dwaW8vZHJpdmVyLmg+
DQorI2luY2x1ZGUgPGxpbnV4L2dwaW8vY29uc3VtZXIuaD4NCisjaW5jbHVkZSA8YXNtL3VuYWxp
Z25lZC5oPg0KKw0KKyNkZWZpbmUgVkVSU0lPTiAiMC4wNSINCisNCitlbnVtIEFNSVg5NTVYX0xF
RCB7DQorCUFNSVg5NTVYX0xFRF9PTiA9IDAsDQorCUFNSVg5NTVYX0xFRF9PRkYgPSAxLA0KK307
DQorDQorI2RlZmluZSBCQU5LX1NJWkUgOA0KKy8qDQorICogT25seSBzdXBwb3J0IHBjYTk1NTQg
YW5kIHBjYTk1NTUsDQorICogVGhlIG1heCBwaW4gbnVtYmVycyBpcyAxNg0KKyAqIERlZmluZCBN
QVhfQkFOSyA9IDINCisgKi8NCisjZGVmaW5lIE1BWF9CQU5LIDINCisNCisvKiBQQ0E5NTU0IEdQ
SU8gcmVnaXN0ZXIgKi8NCisjZGVmaW5lIEFNSVg5NTVYX0lOUFVUIDB4MDANCisjZGVmaW5lIEFN
SVg5NTVYX09VVFBVVCAweDAxDQorI2RlZmluZSBBTUlYOTU1WF9JTlZFUlQgMHgwMg0KKyNkZWZp
bmUgQU1JWDk1NVhfRElSRUNUSU9OIDB4MDMNCisNCisvKiBEZWZhdWx0IFZhbHVlIG9mIEdQSU8g
cmVnaXN0ZXIgKi8NCisjZGVmaW5lIEFNSVg5NTVYX09VVFBVVF9ERUZBVUxUIDB4RkYNCisjZGVm
aW5lIEFNSVg5NTVYX0RJUkVDVElPTl9ERUZBVUxUIDB4RkZGRg0KKw0KK2VudW0gY2hpcF9pZCB7
DQorCWFtaXg5NTU0LA0KKwlhbWl4OTU1NSwNCit9Ow0KKw0KK3N0cnVjdCBjaGlwX2luZm9fdCB7
DQorCXU4IGJpdHM7DQorCXU4IHNsdl9hZGRyOyAvKiA3LWJpdCBzbGF2ZSBhZGRyZXNzIG1hc2sg
Ki8NCisJaW50IHNsdl9hZGRyX3NoaWZ0OyAvKiBOdW1iZXIgb2YgYml0cyB0byBpZ25vcmUgKi8g
fTsNCisNCitzdGF0aWMgc3RydWN0IGNoaXBfaW5mb190IGNoaXBfaW5mb190YWJsZXNbXSA9IHsN
CisJW2FtaXg5NTU0XSA9IHsNCisJCS5iaXRzID0gOCwNCisJCS5zbHZfYWRkciA9IC8qIDAxMDB4
eHggKi8gMHgyMCwNCisJCS5zbHZfYWRkcl9zaGlmdCA9IDMsDQorCX0sDQorCVthbWl4OTU1NV0g
PSB7DQorCQkuYml0cyA9IDE2LA0KKwkJLnNsdl9hZGRyID0gLyogMDEwMHh4eCAqLyAweDIwLA0K
KwkJLnNsdl9hZGRyX3NoaWZ0ID0gMywNCisJfSwNCit9Ow0KKw0KK3N0cnVjdCBhbWl4OTU1eF9y
ZWdfY29uZmlnIHsNCisJaW50IGRpcmVjdGlvbjsNCisJaW50IG91dHB1dDsNCisJaW50IGlucHV0
Ow0KKwlpbnQgaW52ZXJ0Ow0KK307DQorDQorc3RhdGljIGNvbnN0IHN0cnVjdCBhbWl4OTU1eF9y
ZWdfY29uZmlnIGFtaXg5NTV4X3JlZ3MgPSB7DQorCS5kaXJlY3Rpb24gPSBBTUlYOTU1WF9ESVJF
Q1RJT04sDQorCS5vdXRwdXQgPSBBTUlYOTU1WF9PVVRQVVQsDQorCS5pbnB1dCA9IEFNSVg5NTVY
X0lOUFVULA0KKwkuaW52ZXJ0ID0gQU1JWDk1NVhfSU5WRVJULA0KK307DQorDQorc3RydWN0IGRy
aXZlcl9kYXRhIHsNCisJc3RydWN0IG11dGV4IGxvY2s7IC8qIHByb3RlY3QgcmVhZC93cml0ZSBQ
Q0E5NTVYICovDQorCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQ7DQorCXN0cnVjdCBjaGlwX2lu
Zm9fdCAqY2hpcF9pbmZvOw0KKwlzdHJ1Y3QgYW1peDk1NXhfbGVkICpsZWRzOw0KKwlzdHJ1Y3Qg
YW1peDk1NXhfZ3BpbyAqZ3BpbzsNCisJaW50ICgqd3JpdGVfcmVncykoc3RydWN0IGkyY19jbGll
bnQgKmkyYywgaW50IHJlZywgdTggKnZhbCk7DQorCWludCAoKnJlYWRfcmVncykoc3RydWN0IGky
Y19jbGllbnQgKmkyYywgaW50IHJlZywgdTggKnZhbCk7IH07DQorDQorc3RydWN0IGFtaXg5NTV4
X2xlZCB7DQorCXN0cnVjdCBkcml2ZXJfZGF0YSAqZGF0YTsNCisJc3RydWN0IGxlZF9jbGFzc2Rl
diBsZWRfY2RldjsNCisJaW50IGxlZF9pZDsNCisJY2hhciBuYW1lWzMyXTsNCisJY29uc3QgY2hh
ciAqZGVmYXVsdF90cmlnZ2VyOw0KK307DQorDQorc3RydWN0IGFtaXg5NTV4X2dwaW8gew0KKwl1
OCByZWdfb3V0cHV0W01BWF9CQU5LXTsNCisJdTggcmVnX2RpcmVjdGlvbltNQVhfQkFOS107DQor
CWludCBncGlvX2lkW01BWF9CQU5LICogQkFOS19TSVpFXTsvL3RoZSBpZCBsaXN0IG9mIGdwaW8g
cGluDQorDQorCXN0cnVjdCBncGlvX2NoaXAgZ3Bpb19jaGlwOw0KKwljb25zdCBzdHJ1Y3QgYW1p
eDk1NXhfcmVnX2NvbmZpZyAqcmVnczsgfTsNCisNCitzdHJ1Y3QgYW1peDk1NXhfcGxhdGZvcm1f
ZGF0YSB7DQorCXN0cnVjdCBkcml2ZXJfZGF0YSAqZGF0YTsNCisJc3RydWN0IGFtaXg5NTV4X2xl
ZCAqbGVkczsNCisJc3RydWN0IGFtaXg5NTV4X2dwaW8gKmdwaW87DQorCWludCBudW1fbGVkczsN
CisJaW50IGdwaW9fc3RhcnQ7DQorCWludCBudW1fZ3BpbzsNCit9Ow0KKw0KK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgYWNwaV9kZXZpY2VfaWQgYWNwaV9hbWl4OTU1eF9tYXRjaFtdID0gew0KKwl7ICJB
SEMwMzIwIiwgYW1peDk1NTQgfSwNCisJeyAiQUhDMDMyMSIsIGFtaXg5NTU1IH0sDQorCXt9LA0K
K307DQorTU9EVUxFX0RFVklDRV9UQUJMRShhY3BpLCBhY3BpX2FtaXg5NTV4X21hdGNoKTsNCisN
CitzdGF0aWMgaW50IGdldF9kZXZpY2VfaW5kZXgoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwN
CisJCQkgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQ0KK3sNCisJY29uc3Qgc3Ry
dWN0IGFjcGlfZGV2aWNlX2lkICphY3BpX2lkOw0KKw0KKwlpZiAoaWQpDQorCQlyZXR1cm4gaWQt
PmRyaXZlcl9kYXRhOw0KKw0KKwlhY3BpX2lkID0gYWNwaV9tYXRjaF9kZXZpY2UoYWNwaV9hbWl4
OTU1eF9tYXRjaCwgJmNsaWVudC0+ZGV2KTsNCisJaWYgKCFhY3BpX2lkKQ0KKwkJcmV0dXJuIC1F
Tk9ERVY7DQorDQorCXJldHVybiBhY3BpX2lkLT5kcml2ZXJfZGF0YTsNCit9DQorDQorc3RhdGlj
IGlubGluZSB1OCBhbWl4OTU1eF9zZXRfYml0KHU4IHZhbCwgaW50IGxlZF9pZCwgZW51bSBBTUlY
OTU1WF9MRUQgDQorc3RhdGUpIHsNCisJbGVkX2lkICU9IEJBTktfU0laRTsNCisNCisJc3dpdGNo
IChzdGF0ZSkgew0KKwljYXNlIEFNSVg5NTVYX0xFRF9PTjoNCisJCXZhbCAmPSB+KDEgPDwgbGVk
X2lkKTsgLy9DbGVhciBiaXQNCisJCWJyZWFrOw0KKwljYXNlIEFNSVg5NTVYX0xFRF9PRkY6DQor
CQl2YWwgfD0gMSA8PCBsZWRfaWQ7IC8vU2V0IGJpdA0KKwkJYnJlYWs7DQorCX0NCisNCisJcmV0
dXJuIHZhbDsNCit9DQorDQorc3RhdGljIGludCBhbWl4OTU1eF9yZWFkX3JlZ3NfOChzdHJ1Y3Qg
aTJjX2NsaWVudCAqY2xpZW50LCBpbnQgcmVnLCB1OCANCisqdmFsKSB7DQorCWludCByZXQgPSBp
MmNfc21idXNfcmVhZF9ieXRlX2RhdGEoY2xpZW50LCByZWcpOw0KKwkqdmFsID0gcmV0Ow0KKwly
ZXR1cm4gcmV0Ow0KK30NCisNCitzdGF0aWMgaW50IGFtaXg5NTV4X3JlYWRfcmVnc18xNihzdHJ1
Y3QgaTJjX2NsaWVudCAqY2xpZW50LCBpbnQgcmVnLCB1OCANCisqdmFsKSB7DQorCWludCByZXQg
PSBpMmNfc21idXNfcmVhZF93b3JkX2RhdGEoY2xpZW50LCByZWcgPDwgMSk7DQorDQorCXZhbFsw
XSA9ICh1MTYpcmV0ICYgMHhGRjsNCisJdmFsWzFdID0gKHUxNilyZXQgPj4gODsNCisNCisJcmV0
dXJuIHJldDsNCit9DQorDQorc3RhdGljIGludCBhbWl4OTU1eF9yZWFkX3JlZ3Moc3RydWN0IGRy
aXZlcl9kYXRhICpkYXRhLCBpbnQgcmVnLCB1OCANCisqdmFsKSB7DQorCWludCByZXQ7DQorDQor
CXJldCA9IGRhdGEtPnJlYWRfcmVncyhkYXRhLT5jbGllbnQsIHJlZywgdmFsKTsNCisJaWYgKHJl
dCA8IDApIHsNCisJCWRldl9lcnIoJmRhdGEtPmNsaWVudC0+ZGV2LCAiZmFpbGVkIHJlYWRpbmcg
cmVnaXN0ZXJcbiIpOw0KKwkJcmV0dXJuIHJldDsNCisJfQ0KKw0KKwlyZXR1cm4gMDsNCit9DQor
DQorc3RhdGljIGludCBhbWl4OTU1eF9yZWFkX3NpbmdsZShzdHJ1Y3QgZHJpdmVyX2RhdGEgKmRh
dGEsIGludCByZWcsIHUzMiAqdmFsLA0KKwkJCQlpbnQgb2ZmKQ0KK3sNCisJaW50IHJldDsNCisJ
aW50IGJhbmtfc2hpZnQgPSBmbHMoKGRhdGEtPmNoaXBfaW5mby0+Yml0cyAtIDEpIC8gQkFOS19T
SVpFKTsNCisJaW50IG9mZnNldCA9IG9mZiAvIEJBTktfU0laRTsNCisNCisJcmV0ID0gaTJjX3Nt
YnVzX3JlYWRfYnl0ZV9kYXRhKGRhdGEtPmNsaWVudCwNCisJCQkJICAgICAgIChyZWcgPDwgYmFu
a19zaGlmdCkgKyBvZmZzZXQpOw0KKw0KKwkqdmFsID0gcmV0Ow0KKw0KKwlpZiAocmV0IDwgMCkN
CisJCWRldl9lcnIoJmRhdGEtPmNsaWVudC0+ZGV2LCAiZmFpbGVkIHJlYWRpbmcgcmVnaXN0ZXJc
biIpOw0KKw0KKwlyZXR1cm4gcmV0Ow0KK30NCisNCitzdGF0aWMgaW50IGFtaXg5NTV4X3dyaXRl
X3JlZ3NfOChzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LCBpbnQgcmVnLCB1OCANCisqdmFsKSB7
DQorCXJldHVybiBpMmNfc21idXNfd3JpdGVfYnl0ZV9kYXRhKGNsaWVudCwgcmVnLCAqdmFsKTsg
fQ0KKw0KK3N0YXRpYyBpbnQgYW1peDk1NXhfd3JpdGVfcmVnc18xNihzdHJ1Y3QgaTJjX2NsaWVu
dCAqY2xpZW50LCBpbnQgcmVnLCANCit1OCAqdmFsKSB7DQorCV9fbGUxNiB3b3JkID0gY3B1X3Rv
X2xlMTYoZ2V0X3VuYWxpZ25lZCgodTE2ICopdmFsKSk7DQorDQorCXJldHVybiBpMmNfc21idXNf
d3JpdGVfd29yZF9kYXRhKGNsaWVudCwgcmVnIDw8IDEsIChfX2ZvcmNlIHUxNil3b3JkKTsgDQor
fQ0KKw0KK3N0YXRpYyBpbnQgYW1peDk1NXhfd3JpdGVfcmVncyhzdHJ1Y3QgZHJpdmVyX2RhdGEg
KmRhdGEsIGludCByZWcsIHU4IA0KKyp2YWwpIHsNCisJaW50IHJldDsNCisNCisJcmV0ID0gZGF0
YS0+d3JpdGVfcmVncyhkYXRhLT5jbGllbnQsIHJlZywgdmFsKTsNCisJaWYgKHJldCA8IDApIHsN
CisJCWRldl9lcnIoJmRhdGEtPmNsaWVudC0+ZGV2LCAiZmFpbGVkIHdyaXRpbmcgcmVnaXN0ZXJc
biIpOw0KKwkJcmV0dXJuIHJldDsNCisJfQ0KKw0KKwlyZXR1cm4gMDsNCit9DQorDQorc3RhdGlj
IGludCBhbWl4OTU1eF93cml0ZV9zaW5nbGUoc3RydWN0IGRyaXZlcl9kYXRhICpkYXRhLCBpbnQg
cmVnLCB1MzIgdmFsLA0KKwkJCQkgaW50IG9mZikNCit7DQorCWludCByZXQ7DQorCWludCBiYW5r
X3NoaWZ0ID0gZmxzKChkYXRhLT5jaGlwX2luZm8tPmJpdHMgLSAxKSAvIEJBTktfU0laRSk7DQor
CWludCBvZmZzZXQgPSBvZmYgLyBCQU5LX1NJWkU7DQorDQorCXJldCA9IGkyY19zbWJ1c193cml0
ZV9ieXRlX2RhdGEoZGF0YS0+Y2xpZW50LA0KKwkJCQkJKHJlZyA8PCBiYW5rX3NoaWZ0KSArIG9m
ZnNldCwgdmFsKTsNCisNCisJaWYgKHJldCA8IDApDQorCQlkZXZfZXJyKCZkYXRhLT5jbGllbnQt
PmRldiwgImZhaWxlZCB3cml0aW5nIHJlZ2lzdGVyXG4iKTsNCisNCisJcmV0dXJuIHJldDsNCit9
DQorDQorc3RhdGljIGludCBhbWl4OTU1eF9sZWRfc2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmxl
ZF9jZGV2LA0KKwkJCSAgICBlbnVtIGxlZF9icmlnaHRuZXNzIHZhbHVlKQ0KK3sNCisJc3RydWN0
IGFtaXg5NTV4X2xlZCAqbGVkOw0KKwlzdHJ1Y3QgZHJpdmVyX2RhdGEgKmRhdGE7DQorCWludCBs
ZWRfaWQ7DQorCWludCByZXQgPSAwOw0KKwl1MzIgcmVnX3ZhbCA9IDA7DQorDQorCWxlZCA9IGNv
bnRhaW5lcl9vZihsZWRfY2Rldiwgc3RydWN0IGFtaXg5NTV4X2xlZCwgbGVkX2NkZXYpOw0KKwlk
YXRhID0gbGVkLT5kYXRhOw0KKwlsZWRfaWQgPSBsZWQtPmxlZF9pZDsNCisNCisJbXV0ZXhfbG9j
aygmZGF0YS0+bG9jayk7DQorDQorCS8vZ2V0IGN1cnJlbnQgdmFsdWUNCisJcmV0ID0gYW1peDk1
NXhfcmVhZF9zaW5nbGUoZGF0YSwgQU1JWDk1NVhfT1VUUFVULCAmcmVnX3ZhbCwgbGVkX2lkKTsN
CisJaWYgKHJldCA8IDApDQorCQlnb3RvIHNldF9mYWlsZWQ7DQorDQorCS8vY2hhbmdlIGJpdA0K
Kwlzd2l0Y2ggKHZhbHVlKSB7DQorCWNhc2UgTEVEX09GRjoNCisJCXJlZ192YWwgPSBhbWl4OTU1
eF9zZXRfYml0KHJlZ192YWwsIGxlZF9pZCwgQU1JWDk1NVhfTEVEX09GRik7DQorCQlicmVhazsN
CisJZGVmYXVsdDoNCisJCXJlZ192YWwgPSBhbWl4OTU1eF9zZXRfYml0KHJlZ192YWwsIGxlZF9p
ZCwgQU1JWDk1NVhfTEVEX09OKTsNCisJCWJyZWFrOw0KKwl9DQorDQorCS8vc2V0IG5ldyB2YWx1
ZQ0KKwlyZXQgPSBhbWl4OTU1eF93cml0ZV9zaW5nbGUoZGF0YSwgQU1JWDk1NVhfT1VUUFVULCBy
ZWdfdmFsLCBsZWRfaWQpOw0KKw0KK3NldF9mYWlsZWQ6DQorCW11dGV4X3VubG9jaygmZGF0YS0+
bG9jayk7DQorDQorCXJldHVybiByZXQ7DQorfQ0KKw0KK3N0YXRpYyBpbnQgYW1peDk1NXhfZ3Bp
b19kaXJlY3Rpb25faW5wdXQoc3RydWN0IGdwaW9fY2hpcCAqZ2MsIHVuc2lnbmVkIA0KK2ludCBv
ZmYpIHsNCisJc3RydWN0IGRyaXZlcl9kYXRhICpkYXRhID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2Mp
Ow0KKwl1OCByZWdfdmFsOw0KKwl1bnNpZ25lZCBpbnQgaW5kZXg7DQorCWludCByZXQ7DQorDQor
CWluZGV4ID0gZGF0YS0+Z3Bpby0+Z3Bpb19pZFtvZmZdOw0KKw0KKwltdXRleF9sb2NrKCZkYXRh
LT5sb2NrKTsNCisJcmVnX3ZhbCA9IGRhdGEtPmdwaW8tPnJlZ19kaXJlY3Rpb25baW5kZXggLyBC
QU5LX1NJWkVdDQorCQkJCQl8ICgxdSA8PCAoaW5kZXggJSBCQU5LX1NJWkUpKTsNCisNCisJcmV0
ID0gYW1peDk1NXhfd3JpdGVfc2luZ2xlKGRhdGEsIGRhdGEtPmdwaW8tPnJlZ3MtPmRpcmVjdGlv
biwNCisJCQkJICAgIHJlZ192YWwsIGluZGV4KTsNCisJaWYgKHJldCkNCisJCWdvdG8gZXhpdDsN
CisNCisJZGF0YS0+Z3Bpby0+cmVnX2RpcmVjdGlvbltpbmRleCAvIEJBTktfU0laRV0gPSByZWdf
dmFsOw0KK2V4aXQ6DQorCW11dGV4X3VubG9jaygmZGF0YS0+bG9jayk7DQorCXJldHVybiByZXQ7
DQorfQ0KKw0KK3N0YXRpYyBpbnQgYW1peDk1NXhfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0KHN0cnVj
dCBncGlvX2NoaXAgKmdjLA0KKwkJCQkJICB1bnNpZ25lZCBpbnQgb2ZmLCBpbnQgdmFsKQ0KK3sN
CisJc3RydWN0IGRyaXZlcl9kYXRhICpkYXRhID0gZ3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KKwl1
OCByZWdfdmFsOw0KKwl1bnNpZ25lZCBpbnQgaW5kZXg7DQorCWludCByZXQ7DQorDQorCWluZGV4
ID0gZGF0YS0+Z3Bpby0+Z3Bpb19pZFtvZmZdOw0KKw0KKwltdXRleF9sb2NrKCZkYXRhLT5sb2Nr
KTsNCisJaWYgKHZhbCkgew0KKwkJcmVnX3ZhbCA9IGRhdGEtPmdwaW8tPnJlZ19vdXRwdXRbaW5k
ZXggLyBCQU5LX1NJWkVdDQorCQkJfCAoMXUgPDwgKGluZGV4ICYgQkFOS19TSVpFKSk7DQorCX0g
ZWxzZSB7DQorCQlyZWdfdmFsID0gZGF0YS0+Z3Bpby0+cmVnX291dHB1dFtpbmRleCAvIEJBTktf
U0laRV0NCisJCQkmIH4oMXUgPDwgKGluZGV4ICUgQkFOS19TSVpFKSk7DQorCX0NCisNCisJcmV0
ID0gYW1peDk1NXhfd3JpdGVfc2luZ2xlKGRhdGEsIGRhdGEtPmdwaW8tPnJlZ3MtPm91dHB1dCwN
CisJCQkJICAgIHJlZ192YWwsIGluZGV4KTsNCisJaWYgKHJldCkNCisJCWdvdG8gZXhpdDsNCisN
CisJZGF0YS0+Z3Bpby0+cmVnX291dHB1dFtpbmRleCAvIEJBTktfU0laRV0gPSByZWdfdmFsOw0K
Kw0KKwlyZWdfdmFsID0gZGF0YS0+Z3Bpby0+cmVnX2RpcmVjdGlvbltpbmRleCAvIEJBTktfU0la
RV0NCisJCQkJCSYgfigxdSA8PCAoaW5kZXggJSBCQU5LX1NJWkUpKTsNCisNCisJcmV0ID0gYW1p
eDk1NXhfd3JpdGVfc2luZ2xlKGRhdGEsIGRhdGEtPmdwaW8tPnJlZ3MtPmRpcmVjdGlvbiwNCisJ
CQkJICAgIHJlZ192YWwsIGluZGV4KTsNCisJaWYgKHJldCkNCisJCWdvdG8gZXhpdDsNCisNCisJ
ZGF0YS0+Z3Bpby0+cmVnX2RpcmVjdGlvbltpbmRleCAvIEJBTktfU0laRV0gPSByZWdfdmFsOw0K
K2V4aXQ6DQorCW11dGV4X3VubG9jaygmZGF0YS0+bG9jayk7DQorCXJldHVybiByZXQ7DQorfQ0K
Kw0KK3N0YXRpYyBpbnQgYW1peDk1NXhfZ3Bpb19nZXRfdmFsdWUoc3RydWN0IGdwaW9fY2hpcCAq
Z2MsIHVuc2lnbmVkIGludCANCitvZmYpIHsNCisJc3RydWN0IGRyaXZlcl9kYXRhICpkYXRhID0g
Z3Bpb2NoaXBfZ2V0X2RhdGEoZ2MpOw0KKwl1MzIgcmVnX3ZhbDsNCisJaW50IHJldDsNCisJdW5z
aWduZWQgaW50IGluZGV4Ow0KKw0KKwlpbmRleCA9IGRhdGEtPmdwaW8tPmdwaW9faWRbb2ZmXTsN
CisNCisJbXV0ZXhfbG9jaygmZGF0YS0+bG9jayk7DQorCXJldCA9IGFtaXg5NTV4X3JlYWRfc2lu
Z2xlKGRhdGEsIGRhdGEtPmdwaW8tPnJlZ3MtPmlucHV0LA0KKwkJCQkgICAmcmVnX3ZhbCwgaW5k
ZXgpOw0KKwltdXRleF91bmxvY2soJmRhdGEtPmxvY2spOw0KKw0KKwlpZiAocmV0IDwgMCkNCisJ
CXJldHVybiAwOw0KKw0KKwlyZXR1cm4gKHJlZ192YWwgJiAoMXUgPDwgKGluZGV4ICUgQkFOS19T
SVpFKSkpID8gMSA6IDA7IH0NCisNCitzdGF0aWMgdm9pZCBhbWl4OTU1eF9ncGlvX3NldF92YWx1
ZShzdHJ1Y3QgZ3Bpb19jaGlwICpnYywgdW5zaWduZWQgaW50IG9mZiwNCisJCQkJICAgIGludCB2
YWwpDQorew0KKwlzdHJ1Y3QgZHJpdmVyX2RhdGEgKmRhdGEgPSBncGlvY2hpcF9nZXRfZGF0YShn
Yyk7DQorCXU4IHJlZ192YWw7DQorCWludCByZXQ7DQorCXVuc2lnbmVkIGludCBpbmRleDsNCisN
CisJaW5kZXggPSBkYXRhLT5ncGlvLT5ncGlvX2lkW29mZl07DQorDQorCW11dGV4X2xvY2soJmRh
dGEtPmxvY2spOw0KKwlpZiAodmFsKQ0KKwkJcmVnX3ZhbCA9IGRhdGEtPmdwaW8tPnJlZ19vdXRw
dXRbaW5kZXggLyBCQU5LX1NJWkVdDQorCQkJCQkJfCAoMXUgPDwgKGluZGV4ICUgQkFOS19TSVpF
KSk7DQorCWVsc2UNCisJCXJlZ192YWwgPSBkYXRhLT5ncGlvLT5yZWdfb3V0cHV0W2luZGV4IC8g
QkFOS19TSVpFXQ0KKwkJCQkJCSYgfigxdSA8PCAoaW5kZXggJSBCQU5LX1NJWkUpKTsNCisNCisJ
cmV0ID0gYW1peDk1NXhfd3JpdGVfc2luZ2xlKGRhdGEsIGRhdGEtPmdwaW8tPnJlZ3MtPm91dHB1
dCwNCisJCQkJICAgIHJlZ192YWwsIGluZGV4KTsNCisJaWYgKHJldCkNCisJCWdvdG8gZXhpdDsN
CisNCisJZGF0YS0+Z3Bpby0+cmVnX291dHB1dFtpbmRleCAvIEJBTktfU0laRV0gPSByZWdfdmFs
Ow0KKw0KK2V4aXQ6DQorCW11dGV4X3VubG9jaygmZGF0YS0+bG9jayk7DQorfQ0KKw0KK3N0YXRp
YyBpbnQgYW1peDk1NXhfZ3Bpb19nZXRfZGlyZWN0aW9uKHN0cnVjdCBncGlvX2NoaXAgKmdjLCB1
bnNpZ25lZCANCitpbnQgb2ZmKSB7DQorCXN0cnVjdCBkcml2ZXJfZGF0YSAqZGF0YSA9IGdwaW9j
aGlwX2dldF9kYXRhKGdjKTsNCisJdTMyIHJlZ192YWw7DQorCWludCByZXQ7DQorCXVuc2lnbmVk
IGludCBpbmRleDsNCisNCisJaW5kZXggPSBkYXRhLT5ncGlvLT5ncGlvX2lkW29mZl07DQorDQor
CW11dGV4X2xvY2soJmRhdGEtPmxvY2spOw0KKwlyZXQgPSBhbWl4OTU1eF9yZWFkX3NpbmdsZShk
YXRhLCBkYXRhLT5ncGlvLT5yZWdzLT5kaXJlY3Rpb24sDQorCQkJCSAgICZyZWdfdmFsLCBpbmRl
eCk7DQorCW11dGV4X3VubG9jaygmZGF0YS0+bG9jayk7DQorCWlmIChyZXQgPCAwKQ0KKwkJcmV0
dXJuIHJldDsNCisNCisJcmV0dXJuICEhKHJlZ192YWwgJiAoMXUgPDwgKGluZGV4ICUgQkFOS19T
SVpFKSkpOyB9DQorDQorc3RhdGljIHZvaWQgYW1peDk1NXhfc2V0dXBfZ3BpbyhzdHJ1Y3QgYW1p
eDk1NXhfcGxhdGZvcm1fZGF0YSAqcGRhdGEsDQorCQkJCXN0cnVjdCBkcml2ZXJfZGF0YSAqZGF0
YSkNCit7DQorCXN0cnVjdCBncGlvX2NoaXAgKmdjOw0KKw0KKwlnYyA9ICZwZGF0YS0+Z3Bpby0+
Z3Bpb19jaGlwOw0KKw0KKwlnYy0+ZGlyZWN0aW9uX2lucHV0ID0gYW1peDk1NXhfZ3Bpb19kaXJl
Y3Rpb25faW5wdXQ7DQorCWdjLT5kaXJlY3Rpb25fb3V0cHV0ID0gYW1peDk1NXhfZ3Bpb19kaXJl
Y3Rpb25fb3V0cHV0Ow0KKwlnYy0+Z2V0ID0gYW1peDk1NXhfZ3Bpb19nZXRfdmFsdWU7DQorCWdj
LT5zZXQgPSBhbWl4OTU1eF9ncGlvX3NldF92YWx1ZTsNCisJZ2MtPmdldF9kaXJlY3Rpb24gPSBh
bWl4OTU1eF9ncGlvX2dldF9kaXJlY3Rpb247DQorCS8vZ2MtPnNldF9jb25maWcNCisJLy9nYy0+
c2V0X211bHRpcGxlDQorCWdjLT5jYW5fc2xlZXAgPSB0cnVlOw0KKw0KKwlnYy0+YmFzZSA9IHBk
YXRhLT5ncGlvX3N0YXJ0Ow0KKwlnYy0+bmdwaW8gPSBwZGF0YS0+bnVtX2dwaW87DQorDQorCWdj
LT5sYWJlbCA9IGRldl9uYW1lKCZkYXRhLT5jbGllbnQtPmRldik7DQorCWdjLT5wYXJlbnQgPSAm
ZGF0YS0+Y2xpZW50LT5kZXY7DQorDQorCWdjLT5vd25lciA9IFRISVNfTU9EVUxFOw0KK30NCisN
CitzdGF0aWMgc3RydWN0IGFtaXg5NTV4X3BsYXRmb3JtX2RhdGEgKg0KK2FtaXg5NTV4X2dldF9w
ZGF0YShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LCBzdHJ1Y3QgY2hpcF9pbmZvX3QgKmNoaXAp
IA0KK3sNCisJc3RydWN0IGFtaXg5NTV4X3BsYXRmb3JtX2RhdGEgKnBkYXRhOw0KKwlzdHJ1Y3Qg
Zndub2RlX2hhbmRsZSAqY2hpbGQ7DQorCXUzMiBiaXRtYXNrID0gMDsNCisJaW50IHBpbl9pZCA9
IDA7DQorCWludCBjb3VudCA9IDA7DQorCWludCBpbmRleCA9IDA7DQorDQorCWNvdW50ID0gZGV2
aWNlX2dldF9jaGlsZF9ub2RlX2NvdW50KCZjbGllbnQtPmRldik7DQorCWlmIChjb3VudCA+IGNo
aXAtPmJpdHMpDQorCQlyZXR1cm4gRVJSX1BUUigtRU5PREVWKTsNCisNCisJcGRhdGEgPSBkZXZt
X2t6YWxsb2MoJmNsaWVudC0+ZGV2LCBzaXplb2YoKnBkYXRhKSwgR0ZQX0tFUk5FTCk7DQorCWlm
ICghcGRhdGEpDQorCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsNCisNCisJcGRhdGEtPm51bV9s
ZWRzID0gMDsNCisJLy9CSU9TIGRlY2xhcmVzIHRoYXQgdGhlIExFRCBpbmZvcm1hdGlvbiBpcyBp
biB0aGUgQUNQSSB0YWJsZQ0KKwlpZiAoY291bnQgPiAwKSB7DQorCQlwZGF0YS0+bGVkcyA9IGRl
dm1fa2NhbGxvYygmY2xpZW50LT5kZXYsIGNvdW50LA0KKwkJCQkJICAgc2l6ZW9mKHN0cnVjdCBh
bWl4OTU1eF9sZWQpLA0KKwkJCQkJICAgR0ZQX0tFUk5FTCk7DQorCQlpZiAoIXBkYXRhLT5sZWRz
KQ0KKwkJCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOw0KKw0KKwkJZGV2aWNlX2Zvcl9lYWNoX2No
aWxkX25vZGUoJmNsaWVudC0+ZGV2LCBjaGlsZCkgew0KKwkJCWNvbnN0IGNoYXIgKm5hbWU7DQor
CQkJdTMyIHJlZzsNCisJCQlpbnQgcmVzOw0KKw0KKwkJCXJlcyA9IGZ3bm9kZV9wcm9wZXJ0eV9y
ZWFkX3UzMihjaGlsZCwgInJlZyIsICZyZWcpOw0KKwkJCWlmIChyZXMgIT0gMCB8fCByZWcgPj0g
Y2hpcC0+Yml0cykNCisJCQkJY29udGludWU7DQorDQorCQkJcGRhdGEtPmxlZHNbaW5kZXhdLmxl
ZF9pZCA9IHJlZzsNCisJCQliaXRtYXNrIHw9IDEgPDwgcmVnOw0KKw0KKwkJCXJlcyA9IGZ3bm9k
ZV9wcm9wZXJ0eV9yZWFkX3N0cmluZyhjaGlsZCwgImxhYmVsIiwNCisJCQkJCQkJICAmbmFtZSk7
DQorCQkJaWYgKHJlcyAhPSAwICYmIGlzX29mX25vZGUoY2hpbGQpKQ0KKwkJCQluYW1lID0gdG9f
b2Zfbm9kZShjaGlsZCktPm5hbWU7DQorDQorCQkJc25wcmludGYocGRhdGEtPmxlZHNbaW5kZXhd
Lm5hbWUsDQorCQkJCSBzaXplb2YocGRhdGEtPmxlZHNbaW5kZXhdLm5hbWUpLCAiJXMiLCBuYW1l
KTsNCisNCisJCQlpbmRleCsrOw0KKwkJfQ0KKw0KKwkJcGRhdGEtPm51bV9sZWRzID0gY291bnQ7
DQorCX0NCisNCisJLy9ObyBwaW4gbmVlZHMgdG8gYmUgaW5pdGlhbGl6ZWQgdG8gZ3Bpbw0KKwlp
ZiAoY291bnQgPT0gY2hpcC0+Yml0cykNCisJCXJldHVybiBwZGF0YTsNCisNCisJcGRhdGEtPmdw
aW8gPSBkZXZtX2t6YWxsb2MoJmNsaWVudC0+ZGV2LCBzaXplb2Yoc3RydWN0IGFtaXg5NTV4X2dw
aW8pLA0KKwkJCQkgICBHRlBfS0VSTkVMKTsNCisJaWYgKCFwZGF0YS0+Z3BpbykNCisJCXJldHVy
biBFUlJfUFRSKC1FTk9NRU0pOw0KKw0KKwlmb3IgKHBpbl9pZCA9IDAsIGluZGV4ID0gMDsgcGlu
X2lkIDwgY2hpcC0+Yml0czsgcGluX2lkKyspIHsNCisJCS8vdGhpcyBwaW4gaXMgdXNlZCBiZSBs
ZWQNCisJCWlmICgoYml0bWFzayA+PiBwaW5faWQpICYgMHgwMSkNCisJCQljb250aW51ZTsNCisN
CisJCXBkYXRhLT5ncGlvLT5ncGlvX2lkW2luZGV4XSA9IHBpbl9pZDsNCisJCWluZGV4Kys7DQor
CX0NCisNCisJcGRhdGEtPm51bV9ncGlvID0gaW5kZXg7DQorDQorCS8qDQorCSAqIFBsZWFzZSBw
YXNzIC0xIGFzIGJhc2UgdG8gbGV0IGdwaW9saWIgc2VsZWN0IHRoZSBjaGlwIGJhc2UNCisJICog
aW4gYWxsIHBvc3NpYmxlIGNhc2VzDQorCSAqLw0KKwlwZGF0YS0+Z3Bpb19zdGFydCA9IC0xOw0K
Kw0KKwlyZXR1cm4gcGRhdGE7DQorfQ0KKw0KK3N0YXRpYyB2b2lkDQorYW1peDk1NXhfc2V0X2Rp
cmVjdGlvbl9hc19vdXRwdXQoc3RydWN0IGFtaXg5NTV4X3BsYXRmb3JtX2RhdGEgKnBkYXRhKSAN
Cit7DQorCXU4IGk7DQorCXUxNiB2YWwgPSBBTUlYOTU1WF9ESVJFQ1RJT05fREVGQVVMVDsNCisJ
c3RydWN0IGRyaXZlcl9kYXRhICpkYXRhID0gcGRhdGEtPmRhdGE7DQorCXN0cnVjdCBpMmNfY2xp
ZW50ICpjbGllbnQgPSBkYXRhLT5jbGllbnQ7DQorDQorCWZvciAoaSA9IDA7IGkgPCBwZGF0YS0+
bnVtX2xlZHM7IGkrKykNCisJCXZhbCAmPSB+KDEgPDwgcGRhdGEtPmxlZHNbaV0ubGVkX2lkKTsN
CisNCisJZGF0YS0+d3JpdGVfcmVncyhjbGllbnQsIEFNSVg5NTVYX0RJUkVDVElPTiwgKHU4ICop
JnZhbCk7IH0NCisNCitzdGF0aWMgdm9pZCBhbWl4OTU1eF9pbml0X291dHB1dF9yZWcoc3RydWN0
IGRyaXZlcl9kYXRhICpkYXRhKSB7DQorCXU4IHZhbFtNQVhfQkFOS10gPSB7QU1JWDk1NVhfT1VU
UFVUX0RFRkFVTFR9Ow0KKwlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gZGF0YS0+Y2xpZW50
Ow0KKw0KKwlkYXRhLT53cml0ZV9yZWdzKGNsaWVudCwgQU1JWDk1NVhfT1VUUFVULCB2YWwpOyB9
DQorDQorc3RhdGljIGludCBkZXZpY2VfYW1peDk1NXhfaW5pdChzdHJ1Y3QgYW1peDk1NXhfcGxh
dGZvcm1fZGF0YSAqcGRhdGEpIHsNCisJaW50IHJldDsNCisJdTggdmFsW01BWF9CQU5LXSA9IHsw
fTsNCisNCisJcGRhdGEtPmdwaW8tPnJlZ3MgPSAmYW1peDk1NXhfcmVnczsNCisNCisJcmV0ID0g
YW1peDk1NXhfcmVhZF9yZWdzKHBkYXRhLT5kYXRhLCBwZGF0YS0+Z3Bpby0+cmVncy0+b3V0cHV0
LA0KKwkJCQkgcGRhdGEtPmdwaW8tPnJlZ19vdXRwdXQpOw0KKwlpZiAocmV0KQ0KKwkJZ290byBv
dXQ7DQorDQorCXJldCA9IGFtaXg5NTV4X3JlYWRfcmVncyhwZGF0YS0+ZGF0YSwgcGRhdGEtPmdw
aW8tPnJlZ3MtPmRpcmVjdGlvbiwNCisJCQkJIHBkYXRhLT5ncGlvLT5yZWdfZGlyZWN0aW9uKTsN
CisJaWYgKHJldCkNCisJCWdvdG8gb3V0Ow0KKw0KKwkvL25vdCBzZXQgaW52ZXJ0DQorCXJldCA9
IGFtaXg5NTV4X3dyaXRlX3JlZ3MocGRhdGEtPmRhdGEsIEFNSVg5NTVYX0lOVkVSVCwgdmFsKTsN
CitvdXQ6DQorCXJldHVybiByZXQ7DQorfQ0KKw0KK3N0YXRpYyBpbnQgYW1peDk1NXhfcHJvYmUo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwNCisJCQkgIGNvbnN0IHN0cnVjdCBpMmNfZGV2aWNl
X2lkICppZCkNCit7DQorCXN0cnVjdCBkcml2ZXJfZGF0YSAqZGF0YTsNCisJc3RydWN0IGNoaXBf
aW5mb190ICpjaGlwOw0KKwlpbnQgcmV0Ow0KKwlpbnQgaSwgZXJyOw0KKwlzdHJ1Y3QgYW1peDk1
NXhfcGxhdGZvcm1fZGF0YSAqcGRhdGE7DQorDQorCWludCBkZXZpY2VfaWQgPSAwOw0KKw0KKwlk
ZXZpY2VfaWQgPSBnZXRfZGV2aWNlX2luZGV4KGNsaWVudCwgaWQpOw0KKwlpZiAoZGV2aWNlX2lk
IDwgMCB8fCBkZXZpY2VfaWQgPj0gQVJSQVlfU0laRShjaGlwX2luZm9fdGFibGVzKSkNCisJCXJl
dHVybiAtRU5PREVWOw0KKw0KKwljaGlwID0gJmNoaXBfaW5mb190YWJsZXNbZGV2aWNlX2lkXTsN
CisNCisJcGRhdGEgPSBhbWl4OTU1eF9nZXRfcGRhdGEoY2xpZW50LCBjaGlwKTsNCisJaWYgKElT
X0VSUihwZGF0YSkpDQorCQlyZXR1cm4gUFRSX0VSUihwZGF0YSk7DQorDQorCS8qIE1ha2Ugc3Vy
ZSB0aGUgc2xhdmUgYWRkcmVzcyBnaXZlbiBpcyBwb3NzaWJsZSAqLw0KKwlpZiAoKGNsaWVudC0+
YWRkciAmIH4oKDEgPDwgY2hpcC0+c2x2X2FkZHJfc2hpZnQpIC0gMSkpICE9DQorCSAgICBjaGlw
LT5zbHZfYWRkcikgew0KKwkJZGV2X2VycigmY2xpZW50LT5kZXYsICJpbnZhbGlkIHNsYXZlIGFk
ZHJlc3MgJTAyeFxuIiwNCisJCQljbGllbnQtPmFkZHIpOw0KKwkJcmV0dXJuIC1FTk9ERVY7DQor
CX0NCisNCisJZGV2X2luZm8oJmNsaWVudC0+ZGV2LA0KKwkJICIlczogVXNpbmcgJXMgJWQtYml0
IExFRCBkcml2ZXIgYXQgc2xhdmUgYWRkcmVzcyAweCUwMnhcbiIsDQorCQkgY2xpZW50LT5kZXYu
ZHJpdmVyLT5uYW1lLCBjbGllbnQtPm5hbWUsIGNoaXAtPmJpdHMsDQorCQkgY2xpZW50LT5hZGRy
KTsNCisNCisJaWYgKCFpMmNfY2hlY2tfZnVuY3Rpb25hbGl0eShjbGllbnQtPmFkYXB0ZXIsIEky
Q19GVU5DX1NNQlVTX0JZVEVfREFUQSkpDQorCQlyZXR1cm4gLUVJTzsNCisNCisJLy9Jbml0aWFs
IGRyaXZlciBkYXRhDQorCWRhdGEgPSBkZXZtX2t6YWxsb2MoJmNsaWVudC0+ZGV2LCBzaXplb2Yo
c3RydWN0IGRyaXZlcl9kYXRhKSwNCisJCQkgICAgR0ZQX0tFUk5FTCk7DQorCWlmICghZGF0YSkN
CisJCXJldHVybiAtRU5PTUVNOw0KKw0KKwltdXRleF9pbml0KCZkYXRhLT5sb2NrKTsNCisNCisJ
ZGF0YS0+bGVkcyA9IHBkYXRhLT5sZWRzOw0KKwlkYXRhLT5ncGlvID0gcGRhdGEtPmdwaW87DQor
CWRhdGEtPmNsaWVudCA9IGNsaWVudDsNCisJZGF0YS0+Y2hpcF9pbmZvID0gY2hpcDsNCisNCisJ
c3dpdGNoIChjaGlwLT5iaXRzKSB7DQorCWNhc2UgODoNCisJCWRhdGEtPnJlYWRfcmVncyA9IGFt
aXg5NTV4X3JlYWRfcmVnc184Ow0KKwkJZGF0YS0+d3JpdGVfcmVncyA9IGFtaXg5NTV4X3dyaXRl
X3JlZ3NfODsNCisJCWJyZWFrOw0KKwljYXNlIDE2Og0KKwkJZGF0YS0+cmVhZF9yZWdzID0gYW1p
eDk1NXhfcmVhZF9yZWdzXzE2Ow0KKwkJZGF0YS0+d3JpdGVfcmVncyA9IGFtaXg5NTV4X3dyaXRl
X3JlZ3NfMTY7DQorCQlicmVhazsNCisJZGVmYXVsdDoNCisJCXJldHVybiAtRUlOVkFMOw0KKwl9
DQorDQorCXBkYXRhLT5kYXRhID0gZGF0YTsNCisNCisJaTJjX3NldF9jbGllbnRkYXRhKGNsaWVu
dCwgZGF0YSk7DQorDQorCS8qIFNldCBHUElPIGRpcmVjdGlvbiBhcyBvdXRwdXQgKi8NCisJYW1p
eDk1NXhfc2V0X2RpcmVjdGlvbl9hc19vdXRwdXQocGRhdGEpOw0KKw0KKwkvKiBUdXJuIG9mZiBh
bGwgTEVEcyAqLw0KKwlhbWl4OTU1eF9pbml0X291dHB1dF9yZWcoZGF0YSk7DQorDQorCWZvciAo
aSA9IDA7IGkgPCBwZGF0YS0+bnVtX2xlZHM7IGkrKykgew0KKwkJc3RydWN0IGFtaXg5NTV4X2xl
ZCAqbGVkOw0KKwkJc3RydWN0IGxlZF9jbGFzc2RldiAqbGVkX2NkZXY7DQorDQorCQlsZWQgPSAm
ZGF0YS0+bGVkc1tpXTsNCisJCWxlZF9jZGV2ID0gJmxlZC0+bGVkX2NkZXY7DQorDQorCQlsZWQt
PmRhdGEgPSBkYXRhOw0KKw0KKwkJbGVkX2NkZXYtPm5hbWUgPSBsZWQtPm5hbWU7DQorCQlsZWRf
Y2Rldi0+YnJpZ2h0bmVzc19zZXRfYmxvY2tpbmcgPSBhbWl4OTU1eF9sZWRfc2V0Ow0KKw0KKwkJ
aWYgKHBkYXRhLT5sZWRzW2ldLmRlZmF1bHRfdHJpZ2dlcikgew0KKwkJCWxlZF9jZGV2LT5kZWZh
dWx0X3RyaWdnZXIgPQ0KKwkJCQlwZGF0YS0+bGVkc1tpXS5kZWZhdWx0X3RyaWdnZXI7DQorCQl9
DQorDQorCQllcnIgPSBkZXZtX2xlZF9jbGFzc2Rldl9yZWdpc3RlcigmY2xpZW50LT5kZXYsIGxl
ZF9jZGV2KTsNCisJCWlmIChlcnIpDQorCQkJcmV0dXJuIGVycjsNCisNCisJCWFtaXg5NTV4X2xl
ZF9zZXQobGVkX2NkZXYsIExFRF9PRkYpOw0KKwl9DQorDQorCWFtaXg5NTV4X3NldHVwX2dwaW8o
cGRhdGEsIGRhdGEpOw0KKw0KKwlyZXQgPSBkZXZpY2VfYW1peDk1NXhfaW5pdChwZGF0YSk7DQor
CWlmIChyZXQgPCAwKQ0KKwkJcmV0dXJuIHJldDsNCisNCisJcmV0ID0gZGV2bV9ncGlvY2hpcF9h
ZGRfZGF0YSgmY2xpZW50LT5kZXYsICZkYXRhLT5ncGlvLT5ncGlvX2NoaXAsDQorCQkJCSAgICAg
ZGF0YSk7DQorCWlmIChyZXQgPCAwKQ0KKwkJcmV0dXJuIHJldDsNCisNCisJcmV0dXJuIDA7DQor
fQ0KKw0KK3N0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZlciBhbWl4OTU1eF9kcml2ZXIgPSB7DQorCS5k
cml2ZXIgPSB7DQorCQkubmFtZSA9ICJhbWl4OTU1eCIsDQorCQkuYWNwaV9tYXRjaF90YWJsZSA9
IEFDUElfUFRSKGFjcGlfYW1peDk1NXhfbWF0Y2gpLA0KKwl9LA0KKwkucHJvYmUgPSBhbWl4OTU1
eF9wcm9iZSwNCit9Ow0KKw0KK21vZHVsZV9pMmNfZHJpdmVyKGFtaXg5NTV4X2RyaXZlcik7DQor
DQorTU9EVUxFX0FVVEhPUigiSmlhIFN1aSA8amlhLnN1aUBhZHZhbnRlY2guY29tLmNuPiIpOyAN
CitNT0RVTEVfREVTQ1JJUFRJT04oIkFNSVg5NTVYIExFRCBhbmQgR1BJTyBkcml2ZXIiKTsgTU9E
VUxFX0xJQ0VOU0UoIkdQTCANCit2MiIpOyBNT0RVTEVfVkVSU0lPTihWRVJTSU9OKTsNCi0tDQoy
LjE4LjINCg0K
