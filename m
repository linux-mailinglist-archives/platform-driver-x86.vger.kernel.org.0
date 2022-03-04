Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698F24CCF09
	for <lists+platform-driver-x86@lfdr.de>; Fri,  4 Mar 2022 08:27:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238639AbiCDH20 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 4 Mar 2022 02:28:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238568AbiCDH20 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 4 Mar 2022 02:28:26 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36DA860E6
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Mar 2022 23:27:37 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id q5so7096132oij.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Mar 2022 23:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=GD9Xd5dWI7sJ3Pbd5RkpJQIUhjnU3aaZsmwDIRNYaQQ=;
        b=P+P9a1q5xLFpB+xoxA5TQb1ryzkoGVNF2S5w0oYI0AO/mADLjYwuHnEMUHF5oE+/DZ
         qTCLLKfafY7iK/2839TGNJXHKJ42dmPcAVfMj7m9OZshPujQmvpd54C6FoTRCoPjXyag
         VjPq8qOe2ElYIMz0Xn6NECTwHojEfEUPmEmldJWVZ7Mpt//8jGNOjWS/R4qUZkSGD5vY
         wRjDM6BRzC1KaukOYOhwOVlqvVzquXG8t/ce2YTJ89vvKOTPCeCCI22zkveDlKjyOPZz
         yoIW0zJIdLx5o6uOdCCQhlVj0QwCix+MeBCEhaICGMlCRPI7yNWuQc8KO2/rf56X72+r
         s63Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=GD9Xd5dWI7sJ3Pbd5RkpJQIUhjnU3aaZsmwDIRNYaQQ=;
        b=Qddn9avTh2q878giOgB9pVTE074qCjljN5cG7T1yUZXA6gbo0AiO7CI2t5gtVmkfhE
         XLipHrCfQVNUly/rtus3okgLA+4V3Fws4NLo+7aygmosXBJ+OLQmJHtaELT6wdgbr63t
         hrisbCJgk3QI1UjZhBauEozwuejlbK5ZbjhSq7Uh2GJZks8p3FkwKhOeNqrKPIAqZi1D
         RhFwQO4XYUxPf4ATBVEZ36L7OvIhe9wt0hM34hNZqqPTEh4M6Ye/+91DQM7oQ1SihLrY
         R6ZhiV6ProC/kzu2vTHklqfTELxWVTk+IHwVmuB5D9L5QQ3HbZqRZCiB56RZd+nmuCG0
         pAiQ==
X-Gm-Message-State: AOAM532wywSni1IKo937d2siGKbfywg+hvAFKv2isXDr3Ils0GX7bHRg
        qTkMzlFUmzd08SWPcIJVPq27K5HbjCsyXSEOFQ4=
X-Google-Smtp-Source: ABdhPJwNbkP+j1sanY4XwMlS3JgMpbVFq2zxOOKOieSLDYufGDexYrg0Wltv6ogmgcQIoPWsk0H3WbLHq3r+tyIYe3g=
X-Received: by 2002:aca:d9d4:0:b0:2d4:ee05:568a with SMTP id
 q203-20020acad9d4000000b002d4ee05568amr8349548oig.176.1646378856027; Thu, 03
 Mar 2022 23:27:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4a:d0cc:0:0:0:0:0 with HTTP; Thu, 3 Mar 2022 23:27:35 -0800 (PST)
Reply-To: wijh555@gmail.com
From:   "Mr. Ali Moses" <alimoses07@gmail.com>
Date:   Thu, 3 Mar 2022 23:27:35 -0800
Message-ID: <CADWzZe57=R1=47JE=+dvFTOi_xRYAT0S3pDKQGHVSJRD5XksRw@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4021]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [wijh555[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [alimoses07[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [alimoses07[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
I'm Mr. Ali Moses, how are you doing hope you are in good health, the
Board director try to reach you on phone several times Meanwhile, your
number was not connecting. before he ask me to send you an email to
hear from you if you are fine. hoping to hear from you soonest.

Thanks
Mr. Ali Moses

Sincerely.
Dr. Irene Lam.
