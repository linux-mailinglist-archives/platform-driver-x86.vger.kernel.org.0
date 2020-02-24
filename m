Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A7416A43F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Feb 2020 11:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727183AbgBXKrj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Feb 2020 05:47:39 -0500
Received: from sonic310-48.consmr.mail.bf2.yahoo.com ([74.6.135.222]:38585
        "EHLO sonic310-48.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726778AbgBXKrj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Feb 2020 05:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1582541258; bh=VxFSqOLnoyhxZXWK73TPGK3hr8yutZ4yWmLQa/jSY/I=; h=Date:From:Reply-To:Subject:References:From:Subject; b=qFHTSuQ/pT/J2/ZTVCYv4tAnDALX/di37LLq/URsFWSkFcET0O68vyri7qCkXr4xnstUVD98mxABi2WZ5hJSHRK/e+28ZX1D52bYfogQEMaxjDrEtcpwqby5xxKc8TgIZJouelC8LUnQdBV6u1kCvEk4aBHR79PpP/+WBX/NHUexN2hfOW4SlDnFM94R5DKBwkmleFi69F19TZEenDuJxAxZuZfzE2QEaAEyowNb9/EDNAO82qJsYZwbuX7yUy5YJNw2e6USNAnvYgAjX69yGaCklP1qi41dUKgptNpUJ4DHz9WeccE0z5zglTn2+zHiUer8+r8LRGCrRs7e9ti9wA==
X-YMail-OSG: w4jJZgsVM1k8LwAvH4_KM0NcWLMvPwofuN4Ow7ZIAlVdwd3XSuYGmjLTfF1eaza
 rJQ6gCRAwhq7Ca2aLrg0mdXKUtsCOXj4qgx2iNPwROwj2hE18nc.JX2RkWyHMmL4MZUVFPxE00P3
 i6yLRm6NLB60.bujSFKNJABhjrb6ko5FTyv.TB_rkbJZnqJzeQEHblzRM9PUMkIi1l4pz2AOH2mB
 ngfA0Vo2etqLaxHLdaylnW_YuZG.VKxFDNt80GuB0Jrd7fhDKPFa0ZyVCty0Zactz6JoxodJ985K
 jnxsKTgeEyHgwxXR6Uty3FPMrZgBT8uvbGM6e6rLYTYD7pAmQk6oXCMBooyd5e6y_2nhavERZ4LR
 7jwWIymBjfE8T4rZEXk6.wwvcLTMCeZJD3ElnuqQ9AQcY_66I_eAVUE4FKbByW0DF7.DWE_Qbiy8
 WsdPRXNG9VM__jAVt9uetcjQx80AcmBfD.ZbKHIZ_a9jFD9P5oUu.2CwAt44R73Qe.RLlSabWlaZ
 wRqPv_QGl7SgNF4nuwlDOuJ47iXB_ZUyUFfQXdBgizn3M1X7hQ_nF2LPgkx8B9dniGWyvtf3OHKd
 ls2ULYL3NaT6UTEJLPTrIii6Kaa4qJaBEF4QuaIMnzBnBMPrkA46QYnMmfAWhR1c9xEk78jBrlSw
 d3xJ1T03YPhmrPk9kWobSALqtgeQqxR6ZCJin2x1F2XLD.cNZKAE66tP5BxNAb5ja5wNeKWIF1_N
 _xmia26aTG7fs6Uq4Hz4E9_rU5xU5kISQCLTwTi2dqGIfDNKlntE8_9Pi_vvhRRdywcKX7e7v9t8
 QHvIbFMFMRPAxDt7UHYD8_cRcyv0UVpaBsuWdtqTAfQ5ry0Dkg2bp3DqOKWLt01GF8mXLI7F26ZV
 qLRmw7hmJfFOogKQxqVbNdHvjT.jBFllyG1yHhktvh7BxEanE3FnP2FCJvVDQl6yvcUjoV9WOP6D
 afNyw_4K_Oymtf3clkR1CQ0RYFAoqH6JclByP82e69aq6ki1hX8nIA_tz2UKxPlvzgWYEctQdgop
 PpJixNLjtFgmeKbywt8lN1.IEpLzxka_weXSu9VOKRFA6uNnZhsigNi38isnPeW_cXFiORUXHDUP
 V.UFmSPKgimvQ37z2fDTLMo9u_3AHKFbkGzW2izSyUgvghWq7xVqujhE6w_YUtiJlYittK7YrWnG
 2bV_v38F9tZHjHpHPwzLf4Glv_UYYBifiAE0P2T9HCfaDnEzayTLANNTz68_YxebjWPAH7TzcOWg
 RQAWczrmNBFlDH9ZRMbnpR6lJ.pFYE7S1xuDvbn8P.0LCdvPALj2NMWZYcX3FgjQH.ZzK8TvAOEx
 Hnlg3DIq8SwX0XKcOJhnTdIoTZo9qsl6O2_vYFGP3mv7SVPGH2Q4LAEjvA9mN
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Mon, 24 Feb 2020 10:47:38 +0000
Date:   Mon, 24 Feb 2020 10:45:36 +0000 (UTC)
From:   "Mrs. Maureen Hinckley" <hh40@gztmo.com>
Reply-To: maurhinck6@gmail.com
Message-ID: <245917700.1196553.1582541136875@mail.yahoo.com>
Subject: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <245917700.1196553.1582541136875.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 OPR/66.0.3515.103
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



I am Maureen Hinckley and my foundation is donating (Five hundred and fifty=
 thousand USD) to you. Contact us via my email at (maurhinck6@gmail.com) fo=
r further details.

Best Regards,
Mrs. Maureen Hinckley,
Copyright =C2=A92020 The Maureen Hinckley Foundation All Rights Reserved.
