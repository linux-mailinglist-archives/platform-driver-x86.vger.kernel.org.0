Return-Path: <platform-driver-x86+bounces-1801-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D33870096
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Mar 2024 12:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B1D1C20B18
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Mar 2024 11:43:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E45E3A1C6;
	Mon,  4 Mar 2024 11:43:46 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-out.aladdin-rd.ru (mail-out.aladdin-rd.ru [91.199.251.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ADA3838B;
	Mon,  4 Mar 2024 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.199.251.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709552626; cv=none; b=jofjJcASFD5wkvkD5dFVTa1k634WAb5X5iHQ5IlTSsj4WWofVJ9CsGZHgw+kMLzCmaa3YDCJGHBf1DKrhKLdiexyx5egjWIb7lzoiipPKu48OZ5fp1jhpT7JbACJmIOTAo57ufow8esJmvif2jBzLZA86aInssgc3/onsV0ZbPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709552626; c=relaxed/simple;
	bh=h/N89wHsupO3eOr5saosVZAEbXKftzVyWze4j0uXvhg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eUzkq1zpO6u5ivbLg6cLjxBjU7rPIo9x62bYXReDBCigaFZyYeQZR3cuJ4nudHhdgTzOvGkdJRkunR2o84SLfl4qBbNHYA4USD9mZ74jSFNQ3i2UjcOFr3JYsgKZ988eji9F7uxvEuUTmyC2UJZz4CCmOzgPWutq1DOw9JBsfvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru; spf=pass smtp.mailfrom=aladdin.ru; arc=none smtp.client-ip=91.199.251.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aladdin.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aladdin.ru
From: Daniil Dulov <D.Dulov@aladdin.ru>
To: Vadim Pasternak <vadimp@nvidia.com>, Hans de Goede <hdegoede@redhat.com>
CC: Mark Gross <mgross@linux.intel.com>, Andy Shevchenko <andy@infradead.org>,
	Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "lvc-project@linuxtesting.org"
	<lvc-project@linuxtesting.org>
Subject: RE: [PATCH] platform/mellanox: mlxreg-hotplug: Check pointer for NULL
 before dereferencing it
Thread-Topic: [PATCH] platform/mellanox: mlxreg-hotplug: Check pointer for
 NULL before dereferencing it
Thread-Index: AQHaaMPFv4wPmJNqB0Oh/Aq5IIhcv7EciV8AgAS1laA=
Date: Mon, 4 Mar 2024 11:43:38 +0000
Message-ID: <e34edced65e747c5870ee439e3c84457@aladdin.ru>
References: <20240226145442.3468-1-d.dulov@aladdin.ru>
 <BN9PR12MB538106C733D231B73FC1C1AAAF5A2@BN9PR12MB5381.namprd12.prod.outlook.com>
In-Reply-To: <BN9PR12MB538106C733D231B73FC1C1AAAF5A2@BN9PR12MB5381.namprd12.prod.outlook.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

SGVsbG8hDQoNCkkgc3VwcG9zZSB0aGVyZSBpcyBubyBzZW5zZSB0byBwcm9kdWNlIGRldl9lcnIo
KSBpbnNpZGUNCm1seHJlZ19ob3RwbHVnX3dvcmtfaGVscGVyKCkgc2luY2UgaXRlbSBpcyBkZXJl
ZmVyZW5jZWQgdHdpY2UNCmJlZm9yZSB3ZSBjYWxsIHRoaXMgZnVuY3Rpb24uIFNob3VsZCB3ZSBw
cm9kdWNlIGRldl9lcnIoKQ0KaW5zaWRlIHRoZSBsb29wIGluIG1seHJlZ19ob3RwbHVnX3dvcmtf
aGFuZGxlcigpIGluc3RlYWQ/DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBW
YWRpbSBQYXN0ZXJuYWsgW21haWx0bzp2YWRpbXBAbnZpZGlhLmNvbV0gDQpTZW50OiBNb25kYXks
IEZlYnJ1YXJ5IDI2LCAyMDI0IDY6MTUgUE0NClRvOiBEYW5paWwgRHVsb3YgPEQuRHVsb3ZAYWxh
ZGRpbi5ydT47IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+DQpDYzogTWFyayBH
cm9zcyA8bWdyb3NzQGxpbnV4LmludGVsLmNvbT47IEFuZHkgU2hldmNoZW5rbyA8YW5keUBpbmZy
YWRlYWQub3JnPjsgRGFycmVuIEhhcnQgPGR2aGFydEBpbmZyYWRlYWQub3JnPjsgcGxhdGZvcm0t
ZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGx2Yy1wcm9qZWN0QGxpbnV4dGVzdGluZy5vcmcNClN1YmplY3Q6IFJFOiBbUEFUQ0hdIHBsYXRm
b3JtL21lbGxhbm94OiBtbHhyZWctaG90cGx1ZzogQ2hlY2sgcG9pbnRlciBmb3IgTlVMTCBiZWZv
cmUgZGVyZWZlcmVuY2luZyBpdA0KDQoNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
PiBGcm9tOiBEYW5paWwgRHVsb3YgPGQuZHVsb3ZAYWxhZGRpbi5ydT4NCj4gU2VudDogTW9uZGF5
LCAyNiBGZWJydWFyeSAyMDI0IDE2OjU1DQo+IFRvOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUBy
ZWRoYXQuY29tPg0KPiBDYzogRGFuaWlsIER1bG92IDxkLmR1bG92QGFsYWRkaW4ucnU+OyBNYXJr
IEdyb3NzDQo+IDxtZ3Jvc3NAbGludXguaW50ZWwuY29tPjsgQW5keSBTaGV2Y2hlbmtvIDxhbmR5
QGluZnJhZGVhZC5vcmc+OyBEYXJyZW4NCj4gSGFydCA8ZHZoYXJ0QGluZnJhZGVhZC5vcmc+OyBW
YWRpbSBQYXN0ZXJuYWsgPHZhZGltcEBudmlkaWEuY29tPjsNCj4gcGxhdGZvcm0tZHJpdmVyLXg4
NkB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGx2Yy0NCj4g
cHJvamVjdEBsaW51eHRlc3Rpbmcub3JnDQo+IFN1YmplY3Q6IFtQQVRDSF0gcGxhdGZvcm0vbWVs
bGFub3g6IG1seHJlZy1ob3RwbHVnOiBDaGVjayBwb2ludGVyIGZvciBOVUxMDQo+IGJlZm9yZSBk
ZXJlZmVyZW5jaW5nIGl0DQo+IA0KPiBtbHhyZWdfaG90cGx1Z193b3JrX2hlbHBlcigpIGltcGxp
ZXMgdGhhdCBpdGVtIGNhbiBiZSBOVUxMLiBUaGVyZSBpcyBhDQo+IHNhbml0eSBjaGVjayB0aGF0
IGNoZWNrcyBpdGVtIGZvciBOVUxMIGFuZCB0aGVuIGRlcmVmZXJlbmNlcyBpdC4NCj4gDQo+IEV2
ZW4gdGhvdWdoLCB0aGUgY29tbWVudCBiZWZvcmUgc2FuaXR5IGNoZWNrIHNheXMgdGhhdCBpdCBj
YW4gb25seSBoYXBwZW4gaWYNCj4gc29tZSBwaWVjZSBvZiBoYXJkd2FyZSBpcyBicm9rZW4sIGJ1
dCBpbiB0aGlzIGNhc2UgaXQgd2lsbCBsZWFkIHRvIE5VTEwtcG9pbnRlcg0KPiBkZXJlZmVyZW5j
ZSBiZWZvcmUgdGhlIGZ1bmN0aW9uIGlzIGV2ZW4gY2FsbGVkLCBzbyBsZXQncyBjaGVjayBpdCBi
ZWZvcmUNCj4gZGVyZWZlcmVuY2luZy4NCj4gDQo+IEZvdW5kIGJ5IExpbnV4IFZlcmlmaWNhdGlv
biBDZW50ZXIgKGxpbnV4dGVzdGluZy5vcmcpIHdpdGggU1ZBQ0UuDQo+IA0KPiBGaXhlczogYzZh
Y2FkNjhlYjJkICgicGxhdGZvcm0vbWVsbGFub3g6IG1seHJlZy1ob3RwbHVnOiBNb2RpZnkgdG8g
dXNlIGENCj4gcmVnbWFwIGludGVyZmFjZSIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbmlpbCBEdWxv
diA8ZC5kdWxvdkBhbGFkZGluLnJ1Pg0KPiAtLS0NCj4gIGRyaXZlcnMvcGxhdGZvcm0vbWVsbGFu
b3gvbWx4cmVnLWhvdHBsdWcuYyB8IDE2ICstLS0tLS0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMTUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+IGIvZHJpdmVycy9w
bGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+IGluZGV4IDVjMDIyYjI1OGY5MS4u
NTI0MTIxYjlmMDcwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL21lbGxhbm94L21s
eHJlZy1ob3RwbHVnLmMNCj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWct
aG90cGx1Zy5jDQo+IEBAIC0zNDgsMjAgKzM0OCw2IEBAIG1seHJlZ19ob3RwbHVnX3dvcmtfaGVs
cGVyKHN0cnVjdA0KPiBtbHhyZWdfaG90cGx1Z19wcml2X2RhdGEgKnByaXYsDQo+ICAJdTMyIHJl
Z3ZhbCwgYml0Ow0KPiAgCWludCByZXQ7DQo+IA0KPiAtCS8qDQo+IC0JICogVmFsaWRhdGUgaWYg
aXRlbSByZWxhdGVkIHRvIHJlY2VpdmVkIHNpZ25hbCB0eXBlIGlzIHZhbGlkLg0KPiAtCSAqIEl0
IHNob3VsZCBuZXZlciBoYXBwZW4sIGV4Y2VwdGVkIHRoZSBzaXR1YXRpb24gd2hlbiBzb21lDQo+
IC0JICogcGllY2Ugb2YgaGFyZHdhcmUgaXMgYnJva2VuLiBJbiBzdWNoIHNpdHVhdGlvbiBqdXN0
IHByb2R1Y2UNCj4gLQkgKiBlcnJvciBtZXNzYWdlIGFuZCByZXR1cm4uIENhbGxlciBtdXN0IGNv
bnRpbnVlIHRvIGhhbmRsZSB0aGUNCj4gLQkgKiBzaWduYWxzIGZyb20gb3RoZXIgZGV2aWNlcyBp
ZiBhbnkuDQo+IC0JICovDQo+IC0JaWYgKHVubGlrZWx5KCFpdGVtKSkgew0KPiAtCQlkZXZfZXJy
KHByaXYtPmRldiwgIkZhbHNlIHNpZ25hbDogYXQgb2Zmc2V0Om1hc2sNCj4gMHglMDJ4OjB4JTAy
eC5cbiIsDQo+IC0JCQlpdGVtLT5yZWcsIGl0ZW0tPm1hc2spOw0KPiAtDQo+IC0JCXJldHVybjsN
Cj4gLQl9DQoNCkl0IHdvdWxkIGJlIGVub3VnaCBqdXN0IHRvIHByb2R1Y2UgZGV2X2Vycihwcml2
LT5kZXYsICJGYWxzZSBzaWduYWxcbiIpOw0KQW5kIHJldHVybi4NCg0KPiAtDQo+ICAJLyogTWFz
ayBldmVudC4gKi8NCj4gIAlyZXQgPSByZWdtYXBfd3JpdGUocHJpdi0+cmVnbWFwLCBpdGVtLT5y
ZWcgKw0KPiBNTFhSRUdfSE9UUExVR19NQVNLX09GRiwNCj4gIAkJCSAgIDApOw0KPiBAQCAtNTU2
LDcgKzU0Miw3IEBAIHN0YXRpYyB2b2lkIG1seHJlZ19ob3RwbHVnX3dvcmtfaGFuZGxlcihzdHJ1
Y3QNCj4gd29ya19zdHJ1Y3QgKndvcmspDQo+IA0KPiAgCS8qIEhhbmRsZSB0b3BvbG9neSBhbmQg
aGVhbHRoIGNvbmZpZ3VyYXRpb24gY2hhbmdlcy4gKi8NCj4gIAlmb3IgKGkgPSAwOyBpIDwgcGRh
dGEtPmNvdW50ZXI7IGkrKywgaXRlbSsrKSB7DQo+IC0JCWlmIChhZ2dyX2Fzc2VydGVkICYgaXRl
bS0+YWdncl9tYXNrKSB7DQo+ICsJCWlmIChpdGVtICYmIChhZ2dyX2Fzc2VydGVkICYgaXRlbS0+
YWdncl9tYXNrKSkgew0KPiAgCQkJaWYgKGl0ZW0tPmhlYWx0aCkNCj4gIAkJCQltbHhyZWdfaG90
cGx1Z19oZWFsdGhfd29ya19oZWxwZXIocHJpdiwNCj4gaXRlbSk7DQo+ICAJCQllbHNlDQo+IC0t
DQo+IDIuMjUuMQ0KDQo=

