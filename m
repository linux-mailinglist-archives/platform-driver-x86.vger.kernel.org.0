Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0AAA544589
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jun 2022 10:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbiFIIUB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jun 2022 04:20:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbiFIIUA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jun 2022 04:20:00 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C9B39D952
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jun 2022 01:19:58 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u12so45965398eja.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jun 2022 01:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=0XYuJwlWcPhF5wKwZj6AX0M1ehVlcZ8wjqHIDg46ZGY=;
        b=OZqT7tArqjjYmh33UeKfGD6656xSeHrjrS3Ns8G66frPG0yKm69H+O6ChkDtJqyeFz
         nUqi+6NKQloFrVOVYyVb4V6yOcoU1IGmLCojkHB2F2l0ibr8WTyR40ev5QYYnxsduJ1g
         bZbzBCoqY8KYx5bbiSOIZmB5BxzuszqPah2fFhlJNKzTDKG8rBQrW+YIB0MlrA7svDYN
         Li72leBaPL18vrS7BkFPgMKzvIscY2U6ROfRpoqk7m8DjKwHwPjvD/c5kJkzKET/A2Pf
         wIC0qXK+XXcYbOu5JYhqCllkO2VqpYNq//V4ObXOobeaTjPtPvvHIe8zA3tewuIGSAr5
         mwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=0XYuJwlWcPhF5wKwZj6AX0M1ehVlcZ8wjqHIDg46ZGY=;
        b=HPW4tJBjBzLPAmX0htDaqQtBu8+ZpzXiTkJ1Iy3cwOVt+CNGXhRuDyhr5CX+6uholn
         SREYZh8gAYNPOm7ShJzESkjNXTVXc6P3C5zFMwEODAMYrpdALmqcatvMPkWlvS6kJzYC
         3ibeNHuVIIT7moJVRpSfqg+/UgXoiUY0gF3/f+2WdUWZXwwCdMuFacO+RIIzpsyNEOYk
         PHfHXPPmpMldG6pGKi62eBEafl0G/WXRt139DarWYyAQmUs8DYjGvGNiFLsobivoeDD2
         7rlb9tasSITyTHA9Yma7GItcMqUoR7kwsk+dhYhCs1iushw+YlHe47UqykYjqg9aVt6T
         +leA==
X-Gm-Message-State: AOAM533zZ4pFcqLrMSlmuKONFsTn5kJcmLKxGOG9xNMSNcX5SNqF6/Qz
        Oe7V/oGd/VZeKNKfpyDTC9M2HLhX9w2r0abAJ5A=
X-Google-Smtp-Source: ABdhPJw6FPxIrmQNf+TDvTsxh4pp/ONo6LOnsFSOAG3fJME/aWl54EA6hb9+VAyHMNJ8NMrdVQXm50zipajC4hEWUKU=
X-Received: by 2002:a17:907:c22:b0:711:dc95:3996 with SMTP id
 ga34-20020a1709070c2200b00711dc953996mr13212688ejc.62.1654762796471; Thu, 09
 Jun 2022 01:19:56 -0700 (PDT)
MIME-Version: 1.0
Sender: jameswiliamsjw682@gmail.com
Received: by 2002:a50:719a:0:0:0:0:0 with HTTP; Thu, 9 Jun 2022 01:19:56 -0700 (PDT)
From:   Dina Mckenna <dinamckenna1894@gmail.com>
Date:   Thu, 9 Jun 2022 08:19:56 +0000
X-Google-Sender-Auth: V3YPAy6p3A2nl9CAbWY5ZEbxDDY
Message-ID: <CAJMpOneyJvvk+azKmDM3FS1E00S6pYFPAL6OLxfHjjzTMJWXQw@mail.gmail.com>
Subject: Please need your urgent assistance,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.2 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_80,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_MONEY,URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:62c listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8279]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [jameswiliamsjw682[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [dinamckenna1894[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.6 URG_BIZ Contains urgent matter
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello my dear,

 I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you.. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life. I am Mrs. Dina Howley. Mckenna, a widow. I am
suffering from a long time brain tumor, It has defiled all forms of
medical treatment, and right now I have about a few months to leave,
according to medical experts. The situation has gotten complicated
recently with my inability to hear proper, am communicating with you
with the help of the chief nurse herein the hospital, from all
indication my conditions is really deteriorating and it is quite
obvious that, according to my doctors they have advised me that I may
not live too long, Because this illness has gotten to a very bad
stage. I plead that you will not expose or betray this trust and
confidence that I am about to repose on you for the mutual benefit of
the orphans and the less privilege. I have some funds I inherited from
my late husband, the sum of ($ 11,000,000.00, Eleven Million Dollars).
Having known my condition, I decided to donate this fund to you
believing that you will utilize it the way i am going to instruct
herein. I need you to assist me and reclaim this money and use it for
Charity works therein your country  for orphanages and gives justice
and help to the poor, needy and widows says The Lord." Jeremiah
22:15-16.=E2=80=9C and also build schools for less privilege that will be
named after my late husband if possible and to promote the word of God
and the effort that the house of God is maintained. I do not want a
situation where this money will be used in an ungodly manner. That's
why I'm taking this decision. I'm not afraid of death, so I know where
I'm going. I accept this decision because I do not have any child who
will inherit this money after I die.. Please I want your sincerely and
urgent answer to know if you will be able to execute this project for
the glory of God, and I will give you more information on how the fund
will be transferred to your bank account. May the grace, peace, love
and the truth in the Word of God be with you and all those that you
love and care for.

I'm waiting for your immediate reply.

May God Bless you,
Mrs. Dina Howley. Mckenna.
