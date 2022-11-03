Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52DD861869A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Nov 2022 18:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiKCRuq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Nov 2022 13:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230294AbiKCRup (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Nov 2022 13:50:45 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F081125
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Nov 2022 10:50:40 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h12so3154079ljg.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Nov 2022 10:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KUkGZQq0r0Vv/0R7vtzCYYO/85Jx3j0nE5veD8MLYVE=;
        b=c9+9oQ9nUE49W9uQXeILzH93R4y0yOvqOEThsicBb0kHQQbG71toqpz6gC8oUo7Pr2
         jC8iSH19+FbrUucIJhqeb5N8U3fJBZ/cdux9mYixElF3h0w4bXUxvfjNhreq+PrQkwRm
         86sEAjJhITN1MR58YUnH8PJ9x9nVFJWsnKjuLAZeEsZuYl9SKknk+7n5vCubqBrMGa7L
         DfzUdIVWrV3oFWxVbA70IAffvR+DWqUtIRPbtJciSKqzbaUkUzhtTfXJEouKKswLcKrq
         RBxEzMJVOZAz7N0ajtvA8VUJE6gKQxF2BJrRsa8a2EwE93OA46mdnSKutksubStJGme6
         T37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUkGZQq0r0Vv/0R7vtzCYYO/85Jx3j0nE5veD8MLYVE=;
        b=ToYk6LnzvFsQe+AnAoQxHKg6jnDXcvNAmfvFl8XXDarWag9ev4iG8X27aKNzOrDq8+
         6Q4hRQpaR+MIZu9ZpX9bW9zxgnYN+hjeARfeHj1Ro0w3xLfA7o2tfhOePDl/FfvX0tVk
         2ppwGgr+4Jxmy/bY2Bvpnpm6pQU2Nvr4EdKZz3/KmEmNCprB4enbUwdxQ/Bo+ByyBiZJ
         88g4uG/OIaL1jtZH6fP+8Xcf93FCTi68E0/9Iqe0Q9X4KxSKbyjr2HETxCRVtHFSoDZL
         tOwpLX8u494JGuP0cyU0e4etzglv4NGKfpfpB4f904p8+1clbrbQg2xG4JkBJanWEKxI
         UwpQ==
X-Gm-Message-State: ACrzQf22D5nXkSrzTeTqRou53DkkGOnBFSUKQmXcPwaWab4IIu86tflx
        AI8Mm5uVGQ2oBC/m5ycRCcjbwuQn3egdtX0WjZI=
X-Google-Smtp-Source: AMsMyM7WRIDAkgN5WfRRJVAa0Pv5VfXb5g/r2dSv6qo/uK+oA/Mq17fPX+4acaZwCc2CnR1v7UATzT1iTkmA1uNq8Io=
X-Received: by 2002:a2e:bd0e:0:b0:261:e718:e902 with SMTP id
 n14-20020a2ebd0e000000b00261e718e902mr12825830ljq.435.1667497838761; Thu, 03
 Nov 2022 10:50:38 -0700 (PDT)
MIME-Version: 1.0
Sender: ojongonwa@gmail.com
Received: by 2002:a2e:9681:0:0:0:0:0 with HTTP; Thu, 3 Nov 2022 10:50:37 -0700 (PDT)
From:   "Doris.David" <mrs.doris.david02@gmail.com>
Date:   Thu, 3 Nov 2022 10:50:37 -0700
X-Google-Sender-Auth: su5ZWCEGDCurpVnoo8wSA-uGIPw
Message-ID: <CAA-P_sM+mpGARaeM5RAV7Z+xATYkrfYG2eE7fiMfgvwT=Xw2Vw@mail.gmail.com>
Subject: Re: Greetings My Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.8 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:22e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5019]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mrs.doris.david02[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  0.0 MONEY_FRAUD_8 Lots of money and very many fraud phrases
        *  3.0 ADVANCE_FEE_5_NEW_MONEY Advance Fee fraud and lots of money
        *  3.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Greetings,

I sent this mail praying it will find you in a good condition, since I
myself am in a very critical health condition in which I sleep every
night  without knowing if I may be alive to see the next day. I am
Mrs.david doris, a widow suffering from a long time illness. I have
some funds I  inherited from my late husband, the sum of
($11,000,000,00) my Doctor told me recently that I have serious
sickness which is a cancer problem. What disturbs me most is my stroke
sickness. Having known my condition, I decided to donate this fund to
a good person that will utilize it the way I am going to instruct
herein. I need a very Honest God.

fearing a person who can claim this money and use it for Charity
works, for orphanages, widows and also build schools for less
privileges that will be named after my late husband if possible and to
promote the word of God and the effort that the house of God is
maintained. I do not want a situation where this money will be used in
an ungodly manner. That's why I'making this decision. I'm not afraid
of death so I know where I'm going. I accept this decision because I
do not have any child who will inherit this money after I die. Please
I want your sincere and urgent answer to know if you will be able to
execute this project, and I will give you more information on how
thunder will be transferred to your bank account. I am waiting for
your reply.

May God Bless you,
Mrs.david doris,
