Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9D6401849
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Sep 2021 10:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhIFIzN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Sep 2021 04:55:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhIFIzJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Sep 2021 04:55:09 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB7E7C061575
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Sep 2021 01:54:04 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id i6so8586245edu.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Sep 2021 01:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=pq8QdcgdNxjJmg61r8dPGvWyeowRsap/Qds2NQHbQZA=;
        b=Y6Vzn6+a8WiThKTNg4iLo56q9kMu/6HU3aPgX9+PPTvaaOx/MuaylqLAkgty9j9mYu
         J+apFU7ByeZv7U5EW9MSYSzgiilA1xH3wDWBSUgV/ZaZLnyejtquzexc0DyjFlQL1Qvx
         pfFImQnoX8U1C5qWn60vgVXh8t90/qZv/UZBocJCQq1lXoo0i1dFoxOG1GyM8TSzUJyf
         v61FIcl6a7x8PTj7nl9uX1uasCGN6gTzh/6yqUHZECekZxng0ROrn+2XOw9WE0sBgtbA
         gCxLh+aaBRdIrsjYCqTScm6FcLaUqf9/Ry2c6XNyCE/mvlGDgUaYoC+gajU0sMhYShMM
         TvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=pq8QdcgdNxjJmg61r8dPGvWyeowRsap/Qds2NQHbQZA=;
        b=T0Gn8WARElBFLZZvWDP18hthBjzGPgsyEqF9XXgvLOTkg6VdOidtX8dM1pe9zHgkTI
         uW7m6psfohUCRjyoQj8xcCA6T2CPGdXbAPSFekJwYQHXdqEmuuoYVeIQm+Zz3TRTmgCR
         7TBKt1q+L+9giFcUvE7QfDTKPaG6iLlcizuHJk7fUjeJo9DGVDrWPq5rwu+t4kt0Vg5f
         zD+DC+0z8m+EC8G9Q3Z+TEunfK8o/mr14M/PE6SsRl9BjkFZDBIcjkA6mD4OLWZpn3v3
         4dbZPLsVlVEpF1JTtBC3YBWpyG2pGEzcJAkFigC1UoRHbDG8GzFZqzT0EpNTdxMpilUl
         rIuw==
X-Gm-Message-State: AOAM531kJhqJjM8z1bSLFKol6gk1t8otLvml/qeoUXlYz1E/JRXLES9i
        83jXJhHsPJm1C7kXjeVai6wYZtkS/bZkRzB3eEo=
X-Google-Smtp-Source: ABdhPJx6JWw5RkYbfa/IRNR8THt4AjX8bzkxWq04ggqdi4mjaDD63pqGfMMOhw+hoYd4UCtvibrw/xVwoNwVg2s8ppA=
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr12564135edu.352.1630918443363;
 Mon, 06 Sep 2021 01:54:03 -0700 (PDT)
MIME-Version: 1.0
Reply-To: bouchetb@yandex.com
Sender: cc536878@gmail.com
Received: by 2002:a17:906:c04b:0:0:0:0 with HTTP; Mon, 6 Sep 2021 01:54:02
 -0700 (PDT)
From:   Bryan Bouchet <bryanbouchet0@gmail.com>
Date:   Mon, 6 Sep 2021 09:54:02 +0100
X-Google-Sender-Auth: PZYTtCj4yC7oQNugF9FbZpGde7M
Message-ID: <CAH1yJ8ToX=QsCYL35wCDHZUmdnTAHh+eimuHogU9U-Zwb9VeKg@mail.gmail.com>
Subject: PLEASE RESPOND VERY URGENTLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Friend,

With due respect, i have decided to contact you on a business
transaction that will be beneficial to both of us. At the bank last
account and auditing evaluation, my staffs came across an old account
which was being maintained by a foreign client who we learn was among
the deceased passengers of motor accident on November.2003, the
deceased was unable to run this account since his death. The account
has remained dormant without the knowledge of his family since it was
put in a safe deposit account in the bank for future investment by the clie=
nt.

Since his demise, even the members of his family haven't applied for
claims over this fund and it has been in the safe deposit account
until i discovered that it cannot be claimed since our client is a
foreign national and we are sure that he has no next of kin here to
file claims over the money. As the director of the department, this
discovery was brought to my office so as to decide what is to be done;
I decided to seek ways through which to transfer this money out of the
bank and out of the country too.

The total amount in the account is (18.6 million) with my positions as
a staff of this bank, i am handicapped because i cannot operate
foreign accounts and cannot lay benefice claim over this money. The
client was a foreign national and you will only be asked to act as his
next of kin and i will supply you with all the necessary information
and bank data to assist you in being able to transfer this money to
any bank of your choice where this money could be transferred into.

The total sum will be shared as follows: 50% for me, 50% for you, and
expenses incidental occur during the transfer will be incur by both of
us. The transfer is risk free on both sides hence you are going to
follow my instruction till the fund transfer to your account. Since I
work in this bank that is why you should be confident in the success
of this transaction because you will be updated with information=E2=80=99s =
as
at when desired.

I will wish you to keep this transaction secret and confidential as I
am hoping to retire with my share of this money at the end of
transaction which will be when this money is safety in your account. I
will then come over to your country for sharing according to the
previously agreed percentages. You might even have to advise me on
possibilities of investment in your country or elsewhere of our
choice. May god help you to help me to a restive retirement?

(1) Your full name..............
(2) Your age:................
(3) Sex:.....................
(4) Your telephone number:.................
(5) Your occupation:.....................
(6) Your country:.....................

Yours sincerely,
Dr Bryan Bouchet
