Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D83286D38
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Oct 2020 05:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727754AbgJHDi7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Oct 2020 23:38:59 -0400
Received: from sonic312-10.consmr.mail.ne1.yahoo.com ([66.163.191.241]:43835
        "EHLO sonic312-10.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726400AbgJHDi7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Oct 2020 23:38:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602128338; bh=KhejUjG+aIFEdaJtUCWO7uMjCXcLLdLXH7PJ9JLxOyc=; h=Date:From:Reply-To:Subject:References:From:Subject; b=QV0CSSzkcaiI/FjqGgUtylqrqIHvTXi7FSsw+arb0IJd2wnyCoXHHPAlAQ0O6kGB1HXG+HkChmDb6OR2ZEbtLMPTRD15i3/yl3zqoiq8YiONjS/T4ylVcMTqdETCuBhgYUB6LON3MgECayNhWYAB/i5LzIaHIG0mnDtHxpWfCZ04BBKXoo3WtU5IcglthGL0TxmME6Y/F6cn7phz/Ybi1KJ4JPl+r7UKqK6bIRtovBqhUSlD2I2AkWrYVN4RPvKsxGUhfRcNzLq35uJBmd4jGwnBYrB4AfuxJYdWvwGFUCkfDLr+BWJ7ZWlMxox7J8BOSi3sYev9DD0xPR/a91Hv5w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1602128338; bh=+0uqh3ST52OeEOns9mOaRx3aD5wX5ACjf/TaTbVSwaz=; h=Date:From:Subject; b=tA4hNywPhI9WgvQ+67m4mvE1LtOUlAiNuCxavV/pceRrdt/yul82/V1EqFP3MEjPtYgu8eEK2pc2AnzbFCJsZK1+ufuxtYscGFv6NLxDzHQrguggMxU03bzBfsfZYPyCQplmndB557+ayK/dMtE4PWUCg5GIs5I5fB/mJ1Dk1nKU20r+jtudpKMPAtq7m/wgnCeTjfwEfBbw34sbt8meBoxS2Lxg79om5GIXgKib+CIvkJLJ2D5/1yHllSYx8N017DH6dAaA/682eE1VyOylOr59Hk1tLZ2n7mwKm0Q2EHIl9P903umfmqdh2N+BkJ9WXdeogBfalGwSWqBLPR/USg==
X-YMail-OSG: Cs96VKIVM1mFs5zxpPde_o6UVvKrgzri3JiV8FPBkb1E2hqnKyOoOPJhKsQjtwr
 E7C2WwE71hIMXezZIw88L.o4hsrkirW25dduCTHqzctL0CUK_LhJeiy5kfoFebLuhcG7rEzSVUPO
 qIfDFGoxT16h7FLbXFEreqwVlme17xI2yoJd8azP8Hd4575jFkUryG8tsg4SF6F.ehLG7EzECy3n
 XaxA._H8Cn3jto_b6jrXnUApV_JKqMLCOlmAS_D.DQ6nnGKte_Ndwnmg8n6zzHjcpbPDaqHTQusj
 SfRl3Ra.alfz186bnJet3jp9tmyXMlB2yWTQ4sX5E4Tb8Xyh98TOwmglTnMCjcgvpsgHgrDLvFoI
 YdE1NmrvHbYUvH6G1VaEDBHJHa53qstygp6hhFj1NOmLD1EjPR6pBlV7ra1loxx0QUktfBu4a5b1
 KDNEgoMZC4zWjCFmhJOi65n6btRazt4qtoZ4PRA6TtI7IYBd_kdt7URumLdafJgHzb2zuhFSonkG
 9ym2XT.NpDx_Jc44POmpxbbmvzfX3taZqOxSLBIlrTMgicUo7Bzt8Ny9i5EpHkdMsDL77Y5EBot0
 AZ5U1bE1J7c8lVBMk52sKQf_kJYegv6pjq01ypLaG5Do_mglQp7x1sVMOVyGixASB59avOPOHTPn
 43znsjvvGxxjCCe1NmQTgO_OWxFH3FguDTw_B35RzFiiNjmctO_Zm8ofV98aNT.F1SYJXqKuwfH4
 wusQrIhpOnMP7cKdHSKG_Lw.lU277QLY.rQcJUqIPMsHVfUxs_LePWabeSp_sg4MwY3WOOax9MXa
 n19ePj_7ihFyjenH8FUJcOZkKM15V9UOrjz5DqHAkwkYVh_nXM81ztwa85Dx.JxIgcCKMv7S659r
 Y781ECsxX1bu6DplWiRNhY3ExwlyzhqL4LRIJaXcQMF_rXqlThZdnS7leu85QanhR53WFjkC8R36
 __IR0u510ocN0T_sIQDdZvp8XdMgFBVfNSbVpVyAG8DRbVnyx5iTJojeWJb0fhb.Oba7zyuw3ma2
 YfiPYwpGYOceWn8KcIuRwU_wsNLlMhgk1SkhEQ5XLX9ZcDJxOGpnaq6Y1zTE784f_UwQFqrxFBG2
 QzUlA6rT3p8f40OC4EJb5NyFvcGU5jsqdXXt1aUo_8t60K6n0s0SRSxd1Eps6lUy6blp5F1lbUNb
 ZOZttvdy3lQdXSVDpmKYLnNRiRdRWngm6ZQKEVPZGRw9Uv2A3GNgVueVnaE7QK.SUr0uSqF0XqDo
 SdUA1TxZ2SlLIbm8EoAB0XLeWh68uAPGm5ZXUuBXtMDydHFtV1HFh63SjX1u0zlEgvLFZzLxSFxZ
 tGpsSAxMBMKBM2XUVlSdRj.1dLvi3HtwZdDv.jaeWGlmrfhcyrGBae9XkeJm8yY1AFbCeQbw_oRk
 PlIJ27LVj47F7nQq2GTuE1v7pqxtyjsmgL2Bccf7B4iQM01Wz6jxEf68vlTvcG_VsyfkyBe.GbWX
 jOCBq
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ne1.yahoo.com with HTTP; Thu, 8 Oct 2020 03:38:58 +0000
Date:   Thu, 8 Oct 2020 03:36:57 +0000 (UTC)
From:   "Mrs. Maureen Hinckley" <mau16@fdco.in>
Reply-To: maurhinck4@gmail.com
Message-ID: <17715945.530367.1602128217774@mail.yahoo.com>
Subject: RE
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <17715945.530367.1602128217774.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16795 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.135 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



I am Maureen Hinckley and my foundation is donating (Five hundred and fifty=
 thousand USD) to you. Contact us via my email at (maurhinck4@gmail.com) fo=
r further details.

Best Regards,
Mrs. Maureen Hinckley,
Copyright =C2=A92020 The Maureen Hinckley Foundation All Rights Reserved.
