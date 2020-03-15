Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7712C185B26
	for <lists+platform-driver-x86@lfdr.de>; Sun, 15 Mar 2020 09:13:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbgCOINg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 15 Mar 2020 04:13:36 -0400
Received: from sonic306-1.consmr.mail.bf2.yahoo.com ([74.6.132.40]:36038 "EHLO
        sonic306-1.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727134AbgCOINg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Mar 2020 04:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1584260015; bh=7bAj2aTmdt2qZuhBQReQcDKGCSJd8LlC9EcZcjUJr8M=; h=Date:From:Reply-To:Subject:References:From:Subject; b=JiezpWDBqnuAAldUaJKEfZuwjpgXSW3H7u2ILkv+Uqu1PIg3nEgHqjnszZKm5EnE7JDqdJFDrbPsX+zmoA4wjhh2SCdK7i3HUMuOO3sjd6LarfVk8Smk/4h1CzkG1WjiHi5PyGgsaEpBAtSVZ/UdGZ7LEulCV6dejulC4axPKETgjmB0i2ChVsgDu8s75upyGKjk8bi9jZqn9oYvni8kWAmvSXPlFX/Jx1r4jo/0aPPMctytLbFu+DGkt9/3YXqDqNcv68YOytHpLyC5eIk3RvzcTrP9mMITBbsGMwfeqFOVmxkMjSsuNxsQ82NVdzz9Uobx9LZig+HUAGGraEagNA==
X-YMail-OSG: OVp7n6gVM1kJgz3vgK5p1cn3vlKVDPng8HbTT9DLbOg3Rfya6kYNIT5hwRKEzHN
 Tvg3QWjGqtci3IEpaHmMuB1nAMmSGGmYsVyYppotMxalipzMJwrEsn.YSRPwXKAk0v0kJEymFgfF
 HBnlijef97QCIKYW0ItMXBTfa5KQeCpkpLyH9PXGqxT4loJ5qP3_HUuhj81rNz5LEkJo8l3d5R2g
 4eh_dJs9.sKf75_BlFyQi6drdN2oLy3PPLKCDsgrLmpQOYNWmZJIvPp7ARBy5_lQrUM1W46GBygu
 JcNXY7DReEs9ciwBT7q0sYP2eGSrdSPGsBMR0sStzsyG4oitk.sRw7xtz0V88opWbu8yL7_Qk2_c
 EKLNWsoHR1Mv.Q7MY_EXO4yZc714VNl9zwU6Nq2MzBqrxyp.UImodPjYEAFlVfO02jfI4.DC75V6
 cQhDBLbd8UqwJKPTXyVAmyGprQ0JCpk4K6boPVr9abk4R1edRSoDfmQjUxfW6SGdHZRGqWJ1Bh50
 3B7G0NvRSDS07sxPPGil4Xe4ewjt9lPwJsYcTYHyiYB_H1dEPFNAqgLjlNbGQMFDivL7sE4HteEA
 UVcxmw3Pdh47v5R0IeguCvfVH58ZexrTEYJzWiZlsIa3U2tgCM2kdwqfZulVpZo0C1yjhrBjLNA4
 e0FjOunGEW8bzqip9zqZTfewFhAfpHxNb9SpNxZ1vLTwbkOtHeEm1QcGRuMXkDvlOTniXmYZgWDh
 w8cIezCk2j3ZnDrY5L_NmTR0AzGf0XrgfDeGEwQb7z2h1AcfzSNdJ9PKkwZb2b2j2SiQbNXknGCU
 c5R.y5wEKb1f6a2RksL5O2U3s5q0mPxFTLnpfmkxw9nkTXKuTpjJXccxqnmM9u9iuA.JS37ekAfG
 o.gRT8jXbforCLvOtuzrMX8u_ammOT2Fbh5J6rPuk3DrBNAS1DtMh34i54FRLUhh.8bxhRUeWUw1
 EfCxkZEWy0S8GtnpYr1UCEkvGKXIeDnCFP82_d5yMO4JXaYnP2mi.s4qM8vTe_VLjzZyb0kKQYcZ
 EmGFYtgpazOUXfKTPG0pWwDKXmAZkmcPg16Jl2ieI8HMUAjZNkDnrg6GeYAxexnyuwwAoyP3ydHv
 0qCAz5UNXbtsDjIYhVJeJYJtSnt6JMebAUf3Eb_mZxUG_krukckGSb_dbaVrye5CnF_pKgGA4H.f
 AiHfflbiTuWSvrPA0pbfEwlpT.nCsKXua8iI3vR49I0YOcpSUDgjvoZKnQ8sLh_ur1PnA_UxJ14G
 Y0iujNLIoHNWXkPUVLjQge76yQb6zBY05Zaf13kVPsAdE3ODe66qmCkDxTO4uHz2icLyqOao-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.bf2.yahoo.com with HTTP; Sun, 15 Mar 2020 08:13:35 +0000
Date:   Sun, 15 Mar 2020 08:13:33 +0000 (UTC)
From:   Suleiman Abubaker <suleimanabubaker84612@gmail.com>
Reply-To: suleimanabubaker@mail.com
Message-ID: <415601250.3380602.1584260013965@mail.yahoo.com>
Subject: Helo
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <415601250.3380602.1584260013965.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15342 YMailNodin Mozilla/5.0 (Windows NT 6.1; rv:74.0) Gecko/20100101 Firefox/74.0
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org







Dear Friend,

I am. Mr. Suleiman Abubaker, Manager Auditing and Accountancy Department,Bank of Africa in (B.O.A) Burkina Faso

i am writing to seek for your highly esteemed consent/assistance in a lasting business relationship of mutual benefit involving $18. Million Usd for investment in your country, under a joint venture partnership.

Thank you for accommodating my inquiry, as i look forward to hear from you on this business collaboration and meeting with you soon.


(1)Your Full name:..........................
(2)Your Age.................................
(3)Occupation:.................................
(4)Mobile phone number:.....................
(5)Your Country..........................

Waiting to hear from you.

Your's truly,

Mr. Suleiman Abubaker,
