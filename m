Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE0B16991A
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Feb 2020 18:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727027AbgBWRhx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Feb 2020 12:37:53 -0500
Received: from sonic310-22.consmr.mail.bf2.yahoo.com ([74.6.135.196]:39684
        "EHLO sonic310-22.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727227AbgBWRhx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Feb 2020 12:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1582479471; bh=ib7BVCDDEkI0fk7aPSCq5CDc1x2gJv6BB7l4ViP18IE=; h=Date:From:Reply-To:Subject:References:From:Subject; b=TjHtZZuqf4GW0K8tmMqvc2XFUOVFbNEkAyxq9I5fOSdsv1haR6vqen180AdQu5+FRlxF2MenMKq/uKLp20uYs1IOjjjHEsSOnK+Qzh0GwQ3PEfISUnS4QL4mCB4usMb+bLU54ePYqDDjw+HVnwTW7DTjjVWPl5IxKB4cJrfkJoWocKuy8D831yklj5PuY4sDxr8dPTUK9g2wxYlFyYuNixpAkkx1dHz1suPCjb10sgTaN+clMsG+MIb+bu4Z0R7OwlftKs4cAHItdxIBmKslt7GQQGR2UQJSbJTqlLIh85DLbVo66uVxpejNdAI5MJG78qCyQGlKMWhpcxDZWZ9Qvg==
X-YMail-OSG: bXTjSzIVM1mfqVpXmh_J4qUT44.RzKhV3B.cecUHQtpDtSxZhr5KI3.N6DQRO6b
 GmXfb_5AzsyMr7etVjukzWcffn5HpZGhwX8pu5CVGrwqbEH74N0Km__1VwBZKwOeVlLU6BkoH97E
 WQMvb_6N2xtG7fJ5.D9BD8EQXA9IUvoMAfoePAvjALqiS5j4oxGyj_6rCTukY7VAw79pGNT_DEQO
 OK.rhfktCBcjxlDHt0N4cQ2rizF7bhzs4Q0IZ3kncQ4vhAL4bPv_GsXkGjXVxjk3sj49mtSU8kVX
 v37JLAyvuwAE8XnU8jDoSt4U6UXyZ3CYY36CIsC27a3chQ3ZCPXiu5_XTSkyA3NeGti_XUutR2o5
 3AnqUeLD_9sM2d1xlxhp.KHqpEnG8xYoEzSB9yXk8TZBR50AyeiVeqhWiQqQyWH0BwlJF21GAXBB
 4s1WYkePDr4SFwwSVgnFi.GP6xLg4Ox1BTry5r_Xlw1uv8fWkMRP0.i7MadUe3G5g7tvQGOUj1LC
 ShNeuLRkj7dpiwmi7PBnW4rCXio.a3UW7Gyw3urZK4jALkzGZ.oY6pk8Kt7qpQJtxMyXOOzvUPXF
 AKWJd2Tqk.edsZ4zIrWuCRzaLqtG670jhxayxWY9v9TyZvzpP8E8F0x.te6dryUyW24rlahhNZYy
 r_qtxKw_QHb3KceRgIz.woBIiewb0IsTW.V1hfubG3zYCxWmFTCS9.5ULzFJhPmyp6Mpb3ku577T
 Tkpcim_K7yg1UKhbSXkMeyHQB.5gSIipf2D0ivfIiP27VDeSXGa0GU7xsvm.psjnWDkzpE_KBhuB
 lMrJIQciDvm9.5ZSbdQtriiq83eAQ_NIkopAeG4kTHMqJoyGXjWpfFCPYALZqf8z_I2.dHDbYXYI
 gjBpO2uf44fPLDFP_vyFimO1OINnmk2ObwnCf8xCzGoNveLITUAsAheym.m4dm.9AmqV83joqQfQ
 PzhGoCWL0Q92affQhKs4hxdpFZQ6JDLvt697FThg7rsVQBuM1D30xc8hIx0B63v_Hjfsi6pznNqg
 7M2EFUAcMNEEmiFLua8rJkykKBhCfCAP8.FP0LHfgJ6meEc6E8inj.B45rQ.32cZpDH3Mow6mYRS
 BA1QK6dcSTpwSd0nDWBY8jJcUtaW2wxbzu55hQloorwVkbaaHrjzxEKcCmLYHd.BXgBnYuJC4WBE
 hi9CSXX54Yb_jWLCEWTnsRsMQDoB5s.ACAT8OXmve8LRGOScqtoF_Tu0JFdAU71AMCo31whHn1yI
 _V4Ao1I1Mki_akhQVi6TDGH7F09LZrhMLE0McRHLm2LC8pG6A98jUvHHFBBtDHL8-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Sun, 23 Feb 2020 17:37:51 +0000
Date:   Sun, 23 Feb 2020 17:37:50 +0000 (UTC)
From:   Wang Xiu Ying <fdgffggfgg@gztmo.com>
Reply-To: wying353@yahoo.com
Message-ID: <1016192139.5080966.1582479470003@mail.yahoo.com>
Subject: My proposal
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1016192139.5080966.1582479470003.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15199 YMailNodin Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



Good Day,
 I am Wang Xiu Ying, the Director for Credit & Marketing Chong Hing Bank, Hong Kong, Chong Hing Bank Center, 24 Des Voeux Road Central, Hong Kong. I have a business proposal of USD$13,991,674 All confirmable documents to back up the claims will be made availableto you prior to your acceptance and as soon as I receive your return mail.
Best Regards,
Wang Xiu Ying
