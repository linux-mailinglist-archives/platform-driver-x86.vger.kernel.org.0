Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3289784F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Aug 2019 13:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfHULvk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Aug 2019 07:51:40 -0400
Received: from sonic311-23.consmr.mail.ne1.yahoo.com ([66.163.188.204]:42108
        "EHLO sonic311-23.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726351AbfHULvk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Aug 2019 07:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1566388298; bh=ZGJE2xTxqlYu1cQnOsSVwM6bwiebtPuhO/I9HmNQ2ds=; h=Date:From:Reply-To:Subject:From:Subject; b=TnC83217M3vyYoMuizNs3mOQpH6uqZTHeQhNmy0opvTx0gIKDqYGZCoi1gIKiz/2uf35O6GrSt7wCELNO5AZnohzvuOkq6jIGQSOuB4rDgjTjQOrUjgiFcnutFO7AdOJtcl51h0vH4lcxfrkJvWJslfzxeIC4IaYVduEB2WrwGt4p7cSDIGQ0eDgOZnCvBMCDs58eUpPk66ISsNiCJDKQI1tDaKLvBj1V/xfpKCuganqzpT5SyLVlRt4WG0tg7sY8UgAVSm3ZC4/iPc4yKSf8annXuInvGaCEi17HoAj47hvLOXSDdnYLnljCmNU0TDtfItHHWRT9bfsnplm0BNDGA==
X-YMail-OSG: gAYZS88VM1meKJucHT8B.ieQ5XdzkH7iRWgJgBdPOG.YsMcQS3q2j8wxYP_ufN7
 ecHa.Emq9_rQsYOQlZFyeOuHXN7RaUK93E_6ylkIYgMZtQpDjX3kDvyGl5iJfE.SJcrgUGQ2o0O1
 4Mwc7wV8sob.6SJ56ei.yRbbnicA_mNdzDJlRUYztfVr86E4d94SKErwG1TAupObRQKyZktkKXwV
 nru7VAU.Wr.o8RmiukKx0wLsfBcyJ5zjwktuvYNYIBHGG1UpH1ObKZbZYTB4XMDxZ_f13QKpwVhA
 HCsOVH_RvqV5fgYJ9niiV_E4ZTwXkaNxuBT42A0LhKht1zOc8Gzd5wkKEXZUzkg5rdNjJ6Defhkt
 pMvLd10wg0yR7dU1JI9pTY_uKtimxM9dj6dirR0EVZzegq5zOcM3nEA4TD5Xt7xcvh7QNHhG4IUV
 U7yW53U3aicHG_xBpOt_MqTH12AtXxDgm4Ui3e9wHyUHYIYj6k0zm4NDq0WJTmrRMVHKpFr7PXM3
 hdEqglYMOVOLP7aHkbLA.xpfmMmbtbGdbnBpFnXn592Iday71HAjUxPeVzi3KbrAkgDP1V7yFJO9
 C3eU7pyGvq4AMKk_SaEsiwVHZ.hcXupruiL8sZ155pDw4dQUXHrTZ8l7Xbpn2WnHiXiE1cdJAn1U
 coj5xJf4xKhRsZuLoMxar0eaVLEXcSQh3joN3mfVZLW5VQ1OLJ9SEh1UR7LsSZzhktrHnPME2kcA
 cIzxx5NZS8j8.dTyN1vHYyAHegc2EiS7HU4guE3JMvEtFuD9KlsGyUrEtXhULC09aJCYTO0pXofJ
 sEWN2g4FIIzt6iK1dwK4lSeXzaPyswuxbdWeQHQevvb78XRAr16ERaVXnlgCVEj5nizdCcwvndQz
 ptzXTvXZ3ae61lufqx5hwtv9z2mKMR4UGfU70k0Dsz_5_mLZLa7UPim0bGkCIBUNdRQ2TOI_Vn_Y
 2ge2UsBSP2Yk6eF6kHDdnSBR8Fz8dpX175Ya0qGNqymItflKSDc2FHlrQpoHZ6g2NhWoN9cUBxpb
 e3ywzVPvBn8jLReyb1cgai1M5H1EYIkQyMVwikAfqnM5mFbF_KWwjyx.CU5_tlM7V86f9tpLKB5U
 9shBOQbtxh8Uy6K0NCKna9IET_JxNrXjo.CSrbPCptu8OuBg6OTi0kWo5BD8Wy.u1RNUFQ1MXHT2
 n_50gCk13JXe3t5EmQRthffELhR4PPev6TYOVcc35l8gMJ2SlchE2Z8xBQgrwuV1caGnAJopiX3G
 RHPRcG55K1TX0wV3Msw--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 21 Aug 2019 11:51:38 +0000
Date:   Wed, 21 Aug 2019 11:51:37 +0000 (UTC)
From:   western union payment depart <lukesanfo451@gmail.com>
Reply-To: westerniunion09@gmail.com
Message-ID: <860145312.137937.1566388297363@mail.yahoo.com>
Subject: Attention: E-Mail Address Owner,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



Website: www.westernunion.com
Address: Plot 1261, Adela Hopewell Street CO / B / REP, Republic of Benin.
Email: unionwestrn768@gmail.com

Attention: E-Mail Address Owner,
Sequel to the meeting held with the Federal Bureau of Investigation, The
International Monetary Fund (IMF) is compensating all the victims and
some email users who your name and email address was found on the list.
However, we have agreed to effect your own payment through Western
Union=C2=AE Money Transfer, $ 5,000 daily until the total amount of your
compensation fund is transferred to you.

BELOW IS THE MTCN AND TRACKING WEBSITE TO ENABLE YOU TRACK YOUR FIRST PROGR=
AMMED APPROVED PAYMENT,

https://www.westernunion.com/global-service/track-transfer
This is your first payment information:

MTCN #: 6947010915

Amount Programmed: $ 5,000
Track your first online payment now Money Transfer | Global Money

You are advised to get back to the contact person through the email below
for more information on how to receive your payment.
Contact person :. . SIR. INNOCENT JOHNSON
Email address :. . ( unionwestrn768@gmail.com )
Thanks,
SIR.INNOCENT JOHNSON
Director of Western Union Money Transfer,
Head Office of Benin Republic.
