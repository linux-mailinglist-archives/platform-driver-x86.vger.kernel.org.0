Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B002C4FA571
	for <lists+platform-driver-x86@lfdr.de>; Sat,  9 Apr 2022 08:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233231AbiDIGhH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 9 Apr 2022 02:37:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229538AbiDIGhG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 9 Apr 2022 02:37:06 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0728B15F55E
        for <platform-driver-x86@vger.kernel.org>; Fri,  8 Apr 2022 23:35:01 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c23so9771751plo.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Apr 2022 23:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=DNFhsPbkfGfOWNF5M4aRb8nwKD8L5aVj2WV/H46NM8s=;
        b=BNnv4yl/74WQl+Wzby6lZq0BLal/rzE/P9lqD+bVFuYKc2jEklEfPO6sytbV7skqJY
         ftBjSodn9FzeZTQUOrhRX71dFPAoVkfARXQ8lJrVQ+MYVxQ4JS0SmK0DDZndTtRUtRob
         OyM0F5d6/rAuyZG3WlAkUFMWS3CLO9Z21hb84dD5M7if++lkwGyLq2eDxP6nHJfbBdzr
         2fDlJnWiHPs2iJqI8/wwx2N5NMibjfhAvy9RvjtwNIF/q6qArCT08AmH+ArPQScJ7bnA
         VhQcjNND8vkRaxoGDodwV27dFVr13FOnU0trXnP6UAcnyRY/M3iU2bSnHzUKN1WOoj0I
         O0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=DNFhsPbkfGfOWNF5M4aRb8nwKD8L5aVj2WV/H46NM8s=;
        b=XmZbU8BVmZPdVV0/ZE/SJMcPaL2Sm/SwClBgSakedq1bB0BR9i6bDXNFmrfxi20VFC
         NAqLRaewoKR5wdWAJy0stwEO31HD0ct+u2T/+e4lG4obPsWX6x49qMikP11XFj7JvujB
         f1I1yN9M9pHwEc21aoW1djwMkbFV4GiH7QrTFDP9+fIUEugACQO1sB5r5IAInMp5rrS7
         MtYGJ6450JUDKVeo9GTsf0PKtkpIQiXUzkLKr+nJg99aLVL2l67p31u804Z/FtNCbJ5U
         UaLY1MdYrcYRg6y0XmJtnY76zgrktxXgfcTl8KFFq0cTGZE2PleAUUU807e3dSdHUWuh
         dNHw==
X-Gm-Message-State: AOAM531SVGixX0W5iiHfuVKoMH/rjO3/eAxNw8SV26R/DHXesjnRhDGk
        WrclpGp9rWQMrh2G53PjrW45aR6Wq4jqNM+IeXY=
X-Google-Smtp-Source: ABdhPJyMiYdildsAo6gYB+i7fy1hThl6DJjTQVOT0i8l+wNHDwmp6njk80NbBAcO37bObjuVUovl/TAoQTeb8bDFJ2Q=
X-Received: by 2002:a17:902:ea52:b0:153:fd04:c158 with SMTP id
 r18-20020a170902ea5200b00153fd04c158mr22450968plg.83.1649486100441; Fri, 08
 Apr 2022 23:35:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:6486:b0:58:374b:10b4 with HTTP; Fri, 8 Apr 2022
 23:34:59 -0700 (PDT)
Reply-To: fred49508@gmail.com
From:   "Fred Martins." <lorfordlandrew02@gmail.com>
Date:   Fri, 8 Apr 2022 23:34:59 -0700
Message-ID: <CAHMCJface6+DPpA8m_OcXPfmnG_twKgLNP9q_uqbvWEiXupyiQ@mail.gmail.com>
Subject: Greetings
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:62e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4698]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [lorfordlandrew02[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [fred49508[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [lorfordlandrew02[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.8 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Greetings,

I wonder why you continue neglecting my emails. Please, acknowledge
the receipt of this message in reference to the subject above as I
intend to send to you the details of the mail. Sometimes, try to check
your spam box because most of these correspondences fall out sometimes
in SPAM folder.

Best regards,
