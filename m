Return-Path: <platform-driver-x86+bounces-11381-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5B4A9A9CA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Apr 2025 12:16:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A763E171B7A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Apr 2025 10:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CEC722128F;
	Thu, 24 Apr 2025 10:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Uc1LIfFS"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8601FBCBE
	for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 10:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489787; cv=none; b=UHsAWW+9UypA7MrKm5Y/73JAb/4Uc7yaYamdteDZAQKJRqjwmprMYFA4LRaSbxnDQR5PbSSgGWibXnlYd5di0+P7YqSjHVq09qXKBdNqkzFclHttvX0WV1AtKsLqG/GYUcYjwPnQZh0Wc9t8wJfYx7ddVsNm1PlqWtT/u1pFBso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489787; c=relaxed/simple;
	bh=7yeb9KlYqqGD/ZehSL+UaW5Mu1Sv69xuG2EIsa3T9HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OoS4nOUry4qx2Ro+6C2REkk+Nlf1BspJRDNAaXqZxmEnWqqybNKRi/Yau14guu/voBAE886T0UjpjW3pEi0Q3CDmoIRNB4e5Ag6n0phXKt4teQpeL4jqwA1HGbt/OLGe2R2Bh+3rT4UkviiCE91QSBb9r2/l6Y8FwH2bmO0qKDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Uc1LIfFS; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aaecf50578eso127917566b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Apr 2025 03:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745489784; x=1746094584; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7yeb9KlYqqGD/ZehSL+UaW5Mu1Sv69xuG2EIsa3T9HE=;
        b=Uc1LIfFSDIHNQ23wMS5iHv24uVL5h9lN210nzT7FaSizPbik0nQTdA9QkYqCPBx4BG
         lko+Fozdla4PPvEkvWF90NLY4byvoeV/wC8ea15qjAF+pqysPNTaJf5Nm6+H4mHfnsL+
         XNruFElKeCgdQszJHWaqhOXtVXMIRglK18ueuTFOY6riRw3u6uxJLR1G1FUPiZbYctZx
         QanAHAbVecEhPTp12dAgBCbZZx2Mpw6srdJ5MubqXxWAvMI1+Lnz7tfRQ8GryKLlCKU0
         eZLzaQ0nGc4fqSq6nqpw0BE6XRGe29/3q+akS9bdzgVSlde1Aoqyuy/mUC/dMHZQgHAS
         NVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745489784; x=1746094584;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7yeb9KlYqqGD/ZehSL+UaW5Mu1Sv69xuG2EIsa3T9HE=;
        b=MIRa3sRaWceRJn0LNMZ+EZb/DXXX9qoGRwUzzxf3L0VgVljj0sZ/IdE6MZ64vIMFY8
         z0oH9VY7z3MXAXjNM7aJo+ZZjNrglNbuvHFtha6xMkVA54IldyammqluTtegsU246Y7H
         NfOF2KCbBw2OiL3VFFMEy8n6EIq1rF2vHNuTl/jVDKqbxZrfbgs8yxpO0IO9RCqp1jDO
         ddYWf/NAXlFsay0avRYCbUw7y54Sz6ha47Z5vRf6xIX2QI5uDV3NUPItwFoHbdmv2Srd
         RTjmWY2U5JopAl8n7KLSM62kKUkKx2H9KhXblOPd53zzI4rTbFsFJrO+ckh7yyR4K+ih
         Blow==
X-Forwarded-Encrypted: i=1; AJvYcCXJ+usXv31FX+zXpIDzA23eLmVFTixT9sh54zR3dI2Oqplt9G1o7GtsTr41omPVraAx4/YTcgIpgTXSK16Lc7ezW202@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6w8dMuM4IhxQirpziTdUPM4BDrgxm3xyuBaCMif86qhcoTkVq
	DEZvfZmOSsZTTJN6iSvMsmVgydQCb5zAqjH9GUoCbMsasWWZBGYgGxxD2OMIHls=
X-Gm-Gg: ASbGncv8OsZhWJJ57kzsW49esgaVm6JgQNDoSm1gJP94A8J4NKSYnhLxbx7TbOco2rE
	7ixHb0BIoY/3crH7/so4iXNSiG4KtcgPkzjAK1jDBxbYBiGnMxp5pM+azVJSDQVMIUUSyi3S/Qn
	zmmCTQGYvvUqcDjl2jkSJFF0rY1jcJg7190Y/dK3fylbgBqFad6uv7207PFn7vROv574KLyjC56
	/nQnPf4B6tkcX/pLyErTfDLhmBmGbX5oPBFDduDnxTwW2oGdMqUzMw01bktkkrNNLEyTsJHJWWP
	ELqcQF1AT4WTk+3oBcw50CBhgB2FfsfLHCQp6+USTOpD1WNcyQTFrpAQoCX484yAt3bE99IBij0
	Py3yelJjvvUvI3Gy1gSM5poI5i8oGkvPg5O815BEFaLBIvx+dcKT+1gFttpWl7P4aZw==
X-Google-Smtp-Source: AGHT+IEm0tqe1Y6NrZYwZAPw8mP7gfJu/rS857Ou/Nw00s8avdEvZrPp9A2s5JSOi+lWLJhyNrhoNw==
X-Received: by 2002:a17:907:3f9e:b0:aca:d4f6:440d with SMTP id a640c23a62f3a-ace5723afaemr234662066b.17.1745489783619;
        Thu, 24 Apr 2025 03:16:23 -0700 (PDT)
Received: from ?IPV6:2003:e5:870f:e000:6c64:75fd:2c51:3fef? (p200300e5870fe0006c6475fd2c513fef.dip0.t-ipconnect.de. [2003:e5:870f:e000:6c64:75fd:2c51:3fef])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c5e9ccsm85183966b.178.2025.04.24.03.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 03:16:23 -0700 (PDT)
Message-ID: <054eec5c-1f36-454b-9220-b7f975d2717b@suse.com>
Date: Thu, 24 Apr 2025 12:16:21 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 14/34] x86/msr: refactor
 pv_cpu_ops.write_msr{_safe}()
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 wei.liu@kernel.org, ajay.kaher@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
 pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
 luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-15-xin@zytor.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <20250422082216.1954310-15-xin@zytor.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pWVoNv7WLwVBgb4mHgM007fn"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pWVoNv7WLwVBgb4mHgM007fn
Content-Type: multipart/mixed; boundary="------------b3S9hpqWlrcvhJkKaKAw7Czp";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: "Xin Li (Intel)" <xin@zytor.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-edac@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, netdev@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org,
 andrew.cooper3@citrix.com, peterz@infradead.org, namhyung@kernel.org,
 mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@kernel.org,
 irogers@google.com, adrian.hunter@intel.com, kan.liang@linux.intel.com,
 wei.liu@kernel.org, ajay.kaher@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com,
 pbonzini@redhat.com, vkuznets@redhat.com, seanjc@google.com,
 luto@kernel.org, boris.ostrovsky@oracle.com, kys@microsoft.com,
 haiyangz@microsoft.com, decui@microsoft.com
Message-ID: <054eec5c-1f36-454b-9220-b7f975d2717b@suse.com>
Subject: Re: [RFC PATCH v2 14/34] x86/msr: refactor
 pv_cpu_ops.write_msr{_safe}()
References: <20250422082216.1954310-1-xin@zytor.com>
 <20250422082216.1954310-15-xin@zytor.com>
In-Reply-To: <20250422082216.1954310-15-xin@zytor.com>

--------------b3S9hpqWlrcvhJkKaKAw7Czp
Content-Type: multipart/mixed; boundary="------------BppMQx0iku6Wc7Pk9I10DjXt"

--------------BppMQx0iku6Wc7Pk9I10DjXt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjIuMDQuMjUgMTA6MjEsIFhpbiBMaSAoSW50ZWwpIHdyb3RlOg0KPiBBbiBNU1IgdmFs
dWUgaXMgcmVwcmVzZW50ZWQgYXMgYSA2NC1iaXQgdW5zaWduZWQgaW50ZWdlciwgd2l0aCBl
eGlzdGluZw0KPiBNU1IgaW5zdHJ1Y3Rpb25zIHN0b3JpbmcgaXQgaW4gRURYOkVBWCBhcyB0
d28gMzItYml0IHNlZ21lbnRzLg0KPiANCj4gVGhlIG5ldyBpbW1lZGlhdGUgZm9ybSBNU1Ig
aW5zdHJ1Y3Rpb25zLCBob3dldmVyLCB1dGlsaXplIGEgNjQtYml0DQo+IGdlbmVyYWwtcHVy
cG9zZSByZWdpc3RlciB0byBzdG9yZSB0aGUgTVNSIHZhbHVlLiAgVG8gdW5pZnkgdGhlIHVz
YWdlIG9mDQo+IGFsbCBNU1IgaW5zdHJ1Y3Rpb25zLCBsZXQgdGhlIGRlZmF1bHQgTVNSIGFj
Y2VzcyBBUElzIGFjY2VwdCBhbiBNU1INCj4gdmFsdWUgYXMgYSBzaW5nbGUgNjQtYml0IGFy
Z3VtZW50IGluc3RlYWQgb2YgdHdvIDMyLWJpdCBzZWdtZW50cy4NCj4gDQo+IFRoZSBkdWFs
IDMyLWJpdCBBUElzIGFyZSBzdGlsbCBhdmFpbGFibGUgYXMgY29udmVuaWVudCB3cmFwcGVy
cyBvdmVyIHRoZQ0KPiBBUElzIHRoYXQgaGFuZGxlIGFuIE1TUiB2YWx1ZSBhcyBhIHNpbmds
ZSA2NC1iaXQgYXJndW1lbnQuDQo+IA0KPiBUaGUgZm9sbG93aW5nIGlsbHVzdHJhdGVzIHRo
ZSB1cGRhdGVkIGRlcml2YXRpb24gb2YgdGhlIE1TUiB3cml0ZSBBUElzOg0KPiANCj4gICAg
ICAgICAgICAgICAgICAgX193cm1zcnEodTMyIG1zciwgdTY0IHZhbCkNCj4gICAgICAgICAg
ICAgICAgICAgICAvICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAgICAgICAgICAgICAg
LyAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAgICAgICAgICBuYXRpdmVfd3Jtc3JxKG1z
ciwgdmFsKSAgICBuYXRpdmVfd3Jtc3IobXNyLCBsb3csIGhpZ2gpDQo+ICAgICAgICAgICAg
ICAgICAgIHwNCj4gICAgICAgICAgICAgICAgICAgfA0KPiAgICAgICAgICAgICBuYXRpdmVf
d3JpdGVfbXNyKG1zciwgdmFsKQ0KPiAgICAgICAgICAgICAgICAgIC8gICAgICAgICAgXA0K
PiAgICAgICAgICAgICAgICAgLyAgICAgICAgICAgIFwNCj4gICAgICAgICB3cm1zcnEobXNy
LCB2YWwpICAgIHdybXNyKG1zciwgbG93LCBoaWdoKQ0KPiANCj4gV2hlbiBDT05GSUdfUEFS
QVZJUlQgaXMgZW5hYmxlZCwgd3Jtc3JxKCkgYW5kIHdybXNyKCkgYXJlIGRlZmluZWQgb24g
dG9wDQo+IG9mIHBhcmF2aXJ0X3dyaXRlX21zcigpOg0KPiANCj4gICAgICAgICAgICAgIHBh
cmF2aXJ0X3dyaXRlX21zcih1MzIgbXNyLCB1NjQgdmFsKQ0KPiAgICAgICAgICAgICAgICAg
LyAgICAgICAgICAgICBcDQo+ICAgICAgICAgICAgICAgIC8gICAgICAgICAgICAgICBcDQo+
ICAgICAgICAgICAgd3Jtc3JxKG1zciwgdmFsKSAgICB3cm1zcihtc3IsIGxvdywgaGlnaCkN
Cj4gDQo+IHBhcmF2aXJ0X3dyaXRlX21zcigpIGludm9rZXMgY3B1LndyaXRlX21zcihtc3Is
IHZhbCksIGFuIGluZGlyZWN0IGxheWVyDQo+IG9mIHB2X29wcyBNU1Igd3JpdGUgY2FsbDoN
Cj4gDQo+ICAgICAgSWYgb24gbmF0aXZlOg0KPiANCj4gICAgICAgICAgICAgIGNwdS53cml0
ZV9tc3IgPSBuYXRpdmVfd3JpdGVfbXNyDQo+IA0KPiAgICAgIElmIG9uIFhlbjoNCj4gDQo+
ICAgICAgICAgICAgICBjcHUud3JpdGVfbXNyID0geGVuX3dyaXRlX21zcg0KPiANCj4gVGhl
cmVmb3JlLCByZWZhY3RvciBwdl9jcHVfb3BzLndyaXRlX21zcntfc2FmZX0oKSB0byBhY2Nl
cHQgYW4gTVNSIHZhbHVlDQo+IGluIGEgc2luZ2xlIHU2NCBhcmd1bWVudCwgcmVwbGFjaW5n
IHRoZSBjdXJyZW50IGR1YWwgdTMyIGFyZ3VtZW50cy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogWGluIExpIChJbnRlbCkg
PHhpbkB6eXRvci5jb20+DQoNClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+DQoNCg0KSnVlcmdlbg0K
--------------BppMQx0iku6Wc7Pk9I10DjXt
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------BppMQx0iku6Wc7Pk9I10DjXt--

--------------b3S9hpqWlrcvhJkKaKAw7Czp--

--------------pWVoNv7WLwVBgb4mHgM007fn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmgKD3UFAwAAAAAACgkQsN6d1ii/Ey8e
hQf+IyaGfaANfYLf1gQb5JWLRkUgyz/njZG+UwVqy+rsaIYD+pEhdKw5SCCnD0k0rYwGX+humDna
09S/SBtqSMJ6op9sp+0UMcix59tVByTG+d8H/RBLf2IWAPI0XKU6b3m310+4u3nyopkvf/rjeJWt
SfFxXPA+0soMqiPgLiqLfQOcImvL7By/Ic4k7iCcQ8r2tUX4e49qE7Ceu6m2OhnWo7gegbiK3g3a
o5e9jvL464VbQ0jA76OH8KY4kcOV8y0TQXP2dC3WWvN7O1iNoEL9KIIg3/K4iTHOY10ayy/UVXOd
NK1TCl85M2LuLTmu8q4pp9E3JwXRobXErwdZe+JYvQ==
=xegw
-----END PGP SIGNATURE-----

--------------pWVoNv7WLwVBgb4mHgM007fn--

