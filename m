Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E3722C96B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Jul 2020 17:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgGXPqe (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 Jul 2020 11:46:34 -0400
Received: from sonic304-22.consmr.mail.ir2.yahoo.com ([77.238.179.147]:38822
        "EHLO sonic304-22.consmr.mail.ir2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726381AbgGXPqe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Jul 2020 11:46:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1595605592; bh=k6qD474V9VtXKDobcCBmjOJywgarZvgPlTt0r+34qBY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=JWzM9zNJI7xZE+HHD03lWLQj5k2m8tq6qY5E2LEIqCkljYai/UsJyRPr+QUGo331A9ZR3vv53c8aWoIV+JCgdig+re6oSkV2773CGgHtgLsHeEav9YG5JirgLVv6Mw9y5xbSOoN6ALHeW5dn0HMI7d+QQwD6V4z3H+DAuw/0sMFygCbrXWNKZT0pPQcPpecvi2Hnl3VHQCOU3U2SOZulll4abBDnXZF+PhGH6CZzbGKxGHj9tjSeZlTgpBBA9TwsgDpweFPaioXsZ3nP7G9NnRST9S4UGq30XwvDlMya+/MEUC0vMYOZWdA4VKdVos3+tO4QiI+7e8NRUeOWpRqoxw==
X-YMail-OSG: 74vzlUkVM1m8ysLfDh9pPB6nWEmjYE8lwvAJ56P.7.pVX8ZTaNov3.jpG3jdH8Y
 6CRMLzWF1rkLldrTxh_IsRIEJR1v7QXUOv9MweHrusVOm2_yjr3XTcJlQqNnCHLXbtl5w9KBfdvz
 Ac2KY0ZlEVtUHGb3NADIITPhHkjzAEfJGGrKnJ58jPWggs0DbHb5RnSmuqwObvt_tGgjPN9EYhUl
 nq38P5_YNxOFp4TfijnyE.W_8NIgkgKu1vHffXYN3mNzRwyRP4Cqj72WPj6vWYTHzPoaRxHlHRaD
 zkMRzv2A57jlBhKz6LjvzN1kn_jx_cIEw1ii_a2wH3ck_zSTu8kWQVEXWe2aJ5psio2VFiJUlaJo
 cPxsBuTRcEfpOI47Bvj8JTkZp6LXpUgijfGQMZ83CJRzz_Muiukc9gmYhU2D7pBTpxpnIC_AhqI_
 0a294NxB3We9RgAgmMLvqCzjLwqY.4XbufgxRExMvRNYkum96cewh7Qx3vc962cUtiPGiUoOSSrm
 M_U83YyW2iXPU5siipLP_EGJxBUewwwI_DcBDxNpe6tqALR0cAsfBaDi8FG2M6Ashf5hh5PRFQBu
 mYp063vrXiuLRTqSBvFDqfyliB.B_ZXSVYfPCiz.PBdp1T58FF4ZphF4ExoheWlEd5PI_KJxz2BW
 fyCA.xb_AwKoJT2g30__SjLErdceyYEDScGB4eeWY9BPPZSAC3Y5o5nOZS0a7cn4DI9K1hmJbZrK
 CNLYYs1tq7_fgB5YuzbhHHX2W_HTRMU_2jfQVHzC3mZdyE7BagWq8kjVRyZurDZ50MAnnbAV6UbN
 gTCT5NP_ts_44R.rR_tlZdLk2TjsdAA1IVIDmq6OYAjRfD3rhsNACTZybRcYDRxkmd0b99wEqPOX
 cCNTn_sg3j.qmQzf7tbWoYICXo0Cwxwmy8mxntNnGzoVdSxpCNUEjIo.7Ji3nbNTPXFmRBrziwdO
 vvZPPZ_lRkleRVO7TpRaFItVJHlZ81rNwCSlmdbHHJovPXW6coyJtP6KTzM5ZOroyZNLgTJVC4vF
 zxtKsPe6i6oPSMHEA2kAIrZZOs_.jWn7GEQmoteBigHNS_kE6dEqNmmd2B8RgjR78vQIRdKNGFL7
 X1lqjU_vPUBZ8cU1NTHa.qO8F.GCoVW.38KdUMYwtgB5EDN5chOdNN8a513RrFBXNUyoYEhu8hM8
 k4oH7DSfZ1u3JiH2wWGCZSi7wVhfUDjBLpNm_AMD0.sLvDSdpIn_Oh4B5AL7LoWs2_y8X2I6Y.YA
 1xQwnlnVTWAfMgVKQf6ZTkhy.CuU7c7L58KW4.WijGacQzWaqPJe0WMl5dwr5zQsDFr0zcPuVgZ3
 c72o59dDHc4xoWueJBdEMkA--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic304.consmr.mail.ir2.yahoo.com with HTTP; Fri, 24 Jul 2020 15:46:32 +0000
Date:   Fri, 24 Jul 2020 15:46:32 +0000 (UTC)
From:   MONICA BROWN <monicabrown4098@gmail.com>
Reply-To: monicabrown4098@gmail.com
Message-ID: <404674206.10054208.1595605592044@mail.yahoo.com>
Subject: FROM SERGEANT MONICA BROWN
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <404674206.10054208.1595605592044.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 6.1; ) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.116 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am Sergeant Monica Brown, originally from Lake Jackson Texas. I have 
personally conducted a special research on the internet and came across 
your information. I am writing you this mail from US Military Base Kabul 
Afghanistan. I have a secured business proposal for you. If you are 
interested in my private email (monicabrown4098@gmail.com), please contact me 
immediately for more information.
Thank you.

