Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 909D683A0A
	for <lists+platform-driver-x86@lfdr.de>; Tue,  6 Aug 2019 22:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725948AbfHFUI7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 6 Aug 2019 16:08:59 -0400
Received: from sonic306-20.consmr.mail.sg3.yahoo.com ([106.10.241.140]:38839
        "EHLO sonic306-20.consmr.mail.sg3.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725881AbfHFUI7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Aug 2019 16:08:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1565122137; bh=PK19ZBciZouvMJRe4+iw8z9JI58DHPEU7r8KStdt74c=; h=Date:From:Reply-To:Subject:From:Subject; b=j1wIubV518hOKtaG7L2z1OCZWBU5CfI6TlGqT3oBUAByqHOF/rxTxmwDlmLXkoCZl4TaKgxnKxRKmk8Wui9AUMb1zFN3jEebRw6HuMdsbt3oRbgvl9HkisCynGttcvaKUPRqhtzw8ANZKZsAfmFn8c/gKgY/W332bKcc8sOf5jFYx1//MX4Q6IPG/hq5302U24VT6GZbCN7kgHuB3O4AZcfPPHfLH1UNwxvKPBomHukSUOeG/yM9rWwNtEm0fQZwqLyWJl0X+OICiHyHLmO+koxkkOWFpbGdm7ZHpONJo/Wfsl2RksgbqfZ4JYDwplrhTCGgEl07LZ3BgBoEE/1prg==
X-YMail-OSG: 92R7UGwVM1mOnjj6nTgG8xj7ob59Lunq8LpGRGod6ELOJWan32S3vIhKBIhVhTl
 A2FdqupyWZi3MbDVat8vGiITwhxig35fcHZ9I3HesfNnm5TII_360KzDIjt_Wr6Y_f49CIMApVvR
 krbVkSgNlsFooN_rKqXy1.cJnySa7vjHz2mOiJbGUsdM7Kij8zetWKExktbj1gcWAD7zgrW97lgj
 Fdgr8300GSrmWLpA8wu3gVeHZ8MQf3gW7TpyJvTjd8VpEUSCPkuJEAtJ9YSvC9ZLaboTf2TshIst
 08fE0rCLVP1UaH9tlifso7a3s06UgmC.LRYbv8qLUVYXIHTrHg605krc6EMfvieYycQziX8k5Uk.
 7MPZZ7q.uGOkIVVtwRTGstySvCKnqRIW9YqQ8X1q7eHzJCF5_hH69WzrB9sAsckQLhu5BUK5tnun
 kWLiwIkYXumiMmOrnFH7tIG4SlM.MiItj2De.fjpc4NaDmdDAZ3uuMz14cMGOmUMYqyWsB9ZdXpq
 EuKo7K8YJvQwNT98MhBIo71vKtekXBCBwZookEVDraBISYeys6FMMlgAQp1L7QWLiijMeZ5HDZQB
 gBJ5mPpuGxEWYFCOySRBdmU84RyZW6_oUUG0ilTank.ewSqlQihLsHCRLUlFHTQkGoapcx9oVRwl
 9upG3KnOzrRBitedJdU0ZPe0QAggmWgontfqP.z7Gb98bp7zbX__.1af4wIkevF9Iq.dCWw61Zbj
 BuxHnvvSRnlzYEE_NoWYCtuS3BRlQuBalhIjHy9Af6wqOmX7LLriTq2lN5vR5MhLHZBoePfpmGDL
 Cc9h3LquQ1KGfqy5EITkOQoWp41t0h0eXZqdQLl.gqTL1Oo6AmmMIFstwG8tjxhOlYkguidbz6DH
 OvP9Uv8TuLFGcmC0.X3uSDZ5RZW2JlBkdkdov1x8PI5gexXDfLUSJ6NvTMTe70Cx2gkzAqnPhW_O
 9tIPO9bszmfpCR7V2DbzkDyvfRq9FTyfSqJ48EKqgT4xsTntD5JBOUe8xnlHQrRoSeSA5Jgt8lHo
 dWusM9lUNw5aYJZ5JEQgyIwCEEVUdI3RDrD36IbomA9F3LIfPz8xZv4LsUNKJl1c0DewAFxaOxQ5
 JSx_eeRQn6TbiD6coFwmolcUhZH2On3w6HC7VxOSp3XAltDQ1CGzNdWde3pI3AeWqj3HGBTr.YOU
 xZ2BcGn1nlmYIJahIBY9pjxFn.ZqauF2p1rl9BLBETth9MTTJTmo4ryyXLxmq9Q6eQQ--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.sg3.yahoo.com with HTTP; Tue, 6 Aug 2019 20:08:57 +0000
Date:   Tue, 6 Aug 2019 20:08:56 +0000 (UTC)
From:   "Mrs. Virginie Charlotte" <virginiecharlotte96@gmail.com>
Reply-To: virginiecharl4222@gmail.com
Message-ID: <621253732.1770777.1565122136148@mail.yahoo.com>
Subject: Dear Beloved
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To:     unlisted-recipients:; (no To-header on input)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear friend,

Sorry to invade your privacy through this media. I have bad health
condition and I'm just looking for someone I can trust to lead
a charity work for me. If you are interested, come back to me as
as soon as possible for further explanation.

Thanks for your collaboration

Mrs. Virginie Charlotte
