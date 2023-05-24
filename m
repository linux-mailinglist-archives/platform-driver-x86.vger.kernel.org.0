Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB79570FEB5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 May 2023 21:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230505AbjEXTtC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 May 2023 15:49:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjEXTtC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 May 2023 15:49:02 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4627139
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 May 2023 12:49:00 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-b9e6ec482b3so1944874276.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 May 2023 12:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684957740; x=1687549740;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=egwO5+jRcHqhSVFUfUGWVJVk/4clvS0mJ+iA2ckPsK0=;
        b=iQ9QqNJqOg3DWfWpqR/JpdYDDjHQm35xXGByf4xSY/rMKxFthrv6uwj3wSOp88RMaS
         z0HE50DxzcpP+sstbHUyvh//GykqiAu+Pf/rGQDAD/dNjjtv6qU+ifs7N4GX4N77UbWx
         ixtXJvjl9PbXZtQeNjxx5nWmZxkdOLnOoCmrKS0U5WhP/87X/+tOjyBxbjt8enKCHuE7
         +oU9l4NHctIMcL6ZtzIHtILuodFXtH8zF+dpd1zl4W/f61eG6v5w0vQPbc2B1bouQecl
         aW0ldQ2eBZgPVZUabKFJDSF5AIFqjq7gY7UgQZYokfeyYyPB99MDEzHb2eIVxn/qCSd+
         IlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684957740; x=1687549740;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egwO5+jRcHqhSVFUfUGWVJVk/4clvS0mJ+iA2ckPsK0=;
        b=l71VARYyCJq5k3Gz1oTRJrf3/bQ74NlekV+cy4uA4yPW4boSd+K92QYRfqJXCKrEck
         atHliKDzR+Khopm0emkWpA7OFOPNPSrrnNszwMXJeElLpUYUGhhGjZG6NFPOT2w/0puH
         byQ2zW3PmvYABmjCugGv4vI/Kq9hZ0ixQaRvuokgWiIuC+tsnBTxOL0lqFyZFBQSWQSu
         /CzBWIbki3WXhRv/VWOGhM3IoRjeIqgpViYf0kDFWcflnhfVW5uaGd9ePwdsTFUEJDON
         BWxLK9wrzFg5yqinQGRTql40HkBBZa/SDQ6lhjspPKXBj4Lgm2bLmUlWBeJ8RWodkysm
         2DLQ==
X-Gm-Message-State: AC+VfDzevO+PD6uIFQvxJZuONOGsp1R0LnfIIh4tOkemq43TYOS+x5su
        y+VvtoaG0vOi0XWROhoIkOV/+4FWpx9vD6ucEvo=
X-Google-Smtp-Source: ACHHUZ7YGF2rh50h0nRXMqhjVcLZvwdWDku2Ot43Dg3KomDePaektvxitsF/GKhgqpd00G8uis5PorlmsSUAgAU1LZM=
X-Received: by 2002:a0d:df4c:0:b0:561:18c6:528c with SMTP id
 i73-20020a0ddf4c000000b0056118c6528cmr20480233ywe.30.1684957739605; Wed, 24
 May 2023 12:48:59 -0700 (PDT)
MIME-Version: 1.0
Reply-To: abebeaemro99@gmail.com
Sender: delcastellomsalexandra@gmail.com
Received: by 2002:a05:7000:658c:b0:4c9:1cf3:7630 with HTTP; Wed, 24 May 2023
 12:48:59 -0700 (PDT)
From:   Abebe Aemro Selassie <abebeaemro99@gmail.com>
Date:   Wed, 24 May 2023 12:48:59 -0700
X-Google-Sender-Auth: LzA_d_tL01IUHunfauKn5cTbZsg
Message-ID: <CAJVAnER1NZ9NcAt3yCLydjSQ4r2aTyP72oA5vJroO+-zQ==B4g@mail.gmail.com>
Subject: Greetings From Mr. Abebe Aemro Selassie
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FRAUD_3,
        MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_MONEY_PERCENT,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2b listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [abebeaemro99[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [abebeaemro99[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  1.8 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  0.0 T_MONEY_PERCENT X% of a lot of money for you
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 MONEY_FRAUD_3 Lots of money and several fraud phrases
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Greetings From Mr. Abebe Aemro Selassie

I have a Mutual/Beneficial Business Project that would be beneficial
to you. I only have two questions to ask of you, if you are
interested.

The reason why I contacted you is because am the account officer of
Mr.Jin Wei-Liang,here in our bank,who died in covid19 pandemic with
his family,since that time until now,no one has come for the money,the
meeting we hosted last week with the central bank president,bank
management agreed to take the money as government property,that is the
reason why I contacted you so that you can apply to our bank as a
cousin to Mr.Jin Wei-Liang,because I have all the documents concerning
the disease customer in my office,I will be here as asider and be
giving you informations,anything bank asked from you,I will give it to
you because in this life opportunity comes but once,I have been
working for this bank for good 13 years now and am based on monthly
salary and never achieved a tangible thing and if I don't do the
business with you,bank will still take the money so this is the reason
why I contacted you so that we can do the business together,the
disease money is (18.6 million dollars),50 percent for you,50 percent
for me,if you are interested respond my email but if you are not
interested do well to inform me so that I will look for another
partner and please don't expose me,delete my message because if bank
finds out,I will be in big trouble..These are the two questions I
would like you to answer:

1. Can you handle this project?
2. Can I give you this trust?

Please note that the deal requires high level of maturity, honesty and
secrecy. This will involve moving some money from my office, on trust
to your hands or bank account. Also note that i will do everything to
make sure that the money is moved as a purely legitimate fund, so you
will not be exposed to any risk.

I request for your full co-operation. I will give you details and
procedure when I receive your reply, to commence this transaction, I
require you to immediately indicate your interest by a return reply. I
will be waiting for your response in a timely manner.

Best Regard,
Mr. Abebe Aemro Selassie
