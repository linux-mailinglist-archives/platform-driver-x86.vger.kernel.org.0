Return-Path: <platform-driver-x86+bounces-12898-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CACAE3191
	for <lists+platform-driver-x86@lfdr.de>; Sun, 22 Jun 2025 20:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2B89188F9C6
	for <lists+platform-driver-x86@lfdr.de>; Sun, 22 Jun 2025 18:58:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DC641898E9;
	Sun, 22 Jun 2025 18:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="XInck6gh"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A299E555;
	Sun, 22 Jun 2025 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750618711; cv=none; b=bTt3rZTBk8T7QOE1+WGOXYrSYZCuEWSCxTw7DxU3naWkWnfS0ryU41JUlrdzG8XBNvWgX7O0Uezy8zMv6yXkesMzaTwoGZ6qo7Scj6PIaEhLkra2qNWKy2fu5ufPZqsKOc25ID29C7RgSsqyEtKKnSlQUCHp3L9MG+dWdnv/l1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750618711; c=relaxed/simple;
	bh=ZzQJ3M8EqiWxxmmNLvTPgJfzj3h9+EYdmRkBn+wuBIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kA40G5Ztovoje0+0yrOjvePcELuj8Vuwx+WFmLQxIoOmPk3/u6zgxJ8whljPErHm1vv00DWAvA2JTmgyBS2BNCS3M6qjVr0a/7VmNUOOWVPIU+fA4YR77T1ckS/a4uigmIRV4NWj0akVha2CjApPU7dmNyRW3wIAQCedx7mEcr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=XInck6gh; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750618699; x=1751223499; i=w_armin@gmx.de;
	bh=ZzQJ3M8EqiWxxmmNLvTPgJfzj3h9+EYdmRkBn+wuBIc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=XInck6ghvQ34DDzaYVO8aXFQ3lrLGEZBpCaqA9Npfv9Se8k/1WH46pxllRKzy5SA
	 GN0jh/LyHTsIg8Z8/UxFHo7LhFVuE4DGtveTwIZgli/TQwFp/pKfNHcLLkRWFajJU
	 Pwe1lq+YeTT7/oWytBk4t3YGVsl3/HkyUE2xIZFrvmAObCimnKGYHgy0Ipo5lQ3C8
	 CkNXXaVwjY98ODgc/q08S/J/qnMJhfdudZY1KLwWox4UTlQqGixWLP7rcX9TyDvCf
	 e+ElB5tPtMgOjDkxvrs4yLqjhoZ2cVbxE09bXF6VWZGOcTHxrfp956O3+3FHjjqWj
	 91aWVM6vjvgGIQhM4g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N95iH-1urQho1ggh-017RDC; Sun, 22
 Jun 2025 20:58:19 +0200
Message-ID: <c50c011f-6ad5-4122-a0e7-39880a4740ca@gmx.de>
Date: Sun, 22 Jun 2025 20:58:16 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/3] platform/x86: Add Uniwill laptop driver
To: Werner Sembach <wse@tuxedocomputers.com>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-3-W_Armin@gmx.de>
 <1020d244-4d52-4afd-ae98-bfcb2b8e7145@tuxedocomputers.com>
 <de9d469b-9ea2-4fe3-8a7e-92fdc6d1c980@gmx.de>
 <45a985fd-5428-4cbb-843a-523ea435a228@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <45a985fd-5428-4cbb-843a-523ea435a228@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:KraxmP3ugauMr2F7LZA3Uu1+rEskZF4aZC/KWb3ccj3BLI/jZST
 6uDuWjKdvhAC02tu9+qnHUPMPYgQSgxmq7Q391laFfDt2EzP/nNH+9DLXzbA3LtwAYdYU9O
 nD2J9SH/Ef/TpoZoz9je4AuJ5kb3sNCVt93y/9h27nW0q1EHnlJR4LzXdXGgU7Cf84X5Je2
 2VV8aNIfYQBjf8/RuKtpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mt0q4MjzrLg=;QG94SVr0FBqrpnMtCaF6ch+hvjf
 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
 2+FRmUo2SEVH1BL2lJUtrWs9xI/9uEq+AlHZjQ==

QW0gMTguMDYuMjUgdW0gMTM6MTUgc2NocmllYiBXZXJuZXIgU2VtYmFjaDoNCg0KPiBIaSwNCj4N
Cj4gQW0gMTcuMDYuMjUgdW0gMjM6NTAgc2NocmllYiBBcm1pbiBXb2xmOg0KPj4gQW0gMTYuMDYu
MjUgdW0gMTQ6MzIgc2NocmllYiBXZXJuZXIgU2VtYmFjaDoNCj4+DQo+Pj4gSGksDQo+Pj4NCj4+
PiBBbSAxNS4wNi4yNSB1bSAxOTo1OSBzY2hyaWViIEFybWluIFdvbGY6DQo+IFsuLi5dDQo+Pj4+
ICtUaGUgRUMgYmVoaW5kIHRoZSBgYEdldFNldFVMb25nYGAgbWV0aG9kIGlzIHVzZWQgYnkgdGhl
IE9FTSANCj4+Pj4gc29mdHdhcmUgc3VwcGxpZWQgYnkgdGhlIG1hbnVmYWN0dXJlci4NCj4+Pj4g
K1JldmVyc2UtZW5naW5lZXJpbmcgb2YgdGhpcyBzb2Z0d2FyZSBpcyBkaWZmaWN1bHQgc2luY2Ug
aXQgdXNlcyBhbiANCj4+Pj4gb2JmdXNjYXRvciwgaG93ZXZlciBzb21lIHBhcnRzDQo+Pj4+ICth
cmUgbm90IG9iZnVzY2F0ZWQuDQo+Pj4gSWlyYyBDaHJpc3RvZmZlciBzYWlkIHRoZXJlIGlzIGFs
c28gYW5vdGhlciBub24gd21pLCBidXQgYWNwaSwgDQo+Pj4gZ2V0L3NldCBjbWQgdGhhdCBjYW4g
d3JpdGUgb25seSBzcGVjaWZpYyByZWdpb25zIGJ1dCBpcyBmYXN0ZXIuIEp1c3QgDQo+Pj4gd2Fu
dGVkIHRvIGxlYXZlIHRoaXMgaGVyZSBmb3IgcG90ZW50aWFsIGZ1dHVyZSBvcHRpbWl6YXRpb25z
IGlmIHlvdSANCj4+PiBhcmUgaW50ZXJlc3RlZC4NCj4+DQo+PiBXaGF0IGludGVyZmFjZSBhcmUg
eW91IHJlZmVycmluZyB0byBleGFjdGx5Pw0KPg0KPiBJIHRoaW5rIGhlIHdhcyByZWZlcnJpbmcg
dG8gdGhlc2UgMiBtZXRob2RzIGluIHRoZSBkc2R0Og0KPg0KPiDCoMKgwqAgU2NvcGUgKF9TQikN
Cj4gwqDCoMKgIHsNCj4gwqDCoMKgwqDCoMKgwqAgRGV2aWNlIChJTk9VKQ0KPiDCoMKgwqDCoMKg
wqDCoCB7DQo+IMKgwqDCoCDCoMKgwqAgwqDCoMKgIFsuLi5dDQo+DQo+IMKgwqDCoCDCoMKgwqAg
wqDCoMKgIE1ldGhvZCAoRUNSUiwgMSwgTm90U2VyaWFsaXplZCkNCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMb2NhbDAgPSAoMHhG
RTQxMDAwMCArIEFyZzApDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMb2NhbDEg
PSBNTVJXIChMb2NhbDAsIFplcm8sIFplcm8sIFplcm8pDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBSZXR1cm4gKExvY2FsMSkNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+
DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTWV0aG9kIChFQ1JXLCAyLCBOb3RTZXJpYWxpemVk
KQ0KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIExvY2FsMCA9ICgweEZFNDEwMDAwICsgQXJnMCkNCj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIE1NUlcgKExvY2FsMCwgT25lLCBaZXJvLCBBcmcxKQ0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIH0NCj4NCj4gwqDCoMKgIMKgwqDCoCDCoMKgwqAgWy4uLl0NCj4gwqDCoMKg
IMKgwqDCoCB9DQo+IMKgwqDCoCB9DQo+DQo+IFRoZXkgY2FuIHJlYWQvd3JpdGUgdGhlIDB4MDR4
eCBhbmQgMHgwN3h4IGFkZHJlc3NlcyBidXQgbm90IHRoZSAweDE4eHggDQo+IG9uZXMgaWlyYywg
ZG9uJ3Qga25vdyBhYm91dCB0aGUgMHgwZnh4IG9uZXMuDQo+DQo+IEkgdGhpbmsgMHgxOHh4IHdh
cyBuZXZlciBpbnRlbmRlZCB0byBiZSB3cml0dGVuIHByb2JhYmx5LCBidXQgd2UgdXNlIA0KPiBp
dCB0byBpbXBsZW1lbnQgYSBjdXN0b20gZmFuIGN1cnZlIG9wdGlvbiBpbiB0dXhlZG8tZHJpdmVy
cyBvbiBvbGRlciANCj4gZGV2aWNlcyB0aGF0IG9mZmljaWFsbHkgZG9uJ3Qgc3VwcG9ydCBpdC4N
Cj4NCj4gQmVzdCByZWdhcmRzLA0KPg0KPiBXZXJuZXINCj4NCkkgc2VlLCBpIHRvbyBub3RpY2Vk
IHRoZSBJTk9VMDAwMCBkZXZpY2UgZHVyaW5nIHJldmVyc2UgZW5naW5lZXJpbmcuIEkgd2lsbCB1
cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gdG8gaW5mb3JtIGZ1dHVyZSBkZXZlbG9wZXJzIGFib3V0
IHRoaXMgcG90ZW50aWFsbHkNCmZlYXN0ZXIgaW50ZXJmYWNlLiBIb3dldmVyIGZvciBub3cgaSBz
dWdnZXN0IHRoYXQgd2Ugc3RpY2sgdG8gdGhlIFdNSSBpbnRlcmZhY2UuDQoNClRoYW5rcywNCkFy
bWluIFdvbGYNCg0K

