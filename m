Return-Path: <platform-driver-x86+bounces-5916-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2BE99B779
	for <lists+platform-driver-x86@lfdr.de>; Sun, 13 Oct 2024 00:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28B1C282BCF
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Oct 2024 22:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30614199EA3;
	Sat, 12 Oct 2024 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b="JZxVk+KP"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from juniper.fatooh.org (juniper.fatooh.org [173.255.221.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26D914A084
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Oct 2024 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=173.255.221.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728771099; cv=none; b=gLaQM7FlprGiBQYMwWXUHDN1+5Av6mnL2ecXq6mkBLjyWA98xEcZ3P4ONnEJdnn1Sywo68Hl65i3Sg9oQudgioMrgdTRmMe7363WffLOSb27S9piPkXEB/FEVkNjUuMFSNavKYasLHUHARpooKKMxzhBhWOHZf1jmwY4tI1Xhkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728771099; c=relaxed/simple;
	bh=w8Vm++BkrI93WNAUE59TW34kIcu/eK1rt3UuxQk+NKs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=hXRrA209ycrBKy4X1ksQ3aJKcZQRZKR37Hhtmz4QeyjcPOhPmtWoSfbv+CR0DJ9k3UBab5/7e8khtw14HXhgmkO2clt0Gmw9MGNn2DDcZIU3OlpedtH9f6Rgc/WdmWg+elHx6A92RvSPmBQ9XI/e0bgJvQMkOMyiyu3usV77UYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org; spf=pass smtp.mailfrom=fatooh.org; dkim=pass (1024-bit key) header.d=fatooh.org header.i=@fatooh.org header.b=JZxVk+KP; arc=none smtp.client-ip=173.255.221.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fatooh.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fatooh.org
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPS id 43167401C0
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Oct 2024 15:11:36 -0700 (PDT)
Received: from juniper.fatooh.org (juniper.fatooh.org [127.0.0.1])
	by juniper.fatooh.org (Postfix) with ESMTP id 2811C40211
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Oct 2024 15:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:from:subject:to:content-type
	:content-transfer-encoding; s=dkim; bh=2mnkdBYITyoqwY9GXHwHpFLEH
	eM=; b=JZxVk+KPGW6KGF2wXJGt+5FC9YeCJZFoIrmwnAQVpZnVB5lRLSwbqftv5
	uwzc6n/tTA+8JMXBekuA/GnEZZLpU31xtyQulbz9FM5IUmOc8ZTwkLU0ta2rkSgX
	exrlOKOkWwDBlt19ERC/Lkdd3M9A7hbnvERPl8nnNSEAd/wrc4=
DomainKey-Signature: a=rsa-sha1; c=simple; d=fatooh.org; h=message-id
	:date:mime-version:from:subject:to:content-type
	:content-transfer-encoding; q=dns; s=dkim; b=CxjaHa48531yXcOrC0I
	KIGS1LZuAyPRNIBKbl4PK5f5R7hJNtQve7K/aZrrp1z4D4N0gH6u7jZDZPdvRyGz
	X9Ixl3EufbFXfERWvaRRAOJnrxJQbq2VCKjcJC/nGjvIlclmN/HOLNJ/kDeqQkY4
	F47TJjv/J5kapIpDZZqAmex0=
Received: from [198.18.0.3] (unknown [104.184.153.121])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by juniper.fatooh.org (Postfix) with ESMTPSA id 1F840401C0
	for <platform-driver-x86@vger.kernel.org>; Sat, 12 Oct 2024 15:11:36 -0700 (PDT)
Message-ID: <48c7aa22-7c0d-40af-80d4-538fd16327d1@fatooh.org>
Date: Sat, 12 Oct 2024 15:11:35 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Corey Hickey <bugfood-ml@fatooh.org>
Subject: please help with intermittent s2idle problem on AMD laptop
To: platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkkgYW0gaGF2aW5nIGFuIGludGVybWl0dGVudCBwcm9ibGVtIHdpdGggcmVz
dW1pbmcgZnJvbSBzMmlkbGUuIFRoZXJlDQpzZWVtcyB0byBiZSBhIHByb2JsZW0gd2l0aCBn
b2luZyBpbnRvIHRoZSBzMmlkbGUgc3RhdGUtLXRoZSBsYXB0b3ANCmFwcGVhcnMgc3VzcGVu
ZGVkLCBidXQgdGhlIHBvd2VyIGRyYXcgaXMgaGlnaCBhbmQgbGFwdG9wIHJlbWFpbnMgd2Fy
bQ0Kb3ZlciB0aW1lLiBBdHRlbXB0aW5nIHRvIHJlc3VtZSBmYWlsczsgSSBuZWVkIHRvIGZ1
bGx5IHBvd2VyIG9mZiB0aGUNCmxhcHRvcC4NCg0KQ2FuIHNvbWVib2R5IHBsZWFzZSBoZWxw
IG1lIHRyb3VibGVzaG9vdCB0aGlzPyBJIGFtIGFibGUgdG8gdGVzdA0KcGF0Y2hlcyBhbmQg
ZXhwZXJpbWVudCwgYnV0IEknbSBvdXQgb2YgbXkgZGVwdGggd2l0aCB0cnlpbmcgdG8gZmln
dXJlDQp0aGlzIG91dCBvbiBteSBvd24uDQoNCklmIHRoZXJlIGlzIGEgYmV0dGVyIHBsYWNl
IHRvIGFzayB0aGlzLCBwbGVhc2UgbGV0IG1lIGtub3cuDQoNCkkgZmlyc3QgcG9zdGVkIGFi
b3V0IHRoZSBwcm9ibGVtIGhlcmU6DQoNCmh0dHBzOi8vY29tbXVuaXR5LmZyYW1lLndvcmsv
dC9saW51eC1mcmFtZXdvcmstMTYtaW50ZXJtaXR0ZW50LWZhaWx1cmUtdG8tcmVzdW1lLWZy
b20tc3VzcGVuZC81ODY3NA0KDQpTeXN0ZW0gZGV0YWlscyBhcmU6DQoqIEZyYW1ld29yayBM
YXB0b3AgMTYgKHdpdGhvdXQgR1BVIG1vZHVsZSkNCiogUnl6ZW4gNyA3ODQwSFMNCiogRGVi
aWFuIFNpZA0KDQpUaGUga2VybmVsIEkgaGFkIHRyb3VibGUgd2l0aCB3YXMgNi4xMC42OyBJ
IGhhdmUganVzdCByZWNlbnRseSB1cGRhdGVkDQp0aGUga2VybmVsIHRvIGdpdCAwOWY2YjBj
ODkwNGJmYWExZTA2MDFiYzEwMmUxYjZhYTZkZThjOThmIChmcm9tDQp5ZXN0ZXJkYXkpIGlu
IG9yZGVyIHRvIHRyeSB0byB0cm91Ymxlc2hvb3QgZnVydGhlci4NCg0KDQpJIHRyaWVkIHRv
IGZpbmQgc29tZSBkZWJ1Z2dpbmcgaW5mb3JtYXRpb24gb24gbXkgb3duLiBUaGUgcmVtYWlu
ZGVyDQpvZiB0aGlzIG1lc3NhZ2UgaXMgYWJvdXQgdGhhdCBlZmZvcnQsIGJ1dCBpZiBJJ20g
b24gdGhlIHdyb25nIHRyYWNrLA0KcGxlYXNlIGRpc3JlZ2FyZCB0aGUgZm9sbG93aW5nLg0K
DQoNCkkgZm91bmQgdGhpcyBhcnRpY2xlOg0KaHR0cHM6Ly93d3cucGhvcm9uaXguY29tL25l
d3MvQU1ELU1QMi1TVEItU3VzcGVuZC1SZXN1bWUNCi4uLmFuZCBob3BlZCBJIHdvdWxkIGJl
IGFibGUgdG8gZmluZCBzb21lIHVzZWZ1bCBpbmZvcm1hdGlvbi4NCg0KQXMgZmFyIGFzIEkg
Y2FuIHRlbGwgZnJvbSB0aGUgY29kZSwgSSBuZWVkIHRvIGxvYWQgdGhlIGFtZF9wbWMgbW9k
dWxlDQp3aXRoIGVuYWJsZV9zdGI9MS4NCg0KbGl6YXJkOn4jIHJtbW9kIGFtZF9wbWMNCmxp
emFyZDp+IyBtb2Rwcm9iZSBhbWRfcG1jIGVuYWJsZV9zdGI9MQ0KDQpJZiBJIGRvIHRoYXQs
IHRob3VnaDoNCjEuIFRoZXJlIGlzIGFuIGVycm9yOiAnYW1kX3BtYyBBTURJMDAwOTowMDog
U01VIGNtZCBmYWlsZWQuIGVycjogMHhmZicNCjIuIFRoZXJlIGlzIGEga2VybmVsIFdBUk5J
TkcgKHdoaWNoIEkgd2lsbCBwYXN0ZSBpbiBmdWxsIGJlbG93KToNCiAgICBpb3JlbWFwIG9u
IFJBTSBhdCAweDAwMDAwMDAwMDAwMDAwMDAgLSAweDAwMDAwMDAwMDBmZmZmZmYNCjMuIFRo
ZSBleHBlY3RlZCBmaWxlcyBpbiBkZWJ1Z2ZzIGRvIG5vdCBhcHBlYXIuDQoNCg0KSSBhZGRl
ZCBzb21lIHByaW50ayBzdGF0ZW1lbnRzIHRvIHRoZSBkcml2ZXIgaW4gb3JkZXIgdG8gdHJ5
IHRvIGZpbmQNCm91dCB3aGF0IGlzIGhhcHBlbmluZy4NCg0KVGhlIHRyb3VibGUgc2VlbXMg
dG8gYmUgaW4gYW1kX3BtY19zMmRfaW5pdCgpIGFuZCB0aGUgcmVzdWx0cyBpdCBnZXRzDQpi
YWNrIGZyb20gY2FsbGluZyBhbWRfcG1jX3NlbmRfY21kKCkNCg0KDQpodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1jL3BtYy5jI245NzgNCg0KDQogICAg
ICAgICAvKiBHZXQgRFJBTSBzaXplICovDQogICAgICAgICByZXQgPSBhbWRfcG1jX3NlbmRf
Y21kKGRldiwgUzJEX0RSQU1fU0laRSwgJmRldi0+ZHJhbV9zaXplLCBkZXYtPnMyZF9tc2df
aWQsIHRydWUpOw0KICAgICAgICAgcHJpbnRrKEtFUk5fSU5GTyAiYW1kX3BtY19zMmRfaW5p
dCBzMmRfZHJhbV9zaXplIHJldDogJWRcbiIsIHJldCk7DQogICAgICAgICBpZiAocmV0IHx8
ICFkZXYtPmRyYW1fc2l6ZSkNCiAgICAgICAgICAgICAgICAgZGV2LT5kcmFtX3NpemUgPSBT
MkRfVEVMRU1FVFJZX0RSQU1CWVRFU19NQVg7DQoNCiAgICAgICAgIC8qIEdldCBTVEIgRFJB
TSBhZGRyZXNzICovDQogICAgICAgICBhbWRfcG1jX3NlbmRfY21kKGRldiwgUzJEX1BIWVNf
QUREUl9MT1csICZwaHlzX2FkZHJfbG93LCBkZXYtPnMyZF9tc2dfaWQsIHRydWUpOw0KICAg
ICAgICAgYW1kX3BtY19zZW5kX2NtZChkZXYsIFMyRF9QSFlTX0FERFJfSElHSCwgJnBoeXNf
YWRkcl9oaSwgZGV2LT5zMmRfbXNnX2lkLCB0cnVlKTsNCg0KDQpGb3IgdGhlIGNhbGwgdG8g
cmV0cmlldmUgUzJEX0RSQU1fU0laRSwgdGhlIHJldHVybiB2YWx1ZSBpcyAtNS4NCkZvciB0
aGUgY2FsbHMgdG8gcmV0cmlldmUgUzJEX1BIWVNfQUREUl9MT1csIHRoZSByZXR1cm4gdmFs
dWUgaXMgMCwNCmJ1dCBwaHlzX2FkZHJfbG93IGlzIDAgYXMgd2VsbCwgd2hpY2ggc2VlbXMg
d3JvbmcuDQpGb3IgUzJEX1BIWVNfQUREUl9ISUdILCBwaHlzX2FkZHJfaGkgaXMgMCBpcyB3
ZWxsLg0KDQpJIHRoaW5rIHRoYXQgYm90aCBvZiB0aGUgcGh5c19hZGRyIHZhbHVlcyBiZWlu
ZyAwIGlzIHJlc3VsdGluZyBpbiB0aGUNCndhcm5pbmcgZnJvbSBpb3JlbWFwLg0KDQpJcyB0
aGlzIGEgZHJpdmVyIGJ1Zywgb3IgYSBoYXJkd2FyZSBsaW1pdGF0aW9uPw0KDQpJIHdpbGwg
cG9zdCBteSBkZWJ1ZyBwYXRjaCBiZWxvdyBhbmQgdGhlbiB0aGUgb3V0cHV0IGZyb20gdGhl
IGtlcm5lbA0Kd2hlbiBsb2FkaW5nICdhbWRfcG1jIGVuYWJsZV9zdGI9MScuDQoNCg0KLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KY29tbWl0IGVkN2EyNzg0Y2Y2YTE5Nzk2NzM0YjhhY2E4N2EyNjBj
NGZmMWY3NTINCkF1dGhvcjogQ29yZXkgSGlja2V5IDxidWdmb29kLWNAZmF0b29oLm9yZz4N
CkRhdGU6ICAgRnJpIDIwMjQtMTAtMTEgMjM6MTM6NDANCg0KICAgICBkZWJ1Zw0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL3BtYy9tcDJfc3RiLmMgYi9kcml2
ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1jL21wMl9zdGIuYw0KaW5kZXggOTc3NWRkYzFiMjdh
Li43MThiMDEyNjZiZmYgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQv
cG1jL21wMl9zdGIuYw0KKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL3BtYy9tcDJf
c3RiLmMNCkBAIC0yMjgsMTAgKzIyOCwxMiBAQCB2b2lkIGFtZF9tcDJfc3RiX2luaXQoc3Ry
dWN0IGFtZF9wbWNfZGV2ICpkZXYpDQogIAlzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCiAgCWlu
dCByYzsNCiAgDQorICAgIHByaW50ayhLRVJOX0lORk8gImFtZF9tcDJfc3RiX2luaXQgMVxu
Iik7DQogIAltcDIgPSBkZXZtX2t6YWxsb2MoZGV2LT5kZXYsIHNpemVvZigqbXAyKSwgR0ZQ
X0tFUk5FTCk7DQogIAlpZiAoIW1wMikNCiAgCQlyZXR1cm47DQogIA0KKyAgICBwcmludGso
S0VSTl9JTkZPICJhbWRfbXAyX3N0Yl9pbml0IDJcbiIpOw0KICAJcGRldiA9IHBjaV9nZXRf
ZGV2aWNlKFBDSV9WRU5ET1JfSURfQU1ELCBQQ0lfREVWSUNFX0lEX0FNRF9NUDJfU1RCLCBO
VUxMKTsNCiAgCWlmICghcGRldikNCiAgCQlyZXR1cm47DQpAQCAtMjM5LDI0ICsyNDEsMjgg
QEAgdm9pZCBhbWRfbXAyX3N0Yl9pbml0KHN0cnVjdCBhbWRfcG1jX2RldiAqZGV2KQ0KICAJ
ZGV2LT5tcDIgPSBtcDI7DQogIAltcDItPnBkZXYgPSBwZGV2Ow0KICANCisgICAgcHJpbnRr
KEtFUk5fSU5GTyAiYW1kX21wMl9zdGJfaW5pdCAzIik7DQogIAltcDItPmRldnJlc19naWQg
PSBkZXZyZXNfb3Blbl9ncm91cCgmcGRldi0+ZGV2LCBOVUxMLCBHRlBfS0VSTkVMKTsNCiAg
CWlmICghbXAyLT5kZXZyZXNfZ2lkKSB7DQogIAkJZGV2X2VycigmcGRldi0+ZGV2LCAiZGV2
cmVzX29wZW5fZ3JvdXAgZmFpbGVkXG4iKTsNCiAgCQlnb3RvIG1wMl9lcnJvcjsNCiAgCX0N
CiAgDQorICAgIHByaW50ayhLRVJOX0lORk8gImFtZF9tcDJfc3RiX2luaXQgNFxuIik7DQog
IAlyYyA9IHBjaW1fZW5hYmxlX2RldmljZShwZGV2KTsNCiAgCWlmIChyYykgew0KICAJCWRl
dl9lcnIoJnBkZXYtPmRldiwgInBjaW1fZW5hYmxlX2RldmljZSBmYWlsZWRcbiIpOw0KICAJ
CWdvdG8gbXAyX2Vycm9yOw0KICAJfQ0KICANCisgICAgcHJpbnRrKEtFUk5fSU5GTyAiYW1k
X21wMl9zdGJfaW5pdCA1XG4iKTsNCiAgCXJjID0gcGNpbV9pb21hcF9yZWdpb25zKHBkZXYs
IEJJVChNUDJfTU1JT19CQVIpLCAibXAyIHN0YiIpOw0KICAJaWYgKHJjKSB7DQogIAkJZGV2
X2VycigmcGRldi0+ZGV2LCAicGNpbV9pb21hcF9yZWdpb25zIGZhaWxlZFxuIik7DQogIAkJ
Z290byBtcDJfZXJyb3I7DQogIAl9DQogIA0KKyAgICBwcmludGsoS0VSTl9JTkZPICJhbWRf
bXAyX3N0Yl9pbml0IDZcbiIpOw0KICAJbXAyLT5tbWlvID0gcGNpbV9pb21hcF90YWJsZShw
ZGV2KVtNUDJfTU1JT19CQVJdOw0KICAJaWYgKCFtcDItPm1taW8pIHsNCiAgCQlkZXZfZXJy
KCZwZGV2LT5kZXYsICJwY2ltX2lvbWFwX3RhYmxlIGZhaWxlZFxuIik7DQpAQCAtMjY1LDYg
KzI3MSw3IEBAIHZvaWQgYW1kX21wMl9zdGJfaW5pdChzdHJ1Y3QgYW1kX3BtY19kZXYgKmRl
dikNCiAgDQogIAlwY2lfc2V0X21hc3RlcihwZGV2KTsNCiAgDQorICAgIHByaW50ayhLRVJO
X0lORk8gImFtZF9tcDJfc3RiX2luaXQgN1xuIik7DQogIAlyYyA9IGRtYV9zZXRfbWFza19h
bmRfY29oZXJlbnQoJnBkZXYtPmRldiwgRE1BX0JJVF9NQVNLKDY0KSk7DQogIAlpZiAocmMp
IHsNCiAgCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gc2V0IERNQSBtYXNrXG4i
KTsNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1jL3BtYy5jIGIv
ZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL3BtYy9wbWMuYw0KaW5kZXggYmJiOGVkYjYyZTAw
Li42Y2E0OTc0NzNkNzggMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQv
cG1jL3BtYy5jDQorKysgYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1jL3BtYy5jDQpA
QCAtNjI3LDYgKzYyNyw3IEBAIHN0YXRpYyB2b2lkIGFtZF9wbWNfZGJnZnNfdW5yZWdpc3Rl
cihzdHJ1Y3QgYW1kX3BtY19kZXYgKmRldikNCiAgDQogIHN0YXRpYyBib29sIGFtZF9wbWNf
aXNfc3RiX3N1cHBvcnRlZChzdHJ1Y3QgYW1kX3BtY19kZXYgKmRldikNCiAgew0KKyAgICBw
cmludGsoS0VSTl9JTkZPICJhbWRfcG1jX2lzX3N0Yl9zdXBwb3J0ZWQgY3B1X2lkOiAlZFxu
IiwgZGV2LT5jcHVfaWQpOw0KICAJc3dpdGNoIChkZXYtPmNwdV9pZCkgew0KICAJY2FzZSBB
TURfQ1BVX0lEX1lDOg0KICAJY2FzZSBBTURfQ1BVX0lEX0NCOg0KQEAgLTk4NiwxMSArOTg3
LDEzIEBAIHN0YXRpYyBpbnQgYW1kX3BtY19zMmRfaW5pdChzdHJ1Y3QgYW1kX3BtY19kZXYg
KmRldikNCiAgCWRldi0+bXNnX3BvcnQgPSAxOw0KICANCiAgCWFtZF9wbWNfc2VuZF9jbWQo
ZGV2LCBTMkRfVEVMRU1FVFJZX1NJWkUsICZzaXplLCBkZXYtPnMyZF9tc2dfaWQsIHRydWUp
Ow0KKwlwcmludGsoS0VSTl9JTkZPICJhbWRfcG1jX3MyZF9pbml0IHNpemU6ICV1XG4iLCBz
aXplKTsNCiAgCWlmIChzaXplICE9IFMyRF9URUxFTUVUUllfQllURVNfTUFYKQ0KICAJCXJl
dHVybiAtRUlPOw0KICANCiAgCS8qIEdldCBEUkFNIHNpemUgKi8NCiAgCXJldCA9IGFtZF9w
bWNfc2VuZF9jbWQoZGV2LCBTMkRfRFJBTV9TSVpFLCAmZGV2LT5kcmFtX3NpemUsIGRldi0+
czJkX21zZ19pZCwgdHJ1ZSk7DQorCXByaW50ayhLRVJOX0lORk8gImFtZF9wbWNfczJkX2lu
aXQgczJkX2RyYW1fc2l6ZSByZXQ6ICVkXG4iLCByZXQpOw0KICAJaWYgKHJldCB8fCAhZGV2
LT5kcmFtX3NpemUpDQogIAkJZGV2LT5kcmFtX3NpemUgPSBTMkRfVEVMRU1FVFJZX0RSQU1C
WVRFU19NQVg7DQogIA0KQEAgLTEwMDMsNyArMTAwNiw5IEBAIHN0YXRpYyBpbnQgYW1kX3Bt
Y19zMmRfaW5pdChzdHJ1Y3QgYW1kX3BtY19kZXYgKmRldikNCiAgCS8qIENsZWFyIG1zZ19w
b3J0IGZvciBvdGhlciBTTVUgb3BlcmF0aW9uICovDQogIAlkZXYtPm1zZ19wb3J0ID0gMDsN
CiAgDQorCXByaW50ayhLRVJOX0lORk8gImFtZF9wbWNfczJkX2luaXQgcF9hX2w6ICV1IHBf
YV9oaTogJXUgc19wX2E6ICVsbHUgc3o6ICV1XG4iLCBwaHlzX2FkZHJfbG93LCBwaHlzX2Fk
ZHJfaGksIHN0Yl9waHlzX2FkZHIsIGRldi0+ZHJhbV9zaXplKTsNCiAgCWRldi0+c3RiX3Zp
cnRfYWRkciA9IGRldm1faW9yZW1hcChkZXYtPmRldiwgc3RiX3BoeXNfYWRkciwgZGV2LT5k
cmFtX3NpemUpOw0KKwlwcmludGsoS0VSTl9JTkZPICJhbWRfcG1jX3MyZF9pbml0IGRzdmE6
ICVwXG4iLCBkZXYtPnN0Yl92aXJ0X2FkZHIpOw0KICAJaWYgKCFkZXYtPnN0Yl92aXJ0X2Fk
ZHIpDQogIAkJcmV0dXJuIC1FTk9NRU07DQogIA0KQEAgLTEwNDcsNiArMTA1Miw3IEBAIHN0
YXRpYyBpbnQgYW1kX3BtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
ICAJaW50IGVycjsNCiAgCXUzMiB2YWw7DQogIA0KKwlwcmludGsoS0VSTl9JTkZPICJhbWRf
cG1jX3Byb2JlOiAxXG4iKTsNCiAgCWRldi0+ZGV2ID0gJnBkZXYtPmRldjsNCiAgDQogIAly
ZGV2ID0gcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KDAsIDAsIFBDSV9ERVZGTigwLCAw
KSk7DQpAQCAtMTA1NywxMiArMTA2MywxNCBAQCBzdGF0aWMgaW50IGFtZF9wbWNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAgDQogIAlkZXYtPmNwdV9pZCA9IHJk
ZXYtPmRldmljZTsNCiAgDQorCXByaW50ayhLRVJOX0lORk8gImFtZF9wbWNfcHJvYmU6IDJc
biIpOw0KICAJaWYgKGRldi0+Y3B1X2lkID09IEFNRF9DUFVfSURfU1ApIHsNCiAgCQlkZXZf
d2Fybl9vbmNlKGRldi0+ZGV2LCAiUzBpMyBpcyBub3Qgc3VwcG9ydGVkIG9uIHRoaXMgaGFy
ZHdhcmVcbiIpOw0KICAJCWVyciA9IC1FTk9ERVY7DQogIAkJZ290byBlcnJfcGNpX2Rldl9w
dXQ7DQogIAl9DQogIA0KKwlwcmludGsoS0VSTl9JTkZPICJhbWRfcG1jX3Byb2JlOiAzXG4i
KTsNCiAgCWRldi0+cmRldiA9IHJkZXY7DQogIAllcnIgPSBhbWRfc21uX3JlYWQoMCwgQU1E
X1BNQ19CQVNFX0FERFJfTE8sICZ2YWwpOw0KICAJaWYgKGVycikgew0KQEAgLTEwNzMsNiAr
MTA4MSw3IEBAIHN0YXRpYyBpbnQgYW1kX3BtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KICANCiAgCWJhc2VfYWRkcl9sbyA9IHZhbCAmIEFNRF9QTUNfQkFTRV9B
RERSX0hJX01BU0s7DQogIA0KKwlwcmludGsoS0VSTl9JTkZPICJhbWRfcG1jX3Byb2JlOiA0
XG4iKTsNCiAgCWVyciA9IGFtZF9zbW5fcmVhZCgwLCBBTURfUE1DX0JBU0VfQUREUl9ISSwg
JnZhbCk7DQogIAlpZiAoZXJyKSB7DQogIAkJZGV2X2VycihkZXYtPmRldiwgImVycm9yIHJl
YWRpbmcgMHgleFxuIiwgQU1EX1BNQ19CQVNFX0FERFJfSEkpOw0KQEAgLTEwODUsNiArMTA5
NCw3IEBAIHN0YXRpYyBpbnQgYW1kX3BtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KICANCiAgCWRldi0+cmVnYmFzZSA9IGRldm1faW9yZW1hcChkZXYtPmRldiwg
YmFzZV9hZGRyICsgQU1EX1BNQ19CQVNFX0FERFJfT0ZGU0VULA0KICAJCQkJICAgIEFNRF9Q
TUNfTUFQUElOR19TSVpFKTsNCisJcHJpbnRrKEtFUk5fSU5GTyAiYW1kX3BtY19wcm9iZTog
NVxuIik7DQogIAlpZiAoIWRldi0+cmVnYmFzZSkgew0KICAJCWVyciA9IC1FTk9NRU07DQog
IAkJZ290byBlcnJfcGNpX2Rldl9wdXQ7DQpAQCAtMTA5NSwyNCArMTEwNSwzMSBAQCBzdGF0
aWMgaW50IGFtZF9wbWNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCiAg
CS8qIEdldCBudW0gb2YgSVAgYmxvY2tzIHdpdGhpbiB0aGUgU29DICovDQogIAlhbWRfcG1j
X2dldF9pcF9pbmZvKGRldik7DQogIA0KKwlwcmludGsoS0VSTl9JTkZPICJhbWRfcG1jX3By
b2JlOiA2XG4iKTsNCiAgCWlmIChlbmFibGVfc3RiICYmIGFtZF9wbWNfaXNfc3RiX3N1cHBv
cnRlZChkZXYpKSB7DQogIAkJZXJyID0gYW1kX3BtY19zMmRfaW5pdChkZXYpOw0KKwkJcHJp
bnRrKEtFUk5fSU5GTyAiYW1kX3BtY19wcm9iZTogNmFcbiIpOw0KICAJCWlmIChlcnIpDQog
IAkJCWdvdG8gZXJyX3BjaV9kZXZfcHV0Ow0KICAJfQ0KICANCisJcHJpbnRrKEtFUk5fSU5G
TyAiYW1kX3BtY19wcm9iZTogN1xuIik7DQogIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2
LCBkZXYpOw0KICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX1NVU1BFTkQpKSB7DQogIAkJZXJy
ID0gYWNwaV9yZWdpc3Rlcl9scHMwX2RldigmYW1kX3BtY19zMmlkbGVfZGV2X29wcyk7DQor
CQlwcmludGsoS0VSTl9JTkZPICJhbWRfcG1jX3Byb2JlOiA3YVxuIik7DQogIAkJaWYgKGVy
cikNCiAgCQkJZGV2X3dhcm4oZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIgTFBTMCBz
bGVlcCBoYW5kbGVyLCBleHBlY3QgaW5jcmVhc2VkIHBvd2VyIGNvbnN1bXB0aW9uXG4iKTsN
CiAgCQlpZiAoIWRpc2FibGVfd29ya2Fyb3VuZHMpDQogIAkJCWFtZF9wbWNfcXVpcmtzX2lu
aXQoZGV2KTsNCiAgCX0NCiAgDQorCXByaW50ayhLRVJOX0lORk8gImFtZF9wbWNfcHJvYmU6
IDhcbiIpOw0KICAJYW1kX3BtY19kYmdmc19yZWdpc3RlcihkZXYpOw0KLQlpZiAoSVNfRU5B
QkxFRChDT05GSUdfQU1EX01QMl9TVEIpKQ0KKwlpZiAoSVNfRU5BQkxFRChDT05GSUdfQU1E
X01QMl9TVEIpKSB7DQorCQlwcmludGsoS0VSTl9JTkZPICJhbWRfcG1jX3Byb2JlOiBjYWxs
aW5nIGFtZF9tcDJfc3RiX2luaXRcbiIpOw0KICAJCWFtZF9tcDJfc3RiX2luaXQoZGV2KTsN
CisgICAgfQ0KICAJcG1fcmVwb3J0X21heF9od19zbGVlcChVNjRfTUFYKTsNCiAgCXJldHVy
biAwOw0KICANCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBr
ZXJuZWw6IGFtZF9wbWNfcHJvYmU6IDENCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVs
OiBhbWRfcG1jX3Byb2JlOiAyDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogYW1k
X3BtY19wcm9iZTogMw0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IGFtZF9wbWNf
cHJvYmU6IDQNCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBhbWRfcG1jX3Byb2Jl
OiA1DQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogYW1kX3BtY19wcm9iZTogNg0K
T2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IGFtZF9wbWNfaXNfc3RiX3N1cHBvcnRl
ZCBjcHVfaWQ6IDUzNTINCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBhbWRfcG1j
X3MyZF9pbml0IHNpemU6IDEwNDg1NzYNCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVs
OiBhbWRfcG1jIEFNREkwMDA5OjAwOiBTTVUgY21kIGZhaWxlZC4gZXJyOiAweGZmDQpPY3Qg
MTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogYW1kX3BtY19zMmRfaW5pdCBzMmRfZHJhbV9z
aXplIHJldDogLTUNCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBhbWRfcG1jX3My
ZF9pbml0IHBfYV9sOiAwIHBfYV9oaTogMCBzX3BfYTogMCBzejogMTY3NzcyMTYNCk9jdCAx
MiAwMDoyMDowMSBsaXphcmQga2VybmVsOiAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0t
LS0tLS0tLS0NCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBpb3JlbWFwIG9uIFJB
TSBhdCAweDAwMDAwMDAwMDAwMDAwMDAgLSAweDAwMDAwMDAwMDBmZmZmZmYNCk9jdCAxMiAw
MDoyMDowMSBsaXphcmQga2VybmVsOiBXQVJOSU5HOiBDUFU6IDEwIFBJRDogMjE1MSBhdCBh
cmNoL3g4Ni9tbS9pb3JlbWFwLmM6MjE3IF9faW9yZW1hcF9jYWxsZXIrMHgyY2QvMHgzNDAN
Ck9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBNb2R1bGVzIGxpbmtlZCBpbjogYW1k
X3BtYygrKSBjY20gY3B1ZnJlcV91c2Vyc3BhY2UgY3B1ZnJlcV9wb3dlcnNhdmUgY3B1ZnJl
cV9jb25zZXJ2YXRpdmUgc3VucnBjIGJpbmZtdF9taXNjIG5sc19hc2NpaSBubHNfY3A0Mzcg
dmZhdCBmYXQgdHlwZWNfZGlzcGxheXBvcnQgYW1kZ3B1IHNuZF9zb2ZfYW1kX3JlbWJyYW5k
dCBhbWR4Y3AgZHJtX2V4ZWMgc25kX3NvZl9hbWRfYWNwIGdwdV9zY2hlZCBidHVzYiBzbmRf
c29mX3BjaSBkcm1fYnVkZHkgc25kX3NvZl94dGVuc2FfZHNwIGJ0cnRsIGRybV9zdWJhbGxv
Y19oZWxwZXIgc25kX2hkYV9jb2RlY19yZWFsdGVrIGFtZF9hdGwgZHJtX2Rpc3BsYXlfaGVs
cGVyIGJ0aW50ZWwgaW50ZWxfcmFwbF9tc3Igc25kX3NvZiBidGJjbSBpbnRlbF9yYXBsX2Nv
bW1vbiBzbmRfaGRhX2NvZGVjX2dlbmVyaWMgc25kX3NvZl91dGlscyBjZWMgYnRtdGsgc25k
X2hkYV9zY29kZWNfY29tcG9uZW50IHNuZF9oZGFfY29kZWNfaGRtaSBzbmRfc29jX2NvcmUg
dXZjdmlkZW8gbXQ3OTIxZSBzbmRfY29tcHJlc3MgdmlkZW9idWYyX3ZtYWxsb2MgcmNfY29y
ZSBzbmRfcGNtX2RtYWVuZ2luZSB1dmMgc25kX2hkYV9pbnRlbCBtdDc5MjFfY29tbW9uIGRy
bV90dG1faGVscGVyIHZpZGVvYnVmMl9tZW1vcHMgc25kX3BjaV9wcyBzbmRfaW50ZWxfZHNw
Y2ZnIHNuZF9ycGxfcGNpX2FjcDZ4IHNuZF9pbnRlbF9zZHdfYWNwaSBtdDc5MnhfbGliIHZp
ZGVvYnVmMl92NGwyIHNuZF9wY2lfYWNwNnggZWRhY19tY2VfYW1kIHR0bSBzbmRfcGNpX2Fj
cDV4IG10NzZfY29ubmFjX2xpYiBzbmRfaGRhX2NvZGVjIHNuZF9ybl9wY2lfYWNwM3ggdmlk
ZW9kZXYgYmx1ZXRvb3RoIGRybV9rbXNfaGVscGVyIHNuZF9hY3BfY29uZmlnIG10NzYgc25k
X2hkYV9jb3JlIHZpZGVvYnVmMl9jb21tb24gc25kX3NvY19hY3BpIGkyY19hbGdvX2JpdCBt
YyBjcmMxNiBzbmRfaHdkZXAgc25kX3BjaV9hY3AzeCBhbWRfcG1mIGt2bV9hbWQgYW1kdGVl
IG1hYzgwMjExIGhpZF9zZW5zb3JfYWxzDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5l
bDogIGhpZF9zZW5zb3JfdHJpZ2dlciBjY3AgbGliYXJjNCB1Y3NpX2FjcGkgaGlkX3NlbnNv
cl9paW9fY29tbW9uIGt2bSBpbmR1c3RyaWFsaW9fdHJpZ2dlcmVkX2J1ZmZlciBhbWRfc2Zo
IHR5cGVjX3Vjc2kga2ZpZm9fYnVmIGxlZHNfY3Jvc19lYyBjcm9zX3VzYnBkX2NoYXJnZXIg
dGVlIHR5cGVjIHNuZF9wY3NwIGNyb3NfZWNfaHdtb24gcGxhdGZvcm1fcHJvZmlsZSBsZWRf
Y2xhc3NfbXVsdGljb2xvciByYXBsIGNyb3NfdXNicGRfbm90aWZ5IGNmZzgwMjExIGNyb3Nf
ZWNfc3lzZnMgaW5kdXN0cmlhbGlvIHJvbGVzIGNyb3NfdXNicGRfbG9nZ2VyIGNyb3NfZWNf
ZGVidWdmcyBjcm9zX2NoYXJnZV9jb250cm9sIGNyb3NfZWNfY2hhcmRldiB3bWlfYm1vZiBz
cDUxMDBfdGNvIGJ1dHRvbiBhYyBrMTB0ZW1wIHdhdGNoZG9nIHJma2lsbCBjcHVmcmVxX29u
ZGVtYW5kIHNuZF9pbnRlbDh4MCBzbmRfYWM5N19jb2RlYyBhYzk3X2J1cyBzbmRfcGNtX29z
cyBzbmRfbWl4ZXJfb3NzIHNuZF9wY20gc25kX3RpbWVyIHNuZCBzb3VuZGNvcmUgZXZkZXYg
aTJjX2RldiBzaWRld2luZGVyIGdhbWVwb3J0IGpveWRldiBwYXJwb3J0X3BjIHBwZGV2IGxw
IHBhcnBvcnQgZWZpX3BzdG9yZSBjb25maWdmcyBuZm5ldGxpbmsgaXBfdGFibGVzIHhfdGFi
bGVzIGF1dG9mczQgeGZzIGRtX2NyeXB0IGRtX21vZCBlZml2YXJmcyByYWlkMTAgcmFpZDQ1
NiBhc3luY19yYWlkNl9yZWNvdiBhc3luY19tZW1jcHkgYXN5bmNfcHEgYXN5bmNfeG9yIGFz
eW5jX3R4IHhvciByYWlkNl9wcSBsaWJjcmMzMmMgY3JjMzJjX2dlbmVyaWMgcmFpZDAgY2Rj
X25jbSBjZGNfZXRoZXIgdXNibmV0IHI4MTUyIG1paSBsaWJwaHkgdXNiaGlkIHJhaWQxIGhp
ZF9tdWx0aXRvdWNoIGhpZF9zZW5zb3JfaHViIGhpZF9nZW5lcmljIG1kX21vZCBjcmN0MTBk
aWZfcGNsbXVsIGkyY19oaWRfYWNwaSBjcmMzMl9wY2xtdWwgeGhjaV9wY2kgaTJjX2hpZCBj
cmMzMmNfaW50ZWwgY3Jvc19lY19kZXYgeGhjaV9oY2QgZ2hhc2hfY2xtdWxuaV9pbnRlbA0K
T2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICBjcm9zX2VjX2xwY3Mgc2hhNTEyX3Nz
c2UzIGNyb3NfZWMgbnZtZSBzaGEyNTZfc3NzZTMgdXNiY29yZSBkcm0gdGh1bmRlcmJvbHQg
c2hhMV9zc3NlMyBpMmNfcGlpeDQgdmlkZW8gbnZtZV9jb3JlIGkyY19zbWJ1cyB1c2JfY29t
bW9uIGJhdHRlcnkgd21pIGhpZCBhZXNuaV9pbnRlbCBnZjEyOG11bCBjcnlwdG9fc2ltZCBj
cnlwdGQgW2xhc3QgdW5sb2FkZWQ6IGFtZF9wbWNdDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJk
IGtlcm5lbDogQ1BVOiAxMCBVSUQ6IDAgUElEOiAyMTUxIENvbW06IG1vZHByb2JlIE5vdCB0
YWludGVkIDYuMTIuMC1yYzIrICM4DQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDog
SGFyZHdhcmUgbmFtZTogRnJhbWV3b3JrIExhcHRvcCAxNiAoQU1EIFJ5emVuIDcwNDAgU2Vy
aWVzKS9GUkFOTVpDUDA3LCBCSU9TIDAzLjAzIDAzLzI3LzIwMjQNCk9jdCAxMiAwMDoyMDow
MSBsaXphcmQga2VybmVsOiBSSVA6IDAwMTA6X19pb3JlbWFwX2NhbGxlcisweDJjZC8weDM0
MA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IENvZGU6IDFmIGZlIGZmIGZmIDgw
IDNkIDdlIDMzIGQ4IDAxIDAwIDc1IDlkIDQ4IDhkIDU0IDI0IDI4IDQ4IDhkIDc0IDI0IDE4
IDQ4IGM3IGM3IDlmIGFlIDZjIDgyIGM2IDA1IDY0IDMzIGQ4IDAxIDAxIGU4IDUzIGQ4IDAx
IDAwIDwwZj4gMGIgZTkgNzkgZmYgZmYgZmYgODMgZmQgMDQgNzUgMzUgYmYgMDQgMDAgMDAg
MDAgZTggYWQgYTAgZmYgZmYNCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBSU1A6
IDAwMTg6ZmZmZmFlZTUwMjY2M2ExOCBFRkxBR1M6IDAwMDEwMjgyDQpPY3QgMTIgMDA6MjA6
MDEgbGl6YXJkIGtlcm5lbDogUkFYOiAwMDAwMDAwMDAwMDAwMDAwIFJCWDogZmZmZjhmZTMw
NjY1NjNlOCBSQ1g6IDAwMDAwMDAwMDAwMDAwMjcNCk9jdCAxMiAwMDoyMDowMSBsaXphcmQg
a2VybmVsOiBSRFg6IGZmZmY4ZmYxZGZmMjE3ODggUlNJOiAwMDAwMDAwMDAwMDAwMDAxIFJE
STogZmZmZjhmZjFkZmYyMTc4MA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IFJC
UDogMDAwMDAwMDAwMDAwMDAwMiBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiBmZmZmYWVl
NTAyNjYzODk4DQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogUjEwOiBmZmZmZmZm
ZjgyZWI0MGU4IFIxMTogMDAwMDAwMDAwMDAwMDAwMyBSMTI6IDAwMDAwMDAwMDEwMDAwMDAN
Ck9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBSMTM6IDAwMDAwMDAwMDEwMDAwMDAg
UjE0OiAwMDAwMDAwMDAwMDAwMDAwIFIxNTogMDAwMDAwMDAwMDAwMDAwMA0KT2N0IDEyIDAw
OjIwOjAxIGxpemFyZCBrZXJuZWw6IEZTOiAgMDAwMDdmNWUyYzc0NzY0MCgwMDAwKSBHUzpm
ZmZmOGZmMWRmZjAwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCk9jdCAxMiAw
MDoyMDowMSBsaXphcmQga2VybmVsOiBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1Iw
OiAwMDAwMDAwMDgwMDUwMDMzDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogQ1Iy
OiAwMDAwN2Y1ZTJiZjdlNzAwIENSMzogMDAwMDAwMDEwZDJhMjAwMCBDUjQ6IDAwMDAwMDAw
MDA3NTBlZjANCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBQS1JVOiA1NTU1NTU1
NA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IENhbGwgVHJhY2U6DQpPY3QgMTIg
MDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogIDxUQVNLPg0KT2N0IDEyIDAwOjIwOjAxIGxpemFy
ZCBrZXJuZWw6ICA/IF9faW9yZW1hcF9jYWxsZXIrMHgyY2QvMHgzNDANCk9jdCAxMiAwMDoy
MDowMSBsaXphcmQga2VybmVsOiAgPyBfX3dhcm4uY29sZCsweDkzLzB4ZjYNCk9jdCAxMiAw
MDoyMDowMSBsaXphcmQga2VybmVsOiAgPyBfX2lvcmVtYXBfY2FsbGVyKzB4MmNkLzB4MzQw
DQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogID8gcmVwb3J0X2J1ZysweGZmLzB4
MTQwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogID8gY29uc29sZV91bmxvY2sr
MHg5ZC8weDE0MA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICA/IGhhbmRsZV9i
dWcrMHg1OC8weDkwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogID8gZXhjX2lu
dmFsaWRfb3ArMHgxNy8weDcwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogID8g
YXNtX2V4Y19pbnZhbGlkX29wKzB4MWEvMHgyMA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBr
ZXJuZWw6ICA/IF9faW9yZW1hcF9jYWxsZXIrMHgyY2QvMHgzNDANCk9jdCAxMiAwMDoyMDow
MSBsaXphcmQga2VybmVsOiAgPyBfX2lvcmVtYXBfY2FsbGVyKzB4MmNkLzB4MzQwDQpPY3Qg
MTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogID8gZGV2bV9pb3JlbWFwKzB4NDkvMHg4MA0K
T2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICA/IF9fcGZ4X2Rldm1faW9yZW1hcF9y
ZWxlYXNlKzB4MTAvMHgxMA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICBkZXZt
X2lvcmVtYXArMHg0OS8weDgwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogIGFt
ZF9wbWNfcHJvYmUrMHg0MWEvMHg1YWMgW2FtZF9wbWNdDQpPY3QgMTIgMDA6MjA6MDEgbGl6
YXJkIGtlcm5lbDogIHBsYXRmb3JtX3Byb2JlKzB4NDEvMHhhMA0KT2N0IDEyIDAwOjIwOjAx
IGxpemFyZCBrZXJuZWw6ICByZWFsbHlfcHJvYmUrMHhkYi8weDM0MA0KT2N0IDEyIDAwOjIw
OjAxIGxpemFyZCBrZXJuZWw6ICA/IHBtX3J1bnRpbWVfYmFycmllcisweDU0LzB4OTANCk9j
dCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiAgPyBfX3BmeF9fX2RyaXZlcl9hdHRhY2gr
MHgxMC8weDEwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogIF9fZHJpdmVyX3By
b2JlX2RldmljZSsweDc4LzB4MTEwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDog
IGRyaXZlcl9wcm9iZV9kZXZpY2UrMHgxZi8weGEwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJk
IGtlcm5lbDogIF9fZHJpdmVyX2F0dGFjaCsweGJhLzB4MWMwDQpPY3QgMTIgMDA6MjA6MDEg
bGl6YXJkIGtlcm5lbDogIGJ1c19mb3JfZWFjaF9kZXYrMHg4Yy8weGUwDQpPY3QgMTIgMDA6
MjA6MDEgbGl6YXJkIGtlcm5lbDogIGJ1c19hZGRfZHJpdmVyKzB4MTEyLzB4MWYwDQpPY3Qg
MTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogIGRyaXZlcl9yZWdpc3RlcisweDcyLzB4ZDAN
Ck9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiAgPyBfX3BmeF9hbWRfcG1jX2RyaXZl
cl9pbml0KzB4MTAvMHgxMCBbYW1kX3BtY10NCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2Vy
bmVsOiAgZG9fb25lX2luaXRjYWxsKzB4NTgvMHgzMTANCk9jdCAxMiAwMDoyMDowMSBsaXph
cmQga2VybmVsOiAgZG9faW5pdF9tb2R1bGUrMHg2MC8weDIzMA0KT2N0IDEyIDAwOjIwOjAx
IGxpemFyZCBrZXJuZWw6ICBpbml0X21vZHVsZV9mcm9tX2ZpbGUrMHg4Ni8weGMwDQpPY3Qg
MTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogIGlkZW1wb3RlbnRfaW5pdF9tb2R1bGUrMHgx
MWUvMHgzMTANCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiAgX194NjRfc3lzX2Zp
bml0X21vZHVsZSsweDVlLzB4YjANCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiAg
ZG9fc3lzY2FsbF82NCsweDgyLzB4MTkwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5l
bDogID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJlZjUNCk9jdCAxMiAwMDoy
MDowMSBsaXphcmQga2VybmVsOiAgPyBfX2NvdW50X21lbWNnX2V2ZW50cysweDUzLzB4ZjAN
Ck9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiAgPyBzcnNvX2FsaWFzX3JldHVybl90
aHVuaysweDUvMHhmYmVmNQ0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICA/IGNv
dW50X21lbWNnX2V2ZW50cy5jb25zdHByb3AuMCsweDFhLzB4MzANCk9jdCAxMiAwMDoyMDow
MSBsaXphcmQga2VybmVsOiAgPyBzcnNvX2FsaWFzX3JldHVybl90aHVuaysweDUvMHhmYmVm
NQ0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICA/IGhhbmRsZV9tbV9mYXVsdCsw
eDFiYi8weDJjMA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICA/IHNyc29fYWxp
YXNfcmV0dXJuX3RodW5rKzB4NS8weGZiZWY1DQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtl
cm5lbDogID8gZG9fdXNlcl9hZGRyX2ZhdWx0KzB4MzZjLzB4NjIwDQpPY3QgMTIgMDA6MjA6
MDEgbGl6YXJkIGtlcm5lbDogID8gc3Jzb19hbGlhc19yZXR1cm5fdGh1bmsrMHg1LzB4ZmJl
ZjUNCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiAgPyBzcnNvX2FsaWFzX3JldHVy
bl90aHVuaysweDUvMHhmYmVmNQ0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6ICBl
bnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg3Ni8weDdlDQpPY3QgMTIgMDA6MjA6
MDEgbGl6YXJkIGtlcm5lbDogUklQOiAwMDMzOjB4N2Y1ZTJiZjFiMGU5DQpPY3QgMTIgMDA6
MjA6MDEgbGl6YXJkIGtlcm5lbDogQ29kZTogZmYgYzMgNjYgMmUgMGYgMWYgODQgMDAgMDAg
MDAgMDAgMDAgMGYgMWYgNDQgMDAgMDAgNDggODkgZjggNDggODkgZjcgNDggODkgZDYgNDgg
ODkgY2EgNGQgODkgYzIgNGQgODkgYzggNGMgOGIgNGMgMjQgMDggMGYgMDUgPDQ4PiAzZCAw
MSBmMCBmZiBmZiA3MyAwMSBjMyA0OCA4YiAwZCBmZiA1YyAwZCAwMCBmNyBkOCA2NCA4OSAw
MSA0OA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IFJTUDogMDAyYjowMDAwN2Zm
ZGMxMDIwNzY4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAxMzkN
Ck9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEg
UkJYOiAwMDAwNTViYzZjZWMyZTcwIFJDWDogMDAwMDdmNWUyYmYxYjBlOQ0KT2N0IDEyIDAw
OjIwOjAxIGxpemFyZCBrZXJuZWw6IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6IDAwMDA1
NWJjNmNlYzMyMjAgUkRJOiAwMDAwMDAwMDAwMDAwMDAzDQpPY3QgMTIgMDA6MjA6MDEgbGl6
YXJkIGtlcm5lbDogUkJQOiAwMDAwMDAwMDAwMDAwMDAwIFIwODogMDAwMDdmNWUyYmZmMWIy
MCBSMDk6IDAwMDAwMDAwMDAwMDAwMDANCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVs
OiBSMTA6IDAwMDAwMDAwMDAwMDAwNDAgUjExOiAwMDAwMDAwMDAwMDAwMjQ2IFIxMjogMDAw
MDU1YmM2Y2VjMzIyMA0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IFIxMzogMDAw
MDAwMDAwMDA0MDAwMCBSMTQ6IDAwMDA1NWJjNmNlYzJmMTAgUjE1OiAwMDAwMDAwMDAwMDAw
MDAwDQpPY3QgMTIgMDA6MjA6MDEgbGl6YXJkIGtlcm5lbDogIDwvVEFTSz4NCk9jdCAxMiAw
MDoyMDowMSBsaXphcmQga2VybmVsOiAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAw
IF0tLS0NCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVsOiBhbWRfcG1jX3MyZF9pbml0
IGRzdmE6IDAwMDAwMDAwMDAwMDAwMDANCk9jdCAxMiAwMDoyMDowMSBsaXphcmQga2VybmVs
OiBhbWRfcG1jX3Byb2JlOiA2YQ0KT2N0IDEyIDAwOjIwOjAxIGxpemFyZCBrZXJuZWw6IGFt
ZF9wbWMgQU1ESTAwMDk6MDA6IHByb2JlIHdpdGggZHJpdmVyIGFtZF9wbWMgZmFpbGVkIHdp
dGggZXJyb3IgLTEyDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQoNCg0KVGhhbmsgeW91LA0KQ29yZXkN
Cg==

