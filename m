Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF562355A9
	for <lists+platform-driver-x86@lfdr.de>; Sun,  2 Aug 2020 08:22:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgHBGWl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 2 Aug 2020 02:22:41 -0400
Received: from sonic305-20.consmr.mail.ne1.yahoo.com ([66.163.185.146]:35150
        "EHLO sonic305-20.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725838AbgHBGWl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 2 Aug 2020 02:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1596349360; bh=ZYZvy+Qaw/dXt8bYbJ9dbPZBZLLQyQWYsj5yGRQem/A=; h=Date:From:Reply-To:Subject:References:From:Subject; b=RL7G3HODsjgXLHjDiUUBM/bvSu7/udleod1s/ZCUVfdVO4oSdUOhMlsGzku6rjbxlZ7cIkV24yYpbEjw8ySOMpYfH163xGwVjjcS8xYNErchURfO1v9dVKDUu89e5GgPsvOWDrGQA5HEOOGVluxUfxJm7dM8+ougPYr2xRr3HPsd6ig6zEc9aE4naNuqUyJU7SzszLZw5IbMPtB7PkTgYRQyuk+n5owQIMY97/A+1NUnP9MuAcbaGagApsAlBvFgqDPP+2Sbr5iCblK31Qnzw75Bj2iVjlcAudwp0JGsiZ7+MTxTcw/8gIm/IjJcaFDiDokGMzrzcbgGQbAXiVZljg==
X-YMail-OSG: 3oZLJEUVM1l2x7lGkq4FNLIeRio26HDBb6PkTgWg.olKK42LpsfyGqCiAvE2FcX
 EnzszhZkOXMFfN6DVlgSVHNug_NHBV5djYyLw6TDhO8B1Z06FcIqVfvBaSS4AaKf3e7JjNUL.Pck
 MJcMYL35fjsDG.5CipneBgjWSBjEtCUXUnJBQH8ds6zxkhMmPkM3sf6nfX07ydZ738VA990mtKUx
 D8b8YBuKQ_tCXS9pn6NKaiDEBM_Bm_10OOVlhzFv5gMCxSEOcCG3WJQ.iGJvbTPjjyYZSjD71ROI
 A.VkTmXLF8bo123ROAIfClYVqJO3VlFJV_zgvcxt0vAe2TBXKxXOAD.DKdVcFDGu9oPoMeNJUrFQ
 uCo_gLRkcTysR1iw5PoMhj.tqrWDlIv9S_Zl0VynrAuI40.8O2njEBBKgMtm9GnyHzhrrgpP5_AH
 Un2FM0dE_XGopckJLCAV7V8JtvjhjHW15utCwCuBikG7xnXiA_im70zGw1ZVCOYFUQjDh7CK3f.u
 95YP8JYdX_KwljzGg7BaNyqUKFzDZKZd6itxak95rUfwxaxctkFcv.giENqoc.FFI6wfSuXWk_zX
 JMS8KMCNUVlzeSg54_G7erTmMugLeuL5oIQrozy3FauDUh.V05Z58byWu2ZZRGMxx0pMbo3650lc
 gFalcXE969LZH8zmLenzQ1Rn2tJ8E5H86iIMkDoBtWBmm_RUHzjYz82bGAC2h1N8Q03GgTXaYE9h
 n6MtWcdTKCeABofFuDlaDXuhSqfEI5lNTeYJQ_TaMHA8BHD_527mf3Kq79EAprwZL1g6wvvEP_YG
 Pgt4EyyE6UGSbVR1X6A8c1My0G8KHUmw6Fc8J1mc.6VsNvewCz1smy7KV2G68PWL8SKp7wR.NbrV
 tRydakAbjNOGbwwdplfEnfcew98hq7mpjtFCPp_3UE2gchToy_jrqnE8m4R5yEqrNwGnMpN__rA7
 R.Qgz5LqTqYOMVCujycYBlI9fVskaAdw3Sef6JjnEL7t6EnWF0ZpEnXSlCN7EATSkgZ3QN6qMJU0
 9DSTfZu_34GZQfG..bX4zLbyY2tnxaWwHQcGGTzpR7coCIMYyOYkNP.TD9U4iA5XOLuPy85Lnsif
 AyTY.c_iEFeQLt4I.DFhcu8arJnldWooEhH6Bi_zYQz68sbimn2Bnm35Iyo5NxqgsfwReKla3RUK
 1A3UA0r.TCUNJcjFP4sue3S9rGM8uDklZstTzE_kUMkyx2Gi3mqHo4OFI6Z0in8zZRTpCG74z1bz
 ZZKg9yXyza0nW4T3hua5xB_msWtCxh2aSKBU-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic305.consmr.mail.ne1.yahoo.com with HTTP; Sun, 2 Aug 2020 06:22:40 +0000
Date:   Sun, 2 Aug 2020 06:22:36 +0000 (UTC)
From:   "Mr. Thompson Govo" <mrthompson.govo1@gmail.com>
Reply-To: mrthompson.govo2@gmail.com
Message-ID: <705909420.10706989.1596349356932@mail.yahoo.com>
Subject: Hello Dear,
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <705909420.10706989.1596349356932.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16271 YMailNodin Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.105 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello Dear,

I am Mr. Thompson Govo. and I work with UNITED BANK OF AFRICA. Please
Can you use ATM Visa card to withdraw money at ATM cash machine in
your country? I want to transfer money to you from my country; it=E2=80=99s
part of money taken by some old politician that was forced out of
power.

I will change the account details to yours, and apply for a visa card
with your details in our bank, they will send the visa card to you and
you will be withdrawing money with it and always send my own
percentage of the money, and the money we are talking about is
$8.4Million us dollars.

Whatever amount you withdraw daily, you will send 50% to me and you
will take 50%, the visa card and the bank account will be on your
name, I will be waiting for your information as soon as possible.
Your name.......................... .................

Age........................... ......................

Sex........................... ......................

Country....................... ......................

Occupation.................... ......................

Phone number........................ ................

         contact me with this my private emails I.D (mrthompson.govo2@gmail=
.com)


Best Regards.

Mr. Thompson Govo
