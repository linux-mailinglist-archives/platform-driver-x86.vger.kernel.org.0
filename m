Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF121D580C
	for <lists+platform-driver-x86@lfdr.de>; Fri, 15 May 2020 19:36:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgEORgH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 15 May 2020 13:36:07 -0400
Received: from sonic314-13.consmr.mail.bf2.yahoo.com ([74.6.132.123]:38146
        "EHLO sonic314-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726231AbgEORgH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 15 May 2020 13:36:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1589564164; bh=HdxZ1uxm6Y2i4ywMUGEE/9hFU6h6QDm6JeN8vrKPM/c=; h=Date:From:To:Subject:References:From:Subject; b=UsZcAtV2nlySP8ne4Ld1+zvvNTFtrLo/MiXTfeXZPCfNpdJ8kliCcnwVwUkaKeGjZXyAeUJcLUqqj67yc6mg0Gn7M7qbiDC2zduLRhqvsJFheHUVhRHQFFYVQ6dQ+9rQ4ht1DQosEnaYIyWmR3qd+w2NIIYqprEFhTpz/JyMH4jXNuvGO274khd6vl16SHgoUHrd2HxNvfJ37S2FoOyFlBq5dIcrKnq7D82dwRUur0lRYxoIh3tSb/l7JLsCeZAIsQe88KsMl+eyoBATkqVU1ZQVnsCBZJEBUDIGFhawBQK3pUoiXYmiJG9UxKE80gDR9D+L7VMU2Q7+6k8hgeydRg==
X-YMail-OSG: Kr4geysVM1mcWZHh144hLuj0I1F85oESdcewuYszgZxOCb4FLktIfJG.ZpAIkjI
 G10O2B2JGlbUZ_d5aSF2I8NwdUaswaT2oXlxDFhM4Q8fI1AS6m_NywivdVZpe.cctT_gpZmwrmO1
 qUUQ36oW4upWt_nnwMP71ky4hsNUQS5NYs1vbzc3zuTcOMAzWCOa.kSsSCvcU_g1eejGV1qbIzC3
 oxC4wGs0QeIQOkmfgfEk.XFEOp8Ql_YYNIrrAFSHy.lByrFd2fKUZaczX339BUcPPRskuQWxg_oQ
 h1_uTklseRFGYcLlaQ3rRujafERCKme1X4Ou9dJDf_VfkPMviGLv0VpEpVit0YerffiG7hPzmhXH
 xLR0.ip_R_oQq1rjoTO.T9e6syOQGQJtcI.KmL576ey2XTwF04m0UlWbSMSwJ2ShlM6sgD4cWgJ1
 wjqCwCHubugmStYaIgcUU37KExewmCnQfT6uMOt.UIoDvnLIdeQlxgk0ZuRuwJ0FRdRYRE4G8aXU
 wVGt1QHQH8_j8d_42TvPcuYANn37LE4mV70huyKMvQIfScDbo1h6amJ4CnwTRbFbzIyr9WrDIqo8
 YpAiatnm3Zy24uUqSSKGFgdvaTEuwcSg.Qr7BuX3CX95t7TUqUBkH354U7fSCO9pTPSc1_4dSz7T
 VvYHk9snnkHHstYXR5QF4ZIjdf1S04VYwRfPCld5tBZc8L4i6xI_z12kHqp6hY3Qv_Q51pzN5q_9
 PKEdkOFYfpuBfn0Dg5XZ_eY908ck2Izk8y67yG0_48zZ0pNroKX3ANBjxVZZVSPbVpZMJQPpx9lg
 sQ8BsgJzR41j2oNVoo8RU26.bWn7eNl632ov8Xq4s1thzZF6GbR.jhPxrehXh9XG3u59Dk_2O5uh
 J9jJOM92jRVeQ5dEJLnLJCpD8bQ3Y4BhSPLSF8CtnfpEJenxyXcKkpgJufBFVmvD1tTDvPIH7sJb
 9.Id2Ys3H0NS8PP.ic1T2s9kYMZ1aZj8Hm8emplKJBX6PpiRQbhbAAS2Sh2gEj0T6QYzPhAOK7H8
 optOnzuAh46rElS4U95RfGuT7LmFw11fCZ6av9phFAdoIyBuiYWJw38iRTyB5EtAxnYtIqQVpANM
 0LCwYRB7oJOMIXmW0dHAVshKfIiBsNd.phEuQ2B7VHrIBtEsq8VmbP0ZF5f.fT69hFIGuqQLHKNr
 g5h2qDmFLWFzGBnnkKxi0yGIn6piXcKHwWyxfq1uVsXrYPrZPdpEklkpPaV.O.Uj9KnPhQ_jcxKi
 cLf25P9QuqOSzMkW4IAAPiSwSyA0CJjERDGBFcQabafyX8HgAHNTfmuR5JauvCq_p2gUvUDW7HZD
 kvQ72AGcr.3TFrgpT5Hinz.MNh.JxaaHR
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.bf2.yahoo.com with HTTP; Fri, 15 May 2020 17:36:04 +0000
Date:   Fri, 15 May 2020 17:36:01 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Message-ID: <1505028180.591737.1589564161284@mail.yahoo.com>
Subject: Low Latency Tolerance preventing Intel Package from entering deep
 sleep states
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
References: <1505028180.591737.1589564161284.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15941 YMailNorrin Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:76.0) Gecko/20100101 Firefox/76.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SGkuIEkgaG9wZSB0aGlzIGlzIHRoZSByaWdodCBmb3J1bSB0byByYWlzZSB0aGlzLi4uCgpGb3Ig
YSB3aGlsZSBJIGhhdmUgbm90aWNlZCB0aGF0IG15IENQVSAoaTktOTg4MEggaW4gYSBMZW5vdm8g
WDEgRXh0cmVtZSBHZW4yKSBuZXZlciBlbnRlcnMgYW55IHNsZWVwIG1vZGUgYmVsb3cgcGMyLgoo
Q29uZmlybWVkIHdpdGggcG93ZXJ0b3AgYW5kIC9zeXMva2VybmVsL2RlYnVnL3BtY19jb3JlL3Bh
Y2thZ2VfY3N0YXRlX3Nob3cpCgpJbnRlcmVzdGluZ2x5IHRoZSBDUFUgKmNhbiogcmVhY2hlcnMg
ZGVlcGVyIEMgc3RhdGVzICphZnRlciogYSByZXN1bWUgZnJvbSBzbGVlcCAoZWl0aGVyIFMwaXgg
b3IgUzMsIGkuZS4gZnJlZXplIG9yIG1lbSkuCgpUaGlzIGFydGljbGUgZmluYWxseSBwb2ludGVk
IG1lIGluIHRoZSByaWdodCBkaXJlY3Rpb246IGh0dHBzOi8vMDEub3JnL2Jsb2dzL3F3YW5nNTkv
MjAyMC9saW51eC1zMGl4LXRyb3VibGVzaG9vdGluZwoKU29tZWhvdyBTT1VUSFBPUlRfQSBpcyBy
ZXF1ZXN0aW5nIGEgbWF4IGxhdGVuY3kgb2YgMSB1cy4KVGhlcmUgYXJlIG5vIGV4dGVybmFsIGRl
dmljZXMgYXR0YWNoZWQuIAoKVGhpcyBpcyBiZWZvcmUgYSByZXN1bWU6CgokIGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy9wbWNfY29yZS9sdHJfc2hvdwpTT1VUSFBPUlRfQcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDg4MDE4
YzAxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAxMDI0wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNub29wKG5zKTogMzI3NjjCoMKgwqDCoMKgwqDCoMKgwqDCoCA8LS0tLS0t
LQpTT1VUSFBPUlRfQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9v
cChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApTQVRBwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBM
VFI6IFJBVzogMHgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9v
cChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU25vb3AobnMpOiAwwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAKR0lHQUJJVF9FVEhFUk5FVMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgClhI
Q0nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDEzZmbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9v
cChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApSZXNlcnZlZMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjog
UkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5z
KTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCDCoApNRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDgwMDA4
MDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDC
oApFVkHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgClNPVVRIUE9SVF9D
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
TFRSOiBSQVc6IDB4OWY0MDlmNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMp
OiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIMKgCkhEX0FVRElPwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKg
CkNOVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzogMHgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAKTFBTU8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBO
b24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNub29wKG5zKTog
MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgClNPVVRIUE9SVF9EwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4OGM1
NDhjNTTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDI3NTI1MTLCoMKgwqDC
oMKgwqDCoMKgwqAgU25vb3AobnMpOiAyNzUyNTEywqDCoMKgwqDCoMKgwqAgwqAKU09VVEhQT1JU
X0XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBMVFI6IFJBVzogMHgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1T
bm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU25vb3AobnMpOiAwwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAKQ0FNRVJBwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCDCoApFU1BJwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzogMHgwwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAKU0ND
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBT
bm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApJU0jCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24t
U25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgClVGU1gywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4
MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIMKgCkVNTUPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApX
SUdJR8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBT
bm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApDVVJSRU5UX1BMQVRGT1JN
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzog
MHg0MDIwMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCDCoApBR0dSRUdBVEVEX1NZU1RFTcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDdmYmZkZmXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChu
cyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoAoKTm90aWNlIHRoZSAxMDAwbnMgbWF4
IGxhdGVuY3kgcmVxdWlyZW1lbnQgZm9yIFNPVVRIUE9SVF9BLgoKSWdub3JpbmcgU09VVEhQT1JU
X0EgdmlhIC9zeXMva2VybmVsL2RlYnVnL3BtY19jb3JlL2x0cl9pZ25vcmUgc3Vic2VxdWVudGx5
IGFsbG93cyB0aGUgQ1BVIHRvIHJlYWNoIGRlZXAgc2xlZXAgc3RhdGVzLgoKQWZ0ZXIgYSByZXN1
bWUgaXQgbG9va3MgbGlrZSBzdWRkZW5seSBTT1VUSFBPUlRfQyBpcyBhY3RpdmUgYW5kIHdpdGgg
YSBsZXNzIHRpZ2h0IGxhdGVuY3kgcmVxdWlyZW1lbnQ6CgokIGNhdCAvc3lzL2tlcm5lbC9kZWJ1
Zy9wbWNfY29yZS9sdHJfc2hvdwpTT1VUSFBPUlRfQcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDgwMTBjMDHCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDwtLS0tLS0t
LQpTT1VUSFBPUlRfQsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9v
cChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApTQVRBwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBM
VFI6IFJBVzogMHgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9v
cChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU25vb3AobnMpOiAwwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAKR0lHQUJJVF9FVEhFUk5FVMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgClhI
Q0nCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDEzZmbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9v
cChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApSZXNlcnZlZMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjog
UkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5z
KTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCDCoApNRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDgwMDA4
MDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDC
oApFVkHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgClNPVVRIUE9SVF9D
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
TFRSOiBSQVc6IDB4ODg0Njg4NDbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6
IDcxNjgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDcxNjgwwqDCoMKgwqDCoMKg
wqDCoMKgwqAgPC0tLS0tLS0tLQpIRF9BVURJT8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDC
oApDTlbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgCkxQU1PCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
Tm9uLVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6
IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApTT1VUSFBPUlRfRMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAweDhj
NTQ4YzU0wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAyNzUyNTEywqDCoMKg
wqDCoMKgwqDCoMKgIFNub29wKG5zKTogMjc1MjUxMsKgwqDCoMKgwqDCoMKgIMKgClNPVVRIUE9S
VF9FwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24t
U25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgCkNBTUVSQcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzogMHgw
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgwqAKRVNQScKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6IDB4MMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgClND
Q8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzogMHgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
U25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAKSVNIwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIExUUjogUkFXOiAweDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9u
LVNub29wKG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCDCoApVRlNYMsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIExUUjogUkFXOiAw
eDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTm9uLVNub29wKG5zKTogMMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCDCoApFTU1DwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzogMHgwwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAK
V0lHSUfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzogMHgwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
U25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgwqAKQ1VSUkVOVF9QTEFURk9S
TcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgTFRSOiBSQVc6
IDB4NDAyMDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIE5vbi1Tbm9vcChucyk6IDDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgwqAKQUdHUkVHQVRFRF9TWVNURU3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBMVFI6IFJBVzogMHg5MDQ4MjTCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBOb24tU25vb3AobnMpOiAwwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNub29w
KG5zKTogMMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIMKgCgpEb2VzIGFueWJvZHkga25vdyB3
aGF0J3MgZ29pbmcgb24gb3IgaG93IHRvIGRlYnVnIHRoaXMgZnVydGhlcj8KCkFzIHN0YXRlZCBh
Ym92ZSwgSSB3YXMgYWJsZSB0byB3b3JrIGFyb3VuZCB0aGlzIHByb2JsZW0gYnkgaWdub3Jpbmcg
U09VVEhQT1JUX0EgdmlhIC9zeXMva2VybmVsL2RlYnVnL3BtY19jb3JlL2x0cl9pZ25vcmUuClRo
ZXJlIGhhcyB0byBiZSBhIGJldHRlciB3YXksIGFuZCBJJ20gc3VyZSBJJ20gbm90IHRoZSBvbmx5
IG9uZSBydW5uaW5nIGludG8gdGhpcy4KClRoYW5rcy4KCi0tIExhcnMK
