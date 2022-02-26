Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 619124C576F
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Feb 2022 19:27:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230237AbiBZS16 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 26 Feb 2022 13:27:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbiBZS15 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Feb 2022 13:27:57 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23A1C49FA0
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Feb 2022 10:27:22 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id s24so11771182edr.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Feb 2022 10:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=yR/t1BOxem2fkSyuhwUb37XrckuabGui8cQahMBE+OA=;
        b=RVNGRRec8Thz0ucKfS//kvN+8MCcsozMT48lQTpACbRh5CR2FehqQ5OmG/OB8gT0rC
         bgXNIoAE0OnAcvyexpey4Xl8BQ5vOO71ylhHR/Wq82PwWQO9y/PopCaw5nzwA8dA+9iy
         y1wgkhr94c4tbByDU/VLgzULL9ABMD218xG8ccZ0BNFbuxDgLdo/UtAfwg9XdG0+iQ8I
         QUyA5/GARSCQw9j3ZSjl2mKi2bE6X83eY8aS9FU+W0h1bB0V95Ynytbti2zw4oAylDr0
         t9VB9Tww3B1ztno/tr+Sqjg7eRU0Vj9H5UMrabX88SjOnOmmKBQLUo9Y2n+/RoOZj0qO
         4kjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=yR/t1BOxem2fkSyuhwUb37XrckuabGui8cQahMBE+OA=;
        b=vnV5w+Vdb/F3IiToHeb7xTXeHEncIpL1tBOAJE29cuJnLeUTJe9ue98+YHuW1NLBhJ
         qU9PkboQmNi2R0sAdmbZ3zaj6mo/WL35C3A1V6gmsI0SFkNp8eXJNrzAVDu4xOp/Cx+k
         vgpbkVr5fWY+eQxIQr1LXRtLN4zt2F6EpVgnTr2tWFeA5XeuJrO/zFOASsAmF6vecEA0
         4RAbeHe3wlphAU4WiEiN738QmUhUf4pIgK94dNtI2lHUcof/fK/u5FaGtVjpr1z8mm4z
         UH7raRfCS/bPkBhKLZ189hSuNYDdo4+t2vTTvLBhrUvW6UjmN+d7on8E0yvNzvODbA06
         2RYA==
X-Gm-Message-State: AOAM532+4v/RnR0mX/mAqzEI0actaxiyzdZwNQWNp2oD/TQBIdKHyo+S
        2Jgj9Q20ibYhhioIj0JqBxHcvBAHg/uuCTJgeqk=
X-Google-Smtp-Source: ABdhPJyib287NXWFtWp8WhDcz/s9OtJUKMXEaNWEvzkty91UvG6AxrQM43+obW7QwQdrN5z3t3945fRISCS+smMWl/I=
X-Received: by 2002:a05:6402:1d54:b0:410:f02d:4765 with SMTP id
 dz20-20020a0564021d5400b00410f02d4765mr12238388edb.28.1645900040112; Sat, 26
 Feb 2022 10:27:20 -0800 (PST)
MIME-Version: 1.0
Sender: alimahazem@gmail.com
Received: by 2002:a50:35cd:0:0:0:0:0 with HTTP; Sat, 26 Feb 2022 10:27:19
 -0800 (PST)
From:   Anderson Thereza <anderson.thereza24@gmail.com>
Date:   Sat, 26 Feb 2022 10:27:19 -0800
X-Google-Sender-Auth: Hpq1GPHla1n0a1ryX4eyu8P3W5o
Message-ID: <CAFfm26vrsX_erC=Wq0Ladf2=5q-GYe5MD96a5=10xMv3NJTWBA@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.1 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:536 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5005]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [anderson.thereza24[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  3.5 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Greetings,

I sent this mail praying it will find you in a good condition, since I
myself am in a very critical health condition in which I sleep every
night without knowing if I may be alive to see the next day. I am
Mrs.anderson theresa. a widow suffering from a long time illness. I
have some funds I inherited from my late husband, the sum of
($11,000,000.00, Eleven Million Dollars) my Doctor told me recently
that I have serious sickness which is a cancer problem. What disturbs
me most is my stroke sickness. Having known my condition, I decided to
donate this fund to a good person that will utilize it the way I am
going to instruct herein. I need a very honest God.

fearing a person who can claim this money and use it for Charity
works, for orphanages, widows and also build schools for less
privileges that will be named after my late husband if possible and to
promote the word of God and the effort that the house of God is
maintained. I do not want a situation where this money will be used in
an ungodly manner. That's why I' making this decision. I'm not afraid
of death so I know where I'm going. I accept this decision because I
do not have any child who will inherit this money after I die. Please
I want your sincere and urgent answer to know if you will be able to
execute this project, and I will give you more information on how the
fund will be?transferred to your bank account. I am waiting for your
reply.

May God Bless you,
Mrs.anderson theresa.
