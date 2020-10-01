Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C0F327FEAF
	for <lists+platform-driver-x86@lfdr.de>; Thu,  1 Oct 2020 13:54:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731670AbgJALyN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 1 Oct 2020 07:54:13 -0400
Received: from sonic302-20.consmr.mail.ir2.yahoo.com ([87.248.110.83]:40719
        "EHLO sonic302-20.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731767AbgJALyM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Oct 2020 07:54:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1601553251; bh=sTPe8ZyzoohU+dH6WLO8xT9jxZB2XadCqVZVCpoFGIY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=JuCxdoFH/apCmUl4qU99ARZGTaL5mf6RTIxae7nSH2UJuXrPWWImlI0Cu6V6/NL6XxFapKYTIIszCOYx5UTMo4rR0+Kj6FOTx5pWqLSD/xDEqosugADNWRtBHxz9sGQoBI/Y6Qya1mlRYxWs5sVOTL8gkgPytFhZJ9O1ezLXr23gibtU1XRJqHykKHuMZfK0P1/y03Axlg2LgdGlTOHaW24Di66QC7ZV+gA0AaY4MRV7q+4kYlYa8/VZqQvIEWrBZNqdPcgETfrb6wIRX189dBWoHV//nPx+9PHUBS59clmQShh02E2tjm0u5Yw6JtUAyC+bqgF5aU/4+3alo+vA/g==
X-YMail-OSG: B0iA1xMVM1lVXHXbSJMRDUh.O5FXQ8LGLpYHdJ1sZvd7Mfaf6xFn0L8ZMTG1YxT
 y44Jg8IZaF.ubYjovDryBLlD2Q5oU09YIDtro6_2a7U6c2Q9RaHqUQIQDc0GSiJVeg5.DsU1PrSs
 79i9MkC1zFv2YT0rNkPKCKtKhAVvfV9z.TCIBmg0Mf8aRlYJRabHnv49pAuNPqLR0CYE97hMOrhY
 ItLqZwozg4Bzsi14w20dSHrRpr3nDWoiHwMNf96qsAnFRewflOSJgr9prrgnddc6SG67mPj.AYuP
 a4m4tQzCK5DInalDaj6Kj4nyXCe4_wSTLmuRUAQf1BHQDvNUimIEiKVtapKOIWZAlJ4zuyGgkTFV
 O6FDqg.uV7O9.vjVB9vzsmyRKCoBsOeiytVtFc6B_tLWdW7V5DNZG7xMmkCFOGootpX1QEOcyO8u
 rjyn3qsVOTE7RQV1OD3UQb5IKti5HKv._9JWS8HlwU8WXT5idJXanRcXg_p2r_.h.5LRuVDYfUxk
 IZUdi0cozPiymiuU5rvZr8JR3HHSH8uXp6BAfexYGf9JdxdAAelqo_QREYPbIRVH1pW7yb.1PuUJ
 z7VVaFCgXBxgmxJPUwVriNYMbKPLdBHQeDA.5ADq9cCLeJglL7Kph4exDbWV627zaNewHI3vxxIR
 be.4zZRAG0Hz3UDNv3eNtXoUIv2a6.FzbwOc8RgaWKjLLVXupoVOlBEcfZGMZmJmtextHeLbROXX
 cF_YN0YKozh0xeKv8tBW5yirL1StpWcoBp4YYF7I2SWptnsUp7ut78lXRvNPq_uxCz21_spuCW56
 .otgxxPDfusPjMKZ0Bq2I0PVCbx1ZmVkj9P4Be4Ht30fd3.GKrBkFkRZWiuEjxHISQcq71Jz9ISy
 JATVR30jSPgeek00Th4s.cMFP1EBah6FXOCtjfkvdX_gnXH9ezhK.Z_t6C1kR4oO8VlDszW.iOD3
 cairu0agc3owkcPTflgj2WiL9ghLE2_EKgDMkNh441YDzHRxhSu9hZngl1zT21ZNfIDOOk3OcOvP
 DsFgyxqJDwAUaDEaL.wcFvXhOi_2N2N0BWCV36hwhFFTii66Z9yX5Sh62jr3e1QCL3yzkUe8pJEv
 EjUwJ16s6UTe0G53IbCrb9C9owj_yfAivV3l2.aPwCdRymevvGuWD8RZdYF6nCJ39fB35l027EbT
 ljvSaoFMJ5Yf6ouc0UkBDZ9w00H4QiFRGfUfP_GQr9cAxyM.GW2MF2Ik4iFnnNytTnrgKpfrXiVj
 yClU5fXwxf8spFCksPFaquWxh1AkqVDJYx73rlpEmH8aecoBQIxKcragJavhbKJKVsz5ZlhskJI7
 dfqEeiC_KuSo4JwKMBJNXGlGqNKYj85WW_nA8LNjAxXlofnn8ioiPlnw736stJHlha2oSVLB.NVe
 AhagBeOGh0SkECkAWcdq_IOdyWV1hLMqNWiFGqBNxA1o_GuZ6XnM_K9GKpgkbgVt.CcP22wna0fK
 DNq5wScX0GmXb62lgtb9EEPSUjGA.Jsrgj_GjwyvxdSa0w_1xEK0K7jv5cd8JMtv9XZG.QkxbnKI
 y1IQm8lMvYTQUP9mYP80wIidAmqGVac.HN7D0MoxIaXIhwn.Z70D8JKa9Nqg8q541JV5VoFw2wQ2
 88bDwUn696hyDeBpDi_W2zfaSjM16jrnYNt88nYfr7vc878sYRMo.BOiAUrfAw5tod69KxVOZZTs
 Jy80oAsrlM6OQF0IWZLE9jCHUH7_0E7FevHYaSPl2cQ6lp2SkMzV1hnxK2QeW2Mn7g7TnhukwU3x
 h.m3eMco8j2oRUl4c85fZuR8LT.kWlWldU1.jClJFduPqXDguosD_FxLU1r905Ie3eqcYdBPQT5E
 E71ilw9feqDuM1Cee6oHrsG4QVbz5OFzQnisGalebhJ5xhYX9XGbuCjR9kRjg56J99oIHQPqBUDO
 zYPeVPOXNHpEKcPv0W0.7NcshaFxpg5fTKQg2JF.v8jmUfbTkz1OAfFpeIHWEzPZlHyo0Vs53a0l
 53PMHfXzZ9V5QbN1yskMyBiMyxHQqoNblNsq05YFy4j5FLi7BwtBh4oue1Ukb36Q656ICUF3jJWp
 _Yr_ZZw85uwHN.0K6yusMoXZzzFBTNf9emzKYT2gidBKCguGqhV27fexRTtYys5ER_cox7en3Lo.
 0J3.ge_Gfq.8t9jp4eQW5SjfSYyYfFpL4ZXEgtN0QpgtQm3xYidTVM0EWl.nmlHzKXjmMEfDmaZ4
 Cnqfs5B3YOGrPE8DZSlfIsm_fiSXk56ETvwvT0.SEbJ3G9CtYdkB8rgfr6SF6VBartojL_JmLV3W
 2OYhWJjs93HKIFPQF.AVy6mqcfYzQZiSq_9j2ICSsWQYXfjVDRvXz1Pv9Bb2lc9qZSRNTMYKFiKG
 Y7fHUjRz3gRH1WIGJb8AoG1luRXmSgpsi7BMsAJJsx5.5Cl1CpqplyclNE6k16_CBu44TfB3dIIw
 rAuqVy1osS8djRo8bBNPPPeKpL6eO5t.KgO8x3Vz37KJDirJGS6ca_avGSoP421jA844feE.QaTh
 R_P_sR9zE3gqsRtFeq6hAwXBLbC.ylyPGWC53xl5jNGIIVQJfidLAt4i6tjAdkBd07cIKknS7V8m
 w9CJYQzqSoAwTDRqIeLgvQ9Kv20SCm9cKFymbycXs5Ib0fhGxXkpVOdyNZkE.pF2ph_yXyRjVaQg
 eyJvK7y9dGv2QRbNHyNJ43A.uidmuQWF79r4XZ2kQInjJRNADNagZsmaoYugXf.wqAIiQ6mFVRly
 J1SxvZ4L3FIuxDh4wZTrFpDIYkdzre.mKRTCjseWsXkuBw.SdqNXHF3KbZ_FZ7q43_gbTTW6DtsP
 or4EtjpayOmm7LW06VLLTEOXvc.7jbQRjGb9CQ10MvR2HADJJ4YyXkBW3A9J7AxVTFpY.rIPeWI1
 FMMuJ0YsVuQYN9sHS3nkN_Hk3RFLRsY74EV4bCeJNhfdEEn_mBpYkCVmjHR0dnM0F_8fvs1KS9v7
 hUkE67vPI8VmmIJzpJ2o9pB5WUebdQ_n0lcfDBnAL2DqiUTqQKfbatrOp37yIUmCB5Dmq8iJ863j
 jcQEeekOTXXMnpGOLbL0RxJWHNfKqyk5umVRi_TQGSWv1lZIQfH6GdmJQ5G0nF9dN7FygEp5NsD8
 dxQMMOlQSAwvXS2agJK1uAmscLZM3YPRjkiG7NYif0lx4LDIz7N6FhfGjFaWYIROd4yYfQsxqK3w
 wQ8TBAkdfsW8fnCBUmMLRMXH9GbWtaL8pu2QPDoG2Ni.Kq8mt0H_Lc7MizGwscBxqwsK1_akpORc
 VgI1OmjblPKqBZ9ac_2nNAWCm_LD1MG1Um_pM7yUoT.ouAxaGqHZygBRpwOR0yGVjo5Cc7hTspeN
 5iSxGk1OCio6FwTr8Lny9OOAR1NFsZsPOKRoQwYXP6rrW.0eBoLvqJmYyInZV9Szv.AKwgPjt4xU
 X9qgewWlfk4AvdjkMKCkxBGYCe_nUQYjcZdzDFHxxya5pNhxzhtai7kLdOLDKQCdX02juAX0U9hX
 NNR3Rvill9Y7S3C0kYOQcaXjPxQ0rSYkcPF3QjSK0x0_06qiDecTeAneXCCim2Kf48c94EdJmCEO
 Ri8GWcud5K43rXTCoImxj5PnIJ90cHbZtK1HVYnWTuReEd_tC.8C_5XR7kTR214qAG4rVvQ2DJrz
 gLKRE8PGNDdRfvLidhv_k1yrSZVuklMK2TxoLTGqMLiYOYEhue6G32ONWsbPrbz7OfEEWHu5YN_3
 ym3FtZaWKEA0Q8hTTNEjhD5T9f_XacEZAQBsoyBuoMNXnkJQqUGXbzpiifxjLByd_gZVpK1S7RTe
 9iY.IzDsayKVbzxF5D.0dfHmn3evRv.LIrSF.AuMAIPq8hsZB_xyPETkQReMLB.o.pxz.fTBAqU4
 TmF3f7qVheYI3vigXmwrTRbQFLHMqH90DRY1XQzVkILc69gRQDMS2d4Mj57sagnmmJKkXRqSC2Tk
 PpH7CNbt_j8Y5bzpocuoAKSGUOfjlBSwSDZINrvD7EWw7bENF5B2IPIMA8HK51383MxiRBnTjwLY
 WmUZUFtZqjBmBbLMRN0BAGcjqP0wRC7kfukEgG8GXLVwOomJI4aB2HuK8c9DrhIJMM4qO9VA2ntw
 btFFN4rpG6kV9kfeibwQHzrM5.6C04EcGcMRNvvj5o.xHpVt7jtTR5lMHjv0X4ycQOH4z5lQXEIr
 yuBjqJu5me3d.lQHpuQnWXO469krROQKYgZ2k50VDjz3fc0DNOo9dhAKVviV3QpZSUYpBAyHhYZH
 mibAYdfkFY_Sgi8.rdstR.3OhIt2ZwEWK2E3jub1UrCHOGNeIIhC4iFbiXuPYvi6zrRyLDyp8mso
 9aD5.bfIYERauh19X7fcUiVq3BaM695XvIZW3E.7oNkHN3EhcEMAAw6mtYMTIaBHmMo1jQavpmCZ
 887F45bxdLhCtZ..Ao3oOymYAExgGcP6RQgdNEWeYsAWvTUgAv_XadgLWb9.D4OagGYfzWSRv1Kd
 vS1UDMN8D3aOyRrVombY4pjcuXSVB90tpAhlclvTKy2_brpx3cwSoxc1MyilGDZ2mLqplH5iwhzQ
 uL1xmXptwBCNAAnGCVLgJof5jsymIL_La4d1iKjXODtgg7WlX8_S5X5aZiJdG5umZdV2I6C5aAkj
 6EyoUIpCCg6RmrQUn6FtDvW_5VnSX9B0Xm84wEX6zm3gdQctWFSUxD1oYLxYAwmAqKhpvQyyWZ4g
 vNLwsectjuEY9nUD_krloEvCAMUwR1ZSCn_AGbbPZG8IqaCNCudKAnAKCUCSL4IVHppKOpwpFKZR
 UVaMcvJ0wJx.RobdmI6PF84wtdOfwFiRTYW75gUzPXMFOkOtUOvwe7exLvsTQ.PEUQPBqYhpzyq5
 9pvn0gY09fJZEVCcKJ6t5d04jelq0MDVR1v8G8D62mR1RlxVpC3Lck536LgygCMBt7fPCVzcn_I7
 6sUXdI4aVcPXC.j9gBZwT02MWG7sDr4PDA2Vp70_WGfhiYjyGOcYvobtbdcI-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Thu, 1 Oct 2020 11:54:11 +0000
Date:   Thu, 1 Oct 2020 11:54:09 +0000 (UTC)
From:   Kuban Manfi <nolanbraten4@gmail.com>
Reply-To: fadiansi55@gmail.com
Message-ID: <1050442865.1033248.1601553249274@mail.yahoo.com>
Subject: VERY CONFIDENTIAL.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1050442865.1033248.1601553249274.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16718 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.121 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



Compliment of the season,

My names are Mr. Kuban Manfi, i work as a department manager in one of the reputable banks here in Africa.

I have a lucrative and profitable business which i would like to introduce to you. Please this is very confidential and if you are interested kindly get back to me for more details.

Thanks
Mr.Kuban Manfi
